echo "clone link is $2"
echo "input file to replace $1"
folder_name=$( echo $2 | rev | cut -d "." -f2 | cut -d"/" -f1 | rev )
echo "$folder_name"
git clone $2
while read line;
do echo "$line";
key=$(echo $line | cut -d: -f1)
sed -i "s/$key:.*/$line/g" $folder_name/$3
done<"$1"
cd $folder_name
git add .
git commit -m "changed application properties"
git push origin main
rm -rf $folder_name
