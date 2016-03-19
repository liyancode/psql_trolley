# trolley load
# load what? backup db data to a .sql file, then 'load'(save) it to 'trolley'(disk).

require 'yaml'

# backup data to local disk
if ARGV.size<3
  p "ARGV must 3 or more parameters!"
  p "ARGV[0]: DB Name | ARGV[1]: Table Name | ARGV[2]: Copy SQL"
  exit
end
# Global Config Value
CONFIG = YAML.load_file('conf/config.yml')


# DB_Name=ARGV[0]
# Table_Name=ARGV[1]
# Copy_SQL=ARGV[2]
# psql_copy_to_cmd="psql -U #{CONFIG['psql_user']} -h #{CONFIG['psql_host']} -d #{DB_Name} -c \"copy (#{Copy_SQL}) TO '#{CONFIG['data_dir']+DB_Name+Table_Name+Time.now.to_i.to_s}.sql'"
# system(psql_copy_to_cmd)


p ""
BACKUP_LIST.each{|host|
  p "Host:#{host[:db_host]}"
  p "Username:#{host[:db_host_psql_username]}"
  db_list=host[:db_list]
  db_list.each{|db|
    p "--DB:#{db[:db_name]}"
    table_list=db[:table_list]
    table_list.each{|table|
      p "----Table:#{table[:table_name]}"
      p "    "+table[:table_name]
      p "    "+table[:offset_column_name]
      p "    "+table[:offset_init_value]

      sql_file_name="#{host[:db_host]}_#{db[:db_name]}_#{table[:table_name]}_#{Time.now.to_i.to_s}.sql"
      copy_sql="select * from #{table[:table_name]} where #{table[:offset_column_name]}#{table[:lessthan_or_greaterthan]}"
      psql_copy_to_cmd="psql -U #{host[:db_host_psql_username]} -h #{host[:db_host]} -d #{db[:db_name]} -c \"copy (#{copy_sql}) TO '#{sql_file_name}'"
      p "psql cmd: #{psql_copy_to_cmd}"
      system(psql_copy_to_cmd)
    }
  }
}