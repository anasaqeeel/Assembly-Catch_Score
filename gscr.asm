[org 0x0100]
jmp start
a1: db 'YES ! '
a2: db 'NO !  '
AA: dw 0
s1: db 'TIME :   00 ','o'
s2: db 'SCORE : 0000 ','o'
s3: db 'TNT!','o'
s4: db ' ','o'
;s5: db 'CONTINUE ?','o'
sco: dw 0
score1: dw 0
tickcount: dw 0 
sec: dw 0 
oldisr: dd 0 
ddx: dw 3350
flag: db 0
flagg: db 0
flaggg: db 0
flagt: db 0
flagtt: db 0



delay:
mov cx,0xffff
wapis:dec cx
cmp cx,0
jne wapis
mov cx,0xffff
wapis2:dec cx
cmp cx,0
jne wapis2
mov cx,0xffff
wapis3:dec cx
cmp cx,0
jne wapis3
mov cx,0xffff
wapis4:dec cx
cmp cx,0
jne wapis4
ret

clr:
mov ax,0xb800
mov es,ax
mov ax,0x0720
mov di,0
mov cx,4000
rep stosw
ret

strlen:
push bp
mov bp,sp
mov ax,ds
mov es,ax
mov ax,'o'
mov di,[bp+4]
mov cx,0xffff
repne scasb

mov ax,0xffff
sub ax,cx
mov cx,ax
dec cx

pop bp
ret 2

back:
push ax
push es
push di
mov ax,0xb800
mov es,ax
mov ax,0xBB20
mov di,0

l1:
mov word[es:di],ax
add di,2
cmp di,4000
jne l1

pop di
pop es
pop ax
ret

bottom:
push ax
push es
push di
mov ax,0xb800
mov es,ax
mov ax,80
mov bx,2
mul bx
shl ax,1
mov di,4000
sub di,ax
mov ax,0x6E20

l2:
mov word[es:di],ax
add di,2
cmp di,4000
jne l2

pop di
pop es
pop ax

ret
textS:
push ax
push es
push di
push si
push bp
mov bp,sp
mov ax,80
mul byte[bp+14]
add ax,[bp+12]
shl ax,1
mov di,ax
push di
mov ax,0xb800
mov es,ax
mov ax,0x4020

cld
mov cx,5
rep stosw 

pop di
mov cx,0
l3:
mov word[es:di],ax
add di,160
inc cx
cmp cx,2
jne l3

mov cx,5
rep stosw

sub di,2
mov cx,0
l4:
mov word[es:di],ax
add di,160
add di,160
inc cx
cmp cx,2
jne l4

std
mov cx,5
rep stosw

pop bp
pop si
pop di
pop es
pop ax
ret 4

textT:
push ax
push es
push di
push si
push bp
mov bp,sp
mov ax,80
mul byte[bp+14]
add ax,[bp+12]
shl ax,1
mov di,ax
push di
mov ax,0xb800
mov es,ax
mov ax,0x4020

cld
mov cx,5
rep stosw

sub di,6

l5:
mov word[es:di],ax
add di,160
inc cx
cmp cx,5
jne l5

pop di
pop bp
pop si
pop di
pop es
pop ax
ret 4

textA:
push ax
push es
push di
push si
push bp
mov bp,sp
mov ax,80
mul byte[bp+14]
add ax,[bp+12]
shl ax,1
mov di,ax
push di
mov ax,0xb800
mov es,ax
mov ax,0x4020
mov cx,0

l6:
add di,160
sub di,2
inc cx
cmp cx,5
jne l6
add di,6
sub di,160
mov cx,0
l7:
mov word[es:di],ax
sub di,160
inc cx
cmp cx,5
jne l7

add di,160
mov cx,4
rep stosw

l8:
mov word[es:di],ax
add di,160
inc cx
cmp cx,5
jne l8

sub di,480
std
mov cx,4
rep stosw

pop di
pop bp
pop si
pop di
pop es
pop ax
ret 4

textR:
push ax
push es
push di
push si
push bp
mov bp,sp
mov ax,80
mul byte[bp+14]
add ax,[bp+12]
shl ax,1
mov di,ax
push di
mov ax,0xb800
mov es,ax
mov ax,0x4020
mov cx,0

