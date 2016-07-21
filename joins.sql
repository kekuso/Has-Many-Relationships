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