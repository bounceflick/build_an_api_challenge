## GET /users

#### Returns in JSON the list of all users.

Parameters included for each user are: username, email, name, and bio.

Example Result:

```json
[
 {
  "bio":"Aspernatur accusantium error dignissimos et incidunt. Nulla quo sed sed labore quisquam delectus enim. Et sed in aspernatur quod voluptatem sed ut. Consequatur repellendus rerum magni ea velit ut. Nostrum ratione ullam pariatur velit a.",
  "email":"luz@bartonvon.biz",
  "id":1,
  "name":"Mrs. Cleo Swaniawski",
  "username":"hope"
 }
]
```

## GET /articles

#### Returns in JSON the list of all articles.

Parameters included for each user are: title, body, user_id

Example Result:

```json
[
  {
    "body":"Dicta quis numquam nihil rerum voluptas in quos. Enim consequatur ab sed voluptatem. Aut laborum praesentium animi dolor. Sint inventore debitis. Omnis suscipit sit perferendis voluptatum sapiente.",
    "id":1,
    "title":"eos",
    "user_id":1
  }
]
```

## GET /users/user_id/comments

####Returns in JSON the list of all comments for a specific user.

Parameters included for each user are: article_id, body and user_id

Example Result:

```json
[
  {
    "article_id":21,
    "body":"Iste sed nihil ipsum amet voluptatem doloribus. Minima aliquid perferendis a ab rerum voluptas. Fugiat dolorem minima ipsa.",
    "id":88,
    "user_id":9
  }
]
```
## POST /users/user_id/articles

#### Returns the article created in JSON.

Parameters included for each user are: title, body, user_id

Example Result:

```json
[
  {
    "body":"Dicta quis numquam nihil rerum voluptas in quos. Enim consequatur ab sed voluptatem. Aut laborum praesentium animi dolor. Sint inventore debitis. Omnis suscipit sit perferendis voluptatum sapiente.",
    "id":1,
    "title":"eos",
    "user_id":1
  }
]
```

## POST /users/user_id/articles/article_id/comments

#### Returns the comment created in JSON.

Parameters included for each user are: article_id, body and user_id

Example Result:

```json
[
  {
    "article_id":21,
    "body":"Iste sed nihil ipsum amet voluptatem doloribus. Minima aliquid perferendis a ab rerum voluptas. Fugiat dolorem minima ipsa.",
    "id":88,
    "user_id":9
  }
]
```

