(*
Author : AlexLusitania
Version : 1.0
Date : 07/01/2014
Description : In a given 20x20 grid, what is the greatest product of four adjacent numbers in the same direction (up, down, left, right or diagonally) in the 20x20 grid ?
*)

(* First step : reading the file given containing the 20x20 grid and make a matrix out of it *)
let file = open_in "grid.txt";;
let str = input_line file;;
let characters_read = input file str 30 2;;
print_string str;;
