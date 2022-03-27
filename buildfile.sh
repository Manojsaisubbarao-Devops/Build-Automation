export filepath=$(find $pwd . -maxdepth 1 -type f \( -name "build.gradle" -o -name "pom.xml" -o -name "package.json" -o -name "build.gradle.kts" \))
export FILE_NAME=$(echo $filepath | tr -s '/' '\n' | tail -1)
echo "$FILE_NAME"
 case "$FILE_NAME" in
         pom.xml) mvn clean package -DskipTests ;;
             build.gradle) ./gradlew  ;;
             build.gradle.kts) gradle build  ;;
             package.json) npm install && npm run build ;;
  esac

