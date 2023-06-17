.data
first:  .asciz "%d" @ static int first
second: .asciz "%d" @ static int second=0
third:  .asciz "%d" @ static int third=0
command: .asciz "%s" @ p
line: .asciz "\n"
num1:   .word 0
num2:   .word 0
num3:   .word 0
num_total: .word 0
printword:   .word 0  @for p


id_Title :
    .asciz "*****Input ID*****\n"
id_Input_Text1 :
    .asciz "** Please Enter Member 1 ID:**\n"
id_Input_Text2 :
    .asciz "** Please Enter Member 2 ID:**\n"
id_Input_Text3 :
    .asciz "** Please Enter Member 3 ID:**\n"
id_Command :
    .asciz "** Please Enter Command **\n"
id_Summation :
    .asciz "*****Print Team Member ID and ID Summation*****\n"
id_SumAns:
    .asciz "ID Summation = %d\n"
id_EndPrint :
    .asciz "*****End Print*****\n"
id_Error:
    .asciz "*****Error!!! Please Enter p*****\n"
.text

.global start_id
start_id :
    stmfd sp!, {lr}
    ldr r0, =id_Title
    bl printf
    @input first number
    ldr r0, =id_Input_Text1
    bl printf
    ldr r0, addr_first
    ldr r1, addr_num1
    bl scanf
    ldr r7, addr_num1
    ldr r7, [r7]

    @input second number
    ldr r0, =id_Input_Text2
    bl printf
    ldr r0, addr_first
    ldr r1, addr_num2
    bl scanf
    ldr r8, addr_num2
    ldr r8, [r8]

    @input third number
    ldr r0, =id_Input_Text3
    bl printf
    ldr r0, addr_first
    ldr r1, addr_num3
    bl scanf
    ldr r9, addr_num3
    ldr r9, [r9]

    @check input is it "p"
loop:
    ldr r0, =id_Command
    mov r1, #0
    bl printf
    ldr r0, addr_command
    ldr r1, addr_printword
    bl scanf
    ldr r1, addr_printword
    ldr r1, [r1]
    cmp r1, #112
    beq done
    ldr r0, =id_Error
    mov r1, #0
    bl printf
    b loop

done:
    ldr r0, =id_Summation
    bl printf

    ldr r0, addr_first
    mov r1, r7

    bl printf
    ldr r0, =line
    bl printf


    ldr r0, addr_first
    mov r1, r8
    bl printf
    ldr r0, =line
    bl printf


    ldr r0, addr_first
    mov r1, r9
    bl printf
    ldr r0, =line
    bl printf


    ldr r0, =id_SumAns
    add r1, r7, r8
    add r1, r1, r9
    mov r10, r1
    bl printf
    ldr r0, =line
    bl printf
    ldr r0, =id_EndPrint
    bl printf

    mov r0, #0
    ldmfd sp!, {lr}
    stmfd sp!, {r7-r10}
    mov pc, lr
addr_first: .word first
@addr_second: .word second
@addr_third: .word third
addr_command: .word command @"%s"
addr_num1: .word num1
addr_num2: .word num2
addr_num3: .word num3
addr_printword: .word printword
.end
