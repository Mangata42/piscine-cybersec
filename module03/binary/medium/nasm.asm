
binary:	file format elf32-i386

Disassembly of section .init:

00001000 <_init>:
    1000: f3 0f 1e fb                  	endbr32
    1004: 53                           	push	ebx
    1005: 83 ec 08                     	sub	esp, 8
    1008: e8 13 01 00 00               	call	0x1120 <__x86.get_pc_thunk.bx>
    100d: 81 c3 f3 5f 00 00            	add	ebx, 24563
    1013: 8b 83 f0 ff ff ff            	mov	eax, dword ptr [ebx - 16]
    1019: 85 c0                        	test	eax, eax
    101b: 74 02                        	je	0x101f <_init+0x1f>
    101d: ff d0                        	call	eax
    101f: 83 c4 08                     	add	esp, 8
    1022: 5b                           	pop	ebx
    1023: c3                           	ret

Disassembly of section .plt:

00001030 <.plt>:
    1030: ff b3 04 00 00 00            	push	dword ptr [ebx + 4]
    1036: ff a3 08 00 00 00            	jmp	dword ptr [ebx + 8]
    103c: 00 00                        	add	byte ptr [eax], al
    103e: 00 00                        	add	byte ptr [eax], al

00001040 <strcmp@plt>:
    1040: ff a3 0c 00 00 00            	jmp	dword ptr [ebx + 12]
    1046: 68 00 00 00 00               	push	0
    104b: e9 e0 ff ff ff               	jmp	0x1030 <.plt>

00001050 <__libc_start_main@plt>:
    1050: ff a3 10 00 00 00            	jmp	dword ptr [ebx + 16]
    1056: 68 08 00 00 00               	push	8
    105b: e9 d0 ff ff ff               	jmp	0x1030 <.plt>

00001060 <printf@plt>:
    1060: ff a3 14 00 00 00            	jmp	dword ptr [ebx + 20]
    1066: 68 10 00 00 00               	push	16
    106b: e9 c0 ff ff ff               	jmp	0x1030 <.plt>

00001070 <fflush@plt>:
    1070: ff a3 18 00 00 00            	jmp	dword ptr [ebx + 24]
    1076: 68 18 00 00 00               	push	24
    107b: e9 b0 ff ff ff               	jmp	0x1030 <.plt>

00001080 <puts@plt>:
    1080: ff a3 1c 00 00 00            	jmp	dword ptr [ebx + 28]
    1086: 68 20 00 00 00               	push	32
    108b: e9 a0 ff ff ff               	jmp	0x1030 <.plt>

00001090 <exit@plt>:
    1090: ff a3 20 00 00 00            	jmp	dword ptr [ebx + 32]
    1096: 68 28 00 00 00               	push	40
    109b: e9 90 ff ff ff               	jmp	0x1030 <.plt>

000010a0 <strlen@plt>:
    10a0: ff a3 24 00 00 00            	jmp	dword ptr [ebx + 36]
    10a6: 68 30 00 00 00               	push	48
    10ab: e9 80 ff ff ff               	jmp	0x1030 <.plt>

000010b0 <memset@plt>:
    10b0: ff a3 28 00 00 00            	jmp	dword ptr [ebx + 40]
    10b6: 68 38 00 00 00               	push	56
    10bb: e9 70 ff ff ff               	jmp	0x1030 <.plt>

000010c0 <__isoc99_scanf@plt>:
    10c0: ff a3 2c 00 00 00            	jmp	dword ptr [ebx + 44]
    10c6: 68 40 00 00 00               	push	64
    10cb: e9 60 ff ff ff               	jmp	0x1030 <.plt>

000010d0 <atoi@plt>:
    10d0: ff a3 30 00 00 00            	jmp	dword ptr [ebx + 48]
    10d6: 68 48 00 00 00               	push	72
    10db: e9 50 ff ff ff               	jmp	0x1030 <.plt>

Disassembly of section .plt.got:

000010e0 <.plt.got>:
    10e0: ff a3 ec ff ff ff            	jmp	dword ptr [ebx - 20]
    10e6: 66 90                        	nop

Disassembly of section .text:

