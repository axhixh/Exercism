open Core.Std

module I = Int64

let factors_of n = 
  let rec aux acc i = function
    | n when n <= 1L -> acc
    | n when (I.rem n i) = 0L -> aux (i :: acc) i (I.(/) n i)
    | n -> aux acc (I.succ i) n
  in
  aux [] 2L n |> List.rev