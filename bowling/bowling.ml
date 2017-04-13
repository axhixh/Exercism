open Core.Std

type frame =
  | Strike
  | Spare of int
  | Open of int * int
  | Incomplete of int

type t = frame list

let new_game = []

let roll pins frames = match (pins, frames) with
  | 10, _ -> Strike :: frames
  | x, Incomplete y:: tl when x + y = 10 -> Spare y :: tl
  | x, Incomplete y:: tl -> Open (y,x) :: tl
  | x, _ -> Incomplete x :: frames

let to_int = function
  | Strike -> 10
  | Spare _  -> 10
  | Open (x,y) -> x + y
  | Incomplete _ -> failwith "can't score incomplete frame"

let score frames = 
  let last, last', frames = match List.length frames with
    | 12 -> let f1::f2::tl = frames in (to_int f1, to_int f2, tl)
    | 11 -> let f1::tl = frames in (0, to_int f1, tl)
    | _ -> (0,0, frames) in
  frames 
  |>List.fold ~init:(0, last, last')
    ~f:(fun (t, f1, f2) f -> match f with
        | Strike -> (t + to_int f + f1 + f2, to_int f, f1)
        | Spare x -> (t + to_int f + f1, x, f1)
        | Open (x, y) -> (t + to_int f, x, y)
        | _ -> failwith "can't score a game with incomplete frame")
  |> (fun (t, _, _) -> t)