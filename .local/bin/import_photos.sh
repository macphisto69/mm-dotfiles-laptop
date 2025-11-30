#!/bin/sh
#
base_dir="/home/michael/Pictures/EOS_100D"
source_dir="$1"

### CR2 SECTION
# for file in "${source_dir}"/*.CR2
for file in $(find "$source_dir" -type f \( -iname "*.CR2" -o -iname "*.cr2" \))
do

  filename=$(basename "${file}")
  year=$(exiv2 "$file" 2>/dev/null | grep 'Image timestamp' | awk -F ':' '{print $2}' | awk '{$1=$1;print}')
  # echo "${year}"
  month=$(exiv2 "$file" 2>/dev/null | grep 'Image timestamp' | awk -F ':' '{print $3}')
  # echo "${month}"

  if [[ ! -d "${base_dir}"/"$year" ]]
  then
    mkdir "${base_dir}"/"$year"
  fi

  if [[ ! -d "${base_dir}"/"$year"/"${month}" ]]
  then
    mkdir "${base_dir}"/"$year"/"${month}"
  fi

  mv -v "${file}" "${base_dir}"/"$year"/"${month}/${filename}"
  # mv -v "${file%.CR2}.xmp" "${base_dir}"/"$year"/"${month}/${filename}"
  # echo "${base_dir}"/"$year"/"${month}/${filename}"
done

### JPG SECTION

base_dir="/home/michael/Pictures/Exported_JPG"

for file in $(find "$source_dir" -type f \( -iname "*.JPG" -o -iname "*.jpg" \))
do

  filename=$(basename "${file}")
  year=$(exiv2 "$file" 2>/dev/null | grep 'Image timestamp' | awk -F ':' '{print $2}' | awk '{$1=$1;print}')
  # echo "${year}"
  month=$(exiv2 "$file" 2>/dev/null | grep 'Image timestamp' | awk -F ':' '{print $3}')
  # echo "${month}"

  if [[ ! -d "${base_dir}"/"$year" ]]
  then
    mkdir "${base_dir}"/"$year"
  fi

  if [[ ! -d "${base_dir}"/"$year"/"${month}" ]]
  then
    mkdir "${base_dir}"/"$year"/"${month}"
  fi

  mv -v "${file}" "${base_dir}"/"$year"/"${month}/${filename}"
  # mv -v "${file%.CR2}.xmp" "${base_dir}"/"$year"/"${month}/${filename}"
  # echo "${base_dir}"/"$year"/"${month}/${filename}"
done