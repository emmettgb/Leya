;         .-.
;        ((`-)
;         \\     (\/)
;          \\     \/
;   .="""=._))
;  /  .,   .'
; /__(,_.-'
;`    /|
;    /_|__
;      | `))
;      |
;     -"==
;		 __    ____
;		(  )  ( ___)=========================|
;		 )(__  )__)      Version 0.0.1       |
;		(____)(____)  Copyright (C) 2021     |
;		 _  _   __|==========================|
;		( \/ ) /__\  Programmed By           |
;		 \  / /(__)\        Emmett Boudreau  |
;		 (__)(__)(__)========================|
;                                        |
;========================================|
; ____    __   ____   __
;(  _ \  /__\ (_  _) /__\
; )(_) )/(__)\  )(  /(__)\
;(____/(__)(__)(__)(__)(__)
section .data
  ; prompt_head:
  head_prnt1: db " __    ____", 10, "(  )  ( ___)=========================|", 10
  head_prnt2: db " )(__  )__)      Version 0.0.1       |", 10
  head_prnt3: db "(____)(____)  Copyright (C) 2021     |", 10
  head_prnt4: db " _  _   __|==========================|", 10
  head_prnt5: db "( \/ ) /__\  Programmed By           |", 10
  head_prnt6: db " \  / /(__)\        Emmett Boudreau  |", 10
  head_prnt7: db " (__)(__)(__)========================|", 10
  repl_prompt: db "Leya> "
section .text
  global _start


;  ___  ____   __    ____  ____
; / __)(_  _) /__\  (  _ \(_  _)
; \__ \  )(  /(__)\  )   /  )(
; (___/ (__)(__)(__)(_)\_) (__)
; ===============|
; _start
; main function, checks if argument provided.
; If no argument is provided, jumps to _start_repl.
; passable args:
;v======+======+======+===================================================v
;| arg1 | arg2 | arg3 |    does:                                          |
;+======+======+======+===================================================+
;| -v   |      |      | Prints out version information.                   |
;+------+------+------+---------------------------------------------------+
;| -o   | uri1 | uri2 | Compiles file-input. arg2 is the file we want     |
;|      |      |      | to compile, arg2 is the output filename.          |
;L------+------+------+--------------------------------------------------w
; ===============|
_start:
  jmp _start_repl
  mov rax, 60
  mov rdi, 0
  syscall


;  ____  ____  ____  __
; (  _ \( ___)(  _ \(  )
;  )   / )__)  )___/ )(__
; (_)\_)(____)(__)  (____)
; ===============|
; _START_REPL
; Allocates data for REPL, calls _repl_printout:, followed by _repl. On ret
; from repl, will ret to _start. Start will then call syscall 60 (exit).
; ===============|
_start_repl:
  jmp _repl_printout
  jmp _repl
  ret
; ===============|
; _REPL_PRINTOUT
; Prints leya header, returns to _start_repl:.
; ===============|
_repl_printout:
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt1
  mov rdx, 51
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt2
  mov rdx, 39
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt3
  mov rdx, 39
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt4
  mov rdx, 39
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt5
  mov rdx, 39
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt6
  mov rdx, 39
  syscall
  mov rax, 1
  mov rdi, 1
  mov rsi, head_prnt7
  mov rdx, 39
  syscall
  ret
  ; ===============|
  ; _REPL
  ; Prints prompt by calling _show_prompt:
  ;, takes input, calls _parse:, on ret, checks for change in
  ; exit flag. If the exit flag has not been changed, then jumps to itself.
  ; ===============|
_repl:
  jmp _prompt
  ret

  ; ===============|
  ; _PROMPT
  ; Prints prompt, returns to _repl
  ; ===============|
_prompt:
  mov rax, 1
  mov rdi, 1
  mov rsi, repl_prompt
  mov rdx, 6
  syscall
  ret
;  ____  _  _  ____  ____  ____  ____  ____  ____  ____  ____  ____
; (_  _)( \( )(_  _)( ___)(  _ \(  _ \(  _ \( ___)(_  _)( ___)(  _ \
;  _)(_  )  (   )(   )__)  )   / )___/ )   / )__)   )(   )__)  )   /
; (____)(_)\_) (__) (____)(_)\_)(__)  (_)\_)(____) (__) (____)(_)\_)
; ===============|
; _PARSE
; Parses array of input code, fills registry and data, then returns to
; either _REPL or _RUN
; ===============|
_parse:
  ret
