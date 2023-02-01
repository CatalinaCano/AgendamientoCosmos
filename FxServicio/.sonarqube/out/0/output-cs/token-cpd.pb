÷
tC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\DataContext\UnitOfWork.cs
	namespace		 	

FxServicio		
 
.		 
DataContext		  
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
IServicioRepository #
_servicioRepository$ 7
;7 8
private $
IGrupoServicioRepository ($
_grupoServicioRepository) A
;A B
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
public 
IServicioRepository "
ServicioRepository# 5
{ 	
get 
{ 
return 
_servicioRepository ,
??- /
(0 1
_servicioRepository1 D
=E F
newG J
ServicioRepositoryK ]
(] ^
_client^ e
,e f
_configurationg u
)u v
)v w
;w x
}y z
} 	
public $
IGrupoServicioRepository '#
GrupoServicioRepository( ?
{   	
get!! 
{!! 
return!! $
_grupoServicioRepository!! 1
??!!2 4
(!!5 6$
_grupoServicioRepository!!6 N
=!!O P
new!!Q T#
GrupoServicioRepository!!U l
(!!l m
_client!!m t
,!!t u
_configuration	!!v Ñ
)
!!Ñ Ö
)
!!Ö Ü
;
!!Ü á
}
!!à â
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
}88 ∏F
rC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\FxActualizarServicio.cs
	namespace 	

FxServicio
 
{ 
public 

class  
FxActualizarServicio %
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private   
readonly   

IValidator   #
<  # $
ServicioInput  $ 1
>  1 2
_servicioValidator  3 E
;  E F
private!! 
readonly!! 
IMapper!!  
_mapper!!! (
;!!( )
public##  
FxActualizarServicio## #
(### $
IUnitOfWork##$ /

unitOfWork##0 :
,##: ;

IValidator##< F
<##F G
ServicioInput##G T
>##T U
servicioValidator##V g
,##g h
IMapper##i p
mapper##q w
)##w x
{$$ 	
_unitOfWork%% 
=%% 

unitOfWork%% $
;%%$ %
_servicioValidator&& 
=&&  
servicioValidator&&! 2
;&&2 3
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
ActualizarServicio** /
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
$str,,K `
},,a b
,,,b c
Description,,d o
=,,p q
$str	,,r â
,
,,â ä
Summary
,,ã í
=
,,ì î
$str
,,ï ¨
)
,,¨ ≠
]
,,≠ Æ
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
$str..  ,
,.., -
In... 0
=..1 2
ParameterLocation..3 D
...D E
Path..E I
,..I J
Required..K S
=..T U
true..V Z
,..Z [
Type..\ `
=..a b
typeof..c i
(..i j
string..j p
)..p q
,..q r
Description..s ~
=	.. Ä
$str
..Å ù
)
..ù û
]
..û ü
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
(//M N
ServicioInput//N [
)//[ \
,//\ ]
Required//^ f
=//g h
true//i m
,//m n
Description//o z
=//{ |
$str	//} á
)
//á à
]
//à â
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
>33' (
ActualizarServicio33) ;
(33; <
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
$str44E a
)44a b
]44b c
HttpRequest44d o
req44p s
,44s t
string44u {

idServicio	44| Ü
)
44Ü á
{55 	
try66 
{77 
var88 
json88 
=88 
await88 $
req88% (
.88( )
ReadAsStringAsync88) :
(88: ;
)88; <
;88< =
ServicioInput99 !
request99" )
=99* +
JsonConvert99, 7
.997 8
DeserializeObject998 I
<99I J
ServicioInput99J W
>99W X
(99X Y
json99Y ]
)99] ^
;99^ _
bool;; 
ExisteServicio;; '
=;;( )
await;;* /
_unitOfWork;;0 ;
.;;; <
ServicioRepository;;< N
.;;N O 
GetServicioByIdAsync;;O c
(;;c d

idServicio;;d n
);;n o
!=;;o q
null;;q u
;;;u v
var>> 
validationResult>> (
=>>) *
_servicioValidator>>+ =
.>>= >
Validate>>> F
(>>F G
request>>G N
)>>N O
;>>O P
if?? 
(?? 
validationResult?? (
.??( )
IsValid??) 0
&&??0 2
ExisteServicio??3 A
)??A B
{@@ 
ServicioAA  
servicioAA! )
=AA* +
_mapperAA, 3
.AA3 4
MapAA4 7
<AA7 8
ServicioAA8 @
>AA@ A
(AAA B
requestAAB I
)AAI J
;AAJ K
servicioBB  
.BB  !
UsuarioModificacionBB! 4
=BB5 6
requestBB7 >
.BB> ?
UsuarioBB? F
;BBF G
awaitCC 
_unitOfWorkCC )
.CC) *
ServicioRepositoryCC* <
.CC< =
UpsertServicioAsyncCC= P
(CCP Q
servicioCCQ Y
,CCY Z

idServicioCC[ e
)CCe f
;CCf g
returnDD 
HttpResponseHelperDD 1
.DD1 2
ResponseDD2 :
(DD: ;
StatusCodesDD; F
.DDF G
Status200OKDDG R
,DDR S
newDDT W
ResponseResultDDX f
(DDf g
)DDg h
{DDi j
IsErrorDDk r
=DDs t
falseDDu z
,DDz {
Message	DD| É
=
DDÑ Ö
$str
DDÜ ¥
}
DDµ ∂
)
DD∂ ∑
;
DD∑ ∏
}EE 
elseFF 
{GG 
returnHH 
HttpResponseHelperHH 1
.HH1 2
ResponseHH2 :
(HH: ;
StatusCodesHH; F
.HHF G
Status400BadRequestHHG Z
,HHZ [
newHH\ _
ResponseResultHH` n
(HHn o
)HHo p
{II 
IsErrorJJ #
=JJ$ %
trueJJ& *
,JJ* +
MessageKK #
=KK$ %
!KK& '
ExisteServicioKK' 5
?KK5 6
$strKK6 e
:KKe f
validationResultKKf v
.KKv w
ErrorsKKw }
.KK} ~
First	KK~ É
(
KKÉ Ñ
)
KKÑ Ö
.
KKÖ Ü
ErrorMessage
KKÜ í
}LL 
)LL 
;LL 
}MM 
}PP 
catchQQ 
(QQ 
	ExceptionQQ 
exQQ 
)QQ  
{RR 
returnSS 
HttpResponseHelperSS )
.SS) *
ResponseSS* 2
(SS2 3
StatusCodesSS3 >
.SS> ?(
Status500InternalServerErrorSS? [
,SS[ \
newSS] `
ResponseResultSSa o
(SSo p
)SSp q
{SSr s
IsErrorSSt {
=SS| }
true	SS~ Ç
,
SSÇ É
Message
SSÑ ã
=
SSå ç
ex
SSé ê
.
SSê ë
Message
SSë ò
}
SSô ö
)
SSö õ
;
SSõ ú
}TT 
}UU 	
}VV 
}WW ±F
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\FxCrearServicio.cs
	namespace 	

