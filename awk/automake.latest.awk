#
# automake.latest.awk
#
# created: 090714
#

### FUNCTIONS ###

function compare_versions(a, b)
{
  c_1 = split(a, a_a, ".");
  c_2 = split(b, b_a, ".");

  if (c_1 < 2 || c_2 < 2) { return "ERRINPUT c_1 = "c_1 " c_2 = "c_2; }

  if (a_a[1] > b_a[1]) return a;
  if (a_a[1] < b_a[1]) return b;

  if (a_a[2] > b_a[2]) return a;
  if (a_a[2] < b_a[2]) return b;

  if (a_a[3] > b_a[3]) return a;
  if (a_a[3] < b_a[3]) return b;

  if (a_a[4] > b_a[4]) return a;
  if (a_a[4] < b_a[4]) return b;

  return  "EQ"
}

### MAIN LOOP ###

# begin rule

BEGIN {
        good_vers = "0.0.0"
        initial_vers = good_vers
      }


# custom rules

/automake/&& $0 ~ ext && !/\.sig/ && !/\.diff/ \
{ 
  line = $0
  gsub(/[\"<>]/, " ", line);
  split (line, line_a, " ");

  for (idx in line_a)
  {
    item = line_a[idx]

    if (item ~ /[0-9]+\.[0-9]+\.[0-9]+/ || item ~ /[0-9]+\.[0-9]+/)
    {
      vers = item
      next
    }
  }
}

### end rule ###

END   {
        if (vers != "")
        {
	   print vers
        }
      }

### EOF ###