000010f0 <_start>:
    10f0: f3 0f 1e fb                  	endbr32
    10f4: 31 ed                        	xor	ebp, ebp
    10f6: 5e                           	pop	esi
    10f7: 89 e1                        	mov	ecx, esp
    10f9: 83 e4 f0                     	and	esp, -16
    10fc: 50                           	push	eax
    10fd: 54                           	push	esp
    10fe: 52                           	push	edx
    10ff: e8 18 00 00 00               	call	0x111c <_start+0x2c>
    1104: 81 c3 fc 5e 00 00            	add	ebx, 24316
    110a: 6a 00                        	push	0
    110c: 6a 00                        	push	0
    110e: 51                           	push	ecx
    110f: 56                           	push	esi
    1110: ff b3 f8 ff ff ff            	push	dword ptr [ebx - 8]
    1116: e8 35 ff ff ff               	call	0x1050 <__libc_start_main@plt>
    111b: f4                           	hlt
    111c: 8b 1c 24                     	mov	ebx, dword ptr [esp]
    111f: c3                           	ret

00001120 <__x86.get_pc_thunk.bx>:
    1120: 8b 1c 24                     	mov	ebx, dword ptr [esp]
    1123: c3                           	ret
    1124: 66 90                        	nop
    1126: 66 90                        	nop
    1128: 66 90                        	nop
    112a: 66 90                        	nop
    112c: 66 90                        	nop
    112e: 66 90                        	nop

00001130 <deregister_tm_clones>:
    1130: e8 e4 00 00 00               	call	0x1219 <__x86.get_pc_thunk.dx>
    1135: 81 c2 cb 5e 00 00            	add	edx, 24267
    113b: 8d 8a 3c 00 00 00            	lea	ecx, [edx + 60]
    1141: 8d 82 3c 00 00 00            	lea	eax, [edx + 60]
    1147: 39 c8                        	cmp	eax, ecx
    1149: 74 1d                        	je	0x1168 <deregister_tm_clones+0x38>
    114b: 8b 82 e8 ff ff ff            	mov	eax, dword ptr [edx - 24]
    1151: 85 c0                        	test	eax, eax
    1153: 74 13                        	je	0x1168 <deregister_tm_clones+0x38>
    1155: 55                           	push	ebp
    1156: 89 e5                        	mov	ebp, esp
    1158: 83 ec 14                     	sub	esp, 20
    115b: 51                           	push	ecx
    115c: ff d0                        	call	eax
    115e: 83 c4 10                     	add	esp, 16
    1161: c9                           	leave
    1162: c3                           	ret
    1163: 8d 74 26 00                  	lea	esi, [esi + eiz]
    1167: 90                           	nop
    1168: c3                           	ret
    1169: 8d b4 26 00 00 00 00         	lea	esi, [esi + eiz]

00001170 <register_tm_clones>:
    1170: e8 a4 00 00 00               	call	0x1219 <__x86.get_pc_thunk.dx>
    1175: 81 c2 8b 5e 00 00            	add	edx, 24203
    117b: 55                           	push	ebp
    117c: 89 e5                        	mov	ebp, esp
    117e: 53                           	push	ebx
    117f: 8d 8a 3c 00 00 00            	lea	ecx, [edx + 60]
    1185: 8d 82 3c 00 00 00            	lea	eax, [edx + 60]
    118b: 83 ec 04                     	sub	esp, 4
    118e: 29 c8                        	sub	eax, ecx
    1190: 89 c3                        	mov	ebx, eax
    1192: c1 e8 1f                     	shr	eax, 31
    1195: c1 fb 02                     	sar	ebx, 2
    1198: 01 d8                        	add	eax, ebx
    119a: d1 f8                        	sar	eax
    119c: 74 14                        	je	0x11b2 <register_tm_clones+0x42>
    119e: 8b 92 fc ff ff ff            	mov	edx, dword ptr [edx - 4]
    11a4: 85 d2                        	test	edx, edx
    11a6: 74 0a                        	je	0x11b2 <register_tm_clones+0x42>
    11a8: 83 ec 08                     	sub	esp, 8
    11ab: 50                           	push	eax
    11ac: 51                           	push	ecx
    11ad: ff d2                        	call	edx
    11af: 83 c4 10                     	add	esp, 16
    11b2: 8b 5d fc                     	mov	ebx, dword ptr [ebp - 4]
    11b5: c9                           	leave
    11b6: c3                           	ret
    11b7: 8d b4 26 00 00 00 00         	lea	esi, [esi + eiz]
    11be: 66 90                        	nop

