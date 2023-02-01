’
~C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\DataContext\UnitOfWork.cs
	namespace		 	
FxGrupoServicio		
 
.		 
DataContext		 %
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
private $
IGrupoServicioRepository ($
_grupoServicioRepository) A
;A B
private #
IGrupoTramiteRepository '#
_grupoTramiteRepository( ?
;? @
private 
bool 
	_disposed 
=  
false! &
;& '
public 

UnitOfWork 
( 
IConfiguration (
configuration) 6
,6 7
CosmosClient8 D
clientE K
)K L
{ 	
_configuration 
= 
configuration *
;* +
_client 
= 
client 
; 
} 	
public $
IGrupoServicioRepository '#
GrupoServicioRepository( ?
{ 	
get 
{ 
return $
_grupoServicioRepository 1
??=2 5
new6 9#
GrupoServicioRepository: Q
(Q R
_clientR Y
,Y Z
_configuration[ i
)i j
;j k
}l m
} 	
public #
IGrupoTramiteRepository &"
GrupoTramiteRepository' =
{   	
get!! 
{!! 
return!! #
_grupoTramiteRepository!! 0
??=!!1 4
new!!5 8"
GrupoTramiteRepository!!9 O
(!!O P
_client!!P W
,!!W X
_configuration!!Y g
)!!g h
;!!h i
}!!j k
}"" 	
	protected$$ 
virtual$$ 
void$$ 
Dispose$$ &
($$& '
bool$$' +
	disposing$$, 5
)$$5 6
{%% 	
if&& 
(&& 
!&& 
	_disposed&& 
&&&& 
!&& 
	disposing&& (
)&&( )
{'' 
_client(( 
.(( 
Dispose(( 
(((  
)((  !
;((! "
})) 
	_disposed** 
=** 
true** 
;** 
}++ 	
public-- 
void-- 
Dispose-- 
(-- 
)-- 
{.. 	
Dispose// 
(// 
true// 
)// 
;// 
GC00 
.00 
SuppressFinalize00 
(00  
this00  $
)00$ %
;00% &
}11 	
~33 	

UnitOfWork33	 
(33 
)33 
{44 	
Dispose55 
(55 
false55 
)55 
;55 
}66 	
}77 
}88 »L
ÅC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\FxActualizarGrupoServicio.cs
	namespace 	
FxGrupoServicio
 
{ 
public 

class %
FxActualizarGrupoServicio *
{ 
private   
readonly   
IUnitOfWork   $
_unitOfWork  % 0
;  0 1
private!! 
readonly!! 

IValidator!! #
<!!# $
GrupoServicioInput!!$ 6
>!!6 7#
_grupoServicioValidator!!8 O
;!!O P
private"" 
readonly"" 
IMapper""  
_mapper""! (
;""( )
public$$ %
FxActualizarGrupoServicio$$ (
($$( )
IUnitOfWork$$) 4

unitOfWork$$5 ?
,$$? @

IValidator$$A K
<$$K L
GrupoServicioInput$$L ^
>$$^ _"
grupoServicioValidator$$` v
,$$v w
IMapper$$x 
mapper
$$Ä Ü
)
$$Ü á
{%% 	
_unitOfWork&& 
=&& 

unitOfWork&& $
;&&$ %#
_grupoServicioValidator'' #
=''$ %"
grupoServicioValidator''& <
;''< =
_mapper(( 
=(( 
mapper(( 
;(( 
})) 	
[++ 	
FunctionName++	 
(++ 
nameof++ 
(++ #
ActualizarGrupoServicio++ 4
)++4 5
)++5 6
]++6 7
[,, 	
FixedDelayRetry,,	 
(,, 
$num,, 
,,, 
$str,, &
),,& '
],,' (
[-- 	
OpenApiOperation--	 
(-- 
operationId-- %
:--% &
$str--' @
,--@ A
tags--B F
:--F G
new--H K
[--K L
]--L M
{--N O
$str--P n
}--o p
,--p q
Description--r }
=--~ 
$str
--Ä †
,
--† °
Summary
--¢ ©
=
--™ ´
$str
--¨ Ã
)
--Ã Õ
]
--Õ Œ
[.. 	
OpenApiSecurity..	 
(.. 
$str.. '
,..' (
SecuritySchemeType..) ;
...; <
ApiKey..< B
,..B C
Name..D H
=..I J
$str..K Q
,..Q R
In..S U
=..V W'
OpenApiSecurityLocationType..X s
...s t
Query..t y
)..y z
]..z {
[// 	
OpenApiParameter//	 
(// 
name// 
:// 
$str//  1
,//1 2
In//3 5
=//6 7
ParameterLocation//8 I
.//I J
Path//J N
,//N O
Required//P X
=//Y Z
true//[ _
,//_ `
Type//a e
=//f g
typeof//h n
(//n o
string//o u
)//u v
,//v w
Description	//x É
=
//Ñ Ö
$str
//Ü ´
)
//´ ¨
]
//¨ ≠
[00 	
OpenApiRequestBody00	 
(00 
contentType00 '
:00' (
$str00) ;
,00; <
bodyType00= E
:00E F
typeof00G M
(00M N
GrupoServicioInput00N `
)00` a
,00a b
Required00c k
=00l m
true00n r
,00r s
Description00t 
=
00Ä Å
$str
00Ç ï
)
00ï ñ
]
00ñ ó
[11 	#
OpenApiResponseWithBody11	  
(11  !

statusCode11! +
:11+ ,
HttpStatusCode11- ;
.11; <
OK11< >
,11> ?
contentType11@ K
:11K L
$str11M _
,11_ `
bodyType11a i
:11i j
typeof11k q
(11q r
ResponseResult	11r Ä
)
11Ä Å
,
11Å Ç
Description
11É é
=
11è ê
$str
11ë ¢
)
11¢ £
]
11£ §
[22 	#
OpenApiResponseWithBody22	  
(22  !

statusCode22! +
:22+ ,
HttpStatusCode22- ;
.22; <

BadRequest22< F
,22F G
contentType22H S
:22S T
$str22U g
,22g h
bodyType22i q
:22q r
typeof22s y
(22y z
ResponseResult	22z à
)
22à â
,
22â ä
Description
22ã ñ
=
22ó ò
$str
22ô ¶
)
22¶ ß
]
22ß ®
[33 	#
OpenApiResponseWithBody33	  
(33  !

statusCode33! +
:33+ ,
HttpStatusCode33- ;
.33; <
InternalServerError33< O
,33O P
contentType33Q \
:33\ ]
$str33^ p
,33p q
bodyType33r z
:33z {
typeof	33| Ç
(
33Ç É
ResponseResult
33É ë
)
33ë í
,
33í ì
Description
33î ü
=
33† °
$str
33¢ ∏
)
33∏ π
]
33π ∫
public44 
async44 
Task44 
<44 
IActionResult44 '
>44' (#
ActualizarGrupoServicio44) @
(44@ A
[55 
HttpTrigger55 
(55 
AuthorizationLevel55 +
.55+ ,
Function55, 4
,554 5
$str556 ;
,55; <
Route55= B
=55C D
$str55E k
)55k l
]55l m
HttpRequest55n y
req55z }
,55} ~
string	55 Ö
idGrupoServicio
55Ü ï
)
55ï ñ
{66 	
try77 
{88 
var99 
json99 
=99 
await99  
req99! $
.99$ %
ReadAsStringAsync99% 6
(996 7
)997 8
;998 9
GrupoServicioInput;; "
request;;# *
=;;+ ,
JsonConvert;;- 8
.;;8 9
DeserializeObject;;9 J
<;;J K
GrupoServicioInput;;K ]
>;;] ^
(;;^ _
json;;_ c
);;c d
;;;d e
var<< 
validationResult<< $
=<<% &#
_grupoServicioValidator<<' >
.<<> ?
Validate<<? G
(<<G H
request<<H O
)<<O P
;<<P Q
bool== 
existeRecurso== "
===# $
await==% *
_unitOfWork==+ 6
.==6 7#
GrupoServicioRepository==7 N
.==N O%
GetGrupoServicioByIdAsync==O h
(==h i
idGrupoServicio==i x
)==x y
!===z |
null	==} Å
;
==Å Ç
if>> 
(>> 
validationResult>> $
.>>$ %
IsValid>>% ,
&&>>- /
existeRecurso>>0 =
)>>= >
{?? 
GrupoServicio@@ !
grupoServicio@@" /
=@@0 1
_mapper@@2 9
.@@9 :
Map@@: =
<@@= >
GrupoServicio@@> K
>@@K L
(@@L M
request@@M T
)@@T U
;@@U V
grupoServicioAA !
.AA! "
UsuarioModificacionAA" 5
=AA6 7
requestAA8 ?
.AA? @
UsuarioAA@ G
;AAG H
stringBB 
resultBB !
=BB" #
awaitBB$ )
_unitOfWorkBB* 5
.BB5 6#
GrupoServicioRepositoryBB6 M
.BBM N$
UpsertGrupoServicioAsyncBBN f
(BBf g
grupoServicioBBg t
,BBt u
idGrupoServicio	BBv Ö
)
BBÖ Ü
;
BBÜ á
returnCC 
resultCC !
.CC! "
EqualsCC" (
(CC( )
$strCC) -
)CC- .
?DD 
HttpResponseHelperDD /
.DD/ 0
ResponseDD0 8
(DD8 9
StatusCodesDD9 D
.DDD E
Status200OKDDE P
,DDP Q
newDDR U
ResponseResultDDV d
(DDd e
)DDe f
{DDg h
IsErrorDDi p
=DDq r
falseDDs x
,DDx y
Message	DDz Å
=
DDÇ É
$str
DDÑ ∫
}
DDª º
)
DDº Ω
:EE 
HttpResponseHelperEE /
.EE/ 0
ResponseEE0 8
(EE8 9
StatusCodesEE9 D
.EED E
Status409ConflictEEE V
,EEV W
newEEX [
ResponseResultEE\ j
(EEj k
)EEk l
{EEm n
IsErrorEEo v
=EEw x
falseEEy ~
,EE~ 
Message
EEÄ á
=
EEà â
$str
EEä Ω
}
EEæ ø
)
EEø ¿
;
EE¿ ¡
}FF 
elseGG 
{HH 
returnJJ 
HttpResponseHelperJJ -
.JJ- .
ResponseJJ. 6
(JJ6 7
StatusCodesJJ7 B
.JJB C
Status400BadRequestJJC V
,JJV W
newJJX [
ResponseResultJJ\ j
(JJj k
)JJk l
{KK 
IsErrorLL 
=LL  !
trueLL" &
,LL& '
MessageMM 
=MM  !
!MM" #
existeRecursoMM# 0
?MM1 2
$strMM3 j
:MMk l
validationResultMMm }
.MM} ~
Errors	MM~ Ñ
.
MMÑ Ö
First
MMÖ ä
(
MMä ã
)
MMã å
.
MMå ç
ErrorMessage
MMç ô
}NN 
)NN 
;NN 
}PP 
}QQ 
catchRR 
(RR 
	ExceptionRR 
exRR 
)RR  
{SS 
returnTT 
HttpResponseHelperTT )
.TT) *
ResponseTT* 2
(TT2 3
StatusCodesTT3 >
.TT> ?(
Status500InternalServerErrorTT? [
,TT[ \
newTT] `
ResponseResultTTa o
(TTo p
)TTp q
{TTr s
IsErrorTTt {
=TT| }
true	TT~ Ç
,
TTÇ É
Message
TTÑ ã
=
TTå ç
ex
TTé ê
.
TTê ë
Message
TTë ò
}
TTô ö
)
TTö õ
;
TTõ ú
}UU 
}VV 	
}WW 
}XX ∏F
|C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\FxCrearGrupoServicio.cs
	namespace 	
FxGrupoServicio
 
{ 
public 

class  
FxCrearGrupoServicio %
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
GrupoServicioInput  $ 6
>  6 7#
_grupoServicioValidator  8 O
;  O P
private!! 
readonly!! 
IMapper!!  
_mapper!!! (
;!!( )
public##  
FxCrearGrupoServicio## #
(### $
IUnitOfWork##$ /

unitOfWork##0 :
,##: ;

IValidator##< F
<##F G
GrupoServicioInput##G Y
>##Y Z"
grupoServicioValidator##[ q
,##q r
IMapper##s z
mapper	##{ Å
)
##Å Ç
{$$ 	
_unitOfWork%% 
=%% 

unitOfWork%% $
;%%$ %#
_grupoServicioValidator&& #
=&&$ %"
grupoServicioValidator&&& <
;&&< =
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
CrearGrupoServicio** /
)**/ 0
)**0 1
]**1 2
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
$str,,' ;
,,,; <
tags,,= A
:,,A B
new,,C F
[,,F G
],,G H
{,,I J
$str,,K a
},,b c
,,,c d
Description,,e p
=,,q r
$str	,,s é
,
,,é è
Summary
,,ê ó
=
,,ò ô
$str
,,ö µ
)
,,µ ∂
]
,,∂ ∑
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
GrupoServicioInput..N `
)..` a
,..a b
Required..c k
=..l m
true..n r
,..r s
Description..t 
=
..Ä Å
$str
..Ç ï
)
..ï ñ
]
..ñ ó
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
CrearGrupoServicio22) ;
(22; <
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
$str33F Z
)33Z [
]33[ \
HttpRequest33] h
req33i l
)33l m
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
GrupoServicioInput88 "
request88# *
=88+ ,
JsonConvert88- 8
.888 9
DeserializeObject889 J
<88J K
GrupoServicioInput88K ]
>88] ^
(88^ _
json88_ c
)88c d
;88d e
bool99 
existeRecurso99 "
=99# $
await99% *
_unitOfWork99+ 6
.996 7#
GrupoServicioRepository997 N
.99N O$
ExistsGrupoServicioAsync99O g
(99g h
request99h o
.99o p 
NombreGrupoServicio	99p É
)
99É Ñ
;
99Ñ Ö
var:: 
validationResult:: $
=::% &#
_grupoServicioValidator::' >
.::> ?
Validate::? G
(::G H
request::H O
)::O P
;::P Q
if;; 
(;; 
validationResult;; $
.;;$ %
IsValid;;% ,
&&;;- /
!;;0 1
existeRecurso;;1 >
);;> ?
{<< 
GrupoServicio== !
grupoServicio==" /
===0 1
_mapper==2 9
.==9 :
Map==: =
<=== >
GrupoServicio==> K
>==K L
(==L M
request==M T
)==T U
;==U V
string?? 
result?? !
=??" #
await??$ )
_unitOfWork??* 5
.??5 6#
GrupoServicioRepository??6 M
.??M N$
CreateGrupoServicioAsync??N f
(??f g
grupoServicio??g t
)??t u
;??u v
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
$strII2 d
:IIe f
validationResultIIg w
.IIw x
ErrorsIIx ~
.II~ 
First	II Ñ
(
IIÑ Ö
)
IIÖ Ü
.
IIÜ á
ErrorMessage
IIá ì
}JJ 
)JJ 
;JJ 
}KK 
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
returnPP 
HttpResponseHelperPP )
.PP) *
ResponsePP* 2
(PP2 3
StatusCodesPP3 >
.PP> ?(
Status500InternalServerErrorPP? [
,PP[ \
newPP] `
ResponseResultPPa o
(PPo p
)PPp q
{PPr s
IsErrorPPt {
=PP| }
true	PP~ Ç
,
PPÇ É
Message
PPÑ ã
=
PPå ç
ex
PPé ê
.
PPê ë
Message
PPë ò
}
PPô ö
)
PPö õ
;
PPõ ú
}QQ 
}RR 	
}SS 
}TT ¶'
{C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\FxGrupoServicioByID.cs
	namespace 	
FxGrupoServicio
 
{ 
public 

class 
FxGrupoServicioByID $
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
FxGrupoServicioByID "
(" #
IUnitOfWork# .

unitOfWork/ 9
)9 :
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
( !
ListarGrupoServicioID 2
)2 3
)3 4
]4 5
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
$str' >
,> ?
tags@ D
:D E
newF I
[I J
]J K
{L M
$strN h
}i j
,j k
Descriptionl w
=x y
$str	z ≠
,
≠ Æ
Summary
Ø ∂
=
∑ ∏
$str
π Ï
)
Ï Ì
]
Ì Ó
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
$str!!  1
,!!1 2
In!!3 5
=!!6 7
ParameterLocation!!8 I
.!!I J
Path!!J N
,!!N O
Required!!P X
=!!Y Z
true!![ _
,!!_ `
Type!!a e
=!!f g
typeof!!h n
(!!n o
string!!o u
)!!u v
,!!v w
Description	!!x É
=
!!Ñ Ö
$str
!!Ü ´
)
!!´ ¨
]
!!¨ ≠
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
GrupoServicioDto	""r Ç
)
""Ç É
,
""É Ñ
Description
""Ö ê
=
""ë í
$str
""ì §
)
""§ •
]
""• ¶
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
>$$' (!
ListarGrupoServicioID$$) >
($$> ?
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
$str%%E k
)%%k l
]%%l m
HttpRequest%%n y
req%%z }
,%%} ~
string	%% Ö
idGrupoServicio
%%Ü ï
)
%%ï ñ
{&& 	
try'' 
{(( 
GrupoServicioDto))  
gruposServicio))! /
=))0 1
await))2 7
_unitOfWork))8 C
.))C D#
GrupoServicioRepository))D [
.))[ \%
GetGrupoServicioByIdAsync))\ u
())u v
idGrupoServicio	))v Ö
)
))Ö Ü
;
))Ü á
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
}22 ü$
C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\FxListarGruposByTramite.cs
	namespace 	
