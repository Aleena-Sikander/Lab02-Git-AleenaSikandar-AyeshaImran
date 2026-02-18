.text
.globl main

main:
    li x10, 5 #n=5         
    jal x1, fib #fib(n)

    add x11, x10, x0 #print result
    li x10, 1 
    ecall
    j exit

fib:
    addi sp, sp, -16 #stack space for 4 vals

    sw x1, 12(sp)
    sw x10, 8(sp)       
    sw x6, 4(sp)           
    sw x5, 0(sp)        

    #base case: if n <= 1, return n
    li x5, 1           
    ble x10, x5, baseCase  

    addi x10, x10, -1 #n-1
    jal x1, fib #fib(n-1)      
    add x6, x10, x0 #store fib(n-1) in x6
    lw x10, 8(sp) #restore og n

    addi x10, x10, -2 #n-2
    jal x1, fib #fib(n-2)
    add x10, x10, x6 #fib(n-1) + fib(n-2)

    j endFib   
    
baseCase:

endFib:
    lw x5, 0(sp)
    lw x6, 4(sp)
    lw x1, 12(sp)
    addi sp, sp, 16 #restore stack pointer
    jalr x0, 0(x1) #return to caller

exit:
    j exit    