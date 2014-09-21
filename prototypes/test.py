import subprocess
import re
import sys
from threading  import Thread
from queue import Queue, Empty  # python 3.x
import datetime
import time


#

class BaseSensor(object):
    _on_off_uuid = None
    _notif_uuid = None
    _period_uuid = None
    def __init__(self, uuid_handle_map, unit="A.U.", period=None):
        if self._on_off_uuid:
            self.on_off_handle = uuid_handle_map[self._on_off_uuid]
        if self._notif_uuid:
            self.notif_handle = uuid_handle_map[self._notif_uuid]
            hack = hex(eval(uuid_handle_map[self._notif_uuid])+1)

            self.set_notif_handle = hack
        if self._period_uuid:
            self._period_uuid_handle = uuid_handle_map[self._period_uuid]
        self.period = period

    @property
    def header(self):
        raise NotImplementedError()
    def compute_values(self, string):
        raise NotImplementedError()

class IRTemperature(BaseSensor):
    _on_off_uuid = "aa02"
    _notif_uuid = "aa01"
    _period_uuid = None
    def compute_values(self, string):
        return string

class SensorTag(object):
    _notif_regex = re.compile("Notification handle = (?P<handle>0x([a-f0-9]){4}) value: (?P<value>.*)")

    def __init__(self, address):
        self.address = address
        self.uuid_handle_map = self._make_uuid_handle_map()
        self.sensors = {}
    def attach_sensors(self, sensors):
        self.sensors = {}
        for s in sensors:
            self.sensors[s.notif_handle] = s


    def _make_uuid_handle_map(self):
        proc = subprocess.Popen(['gatttool','-b', self.address, '--char-desc'],stdout=subprocess.PIPE)
        uuid_handle_map = {}
        handle_uuid_re = re.compile('handle = (?P<handle>0x([a-f0-9]){4}), uuid = f000(?P<uuid>([a-f0-9]){4})-')
        for l in proc.stdout.readlines():
            groups = handle_uuid_re.match(l.decode())
            if groups:
                groupdict = groups.groupdict()
                uuid_handle_map[groupdict["uuid"]]= groupdict["handle"]

        # todo assert correctness
        return uuid_handle_map

    def make_gatt_commands(self):
        if(len(self.sensors) < 1):
            raise Exception("No sensors. Use attach_sensors")

        commands = []
        for _,s in self.sensors.items():
            commands.append("gatttool -b %s --char-write-req -a %s -n 01"  % (self.address, s.on_off_handle))
            commands.append("gatttool -b %s --char-write-req -a %s -n 0100"  % (self.address, s.set_notif_handle))


        commands[-1] = (commands[-1] + " --listen")
        return " && ".join(commands)



    def _parse_notification(self, line):

        groups = self._notif_regex.match(line)
        if groups:
            dic = groups.groupdict()
            handle = dic["handle"]
            value = dic["value"]
            print(self.sensors[handle].compute_values(value))

    def run(self):

        ON_POSIX = 'posix' in sys.builtin_module_names

        def enqueue_output(out, queue):
            for line in iter(out.readline, b''):
                queue.put(line)
            out.close()


        commands = self.make_gatt_commands()
        proc = subprocess.Popen([commands],stdout=subprocess.PIPE, stdin=subprocess.PIPE, close_fds=ON_POSIX, shell=True)


        q = Queue()
        t = Thread(target=enqueue_output, args=(proc.stdout, q))
        t.daemon = True # thread dies with the program
        t.start()

        while True:
            try:
                line = q.get_nowait().decode()

                # print(str(datetime.datetime.now()), line.decode())

                self._parse_notification(line)

            except Empty:
                # print('no output yet')
                pass
            time.sleep(1)

st = SensorTag('BC:6A:29:AB:7B:0B')
sensors_array = [IRTemperature(st.uuid_handle_map)]
st.attach_sensors(sensors_array)
st.run()