l9:
add di,160
inc cx
cmp cx,5
jne l9
sub di,160

mov cx,0
l10:
mov word[es:di],ax
sub di,160
inc cx
cmp cx,5
jne l10

cld
add di,160
mov cx,4
rep stosw

mov word[es:di],ax
add di,160
mov word[es:di],ax
add di,160

std
mov cx,4
rep stosw

mov cx,0
l11:
mov word[es:di],ax
add di,2
add di,160
inc cx
cmp cx,2
jne l11
mov word[es:di],ax
add di,2
mov word[es:di],ax

pop di
pop bp
pop si
pop di
pop es
pop ax
ret 4

textG:
push ax
push es
push di
push si
push bp
mov bp,sp
mov ax,80
mul byte[bp+14]
add ax,[bp+12]
shl ax,1
mov di,ax
push di
mov ax,0xb800
mov es,ax
mov ax,0x4020
mov cx,0
add di,12
std
mov cx,6
rep stosw

l12:
mov word[es:di],ax
add di,160
inc cx
cmp cx,5
jne l12

cld
sub di,160
mov cx,7
rep stosw

mov word[es:di],ax
sub di,160
mov word[es:di],ax
sub di,160
std 
mov cx,4
rep stosw
add di,160

mov word[es:di],ax

pop di
pop bp
pop si
pop di
pop es
pop ax
ret 4

texta:
push ax
push es
push di
push si
push bp
mov bp,sp
mov ax,80
mul byte[bp+14]
add ax,[bp+12]
shl ax,1
mov di,ax
push di
mov ax,0xb800
mov es,ax
mov ax,0x4020
mov cx,0

l13:
add di,160
sub di,2
inc cx
cmp cx,5
jne l13
add di,6
sub di,160
mov cx,0
l14:
mov word[es:di],ax
sub di,160
inc cx
cmp cx,5
jne l14

add di,160
mov cx,4
rep stosw

l15:
mov word[es:di],ax
add di,160
inc cx
cmp cx,5
jne l15

sub di,480
cld
mov cx,4
rep stosw

pop di
pop bp
pop si
pop di
pop es
pop ax
ret 4

textM:
push ax
push es
push di
push si
push bp
mov bp,sp
mov ax,80
mul byte[bp+14]
add ax,[bp+12]
shl ax,1
mov di,ax
push di
mov ax,0xb800
mov es,ax
mov ax,0x4020
mov cx,0

add di,640
l16:
mov word[es:di],ax
sub di,160
inc cx
cmp cx,4
jne l16

cld
mov cx,3
rep stosw
push di
mov cx,0

l17:
mov word[es:di],ax
add di,160
inc cx
cmp cx,3
jne l17

pop di
cld
mov cx,3
rep stosw

l18:
mov word[es:di],ax
add di,160
inc cx
cmp cx,5
jne l18

pop di
pop bp
pop si
pop di
pop es
pop ax
ret 4

textE:
push ax
push es
push di
push si
push bp
mov bp,sp
mov ax,80
mul byte[bp+14]
add ax,[bp+12]
shl ax,1
mov di,ax
push di
mov ax,0xb800
mov es,ax
mov ax,0x4020
mov cx,0

add di,640
l19:
mov word[es:di],ax
sub di,160
inc cx
cmp cx,5
jne l19

add di,160
add di,8

std 
mov cx,4
rep stosw
push di

add di,320
cld
mov cx,3
rep stosw
 
pop di
add di,640
cld 
mov cx,5
rep stosw


pop di
pop bp
pop si
pop di
pop es
pop ax
ret 4

sq:
push ax
push es
push di
push si
push bp
mov bp,sp
mov ax,80
mul byte[bp+14]
add ax,[bp+12]
shl ax,1
mov di,ax
push di
mov ax,0xb800
mov es,ax
mov ax,0x0020

mov cx,6
rep stosw

l20:
mov word[es:di],ax
add di,160
inc cx
cmp cx,2
jne l20

std
mov cx,7
rep stosw


