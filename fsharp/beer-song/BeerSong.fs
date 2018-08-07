module BeerSong

let recite (startBottles: int) (takeDown: int) =
  let generate i = match i with
                   | 0 -> ["No more bottles of beer on the wall, no more bottles of beer.";
                           "Go to the store and buy some more, 99 bottles of beer on the wall."]
                   | 1 -> ["1 bottle of beer on the wall, 1 bottle of beer.";
                           "Take it down and pass it around, no more bottles of beer on the wall."]
                   | 2 -> ["2 bottles of beer on the wall, 2 bottles of beer.";
                           "Take one down and pass it around, 1 bottle of beer on the wall."]
                   | n -> [sprintf "%d bottles of beer on the wall, %d bottles of beer." n n;
                           sprintf "Take one down and pass it around, %d bottles of beer on the wall." (n - 1)]
  [startBottles .. -1 .. (startBottles - takeDown + 1)]
  |> List.map generate
  |> List.fold (fun (r:string list) s -> if r.Length = 0 then r @ s else r @ [""] @ s ) []