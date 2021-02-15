.data
	fileName: .asciiz "user.txt"
	firstName: .asciiz "First Name: "
	firstNameBuffer: .space 10
	lastName: .asciiz "Last Name: "
	lastNameBuffer: .space 10
	age: .asciiz "Age: "
	ageBuffer: .space 4
	gender: .asciiz "Gender: "
	genderBuffer: .space 8
	phoneNumber: .asciiz "Phone Number: "
	phoneNumberBuffer: .space 15
	comma: .asciiz ","
	endStr:

.text
main: 	
	#User input for first name
	li $v0,4
	la $a0,firstName
	syscall
	
	li $v0,8
	la $a0,firstNameBuffer
	li $a1,10
	syscall
	
	#User input for last name
	li $v0,4
	la $a0,lastName
	syscall
	
	li $v0,8
	la $a0,lastNameBuffer
	li $a1,10
	syscall
	
	#User input for age
	li $v0,4
	la $a0,age
	syscall
	
	li $v0,8
	la $a0,ageBuffer
	li $a1,4
	syscall
	
	#User input for last name
	li $v0,4
	la $a0,gender
	syscall
	
	li $v0,8
	la $a0,genderBuffer
	li $a1,8
	syscall
	
	#User input for phone number
	li $v0,4
	la $a0,phoneNumber
	syscall
	
	li $v0,8
	la $a0,phoneNumberBuffer
	li $a1,15
	syscall
	
#open file
openFile:
	li $v0, 13
    	la $a0,fileName
    	li $a1, 1
    	li $a2, 0
    	syscall
    	move $s0, $v0
    	
#Write into file one by one
writeToFile:
	#First name 
	move $a0,$s0
    	li $v0, 15
    	la $a1, firstNameBuffer
    	li $a2, 7
    	syscall
    	
   	#comma 
	jal commaFunc
   	
    	#Last name 
    	li $v0, 15
    	la $a1, lastNameBuffer
   	li $a2, 7
    	syscall
    	
    	#comma 
	jal commaFunc
    	
    	#age 
    	li $v0, 15
    	la $a1, ageBuffer
    	li $a2, 2
    	syscall
    	
    	#comma 
	jal commaFunc
    	
    	#Gender 
    	li $v0, 15
    	la $a1, genderBuffer
    	li $a2, 6
    	syscall
    	
    	#comma 
	jal commaFunc
    	
    	#Phone number 
    	li $v0, 15
    	la $a1, phoneNumberBuffer
    	li $a2, 15
    	syscall
    	
#Close the file
closeFile:
    	li $v0, 16 
    	syscall
    	
#End of the program
exit:
	li $v0,10
	syscall
	
#comma procedure
commaFunc:
	li $v0, 15 #15 is to write into file
    	la $a1, comma 
    	#la $a2, endStr
    	#la $a3, comma
    	#subu $a2, $a2, $a3
    	syscall
   	jr $ra #return the address