000011c0 <__do_global_dtors_aux>:
    11c0: f3 0f 1e fb                  	endbr32
    11c4: 55                           	push	ebp
    11c5: 89 e5                        	mov	ebp, esp
    11c7: 53                           	push	ebx
    11c8: e8 53 ff ff ff               	call	0x1120 <__x86.get_pc_thunk.bx>
    11cd: 81 c3 33 5e 00 00            	add	ebx, 24115
    11d3: 83 ec 04                     	sub	esp, 4
    11d6: 80 bb 3c 00 00 00 00         	cmp	byte ptr [ebx + 60], 0
    11dd: 75 27                        	jne	0x1206 <__do_global_dtors_aux+0x46>
    11df: 8b 83 ec ff ff ff            	mov	eax, dword ptr [ebx - 20]
    11e5: 85 c0                        	test	eax, eax
    11e7: 74 11                        	je	0x11fa <__do_global_dtors_aux+0x3a>
    11e9: 83 ec 0c                     	sub	esp, 12
    11ec: ff b3 38 00 00 00            	push	dword ptr [ebx + 56]
    11f2: e8 e9 fe ff ff               	call	0x10e0 <.plt.got>
    11f7: 83 c4 10                     	add	esp, 16
    11fa: e8 31 ff ff ff               	call	0x1130 <deregister_tm_clones>
    11ff: c6 83 3c 00 00 00 01         	mov	byte ptr [ebx + 60], 1
    1206: 8b 5d fc                     	mov	ebx, dword ptr [ebp - 4]
    1209: c9                           	leave
    120a: c3                           	ret
    120b: 8d 74 26 00                  	lea	esi, [esi + eiz]
    120f: 90                           	nop

00001210 <frame_dummy>:
    1210: f3 0f 1e fb                  	endbr32
    1214: e9 57 ff ff ff               	jmp	0x1170 <register_tm_clones>

00001219 <__x86.get_pc_thunk.dx>:
    1219: 8b 14 24                     	mov	edx, dword ptr [esp]
    121c: c3                           	ret
    121d: 66 90                        	nop
    121f: 90                           	nop

00001220 <no>:
    1220: 55                           	push	ebp
    1221: 89 e5                        	mov	ebp, esp
    1223: 53                           	push	ebx
    1224: 83 ec 14                     	sub	esp, 20
    1227: e8 00 00 00 00               	call	0x122c <no+0xc>
    122c: 5b                           	pop	ebx
    122d: 81 c3 d4 5d 00 00            	add	ebx, 24020
    1233: 89 5d f8                     	mov	dword ptr [ebp - 8], ebx
    1236: 8d 83 08 b0 ff ff            	lea	eax, [ebx - 20472]
    123c: 89 04 24                     	mov	dword ptr [esp], eax
    123f: e8 3c fe ff ff               	call	0x1080 <puts@plt>
    1244: 8b 5d f8                     	mov	ebx, dword ptr [ebp - 8]
    1247: c7 04 24 01 00 00 00         	mov	dword ptr [esp], 1
    124e: e8 3d fe ff ff               	call	0x1090 <exit@plt>
    1253: 90                           	nop
    1254: 90                           	nop
    1255: 90                           	nop
    1256: 90                           	nop
    1257: 90                           	nop
    1258: 90                           	nop
    1259: 90                           	nop
    125a: 90                           	nop
    125b: 90                           	nop
    125c: 90                           	nop
    125d: 90                           	nop
    125e: 90                           	nop
    125f: 90                           	nop

00001260 <xd>:
    1260: 55                           	push	ebp
    1261: 89 e5                        	mov	ebp, esp
    1263: 53                           	push	ebx
    1264: 83 ec 14                     	sub	esp, 20
    1267: e8 00 00 00 00               	call	0x126c <xd+0xc>
    126c: 5b                           	pop	ebx
    126d: 81 c3 94 5d 00 00            	add	ebx, 23956
    1273: 89 5d f8                     	mov	dword ptr [ebp - 8], ebx
    1276: 8d 83 0e b0 ff ff            	lea	eax, [ebx - 20466]
    127c: 89 04 24                     	mov	dword ptr [esp], eax
    127f: e8 fc fd ff ff               	call	0x1080 <puts@plt>
    1284: 8b 5d f8                     	mov	ebx, dword ptr [ebp - 8]
    1287: 8d 83 cc ba ff ff            	lea	eax, [ebx - 17716]
    128d: 89 04 24                     	mov	dword ptr [esp], eax
    1290: e8 eb fd ff ff               	call	0x1080 <puts@plt>
    1295: 83 c4 14                     	add	esp, 20
    1298: 5b                           	pop	ebx
    1299: 5d                           	pop	ebp
    129a: c3                           	ret
    129b: 90                           	nop
    129c: 90                           	nop
    129d: 90                           	nop
    129e: 90                           	nop
    129f: 90                           	nop

