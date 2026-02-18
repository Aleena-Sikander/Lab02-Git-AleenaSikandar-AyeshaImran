.text
.globl main

main:
    la x10, arr #load address of array into x11
    li x11, 5 #len of arr
    jal x1, bubble #call bubble sort

    j exit

bubble:
    addi sp, sp, -20 #stack space for 5 vals
    sw x1, 16(sp)
    sw x10, 12(sp) 
    sw x11, 8(sp) 
    sw x5, 4(sp) 
    sw x6, 0(sp) 

    beq x10, x0, bubbleExit #if a == null, exit
    beq x11, x0, bubbleExit #if len == 0, exit

    li x5, 0 #i = 0

outerLoop:
    bge x5, x11, bubbleExit #if i>=len then exit
    add x6, x5, x0 #j = i

innerLoop:
    bge x6, x11, nextI #if j>=len then end inner loop

    slli x7, x5, 2 
    add x7, x7, x10 #address of a[i]
    lw x8, 0(x7) 

    slli x9, x6, 2 
    add x9, x9, x10 #address of a[j]
    lw x12, 0(x9) 

    blt x8, x12, swap #if a[i] < a[j], swap
    j continueInnerLoop

swap:
    sw x12, 0(x7) #a[i] = a[j]
    sw x8, 0(x9) #a[j] = a[i]   

continueInnerLoop:
    addi x6, x6, 1 #j++
    j innerLoop

nextI:
    addi x5, x5, 1 #i++
    j outerLoop   

bubbleExit:
    lw x6, 0(sp)
    lw x5, 4(sp)
    lw x11, 8(sp)
    lw x10, 12(sp)
    lw x1, 16(sp)
    addi sp, sp, 20 #restore stack pointer
    jalr x0, 0(x1) #return to caller