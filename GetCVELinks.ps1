# Finds all JAR files within the specified directory path and outputs a HTML file
# with hyperlinks to search the online CVE database.
#
# Note: Requires a GitHub account.  Signing up is free and simple at https://github.com.
#
# Before clicking hyperlinks in the output file, please log in to GitHub. 

# Change this path to the location of JAR files to scan.  Search is recursive.
$searchDir = "C:\Program Files\Apache Tomcat"

$fileHeading = '<h2>CVE Search Links</h2>'
$outputFile = "./CVEList.html"

Out-File -Encoding Ascii -filepath $outputFile -InputObject $fileHeading

$fileList = (Get-ChildItem -Recurse -Path $searchDir -Include *.jar).name

foreach ($file in $fileList)
{
  if ($file.Contains("-"))
    {
    $shortName = $file.Substring(0, $file.IndexOf("-"))
    }
  else
    {
    $shortName = $file.Substring(0, $file.IndexOf("."))
    }
  $URLEntry = '<a href="https://github.com/search?q=repo%3ACVEProject%2FcvelistV5%20repo%3ACVEProject%2FcvelistV5%20%22%20' + $shortName + '%22%20AND%20(%22HIGH%22%20OR%20%22CRITICAL%22)%20NOT%20%2F' + $shortName + '%5Ba-zA-Z0-9%5D%2F&type=code" target="_blank">' + $file + '</a><br>'
  $URLEntry | Add-Content $outputFile
}