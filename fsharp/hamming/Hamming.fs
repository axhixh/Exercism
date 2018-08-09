module Hamming

let distance (strand1: string) (strand2: string): int option =
  if strand1.Length <> strand2.Length then
    None
  else
    let s1 = strand1.ToCharArray ()
    let s2 = strand2.ToCharArray ()
    let count a n1 n2 = if n1 <> n2 then a + 1 else a
    Array.fold2 count 0 s1 s2 |> Some