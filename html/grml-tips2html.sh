#!/bin/sh

OUTFILE=grml_tips.html
INFILE=grml_tips
count=0

cp grml_tips grml_tips.orig
cp grml_tips grml_tips.sed
sed -i 's/>/\&gt;/' grml_tips.sed
sed -i 's/</\&lt;/' grml_tips.sed
mv grml_tips.sed grml_tips

:> grml_tips.html
cat >> $OUTFILE << EOF
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>grml.org - grml Tips</title>
<meta name="Title" content="grml.org - grml Tips" />
<meta name="Author" content="the grml team [www.grml.org/team/]" />
<meta name="Keywords" content="grml.org, grml" />
<meta name="Description" content="grml Tips" />
<meta name="Abstract" content="grml, just another linux-distribution" />
<meta name="fdse-index-as" content="http://www.grml.org/tips/" />
<meta name="Robots" content="index,follow" />
<meta name="Language" content="english" />
<meta name="identifier-url" content="http://www.grml.org/" />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="home" href="/" title="grml.org" />
<link rel="help" href="/features/" title="About" />
<link rel="author" href="/team/" title="Team" />
<link rel="contents" href="/sitemap/" title="Sitemap" />
<link rel="search" href="/search/" title="Search" />
<link rel="icon" href="/favicon.png" type="image/png" />
<meta http-equiv="content-Type" content="application/xhtml+xml; charset=iso-8859-1" />
<link rel="stylesheet" href="/style.css" type="text/css" />
</head>
<body>

EOF

echo "<a name=\"$count\"></a>" >> $OUTFILE
echo "<pre>" >> $OUTFILE
oifs=$IFS
IFS=''
while read LINE
do  
    case $LINE in
        --\ *)
          count=$(($count + 1))
          LINE="<a name=\"$count\"></a><hr />${LINE#-- }"
          echo "</pre>" >> $OUTFILE
          echo $LINE >> $OUTFILE
          echo "<pre>" >> $OUTFILE
          ;;
        *)
          echo $LINE >> $OUTFILE
          ;;
    esac
done < $INFILE
IFS=$oifs

cat >> $OUTFILE << EOF

</body>
</html>
EOF