FxServicio
 
{ 
public 

class 
FxCrearServicio  
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private   
readonly   

IValidator   #
<  # $
ServicioInput  $ 1
>  1 2
_servicioValidator  3 E
;  E F
private!! 
readonly!! 
IMapper!!  
_mapper!!! (
;!!( )
public## 
FxCrearServicio## 
(## 
IUnitOfWork## *

unitOfWork##+ 5
,##5 6

IValidator##7 A
<##A B
ServicioInput##B O
>##O P
servicioValidator##Q b
,##b c
IMapper##d k
mapper##l r
)##r s
{$$ 	
_unitOfWork%% 
=%% 

unitOfWork%% $
;%%$ %
_servicioValidator&& 
=&&  
servicioValidator&&! 2
;&&2 3
_mapper'' 
='' 
mapper'' 
;'' 
}(( 	
[** 	
FunctionName**	 
(** 
nameof** 
(** 
CrearServicio** *
)*** +
)**+ ,
]**, -
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
$str,,' 6
,,,6 7
tags,,8 <
:,,< =
new,,> A
[,,A B
],,B C
{,,D E
$str,,F V
},,W X
,,,X Y
Description,,Z e
=,,f g
$str,,h z
,,,z {
Summary	,,| É
=
,,Ñ Ö
$str
,,Ü ò
)
,,ò ô
]
,,ô ö
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
(..M N
ServicioInput..N [
)..[ \
,..\ ]
Required..^ f
=..g h
true..i m
,..m n
Description..o z
=..{ |
$str	..} á
)
..á à
]
..à â
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
>22' (
CrearServicio22) 6
(226 7
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
$str33F U
)33U V
]33V W
HttpRequest33X c
req33d g
)33g h
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
;778 9
ServicioInput88 
request88 %
=88& '
JsonConvert88( 3
.883 4
DeserializeObject884 E
<88E F
ServicioInput88F S
>88S T
(88T U
json88U Y
)88Y Z
;88Z [
bool99 
existeRecurso99 "
=99# $
await99% *
_unitOfWork99+ 6
.996 7
ServicioRepository997 I
.99I J
ExistsServicioAsync99J ]
(99] ^
request99^ e
.99e f
NombreServicio99f t
)99t u
;99u v
var:: 
validationResult:: $
=::% &
_servicioValidator::' 9
.::9 :
Validate::: B
(::B C
request::C J
)::J K
;::K L
if;; 
(;; 
validationResult;; $
.;;$ %
IsValid;;% ,
&&;;- /
!;;0 1
existeRecurso;;1 >
);;> ?
{<< 
Servicio== 
servicio== %
===& '
_mapper==( /
.==/ 0
Map==0 3
<==3 4
Servicio==4 <
>==< =
(=== >
request==> E
)==E F
;==F G
servicio>> 
.>> 
UsuarioCreacion>> ,
=>>- .
request>>/ 6
.>>6 7
Usuario>>7 >
;>>> ?
string?? 
result?? !
=??" #
await??$ )
_unitOfWork??* 5
.??5 6
ServicioRepository??6 H
.??H I
CreateServicioAsync??I \
(??\ ]
servicio??] e
)??e f
;??f g
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
:BB1 2
HttpResponseHelperBB3 E
.BBE F
ResponseBBF N
(BBN O
StatusCodesBBO Z
.BBZ [
Status201CreatedBB[ k
,BBk l
newBBm p
ResponseResultBBq 
(	BB Ä
)
BBÄ Å
{
BBÇ É
IsError
BBÑ ã
=
BBå ç
false
BBé ì
,
BBì î
Message
BBï ú
=
BBù û
result
BBü •
}
BB¶ ß
)
BBß ®
;
BB® ©
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
$strII2 [
:II\ ]
validationResultII^ n
.IIn o
ErrorsIIo u
.IIu v
FirstIIv {
(II{ |
)II| }
.II} ~
ErrorMessage	II~ ä
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
}TT ï.
uC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\FxListarServicioByGrupo.cs
	namespace 	

FxServicio
 
{ 
public 

class #
FxListarServicioByGrupo (
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public #
FxListarServicioByGrupo &
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
( 
ListarServicioGrupo 0
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
$str  L t
}  u v
,  v w
Description	  x É
=
  Ñ Ö
$str
  Ü ∆
,
  ∆ «
Summary
  » œ
=
  – —
$str
  “ í
)
  í ì
]
  ì î
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
["" 	
OpenApiParameter""	 
("" 
name"" 
:"" 
$str""  1
,""1 2
In""3 5
=""6 7
ParameterLocation""8 I
.""I J
Path""J N
,""N O
Required""P X
=""Y Z
true""[ _
,""_ `
Type""a e
=""f g
typeof""h n
(""n o
string""o u
)""u v
,""v w
Description	""x É
=
""Ñ Ö
$str
""Ü ´
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
.##; <
OK##< >
,##> ?
contentType##@ K
:##K L
$str##M X
,##X Y
bodyType##Z b
:##b c
typeof##d j
(##j k
IList##k p
<##p q
ServicioDto##q |
>##| }
)##} ~
,##~ 
Description
##Ä ã
=
##å ç
$str
##é ü
)
##ü †
]
##† °
[$$ 	#
OpenApiResponseWithBody$$	  
($$  !

statusCode$$! +
:$$+ ,
HttpStatusCode$$- ;
.$$; <
InternalServerError$$< O
,$$O P
contentType$$Q \
:$$\ ]
$str$$^ p
,$$p q
bodyType$$r z
:$$z {
typeof	$$| Ç
(
$$Ç É
ResponseResult
$$É ë
)
$$ë í
,
$$í ì
Description
$$î ü
=
$$† °
$str
$$¢ ∏
)
$$∏ π
]
$$π ∫
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
ListarServicioGrupo%%) <
(%%< =
[&& 
HttpTrigger&& 
(&& 
AuthorizationLevel&& +
.&&+ ,
Function&&, 4
,&&4 5
$str&&6 ;
,&&; <
Route&&= B
=&&C D
$str&&E t
)&&t u
]&&u v
HttpRequest	&&w Ç
req
&&É Ü
,
&&Ü á
string
&&à é
idGrupoServicio
&&è û
)
&&û ü
{'' 	
try(( 
{)) 
bool** 
validar** 
=** 
await** $
_unitOfWork**% 0
.**0 1#
GrupoServicioRepository**1 H
.**H I
ExistsGrupoServicio**I \
(**\ ]
idGrupoServicio**] l
)**l m
;**m n
if,, 
(,, 
validar,, 
),, 
{-- 
IList.. 
<.. 
ServicioDto.. %
>..% &
	servicios..' 0
=..1 2
await..3 8
_unitOfWork..9 D
...D E
ServicioRepository..E W
...W X-
!GetServicioByIdGrupoServicioAsync..X y
(..y z
idGrupoServicio	..z â
)
..â ä
;
..ä ã
return// 
HttpResponseHelper// -
.//- ."
SuccessfulObjectResult//. D
(//D E
	servicios//E N
)//N O
;//O P
}00 
else11 
{22 
return33 
HttpResponseHelper33 -
.33- ."
BadRequestObjectResult33. D
(33D E
new33E H
ResponseResult33I W
(33W X
)33X Y
{33Z [
IsError33\ c
=33d e
true33f j
,33j k
Message33l s
=33t u
$str	33v √
}
33ƒ ≈
)
33≈ ∆
;
33∆ «
}55 
}66 
catch77 
(77 
	Exception77 
ex77 
)77  
{88 
return99 
HttpResponseHelper99 )
.99) *
Response99* 2
(992 3
StatusCodes993 >
.99> ?(
Status500InternalServerError99? [
,99[ \
new99] `
ResponseResult99a o
(99o p
)99p q
{99r s
IsError99t {
=99| }
true	99~ Ç
,
99Ç É
Message
99Ñ ã
=
99å ç
ex
99é ê
.
99ê ë
Message
99ë ò
}
99ô ö
)
99ö õ
;
99õ ú
}:: 
};; 	
}<< 
}== ≈*
rC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\FxListarServicioByID.cs
	namespace 	

