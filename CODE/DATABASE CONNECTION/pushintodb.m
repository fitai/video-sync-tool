%author:Seda Bilaloglu 
%date:051617 
%description: connects to the database and pulls the subject ids 

function pushintodb(input)
 
datasource = 'fitai';
username = 'db_user';
password = 'dbuserpassword';
driver = 'org.postgresql.Driver';
url = 'jdbc:postgresql://fitai-db-1.cls1x0o0bifh.us-east-1.rds.amazonaws.com:5432/fitai';

conn = database(datasource,username,password,driver,url);

% insert in database 
colnames = {'lift_id' , 'timepoint', 'event'}; 
 
data_table = cell2table(input,'VariableNames',colnames);

tablename='lift_event';

%here the input is a cell array
insert(conn,tablename,colnames,data_table)

close(conn) 
