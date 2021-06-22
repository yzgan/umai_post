# Setup
Run db setup to setup database and seeds
```
rails db:setup
```

# API Endpoint

## Get user JWT token
GET `/login`
with form body params:
```json
{
  "username": "user_1",
  "password": "password"
}
```

will create login and return JWT token in the response response for successful login.

## Get post
Pagination was used for posts collection. 

GET `/posts`
with optional params:
```json
{
  "page": 1,
}
```

## Create post


Header `Authorization` with jwt token from login will be used to set user id in post. 

POST `/posts` with body params:
```json
{
    "post": {
        "title": "post a",
        "content": "post content a"
    }
}
```

## Create post rating
POST `/posts/{:post_id}/ratings` with body params:
```json
{
    "rating": {
        "value": 2
    }
}
```

## Get top posts
GET `/posts/top`
with optional params. default is 10
```json
{
  "top_count": 3,
}
```

## Get ip list
GET `/posts/ip_listing`
