#!/bin/bash
# commitdate - @humbertowoody
# Creates a new commit given the current date for my school
# repositories that get updated with each class.


function commitdate()
{
  git commit -m "Clase del `date +%d-%m-%Y` 🎉";
}
