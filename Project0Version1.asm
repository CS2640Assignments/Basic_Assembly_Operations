# CS 2640.01
# October 20, 2023

# Task 1: User Input and Output

# In this task, you will practice getting user input, moving them to registers, and printing them back to the user. 
# Below are the specific requirements for this task:

# Use "main: " label for this task
# Get 2 int values from the user
# The two user values should be held in registers $s0 and $s1, respectively
# Output the user inputs in the "Run I/O" section in MARS environment back to the user

# Task 2: Arithmetic Operation Practice

# Using the user input values in registers $s0 and $s1, write MIPS Assembly code to complete the arithmetic operations below:

# add two values (use instruction "add")
# subtract two values (use instruction "sub")
# multiply two values (use instruction "mul")
# divide two values (use instruction "div")
# Output the arithmetic results in the "Run I/O" section in MARS environment back to the user

# Task 3: Conditions

# In this final task, you will practice how to do conditions in Assembly:

# If the two user inputs from Task 1 are equal to each other, output "User inputs are the same"
# If the two user inputs from Task 1 are not equal to each other, output "User inputs are different"

.data
prompt1: .asciiz "Please enter the first integer: "
prompt2: .asciiz "Please enter the second integer: "
equalNums: .asciiz "User inputs are the same"
differentNums: .asciiz "User inputs are different"
adding: .asciiz "The sum is "
subtracting: .asciiz "The difference is "
multiplying: .asciiz "The product is "
dividing: .asciiz "The quotient is "
newline: .asciiz "\n"
userData: .asciiz "The user entered: "
.data


.text
main:
	# Create a prompt to have the user input the first number
	li $v0, 4
	la $a0, prompt1
	syscall
	# Get the first int from the user
	li $v0, 5
	syscall
	move $s0, $v0
	# Create prompt for second number input
	li $v0, 4
	la $a0, prompt2
	syscall
	# Get second int
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 4
	la $a0, userData
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, userData
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	
	## Ideally, Create two instances of $v0, moving it to $s0 and $s1, respectively, then
	## have the functions be done in these below and printed
	
addition:
	# Add $s1 and $s0
	add $t0, $s1, $s0 # store result in temporary register t0
	
	li $v0, 4 # print string instruction 
	la $a0, adding # load string into argument a0 for printing 
	syscall # execute print string instruction
	
	li $v0, 1 # print integer instruction 
	move $a0, $t0 # move result from temporary register t0 into argument a0 for printing 
	syscall # execute print integer instruction 
	
	li $v0, 4 # print newline instruction 
	la $a0, newline # load address of newline character into argument a0 for printing 
	syscall # execute print newline instruction 
	
	j subtraction
	
subtraction:
	# Subtract $s1 from $s0
	sub $t1, $s0, $s1 # store result in temporary register t1
	
	li $v0, 4 # print string instruction 
	la $a0, subtracting # load string into argument a0 for printing 
	syscall # execute print string instruction
	
	li $v0, 1 # print integer instruction 
	move $a0, $t1 # move result from temporary register t1 into argument a0 for printing 
	syscall # execute print integer instruction 
	
	li $v0, 4 # print newline instruction 
	la $a0, newline # load address of newline character into argument a0 for printing 
	syscall # execute print newline instruction 
	
	j multiplication
	
multiplication: 
	# Multiply $s1 and $s0
	mul $t2, $s1, $s0 # store result in temporary register t2
	
	li $v0, 4 # print string instruction 
	la $a0, multiplying # load string into argument a0 for printing 
	syscall # execute print string instruction
	
	li $v0, 1 # print integer instruction 
	move $a0, $t2 # move result from temporary register t2 into argument a0 for printing 
	syscall # execute print integer instruction 
	
	li $v0, 4 # print newline instruction 
	la $a0, newline # load address of newline character into argument a0 for printing 
	syscall # execute print newline instruction 
	
	j division
	
division: 
	# Divide $s1 from $s0
	divu $t3,$s1,$s0 # store result in temporary register t3
	
	li $v0, 4 # print string instruction 
	la $a0, dividing # load string into argument a0 for printing 
	syscall # execute print string instruction
	
	li $v0, 1 # print integer instruction 
	move $a0,$t3 # move result from temporary register t3 into argument a0 for printing 
	syscall # execute print integer instruction 
	
	li $v0, 4 # print newline instruction 
	la $a0, newline # load address of newline character into argument a0 for printing 
	syscall # execute print newline instruction 
	
	j exit
	
exit:
	# Create an exit program syscall
	li   $v0,10      # syscall code for exit (10)
	syscall          # call operating system to perform operation


