.data
function1 :
    .asciz "Function1 : Name\n"
function2:
    .asciz "Function2 : ID\n"
function3:
    .asciz "Main Function:\n"
main_Title:
    .asciz "*****Print ALL*****\n"
main_Team:
    .asciz "Team 12\n"
main_Sum:
    .asciz "ID Summation = %d\n"
main_Final:
    .asciz "*****End Print*****\n"
num:
    .asciz "%d"
name:
    .asciz "   %s\n"
main_Name1 :
    .asciz "   Ma Chun Yuen\n"
main_Name2 :
    .asciz "   Chen Yan Sheng\n"
main_Name3 :
    .asciz "   Chen Bo Yi\n"
.text
.global main
main:

    push {lr}
    ldr r0, =function1
    bl printf
    bl start_name

    ldr r0, =function2
    bl printf
    bl start_id

    ldr r0, =function3
    bl printf
    ldr r0, =main_Team
    bl printf
    ldr r0, =num
    mov r1, r7
    bl printf
    ldr r0, =name
    mov r1, r4
    bl printf
    ldr r0, =num
    mov r1, r8
    bl printf
    ldr r0, =name
    mov r1, r5
    bl printf
    ldr r0, =num
    mov r1, r9
    bl printf
    ldr r0, =name
    mov r1, r6
    bl printf
    ldr r0, =main_Sum
    mov r1, r10
    bl printf
    ldr r0, =main_Final
    bl printf
    mov r0, #0
    ldmfd sp!, {r7-r10}
    pop {lr}
    mov pc,lr
.end