FxServicio
 
{ 
public 

class  
FxListarServicioByID %
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public  
FxListarServicioByID #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
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
ListarServicioID -
)- .
). /
]/ 0
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
$str  ' 9
,  9 :
tags  ; ?
:  ? @
new  A D
[  D E
]  E F
{  G H
$str  I a
}  b c
,  c d
Description  e p
=  q r
$str	  s ù
,
  ù û
Summary
  ü ¶
=
  ß ®
$str
  © ”
)
  ” ‘
]
  ‘ ’
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
["" 	
OpenApiParameter""	 
("" 
name"" 
:"" 
$str""  ,
,"", -
In"". 0
=""1 2
ParameterLocation""3 D
.""D E
Path""E I
,""I J
Required""K S
=""T U
true""V Z
,""Z [
Type""\ `
=""a b
typeof""c i
(""i j
string""j p
)""p q
,""q r
Description""s ~
=	"" Ä
$str
""Å ù
)
""ù û
]
""û ü
[## 	#
OpenApiResponseWithBody##	  
(##  !

statusCode##! +
:##+ ,
HttpStatusCode##- ;
.##; <
OK##< >
,##> ?
contentType##@ K
:##K L
$str##M _
,##_ `
bodyType##a i
:##i j
typeof##k q
(##q r
ServicioDto##r }
)##} ~
,##~ 
Description
##Ä ã
=
##å ç
$str
##é ü
)
##ü †
]
##† °
[$$ 	#
OpenApiResponseWithBody$$	  
($$  !

statusCode$$! +
:$$+ ,
HttpStatusCode$$- ;
.$$; <
	NoContent$$< E
,$$E F
contentType$$G R
:$$R S
$str$$T f
,$$f g
bodyType$$h p
:$$p q
typeof$$r x
($$x y
ResponseResult	$$y á
)
$$á à
,
$$à â
Description
$$ä ï
=
$$ñ ó
$str
$$ò §
)
$$§ •
]
$$• ¶
[%% 	#
OpenApiResponseWithBody%%	  
(%%  !

statusCode%%! +
:%%+ ,
HttpStatusCode%%- ;
.%%; <
InternalServerError%%< O
,%%O P
contentType%%Q \
:%%\ ]
$str%%^ p
,%%p q
bodyType%%r z
:%%z {
typeof	%%| Ç
(
%%Ç É
ResponseResult
%%É ë
)
%%ë í
,
%%í ì
Description
%%î ü
=
%%† °
$str
%%¢ ∏
)
%%∏ π
]
%%π ∫
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
ListarServicioID&&) 9
(&&9 :
['' 
HttpTrigger'' 
('' 
AuthorizationLevel'' +
.''+ ,
Function'', 4
,''4 5
$str''6 ;
,''; <
Route''= B
=''C D
$str''E a
)''a b
]''b c
HttpRequest''d o
req''p s
,''s t
string''u {

idServicio	''| Ü
)
''Ü á
{(( 	
try)) 
{** 
ServicioDto++ 
servicio++ $
=++% &
await++' ,
_unitOfWork++- 8
.++8 9
ServicioRepository++9 K
.++K L 
GetServicioByIdAsync++L `
(++` a

idServicio++a k
)++k l
;++l m
return,, 
HttpResponseHelper,, )
.,,) *"
SuccessfulObjectResult,,* @
(,,@ A
servicio,,A I
),,I J
;,,J K
}-- 
catch.. 
(.. 
	Exception.. 
ex.. 
)..  
{// 
return00 
HttpResponseHelper00 )
.00) *
Response00* 2
(002 3
StatusCodes003 >
.00> ?(
Status500InternalServerError00? [
,00[ \
new00] `
ResponseResult00a o
(00o p
)00p q
{00r s
IsError00t {
=00| }
true	00~ Ç
,
00Ç É
Message
00Ñ ã
=
00å ç
ex
00é ê
.
00ê ë
Message
00ë ò
}
00ô ö
)
00ö õ
;
00õ ú
}11 
}22 	
}33 
}44 ÿ"
oC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\FxListarServicios.cs
	namespace 	

FxServicio
 
{ 
public 

class 
FxListarServicios "
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
FxListarServicios  
(  !
IUnitOfWork! ,

unitOfWork- 7
)7 8
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
( 
ListarServicios ,
), -
)- .
]. /
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
$str  ' 8
,  8 9
tags  : >
:  > ?
new  @ C
[  C D
]  D E
{  F G
$str  H b
}  c d
,  d e
Description  f q
=  r s
$str	  t ã
,
  ã å
Summary
  ç î
=
  ï ñ
$str
  ó «
)
  « »
]
  » …
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
<""w x
ServicioDto	""x É
>
""É Ñ
)
""Ñ Ö
,
""Ö Ü
Description
""á í
=
""ì î
$str
""ï ¶
)
""¶ ß
]
""ß ®
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
>$$' (
ListarServicios$$) 8
($$8 9
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
$str%%E T
)%%T U
]%%U V
HttpRequest%%W b
req%%c f
)%%f g
{&& 	
try'' 
{(( 
IList)) 
<)) 
ServicioDto)) !
>))! "
	servicios))# ,
=))- .
await))/ 4
_unitOfWork))5 @
.))@ A
ServicioRepository))A S
.))S T
GetServiciosAsync))T e
())e f
)))f g
;))g h
return** 
HttpResponseHelper** )
.**) *"
SuccessfulObjectResult*** @
(**@ A
	servicios**A J
)**J K
;**K L
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
}22 ˆ
ìC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Interfaces\RepositoryPattern\IGrupoServicioRepository.cs
	namespace 	

FxServicio
 
. 

Interfaces 
.  
RepositoryPattern  1
{ 
public 

	interface $
IGrupoServicioRepository -
{ 
public 
Task 
< 
bool 
> 
ExistsGrupoServicio -
(- .
string. 4
idGrupoServicio5 D
)D E
;E F
} 
}		 „
éC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Interfaces\RepositoryPattern\IServicioRepository.cs
	namespace 	

FxServicio
 
. 

Interfaces 
.  
RepositoryPattern  1
{ 
public		 

	interface		 
IServicioRepository		 (
{

 
public 
Task 
< 
string 
> 
CreateServicioAsync /
(/ 0
Servicio0 8
servicio9 A
)A B
;B C
public 
Task 
< 
ServicioDto 
>   
GetServicioByIdAsync! 5
(5 6
string6 <

idServicio= G
)G H
;H I
public 
Task 
< 
List 
< 
ServicioDto $
>$ %
>% &-
!GetServicioByIdGrupoServicioAsync' H
(H I
stringI O
idGrupoServicioP _
)_ `
;` a
public 
Task 
< 
List 
< 
ServicioDto $
>$ %
>% &
GetServiciosAsync' 8
(8 9
)9 :
;: ;
public 
Task 
UpsertServicioAsync '
(' (
Servicio( 0
servicio1 9
,9 :
string; A

idServicioB L
)L M
;M N
public 
Task 
< 
bool 
> 
ExistsServicioAsync -
(- .
string. 4
nombreServicio5 C
)C D
;D E
} 
} ∑
ÜC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Interfaces\RepositoryPattern\IUnitOfWork.cs
	namespace 	

FxServicio
 
. 

Interfaces 
.  
RepositoryPattern  1
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ 
IServicioRepository 
ServicioRepository .
{/ 0
get1 4
;4 5
}6 7$
IGrupoServicioRepository  #
GrupoServicioRepository! 8
{9 :
get; >
;> ?
}? @
}		 
}

 ∫
|C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Mappers\MappingProfileServicio.cs
	namespace		 	

FxServicio		
 
.		 
Mappers		 
{

 
public 

class "
MappingProfileServicio '
:( )
Profile* 1
{ 
public "
MappingProfileServicio %
(% &
)& '
{ 	
	CreateMap 
< 
ServicioInput #
,# $
Servicio% -
>- .
(. /
)/ 0
. 
	ForMember 
( 
dest 
=> 
dest  $
.$ %
Id% '
,' (
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
.P Q
NombreServicioQ _
._ `
Trim` d
(d e
)e f
)f g
)g h
)h i
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
PkGrupoServicio$ 3
,3 4
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
IdGrupoServicio4 C
)C D
)D E
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
UsuarioCreacion$ 3
,3 4
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
Usuario4 ;
); <
)< =
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
NombreServicio$ 2
,2 3
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
NombreServicio4 B
.B C
TrimC G
(G H
)H I
)I J
)J K
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
DescripcionServicio$ 7
,7 8
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
DescripcionServicio4 G
.G H
TrimH L
(L M
)M N
)N O
)O P
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
FechaCrecion$ 0
,0 1
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
DateTimeOffset0 >
.> ?
UtcNow? E
)E F
)F G
;G H
} 	
} 
} Õ
ÑC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Models\DataTransferObjects\ServicioDto.cs
	namespace 	

FxServicio
 
. 
Models 
. 
DataTransferObjects /
{ 
[ 
OpenApiExample 
( 
typeof 
( #
ResponseServicioExample 2
)2 3
)3 4
]4 5
public 

class 
ServicioDto 
{		 
public

 
string

 

idServicio

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
string 
idGrupoServicio %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
nombreServicio $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
descripcionServicio )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
int 
tiempo 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
numeroPersonas !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
tramiteVirtual "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
tramitePresencial %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
tipoPago 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ‡
{C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Models\Entities\GrupoServicio.cs
	namespace 	

FxServicio
 
. 
Models 
. 
Entities $
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
public		 
string		 
NombreGrupoServicio		 )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTimeOffset 
FechaCrecion *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
UsuarioModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DateTimeOffset 
FechaModificacion /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} ¿
vC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Models\Entities\Servicio.cs
	namespace 	

FxServicio
 
. 
Models 
. 
Entities $
{ 
public 

class 
Servicio 
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
public		 
string		 
PkGrupoServicio		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public 
string 
NombreServicio $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
DescripcionServicio )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
int 
TiempoAtencion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int "
NumeroPersonasAtencion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
TramiteVirtual "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
TramitePresencial %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
TipoPago 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTimeOffset 
FechaCrecion *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
UsuarioModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public   
DateTimeOffset   
FechaModificacion   /
{  0 1
get  2 5
;  5 6
set  7 :
;  : ;
}  < =
}!! 
}"" „!
xC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Models\Input\ServicioInput.cs
	namespace 	

FxServicio
 
. 
Models 
. 
Input !
{ 
[		 
OpenApiExample		 
(		 
typeof		 
(		 
ServicioExample		 *
)		* +
)		+ ,
]		, -
public

 

class

 
ServicioInput

 
{ 
[ 	
JsonProperty	 
( 
$str '
,' (
Required) 1
=2 3
Required4 <
.< =
Always= C
)C D
]D E
public 
string 
IdGrupoServicio %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 	
JsonProperty	 
( 
$str 
, 
Required  (
=) *
Required+ 3
.3 4
Always4 :
): ;
]; <
public 
string 
NombreServicio $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
JsonProperty	 
( 
$str #
,# $
Required% -
=. /
Required0 8
.8 9
Always9 ?
)? @
]@ A
public 
string 
DescripcionServicio )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
JsonProperty	 
( 
$str 
, 
Required  (
=) *
Required+ 3
.3 4
Always4 :
): ;
]; <
public 
int 
TiempoAtencion !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
JsonProperty	 
( 
$str &
,& '
Required( 0
=1 2
Required3 ;
.; <
Always< B
)B C
]C D
public 
int "
NumeroPersonasAtencion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
JsonProperty	 
( 
$str &
,& '
Required( 0
=1 2
Required3 ;
.; <
Always< B
)B C
]C D
public 
bool 
TramiteVirtual "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
JsonProperty	 
( 
$str )
,) *
Required+ 3
=4 5
Required6 >
.> ?
Always? E
)E F
]F G
public 
bool 
TramitePresencial %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[!! 	
JsonProperty!!	 
(!! 
$str!!  
,!!  !
Required!!" *
=!!+ ,
Required!!- 5
.!!5 6
Always!!6 <
)!!< =
]!!= >
public"" 
string"" 
TipoPago"" 
{""  
get""! $
;""$ %
set""& )
;"") *
}""+ ,
[$$ 	
JsonProperty$$	 
($$ 
$str$$ 
,$$ 
Required$$  (
=$$) *
Required$$+ 3
.$$3 4
Default$$4 ;
)$$; <
]$$< =
public%% 
bool%% 
?%% 
Activo%% 
{%% 
get%% !
;%%! "
set%%# &
;%%& '
}%%( )
=%%* +
true%%, 0
;%%0 1
['' 	
JsonProperty''	 
('' 
$str'' 
,''  
Required''! )
=''* +
Required'', 4
.''4 5
Always''5 ;
)''; <
]''< =
public(( 
string(( 
Usuario(( 
{(( 
get((  #
;((# $
set((% (
;((( )
}((* +
})) 
}** ™
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Models\ResponseResult.cs
	namespace		 	

FxServicio		
 
.		 
Models		 
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
} ˜

{C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\OpenApi\ResponseResultExample.cs
	namespace

 	

FxServicio


 
.

 
OpenApi

 
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
} †
}C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\OpenApi\ResponseServicioExample.cs
	namespace 	

FxServicio
 
. 
OpenApi 
{		 
public

 

class

 #
ResponseServicioExample

 (
:

) *
OpenApiExample

+ 9
<

9 :
ServicioDto

: E
>

E F
{ 
public 
override 
IOpenApiExample '
<' (
ServicioDto( 3
>3 4
Build5 :
(: ;
NamingStrategy; I
namingStrategyJ X
=Y Z
null[ _
)_ `
{ 	
Examples 
. 
Add 
( "
OpenApiExampleResolver &
.& '
Resolve' .
(. /
$str %
,% &
new 
ServicioDto #
(# $
)$ %
{ 

idServicio "
=# $
$str% g
,g h
idGrupoServicio '
=( )
$str* n
,n o
nombreServicio &
=' (
$str) :
,: ;
descripcionServicio +
=+ ,
$str, F
,F G
tiempo 
=  
$num! #
,# $
numeroPersonas &
=' (
$num) *
,* +
tramiteVirtual &
=' (
true( ,
,, -
tramitePresencial )
=* +
true, 0
,0 1
tipoPago  
=! "
$str# /
} 
, 
namingStrategy "
) 
) 
; 
return   
this   
;   
}!! 	
}"" 
}## «
uC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\OpenApi\ServicioExample.cs
	namespace 	

