Ë:
SC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\FxAgendamientoMasivo.cs
	namespace 	 
FxAgendamientoMasivo
 
{ 
public 

class  
FxAgendamientoMasivo %
{ 
private 
readonly 
IMessageService (
_messageService) 8
;8 9
public  
FxAgendamientoMasivo #
(# $
IMessageService$ 3
messageService4 B
)B C
{ 	
_messageService 
= 
messageService ,
;, -
} 	
[!! 	
FunctionName!!	 
(!! 
nameof!! 
(!! 
AgendamientoMasivo!! /
)!!/ 0
)!!0 1
]!!1 2
["" 	
FixedDelayRetry""	 
("" 
$num"" 
,"" 
$str"" &
)""& '
]""' (
[## 	
OpenApiOperation##	 
(## 
operationId## %
:##% &
$str##' ;
,##; <
tags##= A
:##A B
new##C F
[##F G
]##G H
{##I J
$str##K _
}##` a
,##a b
Description##c n
=##o p
$str	##q ª
,
##ª º
Summary
##Ω ƒ
=
##≈ ∆
$str
##« ë
)
##ë í
]
##í ì
[$$ 	
OpenApiSecurity$$	 
($$ 
$str$$ '
,$$' (
SecuritySchemeType$$) ;
.$$; <
ApiKey$$< B
,$$B C
Name$$D H
=$$I J
$str$$K Q
,$$Q R
In$$S U
=$$V W'
OpenApiSecurityLocationType$$X s
.$$s t
Query$$t y
)$$y z
]$$z {
[%% 	
OpenApiRequestBody%%	 
(%% 
contentType%% '
:%%' (
$str%%) ;
,%%; <
bodyType%%= E
:%%E F
typeof%%G M
(%%M N
Request%%N U
)%%U V
,%%V W
Required%%X `
=%%a b
true%%c g
,%%g h
Description%%i t
=%%u v
$str	%%w ã
)
%%ã å
]
%%å ç
[&& 	#
OpenApiResponseWithBody&&	  
(&&  !

statusCode&&! +
:&&+ ,
HttpStatusCode&&- ;
.&&; <
Created&&< C
,&&C D
contentType&&E P
:&&P Q
$str&&R d
,&&d e
bodyType&&f n
:&&n o
typeof&&p v
(&&v w
ResponseResult	&&w Ö
)
&&Ö Ü
,
&&Ü á
Description
&&à ì
=
&&î ï
$str
&&ñ ≠
)
&&≠ Æ
]
&&Æ Ø
['' 	#
OpenApiResponseWithBody''	  
(''  !

statusCode''! +
:''+ ,
HttpStatusCode''- ;
.''; <

BadRequest''< F
,''F G
contentType''H S
:''S T
$str''U g
,''g h
bodyType''i q
:''q r
typeof''s y
(''y z
ResponseResult	''z à
)
''à â
,
''â ä
Description
''ã ñ
=
''ó ò
$str
''ô ¶
)
''¶ ß
]
''ß ®
[(( 	#
OpenApiResponseWithBody((	  
(((  !

statusCode((! +
:((+ ,
HttpStatusCode((- ;
.((; <
InternalServerError((< O
,((O P
contentType((Q \
:((\ ]
$str((^ p
,((p q
bodyType((r z
:((z {
typeof	((| Ç
(
((Ç É
ResponseResult
((É ë
)
((ë í
,
((í ì
Description
((î ü
=
((† °
$str
((¢ ∏
)
((∏ π
]
((π ∫
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
AgendamientoMasivo))) ;
()); <
[** 
HttpTrigger** 
(** 
AuthorizationLevel** +
.**+ ,
Function**, 4
,**4 5
$str**6 <
,**< =
Route**> C
=**D E
$str**F _
)**_ `
]**` a
HttpRequest**b m
req**n q
)**q r
{++ 	
try,, 
{-- 
var.. 
json.. 
=.. 
await..  
req..! $
...$ %
ReadAsStringAsync..% 6
(..6 7
)..7 8
;..8 9
Request// 
request// 
=//  !
JsonConvert//" -
.//- .
DeserializeObject//. ?
<//? @
Request//@ G
>//G H
(//H I
json//I M
)//M N
;//N O
string00 
file00 
=00 

FileParser00 (
.00( )
Base64_Decode00) 6
(006 7
request007 >
.00> ?
File00? C
)00C D
;00D E
List22 
<22 
string22 
[22 
]22 
>22 
	splitData22 (
=22) *

FileParser22+ 5
.225 6
	SplitFile226 ?
(22? @
file22@ D
,22D E
char22F J
.22J K
Parse22K P
(22P Q
$str22Q T
)22T U
)22U V
;22V W
var33 
data33 
=33 
(33 
dynamic33 #
)33# $

FileParser33$ .
.33. /
ParseFileInfo33/ <
<33< =
AgendamientoInfo33= M
>33M N
(33N O
	splitData33O X
)33X Y
;33Y Z
if55 
(55 
data55 
.55 
Count55 
==55 !
$num55" #
)55# $
{66 
return77 
HttpResponseHelper77 -
.77- .
Response77. 6
(776 7
StatusCodes777 B
.77B C
Status400BadRequest77C V
,77V W
new77X [
ResponseResult77\ j
(77j k
)77k l
{77m n
IsError77o v
=77w x
true77y }
,77} ~
Message	77 Ü
=
77á à
$str
77â ∑
}
77∏ π
)
77π ∫
;
77∫ ª
}88 
else99 
{:: 
foreach;; 
(;; 
var;;  
row;;! $
in;;% '
data;;( ,
);;, -
{<< 
await== 
_messageService== -
.==- .
CrearMensaje==. :
(==: ;
row==; >
)==> ?
;==? @
}>> 
return@@ 
HttpResponseHelper@@ -
.@@- ."
SuccessfulObjectResult@@. D
(@@D E
new@@E H
ResponseResult@@I W
(@@W X
)@@X Y
{@@Z [
IsError@@\ c
=@@d e
false@@f k
,@@k l
Message@@m t
=@@u v
$str	@@w í
}
@@ì î
)
@@î ï
;
@@ï ñ
}AA 
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 
HttpResponseHelperEE )
.EE) *
ResponseEE* 2
(EE2 3
StatusCodesEE3 >
.EE> ?(
Status500InternalServerErrorEE? [
,EE[ \
newEE] `
ResponseResultEEa o
(EEo p
)EEp q
{EEr s
IsErrorEEt {
=EE| }
true	EE~ Ç
,
EEÇ É
Message
EEÑ ã
=
EEå ç
ex
EEé ê
.
EEê ë
Message
EEë ò
}
EEô ö
)
EEö õ
;
EEõ ú
}FF 
}GG 	
}HH 
}II ˙
YC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Interfaces\IMessageService.cs
	namespace 	 
