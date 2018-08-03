module Accumulate

let accumulate<'a, 'b> (func: 'a -> 'b) (input: 'a list): 'b list =
  let rec helper inlist outlist =
    match inlist with
    | [] -> outlist
    | h::rest -> helper rest (outlist @ [(func h)])
  helper input []
