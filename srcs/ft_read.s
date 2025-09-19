;* ************************************************************************** *;
;*                                                                            *;
;*                                                        :::      ::::::::   *;
;*   ft_read.s                                          :+:      :+:    :+:   *;
;*                                                    +:+ +:+         +:+     *;
;*   By: hdeniz <Discord:@teomandeniz>              +#+  +:+       +#+        *;
;*                                                +#+#+#+#+#+   +#+           *;
;*   Created: 2024/12/06 16:18:46 by hdeniz            #+#    #+#             *;
;*   Updated: 2025/09/19 13:45:18 by hdeniz           ###   ########.fr       *;
;*                                                                            *;
;* ************************************************************************** *;

%define TARGET64 1 ; REMOVE IF 32BIT NEEDED

section .text
	global ft_read
	extern __errno_location

%ifdef TARGET64
ft_read:
	PUSH 		RBP
	MOV 		RBP, RSP
	MOV			RAX, 0
	SYSCALL
	CMP			RAX, 0
	JL			.ERROR_READ
	JMP			.END_OF_READ

.ERROR_READ:
	PUSH		RAX
	CALL		__errno_location WRT ..plt
	POP			RBX
	NEG			RBX
	MOV			[RAX], RBX
	MOV			RAX, -1
	JMP 		.END_OF_READ

.END_OF_READ:
	MOV			RSP, RBP
	POP			RBP
	RET
%else
[BITS 32]
ft_read:
	PUSH 		EBP
	MOV 		EBP, ESP
	MOV			EAX, 0
	SYSCALL
	CMP			EAX, 0
	JL			.ERROR_READ
	JMP			.END_OF_READ

.ERROR_READ:
	PUSH		EAX
	CALL		__errno_location WRT ..plt
	POP			EBX
	NEG			EBX
	MOV			[EAX], EBX
	MOV			EAX, -1
	JMP 		.END_OF_READ

.END_OF_READ:
	MOV			ESP, EBP
	POP			EBP
	RET
%endif ; TARGET64