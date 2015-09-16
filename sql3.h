/*
  SQLite3 Interface
  
  Colombian Developers 
  ColDev (copyleft) 2009
*/

type TSqlResult   
  int cols,rows; 
  int CurrentRow;
  
  //internal use 
  char **pazResult;  
end ;


//result constant
#define SQLITE_OK           0   
   

//access constants   
#define SQLITE_OPEN_READONLY         1
#define SQLITE_OPEN_READWRITE        2
#define SQLITE_OPEN_CREATE           4
#define SQLITE_OPEN_DELETEONCLOSE    8
#define SQLITE_OPEN_EXCLUSIVE        16
#define SQLITE_OPEN_MAIN_DB          256
#define SQLITE_OPEN_TEMP_DB          512
#define SQLITE_OPEN_TRANSIENT_DB     1024
#define SQLITE_OPEN_MAIN_JOURNAL     2048
#define SQLITE_OPEN_TEMP_JOURNAL     4096
#define SQLITE_OPEN_SUBJOURNAL       8192
#define SQLITE_OPEN_MASTER_JOURNAL   16384
#define SQLITE_OPEN_NOMUTEX          32768
#define SQLITE_OPEN_FULLMUTEX        65536


import "sql.dll"