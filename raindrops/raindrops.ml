let raindrop n =
  [(3, "Pling"); (5, "Plang"); (7, "Plong")]
  |> List.fold_left (fun acc (i, s) -> if n mod i = 0 then acc ^ s else acc) ""
  |> (fun s -> if s = "" then string_of_int n else s)

(*
let raindrop n =
  let result = (if n mod 3 = 0 then "Pling" else "") ^
               (if n mod 5 = 0 then "Plang" else "") ^
               (if n mod 7 = 0 then "Plong" else "") in
  if result = "" then string_of_int n else result;;
*)