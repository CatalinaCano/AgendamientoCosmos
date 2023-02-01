™
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizarMalla\DataContext\UnitOfWork.cs
	namespace		 	
FxMonitorizarMalla		
 
.		 
DataContext		 (
{

 
public 

class 

UnitOfWork 
: 
IUnitOfWork )
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
CosmosClient %
_client& -
;- .
private 
IMallaRepository  
_mallaRepository! 1
;1 2
private 
bool 
	_disposed 
=  
false! &
;& '
public 

UnitOfWork 
( 
IConfiguration (
configuration) 6
,6 7
CosmosClient8 D
clientE K
)K L
{ 	
_configuration 
= 
configuration *
;* +
_client 
= 
client 
; 
} 	
public 
IMallaRepository 
MallaRepository  /
{ 	
get 
{ 
return 
_mallaRepository )
??=* -
new. 1
MallaRepository2 A
(A B
_clientB I
,I J
_configurationK Y
)Y Z
;Z [
}\ ]
} 	
	protected 
virtual 
void 
Dispose &
(& '
bool' +
	disposing, 5
)5 6
{ 	
if   
(   
!   
	_disposed   
&&   
!   
	disposing   (
)  ( )
{!! 
_client"" 
."" 
Dispose"" 
(""  
)""  !
;""! "
}## 
	_disposed$$ 
=$$ 
true$$ 
;$$ 
}%% 	
public'' 
void'' 
Dispose'' 
('' 
)'' 
{(( 	
Dispose)) 
()) 
true)) 
))) 
;)) 
GC** 
.** 
SuppressFinalize** 
(**  
this**  $
)**$ %
;**% &
}++ 	
~-- 	

UnitOfWork--	 
(-- 
)-- 
{.. 	
Dispose// 
(// 
false// 
)// 
;// 
}00 	
}11 
}22 ÿ
oC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizarMalla\FxMonitorizarMalla.cs
	namespace 	
FxMonitorizarMalla
 
{ 
public 

class 
FxMonitorizarMalla #
{ 
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
FxMonitorizarMalla !
(! "
IUnitOfWork" -

unitOfWork. 8
,8 9
IConfiguration: H
configurationI V
)V W
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_configuration 
= 
configuration *
;* +
} 	
[ 	
FunctionName	 
( 
nameof 
( 
MonitorizarMalla -
)- .
). /
]/ 0
[ 	
FixedDelayRetry	 
( 
$num 
, 
$str &
)& '
]' (
public 
async 
Task 
MonitorizarMalla *
(* +
[+ ,
TimerTrigger, 8
(8 9
$str9 D
,D E
RunOnStartupF R
=S T
trueU Y
)Y Z
]Z [
	TimerInfo\ e
myTimerf m
,m n
ILoggero v
logw z
)z {
{ 	
log 
. 
LogInformation 
( 
$" !
$str! E
{E F

TimeHelperF P
.P Q 
ObtenerFechaColombiaQ e
(e f
)f g
}g h
"h i
)i j
;j k
List!! 
<!! 
MallaDto!! 
>!! 
mallas!! !
=!!" #
await!!$ )
_unitOfWork!!* 5
.!!5 6
MallaRepository!!6 E
.!!E F
ObtenerMallas!!F S
(!!S T
)!!T U
;!!U V
if## 
(## 
mallas## 
.## 
Any## 
(## 
)## 
)## 
{$$ 
foreach%% 
(%% 
MallaDto%% !
malla%%" '
in%%( *
mallas%%+ 1
)%%1 2
{&& 
await'' 
_unitOfWork'' %
.''% &
MallaRepository''& 5
.''5 6
InactivarMalla''6 D
(''D E
malla''E J
.''J K
Id''K M
,''M N
malla''O T
.''T U
PkSede''U [
)''[ \
;''\ ]
}(( 
})) 
}** 	
}++ 
},, ´
ŠC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizarMalla\Interfaces\RepositoryPattern\IMallaRepository.cs
	namespace 	
FxMonitorizarMalla
 
. 

Interfaces '
.' (
RepositoryPattern( 9
{ 
public 

	interface 
IMallaRepository %
{		 
public

 
Task

 
<

 
List

 
<

 
MallaDto

 !
>

! "
>

" #
ObtenerMallas

$ 1
(

1 2
)

2 3
;

3 4
public 
Task 
InactivarMalla "
(" #
string# )
id* ,
,, -
string. 4
idSede5 ;
); <
;< =
} 
} ¯
…C:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizarMalla\Interfaces\RepositoryPattern\IUnitOfWork.cs
	namespace 	
FxMonitorizarMalla
 
. 

Interfaces '
.' (
RepositoryPattern( 9
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ 
IMallaRepository 
MallaRepository (
{) *
get+ .
;. /
}0 1
} 
}		 ‹
€C:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizarMalla\Models\DataTransferObjects\MallaDto.cs
	namespace 	
FxMonitorizarMalla
 
. 
Models #
.# $
DataTransferObjects$ 7
{ 
public 

class 
MallaDto 
{ 
[ 	
JsonProperty	 
( 
$str 
) 
] 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
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
 
)

 
]

  
public 
string 
PkSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str #
)# $
]$ %
public 
string 
FechaInicio !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
JsonProperty	 
( 
$str  
)  !
]! "
public 
string 
FechaFin 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ˜'
yC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizarMalla\Repositories\MallaRepository.cs
	namespace 	
