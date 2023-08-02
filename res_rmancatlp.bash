#!/bin/ksh

ORACLE_SID=RMANCTLP
ORAENV_ASK=NO
. oraenv

rman auxiliary=/ << EOF
SPOOL LOG TO '/u02/software/RMANCTLP/restore.log';
RUN {
  allocate auxiliary channel a1  device type disk;
  allocate auxiliary channel a2  device type disk;
  DUPLICATE DATABASE TO "RMANCTLP" NOOPEN  BACKUP LOCATION '/u02/software/RMANCTLP' ;
}
EXIT;
EOF
