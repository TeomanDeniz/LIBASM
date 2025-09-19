;* ************************************************************************** *;
;*                                                                            *;
;*                                                        :::      ::::::::   *;
;*   ft_strcpy.s                                        :+:      :+:    :+:   *;
;*                                                    +:+ +:+         +:+     *;
;*   By: hdeniz <Discord:@teomandeniz>              +#+  +:+       +#+        *;
;*                                                +#+#+#+#+#+   +#+           *;
;*   Created: 2024/12/06 16:18:46 by hdeniz            #+#    #+#             *;
;*   Updated: 2025/09/19 13:45:18 by hdeniz           ###   ########.fr       *;
;*                                                                            *;
;* ************************************************************************** *;

%define TARGET64 1 ; REMOVE IF 32BIT NEEDED

section .text
	global ft_strcpy

%ifdef TARGET64
ft_strcpy:
	PUSH 		RBP
	MOV 		RBP, RSP
	MOV			RBX, RDI
	MOV			RCX, RSI
	MOV			RAX, RBX

.LOOP_STRCPY:
	MOV			DL, [RCX]
	MOV			[RBX], DL
	INC			RBX
	INC			RCX
	CMP			BYTE DL, 0X0
	JNE			.LOOP_STRCPY
	MOV			RSP, RBP
	POP			RBP
	RET
%else
ft_strcpy:
	PUSH 		EBP
	MOV 		EBP, ESP
	MOV			EBX, EDI
	MOV			ECX, ESI
	MOV			EAX, EBX

.LOOP_STRCPY:
	MOV			DL, [ECX]
	MOV			[EBX], DL
	INC			EBX
	INC			ECX
	CMP			BYTE DL, 0X0
	JNE			.LOOP_STRCPY
	MOV			ESP, EBP
	POP			EBP
	RET
%endif ; TARGET64
