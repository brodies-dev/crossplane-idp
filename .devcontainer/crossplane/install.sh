# if [[ -z $VERSION ]]; then
#     printf >&2 'required: version\n'
#     exit 2
# fi

curl -sL "https://cli.upbound.io" | sh
mv up /usr/local/bin/