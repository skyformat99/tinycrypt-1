; Listing generated by Microsoft (R) Optimizing Compiler Version 16.00.40219.01 

	TITLE	c:\hub\tinycrypt\block\noekeon\n2.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	_noekeon
; Function compile flags: /Ogspy
; File c:\hub\tinycrypt\block\noekeon\n2.c
;	COMDAT _noekeon
_TEXT	SEGMENT
_rc_tab$ = -20						; size = 17
tv566 = 8						; size = 4
_key$ = 8						; size = 4
_data$ = 12						; size = 4
_noekeon PROC						; COMDAT

; 33   : {

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 34   :   int      i, j;
; 35   :   uint32_t t;
; 36   : 
; 37   :   uint32_t *s=(uint32_t*)data;
; 38   :   uint32_t *k=(uint32_t*)key;
; 39   : 
; 40   :   const uint8_t rc_tab[]=   
; 41   :     { 0x80,
; 42   :       0x1B, 0x36, 0x6C, 0xD8, 
; 43   :       0xAB, 0x4D, 0x9A, 0x2F, 
; 44   :       0x5E, 0xBC, 0x63, 0xC6, 
; 45   :       0x97, 0x35, 0x6A, 0xD4 };
; 46   :   
; 47   :     for (i=0;;i++) {

	mov	eax, DWORD PTR _data$[ebp]
	push	ebx
	push	esi
	mov	esi, DWORD PTR _key$[ebp]
	xor	ebx, ebx
	sub	esi, eax
	push	edi
	mov	DWORD PTR _rc_tab$[ebp], 1815485312	; 6c361b80H
	mov	DWORD PTR _rc_tab$[ebp+4], -1706185768	; 9a4dabd8H
	mov	DWORD PTR _rc_tab$[ebp+8], 1673289263	; 63bc5e2fH
	mov	DWORD PTR _rc_tab$[ebp+12], 1781897158	; 6a3597c6H
	mov	BYTE PTR _rc_tab$[ebp+16], 212		; 000000d4H

; 68   : 
; 69   :       //Pi1
; 70   :       s[1] = ROTL32(s[1], 1);
; 71   :       s[2] = ROTL32(s[2], 5);

	mov	DWORD PTR tv566[ebp], esi
$LL7@noekeon:

; 48   :       s[0] ^= rc_tab[i];

	movzx	ecx, BYTE PTR _rc_tab$[ebp+ebx]
	xor	DWORD PTR [eax], ecx

; 49   :       // Theta
; 50   :       t = s[0] ^ s[2]; 

	mov	ecx, DWORD PTR [eax+8]
	xor	ecx, DWORD PTR [eax]
	push	4

; 51   : 
; 52   :       t ^= ROTR32(t, 8) ^ ROTL32(t, 8);

	mov	edx, ecx
	ror	edx, 8
	mov	edi, ecx
	rol	edi, 8
	xor	edx, edi
	xor	ecx, edx

; 53   : 
; 54   :       s[1] ^= t;

	xor	DWORD PTR [eax+4], ecx

; 55   :       s[3] ^= t;

	xor	DWORD PTR [eax+12], ecx
	mov	ecx, eax
	pop	edx
$LL4@noekeon:

; 56   : 
; 57   :       for (j=0; j<4; j++) {
; 58   :         s[j] ^= k[j];

	mov	edi, DWORD PTR [esi+ecx]
	xor	DWORD PTR [ecx], edi
	add	ecx, 4
	dec	edx
	jne	SHORT $LL4@noekeon

; 59   :       }
; 60   : 
; 61   :       t = s[1] ^ s[3]; 

	mov	edx, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR [eax+4]
	xor	ecx, edx

; 62   :       t ^= ROTR32(t, 8) ^ ROTL32(t, 8);

	mov	esi, ecx
	mov	edi, ecx
	ror	esi, 8
	rol	edi, 8
	xor	esi, edi
	xor	ecx, esi

; 63   : 
; 64   :       s[0] ^= t;

	xor	DWORD PTR [eax], ecx

; 65   :       s[2] ^= t;

	xor	DWORD PTR [eax+8], ecx
	mov	ecx, DWORD PTR [eax+8]

; 66   : 
; 67   :       if (i==Nr) break;

	cmp	ebx, 16					; 00000010H
	je	SHORT $LN13@noekeon

; 68   : 
; 69   :       //Pi1
; 70   :       s[1] = ROTL32(s[1], 1);
; 71   :       s[2] = ROTL32(s[2], 5);

	rol	ecx, 5

; 72   :       s[3] = ROTL32(s[3], 2);

	rol	edx, 2
	mov	edi, edx
	mov	esi, ecx
	mov	ecx, DWORD PTR [eax+4]
	rol	ecx, 1

; 73   : 
; 74   :       // Gamma
; 75   :       s[1] ^= ~((s[3]) | (s[2]));

	mov	edx, esi
	or	edx, edi
	not	edx
	xor	ecx, edx
	mov	DWORD PTR [eax+4], ecx

; 76   :       s[0] ^=   s[2] & s[1];  
; 77   : 
; 78   :       XCHG(s[0], s[3]);
; 79   : 
; 80   :       s[2] ^= s[0] ^ s[1] ^ s[3];

	mov	edx, DWORD PTR [eax+4]
	xor	edx, edi
	and	ecx, esi
	xor	ecx, DWORD PTR [eax]
	mov	DWORD PTR [eax+8], esi
	mov	esi, DWORD PTR tv566[ebp]
	xor	edx, ecx
	xor	DWORD PTR [eax+8], edx
	mov	edx, DWORD PTR [eax+8]

; 81   : 
; 82   :       s[1] ^= ~((s[3]) | (s[2]));

	or	edx, ecx
	not	edx
	xor	DWORD PTR [eax+4], edx
	mov	edx, DWORD PTR [eax+4]

; 83   :       s[0] ^=   s[2] & s[1];  

	and	edx, DWORD PTR [eax+8]
	xor	edx, edi

; 84   : 
; 85   :       // Pi2
; 86   :       s[1] = ROTR32(s[1], 1);

	ror	DWORD PTR [eax+4], 1

; 87   :       s[2] = ROTR32(s[2], 5);

	ror	DWORD PTR [eax+8], 5

; 88   :       s[3] = ROTR32(s[3], 2);

	ror	ecx, 2
	mov	DWORD PTR [eax], edx
	mov	DWORD PTR [eax+12], ecx
	inc	ebx
	jmp	$LL7@noekeon
$LN13@noekeon:
	pop	edi
	pop	esi
	pop	ebx

; 89   :     }
; 90   : }

	leave
	ret	0
_noekeon ENDP
_TEXT	ENDS
END
