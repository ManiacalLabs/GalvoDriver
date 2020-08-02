from svgpathtools import svg2paths
import sys
filename = sys.argv[1]

paths, attributes = svg2paths(filename)

output = []
for k, v in enumerate(attributes):
    path = v['d']
    
    points = path[1:].split('L')
    count = len(points)
    for i in range(count):
        p = points[i]
        end = (i >= (count-1))
        x, y = p.split(',')
        x = int(float(x))
        y = int(float(y))
        
        val = y + (x << 16)
        if not end:
            val = val + (0x8000 << 16)
        output.append(val)
        
for v in output:
    print(hex(v) + ',')