Ç"
hC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxBrokerAgendamiento\FxBrokerAgendamiento.cs
	namespace 	 
FxBrokerAgendamiento
 
{ 
public 

class 
BrokerAgendamiento #
{ 
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
private 
readonly 
IHttpService %
_httpClient& 1
;1 2
public 
BrokerAgendamiento !
(! "
IConfiguration" 0
configuration1 >
,> ?
IHttpService@ L

httpClientM W
)W X
{ 	
_configuration 
= 
configuration *
;* +
_httpClient 
= 

httpClient $
;$ %
} 	
[ 	
FunctionName	 
( 
$str *
)* +
]+ ,
public   
async   
Task   
Run   
(   
[   
ServiceBusTrigger   0
(  0 1
$str  1 ?
,  ? @

Connection  A K
=  L M
$str  N j
)  j k
]  k l&
ServiceBusReceivedMessage	  m †
[
  † ‡
]
  ‡ ˆ
messages
  ‰ ‘
,
  ‘ ’&
ServiceBusMessageActions
  “ «
messageActions
  ¬ º
,
  º »
ILogger
  ¼ Ã
log
  Ä Ç
)
  Ç È
{!! 	
try"" 
{## 
foreach$$ 
($$ %
ServiceBusReceivedMessage$$ 2
message$$3 :
in$$; =
messages$$> F
)$$F G
{%% 
string&& 
payload&& "
=&&# $
Encoding&&% -
.&&- .
UTF8&&. 2
.&&2 3
	GetString&&3 <
(&&< =
message&&= D
.&&D E
Body&&E I
)&&I J
;&&J K
log'' 
.'' 
LogInformation'' &
(''& '
$"''' )
$str'') G
{''G H
payload''H O
}''O P
"''P Q
)''Q R
;''R S
AgendaInput(( 
request((  '
=((( )
JsonConvert((* 5
.((5 6
DeserializeObject((6 G
<((G H
AgendaInput((H S
>((S T
(((T U
payload((U \
)((\ ]
;((] ^
HttpResponseMessage)) '
response))( 0
=))1 2
await))3 8
_httpClient))9 D
.))D E
	PostAsync))E N
())N O
request))O V
)))V W
;))W X
string++ 
responseBody++ '
=++( )
await++* /
response++0 8
.++8 9
Content++9 @
.++@ A
ReadAsStringAsync++A R
(++R S
)++S T
;++T U
ResponseResult-- "
data--# '
=--( )
JsonConvert--* 5
.--5 6
DeserializeObject--6 G
<--G H
ResponseResult--H V
>--V W
(--W X
responseBody--X d
)--d e
;--e f
if// 
(// 
!// 
data// 
.// 
IsError// %
)//% &
{00 
log11 
.11 
LogInformation11 *
(11* +
$"11+ -
$str11- K
{11K L
responseBody11L X
}11X Y
"11Y Z
)11Z [
;11[ \
await22 
messageActions22 ,
.22, - 
CompleteMessageAsync22- A
(22A B
message22B I
)22I J
;22J K
}33 
else44 
{55 
log66 
.66 
LogInformation66 *
(66* +
$"66+ -
$str66- >
{66> ?
responseBody66? K
}66K L
"66L M
)66M N
;66N O
await77 
messageActions77 ,
.77, -"
DeadLetterMessageAsync77- C
(77C D
message77D K
)77K L
;77L M
}88 
}99 
}:: 
catch;; 
(;; 
	Exception;; 
e;; 
);; 
{<< 
log== 
.== 
LogInformation== "
(==" #
e==# $
.==$ %
Message==% ,
)==, -
;==- .
}>> 
}?? 	
}@@ 
}AA Ÿ
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxBrokerAgendamiento\Interfaces\IHttpService.cs
	namespace 	 
FxBrokerAgendamiento
 
. 

Interfaces )
{ 
public 

	interface 
IHttpService !
{		 
public

 
Task

 
<

 
HttpResponseMessage

 '
>

' (
	PostAsync

) 2
(

2 3
AgendaInput

3 >
request

? F
)

F G
;

G H
} 
} Î
fC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxBrokerAgendamiento\Models\AgendaInput.cs
	namespace 	 
FxBrokerAgendamiento
 
. 
Models %
{ 
public 

class 
AgendaInput 
{ 
[ 	
JsonProperty	 
( 
$str !
,! "
Required# +
=, -
Required. 6
.6 7
Always7 =
)= >
]> ?
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
,

  
Required

! )
=

* +
Required

, 4
.

4 5
Always

5 ;
)

; <
]

< =
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
, 
Required  (
=) *
Required+ 3
.3 4
Always4 :
): ;
]; <
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
,! "
Required# +
=, -
Required. 6
.6 7
Always7 =
)= >
]> ?
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
," #
Required$ ,
=- .
Required/ 7
.7 8
Always8 >
)> ?
]? @
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
,) *
Required+ 3
=4 5
Required6 >
.> ?
Always? E
)E F
]F G
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
,( )
Required* 2
=3 4
Required5 =
.= >
Always> D
)D E
]E F
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
, 
Required $
=% &
Required' /
./ 0
Always0 6
)6 7
]7 8
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
} ¢	
iC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxBrokerAgendamiento\Models\ResponseResult.cs
	namespace 	 