FxAgendamientoMasivo
 
. 

Interfaces )
{ 
public 

	interface 
IMessageService $
{ 
public		 
Task		 
CrearMensaje		  
(		  !
dynamic		! (
request		) 0
)		0 1
;		1 2
public 
RequestAgendamiento "
ConstruirRequest# 3
(3 4
dynamic4 ;
request< C
)C D
;D E
} 
} ó
\C:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Interfaces\IServiceBusService.cs
	namespace 	 
FxAgendamientoMasivo
 
. 

Interfaces )
{ 
public 

	interface 
IServiceBusService '
{ 
public		 
ServiceBusClient		 
GetServiceBusClient		  3
(		3 4
)		4 5
;		5 6
public 
Task 
EnviarMensaje !
(! "
ServiceBusClient" 2
client3 9
,9 :
string; A
mensajeB I
)I J
;J K
} 
} £
ZC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Models\CSV\AgendamientoInfo.cs
	namespace 	 
FxAgendamientoMasivo
 
. 
Models %
.% &
CSV& )
{ 
public 

class 
AgendamientoInfo !
{ 
[ 	
	CsvColumn	 
( 
$str 
)  
]  !
public 
string 
	IdUsuario 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
	CsvColumn	 
( 
$str 
) 
] 
public		 
string		 
IdMalla		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
[ 	
	CsvColumn	 
( 
$str 
) 
] 
public 
string 
IdSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
	CsvColumn	 
( 
$str 
)  
]  !
public 
string 
	IdSubsede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
	CsvColumn	 
( 
$str  
)  !
]! "
public 
string 

IdServicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
	CsvColumn	 
( 
$str 
,  
$str	! ˘
)
˘ ˙
]
˙ ˚
public 
string 
	FechaCita 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
	CsvColumn	 
