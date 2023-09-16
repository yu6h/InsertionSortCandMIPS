.data
    array: .space 20
.text
    main:
        la $s0, array
        li $s1, 0 #$t1 = i = 0
        for1:
            bge $s1,5, exitFor1

            sll $t2,$s1,2 # $t3 = i*4
            add $t3, $s0,$t2
            #input int
            li $v0, 5
            syscall
            sw $v0,0($t3)
            addi $s1,$s1,1
            j for1
        exitFor1:

        move $a0,$s0
        addi $a1,$zero, 5
        jal insertionSort

        li $s1, 0 #$s1 = i = 0
        for2:
            bge $s1,5,exitFor2

            sll $t1,$s1,2 # $t1 = i*4
            add $t2, $s0,$t1  #$t2 = array[i]
            #print array[i]
            li $v0, 1
            lw $a0,0($t2)
            syscall
            #change line
            addi $a0, $0, 0xA 
            addi $v0, $0, 0xB
            syscall
            #i++
            addi $s1,$s1,1
            j for2
        exitFor2:
    
    # Tell the system that the program is done.
    li $v0, 10
    syscall

    insertionSort:
        subi $sp,$sp,12
        sw $s0,0($sp)
        sw $s1,4($sp)
        sw $s2,8($sp)

        move $s0,$a0 #$s0 = array[]

        li $s1,1 #$s1 = i = 1
        forInSort:
            bge $s1,$a1,exitForInSort

            #int current = array[i];
            sll $t0,$s1,2 #$t2 = i*4
            add $t1,$s0,$t0
            lw $s3,0($t1) # $s3 = current

            subi $s2,$s1,1 #$s2 = j = i - 1
            
            whiileInForInSort:
                #j >= 0 && array[j] > current
                blt $s2,$zero,exitWhileInForInSort
                sll $t0, $s2,2
                add $t1,$s0,$t0
                lw $t2,0($t1) # $t1 = array[j]
                ble $t2,$s3,exitWhileInForInSort

                #array[j + 1] = array[j];
                lw $t2,0($t1)
                sw $t2,4($t1)

                subi $s2,$s2,1
                j whiileInForInSort
            exitWhileInForInSort:

            add $t0,$s2,1
            #print index
            li $v0, 1
            move $a0,$t0
            syscall
            #change line
            addi $a0, $0, 0xA 
            addi $v0, $0, 0xB
            syscall

            sll $t0,$t0,2
            add $t1,$s0,$t0
            sw $s3,0($t1)

            addi $s1,$s1,1
            j forInSort
        exitForInSort:

        lw $s0,0($sp)
        lw $s1,4($sp)
        lw $s2,8($sp)
        addi $sp,$sp,12
        jr $ra
        