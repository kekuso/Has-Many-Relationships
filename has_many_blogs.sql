DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id serial NOT NULL,
  username character varying(90) NOT NULL,
  first_name character varying(90) DEFAULT NULL,
  last_name character varying(90) DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS posts CASCADE;

CREATE TABLE posts (
  id serial NOT NULL,
  title character varying(180) DEFAULT NULL,
  url character varying(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  user_id integer REFERENCES users,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS comments CASCADE;

CREATE TABLE comments (
  id serial NOT NULL,
  body character varying(510) DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  user_id integer REFERENCES users,
  comment_id integer REFERENCES posts,
  PRIMARY KEY (id)
);


