open Core.Std

type base = int

let is_valid_digits b digits =
    digits <> [] && List.for_all digits ~f:(fun d -> d >= 0 && d < b)

let to_int b digits = 
  digits
  |> List.rev
  |> List.fold ~init:(0,1) ~f:(fun (n,b') d -> (n + (d * b'), b' * b)) 
  |> fst 

let from_int b n = 
  let rec aux acc = function 
    | 0 -> if acc = [] then [0] else acc
    | n -> aux ((n mod b) :: acc) (n/b) in
  aux [] n

let convert_bases ~from: f ~digits: n ~target: t = 
  if f > 1 && t > 1 && is_valid_digits f n then
    to_int f n |> from_int t |> Some
  else 
    None