000012a0 <ok>:
    12a0: 55                           	push	ebp
    12a1: 89 e5                        	mov	ebp, esp
    12a3: 53                           	push	ebx
    12a4: 50                           	push	eax
    12a5: e8 00 00 00 00               	call	0x12aa <ok+0xa>
    12aa: 5b                           	pop	ebx
    12ab: 81 c3 56 5d 00 00            	add	ebx, 23894
    12b1: 8d 83 11 bd ff ff            	lea	eax, [ebx - 17135]
    12b7: 89 04 24                     	mov	dword ptr [esp], eax
    12ba: e8 c1 fd ff ff               	call	0x1080 <puts@plt>
    12bf: 83 c4 04                     	add	esp, 4
    12c2: 5b                           	pop	ebx
    12c3: 5d                           	pop	ebp
    12c4: c3                           	ret
    12c5: 90                           	nop
    12c6: 90                           	nop
    12c7: 90                           	nop
    12c8: 90                           	nop
    12c9: 90                           	nop
    12ca: 90                           	nop
    12cb: 90                           	nop
    12cc: 90                           	nop
    12cd: 90                           	nop
    12ce: 90                           	nop
    12cf: 90                           	nop

000012d0 <main>:
    12d0: 55                           	push	ebp
    12d1: 89 e5                        	mov	ebp, esp
    12d3: 53                           	push	ebx
    12d4: 83 ec 54                     	sub	esp, 84
    12d7: e8 00 00 00 00               	call	0x12dc <main+0xc>
    12dc: 5b                           	pop	ebx
    12dd: 81 c3 24 5d 00 00            	add	ebx, 23844
    12e3: 89 5d c0                     	mov	dword ptr [ebp - 64], ebx
    12e6: c7 45 f8 00 00 00 00         	mov	dword ptr [ebp - 8], 0
    12ed: 8d 83 1b bd ff ff            	lea	eax, [ebx - 17125] ; load string "Please enter key"
    12f3: 89 04 24                     	mov	dword ptr [esp], eax ; 
    12f6: e8 65 fd ff ff               	call	0x1060 <printf@plt>
    12fb: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64]
    12fe: 8d 45 cb                     	lea	eax, [ebp - 53] ; address where user input will be stored [ebp - 53]
    1301: 8d 8b 2e bd ff ff            	lea	ecx, [ebx - 17106] ; flag "%23s" for scanf
    1307: 89 0c 24                     	mov	dword ptr [esp], ecx ; scanf first argument (%23s)
    130a: 89 44 24 04                  	mov	dword ptr [esp + 4], eax ; scanf second argument (memzone to store user input [ebp - 53])
    130e: e8 ad fd ff ff               	call	0x10c0 <__isoc99_scanf@plt>
    1313: 89 45 f4                     	mov	dword ptr [ebp - 12], eax
    1316: b8 01 00 00 00               	mov	eax, 1
    131b: 3b 45 f4                     	cmp	eax, dword ptr [ebp - 12] ; make sure than scanf return value is 1
    131e: 0f 84 08 00 00 00            	je	0x132c <main+0x5c>
    1324: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64]
    1327: e8 f4 fe ff ff               	call	0x1220 <no>
    132c: 0f be 4d cc                  	movsx	ecx, byte ptr [ebp - 52] ; user_input[1] in ecx
    1330: b8 30 00 00 00               	mov	eax, 48 ; 0 in ascii 
    1335: 39 c8                        	cmp	eax, ecx ; user_input[1] == 0
    1337: 0f 84 08 00 00 00            	je	0x1345 <main+0x75>
    133d: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64]
    1340: e8 db fe ff ff               	call	0x1220 <no>
    1345: 0f be 4d cb                  	movsx	ecx, byte ptr [ebp - 53] ; user_input[0]
    1349: b8 30 00 00 00               	mov	eax, 48 ; 0 in ascii 
    134e: 39 c8                        	cmp	eax, ecx ; same comparison 
    1350: 0f 84 08 00 00 00            	je	0x135e <main+0x8e>
    1356: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64]
    1359: e8 c2 fe ff ff               	call	0x1220 <no>
    135e: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64]
    1361: 8b 83 f4 ff ff ff            	mov	eax, dword ptr [ebx - 12]
    1367: 8b 00                        	mov	eax, dword ptr [eax]
    1369: 8b 8b f4 ff ff ff            	mov	ecx, dword ptr [ebx - 12]
    136f: 89 04 24                     	mov	dword ptr [esp], eax
    1372: e8 f9 fc ff ff               	call	0x1070 <fflush@plt> ; fflush stdout
    1377: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64] ; restauring base adress
    137a: 8d 45 e3                     	lea	eax, [ebp - 29] ; memory zone where memset will be called stored in eax
    137d: 31 c9                        	xor	ecx, ecx ; ecx set to 0
    137f: 89 04 24                     	mov	dword ptr [esp], eax ; memset first argument at esp (memzone)
    1382: c7 44 24 04 00 00 00 00      	mov	dword ptr [esp + 4], 0 ; memset second argument (int c, so 0)
    138a: c7 44 24 08 09 00 00 00      	mov	dword ptr [esp + 8], 9 ; memset third argument (int size, so 9)
    1392: e8 19 fd ff ff               	call	0x10b0 <memset@plt>
    1397: c6 45 e3 64                  	mov	byte ptr [ebp - 29], 100 ; set 'd' at the start of the memory zone
    139b: c6 45 ca 00                  	mov	byte ptr [ebp - 54], 0 ; set '0' at at byte before user input at ebp-53
    139f: c7 45 ec 02 00 00 00         	mov	dword ptr [ebp - 20], 2 ; create a variable with int i = 2
    13a6: c7 45 f0 01 00 00 00         	mov	dword ptr [ebp - 16], 1 ; create another variable with int y = 1
    13ad: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64] ; restauring base adress
    13b0: 8d 4d e3                     	lea	ecx, [ebp - 29] ; loading memory zone in ecx
    13b3: 89 e0                        	mov	eax, esp ; moving extending stack pointer adress to eax
    13b5: 89 08                        	mov	dword ptr [eax], ecx ; strlen first argument (memory zone pointed by ecx)
    13b7: e8 e4 fc ff ff               	call	0x10a0 <strlen@plt>
    13bc: 89 c1                        	mov	ecx, eax ; strlen return value in ecx
    13be: 31 c0                        	xor	eax, eax ; eax set to 0
    13c0: 83 f9 08                     	cmp	ecx, 8 ; compare strlen return value with 8
    13c3: 88 45 bf                     	mov	byte ptr [ebp - 65], al ; boolean set to false
    13c6: 0f 83 22 00 00 00            	jae	0x13ee <main+0x11e>
    13cc: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64] ; base pointer
    13cf: 8b 45 ec                     	mov	eax, dword ptr [ebp - 20] ; the int i(2) copied to eax
    13d2: 89 45 b8                     	mov	dword ptr [ebp - 72], eax ; copying the int i(2) to ebp-72
    13d5: 8d 4d cb                     	lea	ecx, [ebp - 53] ; user input adress in ecx
    13d8: 89 e0                        	mov	eax, esp ; extended stack pointer to eax
    13da: 89 08                        	mov	dword ptr [eax], ecx ; strlen first argument which is user input
    13dc: e8 bf fc ff ff               	call	0x10a0 <strlen@plt>
    13e1: 89 c1                        	mov	ecx, eax ; strlen return value
    13e3: 8b 45 b8                     	mov	eax, dword ptr [ebp - 72] ; stores the int 2 in eax also pointed by ebp - 72
    13e6: 39 c8                        	cmp	eax, ecx ; compare strlen return value with 2 
    13e8: 0f 92 c0                     	setb	al ; if strlen(user_input) returns value >  2, flag to 1, or flag to 0
    13eb: 88 45 bf                     	mov	byte ptr [ebp - 65], al ; al value put back in bool 
    13ee: 8a 45 bf                     	mov	al, byte ptr [ebp - 65] ; ??? 
    13f1: a8 01                        	test	al, 1 ; verify if flag == 1
    13f3: 0f 85 05 00 00 00            	jne	0x13fe <main+0x12e> ; jump not equal to 0x13fe
    13f9: e9 4c 00 00 00               	jmp	0x144a <main+0x17a> ; else, jump to 0x144a
    13fe: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64] ; restauring base pointer
    1401: 8b 45 ec                     	mov	eax, dword ptr [ebp - 20] ; loading int 2 in eax
    1404: 8a 44 05 cb                  	mov	al, byte ptr [ebp + eax - 53] ; loading user_input[2] to al
    1408: 88 45 c7                     	mov	byte ptr [ebp - 57], al ; loading al to  [ebp - 57]
    140b: 8b 45 ec                     	mov	eax, dword ptr [ebp - 20] ; moving int 2 to eax
    140e: 8a 44 05 cc                  	mov	al, byte ptr [ebp + eax - 52] ; loading user_input[3] at al
    1412: 88 45 c8                     	mov	byte ptr [ebp - 56], al ; loading al to [ebp - 56]
    1415: 8b 45 ec                     	mov	eax, dword ptr [ebp - 20] ; moving int 2 to eax again
    1418: 8a 44 05 cd                  	mov	al, byte ptr [ebp + eax - 51] ; loading user_input[4] to al
    141c: 88 45 c9                     	mov	byte ptr [ebp - 55], al ; moving al to [ebp - 55];
    141f: 8d 45 c7                     	lea	eax, [ebp - 57] ; loading output buffer to eax
    1422: 89 04 24                     	mov	dword ptr [esp], eax ; eax to esp as first argument to atoi 
    1425: e8 a6 fc ff ff               	call	0x10d0 <atoi@plt>
    142a: 88 c1                        	mov	cl, al ; al (1 byte) of register eax to cl (1 byte) of register ecx
													; might be the result conversion of atoi
    142c: 8b 45 f0                     	mov	eax, dword ptr [ebp - 16] ; move int 1 in eax
    142f: 88 4c 05 e3                  	mov	byte ptr [ebp + eax - 29], cl ; loading cl to output[1]
    1433: 8b 45 ec                     	mov	eax, dword ptr [ebp - 20] ; loading int 2 to eax
    1436: 83 c0 03                     	add	eax, 3 ; 2 + 3 = 5
    1439: 89 45 ec                     	mov	dword ptr [ebp - 20], eax ; loading 5 to int variable
    143c: 8b 45 f0                     	mov	eax, dword ptr [ebp - 16] ; loading int 1 to eax
    143f: 83 c0 01                     	add	eax, 1 ; 1 + 1 = 2
    1442: 89 45 f0                     	mov	dword ptr [ebp - 16], eax ; loading 2 into variable
    1445: e9 63 ff ff ff               	jmp	0x13ad <main+0xdd> ; returning to the beginning of the loop
    144a: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64] ; restauring base address
    144d: 8b 45 f0                     	mov	eax, dword ptr [ebp - 16] ; loading int y
    1450: c6 44 05 e3 00               	mov	byte ptr [ebp + eax - 29], 0 ; output[y] = 0 (null terminating)
    1455: 8d 4d e3                     	lea	ecx, [ebp - 29] ; loading output buffer in ecx
    1458: 8d 93 33 bd ff ff            	lea	edx, [ebx - 17101] ; loading string 'delabere' in edx
    145e: 89 e0                        	mov	eax, esp ; extended stack pointer to eax
    1460: 89 50 04                     	mov	dword ptr [eax + 4], edx ; 'delabere' as first argument to strcmp
    1463: 89 08                        	mov	dword ptr [eax], ecx ; output buffer as second argument to strcmp
    1465: e8 d6 fb ff ff               	call	0x1040 <strcmp@plt>
    146a: 83 f8 00                     	cmp	eax, 0 ; comparing strcmp return
    146d: 0f 85 0d 00 00 00            	jne	0x1480 <main+0x1b0> ; go to no
    1473: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64]
    1476: e8 25 fe ff ff               	call	0x12a0 <ok> ; go to ok
    147b: e9 08 00 00 00               	jmp	0x1488 <main+0x1b8>
    1480: 8b 5d c0                     	mov	ebx, dword ptr [ebp - 64]
    1483: e8 98 fd ff ff               	call	0x1220 <no>
    1488: 31 c0                        	xor	eax, eax
    148a: 83 c4 54                     	add	esp, 84
    148d: 5b                           	pop	ebx
    148e: 5d                           	pop	ebp
    148f: c3                           	ret

