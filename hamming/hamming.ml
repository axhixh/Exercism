open Core.Std

type nucleotide = A | C | G | T

let hamming_distance l1 l2 =
    match List.zip l1 l2 with
    | None -> None
    | Some z -> Some (List.count z ~f:(fun (n1,n2) -> n1 <> n2)) 