module NucleotideCount

let nucleotideCounts (strand: string): Map<char, int> option =
  let empty = [('A',0); ('C',0); ('G', 0); ('T',0)] |> Map.ofList |> Some
  let count c (m:Map<char, int>) = match m.TryFind(c) with
                                   | Some v -> Some (m.Add(c, (v + 1)))
                                   | None -> None
  strand.ToCharArray () 
  |> Array.fold (fun a c -> match a with
                            | Some m -> count c m
                            | None -> None) empty
