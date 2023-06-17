.data
.text
.global drawJuliaSet
drawJuliaSet :
    stmfd sp!, {lr}

    ldmfd sp!, {lr}
    mov pc, lr
.end
