(*
Author : Alexandre Gomes
Version : 1.0
Date : 25/10/2013
Description : ProjectEuler - Problem 5 - Smallest multiple - 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder. What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20 ?
*)

(* Return true if the given number (n) is evenly divisible by all of the numbers from x to y *)
let is_divisible n x y =
	let rec local i = match i with
	| i when i>y -> true
	| _ -> if (n mod i = 0) then local (i+1) else false
	in local x;;

(* Give the smallest positive number that is evenly divisible by all of the numbers from x to y *)
let smallest_multiple x y =
	let rec local i =
	if (is_divisible i x y) then i
	else local (i+y)
	in local y;;

print_string (string_of_int (smallest_multiple 1 20) ^ "\n");;
