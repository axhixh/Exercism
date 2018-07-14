open Core.Std

let balance r b = function
  |hd::tl when hd = b -> (tl, r)
  |_ as a -> (a, false)

let are_balanced s = s 
                     |> String.fold 
                       ~init:([],true)
                       ~f:(fun (stk, r) c -> match c with
                           | '[' | '{' | '(' as b -> (b :: stk, r)
                           | ']' -> balance r '[' stk 
                           | '}' -> balance r '{' stk 
                           | ')' -> balance r '(' stk 
                           | _ -> (stk, r))   
                     |> (fun (stk, r) -> stk = [] && r)
