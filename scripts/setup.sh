#!/bin/bash
directory="apps/api"
if [ -f "$directory/.env.sample" ]; then
    cp "$directory/.env.sample" "$directory/.env"
    echo "Successfully created .env from .env.sample, please fill with your values."
else
    echo "The .env.sample file does not exist in the specified path."
fi
