(** Rna-transcription exercise *)
open Core.Std

type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let to_rna dna_list =
  let transform = function
    | `A -> `U
    | `T -> `A
    | `C -> `G
    | `G -> `C in
  List.map dna_list ~f:transform
