module Raindrops

let convert (number: int): string =
  let s = (if number % 3 = 0 then "Pling" else "") + 
          (if number % 5 = 0 then "Plang" else "") +
          (if number % 7 = 0 then "Plong" else "")
  if s = "" then string number else s