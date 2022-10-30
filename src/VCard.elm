module VCard exposing (VCard, toString)

import VCard.V4 exposing (V4, v4)


type VCard
    = V4 V4


toString : VCard -> String
toString vc =
    case vc of
        V4 v ->
            v4 v