l21:
mov word[es:di],ax
sub di,160
inc cx
cmp cx,3
jne l21
add di,162
mov word[es:di],ax

pop di
pop bp
pop si
pop di
pop es
pop ax
ret 4

print:
push ax
push es
push di
push si
push bp
mov bp,sp
mov ax,80
mul byte[bp+18]
add ax,[bp+16]
shl ax,1
mov di,ax
mov si,[bp+14]
mov cx,[bp+12]
mov ax,0xb800
mov es,ax
mov ah,0x07
add di,160
cld
l22:
lodsb
stosw
loop l22

pop bp
pop si
pop di
pop es
pop ax
ret 10


time_score:
push si
push di
push cx
push bp
mov bp,sp

mov ax,s1
push ax
call strlen

mov si,[bp+12]  ; loading s1
mov di,0
mov ax,0xb800
mov es,ax
mov ah,0x0A

l113:
lodsb
stosw
loop l113


mov ax,s2
push ax
call strlen

mov di,318
shl cx,1
sub di,cx
shr cx,1
add di,2
sub di,160
mov si,[bp+10]  ; loading s2
mov ax,0xb800
mov es,ax
mov ah,0x0A

l114:
lodsb
stosw
loop l114


pop bp
pop cx
pop di
pop si
ret 6


key: 
push ax 
 push es 
 mov ax, 0xb800 
 mov es, ax 

 in al, 0x60 
 cmp al, 0x20 

 jne nextcmp 


mov dx, [ddx]
push dx
call bucket_with_space
add word[ddx],4
mov dx,[ddx]
push dx
call bucket

 jmp nomatch  
nextcmp: cmp al, 0x1e  
 jne nomatch 

 mov dx,[ddx]
 push dx
call bucket_with_space

sub word[ddx],4
mov dx,[ddx]
push dx
call bucket

nomatch: 
mov al, 0x20 
out 0x20,al
pop es 
pop ax 
;jmp far[cs:oldisr]

iret

printnum: 
push bp 
 mov bp, sp 
 push es 
 push ax 
 push bx 
 push cx 
 push dx 
 push di 
 mov ax, 0xb800 
 mov es, ax 
 mov ax, [bp+4] 
 mov bx, 10 
 mov cx, 0 
nextdigit: 
mov dx, 0 
 div bx 
 add dl, 0x30 
 push dx 
 inc cx 
 cmp ax,0  
 jnz nextdigit  
 mov di, 16
nextpos: pop dx  
 mov dh, 0x0A
 mov [es:di], dx  
 add di, 2  
 loop nextpos 
 pop di 
 pop dx 
 pop cx 
 pop bx 
 pop ax 

pop es 
 pop bp 
 ret 2

 timer:
 

 inc word [cs:tickcount]
 cmp word[cs:tickcount],20

 jne endh
 cmp word[cs:sec],60
 jne not_ok
 mov word[cs:sec],0
 not_ok:
 inc word[cs:sec]
 push word [cs:sec] 
 mov word[cs:tickcount],0
 call printnum 


endh:
mov al, 0x20 
out 0x20, al 

;jmp far[cs:oldisr]

iret 


bucket:
push ax
push cx
push si 
push di
push bp
mov bp,sp
mov ax,0xb800
mov es,ax
mov di,[bp+12]
;cmp di,3410
;jna koi
;mov word[sco],1
;koi:
sub di,240
mov ax,0x4FCD

mov cx,0
l115:
stosw
add di,160
sub di,2
inc cx
cmp cx,3
jne l115
mov cx,10
cld 
mov ax,0x4FCD
rep stosw
sub di,160
sub di,2
mov cx,0
l116:
stosw
sub di,160
sub di,2
inc cx
cmp cx,3
jne l116

;call scoreprint

pop bp
pop di 
pop si 
pop cx
pop ax
ret 2

scoreprint:
push bp 
 mov bp, sp 
 push es 
 push ax 
 push bx 
 push cx 
 push dx 
 push di 
 mov ax, 0xb800 
 mov es, ax 
 mov ax, [bp+4] 
 mov bx, 10 
 mov cx, 0 
