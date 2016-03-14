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