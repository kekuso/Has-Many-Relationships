-- 1.
SELECT * FROM users;

-- 2.
SELECT * FROM posts WHERE user_id = 100;

-- 3.
SELECT *, users.first_name, users.last_name
  FROM posts
  INNER JOIN users ON posts.user_id = users.id
  WHERE posts.user_id = 200;

-- 4.
SELECT *, users.username
  FROM posts
  INNER JOIN users ON posts.user_id = users.id
  WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

-- 5.
SELECT users.username
  FROM users
  INNER JOIN posts ON posts.user_id = users.id
  WHERE posts.created_at >= '2015-01-01';

-- 6.
SELECT posts.title, posts.content, users.username
  FROM users
  INNER JOIN posts ON posts.user_id = users.id
  WHERE users.created_at <= '2015-01-01';

-- 7.
SELECT posts.title AS post_title, *
  FROM comments
  INNER JOIN posts ON posts.id = comments.comment_id;

-- 8.
SELECT posts.title AS post_title,
  posts.url AS post_url, comments.body AS comment_body
  FROM comments
  INNER JOIN posts ON posts.id = comments.comment_id
  WHERE posts.created_at <= '2015-01-01';

-- 9.
SELECT posts.title AS post_title,
  posts.url AS post_url,
  comments.body AS comment_body
  FROM comments
  INNER JOIN posts ON posts.id = comments.comment_id
  WHERE posts.created_at >= '2015-01-01';

-- 10.
SELECT posts.title AS post_title,
  posts.url AS post_url,
  comments.body AS comment_body
  FROM comments
  INNER JOIN posts ON posts.id = comments.comment_id
  WHERE comments.body LIKE '%USB%';

-- 11.
SELECT posts.title AS post_title,
  users.first_name,
  users.last_name,
  comments.body AS comment_body
  FROM comments
  INNER JOIN posts ON posts.id = comments.comment_id
  INNER JOIN users ON users.id = comments.user_id
  WHERE comments.body LIKE '%matrix%';

-- 12.
SELECT users.first_name,
  users.last_name,
  comments.body AS comment_body
  FROM comments
  INNER JOIN users ON users.id = comments.user_id
  INNER JOIN posts ON posts.id = comments.comment_id
  WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

-- 13.
SELECT DISTINCT users.first_name AS post_author_first_name,
  users.last_name AS post_author_last_name,
  posts.title AS post_title,
  users.username AS comment_author_username,
  comments.body AS comment_body
  FROM comments
  INNER JOIN posts ON posts.id = comments.comment_id
  INNER JOIN users ON users.id = comments.user_id
  WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND (posts.content LIKE '%nemo%');

-- Additional Queries
-- 1.
SELECT posts.id AS post_id, posts.title AS post_title, users.id AS user_id
FROM comments
INNER JOIN posts ON posts.id = comments.comment_id
INNER JOIN users ON users.id = comments.user_id
WHERE (comments.user_id = posts.user_id);

-- 2.
SELECT COUNT(*)
FROM comments
INNER JOIN posts ON posts.id = comments.comment_id
WHERE posts.created_at >= '2015-07-14';
-- AND comments.created_at >= '2015-06-14';
-- AND users.created_at >= '2015-06-14';

SELECT users.username, posts.title, comments.created_at
FROM comments
INNER JOIN posts ON posts.id = comments.comment_id
INNER JOIN users ON users.id = comments.user_id
WHERE posts.created_at >= '2015-06-14'
AND comments.created_at >= '2015-06-14'
AND users.created_at >= '2015-06-14';

-- 3.
SELECT users.username
FROM comments
INNER JOIN posts ON posts.id = comments.comment_id
INNER JOIN users ON users.id = comments.user_id
WHERE comments.body LIKE '%programming%';