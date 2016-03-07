require 'yaml'

# backup data to local disk
if ARGV.size<3
  p "ARGV must 3 or more parameters!"
  p "ARGV[0]: DB Name | ARGV[1]: Table Name | ARGV[2]: Data_Source_SQL_file"
  exit
end
# Global Config Value
CONFIG = YAML.load_file('conf/config.yml')

DB_Name=ARGV[0]
Table_Name=ARGV[1]
Data_Source_SQL_file=ARGV[2]
psql_copy_from_cmd="psql -U #{CONFIG['psql_user']} -h #{CONFIG['psql_host']} -d #{DB_Name} -c \"copy #{Table_Name} FROM '#{Data_Source_SQL_file}'"
system(psql_copy_from_cmd)