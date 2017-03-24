open Core.Std

(* Count the number of times the nucleotide occurs in the string. *)
let count dna n = String.count dna ~f:(fun c -> c = n)

(* Count the nucleotides in the string. *)
let nucleotide_counts dna =
  let inc m c = Char.Map.update m c ~f:(function
      | None ->  1
      | Some v -> v + 1) in
  String.fold dna ~init:Char.Map.empty ~f:inc

(* iterates the string 4 times
   let nucleotide_counts dna =
   ['A'; 'C'; 'G'; 'T']
   |> List.map ~f:(fun c -> (c, count dna c))
   |> List.filter ~f:(fun (_, v) -> v > 0)
   |> Char.Map.of_alist_exn
*)