module Clock

let create hours minutes =
    let minutesInDay = 24 * 60
    let minutesPastMidnight = ((hours * 60 + minutes) % minutesInDay + minutesInDay) % minutesInDay
    ((minutesPastMidnight / 60) % 24, minutesPastMidnight % 60)

let add minutes clock =
    let h, m = clock
    create h (m + minutes)

let subtract minutes clock =
    let h, m = clock
    create h (m - minutes)

let display clock =
  let h,m = clock
  sprintf "%02i:%02i" h m