FxServicio
 
. 
OpenApi 
{		 
public

 

class

 
ServicioExample

  
:

! "
OpenApiExample

# 1
<

1 2
ServicioInput

2 ?
>

? @
{ 
public 
override 
IOpenApiExample '
<' (
ServicioInput( 5
>5 6
Build7 <
(< =
NamingStrategy= K
namingStrategyL Z
=[ \
null] a
)a b
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
new 
ServicioInput %
(% &
)& '
{ 
IdGrupoServicio '
=( )
$str* l
,l m
NombreServicio &
=' (
$str) 5
,5 6
TiempoAtencion &
=' (
$num) +
,+ ,"
NumeroPersonasAtencion .
=/ 0
$num1 2
,2 3
TramiteVirtual &
=' (
true) -
,- .
TipoPago  
=! "
$str# /
,/ 0
Activo 
=  
true! %
,% &
Usuario 
=  !
$str" 0
} 
, 
namingStrategy "
) 
) 
; 
return 
this 
; 
}   	
}!! 
}"" é
ÇC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Repositories\GrupoServicioRepository.cs
	namespace 	

FxServicio
 
. 
Repositories !
{ 
public 

class #
GrupoServicioRepository (
:( )
RepositoryBase) 7
,7 8$
IGrupoServicioRepository9 Q
{ 
private 
readonly 
	Container "
	container# ,
;, -
public #
GrupoServicioRepository &
(& '
CosmosClient' 3
client4 :
,: ;
IConfiguration< J
configurationK X
)X Y
: 
base 
( 
client 
) 
{ 	
string 
containerId 
=  
configuration! .
[. /
$str/ G
]G H
;H I
string 
databaseName 
=  !
configuration" /
[/ 0
$str0 C
]C D
;D E
	container 
= 
client 
. 
GetContainer +
(+ ,
databaseName, 8
,8 9
containerId: E
)E F
;F G
} 	
public 
async 
Task 
< 
bool 
> 
ExistsGrupoServicio  3
(3 4
string4 :
idGrupoServicio; J
)J K
{ 	
object 
data 
= 
null 
; 
try 
{ 
var   
queryString   
=    !
$str &" =
;&&= >
var(( 
queryDef(( 
=(( 
new(( "
QueryDefinition((# 2
(((2 3
queryString((3 >
)((> ?
;((? @
queryDef)) 
.)) 
WithParameter)) &
())& '
$str))' 9
,))9 :
idGrupoServicio)); J
)))J K
;))K L
var** 
query** 
=** 
	container** %
.**% & 
GetItemQueryIterator**& :
<**: ;
object**; A
>**A B
(**B C
queryDef**C K
)**K L
;**L M
while,, 
(,, 
query,, 
.,, 
HasMoreResults,, +
),,+ ,
{-- 
var.. 
response..  
=..! "
await..# (
query..) .
.... /
ReadNextAsync../ <
(..< =
)..= >
;..> ?
data// 
=// 
response// #
.//# $
SingleOrDefault//$ 3
(//3 4
)//4 5
;//5 6
}00 
return22 
data22 
!=22 
null22 #
;22# $
}33 
catch44 
(44 
CosmosException44 "
ex44# %
)44% &
when44' +
(44, -
ex44- /
.44/ 0

StatusCode440 :
==44; =
HttpStatusCode44> L
.44L M
NotFound44M U
)44U V
{55 
return66 
false66 
;66 
}77 
}88 	
}99 
}:: ˝
yC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Repositories\RepositoryBase.cs
	namespace 	

