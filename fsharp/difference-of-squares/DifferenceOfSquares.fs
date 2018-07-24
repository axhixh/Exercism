module DifferenceOfSquares

let squareOfSum number = [1..number] |> List.sum |> (fun x -> x * x)

let sumOfSquares number = [1..number] |> List.sumBy (fun x -> x * x)

let differenceOfSquares number = squareOfSum number - sumOfSquares number