( 
$str 
, 
$str  H
)H I
]I J
public 
string 
HoraCita 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Æ
\C:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Models\CSV\CsvColumnAttribute.cs
	namespace 	 
FxAgendamientoMasivo
 
. 
Models %
.% &
CSV& )
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Property% -
)- .
]. /
public 

sealed 
class 
CsvColumnAttribute *
:+ ,
	Attribute- 6
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
private		" )
set		* -
;		- .
}		/ 0
public

 
Regex

 
ValidationRegex

 $
{

% &
get

' *
;

* +
private

, 3
set

4 7
;

7 8
}

9 :
public 
CsvColumnAttribute !
(! "
string" (
name) -
)- .
:/ 0
this1 5
(5 6
name6 :
,: ;
null< @
)@ A
{ 	
} 	
public 
CsvColumnAttribute !
(! "
string" (
name) -
,- .
string/ 5
validationRegex6 E
)E F
{ 	
this 
. 
Name 
= 
name 
; 
this 
. 
ValidationRegex  
=! "
new# &
Regex' ,
(, -
validationRegex- <
??= ?
$str@ F
)F G
;G H
} 	
} 
} ≤
SC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Models\Input\Request.cs
	namespace 	 
FxAgendamientoMasivo
 
. 
Models %
.% &
Input& +
{ 
[		 
OpenApiExample		 
(		 
typeof		 
(		 
RequestExample		 )
)		) *
)		* +
]		+ ,
public

 

class

 
Request

 
{ 
[ 	
JsonProperty	 
( 
$str 
, 
Required &
=' (
Required) 1
.1 2
Always2 8
)8 9
]9 :
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' N
,N O
NullableP X
=Y Z
false[ `
)` a
]a b
public 
string 
File 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ·
YC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Models\RequestAgendamiento.cs
	namespace 	 
FxAgendamientoMasivo
 
. 
Models %
{ 
public 

class 
RequestAgendamiento $
{ 
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	IdUsuario 
{  !
get" %
;% &
set' *
;* +
}, -
[

 	
JsonProperty

	 
(

 
$str

 
)

  
]

  !
public 
string 
IdMalla 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
string 
IdSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	IdSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public 
string 

IdServicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
JsonProperty	 
( 
$str )
)) *
]* +
public 
string 
FechaAgendamiento '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
[ 	
JsonProperty	 
( 
$str (
)( )
]) *
public 
string 
HoraAgendamiento &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
JsonProperty	 
( 
$str 
) 
] 
public 
string 
Ip 
{ 
get 
; 
set  #
;# $
}% &
} 
} ï
TC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Models\ResponseResult.cs
	namespace		 	 
FxAgendamientoMasivo		
 
.		 
Models		 %
{

 
[ 
OpenApiExample 
( 
typeof 
( !
ResponseResultExample 0
)0 1
)1 2
]2 3
public 

class 
ResponseResult 
{ 
[ 	
JsonProperty	 
( 
$str 
)  
]  !
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' u
,u v
Nullablew 
=
Ä Å
false
Ç á
)
á à
]
à â
public 
bool 
IsError 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonProperty	 
( 
$str 
)  
]  !
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' P
,P Q
NullableR Z
=[ \
false] b
)b c
]c d
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' M
,M N
DefaultO V
=W X
$strY j
,j k
Nullablel t
=u v
falsew |
)| }
]} ~
public 
DateTime 
	Timestamp !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
DateTime2 :
.: ;
UtcNow; A
;A B
} 
} ≠	
UC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\OpenApi\RequestExample.cs
	namespace 	 
FxAgendamientoMasivo
 
