CREATE OR REPLACE FUNCTION find_all_activities_for_owner(ownername varchar(500))
RETURNS SETOF activity AS $$
  SELECT act.*
  FROM activity act
  JOIN "user" owner   -- mot réservé de postgreSQL
  ON owner_id=owner.id
  WHERE owner.username = ownername;
$$ LANGUAGE SQL;