FxServicio
 
. 
Repositories !
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
} –r
}C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Repositories\ServicioRepository.cs
	namespace 	

FxServicio
 
. 
Repositories !
{ 
public 

class 
ServicioRepository #
:$ %
RepositoryBase& 4
,4 5
IServicioRepository6 I
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
ServicioRepository !
(! "
CosmosClient" .
client/ 5
,5 6
IConfiguration7 E
configurationF S
)S T
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
$str/ B
]B C
;C D
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
>  !
CreateServicioAsync" 5
(5 6
Servicio6 >
servicio? G
)G H
{ 	
try   
{!! 
ItemResponse"" 
<"" 
Servicio"" %
>""% &
itemResponse""' 3
=""4 5
await""6 ;
	container""< E
.""E F
ReadItemAsync""F S
<""S T
Servicio""T \
>""\ ]
(""] ^
servicio""^ f
.""f g
Id""g i
,""i j
new""k n
PartitionKey""o {
(""{ |
servicio	""| Ñ
.
""Ñ Ö
PkGrupoServicio
""Ö î
)
""î ï
)
""ï ñ
;
""ñ ó
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
await'' #
	container''$ -
.''- .
CreateItemAsync''. =
(''= >
servicio''> F
,''F G
new''H K
PartitionKey''L X
(''X Y
servicio''Y a
.''a b
PkGrupoServicio''b q
)''q r
)''r s
;''s t
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
>.. 
ExistsServicioAsync..  3
(..3 4
string..4 :
nombreServicio..; I
)..I J
{// 	
ServicioDto00 
data00 
=00 
null00 #
;00# $
try11 
{22 
var44 
queryString44 
=44  !
$str4?" ?
;??? @
varAA 
queryDefAA 
=AA 
newAA "
QueryDefinitionAA# 2
(AA2 3
queryStringAA3 >
)AA> ?
;AA? @
queryDefBB 
.BB 
WithParameterBB &
(BB& '
$strBB' 0
,BB0 1
nombreServicioBB2 @
)BB@ A
;BBA B
varCC 
queryCC 
=CC 
	containerCC %
.CC% & 
GetItemQueryIteratorCC& :
<CC: ;
ServicioDtoCC; F
>CCF G
(CCG H
queryDefCCH P
)CCP Q
;CCQ R
whileEE 
(EE 
queryEE 
.EE 
HasMoreResultsEE +
)EE+ ,
{FF 
varGG 
responseGG  
=GG! "
awaitGG# (
queryGG) .
.GG. /
ReadNextAsyncGG/ <
(GG< =
)GG= >
;GG> ?
dataHH 
=HH 
responseHH #
.HH# $
SingleOrDefaultHH$ 3
(HH3 4
)HH4 5
;HH5 6
}II 
returnKK 
dataKK 
!=KK 
nullKK #
;KK# $
}LL 
catchMM 
(MM 
CosmosExceptionMM "
exMM# %
)MM% &
whenMM' +
(MM, -
exMM- /
.MM/ 0

StatusCodeMM0 :
==MM; =
HttpStatusCodeMM> L
.MML M
NotFoundMMM U
)MMU V
{NN 
returnOO 
falseOO 
;OO 
}PP 
}QQ 	
publicSS 
asyncSS 
TaskSS 
<SS 
ServicioDtoSS %
>SS% & 
GetServicioByIdAsyncSS' ;
(SS; <
stringSS< B

idServicioSSC M
)SSM N
{TT 	
ServicioDtoUU 
servicioDtoUU #
=UU$ %
nullUU& *
;UU* +
tryVV 
{WW 
varXX 
queryStringXX 
=XX  !
$strXc" L
;ccL M
varee 
queryDefee 
=ee 
newee "
QueryDefinitionee# 2
(ee2 3
queryStringee3 >
)ee> ?
;ee? @
queryDefff 
.ff 
WithParameterff &
(ff& '
$strff' 0
,ff0 1
trueff2 6
)ff6 7
;ff7 8
queryDefgg 
.gg 
WithParametergg &
(gg& '
$strgg' 4
,gg4 5

idServiciogg6 @
)gg@ A
;ggA B
varii 
queryii 
=ii 
	containerii %
.ii% & 
GetItemQueryIteratorii& :
<ii: ;
ServicioDtoii; F
>iiF G
(iiG H
queryDefiiH P
)iiP Q
;iiQ R
whilejj 
(jj 
queryjj 
.jj 
HasMoreResultsjj +
)jj+ ,
{kk 
varll 
responsell  
=ll! "
awaitll# (
queryll) .
.ll. /
ReadNextAsyncll/ <
(ll< =
)ll= >
;ll> ?
servicioDtomm 
=mm  !
responsemm" *
.mm* +
SingleOrDefaultmm+ :
(mm: ;
)mm; <
;mm< =
}nn 
returnpp 
servicioDtopp "
;pp" #
}qq 
catchrr 
(rr 
CosmosExceptionrr "
exrr# %
)rr% &
whenrr' +
(rr, -
exrr- /
.rr/ 0

StatusCoderr0 :
==rr; =
HttpStatusCoderr> L
.rrL M
NotFoundrrM U
)rrU V
{ss 
returntt 
servicioDtott "
;tt" #
}uu 
}vv 	
publicxx 
asyncxx 
Taskxx 
<xx 
Listxx 
<xx 
ServicioDtoxx *
>xx* +
>xx+ ,-
!GetServicioByIdGrupoServicioAsyncxx- N
(xxN O
stringxxO U
idGrupoServicioxxV e
)xxe f
{yy 	
varzz 
queryStringzz 
=zz 
$str	zÖ ^
;
ÖÖ^ _
var
áá 
queryDef
áá 
=
áá 
new
áá 
QueryDefinition
áá .
(
áá. /
queryString
áá/ :
)
áá: ;
;
áá; <
queryDef
àà 
.
àà 
WithParameter
àà "
(
àà" #
$str
àà# 5
,
àà5 6
idGrupoServicio
àà7 F
)
ààF G
;
ààG H
queryDef
ââ 
.
ââ 
WithParameter
ââ "
(
ââ" #
$str
ââ# ,
,
ââ, -
true
ââ. 2
)
ââ2 3
;
ââ3 4
var
ãã 
query
ãã 
=
ãã 
	container
ãã !
.
ãã! ""
GetItemQueryIterator
ãã" 6
<
ãã6 7
ServicioDto
ãã7 B
>
ããB C
(
ããC D
queryDef
ããD L
)
ããL M
;
ããM N
var
çç 
	servicios
çç 
=
çç 
new
çç 
List
çç  $
<
çç$ %
ServicioDto
çç% 0
>
çç0 1
(
çç1 2
)
çç2 3
;
çç3 4
while
èè 
(
èè 
query
èè 
.
èè 
HasMoreResults
èè '
)
èè' (
{
êê 
var
ëë 
response
ëë 
=
ëë 
await
ëë $
query
ëë% *
.
ëë* +
ReadNextAsync
ëë+ 8
(
ëë8 9
)
ëë9 :
;
ëë: ;
	servicios
íí 
.
íí 
AddRange
íí "
(
íí" #
response
íí# +
.
íí+ ,
ToList
íí, 2
(
íí2 3
)
íí3 4
)
íí4 5
;
íí5 6
}
ìì 
return
ïï 
	servicios
ïï 
;
ïï 
}
ññ 	
public
òò 
async
òò 
Task
òò 
<
òò 
List
òò 
<
òò 
ServicioDto
òò *
>
òò* +
>
òò+ ,
GetServiciosAsync
òò- >
(
òò> ?
)
òò? @
{
ôô 	
var
öö 
queryString
öö 
=
öö 
$str
ö• 7
;
••7 8
var
ßß 
queryDef
ßß 
=
ßß 
new
ßß 
QueryDefinition
ßß .
(
ßß. /
queryString
ßß/ :
)
ßß: ;
;
ßß; <
queryDef
®® 
.
®® 
WithParameter
®® "
(
®®" #
$str
®®# ,
,
®®, -
true
®®. 2
)
®®2 3
;
®®3 4
var
™™ 
query
™™ 
=
™™ 
	container
™™ !
.
™™! ""
GetItemQueryIterator
™™" 6
<
™™6 7
ServicioDto
™™7 B
>
™™B C
(
™™C D
queryDef
™™D L
)
™™L M
;
™™M N
var
¨¨ 
	servicios
¨¨ 
=
¨¨ 
new
¨¨ 
List
¨¨  $
<
¨¨$ %
ServicioDto
¨¨% 0
>
¨¨0 1
(
¨¨1 2
)
¨¨2 3
;
¨¨3 4
while
ÆÆ 
(
ÆÆ 
query
ÆÆ 
.
ÆÆ 
HasMoreResults
ÆÆ '
)
ÆÆ' (
{
ØØ 
var
∞∞ 
response
∞∞ 
=
∞∞ 
await
∞∞ $
query
∞∞% *
.
∞∞* +
ReadNextAsync
∞∞+ 8
(
∞∞8 9
)
∞∞9 :
;
∞∞: ;
	servicios
±± 
.
±± 
AddRange
±± "
(
±±" #
response
±±# +
.
±±+ ,
ToList
±±, 2
(
±±2 3
)
±±3 4
)
±±4 5
;
±±5 6
}
≤≤ 
return
¥¥ 
	servicios
¥¥ 
;
¥¥ 
}
µµ 	
public
∑∑ 
async
∑∑ 
Task
∑∑ !
UpsertServicioAsync
∑∑ -
(
∑∑- .
Servicio
∑∑. 6
servicio
∑∑7 ?
,
∑∑? @
string
∑∑A G

idServicio
∑∑H R
)
∑∑R S
{
∏∏ 	
servicio
ππ 
.
ππ 
Id
ππ 
=
ππ 

idServicio
ππ $
;
ππ$ %
servicio
∫∫ 
.
∫∫ 
FechaModificacion
∫∫ &
=
∫∫' (
DateTimeOffset
∫∫) 7
.
∫∫7 8
UtcNow
∫∫8 >
;
∫∫> ?
await
ªª 
	container
