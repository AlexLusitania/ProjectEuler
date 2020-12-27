(*
Author : Alexandre Gomes
Version : 1.0
Date : 07/01/2014
Description : The sum of the primes below 10 is 2+3+5+7 = 17. Find the sum of all the primes below two million.
*)

(* Tests if the given integer is a prime number using the trial division *)
let is_prime x =
	let rec local i =
		let modulo = (x mod i = 0) in
		match i with
		| i when x=1 -> false
		| i when x=2 -> true
		| i when (float_of_int i >= sqrt(float_of_int x) || modulo) -> not(modulo)
		| _ -> local (i+1)
	in local 2;;

let primes_sum x =
	let rec local acc i = match i with
	| i when i>=x -> acc
	| _ -> if(is_prime i) then local (acc+i) (i+1) else local acc (i+1)
	in local 0 2;;

print_string (string_of_int (primes_sum 2000000) ^ "\n");;
