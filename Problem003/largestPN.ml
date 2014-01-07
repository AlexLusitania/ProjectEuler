(*
Author : Alexandre Gomes
Version : 1.0
Date : 21/10/2013
Description : ProjectEuler - Problem 3 - Largest Prime factor - The prime factors of 13195 are 5, 7, 13 and 29. What is the largest factor of the number 600851475143
*)

let largest_factor =
	let rec local number res i =
	if (res > number) then res
	else if (number mod i = 0) then local (number/i) i (i+1)
		 else local number res (i+1)
	in local 600851475143 1 1;;