nextdigit1 
mov dx, 0 
 div bx 
 add dl, 0x30 
 push dx 
 inc cx 
 cmp ax,0  
 jnz nextdigit1  
 mov di, 150
nextpos1: pop dx  
 mov dh, 0x0A
 mov [es:di], dx  
 add di, 2  
 loop nextpos1
 pop di 
 pop dx 
 pop cx 
 pop bx 
 pop ax 

pop es 
 pop bp 

ret 2


gem1_space:
push ax
push es
push di
push cx
push bp
mov bp,sp
mov ax,0xb800
mov es,ax
mov ax,0xbb20
mov di,[bp+12]
add di,396

mov cx,3
rep stosw

sub di,2
add di,160
mov cx,3

ct:
add di,160
stosw
loop ct
sub di,160

std
mov cx,3
rep stosw
cld


add di,2
add di,160
mov cx,3

ct1:
stosw
loop ct1

pop bp
pop cx
pop di
pop es
pop ax
ret 4

gem1:
push ax
push es
push di
push cx
push bp
mov bp,sp
mov ax,0xb800
mov es,ax
mov ax,0x4fb0
mov di,[bp+12]
add di,396
cmp di,2700
jna m0
mov byte[cs:flagg],1
m0:
mov cx,3
rep stosw
add di,160
sub di,2
std
mov cx,3
rep stosw

pop bp
pop cx
pop di
pop es
pop ax
ret 4


tnt_space:
push ax
push cx
push es
push di
push si
push bp
mov bp,sp
mov di,[bp+16]
mov cx,4
mov ax,0xb800
mov es,ax
;mov si,[bp+14]
mov ax,0xBB20

tt:
;lodsb
stosw
loop tt

pop bp
pop si
pop di
pop es
pop cx
pop ax
ret 4


tnt:
push ax
push cx
push es
push di
push si
push bp
mov bp,sp
mov di,[bp+16]
cmp di,3000
jna aba
mov byte[cs:flagt],1
mov byte[cs:flagtt],1
aba:
mov cx,4
mov ax,0xb800
mov es,ax
mov si,[bp+14]
mov ah,0x07

t2t:
lodsb
stosw
loop t2t

pop bp
pop si
pop di
pop es
pop cx
pop ax
ret 6






dim_space:
push bp
mov bp,sp
mov ax,0xb800
mov es,ax
mov di,[bp+4]
add di,518
mov ax,0xBB20
mov cx,1
cld
stosw
add di,160
sub di,4
mov cx,3
rep stosw
add di,160
sub di,4
stosw
pop bp
ret

dim:
push bp
mov bp,sp
mov ax,0xb800
mov es,ax
mov di,[bp+4]
add di,518
cmp di,2900
jna lol
mov byte[cs:flaggg],1
lol:
mov ax,0x4f2e
mov cx,1
cld
stosw
add di,160
sub di,4
mov cx,3
rep stosw
add di,160
sub di,4
stosw
pop bp
ret

textf:
push si
push di
push cx
push bp
mov bp,sp

mov ax,s3
push ax
call strlen

mov si,[bp+10]  ; loading s3
mov di,400
add di,1600
add di,240
add di,70
mov ax,0xb800
mov es,ax
mov ah,0x0A

l33:
lodsb
stosw
loop l33
mov ax,0x0720
stosw

add di,160
sub di,2
std
mov cx,12
rep stosw

mov cx,2
t:sub di,160
add di,2
stosw
loop t
cld 
add di,2
mov cx,12
rep stosw

pop bp
pop cx
pop di
pop si
ret 2 

texto:
push ax
push es
push di
push si

mov ax,0xb800
mov es,ax
mov di,0
add di, 566
mov ax,0x4020
mov cx,6
cld 
rep stosw
mov cx,3
g1:
add di,160
stosw
sub di,2
loop g1
add di,160
sub di,2
mov cx,6
std
rep stosw
mov cx,3
g2:
sub di,160
stosw
add di,2
loop g2



pop si
pop di
pop es
pop ax
ret 4