FxGrupoServicio
 
{ 
public 

class #
FxListarGruposByTramite (
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public #
FxListarGruposByTramite &
(& '
IUnitOfWork' 2

unitOfWork3 =
)= >
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
( !
ListarGruposByTramite 2
)2 3
)3 4
]4 5
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
$str  ' >
,  > ?
tags  @ D
:  D E
new  F I
[  I J
]  J K
{  L M
$str	  N à
}
  â ä
,
  ä ã
Description
  å ó
=
  ò ô
$str
  ö œ
,
  œ –
Summary
  — ÿ
=
  Ÿ ⁄
$str
  € •
)
  • ¶
]
  ¶ ß
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
GrupoServicioDto	""x à
>
""à â
)
""â ä
,
""ä ã
Description
""å ó
=
""ò ô
$str
""ö ´
)
""´ ¨
]
""¨ ≠
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
>$$' (!
ListarGruposByTramite$$) >
($$> ?
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
$str%%E r
)%%r s
]%%s t
HttpRequest	%%u Ä
req
%%Å Ñ
,
%%Ñ Ö
string
%%Ü å
	idTramite
%%ç ñ
)
%%ñ ó
{&& 	
try'' 
{(( 
IList)) 
<)) 
GrupoServicioDto)) &
>))& '
gruposServicio))( 6
=))7 8
await))9 >
_unitOfWork))? J
.))J K#
GrupoServicioRepository))K b
.))b c0
#GetGrupoServicioByGrupoTramiteAsync	))c Ü
(
))Ü á
	idTramite
))á ê
)
))ê ë
;
))ë í
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
}22 ¢#
~C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\FxListarGruposServicio.cs
	namespace 	
