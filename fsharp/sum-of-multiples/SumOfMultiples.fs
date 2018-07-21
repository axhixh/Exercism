module SumOfMultiples

let sum numbers upperBound = 
  let isMultiple x = List.exists (fun n -> x % n = 0) numbers
  [1..(upperBound - 1)] |> List.filter isMultiple |> List.sum