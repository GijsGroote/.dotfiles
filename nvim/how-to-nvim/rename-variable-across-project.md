

grep files containing mySearchString recursively over all file types, put in quickfix list.
```
:vimgrep /mySearchString/**/*
```

inspect with ```:copen```.

use ```:cdo myCommand``` to iterate over each matching line.
use ```:cfdo myCommand``` to iterate over each matching file.

