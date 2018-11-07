lw $t1,4($gp) #variavel A
lw $t2,8($gp) #variavel B
blt $t1,$zero,loopNegativo

loopPositivo:
beq $t1,$zero,FIM
add $t3,$t3,$t2
addi $t1,$t1,-1
j loopPositivo

loopNegativo:
beq $t1,$zero,FIM
sub $t3,$t3,$t2
add $t1,$t1,1
jal loopNegativo

FIM:
sw $t3,0($gp)