FxMonitorizarMalla
 
. 
Repositories )
{ 
public 

class 
MallaRepository  
:! "
RepositoryBase# 1
,1 2
IMallaRepository3 C
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
public 
MallaRepository 
( 
CosmosClient +
client, 2
,2 3
IConfiguration4 B
configurationC P
)P Q
: 
base 
( 
client 
) 
{ 	
string 
containerId 
=  
configuration! .
[. /
$str/ J
]J K
;K L
string 
databaseName 
=  !
configuration" /
[/ 0
$str0 C
]C D
;D E
	container 
= 
client 
. 
GetContainer +
(+ ,
databaseName, 8
,8 9
containerId: E
)E F
;F G
} 	
public 
async 
Task 
< 
List 
< 
MallaDto '
>' (
>( )
ObtenerMallas* 7
(7 8
)8 9
{ 	
string 
fechaFin 
= 

TimeHelper (
.( ) 
ObtenerFechaColombia) =
(= >
)> ?
.? @
AddDays@ G
(G H
-H I
$numI J
)J K
.K L
ToStringL T
(T U
$strU a
)a b
;b c
List 
< 
MallaDto 
> 
mallas !
=" #
new$ '
List( ,
<, -
MallaDto- 5
>5 6
(6 7
)7 8
;8 9
try   
{!! 
var"" 
queryString"" 
=""  !
@$"""" %
$str")% S
"))S T
;))T U
var++ 
queryDef++ 
=++ 
new++ "
QueryDefinition++# 2
(++2 3
queryString++3 >
)++> ?
;++? @
queryDef,, 
.,, 
WithParameter,, &
(,,& '
$str,,' 0
,,,0 1
true,,2 6
),,6 7
;,,7 8
queryDef-- 
.-- 
WithParameter-- &
(--& '
$str--' 2
,--2 3
fechaFin--4 <
)--< =
;--= >
var// 
query// 
=// 
	container// %
.//% & 
GetItemQueryIterator//& :
<//: ;
MallaDto//; C
>//C D
(//D E
queryDef//E M
)//M N
;//N O
while00 
(00 
query00 
.00 
HasMoreResults00 +
)00+ ,
{11 
var22 
response22  
=22! "
await22# (
query22) .
.22. /
ReadNextAsync22/ <
(22< =
)22= >
;22> ?
mallas33 
.33 
AddRange33 #
(33# $
response33$ ,
.33, -
ToList33- 3
(333 4
)334 5
)335 6
;336 7
}44 
return66 
mallas66 
;66 
}77 
catch88 
(88 
CosmosException88 "
ex88# %
)88% &
when88' +
(88, -
ex88- /
.88/ 0

StatusCode880 :
==88; =
HttpStatusCode88> L
.88L M
NotFound88M U
)88U V
{99 
return:: 
new:: 
List:: 
<::  
MallaDto::  (
>::( )
(::) *
)::* +
;::+ ,
};; 
}<< 	
public>> 
async>> 
Task>> 
InactivarMalla>> (
(>>( )
string>>) /
id>>0 2
,>>2 3
string>>4 :
idSede>>; A
)>>A B
{?? 	
await@@ 
	container@@ 
.@@ 
PatchItemAsync@@ *
<@@* +
MallaDto@@+ 3
>@@3 4
(@@4 5
id@@5 7
,@@7 8
new@@9 <
PartitionKey@@= I
(@@I J
idSede@@J P
)@@P Q
,@@Q R
new@@S V
[@@V W
]@@W X
{@@Y Z
PatchOperation@@[ i
.@@i j
Set@@j m
(@@m n
$str@@n w
,@@w x
false@@y ~
)@@~ 
}
@@€ 
)
@@ ‚
;
@@‚ ƒ
}AA 	
}BB 
}CC „
xC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizarMalla\Repositories\RepositoryBase.cs
	namespace 	
FxMonitorizarMalla
 
. 
Repositories )
{ 
public 

abstract 
class 
RepositoryBase (
{ 
	protected 
CosmosClient 
Client %
{& '
get( +
;+ ,
private- 4
set5 8
;8 9
}: ;
	protected		 
RepositoryBase		  
(		  !
CosmosClient		! -
client		. 4
)		4 5
{

 	
Client 
= 
client 
; 
} 	
} 
} ¢+
dC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizarMalla\Startup.cs
[ 
assembly 	
:	 

FunctionsStartup 
( 
typeof "
(" #
Startup# *
)* +
)+ ,
], -
	namespace 	
FxMonitorizarMalla
 
{ 
public 

class 
Startup 
: 
FunctionsStartup +
{ 
public 
override 
void 
	Configure &
(& '!
IFunctionsHostBuilder' <
builder= D
)D E
{ 	
var 
keyVaultName 
= 
Environment *
.* +"
GetEnvironmentVariable+ A
(A B
$strB R
)R S
;S T
var 
kvUri 
= 
$" 
$str "
{" #
keyVaultName# /
}/ 0
$str0 A
"A B
;B C
var 
tenant 
= 
new )
DefaultAzureCredentialOptions :
{  
VisualStudioTenantId $
=% &
Environment' 2
.2 3"
GetEnvironmentVariable3 I
(I J
$strJ Y
)Y Z
}   
;    
ConfigurationBuilder""   
configurationBuilder""! 5
=""6 7
new""8 ;
(""; <
)""< =
;""= >
var## 
configuration## 
=##  
configurationBuilder##  4
.$$ 
SetBasePath$$ 
($$ 
	Directory$$ &
.$$& '
GetCurrentDirectory$$' :
($$: ;
)$$; <
)$$< =
.%% 
AddJsonFile%% 
(%% 
$str%% 2
,%%2 3
optional%%4 <
:%%< =
true%%> B
,%%B C
reloadOnChange%%D R
:%%R S
true&& 
)&& 
.'' 
AddAzureKeyVault'' !
(''! "
vaultUri''" *
:''* +
new'', /
Uri''0 3
(''3 4
kvUri''4 9
)''9 :
,'': ;

credential''< F
:''F G
new''H K"
DefaultAzureCredential''L b
(''b c
tenant''c i
)''i j
)''j k
.(( #
AddEnvironmentVariables(( (
(((( )
)(() *
.)) 
Build)) 
()) 
))) 
;)) 
string++ 
nombreAccount++  
=++! "
configuration++# 0
[++0 1
$str++1 K
]++K L
;++L M
string,, 
nombreSecreto,,  
=,,! "
configuration,,# 0
[,,0 1
$str,,1 C
],,C D
;,,D E
string.. 
account.. 
=.. 
configuration.. *
[..* +
nombreAccount..+ 8
]..8 9
;..9 :
string// 
key// 
=// 
configuration// &
[//& '
nombreSecreto//' 4
]//4 5
;//5 6
string00 
databaseName00 
=00  !
configuration00" /
[00/ 0
$str000 C
]00C D
;00D E
builder22 
.22 
Services22 
.22 
AddSingleton22 )
<22) *
SecretClient22* 6
>226 7
(227 8
)228 9
;229 :
CosmosClientBuilder44 
clientBuilder44  -
=44. /
new440 3
(443 4
account444 ;
,44; <
key44= @
)44@ A
;44A B
CosmosClient55 
client55 
=55  !
clientBuilder55" /
.66 
WithApplicationName66 $
(66$ %
databaseName66% 1
)661 2
.77 
WithApplicationName77 $
(77$ %
Regions77% ,
.77, -
EastUS277- 4
)774 5
.88 $
WithConnectionModeDirect88 )
(88) *
)88* +
.99 !
WithSerializerOptions99 &
(99& '
new99' *&
CosmosSerializationOptions99+ E
(99E F
)99F G
{99H I 
PropertyNamingPolicy99J ^
=99_ `&
CosmosPropertyNamingPolicy99a {
.99{ |
	CamelCase	99| …
}
99† ‡
)
99‡ ˆ
.:: 
Build:: 
(:: 
):: 
;:: 
builder<< 
.<< 
Services<< 
.<< 
AddSingleton<< )
(<<) *
serviceProvider<<* 9
=><<: <
{== 
return>> 
client>> 
;>> 
}?? 
)?? 
;?? 
builderAA 
.AA 
ServicesAA 
.AA 
AddTransientAA )
<AA) *
IUnitOfWorkAA* 5
,AA5 6

UnitOfWorkAA7 A
>AAA B
(AAB C
)AAC D
;AAD E
builderEE 
.EE 
ServicesEE 
.EE 
	AddScopedEE &
<EE& '
IMallaRepositoryEE' 7
,EE7 8
MallaRepositoryEE9 H
>EEH I
(EEI J
)EEJ K
;EEK L
builderII 
.II 
ServicesII 
.II 
AddSingletonII )
<II) *
IConfigurationII* 8
>II8 9
(II9 :
configurationII: G
)IIG H
;IIH I
}JJ 	
}KK 
}LL û
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizarMalla\Utils\TimeHelper.cs
	namespace 	
FxMonitorizarMalla
 
. 
Utils "
{ 
public 

static 
class 

TimeHelper "
{ 
public 
static 
DateTime  
ObtenerFechaColombia 3
(3 4
)4 5
{ 	
TimeZoneInfo		 
zonaColombia		 %
=		& '
TimeZoneInfo		( 4
.		4 5"
FindSystemTimeZoneById		5 K
(		K L
$str		L c
)		c d
;		d e
DateTime

 
today

 
=

 
TimeZoneInfo

 )
.

) *
ConvertTime

* 5
(

5 6
DateTime

6 >
.

> ?
UtcNow

? E
,

E F
zonaColombia

G S
)

S T
;

T U
return 
today 
; 
} 	
} 
} 