CREATE OR REPLACE FUNCTION add_activity(in_title VARCHAR(200), in_description TEXT, in_owner_id bigint DEFAULT NULL) RETURNS activity AS $$
	DECLARE
		variable activity%rowtype;
		defaultOwnerUsername varchar(500) := 'Default Owner';
		 
	BEGIN
		if in_owner_id is NULL then
		  	INSERT INTO activity(id, title, description, creation_date, owner_id)
			VALUES (nextval('id_generator'),in_title, in_description, NOW(), in_owner_id);
			SELECT * INTO variable 
			FROM activity 
			WHERE owner_id = in_owner_id
			AND   title = in_title;
			RETURN variable;	 
		else	 
			INSERT INTO activity(id, title, description, creation_date, owner_id)
			VALUES (nextval('id_generator'),in_title, in_description, NOW(), in_owner_id);
			SELECT * INTO variable 
			FROM activity 
			WHERE owner_id = in_owner_id
			AND   title = in_title;
			RETURN variable;
		end if;	
	END;
	
$$ Language plpgsql

--CREATE OR REPLACE FUNCTION find_all_activities(INOUT activities_cursor refcursor) AS $$
	--BEGIN
    	--OPEN $1 FOR SELECT * FROM activity ORDER BY in_title_id;
    	--RETURN $1;
	--END;
--$$ LANGUAGE plpgsql;

--BEGIN;
--SELECT * FROM find_all_activities('toutes_les_activies')

--FETCH ALL IN activities_cursor;
--COMMIT;