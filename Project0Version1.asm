# CS 2640.01
# October 20, 2023
# Authors: Damian Varela and Joshua Estrada
# Github Repo Link: https://github.com/CS2640Assignments/Basic_Assembly_Operations

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
	
	# Echo prompt that shows what the user entered
	li $v0, 4
	la $a0, userData
	syscall
	
	# Calls the int saved in $s0 into $a0
	li $v0, 1
	move $a0, $s0
	syscall
	
	# Prints a new line
	li $v0, 4
	la $a0, newline
	syscall
	
	# Prints the echo prompt again
	li $v0, 4
	la $a0, userData
	syscall
	
	# Moves number from $s1 into $a0 to call it
	li $v0, 1
	move $a0, $s1
	syscall
	
	## Creates 2 new lines here for readability
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall	
	## Ideally, Create two instances of $v0, moving it to $s0 and $s1, respectively, then
	## have the functions be done in these below and printed
	
addition:
	# Adds both numbers into a temporary register, that gets moved into $v0 for printing the addition prompt and answer
	add $t0, $s0, $s1 
	
	li $v0, 4
	la $a0, adding
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4 
	la $a0, newline 
	syscall
	
subtraction:
	# Subtracts both numbers into a temporary register, that gets moved into $v0 for printing the addition prompt and answer
	sub $t1, $s0, $s1 
	
	li $v0, 4 
	la $a0, subtracting 
	syscall 
	
	li $v0, 1 
	move $a0, $t1
	syscall 
	
	li $v0, 4 
	la $a0, newline
	syscall 
	
multiplication: 
	# Multiplies both numbers into a temporary register, that gets moved into $v0 for printing the addition prompt and answer
	mul $t2, $s0, $s1 
	
	li $v0, 4
	la $a0, multiplying
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4 
	la $a0, newline
	syscall
	
division: 
	# Divides both numbers into a temporary register, that gets moved into $v0 for printing the addition prompt and answer
	div $t3,$s0,$s1 
	
	li $v0, 4
	la $a0, dividing
	syscall
	
	li $v0, 1
	move $a0,$t3
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall 
	
check_equal:
	
	li $v0, 4
	la $a0, newline
	syscall	

	# Compare the user inputs
	beq $s0, $s1, equal # They are equal
	bne $s0, $s1, different # They are different


equal:
	# prints out equal prompt if it ends up being equal
	li $v0, 4
	la $a0, equalNums
	syscall
	j exit

different:
	# Prints out different prompt if it ends up being not equal
	li $v0, 4
	la $a0, differentNums
	syscall
	j exit
			
exit:
	# Ends the program
	li $v0,10     
	syscall