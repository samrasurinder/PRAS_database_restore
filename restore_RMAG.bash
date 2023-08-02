#!/bin/ksh

ORACLE_SID=RMAG
ORAENV_ASK=NO
. oraenv

rman auxiliary=/ << EOF
SPOOL LOG TO '/u02/software/RMAG_HOT/restore.log';
RUN {
  allocate auxiliary channel a1  device type disk;
  allocate auxiliary channel a2  device type disk;
  DUPLICATE DATABASE TO "RMAG" NOOPEN  BACKUP LOCATION '/u02/software/RMAG_HOT' ;
}
EXIT;
EOF
