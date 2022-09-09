CREATE TABLE ch01.highways
(
  gid integer NOT NULL,
  feature character varying(80),
  name character varying(120),
  state character varying(2),
  geom geometry(multilinestring,2163),
  CONSTRAINT pk_highways PRIMARY KEY (gid)
);
 
CREATE INDEX ix_highways 
 ON ch01.highways USING gist(geom);
