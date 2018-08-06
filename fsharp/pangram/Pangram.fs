module Pangram

let isPangram (input: string): bool =
  let upper = (input.ToUpper ()).ToCharArray ()
  let contains c =
    match Array.tryFindIndex (fun u -> c = u) upper with
    | Some x -> true
    | None -> false
  List.forall contains ['A'..'Z']