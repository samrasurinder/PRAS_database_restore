#!/bin/sh

export ORACLE_SID=RMAN
export ORACLE_HOME=/u02/app/oracle/product/19.3.0/db_1
export PATH=$ORACLE_HOME/bin:$PATH
export TNS_ADMIN=$ORACLE_HOME/network/admin

$ORACLE_HOME/perl/bin/perl $ORACLE_HOME/rdbms/admin/catctl.pl -n 8 -l /u02/software/RMAN_HOT/logs $ORACLE_HOME/rdbms/admin/catupgrd.sql

$ORACLE_HOME/perl/bin/perl $ORACLE_HOME/rdbms/admin/catctl.pl -n 8 -l /u02/software/RMAN_HOT/logs  $ORACLE_HOME/rdbms/admin/catuppst.sql
