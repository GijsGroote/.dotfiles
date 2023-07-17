
## search and replace in multiple files:

#### populate the quickfix list with all files that contain "Tom" in the project.
`:vimgrep /Tom/g **/*`


#### see the quickfix list with:
`:copen`

#### then to search and replace "Tom" with "Chris":

`:cfdo %s/Tom/Chris/gc | update`

### match every \gls{whatever} and replace it by whatever
`:%s/\\gls{\(.\{,2}\)}/\1/gce`
