open Core.Std

(* Count the number of times the nucleotide occurs in the string. *)
let count dna n = String.count dna ~f:(fun c -> c = n)

(* Count the nucleotides in the string. *)
let nucleotide_counts dna =
  let put m n =
    match count dna n with
    | 0 -> m
    | x -> Map.add m ~key:n ~data:x in
  ['A'; 'C'; 'G'; 'T']
  |> List.fold ~init:Char.Map.empty ~f:put