.data
student_Name1 :
    .asciz "Ma Chun Yuen\n"
student_Name2 :
    .asciz "Chen Yan Sheng\n"
student_Name3 :
    .asciz "Chen Bo Yi\n"
student_Team :
    .asciz "Team 12 \n"
student_Title :
    .asciz "*****Print Name*****\n"
student_Final :
    .asciz "*****End Print*****\n"
.text

.global start_name
start_name:
    push {lr}
    ldr r0, =student_Title
    bl printf
    ldr r0, =student_Team
    bl printf

    ldr r0, =student_Name1
    mov r4, r0
    bl printf
    ldr r0, =student_Name2
    mov r5, r0
    bl printf
    ldr r0, =student_Name3
    mov r6, r0
    bl printf

    ldr r0, =student_Final
    bl printf

    mov r0, #0
    pop {lr}
    mov pc,lr
.end