. 
OpenApi &
{		 
public

 

class

 
RequestExample

 
:

  !
OpenApiExample

" 0
<

0 1
Request

1 8
>

8 9
{ 
public 
override 
IOpenApiExample '
<' (
Request( /
>/ 0
Build1 6
(6 7
NamingStrategy7 E
namingStrategyF T
=U V
nullW [
)[ \
{ 	
this 
. 
Examples 
. 
Add 
( "
OpenApiExampleResolver &
.& '
Resolve' .
(. /
$str '
,' (
new 
Request 
(  
)  !
{ 
File 
= 
$str (
} 
, 
namingStrategy "
) 
) 
; 
return 
this 
; 
} 	
} 
} É
\C:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\OpenApi\ResponseResultExample.cs
	namespace

 	 
FxAgendamientoMasivo


 
.

 
OpenApi

 &
{ 
public 

class !
ResponseResultExample &
:' (
OpenApiExample) 7
<7 8
ResponseResult8 F
>F G
{ 
public 
override 
IOpenApiExample '
<' (
ResponseResult( 6
>6 7
Build8 =
(= >
NamingStrategy> L
namingStrategyM [
=\ ]
null^ b
)b c
{ 	
this 
. 
Examples 
. 
Add 
( "
OpenApiExampleResolver &
.& '
Resolve' .
(. /
$str %
,% &
new 
ResponseResult &
(& '
)' (
{ 
IsError 
=  !
true" &
,& '
Message 
=  !
$str" ;
,; <
	Timestamp !
=" #
DateTime$ ,
., -
Now- 0
} 
, 
namingStrategy "
) 
) 
; 
return 
this 
; 
} 	
} 
} ·
VC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Services\MessageService.cs
	namespace 	 
FxAgendamientoMasivo
 
. 
Services '
{ 
public 

class 
MessageService 
:  !
IMessageService" 1
{ 
private 
readonly 
IServiceBusService +
_serviceBus, 7
;7 8
public 
MessageService 
( 
IServiceBusService 0

serviceBus1 ;
); <
=>= ?
_serviceBus@ K
=L M

serviceBusN X
;X Y
public 
IServiceBusService !

ServiceBus" ,
{ 	
get 
{ 
return 
_serviceBus $
;$ %
}& '
} 	
public 
async 
Task 
CrearMensaje &
(& '
dynamic' .
request/ 6
)6 7
{ 	
ServiceBusClient 
client #
=$ %
_serviceBus& 1
.1 2
GetServiceBusClient2 E
(E F
)F G
;G H
RequestAgendamiento 
mensaje  '
=( )
ConstruirRequest* :
(: ;
request; B
)B C
;C D
await 
_serviceBus 
. 
EnviarMensaje +
(+ ,
client, 2
,2 3
JsonConvert4 ?
.? @
SerializeObject@ O
(O P
mensajeP W
)W X
)X Y
;Y Z
} 	
public 
RequestAgendamiento "
ConstruirRequest# 3
(3 4
dynamic4 ;
request< C
)C D
{   	
RequestAgendamiento!! 
mensaje!!  '
=!!( )
new!!* -
(!!- .
)!!. /
{"" 
	IdUsuario## 
=## 
request## #
.### $
	IdUsuario##$ -
,##- .
IdMalla$$ 
=$$ 
request$$ !
.$$! "
IdMalla$$" )
,$$) *
IdSede%% 
=%% 
request%%  
.%%  !
IdSede%%! '
,%%' (
	IdSubSede&& 
=&& 
request&& #
.&&# $
	IdSubsede&&$ -
,&&- .

IdServicio'' 
='' 
request'' $
.''$ %

IdServicio''% /
,''/ 0
FechaAgendamiento(( !
=((" #
request(($ +
.((+ ,
	FechaCita((, 5
,((5 6
HoraAgendamiento))  
=))! "
request))# *
.))* +
HoraCita))+ 3
,))3 4
Ip** 
=** 
IpHelper** 
.** 
LocalIPAddress** ,
(**, -
)**- .
}++ 
;++ 
return-- 
mensaje-- 
;-- 
}.. 	
}// 
}00 ÷
YC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Services\ServiceBusService.cs
	namespace		 	 
FxAgendamientoMasivo		
 
.		 
Services		 '
{

 
public 

class 
ServiceBusService "
:# $
IServiceBusService% 7
{ 
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
public 
readonly 
string 

secretName )
;) *
private 
readonly 
string 
connectionString  0
;0 1
private 
readonly 
string 
	queueName  )
;) *
public 
ServiceBusService  
(  !
IConfiguration! /
configuration0 =
)= >
{ 	
_configuration 
= 
configuration *
;* +

secretName 
= 
_configuration '
[' (
$str( D
]D E
;E F
connectionString 
= 
_configuration -
[- .

secretName. 8
]8 9
;9 :
	queueName 
= 
_configuration &
[& '
$str' >
]> ?
;? @
} 	
public 
ServiceBusClient 
GetServiceBusClient  3
(3 4
)4 5
{ 	
var 
clientOptions 
= 
new  ##
ServiceBusClientOptions$ ;
(; <
)< =
{> ?
TransportType@ M
=N O#
ServiceBusTransportTypeP g
.g h
AmqpWebSocketsh v
}w x
;x y
ServiceBusClient 
client #
=$ %
new& )
() *
connectionString* :
,: ;
clientOptions< I
)I J
;J K
return   
client   
;   
}!! 	
public## 
async## 
Task## 
EnviarMensaje## '
(##' (
ServiceBusClient##( 8
client##9 ?
,##? @
string##A G
mensaje##H O
)##O P
{$$ 	
ServiceBusSender%% 
sender%% #
=%%$ %
client%%& ,
.%%, -
CreateSender%%- 9
(%%9 :
	queueName%%: C
)%%C D
;%%D E
try&& 
{'' 
await(( 
sender(( 
.(( 
SendMessageAsync(( -
(((- .
new((. 1
ServiceBusMessage((2 C
(((C D
mensaje((D K
)((K L
)((L M
;((M N
})) 
finally** 
{++ 
await,, 
sender,, 
.,, 
DisposeAsync,, )
(,,) *
),,* +
;,,+ ,
await-- 
client-- 
.-- 
DisposeAsync-- )
(--) *
)--* +
;--+ ,
}.. 
}// 	
}00 
}11 ö!
FC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Startup.cs
[ 
assembly 	
:	 

FunctionsStartup 
( 
typeof "
(" # 
FxAgendamientoMasivo# 7
.7 8
Startup8 ?
)? @
)@ A
]A B
	namespace 	 
FxAgendamientoMasivo
 
{ 
public 

class 
Startup 
: 
FunctionsStartup +
{ 
public 
override 
void 
	Configure &
(& '!
IFunctionsHostBuilder' <
builder= D
)D E
{ 	
var 
keyVaultName 
= 
Environment *
.* +"
GetEnvironmentVariable+ A
(A B
$strB R
)R S
;S T
var 
kvUri 
= 
$" 
$str "
{" #
keyVaultName# /
}/ 0
$str0 A
"A B
;B C
var 
tenant 
= 
new )
DefaultAzureCredentialOptions :
{  
VisualStudioTenantId $
=% &
Environment' 2
.2 3"
GetEnvironmentVariable3 I
(I J
$strJ Y
)Y Z
} 
;  
ConfigurationBuilder     
configurationBuilder  ! 5
=  6 7
new  8 ;
(  ; <
)  < =
;  = >
var!! 
configuration!! 
=!!  
configurationBuilder!!  4
."" 
SetBasePath"" 
("" 
	Directory"" &
.""& '
GetCurrentDirectory""' :
("": ;
)""; <
)""< =
.## 
AddJsonFile## 
(## 
$str## 2
,##2 3
optional##4 <
:##< =
true##> B
,##B C
reloadOnChange##D R
:##R S
true$$ 
)$$ 
.%% 
AddAzureKeyVault%% !
(%%! "
vaultUri%%" *
:%%* +
new%%, /
Uri%%0 3
(%%3 4
kvUri%%4 9
)%%9 :
,%%: ;

credential%%< F
:%%F G
new%%H K"
DefaultAzureCredential%%L b
(%%b c
tenant%%c i
)%%i j
)%%j k
.&& #
AddEnvironmentVariables&& (
(&&( )
)&&) *
.'' 
Build'' 
('' 
)'' 
;'' 
builder)) 
.)) 
Services)) 
.)) 
AddSingleton)) )
<))) *
SecretClient))* 6
>))6 7
())7 8
)))8 9
;))9 :
builder** 
.** 
Services** 
.** 
AddAutoMapper** *
(*** +
typeof**+ 1
(**1 2
Startup**2 9
)**9 :
)**: ;
;**; <
builder++ 
.++ 
Services++ 
.++ 

