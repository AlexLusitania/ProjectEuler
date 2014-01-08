(*
Author : AlexLusitania
Version : 1.0
Date : 07/01/2014
Description : In a given 20x20 grid, what is the greatest product of four adjacent numbers in the same direction (up, down, left, right or diagonally) in the 20x20 grid ?
*)

(* First step : reading the file given containing the 20x20 grid and make a matrix out of it *)
let file = open_in "grid.txt";;
(*let str = input_line file;;
let characters_read = input file str 30 2;;
print_string str;;*)

let createMatrix data =
	let str = input_line file in
	let length = String.length str in
	let rec local acc i = match i with
	(*| i when i>(length*length) -> acc*)
	| i when i>= length -> acc
	| _ -> (* if(input file str i 2 = 2) then *) local (List.append acc [(int_of_string (String.sub str i 2))]) (i+3) (* else failwith "matrix creation fail" *)
	in local [] 0;;
