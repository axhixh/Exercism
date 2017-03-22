open Core.Std

let response_for message =
  let is_question = String.is_suffix ~suffix:"?" in
  let is_shouting s = 
    String.uppercase s = s 
    && List.fold (String.to_list_rev s) 
      ~init:false 
      ~f:(fun a c -> a || Char.is_alpha c) in
  let message' = String.strip message in
  if message' = "" then
    "Fine. Be that way!"
  else if is_shouting message' then
    "Whoa, chill out!"
  else if is_question message' then
    "Sure."
  else
    "Whatever."
