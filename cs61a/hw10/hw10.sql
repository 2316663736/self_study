CREATE TABLE parents AS
  SELECT "ace" AS parent, "bella" AS child UNION
  SELECT "ace"          , "charlie"        UNION
  SELECT "daisy"        , "hank"           UNION
  SELECT "finn"         , "ace"            UNION
  SELECT "finn"         , "daisy"          UNION
  SELECT "finn"         , "ginger"         UNION
  SELECT "ellie"        , "finn";

CREATE TABLE dogs AS
  SELECT "ace" AS name, "long" AS fur, 26 AS height UNION
  SELECT "bella"      , "short"      , 52           UNION
  SELECT "charlie"    , "long"       , 47           UNION
  SELECT "daisy"      , "long"       , 46           UNION
  SELECT "ellie"      , "short"      , 35           UNION
  SELECT "finn"       , "curly"      , 32           UNION
  SELECT "ginger"     , "short"      , 28           UNION
  SELECT "hank"       , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child
  FROM parents,dogs
  WHERE parent=name
  ORDER BY height DESC
;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT size,name
  FROM dogs, sizes
  WHERE height > min AND height <= max;


-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
  SELECT p1.child AS sibling1, p2.child AS sibling2
  FROM parents AS p1, parents AS p2
  WHERE p1.parent = p2.parent AND p1.child < p2.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || s.sibling1 || " and " || s.sibling2 ||
         ", have the same size: " || d1.size
  FROM siblings AS s, size_of_dogs AS d1, size_of_dogs AS d2
  WHERE s.sibling1 = d1.name AND s.sibling2 = d2.name AND d1.size = d2.size;

-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT  fur,(max(height)-min(height)) AS height_range
    FROM dogs
    GROUP BY fur
    HAVING max(height)<=1.3*avg(height)and min(height)>=0.7*avg(height)

;

