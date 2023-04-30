CREATE or replace FUNCTION one() RETURNS integer AS $$
    SELECT 1 AS result;
$$ LANGUAGE SQL;
select one() as one;

CREATE FUNCTION add_int(x integer, y integer) RETURNS integer AS $$
    SELECT x + y;
$$ LANGUAGE SQL;
SELECT add_int(1, 2) AS answer;

drop function add_int(x integer, y integer);
CREATE FUNCTION add_int(integer, integer) RETURNS integer AS $$
    SELECT $1 + $2;
$$ LANGUAGE SQL;
SELECT add_int(1, 2) AS answer;

drop function add_int(x integer, y integer);
CREATE FUNCTION add_int(integer, integer) RETURNS integer AS 'select $1 + $2;'
LANGUAGE SQL IMMUTABLE
RETURNS NULL ON NULL INPUT;
SELECT add_int(20, 22) AS answer;

CREATE or replace FUNCTION dup(in int, out f1 int, out f2 text) AS $$
    SELECT $1, CAST($1 AS text) || ' is text'
$$ LANGUAGE SQL;
select * from dup(42);

CREATE TYPE dup_result AS (f1 int, f2 text);

drop function dup(integer);
CREATE or replace FUNCTION dup(int) RETURNS dup_result AS $$
    SELECT $1, CAST($1 AS text) || ' is text'
$$ LANGUAGE SQL;
SELECT * FROM dup(42);

drop function dup(integer);
CREATE FUNCTION dup(int) RETURNS TABLE(f1 int, f2 text) AS $$
    SELECT $1, CAST($1 AS text) || ' is text'
$$ LANGUAGE SQL;
SELECT * FROM dup(42);

CREATE FUNCTION foo(a int, b int DEFAULT 2, c int DEFAULT 3) RETURNS int LANGUAGE SQL AS $$
    SELECT $1 + $2 + $3;
$$;
SELECT foo(10, 20, 30);
SELECT foo(10, 20);
SELECT foo(10);
SELECT foo();

CREATE OR REPLACE FUNCTION increment(i integer) RETURNS integer AS $$
BEGIN
    RETURN i + 1;
END;
$$ LANGUAGE plpgsql;
SELECT increment(41) AS answer;

CREATE or replace FUNCTION somefunc() RETURNS integer AS $$
<< outerblock >>
DECLARE
    quantity integer := 30;
BEGIN
    RAISE NOTICE 'Quantity here is %', quantity; -- Prints 30
    quantity := 50;
    -- Create a subblock
        DECLARE
            quantity integer := 80;
        BEGIN
            RAISE NOTICE 'Quantity here is %', quantity; -- Prints 80
            RAISE NOTICE 'Outer quantity here is %', outerblock.quantity; -- Prints 50
        END;
    RAISE NOTICE 'Quantity here is %', quantity; -- Prints 50
    RETURN quantity;
END;
$$ LANGUAGE plpgsql;
select somefunc();

select version();