AddMvcCore++ '
(++' (
)++( )
.++) *
AddNewtonsoftJson++* ;
(++; <
jsonOptions++< G
=>++H J
{,, 
jsonOptions-- 
.-- 
SerializerSettings-- .
.--. /
NullValueHandling--/ @
=--A B
NullValueHandling--C T
.--T U
Ignore--U [
;--[ \
}.. 
).. 
;.. 
builder00 
.00 
Services00 
.00 
AddSingleton00 )
<00) *
IServiceBusService00* <
,00< =
ServiceBusService00> O
>00O P
(00P Q
)00Q R
;00R S
builder11 
.11 
Services11 
.11 
AddTransient11 )
<11) *
IMessageService11* 9
,119 :
MessageService11; I
>11I J
(11J K
)11K L
;11L M
builder33 
.33 
Services33 
.33 
AddSingleton33 )
<33) *
IConfiguration33* 8
>338 9
(339 :
configuration33: G
)33G H
;33H I
}44 	
}55 
}66 ˙X
OC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Utils\FileParser.cs
	namespace 	 
FxAgendamientoMasivo
 
. 
Utils $
{ 
public 

static 
class 

FileParser "
{ 
public 
static 
string 
Base64_Decode *
(* +
string+ 1
str2 5
)5 6
{ 	
try 
{ 
byte 
[ 
] 
decbuff 
=  
Convert! (
.( )
FromBase64String) 9
(9 :
str: =
)= >
;> ?
return 
System 
. 
Text "
." #
Encoding# +
.+ ,
UTF8, 0
.0 1
	GetString1 :
(: ;
decbuff; B
)B C
;C D
} 
catch 
{ 
return 
$str 
; 
} 
} 	
public 
static 
List 
< 
T 
> 
ParseFileInfo +
<+ ,
T, -
>- .
(. /
List/ 3
<3 4
string4 :
[: ;
]; <
>< =
split> C
)C D
whereE J
TK L
:M N
newO R
(R S
)S T
{ 	
if   
(   
split   
.   
Count   
<   
$num   
)    
return!! 
new!! 
List!! 
<!!  
T!!  !
>!!! "
(!!" #
)!!# $
;!!$ %
string"" 
["" 
]"" 
templateRow""  
=""! "
split""# (
[""( )
$num"") *
]""* +
;""+ ,

Dictionary$$ 
<$$ 
string$$ 
,$$ 
int$$ "
>$$" #
columnIndexing$$$ 2
=$$3 4
new$$5 8
($$8 9
)$$9 :
;$$: ;
for%% 
(%% 
int%% 
i%% 
=%% 
$num%% 
;%% 
i%% 
<%% 
templateRow%%  +
.%%+ ,
Length%%, 2
;%%2 3
i%%4 5
++%%5 7
)%%7 8
{&& 
string'' 
	colHeader''  
=''! "
templateRow''# .
[''. /
i''/ 0
]''0 1
.''1 2
Trim''2 6
(''6 7
)''7 8
.''8 9
ToUpperInvariant''9 I
(''I J
)''J K
;''K L
if(( 
((( 
!(( 
columnIndexing(( #
.((# $
ContainsKey(($ /
(((/ 0
	colHeader((0 9
)((9 :
)((: ;
columnIndexing)) "
.))" #
Add))# &
())& '
	colHeader))' 0
,))0 1
i))2 3
)))3 4
;))4 5
}** 
int,, 
numCols,, 
=,, 
columnIndexing,, (
.,,( )
Values,,) /
.,,/ 0
Max,,0 3
(,,3 4
),,4 5
+,,6 7
$num,,8 9
;,,9 :
PropertyInfo.. 
[.. 
].. 

properties.. %
=..& '
new..( +
PropertyInfo.., 8
[..8 9
numCols..9 @
]..@ A
;..A B
Regex00 
[00 
]00 
propValidators00 "
=00# $
new00% (
Regex00) .
[00. /
numCols00/ 6
]006 7
;007 8
TypeConverter22 
[22 
]22 
propconverters22 *
=22+ ,
new22- 0
TypeConverter221 >
[22> ?
numCols22? F
]22F G
;22G H
foreach44 
(44 
PropertyInfo44 !
p44" #
in44$ &
typeof44' -
(44- .
T44. /
)44/ 0
.440 1
GetProperties441 >
(44> ?
)44? @
)44@ A
{55 
object66 
[66 
]66 
attrs66 
=66  
p66! "
.66" #
GetCustomAttributes66# 6
(666 7
true667 ;
)66; <
;66< =
foreach77 
(77 
object77 
attr77  $
in77% '
attrs77( -
)77- .
{88 
if99 
(99 
attr99 
is99 
not99  #
CsvColumnAttribute99$ 6
fileAttr997 ?
)99? @
continue::  
;::  !
if;; 
(;; 
!;; 
columnIndexing;; '
.;;' (
TryGetValue;;( 3
(;;3 4
fileAttr;;4 <
.;;< =
Name;;= A
.;;A B
ToUpperInvariant;;B R
(;;R S
);;S T
,;;T U
out;;V Y
int;;Z ]
index;;^ c
);;c d
);;d e
{<< 
if== 
(== 
!== 
fileAttr== %
.==% &
ValidationRegex==& 5
.==5 6
IsMatch==6 =
(=== >
string==> D
.==D E
Empty==E J
)==J K
)==K L
return>> "
new>># &
List>>' +
<>>+ ,
T>>, -
>>>- .
(>>. /
)>>/ 0
;>>0 1
break?? 
;?? 
}@@ 

propertiesAA 
[AA 
indexAA $
]AA$ %
=AA& '
pAA( )
;AA) *
propValidatorsBB "
[BB" #
indexBB# (
]BB( )
=BB* +
fileAttrBB, 4
.BB4 5
ValidationRegexBB5 D
;BBD E
propconvertersCC "
[CC" #
indexCC# (
]CC( )
=CC* +
TypeDescriptorCC, :
.CC: ;
GetConverterCC; G
(CCG H
pCCH I
.CCI J
PropertyTypeCCJ V
)CCV W
;CCW X
breakDD 
;DD 
}EE 
}FF 
ListGG 
<GG 
TGG 
>GG 
objListGG 
=GG 
newGG !
(GG! "
)GG" #
;GG# $
forHH 
(HH 
intHH 
iHH 
=HH 
$numHH 
;HH 
iHH 
<HH 
splitHH  %
.HH% &
CountHH& +
;HH+ ,
iHH- .
++HH. 0
)HH0 1
{II 
boolJJ 
	abortLineJJ 
=JJ  
falseJJ! &
;JJ& '
stringKK 
[KK 
]KK 
lineKK 
=KK 
splitKK  %
[KK% &
iKK& '
]KK' (
;KK( )
TLL 
objLL 
=LL 
newLL 
(LL 
)LL 
;LL 
forMM 
(MM 
intMM 
colMM 
=MM 
$numMM  
;MM  !
colMM" %
<MM& '

propertiesMM( 2
.MM2 3
LengthMM3 9
;MM9 :
colMM; >
++MM> @
)MM@ A
{NN 
stringOO 
curValOO !
=OO" #
colOO$ '
<OO( )
lineOO* .
.OO. /
LengthOO/ 5
?OO6 7
lineOO8 <
[OO< =
colOO= @
]OO@ A
:OOB C
stringOOD J
.OOJ K
EmptyOOK P
;OOP Q
PropertyInfoPP  
propPP! %
=PP& '

propertiesPP( 2
[PP2 3
colPP3 6
]PP6 7
;PP7 8
ifQQ 
(QQ 
propQQ 
==QQ 
nullQQ  $
)QQ$ %
continueRR  
;RR  !
boolSS 
validSS 
=SS  
propValidatorsSS! /
[SS/ 0
colSS0 3
]SS3 4
.SS4 5
IsMatchSS5 <
(SS< =
curValSS= C
)SSC D
;SSD E
ifTT 
(TT 
!TT 
validTT 
)TT 
{UU 
	abortLineVV !
=VV" #
trueVV$ (
;VV( )
breakWW 
;WW 
}XX 
objectYY 
valueYY  
=YY! "
propconvertersYY# 1
[YY1 2
colYY2 5
]YY5 6
.YY6 7
ConvertFromStringYY7 H
(YYH I
curValYYI O
)YYO P
;YYP Q
propZZ 
.ZZ 
SetValueZZ !
(ZZ! "
objZZ" %
,ZZ% &
valueZZ' ,
,ZZ, -
nullZZ. 2
)ZZ2 3
;ZZ3 4
}[[ 
if\\ 
(\\ 
!\\ 
	abortLine\\ 
)\\ 
objList]] 
.]] 
Add]] 
(]]  
obj]]  #
)]]# $
;]]$ %
}^^ 
return__ 
objList__ 
;__ 
}`` 	
publicbb 
staticbb 
Listbb 
<bb 
stringbb !
[bb! "
]bb" #
>bb# $
	SplitFilebb% .
