' 创建一个文本文件对象
Set objFSO = CreateObject("Scripting.FileSystemObject")

' 输入文件名和输出文件名
inputFile = "input.txt"
outputFile = "output.txt"

' 打开输入文件进行读取
Set objInputFile = objFSO.OpenTextFile(inputFile, 1)

' 创建输出文件
Set objOutputFile = objFSO.CreateTextFile(outputFile, True)

' 正则表达式模式用于匹配链接和 "来源：" 字符串
pattern = "((http|https|ftp)://[^\s/$.?#].[^\s]*)|来源："

' 逐行读取输入文件
Do Until objInputFile.AtEndOfStream
    strLine = objInputFile.ReadLine
    ' 使用正则表达式替换来移除链接和 "来源：" 字符串
    Set objRegExp = New RegExp
    objRegExp.Global = True
    objRegExp.IgnoreCase = True
    objRegExp.Pattern = pattern
    strLine = objRegExp.Replace(strLine, "")
    ' 写入处理后的行到输出文件
    objOutputFile.WriteLine strLine
Loop

' 关闭文件
objInputFile.Close
objOutputFile.Close

WScript.Echo "链接和来源已被移除并保存到 " & outputFile
