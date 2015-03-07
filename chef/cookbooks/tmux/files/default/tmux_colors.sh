#!/bin/bash

# Make sure you have all the utf-8 things set

severity='home';

if [ $severity == 'home' ]
then
  echo -n "#[fg=green]✓";
elif [ $severity == 'production' ]
then
  echo -n "#[fg=red]■■■■■■■■■■■■■■■■■■■■■■■■■";
elif [ $severity == 'staging' ]
then
  echo -n "#[fg=yellow]■■■■■■■■■■■■■■■■■■■■■■■■■";
else
  echo -n "#[fg=yellow]■■■■■■■■■■■■■■■■■■■■■■■■■";
fi
