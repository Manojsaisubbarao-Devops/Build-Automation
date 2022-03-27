export filepath=$(find $pwd . -maxdepth 1 -type f \( -name "build.gradle" -o -name "pom.xml" -o -name "package.json" -o -name "build.gradle.kts" \))
export FILE_NAME=$(echo $filepath | tr -s '/' '\n' | tail -1)
echo "$FILE_NAME"
 case "$FILE_NAME" in
         pom.xml) mvn clean package -DskipTests -Dhttp.proxyHost=www-proxy-hqdc.us.oracle.com -Dhttp.proxyPort=80 -Dhttps.proxyHost=www-proxy-hqdc.us.oracle.com -Dhttps.proxyPort=80 "-Dhttp.nonProxyHosts=*.oracle.com|localhost" ;;
             build.gradle) ./gradlew -Dhttp.proxyHost=www-proxy-hqdc.us.oracle.com -Dhttp.proxyPort=80 -Dhttps.proxyHost=www-proxy-hqdc.us.oracle.com -Dhttps.proxyPort=80 "-Dhttp.nonProxyHosts=*.oracle.com|localhost" && ./gradlew build -x test -Dhttp.proxyHost=www-proxy-hqdc.us.oracle.com -Dhttp.proxyPort=80 -Dhttps.proxyHost=www-proxy-hqdc.us.oracle.com -Dhttps.proxyPort=80 "-Dhttp.nonProxyHosts=*.oracle.com|localhost" ;;
             build.gradle.kts) gradle build -Dhttp.proxyHost=www-proxy-hqdc.us.oracle.com -Dhttp.proxyPort=80 -Dhttps.proxyHost=www-proxy-hqdc.us.oracle.com -Dhttps.proxyPort=80 "-Dhttp.nonProxyHosts=*.oracle.com|localhost" && gradle build -x test -Dhttp.proxyHost=www-proxy-hqdc.us.oracle.com -Dhttp.proxyPort=80 -Dhttps.proxyHost=www-proxy-hqdc.us.oracle.com -Dhttps.proxyPort=80 "-Dhttp.nonProxyHosts=*.oracle.com|localhost" ;;
             package.json) npm install && npm run build ;;
  esac

