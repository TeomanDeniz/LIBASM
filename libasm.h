/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hdeniz <Discord:@teomandeniz>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/06 16:18:46 by hdeniz            #+#    #+#             */
/*   Updated: 2025/09/06 13:45:18 by hdeniz           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
#	define LIBASM_H 202509

/* **************************** [v] INCLUDES [v] **************************** */
#	include <stddef.h> /*
#	typedef size_t;
#	        */
/* **************************** [^] INCLUDES [^] **************************** */

extern long int	ft_strlen(const char *);
extern char		*ft_strcpy(char *, const char *);
extern int			ft_strcmp(char *, char *);
extern size_t		ft_write(int, char *, int);
extern size_t		ft_read(int, char *, int);
extern char 		*ft_strdup(const char *);

#endif /* LIBASM_H */
