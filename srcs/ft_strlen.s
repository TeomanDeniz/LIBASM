;* ************************************************************************** *;
;*                                                                            *;
;*                                                        :::      ::::::::   *;
;*   ft_strlen.s                                        :+:      :+:    :+:   *;
;*                                                    +:+ +:+         +:+     *;
;*   By: hdeniz <Discord:@teomandeniz>              +#+  +:+       +#+        *;
;*                                                +#+#+#+#+#+   +#+           *;
;*   Created: 2024/12/06 16:18:46 by hdeniz            #+#    #+#             *;
;*   Updated: 2025/09/19 13:45:18 by hdeniz           ###   ########.fr       *;
;*                                                                            *;
;* ************************************************************************** *;

%define TARGET64 1 ; REMOVE IF 32BIT NEEDED

section .text
	global ft_strlen

%ifdef TARGET64
[BITS 64]

ft_strlen:
	PUSH		RBP
	MOV			RBP, RSP
	MOV			RBX, RDI
	MOV			RAX, 0X0
	CMP			RBX, 0
	JE 			.END_STRLEN

.LOOP_STRLEN:
	CMP	BYTE	[RBX], 0X0
	JE 			.END_STRLEN
	INC			RAX
	ADD			RBX, 1
	JMP			.LOOP_STRLEN

.END_STRLEN:
	MOV			RSP, RBP
	POP			RBP
	RET
%else
[BITS 32]

ft_strlen:
	PUSH 		EBP
	MOV 		EBP, ESP
	MOV			EBX, EDI
	MOV			EAX, 0X0
	CMP			EBX, 0
	JE			.END_STRLEN

.LOOP_STRLEN:
	CMP	BYTE	[EBX], 0X0
	JE 			.END_STRLEN
	INC			EAX
	ADD			EBX, 1
	JMP			.LOOP_STRLEN

.END_STRLEN:
	MOV			ESP, EBP
	POP			EBP
	RET
%endif ; TARGET64
