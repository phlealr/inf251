lw $t1,0($gp)
lw $t2, 4($gp)
lw $t3, 8($gp)
li $t8,1
loop:
slt $t4,$t2,$t1
beq $t4,$zero,t2maiorqt1
addi $t5,$t1,0
addi $t1,$t2,0
addi $t2,$t5,0
t2maiorqt1:
slt $t5,$t3,$t2
beq $t5,$zero,t3maiorqt2
addi $t5,$t3,0
addi $t3,$t2,0
addi $t2,$t5,0
jal loop
t3maiorqt2:
beq $t4,$zero,fim
jal loop
fim:
sw $t1,0($gp)
sw $t2,4($gp)
sw $t3,8($gp)