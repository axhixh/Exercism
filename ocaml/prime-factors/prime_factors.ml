open Core.Std
open Int64

let factors_of n = 
  let rec aux acc i = function
    | n when n <= 1L -> acc
    | n when n % i = 0L -> aux (i :: acc) i (n / i)
    | n -> aux acc (i + 1L) n
  in
  aux [] 2L n |> List.rev