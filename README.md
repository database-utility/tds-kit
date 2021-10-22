# MSSQLClient

Microsoft SQL Server client for iOS, watchOS, tvOS, and macOS. An Objective-C wrapper around the open-source [FreeTDS](https://github.com/FreeTDS/freetds/) library.


## Sample Usage

<pre>
&#35;import "MSSQLClient.h"

MSSQLClient* client = [MSSQLClient new];
[client connect:@"server\instance:port" username:@"user" password:@"password" database:@"db" completion:^(BOOL success) {
    if (success) {
      [client execute:@"SELECT * FROM Users" completion:^(NSArray* results) {
        for (NSArray* table in results) {
          for (NSDictionary* row in table) {
            for (NSString* column in row) {
              NSLog(@"%@=%@", column, row[column]);
            }
          }
        }             
        [client disconnect];
      }];
    }
}];
</pre>


## Type Conversion

MSSQLClient maps SQL Server data types into the following native Objective-C types:

* bigint → NSNumber
* binary(n) → NSData
* bit → NSNumber
* char(n) → NSString
* cursor → **not supported**
* date → **NSDate** or **NSString**†
* datetime → NSDate
* datetime2 → **NSDate** or **NSString**†
* datetimeoffset → **NSDate** or **NSString**†
* decimal(p,s) → NSNumber
* float(n) → NSNumber
* image → **NSData**
* int → NSNumber
* money → NSDecimalNumber **(last 2 digits are truncated)**
* nchar → NSString
* ntext → NSString
* null → NSNull
* numeric(p,s) → NSNumber
* nvarchar → NSString
* nvarchar(max) → NSString
* real → NSNumber
* smalldatetime → NSDate
* smallint → NSNumber
* smallmoney → NSDecimalNumber
* sql_variant → **not supported**
* table → **not supported**
* text → NSString*
* time → **NSDate** or **NSString**†
* timestamp → NSData
* tinyint → NSNumber
* uniqueidentifier → NSUUID
* varbinary → NSData
* varbinary(max) → NSData
* varchar(max) → NSString*
* varchar(n) → NSString
* xml → NSString

\*The maximum length of a string in a query is configured on the server via the `SET TEXTSIZE` command. To find out your current setting, execute `SELECT @@TEXTSIZE`. SQLClient uses **4096** by default. To override this setting, update the `maxTextSize` property.

†The following data types are only converted to **NSDate** on TDS version **7.3** and higher. By default FreeTDS uses version **7.1** of the TDS protocol, which converts them to **NSString**. To use a higher version of the TDS protocol, add an environment variable to Xcode named `TDSVER`. Possible values are
`4.2`, `5.0`, `7.0`, `7.1`, `7.2`, `7.3`, `7.4`, `auto`.
A value of `auto` tells FreeTDS to use an autodetection (trial-and-error) algorithm to choose the highest available protocol version.

* date
* datetime2
* datetimeoffset
* time


## Testing

The `MSSQLClientTests` target contains integration tests which require a connection to an instance of SQL Server. The integration tests have passed successfully on the following database servers:

* SQL Server 7.0 (TDS 7.0)
* SQL Server 2000 (TDS 7.1)
* SQL Server 2005 (TDS 7.2)
* SQL Server 2008 (TDS 7.3)
* **TODO: add more!**

To configure the connection for your server:

* In Xcode, go to _Edit Scheme…_ and select the _Test_ scheme.
* On the _Arguments_ tab, uncheck _Use the Run action's arguments and environment variables_
* Add the following environment variables for your server. The values should be the same as you pass in to the `connect:` method.
	* `HOST` (`server\instance:port`)
	* `DATABASE` (optional)
	* `USERNAME`
	* `PASSWORD`


## Known Issues

PRs welcome!

* **strings**: FreeTDS incorrectly returns an empty string "" for a single space " "
* **money**: FreeTDS will truncate the rightmost 2 digits.
* No support for stored procedures with out parameters (yet)
* No support for returning number of rows changed (yet)

