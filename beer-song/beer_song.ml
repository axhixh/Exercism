open Core.Std

let verse = function
  | 0 -> "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n" 
  | 1 -> "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  | 2 -> "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  | x -> (string_of_int x) ^ " bottles of beer on the wall, " ^
         (string_of_int x) ^ " bottles of beer.\nTake one down and pass it around, " ^
         (string_of_int (x - 1)) ^ " bottles of beer on the wall.\n" 

let lyrics ~from:f ~until:u =
  let rec aux acc = function
    | c when c < u -> acc
    | c -> let acc = if acc = "" then verse c else acc ^ "\n" ^ verse c in
      aux acc (c - 1) in
  aux "" f

