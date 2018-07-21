module ReverseString

let rec reverse (input: string) = input.ToCharArray() |> Array.rev |> (fun c -> System.String c)