FxGrupoServicio
 
{ 
public 

class "
FxListarGruposServicio '
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public "
FxListarGruposServicio %
(% &
IUnitOfWork& 1

unitOfWork2 <
)< =
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
ListarGruposServicio 1
)1 2
)2 3
]3 4
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
$str  ' =
,  = >
tags  ? C
:  C D
new  E H
[  H I
]  I J
{  K L
$str  M z
}  { |
,  | }
Description	  ~ â
=
  ä ã
$str
  å ¨
,
  ¨ ≠
Summary
  Æ µ
=
  ∂ ∑
$str
  ∏ Ô
)
  Ô 
]
   Ò
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
GrupoServicioDto	""x à
>
""à â
)
""â ä
,
""ä ã
Description
""å ó
=
""ò ô
$str
""ö ´
)
""´ ¨
]
""¨ ≠
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
ListarGruposServicio$$) =
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
$str%%E Y
)%%Y Z
]%%Z [
HttpRequest%%\ g
req%%h k
)%%k l
{&& 	
try'' 
{(( 
IList)) 
<)) 
GrupoServicioDto)) &
>))& '
gruposServicio))( 6
=))7 8
await))9 >
_unitOfWork))? J
.))J K#
GrupoServicioRepository))K b
.))b c"
GetGruposServicioAsync))c y
())y z
)))z {
;)){ |
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
}22 ˙
ùC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Interfaces\RepositoryPattern\IGrupoServicioRepository.cs
	namespace 	
