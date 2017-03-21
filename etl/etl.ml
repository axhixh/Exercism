open Core.Std

let transform scrable_points =
  scrable_points
  |> List.fold ~init:[] ~f:(fun acc (point, chars) -> 
      List.fold chars ~init:acc 
        ~f:(fun acc' c -> ((Char.lowercase c), point) :: acc'))
  |> List.sort ~cmp:(fun (l, _) (r, _) -> Char.to_int l - Char.to_int r)
