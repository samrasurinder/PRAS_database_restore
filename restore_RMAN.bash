#!/bin/ksh

ORACLE_SID=RMAN
ORAENV_ASK=NO
. oraenv

rman auxiliary=/ << EOF
SPOOL LOG TO '/u02/software/RMAN_HOT/restore.log';
RUN {
  allocate auxiliary channel a1  device type disk;
  allocate auxiliary channel a2  device type disk;
  DUPLICATE DATABASE TO "RMAN" NOOPEN  BACKUP LOCATION '/u02/software/RMAN_HOT' ;
}
EXIT;
EOF
