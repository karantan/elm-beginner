module ArchitectedHello exposing (Mesg(..), Model, main, model, update, view)

import Browser exposing (sandbox)
import Html exposing (Attribute, Html, button, div, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = model, view = view, update = update }



-- This is what our model should look like


type alias Model =
    { text : String }


model : Model
model =
    { text = "Hello World" }



-- Only one kind of message


type Mesg
    = Tekst



-- Update function only has to worry about one possible case


update : Mesg -> Model -> Model
update msg umodel =
    case msg of
        Tekst ->
            { umodel | text = umodel.text ++ "!" }



-- View


view : Model -> Html Mesg
view vmodel =
    div []
        [ div [ style "color" "teal", style "fontSize" "2em" ] [ text vmodel.text ]
        , button [ onClick Tekst ] [ text "Add exclamation mark" ]
        ]
