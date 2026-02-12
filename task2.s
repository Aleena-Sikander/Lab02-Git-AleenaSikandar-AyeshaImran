.text
.globl main

main:
    li x10, 5              
    jal x1, ntri          

    add x11, x10, x0
    li x10, 1
    ecall
    j exit

ntri:
    addi sp, sp, -8       
    sw x1, 4(sp)          
    sw x10, 0(sp)          

    addi x5, x10, -1              
    bge x5, x0, sum  

    addi sp, sp, 8      
    jalr x0, 0(x1) 

sum:
    addi x10, x10, -1              
    jal x1, ntri          
    lw x6, 0(sp)          
    lw x1, 4(sp)          
    addi sp, sp, 8
    add x10, x10, x6       
    jalr x0, 0(x1)          

exit:
    j exit    