FxGrupoServicio
 
. 

Interfaces $
.$ %
RepositoryPattern% 6
{ 
public		 

	interface		 $
IGrupoServicioRepository		 -
{

 
public 
Task 
< 
string 
> $
CreateGrupoServicioAsync 4
(4 5
GrupoServicio5 B
grupoServicioC P
)P Q
;Q R
public 
Task 
< 
GrupoServicioDto $
>$ %%
GetGrupoServicioByIdAsync& ?
(? @
string@ F
idGrupoServicioG V
)V W
;W X
public 
Task 
< 
List 
< 
GrupoServicioDto )
>) *
>* +"
GetGruposServicioAsync, B
(B C
)C D
;D E
public 
Task 
< 
string 
> $
UpsertGrupoServicioAsync 4
(4 5
GrupoServicio5 B
grupoServicioC P
,P Q
stringR X
idGrupoServicioY h
)h i
;i j
public 
Task 
< 
bool 
> $
ExistsGrupoServicioAsync 2
(2 3
string3 9
nombreGrupoServicio: M
)M N
;N O
public 
Task 
< 
List 
< 
GrupoServicioDto )
>) *
>* +/
#GetGrupoServicioByGrupoTramiteAsync, O
(O P
stringP V
idGrupoTramiteW e
)e f
;f g
} 
} Ü
úC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Interfaces\RepositoryPattern\IGrupoTramiteRepository.cs
	namespace 	
FxGrupoServicio
 
. 

Interfaces $
.$ %
RepositoryPattern% 6
{ 
public 

	interface #
IGrupoTramiteRepository ,
{ 
public 
Task 
< 
bool 
> #
ExistsGrupoTramiteAsync 1
(1 2
string2 8
idGrupoTramite9 G
)G H
;H I
} 
}		 Œ
êC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Interfaces\RepositoryPattern\IUnitOfWork.cs
	namespace 	
FxGrupoServicio
 
. 

Interfaces $
.$ %
RepositoryPattern% 6
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ $
IGrupoServicioRepository  #
GrupoServicioRepository! 8
{9 :
get; >
;> ?
}@ A#
IGrupoTramiteRepository "
GrupoTramiteRepository  6
{7 8
get9 <
;< =
}> ?
}		 
}

 ª
