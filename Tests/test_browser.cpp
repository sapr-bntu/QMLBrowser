#include <QtCore/QString>
#include <QtTest/QtTest>
#include <QtCore/QCoreApplication>
#include "../Browser/browser/browser.h"

class TestBrowser : public QObject
{
    Q_OBJECT
    
public:
    TestBrowser();
    
private Q_SLOTS:
    void initTestCase();
    void cleanupTestCase();
    void on_lineEdit_returnPressedCheckTest();
    void exitBrowserCheckTest();
    void on_pushButton_clickedCheckTest();
    void GetWebKitVersion();
    void UrlWithoutDomenTest();
    void UrlWithDomenTest();
    void UrlWithoutHTTPTest();
    void UrlWithHTTPTest();
    void ComboboxClearTest();


};
//
TestBrowser::TestBrowser()
{
}

void TestBrowser::initTestCase()
{
}

void TestBrowser::cleanupTestCase()
{
}

void TestBrowser::on_lineEdit_returnPressedCheckTest()
{
   Browser br;
   bool flag=br.on_lineEdit_returnPressedCheck();
   QCOMPARE(true, flag);
}

void TestBrowser::exitBrowserCheckTest()
{
   Browser br;
   bool flag=br.exitBrowserCheck();
   QCOMPARE(true, flag);
}

void TestBrowser::on_pushButton_clickedCheckTest()
{
   Browser br;
   bool flag=br.on_pushButton_clickedCheck();
   QCOMPARE(true, flag);
}

void TestBrowser::GetWebKitVersion()
{
    QVERIFY(qWebKitVersion().toDouble() > 0);
}

void TestBrowser::UrlWithoutDomenTest()
{
    Browser br;
    bool flag=br.UrlWithoutDomen("http://googlecom");
    QCOMPARE(true, flag);
}

void TestBrowser::UrlWithDomenTest()
{
    Browser br;
    bool flag=br.UrlWithDomen("http://google.com");
    QCOMPARE(true, flag);
}

void TestBrowser::UrlWithoutHTTPTest()
{
    Browser br;
    bool flag=br.UrlWithoutHTTP("google.com");
    QCOMPARE(true, flag);
}

void TestBrowser::UrlWithHTTPTest()
{
    Browser br;
    bool flag=br.UrlWithHTTP("http://google.com");
    QCOMPARE(true, flag);
}

void TestBrowser::ComboboxClearTest()
{
    Browser br;
    bool flag=br.ComboboxClear();
    QCOMPARE(true, flag);
}


QTEST_MAIN(TestBrowser)

#include "test_browser.moc"
