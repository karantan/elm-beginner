module UserInput exposing (main)

import Browser exposing (sandbox)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Browser.sandbox { init = init, view = view, update = update }



-- Model


type alias Model =
    { user_text : String }


init : Model
init =
    { user_text = "" }


type Msg
    = Text String



-- Update


update : Msg -> Model -> Model
update msg umodel =
    case msg of
        Text txt ->
            { umodel | user_text = txt }


renderText : Model -> Html Msg
renderText { user_text } =
    let
        ( size, color ) =
            if String.length user_text > 9 then
                ( "7em", "goldenrod" )

            else
                ( "10em", "indianred" )
    in
    div [ style "fontSize" size, style "color" color ] [ text user_text ]



-- View


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Type text here", onInput Text ] []
        , renderText model
        ]