FxBrokerAgendamiento
 
. 
Models %
{ 
public 

class 
ResponseResult 
{ 
[		 	
JsonProperty			 
(		 
$str		 
)		  
]		  !
public

 
bool

 
IsError

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
[ 	
JsonProperty	 
( 
$str 
)  
]  !
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
DateTime 
	Timestamp !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
DateTime2 :
.: ;
UtcNow; A
;A B
} 
} î
hC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxBrokerAgendamiento\Services\HttpService.cs
	namespace 	 
FxBrokerAgendamiento
 
. 
Services '
{ 
public		 

class		 
HttpService		 
:		 
IHttpService		 +
{

 
private 
readonly 

HttpClient #
_client$ +
;+ ,
public 
HttpService 
( 

HttpClient %
client& ,
), -
{ 	
_client 
= 
client 
; 
} 	
public 
async 
Task 
< 
HttpResponseMessage -
>- .
	PostAsync/ 8
(8 9
AgendaInput9 D
requestE L
)L M
{ 	
return 
await 
_client  
.  !
PostAsJsonAsync! 0
(0 1
$str1 3
,3 4
request5 <
)< =
;= >
} 	
} 
} µ
[C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxBrokerAgendamiento\Startup.cs
[ 
assembly 	
:	 

FunctionsStartup 
( 
typeof "
(" #
Startup# *
)* +
)+ ,
], -
	namespace 	 
FxBrokerAgendamiento
 
{ 
internal 
class 
Startup 
: 
FunctionsStartup -
{ 
public 
override 
void 
	Configure &
(& '!
IFunctionsHostBuilder' <
builder= D
)D E
{ 	 
ConfigurationBuilder   
configurationBuilder! 5
=6 7
new8 ;
(; <
)< =
;= >
var 
configuration 
=  
configurationBuilder  4
. 
SetBasePath 
( 
	Directory &
.& '
GetCurrentDirectory' :
(: ;
); <
)< =
. 
AddJsonFile 
( 
$str 2
,2 3
optional4 <
:< =
true> B
,B C
reloadOnChangeD R
:R S
true 
) 
. #
AddEnvironmentVariables (
(( )
)) *
. 
Build 
( 
) 
; 
builder!! 
.!! 
Services!! 
.!! 
AddSingleton!! )
<!!) *
SecretClient!!* 6
>!!6 7
(!!7 8
)!!8 9
;!!9 :
builder## 
.## 
Services## 
.## 

AddMvcCore## '
(##' (
)##( )
.##) *
AddNewtonsoftJson##* ;
(##; <
jsonOptions##< G
=>##H J
{$$ 
jsonOptions%% 
.%% 
SerializerSettings%% .
.%%. /
NullValueHandling%%/ @
=%%A B
NullValueHandling%%C T
.%%T U
Ignore%%U [
;%%[ \
}&& 
)&& 
;&& 
string** 
endpoint** 
=** 
configuration** +
[**+ ,
$str**, C
]**C D
;**D E
builder,, 
.,, 
Services,, 
.,, 
AddHttpClient,, *
(,,* +
),,+ ,
;,,, -
builder-- 
.-- 
Services-- 
.-- 
AddHttpClient-- *
<--* +
IHttpService--+ 7
,--7 8
HttpService--9 D
>--D E
(--E F
client--F L
=>--M O
{.. 
client// 
.// 
BaseAddress// "
=//# $
new//% (
Uri//) ,
(//, -
endpoint//- 5
)//5 6
;//6 7
client00 
.00 !
DefaultRequestHeaders00 ,
.00, -
Accept00- 3
.003 4
Add004 7
(007 8
new008 ;+
MediaTypeWithQualityHeaderValue00< [
(00[ \
$str00\ n
)00n o
)00o p
;00p q
}11 
)11 
;11 
builder55 
.55 
Services55 
.55 
AddSingleton55 )
<55) *
IConfiguration55* 8
>558 9
(559 :
configuration55: G
)55G H
;55H I
}66 	
}77 
}88 