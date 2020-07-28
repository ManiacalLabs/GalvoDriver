import sys
from PIL import Image, ImageDraw

filename = sys.argv[1]
flip_x = False
flip_y = True

data = []
with open(filename, 'r') as f:
    for line in f.readlines():
        if line.startswith('0x'):
            line = line.strip().strip(',')
            val = int(line, 0)
            data.append(val)

max_x = 0
max_y = 0
points = []
for val in data:
    x = (val >> 16) & 0x7fff
    if x > max_x: max_x = x
    y = val & 0xffff
    if y > max_y: max_y = y
    on = ((val >> 16) & 0x8000) > 0
    re_val = y + (x << 16)
    if on:
        re_val = re_val + (0x8000 << 16)
    print(val, re_val, (val >> 16), x, y, on)
    points.append((x,y,on))
    

print(max_y, max_y)
img = Image.new('1', (max_x, max_y))
draw = ImageDraw.Draw(img)

cur_line = []

for x, y, on in points:
    if flip_x:
        x = max_x - x
    if flip_y:
        y = max_y - y
    if not on:
        cur_line.append((x,y))
        if len(cur_line) > 1:
            draw.line(cur_line, fill='white', width=2)
        cur_line = []
    else:
        cur_line.append((x,y))
        
if len(cur_line) > 1:
    draw.line(cur_line, fill='white', width=2)

img.save('test.png')