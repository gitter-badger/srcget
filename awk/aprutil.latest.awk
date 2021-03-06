#
# aprutil.latest.awk
#
# created: 030614
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

/apr-util/ && $0 ~ ext && !/_mod/ && vers == "" \
{
  line = $0
  gsub(/["<>]/, " ", line);
  split(line, line_a, " ");

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ ext && item ~ /http/ && vers == "")
    {
      vers = item
    }
  }
}

### END RULE ###

END   {
	if (vers != "") { print vers; } 
      }
