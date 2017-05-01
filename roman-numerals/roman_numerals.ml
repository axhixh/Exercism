
let to_roman n = 
  let rec aux acc n =
    if n >= 1000 then 
      aux (acc ^ "M") (n - 1000)
    else if n >= 900 then
      aux (acc ^ "CM") (n - 900)
    else if n >= 500 then
      aux (acc ^ "D") (n - 500)
    else if n >= 400 then
      aux (acc ^ "CD") (n - 400)
    else if n >= 100 then
      aux (acc ^ "C") (n - 100)
    else if n >= 90 then
      aux (acc ^ "XC") (n - 90)
    else if n >= 50 then
      aux (acc ^ "L") (n - 50)
    else if n >= 40 then
      aux (acc ^ "XL") (n - 40)
    else if n >= 10 then
      aux (acc ^ "X") (n - 10)
    else if n >= 9 then
      aux (acc ^ "IX") (n - 9)
    else if n >= 5 then
      aux (acc ^ "V") (n - 5)
    else if n >= 4 then
      aux (acc ^ "IV") (n - 4)
    else if n > 0 then
      aux (acc ^ "I") (n - 1)
    else 
      acc in
  aux "" n
