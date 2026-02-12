.text
.globl main

main:
    li x10, 5 #n         
    jal x1, fib          

    add x11, x10, x0 #print result
    li x10, 1 #reset x10 to 1 for ecall
    ecall
    j exit

fib:
    addi sp, sp, -8       
    sw x1, 4(sp)           
    sw x10, 0(sp)        

    addi x5, x10, -1 #check if n <= 1           
    bge x5, x0, sum  

    addi sp, sp, 8      
    jalr x0, 0(x1) 

sum:
    addi x12, x10, -1 #fib(n-1)
    addi x13, x10, -2 #fib(n-2)
    add x10, x12, x13 #fib(n-1) + fib(n-2)             
    jal x1, fib          
    lw x6, 0(sp)           
    lw x1, 4(sp)          
    addi sp, sp, 8
    add x10, x10, x6   
    jalr x0, 0(x1)          

exit:
    j exit    