ãC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Mappers\MappingProfileGrupoServicio.cs
	namespace		 	
FxGrupoServicio		
 
.		 
Mappers		 !
{

 
public 

class '
MappingProfileGrupoServicio ,
:- .
Profile/ 6
{ 
public '
MappingProfileGrupoServicio *
(* +
)+ ,
{ 	
	CreateMap 
< 
GrupoServicioInput (
,( )
GrupoServicio* 7
>7 8
(8 9
)9 :
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
NombreGrupoServicioQ d
.d e
Trime i
(i j
)j k
)k l
)l m
)m n
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
PkGrupoTramite' 5
,5 6
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
IdGrupoTramite4 B
)B C
)C D
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
NombreGrupoServicio$ 7
,7 8
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
NombreGrupoServicio4 G
.G H
TrimH L
(L M
)M N
)N O
)O P
. 
	ForMember 
( 
dest 
=> 
dest #
.# $$
DescripcionGrupoServicio$ <
,< =
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4$
DescripcionGrupoServicio4 L
)L M
)M N
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
FechaCrecion$ 0
,0 1
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
DateTimeOffset0 >
.> ?
UtcNow? E
)E F
)F G
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
UsuarioCreacion$ 3
,3 4
opt   
=>   
opt    
.    !
MapFrom  ! (
(  ( )
src  ) ,
=>  - /
src  0 3
.  3 4
Usuario  4 ;
)  ; <
)  < =
;  = >
}"" 	
}## 
}$$ ∞
ìC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Models\DataTransferObjects\GrupoServicioDto.cs
	namespace 	
FxGrupoServicio
 
. 
Models  
.  !
DataTransferObjects! 4
{ 
public 

class 
GrupoServicioDto !
{ 
public 
string 
idGrupoTramite $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
idGrupoServicio %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public		 
string		 
nombreGrupoServicio		 )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
public

 
string

 $
descripcionGrupoServicio

 .
{

/ 0
get

1 4
;

4 5
set

6 9
;

9 :
}

; <
} 
} æ
ÖC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Models\Entities\GrupoServicio.cs
	namespace 	
FxGrupoServicio
 
. 
Models  
.  !
Entities! )
{ 
public 

class 
GrupoServicio 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
PkGrupoTramite $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
string		 
NombreGrupoServicio		 )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
public

 
string

 $
DescripcionGrupoServicio

 .
{

/ 0
get

1 4
;

4 5
set

6 9
;

9 :
}

; <
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTimeOffset 
FechaCrecion *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
UsuarioModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DateTimeOffset 
FechaModificacion /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} í
áC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Models\Input\GrupoServicioInput.cs
	namespace 	
FxGrupoServicio
 
. 
Models  
.  !
Input! &
{ 
public 

class 
GrupoServicioInput #
{ 
[ 	
JsonProperty	 
( 
$str &
,& '
Required( 0
=1 2
Required3 ;
.; <
Always< B
)B C
]C D
public		 
string		 
IdGrupoTramite		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
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
NombreGrupoServicio )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
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
string $
DescripcionGrupoServicio .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
[ 	
JsonProperty	 
( 
$str 
, 
Required  (
=) *
Required+ 3
.3 4
Default4 ;
); <
]< =
public 
bool 
? 
Activo 
{ 
get !
;! "
set# &
;& '
}( )
=* +
true, 0
;0 1
[ 	
JsonProperty	 
( 
$str 
,  
Required! )
=* +
Required, 4
.4 5
Always5 ;
); <
]< =
public 
string 
Usuario 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} π
}C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Models\ResponseResult.cs
	namespace		 	
FxGrupoServicio		
 
.		 
Models		  
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
} ˆ

ÑC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\OpenApi\GrupoServicioExample.cs
	namespace 	
FxGrupoServicio
 
