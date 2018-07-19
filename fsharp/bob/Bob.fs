module Bob

let response(input : string) = 
    let trimmed = input.Trim()
    let empty = trimmed = ""
    let shout = trimmed = trimmed.ToUpper() && trimmed <> trimmed.ToLower()
    let question = trimmed.EndsWith "?"
    if empty then "Fine. Be that way!"
    elif shout && question then "Calm down, I know what I'm doing!"
    elif shout then "Whoa, chill out!"
    elif question then "Sure."
    else "Whatever."