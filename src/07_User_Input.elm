module UserInput exposing (main)

import Browser exposing (sandbox)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Browser.sandbox { init = init, view = view, update = update }



-- Model


type alias Model =
    { text : String }


init : Model
init =
    { text = "" }


type Msg
    = Text String



-- Update


update : Msg -> Model -> Model
update msg umodel =
    case msg of
        Text txt ->
            { umodel | text = txt }


renderText : String -> Html Msg
renderText str =
    if String.length str > 9 then
        div [ style "fontSize" "2em", style "color" "indianred" ] [ text str ]

    else
        div [ style "fontSize" "5em", style "color" "sandybrown" ] [ text str ]



-- View


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Type text here", onInput Text ] []
        , renderText model.text
        ]
