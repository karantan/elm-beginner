module HelloThree exposing (main)

import Debug exposing (toString)
import Html exposing (..)


checkStatus : Int -> String
checkStatus status =
    if status == 200 then
        "You go it, dude!"

    else if status == 404 then
        "Page not found"

    else
        "Unknown response"


statusChecks : List String
statusChecks =
    [ checkStatus 200
    , checkStatus 404
    , checkStatus 418
    ]


main =
    statusChecks
        |> toString
        |> text
