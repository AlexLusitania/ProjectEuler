(*
Author : AlexLusitania
Version : 1.0
Date : 07/01/2014
Description : Find the greatest product of five consecutive digits in the 1000-digit number.
NB : I decided to put the 1000-digit number on a separated file in order to make it easier (and funnier). 
*)

let file = open_in "number.txt";;
let number = input_line file;;

let product_str str =
	let rec local i res = match i with
	| i when (i>=String.length str) -> res
	| _ -> local (i+1) res*(int_of_string(String.sub str i 1))
	in local 0 1;;

let greatest_x_product x str =
	let rec local i res = match i with
	| i when (i+x)>(String.length str) -> res
	| _ -> if (product_str (String.sub str i x) > res) then local (i+1) (product_str (String.sub str i x)) else local (i+1) res
	in local 0 0;;
