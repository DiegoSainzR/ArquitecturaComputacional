# Autor: Diego Sainz Ruvalcaba
# Fecha: 20/abr/23

.text
inicio:
	addi s0, zero, 0x7ff
	lui t0, 0x10010
	addi t1, zero, 0x1

	sw s0, 0(t0)
	sw s0, 8(t0)

	lw s1, 0(t0)
	lw s2, 8(t0)
	jal ra, funcion

prueba1:
	beq zero, zero, prueba2
	addi t1, zero, 2

prueba2:
	bne zero, t0, prueba1
	addi t1, zero, 1

funcion:
	addi s0, s0, 2
	jalr zero, ra, 0