ªª 
.
ªª 
PatchItemAsync
ªª *
<
ªª* +
Servicio
ªª+ 3
>
ªª3 4
(
ªª4 5

idServicio
ªª5 ?
,
ªª? @
new
ªªA D
PartitionKey
ªªE Q
(
ªªQ R
servicio
ªªR Z
.
ªªZ [
PkGrupoServicio
ªª[ j
)
ªªj k
,
ªªk l
new
ºº 
[
ºº 
]
ºº 
{
ºº 
PatchOperation
ΩΩ (
.
ΩΩ( )
Set
ΩΩ) ,
(
ΩΩ, -
$str
ΩΩ- >
,
ΩΩ> ?
servicio
ΩΩ@ H
.
ΩΩH I
NombreServicio
ΩΩI W
)
ΩΩW X
,
ΩΩX Y
PatchOperation
ææ (
.
ææ( )
Set
ææ) ,
(
ææ, -
$str
ææ- C
,
ææC D
servicio
ææE M
.
ææM N!
DescripcionServicio
ææN a
)
ææa b
,
ææb c
PatchOperation
øø (
.
øø( )
Set
øø) ,
(
øø, -
$str
øø- >
,
øø> ?
servicio
øø@ H
.
øøH I
TiempoAtencion
øøI W
)
øøW X
,
øøX Y
PatchOperation
¿¿ (
.
¿¿( )
Set
¿¿) ,
(
¿¿, -
$str
¿¿- F
,
¿¿F G
servicio
¿¿H P
.
¿¿P Q$
NumeroPersonasAtencion
¿¿Q g
)
¿¿g h
,
¿¿h i
PatchOperation
¡¡ (
.
¡¡( )
Set
¡¡) ,
(
¡¡, -
$str
¡¡- >
,
¡¡> ?
servicio
¡¡@ H
.
¡¡H I
TramiteVirtual
¡¡I W
)
¡¡W X
,
¡¡X Y
PatchOperation
¬¬ (
.
¬¬( )
Set
¬¬) ,
(
¬¬, -
$str
¬¬- A
,
¬¬A B
servicio
¬¬C K
.
¬¬K L
TramitePresencial
¬¬L ]
)
¬¬] ^
,
¬¬^ _
PatchOperation
√√ (
.
√√( )
Set
√√) ,
(
√√, -
$str
√√- 8
,
√√8 9
servicio
√√: B
.
√√B C
TipoPago
√√C K
)
√√K L
,
√√L M
PatchOperation
ƒƒ (
.
ƒƒ( )
Set
ƒƒ) ,
(
ƒƒ, -
$str
ƒƒ- 6
,
ƒƒ6 7
servicio
ƒƒ8 @
.
ƒƒ@ A
Activo
ƒƒA G
)
ƒƒG H
,
ƒƒH I
PatchOperation
≈≈ (
.
≈≈( )
Set
≈≈) ,
(
≈≈, -
$str
≈≈- C
,
≈≈C D
servicio
≈≈E M
.
≈≈M N!
UsuarioModificacion
≈≈N a
)
≈≈a b
,
≈≈b c
PatchOperation
∆∆ (
.
∆∆( )
Set
∆∆) ,
(
∆∆, -
$str
∆∆- A
,
∆∆A B
servicio
∆∆C K
.
∆∆K L
FechaModificacion
∆∆L ]
)
∆∆] ^
}
∆∆^ _
)
∆∆_ `
;
∆∆` a
}
«« 	
}
»» 
}…… ¡5
eC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Startup.cs
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
	namespace 	

