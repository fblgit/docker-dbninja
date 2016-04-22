#!/bin/bash
service apache2 start
service mysql start
exec tail -f /var/log/apache2/*
