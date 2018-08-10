module KindergartenGarden

type Plant =
  | Radishes
  | Clover
  | Grass
  | Violets

let children = ["Alice", 0; "Bob", 1; "Charlie", 2; "David", 3;
    "Eve", 4; "Fred", 5; "Ginny", 6; "Harriet", 7;
    "Ileana", 8; "Joseph", 9; "Kincaid", 10; "Larry", 11] |> Map.ofList;;

let plants (diagram:string) student =
  let toPlant c = match c with
                  | 'R' -> Plant.Radishes
                  | 'C' -> Plant.Clover
                  | 'G' -> Plant.Grass
                  | 'V' -> Plant.Violets
                  | _   -> failwith "Invalid plant type"
  diagram.Split '\n'
  |> Array.map (fun r -> r.ToCharArray () |> Seq.chunkBySize 2 |> Array.ofSeq)
  |> (fun r -> Array.fold2 (fun a p1 p2 -> a @ [Array.append p1 p2]) [] r.[0] r.[1])
  |> (fun p -> p.[children.[student]])
  |> Array.map toPlant
  |> Array.toList