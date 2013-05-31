#!/usr/bin/bash

if [ ! `/usr/bin/psql -tAc "select 1 from pg_roles where rolname='root'"` ]
then
  /usr/bin/psql -c "create role root with login createdb password 'smartvm'"
fi
