#!/bin/bash

URL="http://localhost:4000/posts"

DATA='{
  "author": "Yakup",
  "title": "Zweiter Test",
  "content": "Das ist mein zweiter Test mit Sequelize",
  "cover": "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
}'

curl -X POST $URL \
-H "Content-Type: application/json" \
-d "$DATA"