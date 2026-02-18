.text
.globl main

main:
    addi x10, x0, 0x100  #base address of array
    addi x11, x0, 4 #size of array

    #initializing array 
    addi x12, x0, 3
    sw x12, 0(x10) 

    addi x12, x0, 6
    sw x12, 4(x10) 

    addi x12, x0, 9
    sw x12, 8(x10)

    addi x12, x0, 1
    sw x12, 12(x10) 

    #null condition check 
    beq x10, x0, exit
    beq x11, x0, exit

    addi x13, x0, 0 #i = 0

outerloop:

    bge x13, x11, exit #if i >= len, exit
    addi x14, x13, 0 #j = i

innerloop:

    bge x14, x11, next_i #if j >= len, go to next i

    slli x15, x13, 2 #x15 = i * 4
    add x15, x10, x15 #&a[i]

    slli x16, x14, 2 # x16 = j * 4
    add x16, x10, x16 #&a[j]

    lw x17, 0(x15) #x17 = a[i]
    lw x18, 0(x16)  #x18 = a[j]

    bge x17, x18, no_swap #if a[i] >= a[j], no swap

    #swapping a[i] and a[j]
    addi x19, x17, 0 #temp = a[i]
    sw x18, 0(x15) #a[i] = a[j]
    sw x19, 0(x16) #a[j] = temp

no_swap:

    addi x14, x14, 1 #j++
    j innerloop

next_i:

    addi x13, x13, 1 #i++
    j outerloop

exit:
