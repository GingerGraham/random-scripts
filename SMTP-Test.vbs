' VB Script to collect SMTP server details from the user and send an email based on some user input with default options
' This script is designed to target SMTP servers which do not require authentication
' This script does not accept attachments
' This script is intended to be used with the following command line:
' cscript.exe smtp.vbs /s:smtpserver /f:fromaddress /t:toaddress /o:subject /m:message
' The following arguments are supported:
' /s:smtpserver - The SMTP server to use
' /p:port - The port to use (default is 25)
' /f:fromaddress - The from address to use
' /t:toaddress - The to address to use
' /o:subject - The subject to use (default is "Test Email <date> <time>")
' /m:message - The message to use (default is "This is a test email sent at <date> <time>")

' Set the default values for the variables
Dim smtpServer, port, fromAddress, toAddress, subject, message
' Set the default port to 25
port = 25
' Set the default subject to be "Test Email <date> <time>"
subject = "Test Email " & Format(Now, "mm/dd/yyyy hh:mm:ss")
' Set the default message to be "This is a test email sent at <date> <time>"
message = "This is a test email sent at " & Format(Now, "mm/dd/yyyy hh:mm:ss")

' Create the WScript object
Set objArgs = WScript.Arguments
' Loop through the arguments
For i = 0 to objArgs.Count - 1
    ' Split the argument into the name and value
    arg = Split(objArgs(i), ":")
    ' Check the name of the argument
    Select Case LCase(arg(0))
        Case "/s"
            ' Set the SMTP server
            smtpServer = arg(1)
        Case "/p"
            ' Set the port
            port = arg(1)
        Case "/f"
            ' Set the from address
            fromAddress = arg(1)
        Case "/t"
            ' Set the to address
            toAddress = arg(1)
        Case "/o"
            ' Set the subject
            subject = arg(1)
        Case "/m"
            ' Set the message
            message = arg(1)
    End Select
Next

' Check to make sure the SMTP server was specified
If smtpServer = "" Then
    ' Prompt the user for the SMTP server
    smtpServer = InputBox("Please enter the SMTP server to use:", "SMTP Server")
End If

' Check to make sure the from address was specified
If fromAddress = "" Then
    ' Prompt the user for the from address
    fromAddress = InputBox("Please enter the from address to use:", "From Address")
End If

' Check to make sure the to address was specified
If toAddress = "" Then
    ' Prompt the user for the to address
    toAddress = InputBox("Please enter the to address to use:", "To Address")
End If

' Create the SMTP object
Set objSMTP = CreateObject("CDO.Message")
' Set the SMTP server
objSMTP.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = smtpServer
' Set the SMTP port
objSMTP.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = port
' Set the SMTP authentication to false
objSMTP.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 0
' Update the configuration
objSMTP.Configuration.Fields.Update
' Set the from address
objSMTP.From = fromAddress
' Set the to address
objSMTP.To = toAddress
' Set the subject
objSMTP.Subject = subject
' Set the message
objSMTP.TextBody = message
' Send the email
objSMTP.Send
