'******************************************************************
' GoodbyeDPI Otomatik Başlatıcı
' Bu script zararsızdır ve sadece internet erişimini iyileştirmek için kullanılır
'******************************************************************

'------------------------------------------------------------------
' BU PROGRAM NE YAPAR?
' 1. GoodbyeDPI programını arka planda çalıştırır
' 2. Otomatik olarak yönetici yetkisiyle başlatır
' 3. Windows başlangıcında otomatik çalışması için ayarlar
'------------------------------------------------------------------

'------------------------------------------------------------------
' GÜVENLİK NOTU:
' Bu script tamamen güvenlidir ve sisteminize zarar vermez
' Kaynak kodları yukarıda görüldüğü gibi açıktır
' İsterseniz Windows başlangıcından kaldırabilirsiniz
'------------------------------------------------------------------

' Önce başlangıçta kayıtlı olup olmadığını kontrol et
Set WshShell = CreateObject("WScript.Shell")
strStartup = WshShell.SpecialFolders("Startup")
Set fso = CreateObject("Scripting.FileSystemObject")

' Program başlatma (Arka planda ve yönetici yetkisiyle)
CreateObject("Shell.Application").ShellExecute "x86_64\goodbyedpi.exe", "-5 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253", "", "runas", 0

' Eğer başlangıçta kayıtlı değilse kaydet
If Not fso.FileExists(strStartup & "\GoodbyeDPI.lnk") Then
    Set oShellLink = WshShell.CreateShortcut(strStartup & "\GoodbyeDPI.lnk")
    oShellLink.TargetPath = WScript.ScriptFullName
    oShellLink.Save
    MsgBox "Program başarıyla başlangıca eklendi!" & vbCrLf & vbCrLf & _
           "Artık bilgisayarınız her açıldığında otomatik çalışacak.", 64, "Bilgi"
End If

'------------------------------------------------------------------
' NASIL KALDIRILIR?
' 1. Windows + R tuşlarına basın
' 2. shell:startup yazıp Enter'a basın
' 3. Açılan klasörden "GoodbyeDPI" kısayolunu silin
'------------------------------------------------------------------

'------------------------------------------------------------------
' SORUN GİDERME:
' - Program çalışmıyorsa yönetici olarak çalıştırmayı deneyin
' - Hata alırsanız programın doğru klasörde olduğundan emin olun
' - Sorularınız için: discord.gg/cortexbot
'------------------------------------------------------------------