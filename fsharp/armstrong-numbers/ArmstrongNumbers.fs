module ArmstrongNumbers

let isArmstrongNumber (number: int): bool =
  let numberOfDigits = floor (log10 (float number) + 1.0)
  let rec digits n = if n < 10 then [n] else (n % 10) :: digits (n / 10)
  let sum = digits number |> List.sumBy (fun d -> (float d) ** numberOfDigits)
  (int sum) = number