(*
Author : AlexLusitania
Version : 1.0
Date : 07/01/2014
Description : In a given 20x20 grid, what is the greatest product of four adjacent numbers in the same direction (up, down, left, right or diagonally) in the 20x20 grid ?
*)

(* First step : reading the file given containing the 20x20 grid and make a matrix out of it *)
let file = open_in "grid.txt";;

(* Create a list according to a given line of numbers (of size x) separated by a space *)
let createList line x =
	let rec local acc i = match i with
	| i when i>=(String.length line) -> acc
	| _ -> local (List.append acc [int_of_string(String.sub line i x)]) (i+x+1)
	in local [] 0;;

(* Create a matrix xy from the given data (file) with numbers of size n *)
let createMatrix data x y n_size =
	let rec local acc i = match i with
	| i when i>=y -> acc
	| _ -> local ( (createList (input_line data) n_size)) (i+1)
	in local [] 0;;
