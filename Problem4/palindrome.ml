(*
Author : Alexandre Gomes
Version : 1.0
Date : 21/10/2013
Description : ProjectEuler - Problem 4 - Largest palindrome product - A palindromic number reads the same both ways. The largest palindrome made from the product of two-digits is 9009 = 91 * 99. Find the largest palindrome made from the product of three-digits numbers.
*)

let inverse n =
	let rec local n res = match n with
	| 0 -> res
	| _ -> local (n/10) (res*10 + n mod 10)
	in local n 0;;

let palindrome n =
	if (inverse n = n) then true
	else false;;

let biggest_n_digits n =
	let rec local i res = match i with
	| i when i=n -> res
	| _ -> local (i+1) (res*10 + 9)
	in local 0 0;;

(* Give the biggest palindrome made from the product of two n-digits *)
let biggest_palindrome n =
	let biggest_number = biggest_n_digits n in
	let rec local x y res =
	if (x <= biggest_number/2 && y <= biggest_number/2) then res
	else
		if (y = biggest_number/2) then local (x-1) biggest_number res
		else if (palindrome (x*y) = true) then local x (y-1) (max res (x*y))
			 else local x (y-1) res
	in local biggest_number biggest_number 0;;
