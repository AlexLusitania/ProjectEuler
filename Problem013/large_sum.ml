(*
Author : Alexandre Gomes
Version : 1.0
Date : 02/05/2014
Description : Work out the first ten digits of the one-hundred 50-digits number
*)

let file = open_in "number.txt";;

(* count the sum of the number written in string *)
let count_str str =
	let rec local acc i = 
		let len = String.length str and j = (i+1) in
		if j>=len then acc
		else local (acc + int_of_string(String.sub str i 1)) j
	in local 0 1;;


