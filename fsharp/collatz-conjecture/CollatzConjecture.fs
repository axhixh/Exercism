module CollatzConjecture

let steps(number : int) : int option = 
    let rec helper n step = 
        match n with
        | n when n < 1 -> None
        | 1 -> Some step
        | n when n % 2 = 0 -> helper (n / 2) (step + 1)
        | _ -> helper (n * 3 + 1) (step + 1)
    helper number 0