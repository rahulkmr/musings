open System.IO

let rec filesUnder basePath =
    seq {
    	yield! Directory.GetFiles(basePath)
    	for subDir in Directory.GetDirectories(basePath) do
    		yield! filesUnder subDir
    }
