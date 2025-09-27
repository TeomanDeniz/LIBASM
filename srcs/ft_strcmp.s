;* ************************************************************************** *;
;*                                                                            *;
;*                                                        :::      ::::::::   *;
;*   ft_strcmp.s                                        :+:      :+:    :+:   *;
;*                                                    +:+ +:+         +:+     *;
;*   By: hdeniz <Discord:@teomandeniz>              +#+  +:+       +#+        *;
;*                                                +#+#+#+#+#+   +#+           *;
;*   Created: 2024/12/06 16:18:46 by hdeniz            #+#    #+#             *;
;*   Updated: 2025/09/19 13:45:18 by hdeniz           ###   ########.fr       *;
;*                                                                            *;
;* ************************************************************************** *;

%define TARGET64 1 ; REMOVE IF 32BIT NEEDED

section .text
	global ft_strcmp

%ifdef TARGET64
[BITS 64]

ft_strcmp:
	PUSH 		RBP
	MOV 		RBP, RSP
	MOV			RBX, RDI
	MOV			RCX, RSI
	XOR			RAX, RAX
	MOV 		AL, [RBX]
	MOV 		AH, [RCX]
	CMP			RAX, 0
	JE			.END_STRCMP

.LOOP_STRCMP:
	XOR			RAX, RAX
	XOR			RDX, RDX
	MOV			AL, [RBX]
	MOV			DL, [RCX]
	SUB			RAX, RDX
	INC			RBX
	INC			RCX
	CMP			BYTE [RBX], 0X0
	JE			.LAST_COMPARE_STRCMP
	CMP			BYTE [RCX], 0X0
	JE			.LAST_COMPARE_STRCMP
	CMP			BYTE AL, 0X0
	JE			.LOOP_STRCMP
	JMP			.END_STRCMP

.LAST_COMPARE_STRCMP:
	XOR			RAX, RAX
	XOR			RDX, RDX
	MOV			AL, [RBX]
	MOV			DL, [RCX]
	SUB			RAX, RDX
	JMP			.END_STRCMP

.END_STRCMP:
	MOV			RSP, RBP
	POP			RBP
	RET
%else
[BITS 32]

ft_strcmp:
	MOV			EBX, [ESP + 4]
	MOV			ECX, [ESP + 8]
	XOR			EAX, EAX
	MOV 		AL, [EBX]
	MOV 		AH, [ECX]
	CMP			EAX, 0
	JE			.END_STRCMP

.LOOP_STRCMP:
	XOR			EAX, EAX
	XOR			EDX, EDX
	MOV			AL, [EBX]
	MOV			DL, [ECX]
	SUB			EAX, EDX
	INC			EBX
	INC			ECX
	CMP			BYTE [EBX], 0X0
	JE			.LAST_COMPARE_STRCMP
	CMP			BYTE [ECX], 0X0
	JE			.LAST_COMPARE_STRCMP
	CMP			BYTE AL, 0X0
	JE			.LOOP_STRCMP
	RET

.LAST_COMPARE_STRCMP:
	XOR			EAX, EAX
	XOR			EDX, EDX
	MOV			AL, [EBX]
	MOV			DL, [ECX]
	SUB			EAX, EDX

.END_STRCMP:
	RET
%endif ; TARGET64
