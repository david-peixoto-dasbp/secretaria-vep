import sys,json
from PIL import Image
import os
D=os.environ.get('CAPDIR','.').rstrip('/')+'/'
spec=json.load(open(sys.argv[1])); out=sys.argv[2]; H=spec['h']; W=716
canvas=Image.new('RGB',(W,H),'white')
for y,f in sorted(spec['shots'],key=lambda x:x[0]):
    im=Image.open(D+f).convert('RGB').crop((0,0,W,min(551,H-y)))
    canvas.paste(im,(0,y))
# pages: A4 ratio, width W -> page height ~ W*1.414
ph=int(W*1.414)-40
g=canvas.convert('L'); px=g.load()
pages=[];y=0
while y<H:
    end=min(y+ph,H)
    if end<H:
        # find white row going up
        e=end
        while e>y+ph//2:
            if all(px[x,e]>245 for x in range(0,W,2)): break
            e-=1
        end=e if e>y+ph//2 else end
    pages.append(canvas.crop((0,y,W,end))); y=end
A4=[]
for p in pages:
    pg=Image.new('RGB',(W+40,int((W+40)*1.414)),'white'); pg.paste(p,(20,20)); A4.append(pg)
A4[0].save(out,save_all=True,append_images=A4[1:],format='PDF',resolution=96,quality=88)
import os;print(len(A4),os.path.getsize(out))
