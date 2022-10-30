module VCard.Properties exposing (Address, Gender, Identity, Kind, Sex, WGS84, address, preference)

import LanguageTag exposing (LanguageTag)
import Maybe exposing (map)
import String


preference : Int -> String
preference p =
    let
        n =
            if p < 0 then
                0

            else if p > 100 then
                0

            else
                p
    in
    String.fromInt n


address : Address -> String
address a =
    let
        pref =
            a.preference
                |> map preference
                |> Maybe.withDefault ""

        lang =
            a.language
                |> map LanguageTag.toString
                |> Maybe.withDefault ""

        label =
            a.label
                |> map (\l -> "LABEL=" ++ l)
                |> Maybe.withDefault ""

        xs =
            [ pref
            , lang
            , label
            , a.pobox
            , a.ext
            , a.street
            , a.locality
            , a.region
            , a.code
            , a.country
            ]
    in
    xs
        |> List.filter ((/=) "")
        |> String.join ";"


type alias Address =
    { preference : Maybe Int
    , language : Maybe LanguageTag
    , label : Maybe String
    , pobox : String
    , ext : String
    , street : String
    , locality : String
    , region : String
    , code : String
    , country : String
    }


type Kind
    = Individual
    | Group
    | Location
    | Organization
    | X String


type Gender
    = Sex Identity


type Sex
    = Female
    | Male
    | None
    | Other
    | Unknown


type alias Identity =
    String


type alias WGS84 =
    { lat : Float
    , long : Float
    }
