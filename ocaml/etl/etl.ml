open Core.Std

let transform scrabble_points =
  scrabble_points
  |> List.concat_map  ~f:(fun (point, chars) -> 
      List.map chars ~f:(fun c -> ((Char.lowercase c), point)))
  |> List.sort ~cmp:(fun (l, _) (r, _) -> Char.to_int l - Char.to_int r)
