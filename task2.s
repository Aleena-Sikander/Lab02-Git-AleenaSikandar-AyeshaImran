.text
.globl main
main:
    li x20, 2
    li x22, 1
    li x23, 2

    li x10, 1
    li x11, 2
    li x12, 3
    li x13, 4

    label1: 
        add x21, x22, x23
        beq x0, x0, Exit

    label2: 
        sub x21, x22, x23
        beq x0, x0, Exit

    label3:
        mul x21, x22, x23
        beq x0, x0, Exit

    label4:
        div x21, x22, x23
        beq x0, x0, Exit
    
    beq x20, x10, label1
    beq x20, x11, label2
    beq x20, x12, label3
    beq x20, x13, label4
    
    bne x20, x10, Else
    bne x20, x11, Else
    bne x20, x12, Else
    bne x20, x13, Else

Else: li x21, 0
Exit: 

end:
    j end


    