module UserInput exposing (main)

import Browser exposing (sandbox)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Browser.sandbox { init = model, view = view, update = update }



-- Model


type alias Model =
    { text : String }


model : Model
model =
    { text = "" }


type Msg
    = Text String



-- Update


update : Msg -> Model -> Model
update msg umodel =
    case msg of
        Text txt ->
            { umodel | text = txt }



-- View


view : Model -> Html Msg
view vmodel =
    div []
        [ input [ placeholder "Type text here", onInput Text ] []
        , div [ style "fontSize" "3em", style "color" "sandybrown" ] [ text vmodel.text ]
        ]
