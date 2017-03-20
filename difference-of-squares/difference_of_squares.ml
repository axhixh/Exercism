let range n =
  let rec helper acc i =
    if i = 0 then 
      acc
    else
      helper (i :: acc) (i - 1) in
  helper [] n

(* Square the sum of the numbers up to the given number *)
let square_of_sum n = 
  range n
  |> List.fold_left (fun acc x -> acc + x) 0 
  |> (fun x -> x * x)

(* Sum the squares of the numbers up to the given number *)
let sum_of_squares n =
  List.fold_left (fun acc x -> acc + (x * x)) 0 (range n)

(* Subtract sum of squares from square of sums *)
let difference_of_squares n = square_of_sum n - sum_of_squares n