. 
OpenApi !
{		 
public

 

class

  
GrupoServicioExample

 %
:

& '
OpenApiExample

( 6
<

6 7
GrupoServicioInput

7 I
>

I J
{ 
public 
override 
IOpenApiExample '
<' (
GrupoServicioInput( :
>: ;
Build< A
(A B
NamingStrategyB P
namingStrategyQ _
=` a
nullb f
)f g
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
GrupoServicioInput *
(* +
)+ ,
{ 
NombreGrupoServicio +
=, -
$str. C
,C D
Activo 
=  
true! %
,% &
Usuario 
=  !
$str" 0
} 
, 
namingStrategy "
) 
) 
; 
return 
this 
; 
} 	
} 
} á
ÖC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\OpenApi\ResponseResultExample.cs
	namespace

 	
FxGrupoServicio


 
.

 
OpenApi

 !
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
} ®n
åC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Repositories\GrupoServicioRepository.cs
	namespace 	
FxGrupoServicio
 
. 
Repositories &
{ 
public 

class #
GrupoServicioRepository (
:) *
RepositoryBase+ 9
,9 :$
IGrupoServicioRepository; S
{ 
private 
readonly 
	Container "
	container# ,
;, -
public #
GrupoServicioRepository &
(& '
CosmosClient' 3
client4 :
,: ;
IConfiguration< J
configurationK X
)X Y
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
$str/ G
]G H
;H I
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
>  !$
CreateGrupoServicioAsync" :
(: ;
GrupoServicio; H
grupoServicioI V
)V W
{ 	
try   
{!! 
ItemResponse"" 
<"" 
GrupoServicio"" *
>""* +
itemResponse"", 8
=""9 :
await""; @
	container""A J
.""J K
ReadItemAsync""K X
<""X Y
GrupoServicio""Y f
>""f g
(""g h
grupoServicio""h u
.""u v
Id""v x
,""x y
new""z }
PartitionKey	""~ ä
(
""ä ã
grupoServicio
""ã ò
.
""ò ô
PkGrupoTramite
""ô ß
)
""ß ®
)
""® ©
;
""© ™
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
(''< =
grupoServicio''= J
,''J K
new''L O
PartitionKey''P \
(''\ ]
grupoServicio''] j
.''j k
PkGrupoTramite''k y
)''y z
)''z {
;''{ |
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
>.. $
ExistsGrupoServicioAsync..  8
(..8 9
string..9 ?
nombreGrupoServicio..@ S
)..S T
{// 	
GrupoServicioDto00 
data00 !
=00" #
null00$ (
;00( )
try11 
{22 
var44 
queryString44 
=44  !
$str48" H
;88H I
var:: 
queryDef:: 
=:: 
new:: "
QueryDefinition::# 2
(::2 3
queryString::3 >
)::> ?
;::? @
queryDef;; 
.;; 
WithParameter;; &
(;;& '
$str;;' 0
,;;0 1
nombreGrupoServicio;;2 E
);;E F
;;;F G
var<< 
query<< 
=<< 
	container<< %
.<<% & 
GetItemQueryIterator<<& :
<<<: ;
GrupoServicioDto<<; K
><<K L
(<<L M
queryDef<<M U
)<<U V
;<<V W
while>> 
(>> 
query>> 
.>> 
HasMoreResults>> +
)>>+ ,
{?? 
var@@ 
response@@  
=@@! "
await@@# (
query@@) .
.@@. /
ReadNextAsync@@/ <
(@@< =
)@@= >
;@@> ?
dataAA 
=AA 
responseAA #
.AA# $
SingleOrDefaultAA$ 3
(AA3 4
)AA4 5
;AA5 6
}BB 
returnDD 
dataDD 
!=DD 
nullDD #
;DD# $
}EE 
catchFF 
(FF 
CosmosExceptionFF "
exFF# %
)FF% &
whenFF' +
(FF, -
exFF- /
.FF/ 0

StatusCodeFF0 :
==FF; =
HttpStatusCodeFF> L
.FFL M
NotFoundFFM U
)FFU V
{GG 
returnHH 
falseHH 
;HH 
}II 
}JJ 	
publicLL 
asyncLL 
TaskLL 
<LL 
GrupoServicioDtoLL *
>LL* +%
GetGrupoServicioByIdAsyncLL, E
(LLE F
stringLLF L
idGrupoServicioLLM \
)LL\ ]
{MM 	
GrupoServicioDtoNN 
grupoServicioDtoNN -
=NN. /
nullNN0 4
;NN4 5
tryOO 
{PP 
varQQ 
queryStringQQ 
=QQ  !
$strQW" V
;WWV W
varYY 
queryDefYY 
=YY 
newYY "
QueryDefinitionYY# 2
(YY2 3
queryStringYY3 >
)YY> ?
;YY? @
queryDefZZ 
.ZZ 
WithParameterZZ &
(ZZ& '
$strZZ' 0
,ZZ0 1
trueZZ2 6
)ZZ6 7
;ZZ7 8
queryDef[[ 
.[[ 
WithParameter[[ &
([[& '
$str[[' 9
,[[9 :
idGrupoServicio[[; J
)[[J K
;[[K L
var]] 
query]] 
=]] 
	container]] %
.]]% & 
GetItemQueryIterator]]& :
<]]: ;
GrupoServicioDto]]; K
>]]K L
(]]L M
queryDef]]M U
)]]U V
;]]V W
while^^ 
(^^ 
query^^ 
.^^ 
HasMoreResults^^ +
)^^+ ,
{__ 
var`` 
response``  
=``! "
await``# (
query``) .
.``. /
ReadNextAsync``/ <
(``< =
)``= >
;``> ?
grupoServicioDtoaa $
=aa% &
responseaa' /
.aa/ 0
SingleOrDefaultaa0 ?
(aa? @
)aa@ A
;aaA B
}bb 
returndd 
grupoServicioDtodd '
;dd' (
}ee 
catchff 
(ff 
CosmosExceptionff "
exff# %
)ff% &
whenff' +
(ff, -
exff- /
.ff/ 0

StatusCodeff0 :
==ff; =
HttpStatusCodeff> L
.ffL M
NotFoundffM U
)ffU V
{gg 
returnhh 
grupoServicioDtohh '
;hh' (
}ii 
}jj 	
publicmm 
asyncmm 
Taskmm 
<mm 
Listmm 
<mm 
GrupoServicioDtomm /
>mm/ 0
>mm0 1/
#GetGrupoServicioByGrupoTramiteAsyncmm2 U
(mmU V
stringmmV \
idGrupoTramitemm] k
)mmk l
{nn 	
varoo 
queryStringoo 
=oo 
$strou ^
;uu^ _
varww 
queryDefww 
=ww 
newww 
QueryDefinitionww .
(ww. /
queryStringww/ :
)ww: ;
;ww; <
queryDefxx 
.xx 
WithParameterxx "
(xx" #
$strxx# 4
,xx4 5
idGrupoTramitexx6 D
)xxD E
;xxE F
queryDefyy 
.yy 
WithParameteryy "
(yy" #
$stryy# ,
,yy, -
trueyy. 2
)yy2 3
;yy3 4
var{{ 
query{{ 
={{ 
	container{{ !
.{{! " 
GetItemQueryIterator{{" 6
<{{6 7
GrupoServicioDto{{7 G
>{{G H
({{H I
queryDef{{I Q
){{Q R
;{{R S
var}} 
gruposServicio}} 
=}}  
new}}! $
List}}% )
<}}) *
GrupoServicioDto}}* :
>}}: ;
(}}; <
)}}< =
;}}= >
while 
( 
query 
. 
HasMoreResults '
)' (
{
ÄÄ 
var
ÅÅ 
response
ÅÅ 
=
ÅÅ 
await
ÅÅ $
query
ÅÅ% *
.
ÅÅ* +
ReadNextAsync
ÅÅ+ 8
(
ÅÅ8 9
)
ÅÅ9 :
;
ÅÅ: ;
gruposServicio
ÇÇ 
.
ÇÇ 
AddRange
ÇÇ '
(
ÇÇ' (
response
ÇÇ( 0
.
ÇÇ0 1
ToList
ÇÇ1 7
(
ÇÇ7 8
)
ÇÇ8 9
)
ÇÇ9 :
;
ÇÇ: ;
}
ÉÉ 
return
ÖÖ 
gruposServicio
ÖÖ !
;
ÖÖ! "
}
ÜÜ 	
public
ââ 
async
ââ 
Task
ââ 
<
ââ 
List
ââ 
<
ââ 
GrupoServicioDto
ââ /
>
ââ/ 0
>
ââ0 1$
GetGruposServicioAsync
ââ2 H
(
ââH I
)
ââI J
{
ää 	
var
ãã 
queryString
ãã 
=
ãã 
$str
ãë 8
;
ëë8 9
var
ìì 
queryDef
ìì 
=
ìì 
new
ìì 
QueryDefinition
ìì .
(
ìì. /
queryString
ìì/ :
)
ìì: ;
;
ìì; <
queryDef
îî 
.
îî 
WithParameter
îî "
(
îî" #
$str
îî# ,
,
îî, -
true
îî. 2
)
îî2 3
;
îî3 4
var
ññ 
query
ññ 
=
ññ 
	container
ññ !
.
ññ! ""
GetItemQueryIterator
ññ" 6
<
ññ6 7
GrupoServicioDto
ññ7 G
>
ññG H
(
ññH I
queryDef
ññI Q
)
ññQ R
;
ññR S
var
òò 
gruposServicio
òò 
=
òò  
new
òò! $
List
òò% )
<
òò) *
GrupoServicioDto
òò* :
>
òò: ;
(
òò; <
)
òò< =
;
òò= >
while
öö 
(
öö 
query
öö 
.
öö 
HasMoreResults
öö '
)
öö' (
{
õõ 
var
úú 
response
úú 
=
úú 
await
úú $
query
úú% *
.
úú* +
ReadNextAsync
úú+ 8
(
úú8 9
)
úú9 :
;
úú: ;
gruposServicio
ùù 
.
ùù 
AddRange
ùù '
(
ùù' (
response
ùù( 0
.
ùù0 1
ToList
ùù1 7
(
ùù7 8
)
ùù8 9
)
ùù9 :
;
ùù: ;
}
ûû 
return
†† 
gruposServicio
†† !
;
††! "
}
°° 	
public
££ 
async
££ 
Task
££ 
<
££ 
string
££  
>
££  !&
UpsertGrupoServicioAsync
££" :
(
££: ;
GrupoServicio
££; H
grupoServicio
££I V
,
££V W
string
££X ^
idGrupoServicio
££_ n
)
££n o
{
§§ 	
try
•• 
{
¶¶ 
grupoServicio
ßß 
.
ßß 
Id
ßß 
=
ßß  !
idGrupoServicio
ßß" 1
;
ßß1 2
var
®® 
result
®® 
=
®® 
await
®®  
	container
®®! *
.
®®* +
PatchItemAsync
®®+ 9
<
®®9 :
GrupoServicio
®®: G
>
®®G H
(
®®H I
idGrupoServicio
®®I X
,
®®X Y
new
®®Z ]
PartitionKey
®®^ j
(
®®j k
grupoServicio
®®k x
.
®®x y
PkGrupoTramite®®y á
)®®á à
,®®à â
new
©© 
[
©© 
]
©© 
{
©© 
PatchOperation
©© ,
.
©©, -
Set
©©- 0
(
©©0 1
$str
©©1 G
,
©©G H
grupoServicio
©©I V
.
©©V W!
NombreGrupoServicio
©©W j
)
©©j k
,
©©k l
PatchOperation
™™ (
.
™™( )
Set
™™) ,
(
™™, -
$str
™™- H
,
™™H I
grupoServicio
™™J W
.
™™W X&
DescripcionGrupoServicio
™™X p
)
™™p q
,
™™q r
PatchOperation
´´ (
.
´´( )
Set
´´) ,
(
´´, -
$str
´´- 6
,
´´6 7
grupoServicio
´´8 E
.
´´E F
Activo
´´F L
)
´´L M
,
´´M N
PatchOperation
¨¨ (
.
¨¨( )
Set
¨¨) ,
(
¨¨, -
$str
¨¨- C
,
¨¨C D
grupoServicio
¨¨E R
.
¨¨R S!
UsuarioModificacion
¨¨S f
)
¨¨f g
,
¨¨g h
PatchOperation
≠≠ (
.
≠≠( )
Set
≠≠) ,
(
≠≠, -
$str
≠≠- A
,
≠≠A B
DateTimeOffset
≠≠C Q
.
≠≠Q R
UtcNow
≠≠R X
)
≠≠X Y
}
≠≠Z [
)
≠≠[ \
;
≠≠\ ]
return
ÆÆ 
result
ÆÆ 
.
ÆÆ 

StatusCode
ÆÆ (
.
ÆÆ( )
ToString
ÆÆ) 1
(
ÆÆ1 2
)
ÆÆ2 3
;
ÆÆ3 4
}
ØØ 
catch
∞∞ 
(
∞∞ 
	Exception
∞∞ 
ex
∞∞ 
)
∞∞  
{
±± 
return
≥≥ 
ex
≥≥ 
.
≥≥ 
Message
≥≥ !
;
≥≥! "
}
¥¥ 
}
∂∂ 	
}
∑∑ 
}∏∏ õ
ãC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Repositories\GrupoTramiteRepository.cs
	namespace

 	
FxGrupoServicio


 
.

 
Repositories

 &
{ 
public 

class "
GrupoTramiteRepository '
:' (
RepositoryBase) 7
,7 8#
IGrupoTramiteRepository9 P
{ 
private 
readonly 
	Container "
	container# ,
;, -
public "
GrupoTramiteRepository %
(% &
CosmosClient& 2
client3 9
,9 :
IConfiguration; I
configurationJ W
)W X
: 
base 
( 
client 
) 
{ 	
string 
containerId 
=  
configuration! .
[. /
$str/ F
]F G
;G H
string 
databaseName 
=  !
configuration" /
[/ 0
$str0 C
]C D
;D E
	container 
= 
client 
. 
GetContainer +
(+ ,
databaseName, 8
,8 9
containerId: E
)E F
;F G
} 	
public 
async 
Task 
< 
bool 
> #
ExistsGrupoTramiteAsync  7
(7 8
string8 >
idGrupoTramite? M
)M N
{ 	
object 
data 
= 
null 
; 
try 
{ 
var 
queryString 
=  !
$str#" ?
;##? @
var%% 
queryDef%% 
=%% 
new%% "
QueryDefinition%%# 2
(%%2 3
queryString%%3 >
)%%> ?
;%%? @
queryDef&& 
.&& 
WithParameter&& &
(&&& '
$str&&' 8
,&&8 9
idGrupoTramite&&: H
)&&H I
;&&I J
var'' 
query'' 
='' 
	container'' %
.''% & 
GetItemQueryIterator''& :
<'': ;
object''; A
>''A B
(''B C
queryDef''C K
)''K L
;''L M
while)) 
()) 
query)) 
.)) 
HasMoreResults)) +
)))+ ,
{** 
var++ 
response++  
=++! "
await++# (
query++) .
.++. /
ReadNextAsync++/ <
(++< =
)++= >
;++> ?
data,, 
=,, 
response,, #
.,,# $
SingleOrDefault,,$ 3
(,,3 4
),,4 5
;,,5 6
}-- 
return// 
data// 
!=// 
null// #
;//# $
}00 
catch11 
(11 
CosmosException11 "
ex11# %
)11% &
when11' +
(11, -
ex11- /
.11/ 0

StatusCode110 :
==11; =
HttpStatusCode11> L
.11L M
NotFound11M U
)11U V
{22 
return33 
false33 
;33 
}44 
}55 	
}66 
}77 ç
ÉC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Repositories\RepositoryBase.cs
	namespace 	
FxGrupoServicio
 
. 
Repositories &
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
} ¡5
oC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Startup.cs
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
	namespace 	
FxGrupoServicio
 
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
.JJT U
IncludeJJU \
;JJ\ ]
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
<QQ& '$
IGrupoServicioRepositoryQQ' ?
,QQ? @#
GrupoServicioRepositoryQQA X
>QQX Y
(QQY Z
)QQZ [
;QQ[ \
builderRR 
.RR 
ServicesRR 
.RR 
	AddScopedRR &
<RR& '#
IGrupoTramiteRepositoryRR' >
,RR> ?"
GrupoTramiteRepositoryRR@ V
>RRV W
(RRW X
)RRX Y
;RRY Z
builderVV 
.VV 
ServicesVV 
.VV 
	AddScopedVV &
<VV& '

IValidatorVV' 1
<VV1 2
GrupoServicioInputVV2 D
>VVD E
,VVE F"
GrupoServicioValidatorVVG ]
>VV] ^
(VV^ _
)VV_ `
;VV` a
builderWW 
.WW 
ServicesWW 
.WW 
AddSingletonWW )
<WW) *
IConfigurationWW* 8
>WW8 9
(WW9 :
configurationWW: G
)WWG H
;WWH I
}XX 	
}YY 
}ZZ ”
ÄC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Utils\HttpResponseHelper.cs
	namespace 	
FxGrupoServicio
 
. 
Utils 
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
} ˜
|C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Utils\SecurityHelper.cs
	namespace 	
FxGrupoServicio
 
. 
Utils 
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
} ≥
àC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxGrupoServicio\FxGrupoServicio\Validator\GrupoServicioValidator.cs
	namespace 	
FxGrupoServicio
 
. 
	Validator #
{		 
public

 

class

 "
GrupoServicioValidator

 '
:

( )
AbstractValidator

* ;
<

; <
GrupoServicioInput

< N
>

N O
{ 
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public "
GrupoServicioValidator %
(% &
IUnitOfWork& 1

unitOfWork2 <
)< =
{ 	
_unitOfWork 
= 

unitOfWork #
;# $
RuleFor 
( 
property 
=> 
property  (
.( )
IdGrupoTramite) 7
)7 8
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage #
(# $
$str$ O
)O P
. 
Must 
( 
( 
property 
, 
IdGrupoTramite ,
), -
=>. 0
ValidarGrupoTramite1 D
(D E
IdGrupoTramiteE S
)S T
)T U
.U V
WithMessageV a
(a b
$str	b ¶
)
¶ ß
;
ß ®
RuleFor 
( 
property 
=> 
property  (
.( )
NombreGrupoServicio) <
)< =
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' R
)R S
;S T
RuleFor 
( 
property 
=> 
property  (
.( )
Usuario) 0
)0 1
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' R
)R S
;S T
} 	
private!! 
bool!! 
ValidarGrupoTramite!! (
(!!( )
string!!) /
idGrupoTramite!!0 >
)!!> ?
{"" 	
return## 
_unitOfWork## 
.## "
GrupoTramiteRepository## 5
.##5 6#
ExistsGrupoTramiteAsync##6 M
(##M N
idGrupoTramite##N \
)##\ ]
.##] ^

GetAwaiter##^ h
(##h i
)##i j
.##j k
	GetResult##k t
(##t u
)##u v
;##v w
}$$ 	
}%% 
}&& 