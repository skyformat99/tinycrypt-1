; Listing generated by Microsoft (R) Optimizing Compiler Version 19.10.25019.0 

	TITLE	C:\hub\sha3\keccak\k200.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	_k200_permute
; Function compile flags: /Ogspy
; File c:\hub\sha3\keccak\k200.c
;	COMDAT _k200_permute
_TEXT	SEGMENT
tv1337 = -96						; size = 4
tv1322 = -92						; size = 4
tv1323 = -88						; size = 4
tv1331 = -84						; size = 4
tv1344 = -80						; size = 4
tv1300 = -76						; size = 4
tv1301 = -72						; size = 4
tv1302 = -68						; size = 4
_bc$ = -64						; size = 5
_m5$ = -56						; size = 10
_rc$ = -44						; size = 18
_keccakf_piln$ = -24					; size = 24
_state$ = 8						; size = 4
_k200_permute PROC					; COMDAT

; 33   : {

	sub	esp, 96					; 00000060H
	push	ebx
	push	ebp
	push	esi
	mov	esi, DWORD PTR _state$[esp+104]
	lea	edx, DWORD PTR _m5$[esp+112]
	push	edi
	mov	eax, esi

; 34   :   uint8_t i, j, rnd, r, t, bc[5];
; 35   :   uint8_t *st = (uint8_t*)state;
; 36   :   
; 37   : const uint8_t rc[]={

	mov	DWORD PTR _rc$[esp+112], 9077249	; 008a8201H

; 38   :   0x01,0x82,0x8a,0x00,0x8b,0x01,0x81,0x09,0x8a,
; 39   :   0x88,0x09,0x0a,0x8b,0x8b,0x89,0x03,0x02,0x80};
; 40   :   
; 41   : const uint8_t keccakf_piln[24] = 

	push	18					; 00000012H
	lea	ecx, DWORD PTR [esi+15]
	mov	DWORD PTR _rc$[esp+120], 159449483	; 0981018bH
	sub	eax, ecx
	mov	DWORD PTR _rc$[esp+124], 168396938	; 0a09888aH
	mov	DWORD PTR tv1337[esp+116], eax
	mov	ebp, esi
	pop	ebx
	lea	eax, DWORD PTR _bc$[esp+112]
	mov	DWORD PTR tv1323[esp+112], ebx
	sub	eax, ecx
	mov	BYTE PTR _keccakf_piln$[esp+116], bl
	mov	DWORD PTR tv1331[esp+112], eax
	mov	ebx, esi
	mov	edi, esi
	mov	DWORD PTR _rc$[esp+124], 59345803	; 03898b8bH
	sub	ebx, ecx
	mov	WORD PTR _rc$[esp+128], 32770		; 00008002H
	sub	ebp, ecx
	mov	DWORD PTR _keccakf_piln$[esp+112], 285935370 ; 110b070aH
	sub	edi, ecx
	mov	DWORD PTR _keccakf_piln$[esp+117], 135267587 ; 08100503H
	mov	eax, esi
	mov	DWORD PTR _keccakf_piln$[esp+121], 251926549 ; 0f041815H
	sub	eax, edx
	mov	DWORD PTR _keccakf_piln$[esp+125], 202183447 ; 0c0d1317H
	mov	DWORD PTR tv1344[esp+112], eax
	lea	eax, DWORD PTR _rc$[esp+112]
	mov	DWORD PTR _keccakf_piln$[esp+129], 370021378 ; 160e1402H
	mov	WORD PTR _keccakf_piln$[esp+133], 1545	; 00000609H
	mov	BYTE PTR _keccakf_piln$[esp+135], 1

; 42   : { 10, 7,  11, 17, 18, 3, 5,  16, 8,  21, 24, 4, 
; 43   :   15, 23, 19, 13, 12, 2, 20, 14, 22, 9,  6,  1  };
; 44   :   
; 45   : const uint8_t m5[10] = 

	mov	DWORD PTR _m5$[esp+112], 50462976	; 03020100H
	mov	DWORD PTR _m5$[esp+116], 33619972	; 02010004H
	mov	WORD PTR _m5$[esp+120], 1027		; 00000403H
	mov	DWORD PTR tv1300[esp+112], ebx
	mov	DWORD PTR tv1301[esp+112], ebp
	mov	DWORD PTR tv1302[esp+112], edi
	mov	DWORD PTR tv1322[esp+112], eax
$LL4@k200_permu:

; 46   : { 0, 1, 2, 3, 4, 0, 1, 2, 3, 4 };
; 47   :   
; 48   :   for (rnd=0; rnd<18; rnd++) 
; 49   :   {
; 50   :     // Theta
; 51   :     for (i=0; i<5; i++) {     

	mov	esi, DWORD PTR tv1337[esp+112]
	push	5
	pop	edx
$LL7@k200_permu:

; 52   :       t  = st[i     ]; 
; 53   :       t ^= st[i +  5]; 
; 54   :       t ^= st[i + 10]; 
; 55   :       t ^= st[i + 15]; 
; 56   :       t ^= st[i + 20];

	mov	al, BYTE PTR [esi+ecx]
	xor	al, BYTE PTR [edi+ecx+5]
	xor	al, BYTE PTR [ecx+ebp+10]
	xor	al, BYTE PTR [ebx+ecx+20]

; 57   :       bc[i] = t;

	mov	esi, DWORD PTR tv1331[esp+112]
	xor	al, BYTE PTR [ecx]
	mov	BYTE PTR [esi+ecx], al
	inc	ecx
	mov	esi, DWORD PTR tv1337[esp+112]
	sub	edx, 1
	jne	SHORT $LL7@k200_permu

; 58   :     }
; 59   :     for (i=0; i<5; i++) {

	mov	esi, DWORD PTR _state$[esp+108]
	lea	ecx, DWORD PTR _m5$[esp+116]
	push	5
	pop	edi
$LL10@k200_permu:

; 60   :       t  = bc[m5[(i + 4)]]; 
; 61   :       t ^= ROTL8(bc[m5[(i + 1)]], 1);

	movzx	eax, BYTE PTR [ecx-3]
	push	5
	pop	ebx
	mov	dl, BYTE PTR _bc$[esp+eax+112]
	movzx	eax, BYTE PTR [ecx]
	rol	dl, 1
	xor	dl, BYTE PTR _bc$[esp+eax+112]
	mov	eax, DWORD PTR tv1344[esp+112]
	add	eax, ecx
$LL13@k200_permu:

; 62   :       for (j=0; j<25; j+=5) {
; 63   :         st[j + i] ^= t;

	xor	BYTE PTR [eax], dl
	add	eax, 5
	sub	ebx, 1
	jne	SHORT $LL13@k200_permu

; 58   :     }
; 59   :     for (i=0; i<5; i++) {

	inc	ecx
	sub	edi, 1
	jne	SHORT $LL10@k200_permu

; 64   :       }
; 65   :     }
; 66   :     // Rho Pi
; 67   :     t = st[1];

	mov	bl, BYTE PTR [esi+1]
	lea	edi, DWORD PTR _keccakf_piln$[esp+112]

; 68   :     for (i=0, r=0; i<24; i++) {

	xor	ah, ah
	xor	bh, bh
$LL16@k200_permu:

; 69   :       r += i + 1;
; 70   :       j = keccakf_piln[i];
; 71   :       bc[0] = st[j];

	movzx	edx, BYTE PTR [edi]
	mov	al, ah
	inc	al
	add	bh, al

; 72   :       st[j] = ROTL8(t, r & 7);

	movzx	ecx, bh
	mov	al, BYTE PTR [edx+esi]
	and	ecx, 7
	rol	bl, cl
	inc	ah
	inc	edi
	mov	BYTE PTR [edx+esi], bl

; 73   :       t = bc[0];

	mov	bl, al
	cmp	ah, 24					; 00000018H
	jb	SHORT $LL16@k200_permu

; 74   :     }
; 75   :     // Chi
; 76   :     for (i=0; i<25; i+=5) {

	push	5
	mov	edx, esi
	pop	ebx
$LL19@k200_permu:

; 77   :       memcpy(&bc, &st[i], 5);

	mov	eax, DWORD PTR [edx]
	lea	edi, DWORD PTR _m5$[esp+114]
	mov	DWORD PTR _bc$[esp+112], eax
	mov	al, BYTE PTR [edx+4]
	push	5
	mov	BYTE PTR _bc$[esp+120], al
	pop	ebp
$LL22@k200_permu:

; 78   :       for (j=0; j<5; j++) {
; 79   :         t  = ~bc[m5[(j + 1)]];

	movzx	eax, BYTE PTR [edi-1]
	mov	cl, BYTE PTR _bc$[esp+eax+112]

; 80   :         t &=  bc[m5[(j + 2)]];

	movzx	eax, BYTE PTR [edi]
	not	cl
	and	cl, BYTE PTR _bc$[esp+eax+112]

; 81   :         st[j + i] ^= t; 

	xor	BYTE PTR [edx], cl
	inc	edi
	inc	edx
	sub	ebp, 1
	jne	SHORT $LL22@k200_permu

; 74   :     }
; 75   :     // Chi
; 76   :     for (i=0; i<25; i+=5) {

	sub	ebx, 1
	jne	SHORT $LL19@k200_permu

; 82   :       }
; 83   :     }
; 84   :     // Iota
; 85   :     st[0] ^= rc[rnd];

	mov	ebx, DWORD PTR tv1322[esp+112]
	lea	ecx, DWORD PTR [esi+15]
	mov	ebp, DWORD PTR tv1301[esp+112]
	mov	edi, DWORD PTR tv1302[esp+112]
	mov	al, BYTE PTR [ebx]
	xor	BYTE PTR [esi], al
	inc	ebx
	sub	DWORD PTR tv1323[esp+112], 1
	mov	DWORD PTR tv1322[esp+112], ebx
	mov	ebx, DWORD PTR tv1300[esp+112]
	jne	$LL4@k200_permu
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx

; 86   :   }
; 87   : }

	add	esp, 96					; 00000060H
	ret	0
_k200_permute ENDP
_TEXT	ENDS
END
