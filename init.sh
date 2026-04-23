#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target_home="${HOME}"

if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow is required but not installed."
  echo "Install it first, for example: sudo apt update && sudo apt install -y stow"
  exit 1
fi

cat > "${target_home}/.stowrc" <<EOF
--target=${target_home}
EOF

packages=()
while IFS= read -r dir; do
  packages+=("$(basename "${dir}")")
done < <(find "${repo_root}" -mindepth 1 -maxdepth 1 -type d ! -name .git ! -name .claude | sort)

if [ "${#packages[@]}" -eq 0 ]; then
  echo "No Stow packages found in ${repo_root}."
  exit 0
fi

echo "Using repository: ${repo_root}"
echo "Using target home: ${target_home}"
echo "Writing ${target_home}/.stowrc"
echo "Stowing packages: ${packages[*]}"

cd "${repo_root}"
stow "${packages[@]}"

echo "Initialization complete."
