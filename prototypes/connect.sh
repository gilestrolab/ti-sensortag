
#~ sudo hciconfig hci0 up
#~ sudo hcitool lescan
ST_ADDRESS='BC:6A:29:AB:7B:0B'


gatttool -b $ST_ADDRESS --char-desc

#~ gatttool -b $ST_ADDRESS --listen 0x25
#~ gatttool -b $ST_ADDRESS  --char-write 0x29 0x01
#~ tag.char_write_cmd(0x26,0x0100)

#~ 
#~ char-write-cmd 0x29 01
#~ char-write-cmd 0x26 0100
#~ char-write-cmd 0x2C 30

#~ char-write-cmd 0x31 01
#~ char-write-cmd 0x2e 0100

#~ char-write-cmd 0x3c 01
#~ char-write-cmd 0x39 0100

#~ char-write-cmd 0x44 01
#~ char-write-cmd 0x41 0100

#~ char-write-cmd 0x5b 07
#~ char-write-cmd 0x58 0100
#~ char-write-cmd 0x4f 02
#~ char-write-cmd 0x4f 01
#~ char-write-cmd 0x4c 0100
handle = 0x0002, char properties = 0x02, char value handle = 0x0003, uuid = 00002a00-0000-1000-8000-00805f9b34fb
handle = 0x0004, char properties = 0x02, char value handle = 0x0005, uuid = 00002a01-0000-1000-8000-00805f9b34fb
handle = 0x0006, char properties = 0x0a, char value handle = 0x0007, uuid = 00002a02-0000-1000-8000-00805f9b34fb
handle = 0x0008, char properties = 0x08, char value handle = 0x0009, uuid = 00002a03-0000-1000-8000-00805f9b34fb
handle = 0x000a, char properties = 0x02, char value handle = 0x000b, uuid = 00002a04-0000-1000-8000-00805f9b34fb
handle = 0x000d, char properties = 0x20, char value handle = 0x000e, uuid = 00002a05-0000-1000-8000-00805f9b34fb
handle = 0x0011, char properties = 0x02, char value handle = 0x0012, uuid = 00002a23-0000-1000-8000-00805f9b34fb
handle = 0x0013, char properties = 0x02, char value handle = 0x0014, uuid = 00002a24-0000-1000-8000-00805f9b34fb
handle = 0x0015, char properties = 0x02, char value handle = 0x0016, uuid = 00002a25-0000-1000-8000-00805f9b34fb
handle = 0x0017, char properties = 0x02, char value handle = 0x0018, uuid = 00002a26-0000-1000-8000-00805f9b34fb
handle = 0x0019, char properties = 0x02, char value handle = 0x001a, uuid = 00002a27-0000-1000-8000-00805f9b34fb
handle = 0x001b, char properties = 0x02, char value handle = 0x001c, uuid = 00002a28-0000-1000-8000-00805f9b34fb
handle = 0x001d, char properties = 0x02, char value handle = 0x001e, uuid = 00002a29-0000-1000-8000-00805f9b34fb
handle = 0x001f, char properties = 0x02, char value handle = 0x0020, uuid = 00002a2a-0000-1000-8000-00805f9b34fb
handle = 0x0021, char properties = 0x02, char value handle = 0x0022, uuid = 00002a50-0000-1000-8000-00805f9b34fb
handle = 0x0024, char properties = 0x12, char value handle = 0x0025, uuid = f000aa01-0451-4000-b000-000000000000
handle = 0x0028, char properties = 0x0a, char value handle = 0x0029, uuid = f000aa02-0451-4000-b000-000000000000
handle = 0x002c, char properties = 0x12, char value handle = 0x002d, uuid = f000aa11-0451-4000-b000-000000000000

handle = 0x0030, char properties = 0x0a, char value handle = 0x0031, uuid = f000aa12-0451-4000-b000-000000000000
handle = 0x0033, char properties = 0x0a, char value handle = 0x0034, uuid = f000aa13-0451-4000-b000-000000000000
handle = 0x0037, char properties = 0x12, char value handle = 0x0038, uuid = f000aa21-0451-4000-b000-000000000000
handle = 0x003b, char properties = 0x0a, char value handle = 0x003c, uuid = f000aa22-0451-4000-b000-000000000000

handle = 0x003f, char properties = 0x12, char value handle = 0x0040, uuid = f000aa31-0451-4000-b000-000000000000
handle = 0x0043, char properties = 0x0a, char value handle = 0x0044, uuid = f000aa32-0451-4000-b000-000000000000
handle = 0x0046, char properties = 0x0a, char value handle = 0x0047, uuid = f000aa33-0451-4000-b000-000000000000

handle = 0x004a, char properties = 0x12, char value handle = 0x004b, uuid = f000aa41-0451-4000-b000-000000000000
handle = 0x004e, char properties = 0x0a, char value handle = 0x004f, uuid = f000aa42-0451-4000-b000-000000000000
handle = 0x0051, char properties = 0x02, char value handle = 0x0052, uuid = f000aa43-0451-4000-b000-000000000000
handle = 0x0056, char properties = 0x12, char value handle = 0x0057, uuid = f000aa51-0451-4000-b000-000000000000
handle = 0x005a, char properties = 0x0a, char value handle = 0x005b, uuid = f000aa52-0451-4000-b000-000000000000
handle = 0x005e, char properties = 0x10, char value handle = 0x005f, uuid = 0000ffe1-0000-1000-8000-00805f9b34fb
handle = 0x0063, char properties = 0x02, char value handle = 0x0064, uuid = f000aa61-0451-4000-b000-000000000000
handle = 0x0066, char properties = 0x0a, char value handle = 0x0067, uuid = f000aa62-0451-4000-b000-000000000000
handle = 0x006a, char properties = 0x12, char value handle = 0x006b, uuid = f000ccc1-0451-4000-b000-000000000000
handle = 0x006e, char properties = 0x08, char value handle = 0x006f, uuid = f000ccc2-0451-4000-b000-000000000000
handle = 0x0071, char properties = 0x08, char value handle = 0x0072, uuid = f000ccc3-0451-4000-b000-000000000000
handle = 0x0075, char properties = 0x1c, char value handle = 0x0076, uuid = f000ffc1-0451-4000-b000-000000000000
handle = 0x0079, char properties = 0x1c, char value handle = 0x007a, uuid = f000ffc2-0451-4000-b000-000000000000
