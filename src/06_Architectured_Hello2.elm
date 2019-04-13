module ArchitectedHello exposing (Mesg(..), Model, main, model, update, view)

import Browser exposing (sandbox)
import Debug exposing (..)
import Html exposing (Attribute, Html, button, div, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


main : Program () Model Mesg
main =
    Browser.sandbox { init = model, view = view, update = update }



-- This is what our model should look like


type alias Model =
    { text : String
    , size : Int
    }


model : Model
model =
    { text = "Hello World"
    , size = 1
    }



-- Only one kind of message


type Mesg
    = AddExcl
    | RemoveExcl
    | SizeUp
    | SizeDown



-- Update function only has to worry about one possible case


update : Mesg -> Model -> Model
update msg umodel =
    case msg of
        AddExcl ->
            { umodel | text = umodel.text ++ "!" }

        RemoveExcl ->
            { umodel | text = exclChecker umodel.text }

        SizeUp ->
            { umodel | size = umodel.size + 1 }

        SizeDown ->
            { umodel | size = sizeChecker umodel.size }


sizeChecker : Int -> Int
sizeChecker size =
    if size > 1 then
        size - 1

    else
        size


exclChecker : String -> String
exclChecker txt =
    if String.endsWith "!" txt then
        String.dropRight 1 txt

    else
        txt



-- Q: kako se lahko `mySize` funkcija zazene ce poklicem `Size` update model funkcijo?


mySize : int -> Attribute msg
mySize size =
    toString size
        ++ "em"
        |> style "fontSize"
        |> log "Log"



-- View


view : Model -> Html Mesg
view vmodel =
    div []
        [ div [ style "color" "teal", mySize vmodel.size ] [ text vmodel.text ]
        , button [ onClick AddExcl ] [ text "Add exclamation mark" ]
        , button [ onClick RemoveExcl ] [ text "Remove exclamation mark" ]
        , button [ onClick SizeUp ] [ text "+" ]
        , button [ onClick SizeDown ] [ text "-" ]
        ]
