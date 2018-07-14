let roman_list = [
  (1000, "M");
  (900, "CM");
  (500, "D");
  (400, "CD");
  (100, "C");
  (90, "XC");
  (50, "L");
  (40, "XL");
  (10, "X");
  (9, "IX");
  (5, "V");
  (4, "IV");
  (1, "I")]

let to_roman n = 
  let rec aux acc n = function
    |[] -> acc
    | (v,s)::tl as t -> if n >= v then 
        aux (acc ^ s) (n - v) t 
      else
        aux acc n tl
  in
  aux "" n roman_list