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
[BITS 64]

ft_strdup:
	CALL		ft_strlen
	INC			RAX
	PUSH		RDI
	MOV			RDI, RAX
	CALL		malloc WRT ..plt
	CMP			RAX, 0X0
	JE			.END_STRDUP
	POP			RSI
	MOV			RDI, RAX
	PUSH		RAX
	CALL		ft_strcpy
	POP			RAX
	RET

.END_STRDUP:
	POP			RDI
	RET
%else
[BITS 32]

ft_strdup:
	CALL	ft_strlen
	INC		EAX
	PUSH	EAX
	CALL	malloc WRT ..plt
	ADD		ESP, 4
	CMP		EAX, 0
	JE		.END_STRDUP
	PUSH	[ESP + 4]
	MOV		EDI, EAX
	PUSH	ESI
	CALL	ft_strcpy
	ADD		ESP, 4
	RET

.END_STRDUP:
	RET
%endif ; TARGET64
