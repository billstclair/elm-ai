---------------------------------------------------------------------
--
-- AI.elm
-- Next word prediction
-- Copyright (c) 2023 Bill St. Clair <billstclair@gmail.com>
-- Some rights reserved.
-- Distributed under the MIT License
-- See LICENSE.txt
--
----------------------------------------------------------------------


module AI exposing
    ( AI, Node(..), OneNode, PunctuationType(..), Sentence, SentenceElement(..)
    , learn, punctuationString, query
    )

{-| A simple next-word prediction dictionary.


# Types

@docs AI, Node, OneNode, PunctuationType, Sentence, SentenceElement


# Functions

@docs learn, punctuationString, query

-}

import Dict exposing (Dict)
import List.Extra as LE


{-| Supported punctuation types.
-}
type PunctuationType
    = Comma
    | SemiColon
    | Dash
    | Period
    | ExclamationMark
    | QuestionMark


type alias Punctuations =
    Dict PunctuationType String


punctuations : List ( PunctuationType, String )
punctuations =
    [ ( Comma, "," )
    , ( SemiColon, ";" )
    , ( Dash, "-" )
    , ( Period, "." )
    , ( ExclamationMark, "!" )
    , ( QuestionMark, "?" )
    ]


{-| Get the string for a `Punctuation`.
-}
punctuationString : PunctuationType -> String
punctuationString punctuationType =
    case LE.find (\( t, _ ) -> punctuationType == t) punctuations of
        Just ( _, s ) ->
            s

        Nothing ->
            "."


{-| One element of a sentence.
-}
type SentenceElement
    = Word String
    | Punctuation


{-| A parsed sentence.
-}
type alias Sentence =
    List SentenceElement


{-| The node for a single word.
-}
type Node
    = Node OneNode


{-| Details of a `Node`.
-}
type alias OneNode =
    { word : String
    , sentences : List Sentence
    , nexts : List Node
    }


{-| The entire dictionary.
-}
type alias AI =
    Dict String (List OneNode)


{-| Learn a sentence.
-}
learn : AI -> String -> AI
learn ai sentenceString =
    ai


{-| Ask the `AI` a question.
-}
query : String -> String
query sentencesString =
    "I am the AI. Ask me anything. I'll tell you this."