bucket_with_space:
push ax
push cx
push si 
push di
push bp
mov bp,sp
mov ax,0xb800
mov es,ax
mov di,[bp+12]
sub di,240
mov ax,0xBB20

mov cx,0
l55:
stosw
add di,160
sub di,2
inc cx
cmp cx,3
jne l55
mov cx,10
cld 
mov ax,0xBB20
rep stosw
sub di,160
sub di,2
mov cx,0
l66:
stosw
sub di,160
sub di,2
inc cx
cmp cx,3
jne l66

pop bp
pop di 
pop si 
pop cx
pop ax
ret 2

textv:
push ax
push es
push di
push si
mov ax,0xb800
mov es,ax
mov ax,0x4020
mov di,582
mov cx,5
cld

g3:
stosw
add di,160
loop g3
sub di,160
mov cx,4

g4:
sub di,160
stosw 
loop g4

pop si
pop di
pop es
pop ax
ret



cir:
push bp
mov bp,sp
mov ax,0xb800
mov es,ax
mov di,[bp+4]
add di,788
cmp di,2700
jna carry
mov byte[cs:flag],1
carry:
mov ax,0x4f7f
cld 
mov dx,4
mov cx,4

k1:
stosw
add di,160 
sub di,cx  
sub cx,2
dec dx
jnz k1



mov cx,2
sub di,320
sub di,2
stosw
sub di,160
sub di,2
stosw

mov ax,0x4fc9
sub di,160
sub di,8
add di,160
stosw
mov ax,0x4fc8
add di,160
sub di,2
stosw
add di,6
mov ax,0x4fbc
stosw
sub di,160
sub di,2
mov ax,0x4fbb
stosw
mov ax,0x4f00

sub di,6
stosw

add di,160
sub di,2

mov ax,0x4f00
stosw

pop bp
ret

end:

push ax

mov ax,s1
push ax
mov ax,s2
push ax

call time_score

push word [cs:score1] 
call scoreprint 


mov ax,3
push ax
mov ax,12
push ax

call textG

mov ax,3
push ax
mov ax,27
push ax


call texta

mov ax,3
push ax
mov ax,27
push ax

call textM

mov ax,3
push ax
mov ax,35
push ax

call textE

mov ax,12
push ax
mov ax,25
push ax

call texto
call textv
mov ax,3
push ax
mov ax,61
push ax

call textE

mov ax,3
push ax
mov ax,68
push ax

call textR
pop ax
ret 


cir_space:
push bp
mov bp,sp
mov ax,0xb800
mov es,ax
mov di,[bp+4]
add di,788
mov ax,0xBB20
cld 
mov dx,4
mov cx,4

kk1:
stosw
add di,160 
sub di,cx  
sub cx,2
dec dx
jnz kk1



mov cx,2
sub di,320
sub di,2
stosw
sub di,160
sub di,2
stosw

mov ax,0xBB20
sub di,160
sub di,8
add di,160
stosw
mov ax,0xBB20
add di,160
sub di,2
stosw
add di,6
mov ax,0xBB20
stosw
sub di,160
sub di,2
mov ax,0xBB20
stosw
mov ax,0xBB20

sub di,6
stosw

add di,160
sub di,2

mov ax,0xBB20
stosw

pop bp
ret


start:

call clr
call back
call bottom


mov ax,3
push ax
mov ax,6
push ax

call textS

mov ax,3
push ax
mov ax,12
push ax

call textT

mov ax,3
push ax
mov ax,20
push ax

call textA

mov ax,3
push ax
mov ax,24
push ax

call textR

mov ax,3
push ax
mov ax,30
push ax

call textT

mov ax,3
push ax
mov ax,42
push ax

call textG

mov ax,3
push ax
mov ax,57
push ax


call texta

mov ax,3
push ax
mov ax,57
push ax

call textM

mov ax,3
push ax
mov ax,65
push ax

call textE

mov ax,12
push ax
mov ax,25
push ax

call sq

mov ax,12
push ax
mov ax,45
push ax

cld
call sq

mov ax,12
push ax
mov ax,25
push ax
mov ax,a1
push ax
mov ax,6
push ax

call print

