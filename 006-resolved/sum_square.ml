(*
Author : Alexandre Gomes
Version : 1.0
Date : 06/01/2014
Description : The sum of the squares of the first ten natural numbers is : 1^2 + 2^2 + 3^2 + ... + 10^2 = 385. The square of the sum of the first ten natural numbers is, (1+2+3+...+10)^2 = 55^2 = 3025. Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025-385 = 2640. Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*)

(* Return the sum of the squares of the first x natural numbers *)
let sum_square x =
	let rec local res i = match i with
	| i when i>x -> res
	| _ -> local (res +. (i**2.)) (i+.1.)
	in local 0. 0.;;

(* Return the square of the sum of the first x natural numbers *)
let square_sum x =
	let rec local res i = match i with
	| i when i>x -> res**2.
	| _ -> local (res+.i) (i+.1.)
	in local 0. 0.;;

(* Return the difference between the sum of the squares of the first x natural numbers and the square of the sum *)
let haracho x =
	(square_sum x) -. (sum_square x);;

haracho 100.;;
