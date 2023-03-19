set -ex
arch=$(dpkg --print-architecture)
if [[ $arch == *"arm64"* || $arch == *"aarch64"* ]]; then
  echo "installing arm64"
  curl -L -o /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v{{yq_version}}/yq_linux_arm64
fi
if [[ $arch == *"armv"* || $arch == *"armh"* ]]; then
  echo "installing arm"
  curl -L -o /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v{{yq_version}}/yq_linux_arm
fi
if [[ $arch == *"amd64"* ]]; then
  echo "installing amd64"
  curl -L -o /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v{{yq_version}}/yq_linux_amd64
fi
chmod +x /usr/local/bin/yq

yq --version
