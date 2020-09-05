module Main exposing(main)
-- import Html
import Html exposing (h1,text,form,label,Html)
-- import Attributes
import Html.Attributes exposing (id,for)
{-|
    The last Hello World program uses
    the model and view.
    It does not contain any *update*
    or *biding* function
-}

main =
    Html.form [id "contact-form"]
         [h1 [] [text "Contact form"]
         , label [ for "userName"] [text "Enter User Name: "]
         ]

-- MODEL
-- model int
model = 0
