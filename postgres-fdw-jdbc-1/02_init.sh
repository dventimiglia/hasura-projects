#!/usr/bin/bash 

psql <<EOF

create extension if not exists jdbc_fdw;

EOF
