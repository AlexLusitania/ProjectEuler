(*
Author : Alexandre Gomes
Version : 1.0
Date : 18/10/2013
Description : ProjectEuler - Problem 2 - Each terms in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be : 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ... By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms
*)

(* Create a Fibonacci sequence of a given size *)
let fibonacci size =
	let rec local size aux x y = match size with
	| 0 -> aux
	| _ -> local (size-1) (List.append aux ((x+y)::[])) y (x+y)
	in local (size-2) [1;2] 1 2;;

(* Find the sum of the even-valued terms *)
let sum_fibo =
	let rec local sum x y =
	let newelem = (x+y) in
	if (newelem >= 4000000) then sum
	else 
		if (newelem mod 2=0) then local (sum + newelem) y newelem
		else local sum y newelem
	in local 2 1 2;;

(* SOLVED ! *)