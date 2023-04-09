#!/bin/bash
#файл генерує json файл параметри запуску

#sh ./MakePackageJson.sh  {{GITHUB_REPOSITORY}} $(sha256sum NanitCore.zip)

EMAIL=""
HELP_ONLINE=""

GITHUB_OWNER_REPO=${1}
SHA256=${2}
FILE_NAME=${3}
OUT_FILE="package_NanitCore_index.json"
FILE_SIZE=$(stat -c %s ${FILE_NAME})
OWNER=$(echo "${GITHUB_OWNER_REPO}" | cut -d '/' -f 1)
REPO=$(echo "${GITHUB_OWNER_REPO}" | cut -d '/' -f 2)

HOST="${OWNER}.github.io"
FILE_PATH="${REPO}/"

DOWNLOAD_URL="${HOST}/${REPO}/${FILE_NAME}"
WEB_SITE_URL="${HOST}/${REPO}"
# mails=$(echo $IN | tr "/" "\n")
echo "FIRST${0}"
echo "GITHUB_OWNER_REPO ${GITHUB_OWNER_REPO}"
echo "OWNER ${OWNER}"
echo "REPO ${REPO}"
echo "DOWNLOAD_URL ${DOWNLOAD_URL}"
echo "FILE_SIZE ${FILE_SIZE}"

cat <<EOF > "${OUT_FILE}"
{
  "packages": [
    {
      "name": "Nanit",
      "maintainer": "NanitRobots",
      "websiteURL": "${WEB_SITE_URL}",
      "email": "${EMAIL}",
      "help": {
        "online": "${HELP_ONLINE}"
      },
      "platforms": [
        {
          "name": "Nanit",
          "architecture": "avr",
          "version": "0.0.3",
          "category": "Contributed",
          "help": {
            "online": ""
          },
          "url": "${HOST}/${FILE_PATH}${FILE_NAME}",
          "archiveFileName": "${FILE_NAME}",
          "checksum" : "SHA-256:${SHA256}",
          "size" : "${FILE_SIZE}",
          "boards": [
            {
              "name": "Nanit Discovery 2.0"
            },
            {
              "name": "Nanit Discovery 3"
            },
            {
              "name": "Nanit Discovery 3.1"
            },
            {
              "name": "Nanit Smart Home (Nanit 3.1 based)"
            },
            {
              "name": "Nanit Smart Home (Nanit 3.22 based)"
            }
          ]
        }
      ]
    }
  ]
}
EOF