require 'yaml'

# backup data to local disk
if ARGV.size<3
  p "ARGV must 3 or more parameters!"
  p "ARGV[0]: DB Name | ARGV[1]: Table Name | ARGV[2]: Copy SQL"
  exit
end
# Global Config Value
CONFIG = YAML.load_file('conf/config.yml')

DB_Name=ARGV[0]
Table_Name=ARGV[1]
Copy_SQL=ARGV[2]
psql_copy_to_cmd="psql -U #{CONFIG['psql_user']} -h #{CONFIG['psql_host']} -d #{DB_Name} -c \"copy (#{Copy_SQL}) TO '#{CONFIG['data_dir']+DB_Name+Table_Name+Time.now.to_i.to_s}.sql'"
system(psql_copy_to_cmd)