#
# djangovers.awk
#
# created: 180214
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

$0 ~ ext && /\/archive\// && $2 !~ /\.[0-9]a/ && vers == "" \
      {
        vers = $2

        cnt = split (vers, vers_a, "/");

        vers = vers_a[5]
      }

### END RULE ###

END   {
	# this is the end rule
        print vers
      }