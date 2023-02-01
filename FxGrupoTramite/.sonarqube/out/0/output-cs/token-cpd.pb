»
|C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\DataContext\UnitOfWork.cs
	namespace		 	
FxGrupoTramite		
 
.		 
DataContext		 $
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
private #
IGrupoTramiteRepository '#
_grupoTramiteRepository( ?
;? @
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
public #
IGrupoTramiteRepository &"
GrupoTramiteRepository' =
{ 	
get 
{ 
return #
_grupoTramiteRepository 0
??=1 4
new5 8"
GrupoTramiteRepository9 O
(O P
_clientP W
,W X
_configurationY g
)g h
;h i
}j k
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
}22 ¶L
~C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\FxActualizarGrupoTramite.cs
	namespace 	
FxGrupoTramite
 
{ 
public 

class $
FxActualizarGrupoTramite )
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private   
readonly   

IValidator   #
<  # $
GrupoTramiteInput  $ 5
>  5 6"
_grupoTramiteValidator  7 M
;  M N
private!! 
readonly!! 
IMapper!!  
_mapper!!! (
;!!( )
public## $
FxActualizarGrupoTramite## '
(##' (
IUnitOfWork##( 3

unitOfWork##4 >
,##> ?

IValidator##@ J
<##J K
GrupoTramiteInput##K \
>##\ ]!
grupoTramiteValidator##^ s
,##s t
IMapper##u |
mapper	##} É
)
##É Ñ
{$$ 	
_unitOfWork%% 
=%% 

unitOfWork%% $
;%%$ %"
_grupoTramiteValidator&& "
=&&# $!
grupoTramiteValidator&&% :
;&&: ;
_mapper'' 
='' 
mapper'' 
;'' 
}(( 	
[** 	
FunctionName**	 
(** 
nameof** 
(** "
ActualizarGrupoTramite** 3
)**3 4
)**4 5
]**5 6
[++ 	
FixedDelayRetry++	 
(++ 
$num++ 
,++ 
$str++ &
)++& '
]++' (
[,, 	
OpenApiOperation,,	 
(,, 
operationId,, %
:,,% &
$str,,' ?
,,,? @
tags,,A E
:,,E F
new,,G J
[,,J K
],,K L
{,,M N
$str,,O l
},,m n
,,,n o
Description,,p {
=,,| }
$str	,,~ ù
,
,,ù û
Summary
,,ü ¶
=
,,ß ®
$str
,,© »
)
,,» …
]
,,…  
[-- 	
OpenApiSecurity--	 
(-- 
$str-- '
,--' (
SecuritySchemeType--) ;
.--; <
ApiKey--< B
,--B C
Name--D H
=--I J
$str--K Q
,--Q R
In--S U
=--V W'
OpenApiSecurityLocationType--X s
.--s t
Query--t y
)--y z
]--z {
[.. 	
OpenApiParameter..	 
(.. 
name.. 
:.. 
$str..  0
,..0 1
In..2 4
=..5 6
ParameterLocation..7 H
...H I
Path..I M
,..M N
Required..O W
=..X Y
true..Z ^
,..^ _
Type..` d
=..e f
typeof..g m
(..m n
string..n t
)..t u
,..u v
Description	..w Ç
=
..É Ñ
$str
..Ö ©
)
..© ™
]
..™ ´
[// 	
OpenApiRequestBody//	 
(// 
contentType// '
://' (
$str//) ;
,//; <
bodyType//= E
://E F
typeof//G M
(//M N
GrupoTramiteInput//N _
)//_ `
,//` a
Required//b j
=//k l
true//m q
,//q r
Description//s ~
=	// Ä
$str
//Å î
)
//î ï
]
//ï ñ
[00 	#
OpenApiResponseWithBody00	  
(00  !

statusCode00! +
:00+ ,
HttpStatusCode00- ;
.00; <
OK00< >
,00> ?
contentType00@ K
:00K L
$str00M _
,00_ `
bodyType00a i
:00i j
typeof00k q
(00q r
ResponseResult	00r Ä
)
00Ä Å
,
00Å Ç
Description
00É é
=
00è ê
$str
00ë ¢
)
00¢ £
]
00£ §
[11 	#
OpenApiResponseWithBody11	  
(11  !

statusCode11! +
:11+ ,
HttpStatusCode11- ;
.11; <

BadRequest11< F
,11F G
contentType11H S
:11S T
$str11U g
,11g h
bodyType11i q
:11q r
typeof11s y
(11y z
ResponseResult	11z à
)
11à â
,
11â ä
Description
11ã ñ
=
11ó ò
$str
11ô ¶
)
11¶ ß
]
11ß ®
[22 	#
OpenApiResponseWithBody22	  
(22  !

statusCode22! +
:22+ ,
HttpStatusCode22- ;
.22; <
InternalServerError22< O
,22O P
contentType22Q \
:22\ ]
$str22^ p
,22p q
bodyType22r z
:22z {
typeof	22| Ç
(
22Ç É
ResponseResult
22É ë
)
22ë í
,
22í ì
Description
22î ü
=
22† °
$str
22¢ ∏
)
22∏ π
]
22π ∫
public33 
async33 
Task33 
<33 
IActionResult33 '
>33' ("
ActualizarGrupoTramite33) ?
(33? @
[44 
HttpTrigger44 
(44 
AuthorizationLevel44 +
.44+ ,
Function44, 4
,444 5
$str446 ;
,44; <
Route44= B
=44C D
$str44E i
)44i j
]44j k
HttpRequest44l w
req44x {
,44{ |
string	44} É
idGrupoTramite
44Ñ í
)
44í ì
{55 	
try66 
{77 
var88 
json88 
=88 
await88  
req88! $
.88$ %
ReadAsStringAsync88% 6
(886 7
)887 8
;888 9
GrupoTramiteInput:: !
request::" )
=::* +
JsonConvert::, 7
.::7 8
DeserializeObject::8 I
<::I J
GrupoTramiteInput::J [
>::[ \
(::\ ]
json::] a
)::a b
;::b c
var;; 
validationResult;; $
=;;% &"
_grupoTramiteValidator;;' =
.;;= >
Validate;;> F
(;;F G
request;;G N
);;N O
;;;O P
bool<< 
existeRecurso<< "
=<<# $
await<<% *
_unitOfWork<<+ 6
.<<6 7"
GrupoTramiteRepository<<7 M
.<<M N$
GetGrupoTramiteByIdAsync<<N f
(<<f g
idGrupoTramite<<g u
)<<u v
!=<<w y
null<<z ~
;<<~ 
if== 
(== 
validationResult== $
.==$ %
IsValid==% ,
&&==- /
existeRecurso==0 =
)=== >
{>> 
GrupoTramite??  
grupoServicio??! .
=??/ 0
_mapper??1 8
.??8 9
Map??9 <
<??< =
GrupoTramite??= I
>??I J
(??J K
request??K R
)??R S
;??S T
grupoServicio@@ !
.@@! "
UsuarioModificacion@@" 5
=@@6 7
request@@8 ?
.@@? @
Usuario@@@ G
;@@G H
stringAA 
resultAA !
=AA" #
awaitAA$ )
_unitOfWorkAA* 5
.AA5 6"
GrupoTramiteRepositoryAA6 L
.AAL M#
UpsertGrupoTramiteAsyncAAM d
(AAd e
grupoServicioAAe r
,AAr s
idGrupoTramite	AAt Ç
)
AAÇ É
;
AAÉ Ñ
returnBB 
resultBB !
.BB! "
EqualsBB" (
(BB( )
$strBB) -
)BB- .
?CC 
HttpResponseHelperCC /
.CC/ 0
ResponseCC0 8
(CC8 9
StatusCodesCC9 D
.CCD E
Status200OKCCE P
,CCP Q
newCCR U
ResponseResultCCV d
(CCd e
)CCe f
{CCg h
IsErrorCCi p
=CCq r
falseCCs x
,CCx y
Message	CCz Å
=
CCÇ É
$str
CCÑ π
}
CC∫ ª
)
CCª º
:DD 
HttpResponseHelperDD /
.DD/ 0
ResponseDD0 8
(DD8 9
StatusCodesDD9 D
.DDD E
Status409ConflictDDE V
,DDV W
newDDX [
ResponseResultDD\ j
(DDj k
)DDk l
{DDm n
IsErrorDDo v
=DDw x
falseDDy ~
,DD~ 
Message
DDÄ á
=
DDà â
$str
DDä Ω
}
DDæ ø
)
DDø ¿
;
DD¿ ¡
}EE 
elseFF 
{GG 
returnHH 
HttpResponseHelperHH -
.HH- .
ResponseHH. 6
(HH6 7
StatusCodesHH7 B
.HHB C
Status400BadRequestHHC V
,HHV W
newHHX [
ResponseResultHH\ j
(HHj k
)HHk l
{II 
IsErrorJJ 
=JJ  !
trueJJ" &
,JJ& '
MessageKK 
=KK  !
!KK" #
existeRecursoKK# 0
?KK1 2
$strKK3 i
:KKj k
validationResultKKl |
.KK| }
Errors	KK} É
.
KKÉ Ñ
First
KKÑ â
(
KKâ ä
)
KKä ã
.
KKã å
ErrorMessage
KKå ò
}LL 
)LL 
;LL 
}MM 
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO 
)OO  
{PP 
returnQQ 
HttpResponseHelperQQ )
.QQ) *
ResponseQQ* 2
(QQ2 3
StatusCodesQQ3 >
.QQ> ?(
Status500InternalServerErrorQQ? [
,QQ[ \
newQQ] `
ResponseResultQQa o
(QQo p
)QQp q
{QQr s
IsErrorQQt {
=QQ| }
true	QQ~ Ç
,
QQÇ É
Message
QQÑ ã
=
QQå ç
ex
QQé ê
.
QQê ë
Message
QQë ò
}
QQô ö
)
QQö õ
;
QQõ ú
}RR 
}SS 	
}TT 
}UU ôF
yC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\FxCrearGrupoTramite.cs
	namespace 	
FxGrupoTramite
 
{ 
public 

class 
FxCrearGrupoTramite $
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private   
readonly   

IValidator   #
<  # $
GrupoTramiteInput  $ 5
>  5 6"
_grupoTramiteValidator  7 M
;  M N
private!! 
readonly!! 
IMapper!!  
_mapper!!! (
;!!( )
public## 
FxCrearGrupoTramite## "
(##" #
IUnitOfWork### .

unitOfWork##/ 9
,##9 :

IValidator##; E
<##E F
GrupoTramiteInput##F W
>##W X!
grupoTramiteValidator##Y n
,##n o
IMapper##p w
mapper##x ~
)##~ 
{$$ 	
_unitOfWork%% 
=%% 

unitOfWork%% $
;%%$ %"
_grupoTramiteValidator&& "
=&&# $!
grupoTramiteValidator&&% :
;&&: ;
_mapper'' 
='' 
mapper'' 
;'' 
}(( 	
[** 	
FunctionName**	 
(** 
nameof** 
(** 
CrearGrupoTramite** .
)**. /
)**/ 0
]**0 1
[++ 	
FixedDelayRetry++	 
(++ 
$num++ 
,++ 
$str++ &
)++& '
]++' (
[,, 	
OpenApiOperation,,	 
(,, 
operationId,, %
:,,% &
$str,,' :
,,,: ;
tags,,< @
:,,@ A
new,,B E
[,,E F
],,F G
{,,H I
$str,,J _
},,` a
,,,a b
Description,,c n
=,,o p
$str	,,q ã
,
,,ã å
Summary
,,ç î
=
,,ï ñ
$str
,,ó ±
)
,,± ≤
]
,,≤ ≥
[-- 	
OpenApiSecurity--	 
(-- 
$str-- '
,--' (
SecuritySchemeType--) ;
.--; <
ApiKey--< B
,--B C
Name--D H
=--I J
$str--K Q
,--Q R
In--S U
=--V W'
OpenApiSecurityLocationType--X s
.--s t
Query--t y
)--y z
]--z {
[.. 	
OpenApiRequestBody..	 
(.. 
contentType.. '
:..' (
$str..) ;
,..; <
bodyType..= E
:..E F
typeof..G M
(..M N
GrupoTramiteInput..N _
).._ `
,..` a
Required..b j
=..k l
true..m q
,..q r
Description..s ~
=	.. Ä
$str
..Å î
)
..î ï
]
..ï ñ
[// 	#
OpenApiResponseWithBody//	  
(//  !

statusCode//! +
://+ ,
HttpStatusCode//- ;
.//; <
Created//< C
,//C D
contentType//E P
://P Q
$str//R d
,//d e
bodyType//f n
://n o
typeof//p v
(//v w
ResponseResult	//w Ö
)
//Ö Ü
,
//Ü á
Description
//à ì
=
//î ï
$str
//ñ ≠
)
//≠ Æ
]
//Æ Ø
[00 	#
OpenApiResponseWithBody00	  
(00  !

statusCode00! +
:00+ ,
HttpStatusCode00- ;
.00; <

BadRequest00< F
,00F G
contentType00H S
:00S T
$str00U g
,00g h
bodyType00i q
:00q r
typeof00s y
(00y z
ResponseResult	00z à
)
00à â
,
00â ä
Description
00ã ñ
=
00ó ò
$str
00ô ¶
)
00¶ ß
]
00ß ®
[11 	#
OpenApiResponseWithBody11	  
(11  !

statusCode11! +
:11+ ,
HttpStatusCode11- ;
.11; <
InternalServerError11< O
,11O P
contentType11Q \
:11\ ]
$str11^ p
,11p q
bodyType11r z
:11z {
typeof	11| Ç
(
11Ç É
ResponseResult
11É ë
)
11ë í
,
11í ì
Description
11î ü
=
11† °
$str
11¢ ∏
)
11∏ π
]
11π ∫
public22 
async22 
Task22 
<22 
IActionResult22 '
>22' (
CrearGrupoTramite22) :
(22: ;
[33 
HttpTrigger33 
(33 
AuthorizationLevel33 +
.33+ ,
Function33, 4
,334 5
$str336 <
,33< =
Route33> C
=33D E
$str33F Y
)33Y Z
]33Z [
HttpRequest33\ g
req33h k
)33k l
{44 	
try55 
{66 
var77 
json77 
=77 
await77  
req77! $
.77$ %
ReadAsStringAsync77% 6
(776 7
)777 8
;778 9
GrupoTramiteInput88 !
request88" )
=88* +
JsonConvert88, 7
.887 8
DeserializeObject888 I
<88I J
GrupoTramiteInput88J [
>88[ \
(88\ ]
json88] a
)88a b
;88b c
bool99 
existeRecurso99 "
=99# $
await99% *
_unitOfWork99+ 6
.996 7"
GrupoTramiteRepository997 M
.99M N#
ExistsGrupoTramiteAsync99N e
(99e f
request99f m
.99m n
NombreGrupoTramite	99n Ä
)
99Ä Å
;
99Å Ç
var:: 
validationResult:: $
=::% &"
_grupoTramiteValidator::' =
.::= >
Validate::> F
(::F G
request::G N
)::N O
;::O P
if;; 
(;; 
validationResult;; $
.;;$ %
IsValid;;% ,
&&;;- /
!;;0 1
existeRecurso;;1 >
);;> ?
{<< 
GrupoTramite==  
grupoTramite==! -
===. /
_mapper==0 7
.==7 8
Map==8 ;
<==; <
GrupoTramite==< H
>==H I
(==I J
request==J Q
)==Q R
;==R S
string?? 
result?? !
=??" #
await??$ )
_unitOfWork??* 5
.??5 6"
GrupoTramiteRepository??6 L
.??L M#
CreateGrupoTramiteAsync??M d
(??d e
grupoTramite??e q
)??q r
;??r s
returnAA 
resultAA !
.AA! "
EqualsAA" (
(AA( )
$strAA) 0
)AA0 1
?AA2 3
HttpResponseHelperAA4 F
.AAF G
ResponseAAG O
(AAO P
StatusCodesAAP [
.AA[ \
Status409ConflictAA\ m
,AAm n
newAAo r
ResponseResult	AAs Å
(
AAÅ Ç
)
AAÇ É
{
AAÑ Ö
IsError
AAÜ ç
=
AAé è
true
AAê î
,
AAî ï
Message
AAñ ù
=
AAû ü
$str
AA† –
}
AA— “
)
AA“ ”
:BB2 3
HttpResponseHelperBB4 F
.BBF G
ResponseBBG O
(BBO P
StatusCodesBBP [
.BB[ \
Status201CreatedBB\ l
,BBl m
newBBn q
ResponseResult	BBr Ä
(
BBÄ Å
)
BBÅ Ç
{
BBÉ Ñ
IsError
BBÖ å
=
BBç é
false
BBè î
,
BBî ï
Message
BBñ ù
=
BBû ü
result
BB† ¶
}
BBß ®
)
BB® ©
;
BB© ™
}CC 
elseDD 
{EE 
returnFF 
HttpResponseHelperFF -
.FF- .
ResponseFF. 6
(FF6 7
StatusCodesFF7 B
.FFB C
Status400BadRequestFFC V
,FFV W
newFFX [
ResponseResultFF\ j
(FFj k
)FFk l
{GG 
IsErrorHH 
=HH  !
trueHH" &
,HH& '
MessageII 
=II  !
existeRecursoII" /
?II0 1
$strII2 c
:IId e
validationResultIIf v
.IIv w
ErrorsIIw }
.II} ~
First	II~ É
(
IIÉ Ñ
)
IIÑ Ö
.
IIÖ Ü
ErrorMessage
IIÜ í
}JJ 
)JJ 
;JJ 
}KK 
}LL 
catchMM 
(MM 
	ExceptionMM 
exMM 
)MM  
{NN 
returnOO 
HttpResponseHelperOO )
.OO) *
ResponseOO* 2
(OO2 3
StatusCodesOO3 >
.OO> ?(
Status500InternalServerErrorOO? [
,OO[ \
newOO] `
ResponseResultOOa o
(OOo p
)OOp q
{OOr s
IsErrorOOt {
=OO| }
true	OO~ Ç
,
OOÇ É
Message
OOÑ ã
=
OOå ç
ex
OOé ê
.
OOê ë
Message
OOë ò
}
OOô ö
)
OOö õ
;
OOõ ú
}PP 
}QQ 	
}RR 
}SS í'
xC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\FxGrupoTramiteByID.cs
	namespace 	
FxGrupoTramite
 
{ 
public 

class 
FxGrupoTramiteByID #
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
FxGrupoTramiteByID !
(! "
IUnitOfWork" -

unitOfWork. 8
)8 9
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
[ 	
FunctionName	 
( 
nameof 
(  
ListarGrupoTramiteID 1
)1 2
)2 3
]3 4
[ 	
FixedDelayRetry	 
( 
$num 
, 
$str &
)& '
]' (
[ 	
OpenApiOperation	 
( 
operationId %
:% &
$str' =
,= >
tags? C
:C D
newE H
[H I
]I J
{K L
$strM f
}g h
,h i
Descriptionj u
=v w
$str	x ™
,
™ ´
Summary
¨ ≥
=
¥ µ
$str
∂ Ë
)
Ë È
]
È Í
[   	
OpenApiSecurity  	 
(   
$str   '
,  ' (
SecuritySchemeType  ) ;
.  ; <
ApiKey  < B
,  B C
Name  D H
=  I J
$str  K Q
,  Q R
In  S U
=  V W'
OpenApiSecurityLocationType  X s
.  s t
Query  t y
)  y z
]  z {
[!! 	
OpenApiParameter!!	 
(!! 
name!! 
:!! 
$str!!  0
,!!0 1
In!!2 4
=!!5 6
ParameterLocation!!7 H
.!!H I
Path!!I M
,!!M N
Required!!O W
=!!X Y
true!!Z ^
,!!^ _
Type!!` d
=!!e f
typeof!!g m
(!!m n
string!!n t
)!!t u
,!!u v
Description	!!w Ç
=
!!É Ñ
$str
!!Ö ©
)
!!© ™
]
!!™ ´
["" 	#
OpenApiResponseWithBody""	  
(""  !

statusCode""! +
:""+ ,
HttpStatusCode""- ;
.""; <
OK""< >
,""> ?
contentType""@ K
:""K L
$str""M _
,""_ `
bodyType""a i
:""i j
typeof""k q
(""q r
GrupoTramiteDto	""r Å
)
""Å Ç
,
""Ç É
Description
""Ñ è
=
""ê ë
$str
""í £
)
""£ §
]
""§ •
[## 	#
OpenApiResponseWithBody##	  
(##  !

statusCode##! +
:##+ ,
HttpStatusCode##- ;
.##; <
InternalServerError##< O
,##O P
contentType##Q \
:##\ ]
$str##^ p
,##p q
bodyType##r z
:##z {
typeof	##| Ç
(
##Ç É
ResponseResult
##É ë
)
##ë í
,
##í ì
Description
##î ü
=
##† °
$str
##¢ ∏
)
##∏ π
]
##π ∫
public$$ 
async$$ 
Task$$ 
<$$ 
IActionResult$$ '
>$$' ( 
ListarGrupoTramiteID$$) =
($$= >
[%% 
HttpTrigger%% 
(%% 
AuthorizationLevel%% +
.%%+ ,
Function%%, 4
,%%4 5
$str%%6 ;
,%%; <
Route%%= B
=%%C D
$str%%E i
)%%i j
]%%j k
HttpRequest%%l w
req%%x {
,%%{ |
string	%%} É
idGrupoTramite
%%Ñ í
)
%%í ì
{&& 	
try'' 
{(( 
GrupoTramiteDto)) 
grupoTramite))  ,
=))- .
await))/ 4
_unitOfWork))5 @
.))@ A"
GrupoTramiteRepository))A W
.))W X$
GetGrupoTramiteByIdAsync))X p
())p q
idGrupoTramite))q 
)	)) Ä
;
))Ä Å
return** 
HttpResponseHelper** )
.**) *"
SuccessfulObjectResult*** @
(**@ A
grupoTramite**A M
)**M N
;**N O
}++ 
catch,, 
(,, 
	Exception,, 
ex,, 
),,  
{-- 
return.. 
HttpResponseHelper.. )
...) *
Response..* 2
(..2 3
StatusCodes..3 >
...> ?(
Status500InternalServerError..? [
,..[ \
new..] `
ResponseResult..a o
(..o p
)..p q
{..r s
IsError..t {
=..| }
true	..~ Ç
,
..Ç É
Message
..Ñ ã
=
..å ç
ex
..é ê
.
..ê ë
Message
..ë ò
}
..ô ö
)
..ö õ
;
..õ ú
}// 
}00 	
}11 
}22 ñ#
{C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\FxListarGruposTramite.cs
	namespace 	
FxGrupoTramite
 
{ 
public 

class !
FxListarGruposTramite &
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public !
FxListarGruposTramite $
($ %
IUnitOfWork% 0

unitOfWork1 ;
); <
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
[ 	
FunctionName	 
( 
nameof 
( 
ListarGruposTramite 0
)0 1
)1 2
]2 3
[ 	
FixedDelayRetry	 
( 
$num 
, 
$str &
)& '
]' (
[   	
OpenApiOperation  	 
(   
operationId   %
:  % &
$str  ' <
,  < =
tags  > B
:  B C
new  D G
[  G H
]  H I
{  J K
$str  L y
}  z {
,  { |
Description	  } à
=
  â ä
$str
  ã ™
,
  ™ ´
Summary
  ¨ ≥
=
  ¥ µ
$str
  ∂ Ï
)
  Ï Ì
]
  Ì Ó
[!! 	
OpenApiSecurity!!	 
(!! 
$str!! '
,!!' (
SecuritySchemeType!!) ;
.!!; <
ApiKey!!< B
,!!B C
Name!!D H
=!!I J
$str!!K Q
,!!Q R
In!!S U
=!!V W'
OpenApiSecurityLocationType!!X s
.!!s t
Query!!t y
)!!y z
]!!z {
["" 	#
OpenApiResponseWithBody""	  
(""  !

statusCode""! +
:""+ ,
HttpStatusCode""- ;
.""; <
OK""< >
,""> ?
contentType""@ K
:""K L
$str""M _
,""_ `
bodyType""a i
:""i j
typeof""k q
(""q r
IList""r w
<""w x
GrupoTramiteDto	""x á
>
""á à
)
""à â
,
""â ä
Description
""ã ñ
=
""ó ò
$str
""ô ™
)
""™ ´
]
""´ ¨
[## 	#
OpenApiResponseWithBody##	  
(##  !

statusCode##! +
:##+ ,
HttpStatusCode##- ;
.##; <
InternalServerError##< O
,##O P
contentType##Q \
:##\ ]
$str##^ p
,##p q
bodyType##r z
:##z {
typeof	##| Ç
(
##Ç É
ResponseResult
##É ë
)
##ë í
,
##í ì
Description
##î ü
=
##† °
$str
##¢ ∏
)
##∏ π
]
##π ∫
public$$ 
async$$ 
Task$$ 
<$$ 
IActionResult$$ '
>$$' (
ListarGruposTramite$$) <
($$< =
[%% 
HttpTrigger%% 
(%% 
AuthorizationLevel%% +
.%%+ ,
Function%%, 4
,%%4 5
$str%%6 ;
,%%; <
Route%%= B
=%%C D
$str%%E X
)%%X Y
]%%Y Z
HttpRequest%%[ f
req%%g j
)%%j k
{&& 	
try'' 
{(( 
IList)) 
<)) 
GrupoTramiteDto)) %
>))% &
gruposServicio))' 5
=))6 7
await))8 =
_unitOfWork))> I
.))I J"
GrupoTramiteRepository))J `
.))` a!
GetGruposTramiteAsync))a v
())v w
)))w x
;))x y
return** 
HttpResponseHelper** )
.**) *"
SuccessfulObjectResult*** @
(**@ A
gruposServicio**A O
)**O P
;**P Q
}++ 
catch,, 
(,, 
	Exception,, 
ex,, 
),,  
{-- 
return.. 
HttpResponseHelper.. )
...) *
Response..* 2
(..2 3
StatusCodes..3 >
...> ?(
Status500InternalServerError..? [
,..[ \
new..] `
ResponseResult..a o
(..o p
)..p q
{..r s
IsError..t {
=..| }
true	..~ Ç
,
..Ç É
Message
..Ñ ã
=
..å ç
ex
..é ê
.
..ê ë
Message
..ë ò
}
..ô ö
)
..ö õ
;
..õ ú
}// 
}00 	
}11 
}22 «
öC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Interfaces\RepositoryPattern\IGrupoTramiteRepository.cs
	namespace 	
FxGrupoTramite
 
. 

Interfaces #
.# $
RepositoryPattern$ 5
{ 
public		 

	interface		 #
IGrupoTramiteRepository		 ,
{

 
public 
Task 
< 
string 
> #
CreateGrupoTramiteAsync 3
(3 4
GrupoTramite4 @
grupoTramiteA M
)M N
;N O
public 
Task 
< 
GrupoTramiteDto #
># $$
GetGrupoTramiteByIdAsync% =
(= >
string> D
idGrupoTramiteE S
)S T
;T U
public 
Task 
< 
List 
< 
GrupoTramiteDto (
>( )
>) *!
GetGruposTramiteAsync+ @
(@ A
)A B
;B C
public 
Task 
< 
string 
> #
UpsertGrupoTramiteAsync 3
(3 4
GrupoTramite4 @
grupoTramiteA M
,M N
stringO U
idGrupoTramiteV d
)d e
;e f
public 
Task 
< 
bool 
> #
ExistsGrupoTramiteAsync 1
(1 2
string2 8
nombreGrupoTramite9 K
)K L
;L M
} 
} ¬
éC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Interfaces\RepositoryPattern\IUnitOfWork.cs
	namespace 	
FxGrupoTramite
 
. 

Interfaces #
.# $
RepositoryPattern$ 5
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ #
IGrupoTramiteRepository "
GrupoTramiteRepository  6
{7 8
get9 <
;< =
}> ?
} 
}		 ö
àC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Mappers\MappingProfileGrupoTramite.cs
	namespace		 	
FxGrupoTramite		
 
.		 
Mappers		  
{

 
public 

class &
MappingProfileGrupoTramite +
:, -
Profile. 5
{ 
public &
MappingProfileGrupoTramite )
() *
)* +
{ 	
	CreateMap 
< 
GrupoTramiteInput '
,' (
GrupoTramite) 5
>5 6
(6 7
)7 8
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
Id$ &
,& '
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
SecurityHelper0 >
.> ?
SHA256Encrypt? L
(L M
srcM P
.P Q
NombreGrupoTramiteQ c
.c d
Trimd h
(h i
)i j
)j k
)k l
)l m
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
NombreGrupoTramite$ 6
,6 7
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
NombreGrupoTramite4 F
.F G
TrimG K
(K L
)L M
)M N
)N O
. 
	ForMember 
( 
dest 
=> 
dest #
.# $#
DescripcionGrupoTramite$ ;
,; <
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4#
DescripcionGrupoTramite4 K
.K L
TrimL P
(P Q
)Q R
)R S
)S T
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
Icono$ )
,) *
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
Icono4 9
.9 :
Trim: >
(> ?
)? @
)@ A
)A B
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
FechaCrecion$ 0
,0 1
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
DateTimeOffset0 >
.> ?
UtcNow? E
)E F
)F G
.   
	ForMember   
(   
dest   
=>   
dest   #
.  # $
UsuarioCreacion  $ 3
,  3 4
opt!! 
=>!! 
opt!!  
.!!  !
MapFrom!!! (
(!!( )
src!!) ,
=>!!- /
src!!0 3
.!!3 4
Usuario!!4 ;
)!!; <
)!!< =
;!!= >
}"" 	
}## 
}$$ ü
êC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Models\DataTransferObjects\GrupoTramiteDto.cs
	namespace 	
FxGrupoTramite
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 
GrupoTramiteDto  
{ 
public 
string 
idGrupoTramite $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
nombreGrupoTramite (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string #
descripcionGrupoTramite -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
string 
icono 
{ 
get !
;! "
set# &
;& '
}( )
}		 
}

 Æ
ÇC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Models\Entities\GrupoTramite.cs
	namespace 	
FxGrupoTramite
 
. 
Models 
.  
Entities  (
{ 
public 

class 
GrupoTramite 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public

 
string

 
NombreGrupoTramite

 (
{

) *
get

+ .
;

. /
set

0 3
;

3 4
}

5 6
public 
string #
DescripcionGrupoTramite -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
string 
Icono 
{ 
get !
;! "
set# &
;& '
}( )
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTimeOffset 
FechaCrecion *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
UsuarioModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DateTimeOffset 
FechaModificacion /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} Æ
ÑC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Models\Input\GrupoTramiteInput.cs
	namespace 	
FxGrupoTramite
 
. 
Models 
.  
Input  %
{ 
[ 
OpenApiExample 
( 
typeof 
( 
GrupoTramiteExample .
). /
)/ 0
]0 1
public		 

class		 
GrupoTramiteInput		 "
{

 
[ 	
JsonProperty	 
( 
$str 
, 
Required  (
=) *
Required+ 3
.3 4
Always4 :
): ;
]; <
public 
string 
NombreGrupoTramite (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
[ 	
JsonProperty	 
( 
$str #
,# $
Required% -
=. /
Required0 8
.8 9
Default9 @
)@ A
]A B
public 
string #
DescripcionGrupoTramite -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
[ 	
JsonProperty	 
( 
$str 
, 
Required '
=( )
Required* 2
.2 3
Default3 :
): ;
]; <
public 
string 
Icono 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonProperty	 
( 
$str 
, 
Required  (
=) *
Required+ 3
.3 4
Default4 ;
); <
]< =
public 
bool 
? 
Activo 
{ 
get !
;! "
set# &
;& '
}( )
=* +
true, 0
;0 1
[ 	
JsonProperty	 
( 
$str 
,  
Required! )
=* +
Required, 4
.4 5
Always5 ;
); <
]< =
public 
string 
Usuario 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ∂
{C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Models\ResponseResult.cs
	namespace		 	
FxGrupoTramite		
 
.		 
Models		 
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
} Ö
ÅC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\OpenApi\GrupoTramiteExample.cs
	namespace 	
FxGrupoTramite
 
. 
OpenApi  
{		 
public

 

class

 
GrupoTramiteExample

 $
:

% &
OpenApiExample

' 5
<

5 6
GrupoTramiteInput

6 G
>

G H
{ 
public 
override 
IOpenApiExample '
<' (
GrupoTramiteInput( 9
>9 :
Build; @
(@ A
NamingStrategyA O
namingStrategyP ^
=_ `
nulla e
)e f
{ 	
Examples 
. 
Add 
( "
OpenApiExampleResolver &
.& '
Resolve' .
(. /
$str '
,' (
new 
GrupoTramiteInput )
() *
)* +
{ 
NombreGrupoTramite *
=+ ,
$str- A
,A B#
DescripcionGrupoTramite /
=0 1
$str2 O
,O P
Icono 
= 
$str &
,& '
Activo 
=  
true! %
,% &
Usuario 
=  !
$str" 0
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
} Ñ
ÉC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\OpenApi\ResponseResultExample.cs
	namespace

 	
FxGrupoTramite


 
.

 
OpenApi

  
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
{ 	
Examples 
. 
Add 
( "
OpenApiExampleResolver &
.& '
Resolve' .
(. /
$str '
,' (
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
} ê^
âC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Repositories\GrupoTramiteRepository.cs
	namespace 	
FxGrupoTramite
 
. 
Repositories %
{ 
public 

class "
GrupoTramiteRepository '
:( )
RepositoryBase* 8
,8 9#
IGrupoTramiteRepository: Q
{ 
private 
readonly 
	Container "
	container# ,
;, -
public "
GrupoTramiteRepository %
(% &
CosmosClient& 2
client3 9
,9 :
IConfiguration; I
configurationJ W
)W X
: 
base 
( 
client 
) 
{ 	
string 
containerId 
=  
configuration! .
[. /
$str/ I
]I J
;J K
string 
databaseName 
=  !
configuration" /
[/ 0
$str0 C
]C D
;D E
	container 
= 
client 
. 
GetContainer +
(+ ,
databaseName, 8
,8 9
containerId: E
)E F
;F G
} 	
public 
async 
Task 
< 
string  
>  !#
CreateGrupoTramiteAsync" 9
(9 :
GrupoTramite: F
grupoTramiteG S
)S T
{ 	
try   
{!! 
ItemResponse"" 
<"" 
GrupoTramite"" )
>"") *
itemResponse""+ 7
=""8 9
await"": ?
	container""@ I
.""I J
ReadItemAsync""J W
<""W X
GrupoTramite""X d
>""d e
(""e f
grupoTramite""f r
.""r s
Id""s u
,""u v
new""w z
PartitionKey	""{ á
(
""á à
grupoTramite
""à î
.
""î ï
Id
""ï ó
)
""ó ò
)
""ò ô
;
""ô ö
return## 
itemResponse## #
==##$ &
null##' +
?##, -
$str##. 2
:##3 4
$str##5 <
;##< =
}$$ 
catch%% 
(%% 
CosmosException%% "
ex%%# %
)%%% &
when%%' +
(%%, -
ex%%- /
.%%/ 0

StatusCode%%0 :
==%%; =
HttpStatusCode%%> L
.%%L M
NotFound%%M U
)%%U V
{&& 
var'' 
result'' 
='' 
await'' "
	container''# ,
.'', -
CreateItemAsync''- <
(''< =
grupoTramite''= I
,''I J
new''K N
PartitionKey''O [
(''[ \
grupoTramite''\ h
.''h i
Id''i k
)''k l
)''l m
;''m n
if(( 
((( 
result(( 
.(( 

StatusCode(( %
.((% &
ToString((& .
(((. /
)((/ 0
is((1 3
$str((4 =
)((= >
return)) 
$str)) -
;))- .
return** 
$str** 
;** 
}++ 
},, 	
public.. 
async.. 
Task.. 
<.. 
bool.. 
>.. #
ExistsGrupoTramiteAsync..  7
(..7 8
string..8 >
nombreGrupoTramite..? Q
)..Q R
{// 	
GrupoTramiteDto00 
data00  
=00! "
null00# '
;00' (
try11 
{22 
var33 
queryString33 
=33  !
$str37" G
;77G H
var99 
queryDef99 
=99 
new99 "
QueryDefinition99# 2
(992 3
queryString993 >
)99> ?
;99? @
queryDef:: 
.:: 
WithParameter:: &
(::& '
$str::' 0
,::0 1
nombreGrupoTramite::2 D
)::D E
;::E F
var;; 
query;; 
=;; 
	container;; %
.;;% & 
GetItemQueryIterator;;& :
<;;: ;
GrupoTramiteDto;;; J
>;;J K
(;;K L
queryDef;;L T
);;T U
;;;U V
while== 
(== 
query== 
.== 
HasMoreResults== +
)==+ ,
{>> 
var?? 
response??  
=??! "
await??# (
query??) .
.??. /
ReadNextAsync??/ <
(??< =
)??= >
;??> ?
data@@ 
=@@ 
response@@ #
.@@# $
SingleOrDefault@@$ 3
(@@3 4
)@@4 5
;@@5 6
}AA 
returnCC 
dataCC 
!=CC 
nullCC #
;CC# $
}DD 
catchEE 
(EE 
CosmosExceptionEE "
exEE# %
)EE% &
whenEE' +
(EE, -
exEE- /
.EE/ 0

StatusCodeEE0 :
==EE; =
HttpStatusCodeEE> L
.EEL M
NotFoundEEM U
)EEU V
{FF 
returnGG 
falseGG 
;GG 
}HH 
}II 	
publicKK 
asyncKK 
TaskKK 
<KK 
GrupoTramiteDtoKK )
>KK) *$
GetGrupoTramiteByIdAsyncKK+ C
(KKC D
stringKKD J
idGrupoTramiteKKK Y
)KKY Z
{LL 	
GrupoTramiteDtoMM 
grupoServicioDtoMM ,
=MM- .
nullMM/ 3
;MM3 4
tryNN 
{OO 
varPP 
queryStringPP 
=PP  !
$strPV" R
;VVR S
varXX 
queryDefXX 
=XX 
newXX "
QueryDefinitionXX# 2
(XX2 3
queryStringXX3 >
)XX> ?
;XX? @
queryDefYY 
.YY 
WithParameterYY &
(YY& '
$strYY' 0
,YY0 1
trueYY2 6
)YY6 7
;YY7 8
queryDefZZ 
.ZZ 
WithParameterZZ &
(ZZ& '
$strZZ' 8
,ZZ8 9
idGrupoTramiteZZ: H
)ZZH I
;ZZI J
var\\ 
query\\ 
=\\ 
	container\\ %
.\\% & 
GetItemQueryIterator\\& :
<\\: ;
GrupoTramiteDto\\; J
>\\J K
(\\K L
queryDef\\L T
)\\T U
;\\U V
while]] 
(]] 
query]] 
.]] 
HasMoreResults]] +
)]]+ ,
{^^ 
var__ 
response__  
=__! "
await__# (
query__) .
.__. /
ReadNextAsync__/ <
(__< =
)__= >
;__> ?
grupoServicioDto`` $
=``% &
response``' /
.``/ 0
SingleOrDefault``0 ?
(``? @
)``@ A
;``A B
}aa 
returncc 
grupoServicioDtocc '
;cc' (
}dd 
catchee 
(ee 
CosmosExceptionee "
exee# %
)ee% &
whenee' +
(ee, -
exee- /
.ee/ 0

StatusCodeee0 :
==ee; =
HttpStatusCodeee> L
.eeL M
NotFoundeeM U
)eeU V
{ff 
returngg 
grupoServicioDtogg '
;gg' (
}hh 
}ii 	
publickk 
asynckk 
Taskkk 
<kk 
Listkk 
<kk 
GrupoTramiteDtokk .
>kk. /
>kk/ 0!
GetGruposTramiteAsynckk1 F
(kkF G
)kkG H
{ll 	
varmm 
queryStringmm 
=mm 
$strms 8
;ss8 9
varuu 
queryDefuu 
=uu 
newuu 
QueryDefinitionuu .
(uu. /
queryStringuu/ :
)uu: ;
;uu; <
queryDefvv 
.vv 
WithParametervv "
(vv" #
$strvv# ,
,vv, -
truevv. 2
)vv2 3
;vv3 4
varxx 
queryxx 
=xx 
	containerxx !
.xx! " 
GetItemQueryIteratorxx" 6
<xx6 7
GrupoTramiteDtoxx7 F
>xxF G
(xxG H
queryDefxxH P
)xxP Q
;xxQ R
varzz 
gruposServiciozz 
=zz  
newzz! $
Listzz% )
<zz) *
GrupoTramiteDtozz* 9
>zz9 :
(zz: ;
)zz; <
;zz< =
while|| 
(|| 
query|| 
.|| 
HasMoreResults|| '
)||' (
{}} 
var~~ 
response~~ 
=~~ 
await~~ $
query~~% *
.~~* +
ReadNextAsync~~+ 8
(~~8 9
)~~9 :
;~~: ;
gruposServicio 
. 
AddRange '
(' (
response( 0
.0 1
ToList1 7
(7 8
)8 9
)9 :
;: ;
}
ÄÄ 
return
ÇÇ 
gruposServicio
ÇÇ !
;
ÇÇ! "
}
ÉÉ 	
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
string
ÖÖ  
>
ÖÖ  !%
UpsertGrupoTramiteAsync
ÖÖ" 9
(
ÖÖ9 :
GrupoTramite
ÖÖ: F
grupoTramite
ÖÖG S
,
ÖÖS T
string
ÖÖU [
idGrupoTramite
ÖÖ\ j
)
ÖÖj k
{
ÜÜ 	
try
áá 
{
àà 
grupoTramite
ââ 
.
ââ 
Id
ââ 
=
ââ  !
idGrupoTramite
ââ" 0
;
ââ0 1
var
ää 
result
ää 
=
ää 
await
ää "
	container
ää# ,
.
ää, -
PatchItemAsync
ää- ;
<
ää; <
GrupoTramite
ää< H
>
ääH I
(
ääI J
idGrupoTramite
ääJ X
,
ääX Y
new
ääZ ]
PartitionKey
ää^ j
(
ääj k
idGrupoTramite
ääk y
)
ääy z
,
ääz {
new
ãã 
[
ãã 
]
ãã 
{
ãã 
PatchOperation
åå (
.
åå( )
Set
åå) ,
(
åå, -
$str
åå- B
,
ååB C
grupoTramite
ååD P
.
ååP Q 
NombreGrupoTramite
ååQ c
)
ååc d
,
ååd e
PatchOperation
çç (
.
çç( )
Set
çç) ,
(
çç, -
$str
çç- G
,
ççG H
grupoTramite
ççI U
.
ççU V%
DescripcionGrupoTramite
ççV m
)
ççm n
,
ççn o
PatchOperation
éé (
.
éé( )
Set
éé) ,
(
éé, -
$str
éé- 5
,
éé5 6
grupoTramite
éé7 C
.
ééC D
Icono
ééD I
)
ééI J
,
ééJ K
PatchOperation
èè (
.
èè( )
Set
èè) ,
(
èè, -
$str
èè- 6
,
èè6 7
grupoTramite
èè8 D
.
èèD E
Activo
èèE K
)
èèK L
,
èèL M
PatchOperation
êê (
.
êê( )
Set
êê) ,
(
êê, -
$str
êê- C
,
êêC D
grupoTramite
êêE Q
.
êêQ R!
UsuarioModificacion
êêR e
)
êêe f
,
êêf g
PatchOperation
ëë (
.
ëë( )
Set
ëë) ,
(
ëë, -
$str
ëë- A
,
ëëA B
DateTimeOffset
ëëC Q
.
ëëQ R
UtcNow
ëëR X
)
ëëX Y
}
ëëZ [
)
ëë[ \
;
ëë\ ]
return
íí 
result
íí 
.
íí 

StatusCode
íí (
.
íí( )
ToString
íí) 1
(
íí1 2
)
íí2 3
;
íí3 4
}
ìì 
catch
îî 
(
îî 
	Exception
îî 
ex
îî 
)
îî  
{
ïï 
return
ññ 
ex
ññ 
.
ññ 
Message
ññ !
;
ññ! "
}
óó 
}
òò 	
}
ôô 
}öö ä
ÅC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Repositories\RepositoryBase.cs
	namespace 	
FxGrupoTramite
 
. 
Repositories %
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
} ∂3
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Startup.cs
[ 
assembly 	
:	 

FunctionsStartup 
( 
typeof "
(" #
Startup# *
)* +
)+ ,
], -
	namespace 	
FxGrupoTramite
 
{ 
public 

class 
Startup 
: 
FunctionsStartup +
{ 
public 
override 
void 
	Configure &
(& '!
IFunctionsHostBuilder' <
builder= D
)D E
{ 	
var   
keyVaultName   
=   
Environment   *
.  * +"
GetEnvironmentVariable  + A
(  A B
$str  B R
)  R S
;  S T
var!! 
kvUri!! 
=!! 
$"!! 
$str!! "
{!!" #
keyVaultName!!# /
}!!/ 0
$str!!0 A
"!!A B
;!!B C
var## 
tenant## 
=## 
new## )
DefaultAzureCredentialOptions## :
{$$  
VisualStudioTenantId%% $
=%%% &
Environment%%' 2
.%%2 3"
GetEnvironmentVariable%%3 I
(%%I J
$str%%J Y
)%%Y Z
}&& 
;&&  
ConfigurationBuilder((   
configurationBuilder((! 5
=((6 7
new((8 ;
(((; <
)((< =
;((= >
var)) 
configuration)) 
=))  
configurationBuilder))  4
.** 
SetBasePath** 
(** 
	Directory** &
.**& '
GetCurrentDirectory**' :
(**: ;
)**; <
)**< =
.++ 
AddJsonFile++ 
(++ 
$str++ 2
,++2 3
optional++4 <
:++< =
true++> B
,++B C
reloadOnChange++D R
:++R S
true,, 
),, 
.-- 
AddAzureKeyVault-- !
(--! "
vaultUri--" *
:--* +
new--, /
Uri--0 3
(--3 4
kvUri--4 9
)--9 :
,--: ;

credential--< F
:--F G
new--H K"
DefaultAzureCredential--L b
(--b c
tenant--c i
)--i j
)--j k
... #
AddEnvironmentVariables.. (
(..( )
)..) *
.// 
Build// 
(// 
)// 
;// 
string11 
nombreAccount11  
=11! "
configuration11# 0
[110 1
$str111 K
]11K L
;11L M
string22 
nombreSecreto22  
=22! "
configuration22# 0
[220 1
$str221 C
]22C D
;22D E
string44 
account44 
=44 
configuration44 *
[44* +
nombreAccount44+ 8
]448 9
;449 :
string55 
key55 
=55 
configuration55 &
[55& '
nombreSecreto55' 4
]554 5
;555 6
string66 
databaseName66 
=66  !
configuration66" /
[66/ 0
$str660 C
]66C D
;66D E
builder88 
.88 
Services88 
.88 
AddSingleton88 )
<88) *
SecretClient88* 6
>886 7
(887 8
)888 9
;889 :
builder99 
.99 
Services99 
.99 
AddAutoMapper99 *
(99* +
typeof99+ 1
(991 2
Startup992 9
)999 :
)99: ;
;99; <
CosmosClientBuilder;; 
clientBuilder;;  -
=;;. /
new;;0 3
(;;3 4
account;;4 ;
,;;; <
key;;= @
);;@ A
;;;A B
CosmosClient<< 
client<< 
=<<  !
clientBuilder<<" /
.== 
WithApplicationName== $
(==$ %
databaseName==% 1
)==1 2
.>> 
WithApplicationName>> $
(>>$ %
Regions>>% ,
.>>, -
EastUS2>>- 4
)>>4 5
.?? $
WithConnectionModeDirect?? )
(??) *
)??* +
.@@ !
WithSerializerOptions@@ &
(@@& '
new@@' *&
CosmosSerializationOptions@@+ E
(@@E F
)@@F G
{@@H I 
PropertyNamingPolicy@@J ^
=@@_ `&
CosmosPropertyNamingPolicy@@a {
.@@{ |
	CamelCase	@@| Ö
}
@@Ü á
)
@@á à
.AA 
BuildAA 
(AA 
)AA 
;AA 
builderCC 
.CC 
ServicesCC 
.CC 
AddSingletonCC )
(CC) *
serviceProviderCC* 9
=>CC: <
{DD 
returnEE 
clientEE 
;EE 
}FF 
)FF 
;FF 
builderHH 
.HH 
ServicesHH 
.HH 

AddMvcCoreHH '
(HH' (
)HH( )
.HH) *
AddNewtonsoftJsonHH* ;
(HH; <
jsonOptionsHH< G
=>HHH J
{II 
jsonOptionsJJ 
.JJ 
SerializerSettingsJJ .
.JJ. /
NullValueHandlingJJ/ @
=JJA B
NullValueHandlingJJC T
.JJT U
IgnoreJJU [
;JJ[ \
}KK 
)KK 
;KK 
builderMM 
.MM 
ServicesMM 
.MM 
AddTransientMM )
<MM) *
IUnitOfWorkMM* 5
,MM5 6

UnitOfWorkMM7 A
>MMA B
(MMB C
)MMC D
;MMD E
builderQQ 
.QQ 
ServicesQQ 
.QQ 
	AddScopedQQ &
<QQ& '#
IGrupoTramiteRepositoryQQ' >
,QQ> ?"
GrupoTramiteRepositoryQQ@ V
>QQV W
(QQW X
)QQX Y
;QQY Z
builderUU 
.UU 
ServicesUU 
.UU 
	AddScopedUU &
<UU& '

IValidatorUU' 1
<UU1 2
GrupoTramiteInputUU2 C
>UUC D
,UUD E!
GrupoTramiteValidatorUUF [
>UU[ \
(UU\ ]
)UU] ^
;UU^ _
builderVV 
.VV 
ServicesVV 
.VV 
AddSingletonVV )
<VV) *
IConfigurationVV* 8
>VV8 9
(VV9 :
configurationVV: G
)VVG H
;VVH I
}WW 	
}XX 
}YY œ
~C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Utils\HttpResponseHelper.cs
	namespace 	
FxGrupoTramite
 
. 
Utils 
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
} Ù
zC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Utils\SecurityHelper.cs
	namespace 	
FxGrupoTramite
 
. 
Utils 
{ 
public 

static 
class 
SecurityHelper &
{ 
public 
static 
string 
SHA256Encrypt *
(* +
string+ 1
llave2 7
)7 8
{		 	
SHA256

 
sha256

 
=

 
SHA256

 "
.

" #
Create

# )
(

) *
)

* +
;

+ ,
ASCIIEncoding 
encoding "
=# $
new% (
(( )
)) *
;* +
StringBuilder 
sb 
= 
new "
(" #
)# $
;$ %
byte 
[ 
] 
stream 
= 
sha256 "
." #
ComputeHash# .
(. /
encoding/ 7
.7 8
GetBytes8 @
(@ A
llaveA F
)F G
)G H
;H I
for 
( 
int 
i 
= 
$num 
; 
i 
< 
stream  &
.& '
Length' -
;- .
i/ 0
++0 2
)2 3
sb4 6
.6 7
AppendFormat7 C
(C D
$strD L
,L M
streamN T
[T U
iU V
]V W
)W X
;X Y
return 
$str 
+ 
sb 
. 
ToString %
(% &
)& '
.' (
ToUpper( /
(/ 0
)0 1
;1 2
} 	
} 
} π
ÖC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoTramite\FxGrupoTramite\Validator\GrupoTramiteValidator.cs
	namespace 	
FxGrupoTramite
 
. 
	Validator "
{ 
public		 

class		 !
GrupoTramiteValidator		 &
:		' (
AbstractValidator		) :
<		: ;
GrupoTramiteInput		; L
>		L M
{

 
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
public !
GrupoTramiteValidator $
($ %
)% &
{ 	
RuleFor 
( 
property 
=> 
property  (
.( )
NombreGrupoTramite) ;
); <
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' R
)R S
;S T
RuleFor 
( 
property 
=> 
property  (
.( )
Usuario) 0
)0 1
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' R
)R S
;S T
} 	
} 
} 