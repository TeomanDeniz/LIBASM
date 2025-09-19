;* ************************************************************************** *;
;*                                                                            *;
;*                                                        :::      ::::::::   *;
;*   ft_strdup.s                                        :+:      :+:    :+:   *;
;*                                                    +:+ +:+         +:+     *;
;*   By: hdeniz <Discord:@teomandeniz>              +#+  +:+       +#+        *;
;*                                                +#+#+#+#+#+   +#+           *;
;*   Created: 2024/12/06 16:18:46 by hdeniz            #+#    #+#             *;
;*   Updated: 2025/09/19 13:45:18 by hdeniz           ###   ########.fr       *;
;*                                                                            *;
;* ************************************************************************** *;

%define TARGET64 1 ; REMOVE IF 32BIT NEEDED

section .text
	global ft_strdup
	extern ft_strlen
	extern ft_strcpy
	extern malloc

%ifdef TARGET64
ft_strdup:
	PUSH 		RBP
	MOV 		RBP, RSP
	CALL		ft_strlen
	INC			RAX
	PUSH		RDI
	MOV			RDI, RAX
	CALL		malloc WRT ..plt
	CMP			RAX, 0X0
	JE			.END_STRDUP
	JMP			.COPY_STRDUP

.COPY_STRDUP:
	POP			RSI
	MOV			RDI, RAX
	PUSH		RAX
	CALL		ft_strcpy
	POP			RAX
	JMP			.END_STRDUP

.END_STRDUP:
	MOV			RSP, RBP
	POP			RBP
	RET
%else
ft_strdup:
	PUSH 		EBP
	MOV 		EBP, ESP
	CALL		ft_strlen
	INC			EAX
	PUSH		EDI
	MOV			EDI, EAX
	CALL		malloc WRT ..plt
	CMP			EAX, 0X0
	JE			.END_STRDUP
	JMP			.COPY_STRDUP

.COPY_STRDUP:
	POP			ESI
	MOV			EDI, EAX
	PUSH		EAX
	CALL		ft_strcpy
	POP			EAX
	JMP			.END_STRDUP

.END_STRDUP:
	MOV			ESP, EBP
	POP			EBP
	RET
%endif ; TARGET64
