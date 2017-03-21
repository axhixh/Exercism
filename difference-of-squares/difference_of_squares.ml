open Core.Std

(* Square the sum of the numbers up to the given number *)
let square_of_sum n = 
  List.range 1 (n + 1)
  |> List.fold ~init:0 ~f:(fun acc x -> acc + x)  
  |> (fun x -> x * x)

(* Sum the squares of the numbers up to the given number *)
let sum_of_squares n =
  List.range 1 (n + 1)
  |> List.fold_left  ~init:0 ~f:(fun acc x -> acc + (x * x)) 

(* Subtract sum of squares from square of sums *)
let difference_of_squares n = square_of_sum n - sum_of_squares n