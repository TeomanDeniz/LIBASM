;* ************************************************************************** *;
;*                                                                            *;
;*                                                        :::      ::::::::   *;
;*   ft_write.s                                         :+:      :+:    :+:   *;
;*                                                    +:+ +:+         +:+     *;
;*   By: hdeniz <Discord:@teomandeniz>              +#+  +:+       +#+        *;
;*                                                +#+#+#+#+#+   +#+           *;
;*   Created: 2024/12/06 16:18:46 by hdeniz            #+#    #+#             *;
;*   Updated: 2025/09/19 13:45:18 by hdeniz           ###   ########.fr       *;
;*                                                                            *;
;* ************************************************************************** *;

%define TARGET64 1 ; REMOVE IF 32BIT NEEDED

section .text
	global ft_write
	extern __errno_location

%ifdef TARGET64
[BITS 64]

ft_write:
	PUSH 		RBP
	MOV 		RBP, RSP
	MOV			RAX, 1
	SYSCALL
	CMP			RAX, 0
	JL			.ERROR_WRITE
	JMP			.END_WRITE

.ERROR_WRITE:
	PUSH		RAX
	CALL		__errno_location WRT ..plt
	POP			RBX
	NEG			RBX
	MOV			[RAX], RBX
	MOV			RAX, -1
	JMP 		.END_WRITE

.END_WRITE:
	MOV			RSP, RBP
	POP			RBP
	RET
%else
[BITS 32]

ft_write:
	PUSH 		EBP
	MOV 		EBP, ESP
	MOV			EAX, 1
	SYSCALL
	CMP			EAX, 0
	JL			.ERROR_WRITE
	JMP			.END_WRITE

.ERROR_WRITE:
	PUSH		EAX
	CALL		__errno_location WRT ..plt
	POP			EBX
	NEG			EBX
	MOV			[EAX], EBX
	MOV			EAX, -1
	JMP 		.end_write

.END_WRITE:
	MOV			ESP, EBP
	POP			EBP
	RET
%endif ; TARGET64
