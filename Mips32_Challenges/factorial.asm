#set $a0 = 5
#set $t2 = 1
#set $t1 = 1

loop:
  beq $a0, $t1, end_loop
  mult $t2, $a0
  mflo $t2
  addi $a0, $a0, -1
  j loop
end_loop:
  #show $t2