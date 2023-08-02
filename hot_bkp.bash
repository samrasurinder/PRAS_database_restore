#!/bin/sh

export ORACLE_SID=RMANCTLP
export ORACLE_HOME=/u02/app/oracle/product/12.2/db_1
export PATH=$ORACLE_HOME/bin:$PATH
export TNS_ADMIN=$ORACLE_HOME/network/admin
export ORACLE_UNQNAME=EODCPY

INST=`hostname`
TODAY=`date +%d%b`
BACKUP_DIR=/infshare/oracle/exports/RMANCTLP
LOG_DIR=/infshare/oracle/exports/RMANCTLP
LOGFILE=$LOG_DIR/rman_backup_${ORACLE_SID}_${TODAY}.log
$ORACLE_HOME/bin/rman <<EOF > ${LOG_DIR}/rman_backup_${ORACLE_SID}_${TODAY}.log
connect target /
run {
allocate channel t1 TYPE DISK;
allocate channel t2 TYPE DISK;
allocate channel t3 TYPE DISK;
allocate channel t4 TYPE DISK;
backup as compressed backupset full database format '${BACKUP_DIR}/$ORACLE_SID_%d_%t_%p_%s_%c_%u.dbf';
backup current controlfile format '${BACKUP_DIR}/$ORACLE_SID_%d_%t_%p_%s_%c_%u.ctl';
sql 'alter system archive log current';
backup as compressed backupset archivelog all format '${BACKUP_DIR}/$ORACLE_SID_%d_%t_%p_%s_%c_%u.arc';
release channel t1;
release channel t2;
release channel t3;
release channel t4;
}
EOF