mov ax,12
push ax
mov ax,45
push ax
mov ax,a2
push ax
mov ax,6
push ax

call print
mov ah,0
int 0x16

call clr
call back
call bottom


mov ax,s1
push ax
mov ax,s2
push ax

call time_score


cld
mov ax,0
push ax
call gem1
mov ax,2200
cld

cld

mov ax,926
add ax,320
push ax
mov ax,s3
push ax
call tnt

cld
mov ax,972
push ax
mov ax,s3
push ax
call tnt

mov ax,0
push ax
call dim


mov ax,0
push ax
call cir

;xor ax, ax 
 ;mov es, ax
 ;mov ax, [es:8*4] 
 ;mov [oldisr], ax ; save offset of old routine 
 ;mov ax, [es:8*4+2] 
 ;mov [oldisr+2], ax 

 xor ax, ax 
 mov es, ax  

 cli 
 mov word [es:8*4], timer; 
 mov [es:8*4+2], cs  
 sti  

 xor ax, ax 
 mov es, ax 
 mov ax, [es:9*4] 
 mov [oldisr], ax 
 mov ax, [es:9*4+2] 
 mov [oldisr+2], ax 
 cli 
 xor ax, ax 
 mov es, ax 
 mov ax, [es:9*4]
 mov word [es:9*4], key 
 mov [es:9*4+2], cs 
 sti 


mov dx,3350
sti

push dx
call bucket



dobara:
mov byte[cs:flag],0
mov byte[cs:flagg],0
mov byte[cs:flagt],0
mov byte[cs:flagtt],0

push word [cs:score1] 
call scoreprint 


push word[AA]
call dim_space

cld

push word[AA]
call gem1_space

cld

mov ax,[AA]
add ax,972
push ax
mov ax,s4
push s4
call tnt_space

cld

mov ax,[AA]
add ax,926
add ax,320
push ax
mov ax,s4
push s4

call tnt_space

push word[AA]
call cir_space

add word[AA],160
cmp word[AA],2400
jna m1
mov word ax, word [AA]
push ax
mov word[AA],0

m1:
push word[AA]
call dim

pop ax
mov word[AA],ax

cld

push word[AA]
call gem1

cld


mov ax,[AA]
add ax,926
add ax,320
push ax
mov ax,s3
push ax
call tnt

cld

mov ax,[AA]
add ax,972
push ax
mov ax,s3
push ax
call tnt

push word[AA]
call cir

call delay
call delay


push word[AA]
call dim_space

cld

push word[AA]
call gem1_space



cld


mov ax,[AA]
add ax,926
add ax,320
push ax
mov ax,s4
push s4

call tnt_space

cld

mov ax,[AA]
add ax,972
push ax
mov ax,s4
push s4

call tnt_space

push word[AA]
call cir_space

;cmp word[ddx],3398
;jne pp
;cmp word[ddx],3398
;jnb pp
;cmp byte[cs:flagt],1
;jne pp
;call terminate

pp:
cmp word[ddx],3410
jna koi
cmp byte[cs:flag],1
jne koi
add word[cs:score1],5
mov byte[cs:flag],0
jmp koi1

koi:
cmp word[ddx],3346
jna koi1
cmp word[ddx],3358
jnb koi1
cmp byte[cs:flagg],1
jne koi1

add word[cs:score1],2
mov byte[cs:flagg],0


koi1:
cmp word[ddx],3320
jnb koi2
cmp word[ddx],3306
jna koi2
cmp byte[cs:flaggg],1
jne koi2
add word[cs:score1],3
mov byte[cs:flaggg],0

koi2:

cmp byte[cs:flagt],1
jne ptc
cmp word[ddx],3394
jnae ptc
cmp word[ddx],3398
jnb ptc

jmp terminate

ptc:
cmp byte[cs:flagtt],1
jne tc
cmp word[ddx],3290
jnae tc
cmp word[ddx],3294
jnb tc
jmp terminate

tc:
cmp word[cs:sec],59
jna dobara

terminate:
mov byte[cs:flagt],0
mov byte[cs:flagtt],0


call clr
call back
call bottom
call end


mov ax,0x4c00
int 21h

