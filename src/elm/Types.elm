module Types exposing (..)

import Browser
import Browser.Navigation as Nav
import Http
import Url


type alias AuthDetails =
    { accessToken : String }


type alias Docs =
    ( String, Maybe String )


type alias Profile =
    { name : String, images : List Image }


type alias Image =
    { width : Maybe Int, height : Maybe Int, url : String }


type alias ArtistsPagingObject =
    { artists : List Artist }


type alias TracksPagingObject =
    { tracks : List Track }


type alias Artist =
    { name : String
    , genres : List String
    , images : List Image
    , popularity : Int
    }


type alias Track =
    { name : String
    }


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , route : Maybe Docs
    , authDetails : Maybe AuthDetails
    , profile : Maybe Profile
    , topArtists : List Artist
    , topArtistsTimeRange : TimeRange
    , topTracks : List Track
    , topTracksTimeRange : TimeRange
    }


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GotProfile (Result Http.Error Profile)
    | GotTopArtists (Result Http.Error ArtistsPagingObject)
    | GotTopTracks (Result Http.Error TracksPagingObject)
    | TopArtistsTimeRangeSelected TimeRange
    | TopTracksTimeRangeSelected TimeRange


type TimeRange
    = ShortTerm
    | MediumTerm
    | LongTerm


type TopSubject
    = TopArtists
    | TopTracks


placeholderImage =
    Image (Just 128) (Just 128) "https://picsum.photos/128"