#!/bin/bash
#
	for CONFIG_INPUT in *.json
	do
		ITEM_TYPE=`basename ${CONFIG_INPUT} | cut -d'_' -f1`
		ITEM_NAME=`basename ${CONFIG_INPUT} | cut -d'_' -f2- \
			| cut -d'.' -f1`
		if [ "${ITEM_TYPE}" = "datasource" ]
		then
			ITEM_URI="datasources"
		elif [ "${ITEM_TYPE}" = "dashboard" ]
		then
			ITEM_URI="dashboards/db"
		else
			ITEM_URI=${ITEM_TYPE}
		fi
		echo "Loading ${ITEM_TYPE}: ${ITEM_NAME}..."
		echo "curl -X POST --user admin:admin http://localhost:3001/api/${ITEM_URI} -d @${CONFIG_INPUT}"
	done
	exit
