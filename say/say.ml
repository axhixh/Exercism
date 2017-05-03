open Core.Std
open Int64

let split n = 
  let rec aux acc = function 
    |n when n < 1000L -> n :: acc
    |n -> aux (n % 1000L :: acc) (n / 1000L)
  in
  aux [] n

let zip_scale numbers =
  List.length numbers 
  |> List.take [""; " thousand"; " million"; " billion"; " trillion"]
  |> List.rev 
  |> List.zip_exn numbers

let till_99 n =
  let number_table = [
    (90L, "ninety"); (80L, "eighty"); (70L, "seventy"); (60L, "sixty"); 
    (50L, "fifty"); (40L, "forty"); (30L, "thirty"); (20L, "twenty"); 
    (19L, "nineteen"); (18L, "eighteen"); (17L, "seventeen"); 
    (16L, "sixteen"); (15L, "fifteen"); (14L, "fourteen"); 
    (13L, "thirteen"); (12L, "twelve"); (11L, "eleven"); (10L, "ten"); 
    (9L, "nine"); (8L, "eight"); (7L, "seven"); (6L, "six"); (5L, "five"); 
    (4L, "four"); (3L, "three"); (2L, "two"); (1L, "one")] in
  let rec aux n = function 
    | (x,s)::_ when n = x -> s
    | (x,s)::tl when n > x -> s ^ "-" ^ (aux (n - x) tl)
    | (_,_):: tl -> aux n tl
    | [] -> ""
  in
  aux n number_table

let hundreds = function
  | 0L -> ""
  | n when n > 99L -> let h = n / 100L and r = n % 100L in
    till_99 h ^ " hundred" ^ (if r = 0L then "" else (" " ^ till_99 r))
  | n -> till_99 n 

let in_english = function
  | 0L -> Some "zero"
  | n when n > 999_999_999_999L || n < 0L -> None
  | n -> split n 
         |> zip_scale 
         |> List.map ~f:(fun (x,s) -> if x = 0L then "" else (hundreds x ^ s)) 
         |> List.filter ~f:(String.(<>) "")
         |> String.concat ~sep:" "
         |> Some 
