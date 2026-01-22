.text
.globl main
main:
    li x20, 10 #k 
    li x25, 0x200
    Loop: slli x10, x22, 2
        lw x7, 0(x10) 
        sw x7, 0(x10) 
        add x23, x23, x7
        sw x23, 0(x25)
        add x25, x10, x25
        addi x22, x22, 1
        beq x20, x22, Exit
        beq x0, x0, Loop
    Exit:
end:
    j end