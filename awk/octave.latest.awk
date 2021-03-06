#
# octave.latest.awk
#
# created: 1833 120514
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && !/\.sig/ \
{
   line = $0
   gsub(/[<>]/, "\"", line);
   split(line, line_a, "\"");

   for(idx in line_a)
   {
     if (line_a[idx] ~ ext)
     {
       vers = line_a[idx]
     }
   }
}

### END RULE ###

END   {
	if (vers != "")
        {
          print vers
        }
      }
