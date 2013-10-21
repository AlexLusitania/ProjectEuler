(*
Author : Alexandre Gomes
Version : 1.0
Date : 21/10/2013
Description : ProjectEuler - Problem 2 - If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.
*)

let multiples3_5 =
	let rec local sum i = match i with
	| 1000 -> sum
	| _ -> if (i mod 3 = 0) || (i mod 5 = 0) then local (sum+i) (i+1)
		   else local sum (i+1)
	in local 0 0;;
