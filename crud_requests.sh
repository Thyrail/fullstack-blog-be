#!/bin/bash

BASE_URL="http://localhost:4000/posts"

create_post() {
  echo "Creating a new post:"
  read -p "Author: " author
  read -p "Title: " title
  read -p "Content: " content
  read -p "Cover URL: " cover

  curl -X POST $BASE_URL \
  -H "Content-Type: application/json" \
  -d "{
    \"author\": \"$author\",
    \"title\": \"$title\",
    \"content\": \"$content\",
    \"cover\": \"$cover\"
  }"
}

get_all_posts() {
  curl -X GET $BASE_URL \
  -H "Content-Type: application/json"
}

get_post_by_id() {
  local id=$1
  if [ -z "$id" ]; then
    echo "Please provide an ID: get_post_by_id <id>"
    return
  fi
  curl -X GET "$BASE_URL/$id" \
  -H "Content-Type: application/json"
}

update_post() {
  local id=$1
  if [ -z "$id" ]; then
    echo "Please provide an ID: update_post <id>"
    return
  fi
  echo "Updating post with ID $id:"
  read -p "Author: " author
  read -p "Title: " title
  read -p "Content: " content
  read -p "Cover URL: " cover

  curl -X PUT "$BASE_URL/$id" \
  -H "Content-Type: application/json" \
  -d "{
    \"author\": \"$author\",
    \"title\": \"$title\",
    \"content\": \"$content\",
    \"cover\": \"$cover\"
  }"
}

delete_post() {
  local id=$1
  if [ -z "$id" ]; then
    echo "Please provide an ID: delete_post <id>"
    return
  fi
  curl -X DELETE "$BASE_URL/$id" \
  -H "Content-Type: application/json"
}

echo "Select an operation:
1) CREATE: Create a new post
2) READ: Retrieve all posts
3) READ: Retrieve a single post by ID
4) UPDATE: Update an existing post
5) DELETE: Delete a post"
read -p "Select an option (1-5): " choice

case $choice in
  1)
    echo "Creating a new post..."
    create_post
    ;;
  2)
    echo "Retrieving all posts..."
    get_all_posts
    ;;
  3)
    read -p "Enter the ID of the post: " id
    echo "Retrieving post with ID $id..."
    get_post_by_id $id
    ;;
  4)
    read -p "Enter the ID of the post to update: " id
    echo "Updating post with ID $id..."
    update_post $id
    ;;
  5)
    read -p "Enter the ID of the post to delete: " id
    echo "Deleting post with ID $id..."
    delete_post $id
    ;;
  *)
    echo "Invalid option. Please select 1-5."
    ;;
esac