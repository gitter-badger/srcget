#
# ghc.latest.awk
# it's haskell babe
#
# created: 250314
#

### FUNCTIONS ###

### MAIN RULE ###

BEGIN {
        vers = ""
      }

# custom rules

/^$/ { next }

$0 ~ ext && /\/archive\// && $2 !~ /\.[0-9]a/ && vers == "" \
      {
        vers = $2

        cnt = split (vers, vers_a, "/");

        if (cnt > 1)
        {
          vers = vers_a[5]
        }
      }

### END RULE ###

END   {
        print vers
      }