00001490 <xxd>:
    1490: 55                           	push	ebp
    1491: 89 e5                        	mov	ebp, esp
    1493: 53                           	push	ebx
    1494: 83 ec 14                     	sub	esp, 20
    1497: e8 00 00 00 00               	call	0x149c <xxd+0xc>
    149c: 5b                           	pop	ebx
    149d: 81 c3 64 5b 00 00            	add	ebx, 23396
    14a3: 89 5d f8                     	mov	dword ptr [ebp - 8], ebx
    14a6: 8d 83 3c bd ff ff            	lea	eax, [ebx - 17092]
    14ac: 89 04 24                     	mov	dword ptr [esp], eax
    14af: e8 cc fb ff ff               	call	0x1080 <puts@plt>
    14b4: 8b 5d f8                     	mov	ebx, dword ptr [ebp - 8]
    14b7: 8d 83 fc c7 ff ff            	lea	eax, [ebx - 14340]
    14bd: 89 04 24                     	mov	dword ptr [esp], eax
    14c0: e8 bb fb ff ff               	call	0x1080 <puts@plt>
    14c5: 83 c4 14                     	add	esp, 20
    14c8: 5b                           	pop	ebx
    14c9: 5d                           	pop	ebp
    14ca: c3                           	ret
    14cb: 90                           	nop
    14cc: 90                           	nop
    14cd: 90                           	nop
    14ce: 90                           	nop
    14cf: 90                           	nop

