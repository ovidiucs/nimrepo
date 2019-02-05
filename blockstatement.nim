# Copyright 2019.
echo "I am outside"
block busyloops:
  echo " I am in the busyloops block"
  while true:
    echo "First while loop"
    while true:
      echo "Second while loop"
      break busyloops
    echo "In the first while"
  echo "Outside second while"
echo "Outside"
