(*
Author : Alexandre Gomes
Version : 1.0
Date : 07/01/2014
Description : By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13. What is the 10 001st prime number ?
*)

let is_multiple x y =
	if x mod y = 0 then true
	else false;;

(* Simple but slow method of verifying the primality of a given number x, method called the trial division. Tests whether x is a multiple of any integer between 2 and the square root of x *)
let trial_division x =
	let rec local i = match i with
	| i when (float_of_int i >= (sqrt (float_of_int x)) || is_multiple x i) -> not(is_multiple x i)
	| _ -> local (i+1)
	in local 2;;
(*
DO NOT WORK WITH 2. I STILL HAVE TO RESOLVE THIS PROBLEM PROPERLY
*)

(* Return a list with the first x prime numbers *)
let x_primes x =
	let rec local acc i = match i with
	| i when i>x -> acc
	| _ -> if (trial_division i) then local (List.append acc [i]) (i+1) else local acc (i+1)
	in local [] 2;;

(* Return the nth prime number *)
let nth_prime n =
	let rec local p i = match p with
	| p when (p>=n) -> (i-1)
	| _ -> if(trial_division i) then local (p+1) (i+1) else local p (i+1)
	in local 1 2;;

print_string (string_of_int (nth_prime 10001) ^ "\n");;
