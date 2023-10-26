# CS 2640.01
# October 20, 2023
# Write a program in assembly that takes two numbers from
# A user and outputs the greater number
# 1) Prompt User to input 2 numbers
# 2) Store the Numbers
# 3) Compare the Numbers
# 4) Output the greater number

.data
prompt1: .asciiz "Please enter the first integer: "
prompt2: .asciiz "Please enter the second integer: "
equalNums: .asciiz "User inputs are the same"
differentNums: .asciiz "User inputs are different"
adding: .asciiz "The sum is "
subtracting: .asciiz "The difference is "
multiplying: .asciiz "The product is "
dividing: .asciiz "The quotient is "

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
	
	## Ideally, Create two instances of $v0, moving it to $s0 and $s1, respectively, then
	## have the functions be done in these below and printed
addition:
	# Add $s1 and $s0
	li $v0, 4
	la $a0, adding
	syscall
	
	j exit 
	
subtraction:
	# Subtract $s1 from $s0
	li $v0, 4
	la $a0, subtracting
	syscall
	
	j exit
	
multiplication: 
	# Multiply $s1 and $s0
	li $v0, 4
	la $a0, multiplying
	syscall
	
	j exit
	
division: 
	# Divide $s1 from $s0
	li $v0, 4
	la $a0, dividing
	syscall
	
	j exit
	
exit:
	# Create an exit program syscall
	li $v0, 10
	syscall
# You suck
