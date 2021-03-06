# config what to backup
BACKUP_LIST=[
    {
        :db_host=>'localhost',
        :db_host_psql_username=>'username',
        :db_list=>[
            {
                :db_name=>'rep_tes',
                :table_list=>[
                    {
                        :table_name=>'table_01',
                        :offset_column_name=>'col_01',
                        :offset_column_type=>'type_01',
                        :lessthan_or_greaterthan=>'>',
                        :offset_init_value=>'value'
                    },
                    {
                        :table_name=>'table_02',
                        :offset_column_name=>'col_01',
                        :offset_column_type=>'type_01',
                        :lessthan_or_greaterthan=>'>',
                        :offset_init_value=>'value'
                    }
                ]
            },
            {
                :db_name=>'rep_tes',
                :table_list=>[
                    {
                        :table_name=>'table_01',
                        :offset_column_name=>'col_01',
                        :offset_column_type=>'type_01',
                        :lessthan_or_greaterthan=>'>',
                        :offset_init_value=>'value'
                    },
                    {
                        :table_name=>'table_02',
                        :offset_column_name=>'col_01',
                        :offset_column_type=>'type_01',
                        :lessthan_or_greaterthan=>'>',
                        :offset_init_value=>'value'
                    }
                ]
            }
        ]
    },
    {
        :db_host=>'host_02',
        :db_host_psql_username=>'username02',
        :db_list=>[
            {
                :db_name=>'rep_test',
                :table_list=>[
                    {
                        :table_name=>'table_01',
                        :offset_column_name=>'col_01',
                        :offset_column_type=>'type_01',
                        :lessthan_or_greaterthan=>'>',
                        :offset_init_value=>'value'
                    },
                    {
                        :table_name=>'table_02',
                        :offset_column_name=>'col_01',
                        :offset_column_type=>'type_01',
                        :lessthan_or_greaterthan=>'>',
                        :offset_init_value=>'value'
                    }
                ]
            },
            {
                :db_name=>'rep_tes',
                :table_list=>[
                    {
                        :table_name=>'table_01',
                        :offset_column_name=>'col_01',
                        :offset_column_type=>'type_01',
                        :lessthan_or_greaterthan=>'>',
                        :offset_init_value=>'value'
                    },
                    {
                        :table_name=>'table_02',
                        :offset_column_name=>'col_01',
                        :offset_column_type=>'type_01',
                        :lessthan_or_greaterthan=>'>',
                        :offset_init_value=>'value'
                    }
                ]
            }
        ]
    }
]
# # test p
# BACKUP_LIST.each{|host|
#   p host[:db_host]
#   p host[:db_host_psql_username]
#   db_list=host[:db_list]
#   db_list.each{|db|
#     p "  "+db[:db_name]
#     table_list=db[:table_list]
#     table_list.each{|table|
#       p "    "+table[:table_name]
#       p "    "+table[:offset_column_name]
#       p "    "+table[:offset_init_value]
#     }
#   }
# }