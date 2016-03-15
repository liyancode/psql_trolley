# psql_trolley
A Trolley-like tool for PostgreSQL DB partially replication and clean.

## Why.
This tool is created for resolving Atypical use case:
> I have a PostgreSQL DB named 'test_db'. 'test_db' has several tables and one is named 'table_a'. 
'table_a' will increase rapidly day by day, and I just want to keep 'table_a' always with the same rows(100W).
So I have to backup these old rows more than 100W to another db server, and delete them from current db server.
This action is scheduled token daily. psql_trolley is the man who will do this scheduler job.

## How.

### 1. create a table for offset
<pre><code>

-- table for backup offset
       create TABLE backup_offset(
         id serial Primary key NOT NULL,
         db_host VARCHAR NOT NULL ,
         db_name VARCHAR NOT NULL,
       	table_name VARCHAR NOT NULL ,
       	offset_column_name VARCHAR ,
       	offset_column_type VARCHAR ,
       	offset_column_value VARCHAR ,
       	inserted_at TIMESTAMP ,
       	last_updated_at TIMESTAMP
       );
</code></pre>

