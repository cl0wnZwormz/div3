# API Endpoints

## Get All Posts
Retrieves all posts.

URL: `/posts`

Method: `GET`

Response:
- 200 OK: Returns an array of posts.

Example Response:
```json
{
"id": 1,
"title": "First Post",
"description": "This is the first post.",
"imageUrl": "http://example.com/image1.jpg",
"postingDate": "2024-06-13T10:00:00.000Z"
}
```

## Create a New Post
Creates a new post.

URL: `/posts`

Method: `POST`

Request Body:
- **title** (string): The title of the post.
- **description** (string): The description of the post.
- **imageUrl** (string): The URL of the image for the post.

Response:
- 201 Created: Returns the newly created post.

Example Request:
```json
{
  "title": "New Post",
  "description": "This is a new post.",
  "imageUrl": "http://example.com/image2.jpg"
}
```

Example Response:
```json
{
  "id": 2,
  "title": "New Post",
  "description": "This is a new post.",
  "imageUrl": "http://example.com/image2.jpg",
  "postingDate": "2024-06-13T10:05:00.000Z"
}
```


## Update a Post
Updates an existing post.

URL: `/posts/:id`

Method: `PUT`

Request Parameters:
- **id** (number): The ID of the post to update.

Request Body:
- **title** (string): The new title of the post.
- **description** (string): The new description of the post.
- **imageUrl** (string): The new URL of the image for the post.

Response:
- 200 OK: Returns the updated post.
- 404 Not Found: If the post with the specified ID is not found.


Example Request:
```json
{
  "title": "Updated Post",
  "description": "This is an updated post.",
  "imageUrl": "http://example.com/image2-updated.jpg"
}
```

Example Response:
```json
{
  "id": 2,
  "title": "Updated Post",
  "description": "This is an updated post.",
  "imageUrl": "http://example.com/image2-updated.jpg",
  "postingDate": "2024-06-13T10:05:00.000Z"
}
```


## Delete a Post
Deletes an existing post.

URL: `/posts/:id`

Method: `DELETE`

Request Parameters:
- **id** (number): The ID of the post to delete.

Response:
- 204 No Content: If the deletion is successful.
- 404 Not Found: If the post with the specified ID is not found.