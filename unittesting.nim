# Copyright 2019.
import unittest
type
  Card = object
    rank: Rank
    suit: Suit
  Rank = enum
    crSeven
    crEight
    crNine
    crTen
    crJack
    crQueen
    crKing
    crAce
  Suit = enum
    csClubs = "♧"
    csDiamonds = "♢"
    csHearts = "♡"
    csSpades = "♤"

proc `<`(a,b: Card): bool = a.rank  < b.rank
proc `==`(a,b: Card): bool = a.rank == b.rank
when isMainModule:
  let
    aceDiamonds = Card(rank: crAce, suit: csDiamonds)
    kingClubs = Card(rank: crKing, suit: csClubs)
    aceClubs = Card(rank: crAce, suit: csClubs)

echo "Begin tests"
#test1
test "greater than":
  check:
    aceDiamonds > kingClubs
    aceClubs > kingClubs
#test2
test "equal to":
  check:
    aceDiamonds == aceClubs
