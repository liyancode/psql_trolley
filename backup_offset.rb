# create TABLE backup_offset(
#   id serial Primary key NOT NULL,
#   db_host VARCHAR NOT NULL ,
#   db_name VARCHAR NOT NULL,
#   table_name VARCHAR NOT NULL ,
#   offset_column_name VARCHAR ,
#   offset_column_type VARCHAR ,
#   offset_column_value VARCHAR ,
#   inserted_at TIMESTAMP ,
#   last_updated_at TIMESTAMP
# );
class BackupOffset<Sequel::Model(:backup_offset)

  def BackupOffset.select_offset_value(db_host,db_name,table_name,column_name)
    begin
      BackupOffset[:db_host=>db_host,:db_name=>db_name,:table_name=>table_name,:offset_column_name=>column_name].values[:offset_column_value]
    rescue Exception=>e
      p e
    end
  end

  def BackupOffset.update_or_insert(db_host,db_name,table_name,column_name,column_value)
    begin
      if BackupOffset.is_table_column_in(db_host,db_name,table_name,column_name)
        BackupOffset.update_columnvalue_by_tablename_and_columnname(db_host,db_name,table_name,column_name,column_value)
      else
        BackupOffset.add_new(db_host,db_name,table_name,column_name,column_value)
      end
    rescue Exception=>e
      p e
    end
  end
  def BackupOffset.update_columnvalue_by_tablename_and_columnname(db_host,db_name,table_name,column_name,column_value)
    begin
      BackupOffset[
          :db_host=>db_host,
          :db_name=>db_name,
          :table_name=>table_name,
          :offset_column_name=>column_name
      ]
          .update(
              :offset_column_value=>column_value,
              :last_updated_at=>Time.now.utc
          )
    rescue Exception=>e
      p e
    end
  end

  def BackupOffset.add_new(db_host,db_name,table_name,column_name,column_value)
    begin
      BackupOffset.insert(
          :db_host=>db_host,
          :db_name=>db_name,
          :table_name=>table_name,
          :offset_column_name=>column_name,
          :offset_column_value=>column_value,
          :inserted_at=>Time.now.utc,
          :last_updated_at=>Time.now.utc
      )
    rescue Exception=>e
      p e
    end
  end

  def BackupOffset.is_table_column_in(db_host,db_name,table_name,column_name)
    begin
      if BackupOffset[:db_host=>db_host,:db_name=>db_name,:table_name=>table_name,:offset_column_name=>column_name]==nil
        return false
      else
        return true
      end
    rescue Exception=>e
      p e
    end
  end
end