(** Rna-transcription exercise *)

type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let rec to_rna dna_list =
  let transform n = match n with
    | `A -> `U
    | `T -> `A
    | `C -> `G
    | `G -> `C in
  match dna_list with
  | [] -> []
  | h::t -> transform h :: to_rna t