000014d0 <n>:
    14d0: 55                           	push	ebp
    14d1: 89 e5                        	mov	ebp, esp
    14d3: 53                           	push	ebx
    14d4: 50                           	push	eax
    14d5: e8 00 00 00 00               	call	0x14da <n+0xa>
    14da: 5b                           	pop	ebx
    14db: 81 c3 26 5b 00 00            	add	ebx, 23334
    14e1: 8d 83 43 ca ff ff            	lea	eax, [ebx - 13757]
    14e7: 89 04 24                     	mov	dword ptr [esp], eax
    14ea: e8 91 fb ff ff               	call	0x1080 <puts@plt>
    14ef: 83 c4 04                     	add	esp, 4
    14f2: 5b                           	pop	ebx
    14f3: 5d                           	pop	ebp
    14f4: c3                           	ret
    14f5: 90                           	nop
    14f6: 90                           	nop
    14f7: 90                           	nop
    14f8: 90                           	nop
    14f9: 90                           	nop
    14fa: 90                           	nop
    14fb: 90                           	nop
    14fc: 90                           	nop
    14fd: 90                           	nop
    14fe: 90                           	nop
    14ff: 90                           	nop

00001500 <xxxd>:
    1500: 55                           	push	ebp
    1501: 89 e5                        	mov	ebp, esp
    1503: 53                           	push	ebx
    1504: 83 ec 14                     	sub	esp, 20
    1507: e8 00 00 00 00               	call	0x150c <xxxd+0xc>
    150c: 5b                           	pop	ebx
    150d: 81 c3 f4 5a 00 00            	add	ebx, 23284
    1513: 89 5d f8                     	mov	dword ptr [ebp - 8], ebx
    1516: 8d 83 4a ca ff ff            	lea	eax, [ebx - 13750]
    151c: 89 04 24                     	mov	dword ptr [esp], eax
    151f: e8 5c fb ff ff               	call	0x1080 <puts@plt>
    1524: 8b 5d f8                     	mov	ebx, dword ptr [ebp - 8]
    1527: 8d 83 0b d5 ff ff            	lea	eax, [ebx - 10997]
    152d: 89 04 24                     	mov	dword ptr [esp], eax
    1530: e8 4b fb ff ff               	call	0x1080 <puts@plt>
    1535: 83 c4 14                     	add	esp, 20
    1538: 5b                           	pop	ebx
    1539: 5d                           	pop	ebp
    153a: c3                           	ret
    153b: 90                           	nop
    153c: 90                           	nop
    153d: 90                           	nop
    153e: 90                           	nop
    153f: 90                           	nop

