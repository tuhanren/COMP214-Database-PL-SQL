-- Q1 SOLUTION --
CREATE TABLE L5_MOVIES(
     m_id NUMBER,
     title VARCHAR2(35) NOT NULL,
     release_year NUMBER NOT NULL,
     director_id NUMBER NOT NULL,
     score NUMBER(3,2) DEFAULT 2.5,
     CONSTRAINT PK_m_id PRIMARY KEY (m_id),
     CONSTRAINT check_score CHECK (score BETWEEN 0 AND 5)
);

CREATE TABLE L5_ACTORS (
    a_id NUMBER,
    first_name VARCHAR2(20) NOT NULL,
    last_name VARCHAR2(30) NOT NULL,
    CONSTRAINT PK_a_id PRIMARY KEY (a_id)
);

CREATE TABLE L5_CASTINGS (
    movie_id NUMBER,
    actor_id NUMBER,
    CONSTRAINT PK_movie_id_actor_id PRIMARY KEY (movie_id, actor_id),
    CONSTRAINT CASTING_MOVIES_FK FOREIGN KEY (movie_id) REFERENCES L5_MOVIES (m_id),
    CONSTRAINT CASTINGS_ACTORS_FK FOREIGN KEY (actor_id) REFERENCES L5_ACTORS (a_id)
);

CREATE TABLE L5_DIRECTORS (
    director_id NUMBER,
    first_name VARCHAR2(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    CONSTRAINT PK_director_id PRIMARY KEY (director_id)
);
    
-- Q2 SOLUTION --
ALTER TABLE L5_MOVIES
ADD CONSTRAINT MOVIES_DIRECTORS_FK FOREIGN KEY (director_id) REFERENCES L5_DIRECTORS (director_id);

-- Q3 SOLUTION --
ALTER TABLE L5_MOVIES
ADD CONSTRAINT MOVIE_TITLE_UNIQUE UNIQUE (title);

-- Q4 SOLUTION --
ALTER TABLE L5_MOVIES
DROP CONSTRAINT MOVIES_DIRECTORS_FK;

ALTER TABLE L5_DIRECTORS
DROP CONSTRAINT PK_director_id;
TRUNCATE TABLE L5_DIRECTORS;

-- Q5 SOLUTION --
DROP TABLE L5_CASTINGS CASCADE CONSTRAINTS;
DROP TABLE L5_MOVIES CASCADE CONSTRAINTS;
DROP TABLE L5_ACTORS CASCADE CONSTRAINTS;
DROP TABLE L5_DIRECTORS CASCADE CONSTRAINTS;


