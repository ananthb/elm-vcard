module VCard.V4 exposing (V4, v4)

import Dict exposing (Dict)
import Email
import LanguageTag exposing (LanguageTag)
import String
import Url exposing (Url)
import VCard.Properties exposing (..)


type alias V4 =
    { adr : Address
    , anniversary : String
    , bday : String
    , caladruri : Url
    , calurl : Url
    , categories : List String
    , clientpidmap : Dict String String
    , email : Email.Email
    , fburl : Url
    , fn : String
    , gender : Gender
    , geo : WGS84
    , impp : String
    , key : String
    , kind : Kind
    , lang : LanguageTag
    , logo : String
    , member : String
    , n : String
    , nickname : String
    , note : String
    , org : String
    , photo : String
    , prodid : String
    , related : String
    , rev : String
    , role : String
    , sound : String
    , source : String
    , tel : String
    , title : String
    , tz : String
    , uid : String
    , url : Url
    }


v4 : V4 -> String
v4 v =
    let
        vs =
            [ "BEGIN:VCARD"
            , "VERSION:4.0"
            , address v.adr
            ]
    in
    vs
        |> List.filter ((/=) "")
        |> String.join "\u{000D}\n"