00001540 <ww>:
    1540: 55                           	push	ebp
    1541: 89 e5                        	mov	ebp, esp
    1543: 53                           	push	ebx
    1544: 83 ec 14                     	sub	esp, 20
    1547: e8 00 00 00 00               	call	0x154c <ww+0xc>
    154c: 5b                           	pop	ebx
    154d: 81 c3 b4 5a 00 00            	add	ebx, 23220
    1553: 89 5d f8                     	mov	dword ptr [ebp - 8], ebx
    1556: 8d 83 53 d7 ff ff            	lea	eax, [ebx - 10413]
    155c: 89 04 24                     	mov	dword ptr [esp], eax
    155f: e8 1c fb ff ff               	call	0x1080 <puts@plt>
    1564: 8b 5d f8                     	mov	ebx, dword ptr [ebp - 8]
    1567: 8d 83 5e d7 ff ff            	lea	eax, [ebx - 10402]
    156d: 89 04 24                     	mov	dword ptr [esp], eax
    1570: e8 0b fb ff ff               	call	0x1080 <puts@plt>
    1575: 8b 5d f8                     	mov	ebx, dword ptr [ebp - 8]
    1578: 8d 83 72 d7 ff ff            	lea	eax, [ebx - 10382]
    157e: 89 04 24                     	mov	dword ptr [esp], eax
    1581: e8 fa fa ff ff               	call	0x1080 <puts@plt>
    1586: 8b 5d f8                     	mov	ebx, dword ptr [ebp - 8]
    1589: 8d 83 79 d7 ff ff            	lea	eax, [ebx - 10375]
    158f: 89 04 24                     	mov	dword ptr [esp], eax
    1592: e8 e9 fa ff ff               	call	0x1080 <puts@plt>
    1597: 8b 5d f8                     	mov	ebx, dword ptr [ebp - 8]
    159a: 8d 83 84 d7 ff ff            	lea	eax, [ebx - 10364]
    15a0: 89 04 24                     	mov	dword ptr [esp], eax
    15a3: e8 d8 fa ff ff               	call	0x1080 <puts@plt>
    15a8: 83 c4 14                     	add	esp, 20
    15ab: 5b                           	pop	ebx
    15ac: 5d                           	pop	ebp
    15ad: c3                           	ret
    15ae: 90                           	nop
    15af: 90                           	nop

