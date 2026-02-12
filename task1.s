.text
.globl main
main:
    addi sp, sp, -8       
    sw x11, 4(sp)         
    sw x12, 0(sp)         

    li x7, 5 #n
    addi x10, x7, 1 # n +1
    li x11, 1  # result
    li x12, 1  # i

Loop:
    mul x11, x11, x12  # result *= i
    addi x12, x12, 1   # i++
    bge x12, x10, Exit # if i > n, exit loop
    j Loop

Exit:
    li x10, 1             
    addi x11, x11, 0  
    ecall

    lw x12, 0(sp)         
    lw x11, 4(sp)         
    addi sp, sp, 8        

end:
    j end
