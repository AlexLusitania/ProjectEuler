(*
Author : Alexandre Gomes
Version : 1.0
Date : 04/04/2014
Description : Starting at the top left corner of a 2x2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner. How many routes are there through a 20x20 grid ?
*)

(* Naive way - How many routes are there through a x*y grid *)
let nb_routes_naive x y =
	let rec local c x y =
		let (a,b) = c in
			if a = x && b = -y then 1
			else if a > x then 0
				 else if b < -y then 0
				 	  else (local (a+1,b) x y) + (local (a,b-1) x y)
	in local (0,0) x y;;

(* Mathematical formula (combinatorics) -
How many routes are there through a x*x grid *)
let nb_routes x =
	let rec local i x acc =
		if i = 20 then acc
		else local (i+1) x ((acc * ((2*x)-i))/(i+1))
	in local 0 x 1;;

print_string (string_of_int (nb_routes 20) ^ "\n");;
