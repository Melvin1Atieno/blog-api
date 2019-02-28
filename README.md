# Blog

A simple blog API that allows users to

1. Register.
2. Create blog posts
3. Comment on the blog posts.

## Spec

Checkout the [swagger API specification](https://app.swaggerhub.com/apis/Melvin1Atieno/blog-api/1.0.0#/default/post_users)


## Test

1. Clone the repo
2. cd into repo directory
3. Buid image `docker-compose build`
4. Run container `docker-compose up -d`
5. Make requests in postman.

## Available endpoinst

Registration

`http/localhost/api/v1/users`

Authentication
`http/localhost/api/v1/authenticate`
