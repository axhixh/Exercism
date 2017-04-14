open Core.Std

let to_int_list s = 
  let to_int c = Char.to_int c - Char.to_int '0' in
  let rec aux acc = function
    | [] -> Some acc
    | h::tl when Char.is_digit h -> aux ((to_int h) :: acc) tl
    | h::tl when h = ' ' -> aux acc tl
    | _ -> None
  in
  aux [] (String.to_list_rev s)

let double i n = 
  let single_digit n = if n > 9 then n - 9 else n in
  match i mod 2 with
  | 0 -> n
  | _ -> single_digit (n * 2)

let valid s = 
  s
  |> to_int_list
  |> Option.value_map ~default:false ~f:(fun x -> 
      if List.length x < 2 then 
        false
      else
        x
        |> List.rev 
        |> List.mapi ~f:double
        |> List.fold ~init:0 ~f:(+)
        |> (fun x -> x mod 10 = 0))
