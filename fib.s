#Calculates the fibonacci number of n, where n is some integer >= 0.
#Assumes fib(1) = 1, fib(2) = 1
#Author: Nate Norris (github.com/nwnorris)
#Date: 11/12/18

.global fib

.text

#Check for base case, jump to loop if necessary
fib:
	#Fib(1) and Fib(2) are constant. Return 1 in those cases.
	cmp $2, %rdi
	jle base_case
	#rdi is > 2, so we calculate fib
	mov %rdi, %rcx
	sub $2, %rcx #we have 2 base cases we don't iterate on -- so our counter needs to be n-2.
	mov $1, %r8
	mov $1, %r9
	jnz fib_calculate #I always want to jump to fib_calculate at this point
base_case:
	mov $1, %rax #Base case -- return 1.
	ret
fib_calculate: #Iteratively calculate fib(n) where n > 2
	#Add r8 to r9, save old r9 as new r8, repeat.
	push %r9
	add %r8, %r9
	pop %r8
	dec %rcx
	jnz fib_calculate
	#we are done!
	mov %r9, %rax
	ret