FxServicio
 
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
CosmosClientBuilder;;4 G
(;;G H
account;;H O
,;;O P
key;;Q T
);;T U
;;;U V
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
<QQ& '
IServicioRepositoryQQ' :
,QQ: ;
ServicioRepositoryQQ< N
>QQN O
(QQO P
)QQP Q
;QQQ R
builderRR 
.RR 
ServicesRR 
.RR 
	AddScopedRR &
<RR& '$
IGrupoServicioRepositoryRR' ?
,RR? @#
GrupoServicioRepositoryRRA X
>RRX Y
(RRY Z
)RRZ [
;RR[ \
builderVV 
.VV 
ServicesVV 
.VV 
	AddScopedVV &
<VV& '

IValidatorVV' 1
<VV1 2
ServicioInputVV2 ?
>VV? @
,VV@ A
ServicioValidatorVVB S
>VVS T
(VVT U
)VVU V
;VVV W
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
}ZZ √
vC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Utils\HttpResponseHelper.cs
	namespace 	

FxServicio
 
. 
Utils 
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
} Ë
rC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Utils\SecurityHelper.cs
	namespace 	

FxServicio
 
. 
Utils 
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
} ü%
yC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxServicio\FxServicio\Validator\ServicioValidator.cs
	namespace 	

FxServicio
 