(bb. /
stringbb/ 5
fileContentbb6 A
,bbA B
charbbC G
	separatorbbH Q
)bbQ R
{cc 	
Listdd 
<dd 
stringdd 
[dd 
]dd 
>dd 

splitLinesdd %
=dd& '
newdd( +
(dd+ ,
)dd, -
;dd- .
tryee 
{ff 
usinggg 
(gg 
StringReadergg #
srgg$ &
=gg' (
newgg) ,
(gg, -
fileContentgg- 8
)gg8 9
)gg9 :
usinghh 
(hh 
TextFieldParserhh &
tfphh' *
=hh+ ,
newhh- 0
(hh0 1
srhh1 3
)hh3 4
)hh4 5
{ii 
tfpjj 
.jj 
TextFieldTypejj %
=jj& '
	FieldTypejj( 1
.jj1 2
	Delimitedjj2 ;
;jj; <
tfpkk 
.kk 

Delimiterskk "
=kk# $
newkk% (
stringkk) /
[kk/ 0
]kk0 1
{kk2 3
	separatorkk4 =
.kk= >
ToStringkk> F
(kkF G
)kkG H
}kkI J
;kkJ K
whilell 
(ll 
truell 
)ll  
{mm 
stringnn 
[nn 
]nn  
curLinenn! (
=nn) *
tfpnn+ .
.nn. /

ReadFieldsnn/ 9
(nn9 :
)nn: ;
;nn; <
ifoo 
(oo 
curLineoo #
==oo$ &
nulloo' +
)oo+ ,
breakpp !
;pp! "

splitLinesqq "
.qq" #
Addqq# &
(qq& '
curLineqq' .
)qq. /
;qq/ 0
}rr 
}ss 
returntt 

splitLinestt !
;tt! "
}uu 
catchvv 
(vv "
MalformedLineExceptionvv )
mflevv* .
)vv. /
{ww 
throwxx 
newxx 
FormatExceptionxx )
(xx) *
stringxx* 0
.xx0 1
Formatxx1 7
(xx7 8
$strxx8 f
,xxf g
mflexxh l
.xxl m

LineNumberxxm w
)xxw x
)xxx y
;xxy z
}yy 
}zz 	
}{{ 
}|| Æ
WC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Utils\HttpResponseHelper.cs
	namespace 	 
FxAgendamientoMasivo
 
. 
Utils $
{ 
public 

static 
class 
HttpResponseHelper *
{ 
public 
static 
IActionResult #"
SuccessfulObjectResult$ :
(: ;
object; A
responseB J
)J K
{ 	
return		 
new		 
OkObjectResult		 %
(		% &
response		& .
)		. /
;		/ 0
}

 	
public 
static 
IActionResult #"
BadRequestObjectResult$ :
(: ;
object; A
responseB J
)J K
{ 	
return 
new "
BadRequestObjectResult -
(- .
response. 6
)6 7
;7 8
} 	
public 
static 
IActionResult #!
HttpExplicitNoContent$ 9
(9 :
): ;
{ 	
return 
new 
NoContentResult &
(& '
)' (
;( )
} 	
public 
static 
ObjectResult "
Response# +
(+ ,
int, /
code0 4
,4 5
object6 <
value= B
)B C
{ 	
var 
result 
= 
new 
ObjectResult )
() *
value* /
)/ 0
;0 1
result 
. 

StatusCode 
= 
code  $
;$ %
return 
result 
; 
} 	
} 
} ”
MC:\Users\pc\source\repos\TRANSVERSALES\FxAgendamientoMasivo\Utils\IpHelper.cs
	namespace 	 
FxAgendamientoMasivo
 
. 
Utils $
{ 
public 

static 
class 
IpHelper  
{ 
public		 
static		 
string		 
LocalIPAddress		 +
(		+ ,
)		, -
{

 	
if 
( 
! 
System 
. 
Net 
. 
NetworkInformation .
.. /
NetworkInterface/ ?
.? @!
GetIsNetworkAvailable@ U
(U V
)V W
)W X
{ 
return 
$str  
;  !
} 
IPHostEntry 
host 
= 
Dns "
." #
GetHostEntry# /
(/ 0
Dns0 3
.3 4
GetHostName4 ?
(? @
)@ A
)A B
;B C
return 
host 
. 
AddressList 
? 
. 
FirstOrDefault 
(  
ip  "
=># %
ip& (
.( )
AddressFamily) 6
==7 9
AddressFamily: G
.G H
InterNetworkH T
)T U
.U V
ToStringV ^
(^ _
)_ `
;` a
} 	
} 
} 