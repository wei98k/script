' 创建一个文本文件对象
Set objFSO = CreateObject("Scripting.FileSystemObject")

' 输入文件名和输出文件名
inputFile = "input.txt"
outputFile = "output.txt"

' 打开输入文件进行读取
Set objInputFile = objFSO.OpenTextFile(inputFile, 1)

' 创建输出文件
Set objOutputFile = objFSO.CreateTextFile(outputFile, True)

' 正则表达式模式用于匹配中文字符
chinesePattern = "[\u4e00-\u9fa5]"

' 逐行读取输入文件
Do Until objInputFile.AtEndOfStream
    strLine = objInputFile.ReadLine
    ' 去除链接
    Set linkRegExp = New RegExp
    linkRegExp.Global = True
    linkRegExp.IgnoreCase = True
    linkRegExp.Pattern = "https://\S+|http://\S+|www\.\S+"
    strLine = linkRegExp.Replace(strLine, "")

    ' 去除字符“来源：”
    Set sourceRegExp = New RegExp
    sourceRegExp.IgnoreCase = True
    sourceRegExp.Pattern = "来源："
    strLine = sourceRegExp.Replace(strLine, "")

    ' 使用正则表达式替换来移除中文字符
    Set chineseRegExp = New RegExp
    chineseRegExp.Global = True
    chineseRegExp.IgnoreCase = True
    chineseRegExp.Pattern = chinesePattern
    strLine = chineseRegExp.Replace(strLine, "")

    ' 写入处理后的行到输出文件
    objOutputFile.WriteLine strLine
Loop

' 关闭文件
objInputFile.Close
objOutputFile.Close

WScript.Echo "已移除链接、字符“来源：”和中文字符，结果已保存到 " & outputFile