000015b0 <xyxxd>:
    15b0: 55                           	push	ebp
    15b1: 89 e5                        	mov	ebp, esp
    15b3: 53                           	push	ebx
    15b4: 83 ec 14                     	sub	esp, 20
    15b7: e8 00 00 00 00               	call	0x15bc <xyxxd+0xc>
    15bc: 5b                           	pop	ebx
    15bd: 81 c3 44 5a 00 00            	add	ebx, 23108
    15c3: 89 5d f8                     	mov	dword ptr [ebp - 8], ebx
    15c6: 8d 83 89 d7 ff ff            	lea	eax, [ebx - 10359]
    15cc: 89 04 24                     	mov	dword ptr [esp], eax
    15cf: e8 ac fa ff ff               	call	0x1080 <puts@plt>
    15d4: 8b 5d f8                     	mov	ebx, dword ptr [ebp - 8]
    15d7: 8d 83 4b e2 ff ff            	lea	eax, [ebx - 7605]
    15dd: 89 04 24                     	mov	dword ptr [esp], eax
    15e0: e8 9b fa ff ff               	call	0x1080 <puts@plt>
    15e5: 83 c4 14                     	add	esp, 20
    15e8: 5b                           	pop	ebx
    15e9: 5d                           	pop	ebp
    15ea: c3                           	ret

Disassembly of section .fini:

000015ec <_fini>:
    15ec: f3 0f 1e fb                  	endbr32
    15f0: 53                           	push	ebx
    15f1: 83 ec 08                     	sub	esp, 8
    15f4: e8 27 fb ff ff               	call	0x1120 <__x86.get_pc_thunk.bx>
    15f9: 81 c3 07 5a 00 00            	add	ebx, 23047
    15ff: 83 c4 08                     	add	esp, 8
    1602: 5b                           	pop	ebx
    1603: c3                           	ret
