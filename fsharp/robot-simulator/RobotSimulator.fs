module RobotSimulator

type Direction = North | East | South | West
type Position = int * int

type Robot = { direction: Direction; position: Position }

let create direction position = {direction = direction; position = position}

let turnLeft robot =
    match robot.direction with
    | North -> create Direction.West robot.position
    | East -> create Direction.North robot.position
    | South -> create Direction.East robot.position
    | West -> create Direction.South robot.position

let turnRight robot =
    match robot.direction with
    | North -> create Direction.East robot.position
    | East -> create Direction.South robot.position
    | South -> create Direction.West robot.position
    | West -> create Direction.North robot.position

let advance robot =
    let x,y = robot.position
    match robot.direction with
    | North -> create Direction.North (x, (y + 1))
    | East -> create Direction.East ((x + 1), y)
    | South -> create Direction.South (x, (y - 1))
    | West -> create Direction.West ((x - 1), y)

let instructions (instructions':string) robot =
    let processInstruction robot step =
        match step with
        | 'L' -> turnLeft robot
        | 'R' -> turnRight robot
        | 'A' -> advance robot
        | _ -> failwith "Invalid instruction"
    instructions'.ToCharArray ()
    |> Array.fold processInstruction robot