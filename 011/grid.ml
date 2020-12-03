(*
Author : Alexandre Gomes
Version : 1.0
Date : 07/01/2014
Updated : 02/05/2014
Description : In a given 20x20 grid, what is the greatest product of four adjacent numbers in the same direction (up, down, left, right or diagonally) in the 20x20 grid ?
*)

open String;;

(* First step : reading the file given containing the 20x20 grid and make a matrix out of it *)
let file = open_in "grid.txt";;

(* Create a array according to a given line of numbers (of size s) separated by a space *)
let createArray line s =
	let rec local acc i = match i with
	| i when i>=(length line)	-> acc
	| _							-> local (int_of_string(sub line i s)::acc) (i+s+1)
	in local [] 0;;

(* Create a matrix x*y from the given data (file) with numbers of size n *)
let createMatrix data x y n_size =
	let rec local acc i = match i with
	| i when i>=y	-> acc
	| _				-> local (createArray (input_line data) n_size::acc) (i+1)
	in local [] 0;;

open List;;

(* Take the nth vertical line of a matrix *)
let take_vertical matrix size_i n =
	let rec local acc posi m s n =
		if posi >= s then acc
		else local ((nth (nth m posi) n)::acc) (posi+1) m s n
	in local [] 0 matrix size_i n;;

let matrix = createMatrix file 20 20 2;;

(* Calculate the greatest product of four adjacent numbers in the same direction in the x*y grid *)
let calculate matrix x y =
	let rec right max posi posj m i j =
		if posi>=i then max
		else if posj>=j then right max (posi+1) 3 m i j
		else
			let l = nth m posi in
			let c = (nth l posj)*(nth l (posj-1))*(nth l (posj-2))*(nth l (posj-3)) in
			if c > max then right c posi (posj+1) m i j
			else right max posi (posj+1) m i j
	in (*right 0 0 3 matrix x y;;*)
	let rec left max posi posj m i j =
		if posi>=i then max
		else if (posj-3)<0 then left max (posi+1) (j-1) m i j
		else
			let l = nth m posi in
			let c = (nth l posj)*(nth l (posj-1))*(nth l (posj-2))*(nth l (posj-3)) in
			if c > max then left c posi (posj-1) m i j
			else left max posi (posj-1) m i j
	in (*left 0 0 (y-1) matrix x y;;*)
	let rec up max posi posj m i j =
		if posj>=j then max
		else if posi>=i then up max 3 (posj+1) m i j
		else
			let l = take_vertical m i posi in
			let c = (nth l posi)*(nth l (posi-1))*(nth l (posi-2))*(nth l (posi-3)) in
			if c > max then up c (posi+1) posj m i j
			else up max (posi+1) posj m i j
	in (*up 0 3 0 matrix x y;;*)
	let rec down max posi posj m i j =
		if posj>=j then max
		else if posi>=i then down max 3 (posj+1) m i j
		else
			let l = take_vertical m i posi in
			let c = (nth l (posi-3))*(nth l (posi-2))*(nth l (posi-1))*(nth l posi) in
			if c > max then down c (posi+1) posj m i j
			else down max (posi+1) posj m i j
	in
		max (max (max (down 0 3 0 matrix x y) (right 0 0 3 matrix x y)) (left 0 0 (y-1) matrix x y)) (up 0 3 0 matrix x y);;

calculate matrix 20 20;;
