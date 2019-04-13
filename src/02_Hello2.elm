module HelloTwo exposing (main)

import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (class)


main : Html msg
main =
    div [ class "elm-div" ]
        [ h1 [ class "banner" ] [ text "Welcome to my Elm site :P" ]
        , p [] [ text "I'm liking Elm so far." ]
        , p [] [ text "Eager to learn more about Elm." ]
        ]
