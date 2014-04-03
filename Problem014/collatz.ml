(*
Author : Alexandre Gomes
Version : 1.0
Date : 03/04/2014
Description : The following iterative sequence is defined for the set of positive integers : n -> n/2 (n is even), n->3n+1 (n is odd). Using the rule above and starting with 13, we generate the following sequence : 13->40->20->10->5->16->8->4->2->1. It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz problem), it is thought that all starting numbers finish at 1.
Which starting number, under one million, produces the longest chain ? NB : Once the chain starts the terms are allowed to go above one million.
*)

(* n being the starting number *)
let rec chain_length n =
	if n = 1 then 1
	else if n mod 2 = 0 then 1 + chain_length (n/2)
	     else 1 + chain_length (3*n + 1);;

(* Tail recursive way *)
let rec chain_length2 n =
	let rec local n acc =
		if n = 1 then acc+1
		else if n mod 2 = 0 then local (n/2) (acc+1)
			else local (3*n + 1) (acc+1)
	in local n 0;;

(* i being the maximum number *)
let longest_chain_under n =
	let rec local n i max =
		if n = 1 then i
		else let newval = chain_length2 n in
			if newval > max then local (n-1) n newval
			else local (n-1) i max
	in local n 0 0;;
