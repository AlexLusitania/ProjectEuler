(*
Author : Alexandre Gomes
Version : 1.0
Date : 07/01/2014
Description : A pythagorean triplet is a set of three natural numbers, a<b<c, for which, a^2 + b^2 = c^2. For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2. There exists exactly one Pythagorean triplet for which a+b+c = 1000. Find the product abc.
*)

(* Euclid's formula is a fundamental formula for generating Pythagorean triples given an arbitrary pair of positive integers given an arbitrary pair of positive integers m and n with m > n. The formula states that the integers a = m^2 - n^2, b = 2mn, c= m^2 + n^2 *)
let euclid_formula m n =
	if (m>n) then [m*m - n*n; 2*m*n; m*m + n*n]
	else invalid_arg "m as to be superior to n";;

let list_sum list_ =
	let rec local i res = match i with
	| i when i>=List.length list_ -> res
	| _ -> local (i+1) (res + (List.nth list_ i))
	in local 0 0;;

let list_prod list_ =
	let rec local i res = match i with
	| i when i>=List.length list_ -> res
	| _ -> local (i+1) (res * (List.nth list_ i))
	in local 0 1;;

let triplet sum =
	let rec local i j = 
	let euc = euclid_formula i j in
	let euc_sum = list_sum euc in
	match i,j with
	| i,j when euc_sum = sum -> list_prod euc
	| _ -> if (euc_sum > sum) then local (j+2) (j+1) else local (i+1) j
	in local 2 1;;

triplet 1000;;
