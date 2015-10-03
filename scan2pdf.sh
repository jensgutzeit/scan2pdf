#!/bin/bash
#
# scan2pdf

dpi=150
n=1
pdfname=scan.pdf

while [[ $# > 1 ]]
do
   key=$1

   case $key in
      -d|--dpi)
      dpi=$2
      shift
      ;;
      -n)
      n=$2
      shift
      ;;
   esac

   shift
done

if [[ $# > 0 ]]; then
   pdfname=$1
   shift
fi

if [[ $n == 1 ]]; then
   echo "Scanning one page at $dpi dpi to $pdfname ..."
else
   echo "Scanning $n pages at $dpi dpi to $pdfname ..."
fi

if [[ "$dpi" -lt 100 ]]; then
   echo "Setting resolution to useful 100 dpi..."
   dpi=100
fi

dir=`mktemp -d`
images=
for i in `seq 1 $n`;
do
   read -p "Press ENTER to scan page $i ..."
   imgname=$dir/img$i.pnm
   scanimage -p --resolution $dpi --mode Gray -x 210 -y 297 > $imgname
   images+=" $imgname"
done

echo "Creating PDF file ..."
convert -compress jpeg -quality 75 $images $pdfname

echo "Erasing scanned images ..."
wipe -s -z $images
rmdir $dir
