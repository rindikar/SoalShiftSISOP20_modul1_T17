#!/bin/bash

password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)

echo $password