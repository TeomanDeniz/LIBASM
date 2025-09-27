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
	MOV			RAX, 1
	SYSCALL
	CMP			RAX, 0
	JL			.ERROR_READ
	RET

.ERROR_READ:
	PUSH		RAX
	CALL		__errno_location WRT ..plt
	POP			RBX
	NEG			RBX
	MOV			[RAX], RBX
	MOV			RAX, -1
	RET
%else
[BITS 32]

ft_write:
	MOV			EAX, 1
	MOV			EBX, [ESP + 4]
	MOV			ECX, [ESP + 8]
	MOV			EDX, [ESP + 12]
	INT			0X80
	CMP			EAX, 0
	JL			.ERROR_READ
	RET

.ERROR_READ:
	PUSH		EAX
	CALL		__errno_location WRT ..plt
	POP			EBX
	NEG			EBX
	MOV			[EAX], EBX
	MOV			EAX, -1
	RET
%endif ; TARGET64
