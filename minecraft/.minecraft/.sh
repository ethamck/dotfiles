# Creates `portablemc` instances.
# To apply configuration from this folder in an instance-specific way you must make .minecraft and the instance before stow-ing.
dir="$(cd "$( dirname "$0" )" && pwd)"; cd $dir
mkdir "_$1"; cd "_$1"
echo "portablemc --work-dir=\$(cd \$(dirname \$0) && pwd) start $2 \$@" > '.sh'
chmod u+x .sh
./.sh
