(*
Author : Alexandre Gomes
Version : 2.0
Date : 21/10/2013
Updated : 25/04/2014
Description : ProjectEuler - Problem 1 - If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.
*)

let multiples3_5 n =
	let rec local i = match i with
	| i when i=n -> 0
	| _ 		 -> if (i mod 3 = 0) || (i mod 5 = 0) then i + (local (i+1))
		   											  else local (i+1)
	in local 0;;

print_string (string_of_int (multiples3_5 1000) ^ "\n");;