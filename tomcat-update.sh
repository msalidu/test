#!/bin/bash

MGNL_ENV="uat-magnolia"
RELEASE_TMPFOLDER=/app/tomcat/webapps/tmp
WEBAPP_FOLDER=/app/tomcat/webapps/magnolia

TS=$(date +"%Y%m%d-%H%M%S")
TMPLASTFILE=/tmp/insegne-${TS}.txt

S3BASE="s3://selex-wh-qa-2-deploy"
S3LASTFILE="${S3BASE}/last/${MGNL_ENV}.txt"

mkdir -p $RELEASE_TMPFOLDER

echo "Individuo Version from $S3LASTFILE"
aws s3 cp $S3LASTFILE $TMPLASTFILE > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "KO: non ho scaricato il file col numero di release"
	exit 1
fi
APP_LASTVER=$(cat $TMPLASTFILE)
WAR_NAME="website-webapp-${APP_LASTVER}.war"
S3WAR="${S3BASE}/versions/${APP_LASTVER}/${WAR_NAME}"
rm $TMPLASTFILE

echo "Last Version su S3: ${APP_LASTVER}"

APP_INSTVER=$(cat /app/tomcat/webapps/magnolia/META-INF/maven/it.reply.square.magnolia/website-webapp/pom.properties | grep version | sed -e "s/version=//g") 
if [ "$APP_INSTVER" == "$APP_LASTVER" ] ; then
  echo "skip update: version $APP_INSTVER alredy installed"
  exit 0
fi


echo "Scarico S3 $S3WAR"
aws s3 cp $S3WAR $RELEASE_TMPFOLDER 
if [ $? -ne 0 ]; then
	echo "KO: non ho scaricato il file col numero di release"
	exit 1
fi

service tomcat stop
if [[ "$(ps -fu tomcat | grep java | grep tomcat | wc -l)" -gt "0" ]]; then
	echo "KO processo tomcat ancora attivo"
	exit 1
else
	echo "Ok processo tomcat non trovato"
fi

echo "rm previus webapp"
rm -rf $WEBAPP_FOLDER > /dev/null 2>&1
echo "unzip last webapps"
unzip $RELEASE_TMPFOLDER/${WAR_NAME} -d ${WEBAPP_FOLDER}

echo "set permissions"
chown tomcat:openmind ${WEBAPP_FOLDER} -R
chmod 775 ${WEBAPP_FOLDER} -R


#chmod 775 /app/tomcat/magnolia-data -R
#chown tomcat:openmind /app/tomcat/magnolia-data -R
#chown tomcat:openmind /app/tomcat/tomcat-public -R

exit
