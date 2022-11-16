echo "How many places can be found in each country?"
awk -F '\t' '{print $9}' 'places.tsv' | tail -n +2 | rev | cut -d ',' -f 1 | tr -d ' ' | rev | sort | uniq -c | sort -r |
grep -E 'UnitedStates$|Italy$|UnitedKingdom$|Spain$|France$'

# This needs a version of bash which is not outdated (do not use default bash from macOS to execute this) Bash 5.2 was used to execute this script
shopt -s lastpipe

echo "How many people, on average, have visited the places in each country?"
awk -F '\t' '{print $9}' 'places.tsv' | tail -n +2 | rev | cut -d ',' -f 1 | tr -d ' ' | rev | countries=$(</dev/stdin)
awk -F '\t' '{print $4}' 'places.tsv' | tail -n +2 | num_visited=$(</dev/stdin)
paste -d ' ' <(echo "$countries") <(echo "$num_visited") | grep -E '^(UnitedStates|Italy|UnitedKingdom|Spain|France)\s[0-9]+$' | count_num=$(</dev/stdin)
echo "$count_num" | grep 'UnitedStates' | awk '{n+=$2} END {print "United States: " n/NR}'
echo "$count_num" | grep 'Italy' | awk '{n+=$2} END {print "Italy: " n/NR}'
echo "$count_num" | grep 'UnitedKingdom' | awk '{n+=$2} END {print "UnitedKingdom: " n/NR}'
echo "$count_num" | grep 'Spain' | awk '{n+=$2} END {print "Spain: " n/NR}'
echo "$count_num" | grep 'France' | awk '{n+=$2} END {print "France: " n/NR}'


echo "How many people in total want to visit the places in each country?"
awk -F '\t' '{print $5}' 'places.tsv' | tail -n +2 | num_want=$(</dev/stdin)
paste -d ' ' <(echo "$countries") <(echo "$num_want") | grep -E '^(UnitedStates|Italy|UnitedKingdom|Spain|France)\s[0-9]+$' | count_want=$(</dev/stdin)
echo "$count_want" | grep 'UnitedStates' | awk '{n+=$2} END {print "United States: " n}'
echo "$count_want" | grep 'Italy' | awk '{n+=$2} END {print "Italy: " n}'
echo "$count_want" | grep 'UnitedKingdom' | awk '{n+=$2} END {print "UnitedKingdom: " n}'
echo "$count_want" | grep 'Spain' | awk '{n+=$2} END {print "Spain: " n}'
echo "$count_want" | grep 'France' | awk '{n+=$2} END {print "France: " n}'