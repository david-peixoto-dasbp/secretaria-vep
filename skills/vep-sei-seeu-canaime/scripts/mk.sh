#!/bin/bash
# usage: mk.sh NAME H y1 y2 ...  (uses last N pngs by mtime, then reorders by overlap: shots with the same mtime come out shuffled)
# CAPDIR = pasta onde o zoom salva as capturas (ex.: /tmp/claude-tool-results/<sessao>)
NAME=$1; H=$2; shift 2
python3 - "$NAME" "$H" "$@" <<'PY'
import sys,glob,os,json
from PIL import Image, ImageChops
name,H=sys.argv[1],int(sys.argv[2]); ys=[int(x) for x in sys.argv[3:]]
import os
D=os.environ.get('CAPDIR','.').rstrip('/')+'/'
fs=sorted(glob.glob(D+'*.png'),key=os.path.getmtime)[-len(ys):]
im={f:Image.open(f).convert('L') for f in fs}
def ov(a,b,o):
    h=ImageChops.difference(a.crop((0,551-o,716,551)),b.crop((0,0,716,o))).histogram()
    return sum(i*v for i,v in enumerate(h))/(716*o)
start=min(fs,key=lambda f:sum(im[f].crop((100,5,600,25)).histogram()[i]*i for i in range(256)))
order=[start]; rem=set(fs)-{start}; sc=[]
for i in range(len(ys)-1):
    o=ys[i]+551-ys[i+1]
    b=min(rem,key=lambda f:ov(im[order[-1]],im[f],o)); sc.append(round(ov(im[order[-1]],im[b],o),1)); order.append(b); rem.remove(b)
print('overlap diffs (want ~0):',sc)
json.dump({"h":H,"shots":[[y,os.path.basename(f)] for y,f in zip(ys,order)]},open(name+'.json','w'))
PY
python3 "$(dirname "$0")/cc.py" $NAME.json "CC $NAME.pdf"