. 
	Validator 
{ 
public 

class 
ServicioValidator "
:# $
AbstractValidator% 6
<6 7
ServicioInput7 D
>D E
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
private 
readonly 
int 
tiempoMaximo )
;) *
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
ServicioValidator  
(  !
IConfiguration! /
config0 6
,6 7
IUnitOfWork8 C

unitOfWorkD N
)N O
{ 	
_config 
= 
config 
; 
tiempoMaximo 
= 
_config "
." #
GetValue# +
<+ ,
int, /
>/ 0
(0 1
$str1 I
)I J
;J K
_unitOfWork 
= 

unitOfWork $
;$ %
RuleFor 
( 
property 
=> 
property  (
.( )
IdGrupoServicio) 8
)8 9
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' R
)R S
.   
Must   
(   
(   
property   
,    
IdGrupoServicio  ! 0
)  0 1
=>  2 4
VerificarBD  5 @
(  @ A
IdGrupoServicio  A P
)  P Q
)  Q R
.  R S
WithMessage  S ^
(  ^ _
$str	  _ ≠
)
  ≠ Æ
;
  Æ Ø
RuleFor## 
(## 
property## 
=>## 
property##  (
.##( )
NombreServicio##) 7
)##7 8
.$$ 
NotEmpty$$ 
($$ 
)$$ 
.%% 
NotNull%% 
(%% 
)%% 
.%% 
WithMessage%% &
(%%& '
$str%%' R
)%%R S
;%%S T
RuleFor(( 
((( 
property(( 
=>(( 
property((  (
.((( )
TiempoAtencion(() 7
)((7 8
.)) 
Must)) 
()) 
x)) 
=>)) 
x)) 
>)) 
$num)) 
&&))  "
x))# $
<=))% '
tiempoMaximo))( 4
)))4 5
.))5 6
WithMessage))6 A
())A B
$"))B D
$str))D |
{))| }
tiempoMaximo	))} â
}
))â ä
"
))ä ã
)
))ã å
;
))å ç
RuleFor++ 
(++ 
property++ 
=>++ 
property++  (
.++( )"
NumeroPersonasAtencion++) ?
)++? @
.,, 
Must,, 
(,, 
x,, 
=>,, 
x,, 
>,, 
$num,, 
),, 
.,,  
WithMessage,,  +
(,,+ ,
$",,, .
$str,,. _
",,_ `
),,` a
;,,a b
RuleFor// 
(// 
property// 
=>// 
property//  (
.//( )
TipoPago//) 1
)//1 2
.00 
NotEmpty00 
(00 
)00 
.11 
NotNull11 
(11 
)11 
.11 
WithMessage11 %
(11% &
$str11& Q
)11Q R
;11R S
RuleFor33 
(33 
property33 
=>33 
property33  (
.33( )
Usuario33) 0
)330 1
.44 
NotEmpty44 
(44 
)44 
.55 
NotNull55 
(55 
)55 
.55 
WithMessage55 &
(55& '
$str55' R
)55R S
;55S T
}66 	
private:: 
bool:: 
VerificarBD::  
(::  !
string::! '
idGrupoServicio::( 7
)::7 8
{;; 	
return<< 
_unitOfWork<< 
.<< #
GrupoServicioRepository<< 6
.<<6 7
ExistsGrupoServicio<<7 J
(<<J K
idGrupoServicio<<K Z
)<<Z [
.<<[ \

GetAwaiter<<\ f
(<<f g
)<<g h
.<<h i
	GetResult<<i r
(<<r s
)<<s t
;<<t u
}== 	
}>> 
}?? 