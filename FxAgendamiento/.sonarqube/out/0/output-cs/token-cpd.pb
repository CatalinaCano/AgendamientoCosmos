π	
gC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\DataContext\DapperContext.cs
	namespace 	
FxAgendamiento
 
. 
DataContext $
{ 
public 

class 
DapperContext 
{		 
private

 
readonly

 
IConfiguration

 '
_config

( /
;

/ 0
private 
readonly 
string 

secretName  *
;* +
public 
DapperContext 
( 
IConfiguration +
configuration, 9
)9 :
{ 	
_config 
= 
configuration #
;# $

secretName 
= 
_config  
[  !
$str! ;
]; <
;< =
} 	
public 
IDbConnection 
CreateConnection -
(- .
). /
{ 	
return 
new 
SqlConnection $
($ %
_config% ,
[, -

secretName- 7
]7 8
)8 9
;9 :
} 	
} 
} ›8
dC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\DataContext\UnitOfWork.cs
	namespace

 	
FxAgendamiento


 
.

 
DataContext

 $
{ 
public 

class 

UnitOfWork 
: 
IUnitOfWork )
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
CosmosClient %
_client& -
;- .
private 
IDbConnection 
_connection )
;) *
private 
IDbTransaction 
_transaction +
;+ ,
private 
IMallaRepository  
_mallaRepository! 1
;1 2
private 
ISedeRepository 
_sedeRepository  /
;/ 0
private 
IServicioRepository #
_servicioRepository$ 7
;7 8
private 
ITramiteRepository "
_tramiteRepository# 5
;5 6
private 
IEmailRepository  
_emailRepository! 1
;1 2
private 
IUsuarioRepository "
_usuarioRepository# 5
;5 6
private 
bool 
	_disposed 
=  
false! &
;& '
public 

UnitOfWork 
( 
IConfiguration (
configuration) 6
,6 7
CosmosClient8 D
clientE K
,K L
DapperContextM Z
context[ b
)b c
{ 	
_configuration   
=   
configuration   *
;  * +
_client!! 
=!! 
client!! 
;!! 
_connection## 
=## 
context## !
.##! "
CreateConnection##" 2
(##2 3
)##3 4
;##4 5
_connection$$ 
.$$ 
Open$$ 
($$ 
)$$ 
;$$ 
_transaction%% 
=%% 
_connection%% &
.%%& '
BeginTransaction%%' 7
(%%7 8
)%%8 9
;%%9 :
}&& 	
public(( 
IMallaRepository(( 
MallaRepository((  /
{)) 	
get** 
{** 
return** 
_mallaRepository** )
??=*** -
new**. 1
MallaRepository**2 A
(**A B
_client**B I
,**I J
_configuration**K Y
)**Y Z
;**Z [
}**\ ]
}++ 	
public-- 
ISedeRepository-- 
SedeRepository-- -
{.. 	
get// 
{// 
return// 
_sedeRepository// (
??=//) ,
new//- 0
SedeRepository//1 ?
(//? @
_client//@ G
,//G H
_configuration//I W
)//W X
;//X Y
}//Z [
}00 	
public22 
IServicioRepository22 "
ServicioRepository22# 5
{33 	
get44 
{44 
return44 
_servicioRepository44 ,
??=44- 0
new441 4
ServicioRepository445 G
(44G H
_client44H O
,44O P
_configuration44Q _
)44_ `
;44` a
}44b c
}55 	
public77 
ITramiteRepository77 !
TramiteRepository77" 3
{88 	
get99 
{99 
return99 
_tramiteRepository99 +
??=99, /
new990 3
TramiteRepository994 E
(99E F
_client99F M
,99M N
_configuration99O ]
)99] ^
;99^ _
}99` a
}:: 	
public<< 
IEmailRepository<< 
EmailRepository<<  /
{== 	
get>> 
{>> 
return>> 
_emailRepository>> )
??=>>* -
new>>. 1
EmailRepository>>2 A
(>>A B
_transaction>>B N
)>>N O
;>>O P
}>>Q R
}?? 	
publicAA 
IUsuarioRepositoryAA !
UsuarioRepositoryAA" 3
{BB 	
getCC 
{CC 
returnCC 
_usuarioRepositoryCC +
??=CC, /
newCC0 3
UsuarioRepositoryCC4 E
(CCE F
_transactionCCF R
)CCR S
;CCS T
}CCU V
}DD 	
publicFF 
voidFF 
CommitFF 
(FF 
)FF 
{GG 	
tryHH 
{II 
_transactionJJ 
.JJ 
CommitJJ #
(JJ# $
)JJ$ %
;JJ% &
}KK 
catchLL 
{MM 
_transactionNN 
.NN 
RollbackNN %
(NN% &
)NN& '
;NN' (
throwOO 
;OO 
}PP 
finallyQQ 
{RR 
_transactionSS 
.SS 
DisposeSS $
(SS$ %
)SS% &
;SS& '
_transactionTT 
=TT 
_connectionTT *
.TT* +
BeginTransactionTT+ ;
(TT; <
)TT< =
;TT= >
ResetRepositoriesUU !
(UU! "
)UU" #
;UU# $
}VV 
}WW 	
privateYY 
voidYY 
ResetRepositoriesYY &
(YY& '
)YY' (
{ZZ 	
_emailRepository[[ 
=[[ 
null[[ #
;[[# $
_usuarioRepository\\ 
=\\  
null\\! %
;\\% &
}]] 	
public__ 
void__ 
Dispose__ 
(__ 
)__ 
{`` 	
Disposeaa 
(aa 
trueaa 
)aa 
;aa 
GCbb 
.bb 
SuppressFinalizebb 
(bb  
thisbb  $
)bb$ %
;bb% &
}cc 	
	protectedee 
virtualee 
voidee 
Disposeee &
(ee& '
boolee' +
	disposingee, 5
)ee5 6
{ff 	
ifgg 
(gg 
!gg 
	_disposedgg 
)gg 
{hh 
ifii 
(ii 
	disposingii 
)ii 
{jj 
ifkk 
(kk 
_transactionkk $
!=kk% '
nullkk( ,
)kk, -
{ll 
_transactionmm $
.mm$ %
Disposemm% ,
(mm, -
)mm- .
;mm. /
_transactionnn $
=nn% &
nullnn' +
;nn+ ,
}oo 
ifpp 
(pp 
_connectionpp #
!=pp$ &
nullpp' +
)pp+ ,
{qq 
_connectionrr #
.rr# $
Disposerr$ +
(rr+ ,
)rr, -
;rr- .
_connectionss #
=ss$ %
nullss& *
;ss* +
}tt 
}uu 
	_disposedvv 
=vv 
truevv  
;vv  !
}ww 
}xx 	
~zz 	

UnitOfWorkzz	 
(zz 
)zz 
{{{ 	
Dispose|| 
(|| 
false|| 
)|| 
;|| 
}}} 	
}~~ 
} ™x
[C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\FxAgendarCita.cs
	namespace 	
FxAgendamiento
 
{ 
public   

class   
FxAgendarCita   
{"" 
public## 
readonly## 
IConfiguration## &
_configuration##' 5
;##5 6
private$$ 
readonly$$ 
IUnitOfWork$$ $
_unitOfWork$$% 0
;$$0 1
private%% 
readonly%% 

IValidator%% #
<%%# $
AgendaInput%%$ /
>%%/ 0

_validator%%1 ;
;%%; <
private&& 
readonly&& 
IMapper&&  
_mapper&&! (
;&&( )
private'' 
readonly'' 
IMessageService'' (
_messageService'') 8
;''8 9
private(( 
const(( 
string(( 
	OPERACION(( &
=((' (
$str(() 7
;((7 8
public** 
FxAgendarCita** 
(** 
IUnitOfWork** (

unitOfWork**) 3
,**3 4

IValidator**5 ?
<**? @
AgendaInput**@ K
>**K L
	validator**M V
,**V W
IMapper**X _
mapper**` f
,**f g
IMessageService**h w
messageService	**x Ü
,
**Ü á
IConfiguration
**à ñ
configuration
**ó §
)
**§ •
{++ 	
_unitOfWork,, 
=,, 

unitOfWork,, $
;,,$ %

_validator-- 
=-- 
	validator-- "
;--" #
_mapper.. 
=.. 
mapper.. 
;.. 
_messageService// 
=// 
messageService// ,
;//, -
_configuration00 
=00 
configuration00 *
;00* +
}11 	
[33 	
FunctionName33	 
(33 
nameof33 
(33 
AgendarCita33 (
)33( )
)33) *
]33* +
[44 	
FixedDelayRetry44	 
(44 
$num44 
,44 
$str44 &
)44& '
]44' (
[55 	
OpenApiOperation55	 
(55 
operationId55 %
:55% &
$str55' 4
,554 5
tags556 :
:55: ;
new55< ?
[55? @
]55@ A
{55B C
$str55D R
}55S T
,55T U
Description55V a
=55b c
$str	55d ó
,
55ó ò
Summary
55ô †
=
55° ¢
$str
55£ ÷
)
55÷ ◊
]
55◊ ÿ
[66 	
OpenApiSecurity66	 
(66 
$str66 '
,66' (
SecuritySchemeType66) ;
.66; <
ApiKey66< B
,66B C
Name66D H
=66I J
$str66K Q
,66Q R
In66S U
=66V W'
OpenApiSecurityLocationType66X s
.66s t
Query66t y
)66y z
]66z {
[77 	
OpenApiRequestBody77	 
(77 
contentType77 '
:77' (
$str77) ;
,77; <
bodyType77= E
:77E F
typeof77G M
(77M N
AgendaInput77N Y
)77Y Z
,77Z [
Required77\ d
=77e f
true77g k
,77k l
Description77m x
=77y z
$str	77{ è
)
77è ê
]
77ê ë
[88 	#
OpenApiResponseWithBody88	  
(88  !

statusCode88! +
:88+ ,
HttpStatusCode88- ;
.88; <
Created88< C
,88C D
contentType88E P
:88P Q
$str88R d
,88d e
bodyType88f n
:88n o
typeof88p v
(88v w
ResponseResult	88w Ö
)
88Ö Ü
,
88Ü á
Description
88à ì
=
88î ï
$str
88ñ ≠
)
88≠ Æ
]
88Æ Ø
[99 	#
OpenApiResponseWithBody99	  
(99  !

statusCode99! +
:99+ ,
HttpStatusCode99- ;
.99; <
Conflict99< D
,99D E
contentType99F Q
:99Q R
$str99S e
,99e f
bodyType99g o
:99o p
typeof99q w
(99w x
ResponseResult	99x Ü
)
99Ü á
,
99á à
Description
99â î
=
99ï ñ
$str
99ó ¢
)
99¢ £
]
99£ §
[:: 	#
OpenApiResponseWithBody::	  
(::  !

statusCode::! +
:::+ ,
HttpStatusCode::- ;
.::; <

BadRequest::< F
,::F G
contentType::H S
:::S T
$str::U g
,::g h
bodyType::i q
:::q r
typeof::s y
(::y z
ResponseResult	::z à
)
::à â
,
::â ä
Description
::ã ñ
=
::ó ò
$str
::ô ¶
)
::¶ ß
]
::ß ®
[;; 	#
OpenApiResponseWithBody;;	  
(;;  !

statusCode;;! +
:;;+ ,
HttpStatusCode;;- ;
.;;; <
InternalServerError;;< O
,;;O P
contentType;;Q \
:;;\ ]
$str;;^ p
,;;p q
bodyType;;r z
:;;z {
typeof	;;| Ç
(
;;Ç É
ResponseResult
;;É ë
)
;;ë í
,
;;í ì
Description
;;î ü
=
;;† °
$str
;;¢ ∏
)
;;∏ π
]
;;π ∫
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
AgendarCita<<) 4
(<<4 5
[== 
HttpTrigger== 
(== 
AuthorizationLevel== +
.==+ ,
Function==, 4
,==4 5
$str==6 <
,==< =
Route==> C
===D E
$str==F X
)==X Y
]==Y Z
HttpRequest==[ f
req==g j
)==j k
{>> 	
try?? 
{@@ 
varAA 
jsonAA 
=AA 
awaitAA  
reqAA! $
.AA$ %
ReadAsStringAsyncAA% 6
(AA6 7
)AA7 8
;AA8 9
AgendaInputBB 
requestBB #
=BB$ %
JsonConvertBB& 1
.BB1 2
DeserializeObjectBB2 C
<BBC D
AgendaInputBBD O
>BBO P
(BBP Q
jsonBBQ U
)BBU V
;BBV W
varDD 
validationResultDD $
=DD% &

_validatorDD' 1
.DD1 2
ValidateDD2 :
(DD: ;
requestDD; B
)DDB C
;DDC D
ifEE 
(EE 
validationResultEE $
.EE$ %
IsValidEE% ,
)EE, -
{FF 
SedeDtoGG 
sedeGG  
=GG! "
awaitGG# (
_unitOfWorkGG) 4
.GG4 5
SedeRepositoryGG5 C
.GGC D
ObtenerDatosSedeGGD T
(GGT U
requestGGU \
.GG\ ]
IdSedeGG] c
,GGc d
requestGGe l
.GGl m
	IdSubSedeGGm v
)GGv w
;GGw x
ServicioDtoHH 
servicioHH  (
=HH) *
awaitHH+ 0
_unitOfWorkHH1 <
.HH< =
ServicioRepositoryHH= O
.HHO P+
ObtenerTiempodeAtencionServicioHHP o
(HHo p
requestHHp w
.HHw x

IdServicio	HHx Ç
)
HHÇ É
;
HHÉ Ñ
stringII 
	pkTramiteII $
=II% &
SecurityHelperII' 5
.II5 6
CalcularLlaveII6 C
(IIC D
requestIID K
)IIK L
;IIL M
ListKK 
<KK 
DateTimeKK !
>KK! "
horasKK# (
=KK) *

TimeHelperKK+ 5
.KK5 6
ObtenerHorasKK6 B
(KKB C
requestKKC J
,KKJ K
sedeKKL P
,KKP Q
servicioKKR Z
)KKZ [
;KK[ \
stringLL 
[LL 
]LL 
tiemposHorasLL )
=LL* +

TimeHelperLL, 6
.LL6 7
CambiarHorasLL7 C
(LLC D
horasLLD I
)LLI J
;LLJ K
MallaDtoNN 
mallaNN "
=NN# $
_mapperNN% ,
.NN, -
MapNN- 0
<NN0 1
MallaDtoNN1 9
>NN9 :
(NN: ;
requestNN; B
)NNB C
;NNC D
ListPP 
<PP 

TramiteDtoPP #
>PP# $
resultPP% +
=PP, -
awaitPP. 3
_unitOfWorkPP4 ?
.PP? @
MallaRepositoryPP@ O
.PPO P
ValidarTiemposPPP ^
(PP^ _
mallaPP_ d
,PPd e
tiemposHorasPPf r
)PPr s
;PPs t
foreachRR 
(RR 

TramiteDtoRR '
horaRR( ,
inRR- /
resultRR0 6
)RR6 7
{SS 
ifTT 
(TT 
horaTT  
.TT  !
AgendaDisponibleTT! 1
&&TT2 4
horaTT5 9
.TT9 :
TramitesTT: B
?TTB C
.TTC D
LengthTTD J
<=TTK M
horaTTN R
.TTR S
CantidadPersonasTTS c
)TTc d
{UU 
boolVV  
activarAgendaVV! .
=VV/ 0
horaVV1 5
.VV5 6
TramitesVV6 >
?VV> ?
.VV? @
LengthVV@ F
+VVG H
$numVVI J
!=VVK M
horaVVN R
.VVR S
CantidadPersonasVVS c
;VVc d
awaitWW !
_unitOfWorkWW" -
.WW- .
MallaRepositoryWW. =
.WW= >
InactivarTiemposWW> N
(WWN O
mallaWWO T
,WWT U
horaWWV Z
.WWZ [

HoraInicioWW[ e
,WWe f
	pkTramiteWWg p
,WWp q
activarAgendaWWr 
)	WW Ä
;
WWÄ Å
}XX 
elseYY 
{ZZ 
return[[ "
HttpResponseHelper[[# 5
.[[5 6
Response[[6 >
([[> ?
StatusCodes[[? J
.[[J K
Status409Conflict[[K \
,[[\ ]
new[[^ a
ResponseResult[[b p
([[p q
)[[q r
{\\ 
IsError]]  '
=]]( )
true]]* .
,]]. /
Message^^  '
=^^( )
$str^^* }
}__ 
)__ 
;__ 
}`` 
}aa 
Agendacc 
tramitecc "
=cc# $
_mappercc% ,
.cc, -
Mapcc- 0
<cc0 1
Agendacc1 7
>cc7 8
(cc8 9
requestcc9 @
)cc@ A
;ccA B
tramitedd 
.dd 
Tramitesdd $
[dd$ %
$numdd% &
]dd& '
.dd' (
	PkTramitedd( 1
=dd2 3
	pkTramitedd4 =
;dd= >
tramiteee 
.ee 
Tramitesee $
[ee$ %
$numee% &
]ee& '
.ee' (
Servicioee( 0
.ee0 1
DuracionServicioee1 A
=eeB C
servicioeeD L
.eeL M
tiempoAtencioneeM [
;ee[ \
tramiteff 
.ff 
Tramitesff $
[ff$ %
$numff% &
]ff& '
.ff' (
Estadosff( /
[ff/ 0
$numff0 1
]ff1 2
.ff2 3
NombreEstadoff3 ?
=ff@ A
_configurationffB P
[ffP Q
$strffQ c
]ffc d
;ffd e
awaitgg 
_unitOfWorkgg %
.gg% &
TramiteRepositorygg& 7
.gg7 8
CrearTramitegg8 D
(ggD E
tramiteggE L
)ggL M
;ggM N

UsuarioDtoii 
userii #
=ii$ %
awaitii& +
_unitOfWorkii, 7
.ii7 8
UsuarioRepositoryii8 I
.iiI J
ObtenerUsuarioiiJ X
(iiX Y
requestiiY `
.ii` a
	IdUsuarioiia j
)iij k
;iik l

ValoresDtokk 
valueskk %
=kk& '
newkk( +
(kk+ ,
)kk, -
{ll 
IdUsermm 
=mm  
requestmm! (
.mm( )
	IdUsuariomm) 2
,mm2 3
	IdTramitenn !
=nn" #
	pkTramitenn$ -
,nn- .
Nombreoo 
=oo  
useroo! %
.oo% &
Nombresoo& -
,oo- .
	Direccionpp !
=pp" #
stringpp$ *
.pp* +
Concatpp+ 1
(pp1 2
sedepp2 6
.pp6 7

NombreSedepp7 A
,ppA B
$strppC I
,ppI J
sedeqq2 6
.qq6 7
	Direccionqq7 @
,qq@ A
$strqqB H
,qqH I
sederr2 6
.rr6 7
NombreSubSederr7 D
)rrD E
,rrE F
NombreServicioss &
=ss' (
servicioss) 1
.ss1 2
nombreServicioss2 @
,ss@ A
Fechatt 
=tt 
requesttt  '
.tt' (
FechaAgendamientott( 9
,tt9 :
Horauu 
=uu 
requestuu &
.uu& '
HoraAgendamientouu' 7
,uu7 8
Tiempovv 
=vv  
$"vv! #
{vv# $
serviciovv$ ,
.vv, -
tiempoAtencionvv- ;
}vv; <
$strvv< @
"vv@ A
}ww 
;ww 
awaityy 
_messageServiceyy )
.yy) *
CrearMensajeyy* 6
(yy6 7
useryy7 ;
.yy; <
CorreoElectronicoyy< M
,yyM N
valuesyyO U
,yyU V
	OPERACIONyyW `
)yy` a
;yya b
return{{ 
HttpResponseHelper{{ -
.{{- .
Response{{. 6
({{6 7
StatusCodes{{7 B
.{{B C
Status200OK{{C N
,{{N O
new{{P S
ResponseResult{{T b
({{b c
){{c d
{|| 
IsError}} 
=}}  !
false}}" '
,}}' (
Message~~ 
=~~  !
@$"~~" %
$str	~~% ∑
"
~~∑ ∏
} 
) 
; 
}
ÄÄ 
else
ÅÅ 
{
ÇÇ 
return
ÉÉ  
HttpResponseHelper
ÉÉ -
.
ÉÉ- .
Response
ÉÉ. 6
(
ÉÉ6 7
StatusCodes
ÉÉ7 B
.
ÉÉB C!
Status400BadRequest
ÉÉC V
,
ÉÉV W
new
ÉÉX [
ResponseResult
ÉÉ\ j
(
ÉÉj k
)
ÉÉk l
{
ÑÑ 
IsError
ÖÖ 
=
ÖÖ  !
true
ÖÖ" &
,
ÖÖ& '
Message
ÜÜ 
=
ÜÜ  !
validationResult
ÜÜ" 2
.
ÜÜ2 3
Errors
ÜÜ3 9
.
ÜÜ9 :
First
ÜÜ: ?
(
ÜÜ? @
)
ÜÜ@ A
.
ÜÜA B
ErrorMessage
ÜÜB N
}
áá 
)
áá 
;
áá 
}
àà 
}
ââ 
catch
ää 
(
ää 
	Exception
ää 
ex
ää 
)
ää  
{
ãã 
return
åå  
HttpResponseHelper
åå )
.
åå) *
Response
åå* 2
(
åå2 3
StatusCodes
åå3 >
.
åå> ?*
Status500InternalServerError
åå? [
,
åå[ \
new
åå] `
ResponseResult
ååa o
(
ååo p
)
ååp q
{
åår s
IsError
ååt {
=
åå| }
trueåå~ Ç
,ååÇ É
MessageååÑ ã
=ååå ç
exååé ê
.ååê ë
Messageååë ò
}ååô ö
)ååö õ
;ååõ ú
}
çç 
}
éé 	
}
èè 
}êê ƒF
]C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\FxAgregarEstado.cs
	namespace 	
FxAgendamiento
 
{ 
public 

class 
FxAgregarEstado  
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
NuevoEstadoInput!!$ 4
>!!4 5

_validator!!6 @
;!!@ A
private## 
readonly## 
IMapper##  
_mapper##! (
;##( )
public%% 
FxAgregarEstado%% 
(%% 
IUnitOfWork%% *

unitOfWork%%+ 5
,%%5 6

IValidator%%7 A
<%%A B
NuevoEstadoInput%%B R
>%%R S
	validator%%T ]
,%%] ^
IMapper%%^ e
mapper%%f l
)%%l m
{&& 	
_unitOfWork'' 
='' 

unitOfWork'' $
;''$ %

_validator(( 
=(( 
	validator(( "
;((" #
_mapper)) 
=)) 
mapper)) 
;)) 
}** 	
[,, 	
FunctionName,,	 
(,, 
nameof,, 
(,, 
AgregarEstado,, *
),,* +
),,+ ,
],,, -
[-- 	
FixedDelayRetry--	 
(-- 
$num-- 
,-- 
$str-- &
)--& '
]--' (
[.. 	
OpenApiOperation..	 
(.. 
operationId.. %
:..% &
$str..' 6
,..6 7
tags..8 <
:..< =
new..> A
[..A B
]..B C
{..D E
$str..F V
}..W X
,..X Y
Description..Z e
=..f g
$str	..h ù
,
..ù û
Summary
..ü ¶
=
..ß ®
$str
..© ﬁ
)
..ﬁ ﬂ
]
..ﬂ ‡
[// 	
OpenApiSecurity//	 
(// 
$str// '
,//' (
SecuritySchemeType//) ;
.//; <
ApiKey//< B
,//B C
Name//D H
=//I J
$str//K Q
,//Q R
In//S U
=//V W'
OpenApiSecurityLocationType//X s
.//s t
Query//t y
)//y z
]//z {
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
NuevoEstadoInput00N ^
)00^ _
,00_ `
Required00a i
=00j k
true00l p
,00p q
Description00r }
=00~ 
$str
00Ä î
)
00î ï
]
00ï ñ
[11 	#
OpenApiResponseWithBody11	  
(11  !

statusCode11! +
:11+ ,
HttpStatusCode11- ;
.11; <
Created11< C
,11C D
contentType11E P
:11P Q
$str11R d
,11d e
bodyType11f n
:11n o
typeof11p v
(11v w
ResponseResult	11w Ö
)
11Ö Ü
,
11Ü á
Description
11à ì
=
11î ï
$str
11ñ ≠
)
11≠ Æ
]
11Æ Ø
[22 	#
OpenApiResponseWithBody22	  
(22  !

statusCode22! +
:22+ ,
HttpStatusCode22- ;
.22; <
Conflict22< D
,22D E
contentType22F Q
:22Q R
$str22S e
,22e f
bodyType22g o
:22o p
typeof22q w
(22w x
ResponseResult	22x Ü
)
22Ü á
,
22á à
Description
22â î
=
22ï ñ
$str
22ó ¢
)
22¢ £
]
22£ §
[33 	#
OpenApiResponseWithBody33	  
(33  !

statusCode33! +
:33+ ,
HttpStatusCode33- ;
.33; <

BadRequest33< F
,33F G
contentType33H S
:33S T
$str33U g
,33g h
bodyType33i q
:33q r
typeof33s y
(33y z
ResponseResult	33z à
)
33à â
,
33â ä
Description
33ã ñ
=
33ó ò
$str
33ô ¶
)
33¶ ß
]
33ß ®
[44 	#
OpenApiResponseWithBody44	  
(44  !

statusCode44! +
:44+ ,
HttpStatusCode44- ;
.44; <
InternalServerError44< O
,44O P
contentType44Q \
:44\ ]
$str44^ p
,44p q
bodyType44r z
:44z {
typeof	44| Ç
(
44Ç É
ResponseResult
44É ë
)
44ë í
,
44í ì
Description
44î ü
=
44† °
$str
44¢ ∏
)
44∏ π
]
44π ∫
public55 
async55 
Task55 
<55 
IActionResult55 '
>55' (
AgregarEstado55) 6
(556 7
[66 
HttpTrigger66 
(66 
AuthorizationLevel66 +
.66+ ,
Function66, 4
,664 5
$str666 ;
,66; <
Route66= B
=66C D
$str66E Y
)66Y Z
]66Z [
HttpRequest66\ g
req66h k
)66k l
{77 	
try88 
{99 
var:: 
json:: 
=:: 
await::  
req::! $
.::$ %
ReadAsStringAsync::% 6
(::6 7
)::7 8
;::8 9
NuevoEstadoInput;;  
request;;! (
=;;) *
JsonConvert;;+ 6
.;;6 7
DeserializeObject;;7 H
<;;H I
NuevoEstadoInput;;I Y
>;;Y Z
(;;Z [
json;;[ _
);;_ `
;;;` a
var== 
validationResult== $
===% &

_validator==' 1
.==1 2
Validate==2 :
(==: ;
request==; B
)==B C
;==C D
if>> 
(>> 
validationResult>> $
.>>$ %
IsValid>>% ,
)>>, -
{?? 
EstadoAA 
estadoAA !
=AA" #
_mapperAA$ +
.AA+ ,
MapAA, /
<AA/ 0
EstadoAA0 6
>AA6 7
(AA7 8
requestAA8 ?
)AA? @
;AA@ A
stringCC 
resultCC !
=CC" #
awaitCC$ )
_unitOfWorkCC* 5
.CC5 6
TramiteRepositoryCC6 G
.CCG H
AgregarEstadoCCH U
(CCU V
requestCCV ]
.CC] ^
	IdUsuarioCC^ g
,CCg h
requestCCi p
.CCp q
	IdTramiteCCq z
,CCz {
estado	CC| Ç
)
CCÇ É
;
CCÉ Ñ
returnDD 
resultDD !
.DD! "
EqualsDD" (
(DD( )
$strDD) -
)DD- .
?DD/ 0
HttpResponseHelperDD1 C
.DDC D
ResponseDDD L
(DDL M
StatusCodesDDM X
.DDX Y
Status201CreatedDDY i
,DDi j
newDDk n
ResponseResultDDo }
(DD} ~
)DD~ 
{
DDÄ Å
IsError
DDÇ â
=
DDä ã
false
DDå ë
,
DDë í
Message
DDì ö
=
DDõ ú
$str
DDù ª
}
DDº Ω
)
DDΩ æ
:
DDø ¿ 
HttpResponseHelper
DD¡ ”
.
DD” ‘
Response
DD‘ ‹
(
DD‹ ›
StatusCodes
DD› Ë
.
DDË È
Status409Conflict
DDÈ ˙
,
DD˙ ˚
new
DD¸ ˇ
ResponseResult
DDÄ é
(
DDé è
)
DDè ê
{
DDë í
IsError
DDì ö
=
DDõ ú
true
DDù °
,
DD° ¢
Message
DD£ ™
=
DD´ ¨
$str
DD≠ ›
}
DDﬁ ﬂ
)
DDﬂ ‡
;
DD‡ ·
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
validationResultKK" 2
.KK2 3
ErrorsKK3 9
.KK9 :
FirstKK: ?
(KK? @
)KK@ A
.KKA B
ErrorMessageKKB N
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
}UU ôn
\C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\FxCancelarCita.cs
	namespace 	
FxAgendamiento
 
{ 
public 

class 
FxCancelarCita 
{!! 
public## 
readonly## 
IConfiguration## &
_configuration##' 5
;##5 6
private%% 
readonly%% 
IUnitOfWork%% $
_unitOfWork%%% 0
;%%0 1
private&& 
readonly&& 

IValidator&& #
<&&# $
CancelacionInput&&$ 4
>&&4 5

_validator&&6 @
;&&@ A
private'' 
readonly'' 
IMapper''  
_mapper''! (
;''( )
private(( 
readonly(( 
IMessageService(( (
_messageService(() 8
;((8 9
private)) 
const)) 
string)) 
	OPERACION)) &
=))' (
$str))) 6
;))6 7
public++ 
FxCancelarCita++ 
(++ 
IUnitOfWork++ )

unitOfWork++* 4
,++4 5

IValidator++6 @
<++@ A
CancelacionInput++A Q
>++Q R
	validator++S \
,++\ ]
IMapper++^ e
mapper++f l
,++l m
IMessageService++n }
messageService	++~ å
,
++å ç
IConfiguration
++é ú
configuration
++ù ™
)
++™ ´
{,, 	
_unitOfWork-- 
=-- 

unitOfWork-- $
;--$ %

_validator.. 
=.. 
	validator.. "
;.." #
_mapper// 
=// 
mapper// 
;// 
_messageService00 
=00 
messageService00 ,
;00, -
_configuration11 
=11 
configuration11 *
;11* +
}22 	
[44 	
FunctionName44	 
(44 
nameof44 
(44 
CancelarCita44 )
)44) *
)44* +
]44+ ,
[55 	
FixedDelayRetry55	 
(55 
$num55 
,55 
$str55 &
)55& '
]55' (
[66 	
OpenApiOperation66	 
(66 
operationId66 %
:66% &
$str66' 5
,665 6
tags667 ;
:66; <
new66= @
[66@ A
]66A B
{66C D
$str66E T
}66U V
,66V W
Description66X c
=66d e
$str	66f ú
,
66ú ù
Summary
66û •
=
66¶ ß
$str
66® ﬁ
)
66ﬁ ﬂ
]
66ﬂ ‡
[77 	
OpenApiSecurity77	 
(77 
$str77 '
,77' (
SecuritySchemeType77) ;
.77; <
ApiKey77< B
,77B C
Name77D H
=77I J
$str77K Q
,77Q R
In77S U
=77V W'
OpenApiSecurityLocationType77X s
.77s t
Query77t y
)77y z
]77z {
[88 	
OpenApiRequestBody88	 
(88 
contentType88 '
:88' (
$str88) ;
,88; <
bodyType88= E
:88E F
typeof88G M
(88M N
CancelacionInput88N ^
)88^ _
,88_ `
Required88a i
=88j k
true88l p
,88p q
Description88r }
=88~ 
$str
88Ä î
)
88î ï
]
88ï ñ
[99 	#
OpenApiResponseWithBody99	  
(99  !

statusCode99! +
:99+ ,
HttpStatusCode99- ;
.99; <
OK99< >
,99> ?
contentType99@ K
:99K L
$str99M _
,99_ `
bodyType99a i
:99i j
typeof99k q
(99q r
ResponseResult	99r Ä
)
99Ä Å
,
99Å Ç
Description
99É é
=
99è ê
$str
99ë ≥
)
99≥ ¥
]
99¥ µ
[:: 	#
OpenApiResponseWithBody::	  
(::  !

statusCode::! +
:::+ ,
HttpStatusCode::- ;
.::; <
Conflict::< D
,::D E
contentType::F Q
:::Q R
$str::S e
,::e f
bodyType::g o
:::o p
typeof::q w
(::w x
ResponseResult	::x Ü
)
::Ü á
,
::á à
Description
::â î
=
::ï ñ
$str
::ó ¢
)
::¢ £
]
::£ §
[;; 	#
OpenApiResponseWithBody;;	  
(;;  !

statusCode;;! +
:;;+ ,
HttpStatusCode;;- ;
.;;; <

BadRequest;;< F
,;;F G
contentType;;H S
:;;S T
$str;;U g
,;;g h
bodyType;;i q
:;;q r
typeof;;s y
(;;y z
ResponseResult	;;z à
)
;;à â
,
;;â ä
Description
;;ã ñ
=
;;ó ò
$str
;;ô ¶
)
;;¶ ß
]
;;ß ®
[<< 	#
OpenApiResponseWithBody<<	  
(<<  !

statusCode<<! +
:<<+ ,
HttpStatusCode<<- ;
.<<; <
InternalServerError<<< O
,<<O P
contentType<<Q \
:<<\ ]
$str<<^ p
,<<p q
bodyType<<r z
:<<z {
typeof	<<| Ç
(
<<Ç É
ResponseResult
<<É ë
)
<<ë í
,
<<í ì
Description
<<î ü
=
<<† °
$str
<<¢ ∏
)
<<∏ π
]
<<π ∫
public== 
async== 
Task== 
<== 
IActionResult== '
>==' (
CancelarCita==) 5
(==5 6
[>> 
HttpTrigger>> 
(>> 
AuthorizationLevel>> +
.>>+ ,
Function>>, 4
,>>4 5
$str>>6 ;
,>>; <
Route>>= B
=>>C D
$str>>E X
)>>X Y
]>>Y Z
HttpRequest>>[ f
req>>g j
)>>j k
{?? 	
try@@ 
{AA 
varBB 
jsonBB 
=BB 
awaitBB  
reqBB! $
.BB$ %
ReadAsStringAsyncBB% 6
(BB6 7
)BB7 8
;BB8 9
CancelacionInputCC  
requestCC! (
=CC) *
JsonConvertCC+ 6
.CC6 7
DeserializeObjectCC7 H
<CCH I
CancelacionInputCCI Y
>CCY Z
(CCZ [
jsonCC[ _
)CC_ `
;CC` a
varEE 
validationResultEE $
=EE% &

_validatorEE' 1
.EE1 2
ValidateEE2 :
(EE: ;
requestEE; B
)EEB C
;EEC D
ifFF 
(FF 
validationResultFF $
.FF$ %
IsValidFF% ,
)FF, -
{GG 
MallaDtoHH 
mallaHH "
=HH# $
_mapperHH% ,
.HH, -
MapHH- 0
<HH0 1
MallaDtoHH1 9
>HH9 :
(HH: ;
requestHH; B
)HHB C
;HHC D
ListII 
<II 
CancelacionDtoII '
>II' (
citasCanceladasII) 8
=II9 :
awaitII; @
_unitOfWorkIIA L
.IIL M
MallaRepositoryIIM \
.II\ ]#
ObtenerHorasCancelacionII] t
(IIt u
mallaIIu z
,IIz {
request	II| É
.
IIÉ Ñ
	IdTramite
IIÑ ç
)
IIç é
;
IIé è
varKK 
horasKK 
=KK 
citasCanceladasKK  /
.KK/ 0
SelectKK0 6
(KK6 7
citaKK7 ;
=>KK< >
newKK? B
{KKC D
citaKKE I
.KKI J

HoraInicioKKJ T
,KKT U
citaKKV Z
.KKZ [
TramitesKK[ c
,KKc d
citaKKe i
.KKi j
CantidadPersonasKKj z
}KK{ |
)KK| }
;KK} ~
foreachMM 
(MM 
varMM  
horaMM! %
inMM& (
horasMM) .
)MM. /
{NN 
boolOO 
activarAgendaOO *
=OO+ ,
(OO- .
horaOO. 2
.OO2 3
CantidadPersonasOO3 C
>=OOD F
(OOG H
horaOOH L
.OOL M
TramitesOOM U
.OOU V
LengthOOV \
-OO] ^
$numOO_ `
)OO` a
)OOa b
;OOb c
awaitPP 
_unitOfWorkPP )
.PP) *
MallaRepositoryPP* 9
.PP9 :
CancelarCitaPP: F
(PPF G
mallaPPG L
,PPL M
horaPPN R
.PPR S

HoraInicioPPS ]
,PP] ^
horaPP_ c
.PPc d
TramitesPPd l
,PPl m
requestPPn u
.PPu v
	IdTramitePPv 
,	PP Ä
request
PPÅ à
.
PPà â
	IdUsuario
PPâ í
,
PPí ì
activarAgenda
PPî °
)
PP° ¢
;
PP¢ £
}QQ 
awaitSS 
_unitOfWorkSS %
.SS% &
TramiteRepositorySS& 7
.SS7 8
AgregarEstadoSS8 E
(SSE F
requestSSF M
.SSM N
	IdUsuarioSSN W
,SSW X
requestSSY `
.SS` a
	IdTramiteSSa j
,SSj k
newSSl o
(SSo p
)SSp q
{SSr s
NombreEstado	SSt Ä
=
SSÅ Ç
_configuration
SSÉ ë
[
SSë í
$str
SSí ß
]
SSß ®
}
SS© ™
)
SS™ ´
;
SS´ ¨
CitasDtoUU 
citaUU !
=UU" #
awaitUU$ )
_unitOfWorkUU* 5
.UU5 6
TramiteRepositoryUU6 G
.UUG H
ObtenerCitaUUH S
(UUS T
requestUUT [
.UU[ \
	IdUsuarioUU\ e
,UUe f
requestUUg n
.UUn o
	IdTramiteUUo x
)UUx y
;UUy z
SedeDtoVV 
sedeVV  
=VV! "
awaitVV# (
_unitOfWorkVV) 4
.VV4 5
SedeRepositoryVV5 C
.VVC D
ObtenerDatosSedeVVD T
(VVT U
citaVVU Y
.VVY Z
PkSedeVVZ `
,VV` a
citaVVb f
.VVf g
	PkSubSedeVVg p
)VVp q
;VVq r
ServicioDtoWW 
servicioWW  (
=WW) *
awaitWW+ 0
_unitOfWorkWW1 <
.WW< =
ServicioRepositoryWW= O
.WWO P+
ObtenerTiempodeAtencionServicioWWP o
(WWo p
citaWWp t
.WWt u

PkServicioWWu 
)	WW Ä
;
WWÄ Å

UsuarioDtoXX 
userXX #
=XX$ %
awaitXX& +
_unitOfWorkXX, 7
.XX7 8
UsuarioRepositoryXX8 I
.XXI J
ObtenerUsuarioXXJ X
(XXX Y
requestXXY `
.XX` a
	IdUsuarioXXa j
)XXj k
;XXk l

ValoresDtoZZ 
valuesZZ %
=ZZ& '
newZZ( +
(ZZ+ ,
)ZZ, -
{[[ 
IdUser\\ 
=\\  
request\\! (
.\\( )
	IdUsuario\\) 2
,\\2 3
	IdTramite]] !
=]]" #
request]]$ +
.]]+ ,
	IdTramite]], 5
,]]5 6
Nombre^^ 
=^^  
user^^! %
.^^% &
Nombres^^& -
,^^- .
	Direccion__ !
=__" #
string__$ *
.__* +
Concat__+ 1
(__1 2
sede__2 6
.__6 7

NombreSede__7 A
,__A B
$str__C I
,__I J
sede``2 6
.``6 7
	Direccion``7 @
,``@ A
$str``B H
,``H I
sedeaa2 6
.aa6 7
NombreSubSedeaa7 D
)aaD E
,aaE F
NombreServiciobb &
=bb' (
serviciobb) 1
.bb1 2
nombreServiciobb2 @
,bb@ A
Fechacc 
=cc 
citacc  $
.cc$ %
FechaAgendamientocc% 6
,cc6 7
Horadd 
=dd 
citadd #
.dd# $
HoraAgendamientodd$ 4
,dd4 5
Tiempoee 
=ee  
$"ee! #
{ee# $
citaee$ (
.ee( )
DuracionServicioee) 9
}ee9 :
$stree: >
"ee> ?
}ff 
;ff 
awaithh 
_messageServicehh )
.hh) *
CrearMensajehh* 6
(hh6 7
userhh7 ;
.hh; <
CorreoElectronicohh< M
,hhM N
valueshhO U
,hhU V
	OPERACIONhhW `
)hh` a
;hha b
returnjj 
HttpResponseHelperjj -
.jj- .
Responsejj. 6
(jj6 7
StatusCodesjj7 B
.jjB C
Status200OKjjC N
,jjN O
newjjP S
ResponseResultjjT b
(jjb c
)jjc d
{kk 
IsErrorll 
=ll  !
falsell" '
,ll' (
Messagemm 
=mm  !
$strmm" @
}nn 
)nn 
;nn 
}oo 
elsepp 
{qq 
returnrr 
HttpResponseHelperrr -
.rr- .
Responserr. 6
(rr6 7
StatusCodesrr7 B
.rrB C
Status400BadRequestrrC V
,rrV W
newrrX [
ResponseResultrr\ j
(rrj k
)rrk l
{ss 
IsErrortt 
=tt  !
truett" &
,tt& '
Messageuu 
=uu  !
validationResultuu" 2
.uu2 3
Errorsuu3 9
.uu9 :
Firstuu: ?
(uu? @
)uu@ A
.uuA B
ErrorMessageuuB N
}vv 
)vv 
;vv 
}ww 
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy  
{zz 
return{{ 
HttpResponseHelper{{ )
.{{) *
Response{{* 2
({{2 3
StatusCodes{{3 >
.{{> ?(
Status500InternalServerError{{? [
,{{[ \
new{{] `
ResponseResult{{a o
({{o p
){{p q
{{{r s
IsError{{t {
={{| }
true	{{~ Ç
,
{{Ç É
Message
{{Ñ ã
=
{{å ç
ex
{{é ê
.
{{ê ë
Message
{{ë ò
}
{{ô ö
)
{{ö õ
;
{{õ ú
}|| 
}}} 	
}~~ 
} ãO
[C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\FxListarCitas.cs
	namespace 	
FxAgendamiento
 
{ 
public 

class 
FxListarCitas 
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
FxListarCitas 
( 
IUnitOfWork (

unitOfWork) 3
)3 4
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
[   	
FunctionName  	 
(   
nameof   
(   
ListarCitas   (
)  ( )
)  ) *
]  * +
[!! 	
FixedDelayRetry!!	 
(!! 
$num!! 
,!! 
$str!! &
)!!& '
]!!' (
["" 	
OpenApiOperation""	 
("" 
operationId"" %
:""% &
$str""' 4
,""4 5
tags""6 :
:"": ;
new""< ?
[""? @
]""@ A
{""B C
$str""D R
}""S T
,""T U
Description""V a
=""b c
$str	""d å
,
""å ç
Summary
""é ï
=
""ñ ó
$str
""ò «
)
""« »
]
""» …
[## 	
OpenApiSecurity##	 
(## 
$str## '
,##' (
SecuritySchemeType##) ;
.##; <
ApiKey##< B
,##B C
Name##D H
=##I J
$str##K Q
,##Q R
In##S U
=##V W'
OpenApiSecurityLocationType##X s
.##s t
Query##t y
)##y z
]##z {
[$$ 	
OpenApiRequestBody$$	 
($$ 
contentType$$ '
:$$' (
$str$$) ;
,$$; <
bodyType$$= E
:$$E F
typeof$$G M
($$M N
AgendaInput$$N Y
)$$Y Z
,$$Z [
Required$$\ d
=$$e f
true$$g k
,$$k l
Description$$m x
=$$y z
$str	$${ è
)
$$è ê
]
$$ê ë
[%% 	#
OpenApiResponseWithBody%%	  
(%%  !

statusCode%%! +
:%%+ ,
HttpStatusCode%%- ;
.%%; <
Created%%< C
,%%C D
contentType%%E P
:%%P Q
$str%%R d
,%%d e
bodyType%%f n
:%%n o
typeof%%p v
(%%v w
ResponseResult	%%w Ö
)
%%Ö Ü
,
%%Ü á
Description
%%à ì
=
%%î ï
$str
%%ñ ≠
)
%%≠ Æ
]
%%Æ Ø
[&& 	#
OpenApiResponseWithBody&&	  
(&&  !

statusCode&&! +
:&&+ ,
HttpStatusCode&&- ;
.&&; <
Conflict&&< D
,&&D E
contentType&&F Q
:&&Q R
$str&&S e
,&&e f
bodyType&&g o
:&&o p
typeof&&q w
(&&w x
ResponseResult	&&x Ü
)
&&Ü á
,
&&á à
Description
&&â î
=
&&ï ñ
$str
&&ó ¢
)
&&¢ £
]
&&£ §
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
>))' (
ListarCitas))) 4
())4 5
[** 
HttpTrigger** 
(** 
AuthorizationLevel** +
.**+ ,
Function**, 4
,**4 5
$str**6 ;
,**; <
Route**= B
=**C D
$str**E c
)**c d
]**d e
HttpRequest**f q
req**r u
,**u v
string**w }
	idUsuario	**~ á
)
**á à
{++ 	
try,, 
{-- 
List.. 
<.. 
ResposeTramite.. #
>..# $
tramites..% -
=... /
new..0 3
(..3 4
)..4 5
{..6 7
}..8 9
;..9 :
List// 
<// 
CitasDto// 
>// 
citas// $
=//% &
await//' ,
_unitOfWork//- 8
.//8 9
TramiteRepository//9 J
.//J K
ObtenerCitas//K W
(//W X
	idUsuario//X a
)//a b
;//b c
foreach00 
(00 
CitasDto00 !
cita00" &
in00' )
citas00* /
)00/ 0
{11 
ServicioDto33 
?33  
servicio33! )
=33* +
await33, 1
_unitOfWork332 =
.33= >
ServicioRepository33> P
.33P Q+
ObtenerTiempodeAtencionServicio33Q p
(33p q
cita33q u
.33u v

PkServicio	33v Ä
)
33Ä Å
;
33Å Ç
SedeDto44 
?44 
sede44 !
=44" #
await44$ )
_unitOfWork44* 5
.445 6
SedeRepository446 D
.44D E
ObtenerDatosSede44E U
(44U V
cita44V Z
.44Z [
PkSede44[ a
,44a b
cita44c g
.44g h
	PkSubSede44h q
)44q r
;44r s

UsuarioDto55 
?55 
usuario55  '
=55( )
await55* /
_unitOfWork550 ;
.55; <
UsuarioRepository55< M
.55M N
ObtenerUsuario55N \
(55\ ]
cita55] a
.55a b
Id55b d
)55d e
;55e f
tramites77 
.77 
Add77  
(77  !
new77! $
ResposeTramite77% 3
(773 4
)774 5
{88 
	IdTramite99 !
=99" #
cita99$ (
.99( )
	PkTramite99) 2
,992 3
Activo:: 
=::  
cita::! %
.::% &
Activo::& ,
,::, -
IdMalla;; 
=;;  !
cita;;" &
.;;& '
PkMalla;;' .
,;;. /
IdSede<< 
=<<  
cita<<! %
.<<% &
PkSede<<& ,
,<<, -
	IdSubsede== !
===" #
cita==$ (
.==( )
	PkSubSede==) 2
,==2 3

EstadoCita>> "
=>># $
cita>>% )
.>>) *
NombreEstado>>* 6
,>>6 7
CorreoElectronico?? )
=??* +
usuario??, 3
???3 4
.??4 5
CorreoElectronico??5 F
,??F G
Fecha@@ 
=@@ 
cita@@  $
.@@$ %
FechaAgendamiento@@% 6
,@@6 7
HoraAA 
=AA 
citaAA #
.AA# $
HoraAgendamientoAA$ 4
,AA4 5
NombresApellidosBB (
=BB) *
usuarioBB+ 2
?BB2 3
.BB3 4
NombresBB4 ;
,BB; <
NumeroDocumentoCC '
=CC( )
usuarioCC* 1
?CC1 2
.CC2 3 
NumeroIdentificacionCC3 G
,CCG H
PuntoAtencionDD %
=DD& '
sedeDD( ,
?DD, -
.DD- .

NombreSedeDD. 8
!=DD8 :
nullDD: >
?DD? @
stringDDA G
.DDG H
ConcatDDH N
(DDN O
sedeDDO S
?DDS T
.DDT U

NombreSedeDDU _
,DD_ `
$strDDa f
,DDf g
sedeDDh l
?DDl m
.DDm n
NombreSubSedeDDn {
)DD{ |
:DD| }
sede	DD~ Ç
?
DDÇ É
.
DDÉ Ñ

NombreSede
DDÑ é
,
DDé è
TipoPagoEE  
=EE! "
servicioEE# +
?EE+ ,
.EE, -
tipoPagoEE- 5
,EE5 6
TramiteFF 
=FF  !
servicioFF" *
?FF* +
.FF+ ,
nombreServicioFF, :
,FF: ;
TramiteVirtualGG &
=GG' (
servicioGG) 1
?GG1 2
.GG2 3
tramiteVirtualGG3 A
,GGA B
DuracionServicioHH (
=HH) *
servicioHH+ 3
?HH3 4
.HH4 5
tiempoAtencionHH5 C
!=HHC E
nullHHE I
?HHI J
stringHHK Q
.HHQ R
ConcatHHR X
(HHX Y
servicioHHY a
?HHa b
.HHb c
tiempoAtencionHHc q
,HHq r
$strHHs y
)HHy z
:HHz {
null	HH| Ä
}II 
)II 
;II 
}LL 
returnNN 
HttpResponseHelperNN )
.NN) *
ResponseNN* 2
(NN2 3
StatusCodesNN3 >
.NN> ?
Status200OKNN? J
,NNJ K
tramitesNNL T
)NNT U
;NNU V
}OO 
catchPP 
(PP 
	ExceptionPP 
exPP 
)PP  
{QQ 
returnRR 
HttpResponseHelperRR )
.RR) *
ResponseRR* 2
(RR2 3
StatusCodesRR3 >
.RR> ?(
Status500InternalServerErrorRR? [
,RR[ \
newRR] `
ResponseResultRRa o
(RRo p
)RRp q
{RRr s
IsErrorRRt {
=RR| }
true	RR~ Ç
,
RRÇ É
Message
RRÑ ã
=
RRå ç
ex
RRé ê
.
RRê ë
Message
RRë ò
}
RRô ö
)
RRö õ
;
RRõ ú
}SS 
}TT 	
}YY 
}ZZ ü
eC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Interfaces\IHttpService.cs
	namespace 	
FxAgendamiento
 
. 

Interfaces #
{ 
public 

	interface 
IHttpService !
{ 
public 
Task 
< 
HttpResponseMessage '
>' (
GetAsync) 1
(1 2
string2 8
data9 =
)= >
;> ?
public

 
string

 
ConstruirURL

 "
(

" #
string

# )
data

* .
)

. /
;

/ 0
} 
} µ
hC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Interfaces\IMessageService.cs
	namespace 	
FxAgendamiento
 
. 

Interfaces #
{ 
public		 

	interface		 
IMessageService		 $
{

 
IServiceBusService 

ServiceBus %
{& '
get( +
;+ ,
}- .
public 
Task 
CrearMensaje  
(  !
string! '
email( -
,- .

ValoresDto/ 9
values: @
,@ A
stringB H
	operacionI R
)R S
;S T
public 

Dictionary 
< 
string  
,  !
string" (
>( )#
GetDictionaryParameters* A
(A B

ValoresDtoB L
valuesM S
,S T
PlantillaDtoU a
	plantillab k
,k l
stringm s
	operaciont }
)} ~
;~ 
public 
	Parametro 
[ 
] 
ConstruirParametros .
(. /
PlantillaDto/ ;
	plantilla< E
,E F

ValoresDtoG Q
valuesR X
,X Y
stringZ `
	operaciona j
)j k
;k l
public 
Task 
< 
RequestEnvioMail $
>$ %
ConstruirRequest& 6
(6 7
string7 =
email> C
,C D

ValoresDtoE O
valuesP V
,V W
stringX ^
	operacion_ h
)h i
;i j
public 
string 
ObtenerCodigoQR %
(% &
string& ,
cadena- 3
)3 4
;4 5
public 
string 
ConstruirURL "
(" #
PlantillaDto# /
	plantilla0 9
,9 :

ValoresDto; E
valuesF L
)L M
;M N
} 
} †
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Interfaces\IServiceBusService.cs
	namespace 	
FxAgendamiento
 
. 

Interfaces #
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
} 
{C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Interfaces\RepositoryPattern\IEmailRepository.cs
	namespace 	
FxAgendamiento
 
. 

Interfaces #
.# $
RepositoryPattern$ 5
{ 
public 

	interface 
IEmailRepository %
{ 
public		 
Task		 
<		 
PlantillaDto		  
>		  !)
ObtenerConfiguracionPlantilla		" ?
(		? @
string		@ F
nombre_cliente		G U
,		U V
string		W ]
nombre_servicio		^ m
,		m n
string		o u
nombre_plantilla			v Ü
)
		Ü á
;
		á à
}

 
} ÷
{C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Interfaces\RepositoryPattern\IMallaRepository.cs
	namespace 	
FxAgendamiento
 
. 

Interfaces #
.# $
RepositoryPattern$ 5
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
InactivarTiempos

 $
(

$ %
MallaDto

% -
data

. 2
,

2 3
string

4 :

horaInicio

; E
,

E F
string

G M
	idUsuario

N W
,

W X
bool

Y ]
inactivarAgenda

^ m
)

m n
;

n o
public 
Task 
< 
List 
< 

TramiteDto #
># $
>$ %
ValidarTiempos& 4
(4 5
MallaDto5 =
data> B
,B C
stringD J
[J K
]K L
horasM R
)R S
;S T
public 
Task 
< 
List 
< 
int 
> 
> 
ObtenerIndices -
(- .
MallaDto. 6
data7 ;
,; <
string= C
horaD H
)H I
;I J
public 
Task 
< 
List 
< 
CancelacionDto '
>' (
>( )#
ObtenerHorasCancelacion* A
(A B
MallaDtoB J
dataK O
,O P
stringQ W
	idTramiteX a
)a b
;b c
public 
Task 
CancelarCita  
(  !
MallaDto! )
data* .
,. /
string0 6

horaInicio7 A
,A B
stringC I
[I J
]J K
tramitesL T
,T U
stringV \
	idTramite] f
,f g
stringh n
	idUsuarioo x
,x y
boolz ~
inactivarAgenda	 é
)
é è
;
è ê
public 
Task 
< 
bool 
> 

ExistMalla $
($ %
string% +
idMalla, 3
)3 4
;4 5
public 
Task 
< 
List 
< 
	TiempoDto "
>" #
># $
ValidarEspacio% 3
(3 4
string4 :
idMalla; B
,B C
stringD J
idSedeK Q
,Q R
stringS Y
	idSubsedeZ c
,c d
stringe k
fechal q
)q r
;r s
} 
} À
zC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Interfaces\RepositoryPattern\ISedeRepository.cs
	namespace 	
FxAgendamiento
 
. 

Interfaces #
.# $
RepositoryPattern$ 5
{ 
public 

	interface 
ISedeRepository $
{ 
public		 
Task		 
<		 
SedeDto		 
>		 
ObtenerDatosSede		 -
(		- .
string		. 4
idSede		5 ;
,		; <
string		= C
	idSubsede		D M
)		M N
;		N O
public

 
Task

 
<

 
bool

 
>

 

ExisteSede

 $
(

$ %
string

% +
idSede

, 2
)

2 3
;

3 4
public 
Task 
< 
bool 
> 
ExisteSubSede '
(' (
string( .
idSede/ 5
,5 6
string6 <
	idSubSede= F
)F G
;G H
} 
} Ì
~C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Interfaces\RepositoryPattern\IServicioRepository.cs
	namespace 	
FxAgendamiento
 
. 

Interfaces #
.# $
RepositoryPattern$ 5
{ 
public 

	interface 
IServicioRepository (
{ 
public		 
Task		 
<		 
ServicioDto		 
>		  +
ObtenerTiempodeAtencionServicio		! @
(		@ A
string		A G

idServicio		H R
)		R S
;		S T
}

 
} ‡
}C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Interfaces\RepositoryPattern\ITramiteRepository.cs
	namespace 	
FxAgendamiento
 
. 

Interfaces #
.# $
RepositoryPattern$ 5
{ 
public		 

	interface		 
ITramiteRepository		 '
{

 
public 
Task 
CrearTramite  
(  !
Agenda! '
tramite( /
)/ 0
;0 1
public 
Task 
< 
ValidarTramiteDto %
>% &!
ValidarServicioActivo' <
(< =
string= C
	idUsuarioD M
,M N
stringO U

idServicioV `
)` a
;a b
public 
Task 
< 
SolicitudesDto "
>" #&
ValidarCantidadSolicitudes$ >
(> ?
string? E
	idUsuarioF O
)O P
;P Q
public 
Task 
< 
List 
< 
CitasDto !
>! "
>" #
ObtenerCitas$ 0
(0 1
string1 7
	idUsuario8 A
)A B
;B C
public 
Task 
< 
	EstadoDto 
> 
ValidarEstado ,
(, -
string- 3
	idUsuario4 =
,= >
string? E
	idTramiteF O
,O P
stringQ W
estadoX ^
)^ _
;_ `
public 
Task 
< 
string 
> 
AgregarEstado )
() *
string* 0
	idUsuario1 :
,: ;
string< B
	idTramiteC L
,L M
EstadoN T
estadoU [
)[ \
;\ ]
public 
Task 
< 
CitasDto 
> 
ObtenerCita )
() *
string* 0
	idUsuario1 :
,: ;
string< B
idCitaC I
)I J
;J K
public 
Task 
InactivarCita !
(! "
string" (
	idUsuario) 2
,2 3
string4 :
idCita; A
)A B
;B C
} 
} Ñ	
vC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Interfaces\RepositoryPattern\IUnitOfWork.cs
	namespace 	
FxAgendamiento
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
{ 
IMallaRepository 
MallaRepository (
{) *
get+ .
;. /
}0 1
ISedeRepository 
SedeRepository &
{' (
get) ,
;, -
}. /
ITramiteRepository		 
TramiteRepository		 ,
{		- .
get		/ 2
;		2 3
}		4 5
IServicioRepository 
ServicioRepository .
{/ 0
get1 4
;4 5
}6 7
IEmailRepository 
EmailRepository (
{) *
get+ .
;. /
}0 1
IUsuarioRepository 
UsuarioRepository ,
{- .
get/ 2
;2 3
}4 5
} 
} ÿ
}C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Interfaces\RepositoryPattern\IUsuarioRepository.cs
	namespace 	
FxAgendamiento
 
. 

Interfaces #
.# $
RepositoryPattern$ 5
{ 
public 

	interface 
IUsuarioRepository '
{ 
public		 
Task		 
<		 

UsuarioDto		 
>		 
ObtenerUsuario		  .
(		. /
string		/ 5
	IdUsuario		6 ?
)		? @
;		@ A
}

 
} ·
jC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Mappers\MappingProfileEstado.cs
	namespace

 	
FxAgendamiento


 
.

 
Mappers

  
{ 
public 

class  
MappingProfileEstado %
:& '
Profile( /
{ 
public  
MappingProfileEstado #
(# $
)$ %
{ 	
	CreateMap 
< 
NuevoEstadoInput &
,& '
Estado( .
>. /
(/ 0
)0 1
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
NombreEstado( 4
,4 5
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
Estado4 :
): ;
); <
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
FechaEstado( 3
,3 4
opt 
=>  
opt! $
.$ %
MapFrom% ,
(, -
src- 0
=>1 3
DateTime4 <
.< =
UtcNow= C
)C D
)D E
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (

IdCampania( 2
,2 3
opt 
=>  
opt! $
.$ %
MapFrom% ,
(, -
src- 0
=>1 3
src3 6
.6 7

IdCampania7 A
)A B
)B C
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
CodigoQr( 0
,0 1
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
QRCode4 :
): ;
); <
;< =
} 	
} 
} Œ
iC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Mappers\MappingProfileMalla.cs
	namespace 	
FxAgendamiento
 
. 
Mappers  
{ 
public 

class 
MappingProfileMalla $
:% &
Profile' .
{		 
public

 
MappingProfileMalla

 "
(

" #
)

# $
{ 	
	CreateMap 
< 
AgendaInput !
,! "
MallaDto# +
>+ ,
(, -
)- .
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
IdMalla( /
,/ 0
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
IdMalla4 ;
); <
)< =
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
IdSede( .
,. /
opt 
=>  
opt! $
.$ %
MapFrom% ,
(, -
src- 0
=>1 3
src4 7
.7 8
IdSede8 >
)> ?
)? @
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
	IdSubSede( 1
,1 2
opt 
=>  
opt! $
.$ %
MapFrom% ,
(, -
src- 0
=>1 3
src4 7
.7 8
	IdSubSede8 A
)A B
)B C
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Fecha( -
,- .
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
FechaAgendamiento4 E
)E F
)F G
;G H
	CreateMap 
< 
CancelacionInput &
,& '
MallaDto( 0
>0 1
(1 2
)2 3
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
IdMalla' .
,. /
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
src/ 2
.2 3
IdMalla3 :
): ;
); <
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
IdSede' -
,- .
opt 
=> 
opt  #
.# $
MapFrom$ +
(+ ,
src, /
=>0 2
src3 6
.6 7
IdSede7 =
)= >
)> ?
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
	IdSubSede' 0
,0 1
opt 
=> 
opt  #
.# $
MapFrom$ +
(+ ,
src, /
=>0 2
src3 6
.6 7
	IdSubSede7 @
)@ A
)A B
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
Fecha' ,
,, -
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
src/ 2
.2 3
	FechaCita3 <
)< =
)= >
;> ?
} 	
}   
}!! Ñ
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Mappers\MappingProfileTramite.cs
	namespace 	
FxAgendamiento
 
. 
Mappers  
{ 
public 

class !
MappingProfileTramite &
:' (
Profile) 0
{ 
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
public !
MappingProfileTramite $
($ %
)% &
{ 	
	CreateMap 
< 
AgendaInput !
,! "
Agenda# )
>) *
(* +
)+ ,
. 
	ForMember 
( 
dest 
=> 
dest  $
.$ %
Id% '
,' (
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
	IdUsuario4 =
)= >
)> ?
. 
	ForMember 
( 
dest 
=>  
dest! %
.% &
Tramites& .
,. /
options !
=>" $
options% ,
., -
MapFrom- 4
(4 5
src5 8
=>9 ;
new< ?
Tramite@ G
[G H
]H I
{J K
new  
Tramite! (
(( )
)) *
{  !
PkSede$ *
=+ ,
src- 0
.0 1
IdSede1 7
,7 8
	PkSubSede$ -
=. /
src0 3
.3 4
	IdSubSede4 =
,= >
PkMalla$ +
=, -
src. 1
.1 2
IdMalla2 9
,9 :
FechaRegistro$ 1
=2 3
DateTime4 <
.< =
UtcNow= C
,C D

IpRegistro  $ .
=  / 0
src  1 4
.  4 5
Ip  5 7
,  7 8
Activo!!$ *
=!!+ ,
true!!- 1
,!!1 2
Servicio""$ ,
=""- .
new""/ 2
Servicio""3 ;
(""; <
)""< =
{##$ %

PkServicio$$( 2
=$$3 4
src$$5 8
.$$8 9

IdServicio$$9 C
,$$C D
FechaAgendamiento%%( 9
=%%: ;
src%%< ?
.%%? @
FechaAgendamiento%%@ Q
,%%Q R
HoraAgendamiento&&( 8
=&&9 :
src&&; >
.&&> ?
HoraAgendamiento&&? O
}''$ %
,''% &
Estados(($ +
=((, -
new((. 1
List((2 6
<((6 7
Estado((7 =
>((= >
{))$ %
new**( +
Estado**, 2
(**2 3
)**3 4
{++( )
FechaEstado--, 7
=--8 9
DateTime--: B
.--B C
UtcNow--C I
}..( )
}//$ %
}00  !
}11 
)11 
)11 
;11 
}22 	
}66 
}77 ¿
yC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\ActualizacionDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 
	EstadoDto 
{ 
public 
string 
id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
	pkTramite 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
estado 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 ∑
wC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\CancelacionDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 
CancelacionDto 
{ 
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
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
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str (
)( )
]) *
public 
bool 
AgendaDisponible $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
JsonProperty	 
( 
$str (
)( )
]) *
public 
long 
CantidadPersonas $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
JsonProperty	 
( 
$str  
)  !
]! "
public 
string 
[ 
] 
Tramites  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ™
qC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\CitasDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 
CitasDto 
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
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
JsonProperty	 
( 
$str $
)$ %
]% &
public 
string 
NombreEstado "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	PkTramite 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
)  
]  !
public 
string 
PkMalla 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
string 
PkSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	PkSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public 
string 

PkServicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
JsonProperty	 
( 
$str )
)) *
]* +
public   
string   
FechaAgendamiento   '
{  ( )
get  * -
;  - .
set  / 2
;  2 3
}  4 5
["" 	
JsonProperty""	 
("" 
$str"" (
)""( )
]"") *
public## 
string## 
HoraAgendamiento## &
{##' (
get##) ,
;##, -
set##. 1
;##1 2
}##3 4
[%% 	
JsonProperty%%	 
(%% 
$str%% (
)%%( )
]%%) *
public&& 
long&& 
DuracionServicio&& $
{&&% &
get&&' *
;&&* +
set&&, /
;&&/ 0
}&&1 2
}'' 
}(( ◊
qC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\MallaDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 
MallaDto 
{ 
public 
string 
IdMalla 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
IdSede 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
	IdSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Fecha 
{ 
get !
;! "
set# &
;& '
}( )
}		 
}

 •

uC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\PlantillaDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 
PlantillaDto 
{ 
public 
long 
cliente 
{ 
get !
;! "
set# &
;& '
}( )
public 
long 
servicio 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
long		 
	plantilla		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public 
bool 
es_dinamica 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
orden_parametros &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
param_url_base $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} â
pC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\SedeDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 
SedeDto 
{ 
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public 
string 

NombreSede  
{! "
get# &
;& '
set( +
;+ ,
}- .
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
 !
)

! "
]

" #
public 
string 
	Direccion 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str %
)% &
]& '
public 
string 
NombreSubSede #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
JsonProperty	 
( 
$str )
)) *
]* +
public 
long 
IntervaloAtencion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} 
tC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\ServicioDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 
ServicioDto 
{ 
public 
string 
nombreServicio $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
long 
tiempoAtencion "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
tramiteVirtual "
{# $
get% (
;( )
set* -
;- .
}/ 0
public

 
string

 
tipoPago

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
} 
} Ö
wC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\SolicitudesDtp.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 
SolicitudesDto 
{ 
[ 	
JsonProperty	 
( 
$str +
)+ ,
], -
public 
long 
CantidadSolicitudes '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
}		 
}

 Ω	
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\TiemposDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

partial 
class 
	TiempoDto "
{ 
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public		 
string		 

HoraInicio		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
[ 	
JsonProperty	 
( 
$str (
)( )
]) *
public 
bool 
AgendaDisponible $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
JsonProperty	 
( 
$str '
)' (
]( )
public 
string 
[ 
] 
UsuariosVetados '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} ß	
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\TramiteDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 

TramiteDto 
{ 
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
AgendaDisponible $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
long 
CantidadPersonas $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
string		 
[		 
]		 
Tramites		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
}

 
} ı
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\UsuarioDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 

UsuarioDto 
{ 
public 
string 
	IdUsuario 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string  
NumeroIdentificacion *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
Nombres 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
CorreoElectronico '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
}		 
}

 á	
zC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\ValidarTramiteDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 
ValidarTramiteDto "
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
 !
)

! "
]

" #
public 
string 
	PkTramite 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public 
string 

PkServicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ‚
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\DataTransferObjects\ValoresDto.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
DataTransferObjects  3
{ 
public 

class 

ValoresDto 
{ 
public 
string 
IdUser 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
	IdTramite 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
	Direccion 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string		 
NombreServicio		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
string

 
Fecha

 
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
( )
public 
string 
Hora 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Tiempo 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ô4
cC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\Entities\Malla.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
Entities  (
{ 
public 

partial 
class 
Malla 
{		 
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
 
)

 
]

 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
string 
PkSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str #
)# $
]$ %
public 
string 
FechaInicio !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
JsonProperty	 
( 
$str  
)  !
]! "
public 
string 
FechaFin 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
JsonProperty	 
( 
$str '
)' (
]( )
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 	
JsonProperty	 
( 
$str %
)% &
]& '
public 
DateTimeOffset 
FechaCreacion +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[ 	
JsonProperty	 
( 
$str +
)+ ,
], -
public   
object   
UsuarioModificacion   )
{  * +
get  , /
;  / 0
set  1 4
;  4 5
}  6 7
["" 	
JsonProperty""	 
("" 
$str"" )
)"") *
]""* +
public## 
DateTimeOffset## 
FechaModificacion## /
{##0 1
get##2 5
;##5 6
set##7 :
;##: ;
}##< =
[%% 	
JsonProperty%%	 
(%% 
$str%% (
)%%( )
]%%) *
public&& 
List&& 
<&& 
MallasPorSubSede&& $
>&&$ %
MallasPorSubSede&&& 6
{&&7 8
get&&9 <
;&&< =
set&&> A
;&&A B
}&&C D
}'' 
public)) 

partial)) 
class)) 
MallasPorSubSede)) )
{** 
[++ 	
JsonProperty++	 
(++ 
$str++ !
)++! "
]++" #
public,, 
string,, 
	PkSubSede,, 
{,,  !
get,," %
;,,% &
set,,' *
;,,* +
},,, -
[.. 	
JsonProperty..	 
(.. 
$str.. '
)..' (
]..( )
public// 
List// 
<// 
TiemposAtencion// #
>//# $
TiemposAtencion//% 4
{//5 6
get//7 :
;//: ;
set//< ?
;//? @
}//A B
}00 
public22 

partial22 
class22 
TiemposAtencion22 (
{33 
[44 	
JsonProperty44	 
(44 
$str44 
)44 
]44 
public55 
string55 
Fecha55 
{55 
get55 !
;55! "
set55# &
;55& '
}55( )
[77 	
JsonProperty77	 
(77 
$str77 !
)77! "
]77" #
public88 
string88 
	DiaSemana88 
{88  !
get88" %
;88% &
set88' *
;88* +
}88, -
[:: 	
JsonProperty::	 
(:: 
$str:: 
)::  
]::  !
public;; 
List;; 
<;; 
Tiempo;; 
>;; 
Tiempos;; #
{;;$ %
get;;& )
;;;) *
set;;+ .
;;;. /
};;0 1
}<< 
public>> 

partial>> 
class>> 
Tiempo>> 
{?? 
[@@ 	
JsonProperty@@	 
(@@ 
$str@@ "
)@@" #
]@@# $
publicAA 
stringAA 

HoraInicioAA  
{AA! "
getAA# &
;AA& '
setAA( +
;AA+ ,
}AA- .
[CC 	
JsonPropertyCC	 
(CC 
$strCC 
)CC  
]CC  !
publicDD 
stringDD 
HoraFinDD 
{DD 
getDD  #
;DD# $
setDD% (
;DD( )
}DD* +
[FF 	
JsonPropertyFF	 
(FF 
$strFF (
)FF( )
]FF) *
publicGG 
boolGG 
AgendaDisponibleGG $
{GG% &
getGG' *
;GG* +
setGG, /
;GG/ 0
}GG1 2
[II 	
JsonPropertyII	 
(II 
$strII (
)II( )
]II) *
publicJJ 
longJJ 
CantidadPersonasJJ $
{JJ% &
getJJ' *
;JJ* +
setJJ, /
;JJ/ 0
}JJ1 2
[LL 	
JsonPropertyLL	 
(LL 
$strLL  
,LL  !
RequiredLL" *
=LL+ ,
RequiredLL- 5
.LL5 6
DefaultLL6 =
)LL= >
]LL> ?
publicMM 
stringMM 
[MM 
]MM 
TramitesMM  
{MM! "
getMM# &
;MM& '
setMM( +
;MM+ ,
}MM- .
[OO 	
JsonPropertyOO	 
(OO 
$strOO '
,OO' (
RequiredOO) 1
=OO2 3
RequiredOO4 <
.OO< =
DefaultOO= D
)OOD E
]OOE F
publicPP 
stringPP 
[PP 
]PP 
UsuariosVetadosPP '
{PP( )
getPP* -
;PP- .
setPP/ 2
;PP2 3
}PP4 5
}QQ 
}RR ≠/
eC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\Entities\Tramite.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
Entities  (
{ 
public 

partial 
class 
Agenda 
{		 
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
 
)

 
]

 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
[ 	
JsonProperty	 
( 
$str  
)  !
]! "
public 
List 
< 
Tramite 
> 
Tramites %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
public 

partial 
class 
Tramite  
{ 
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	PkTramite 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
string 
PkSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	PkSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
)  
]  !
public 
string 
PkMalla 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str %
)% &
]& '
public   
DateTimeOffset   
FechaRegistro   +
{  , -
get  . 1
;  1 2
set  3 6
;  6 7
}  8 9
["" 	
JsonProperty""	 
("" 
$str"" "
)""" #
]""# $
public## 
string## 

IpRegistro##  
{##! "
get### &
;##& '
set##( +
;##+ ,
}##- .
[%% 	
JsonProperty%%	 
(%% 
$str%% 
)%% 
]%%  
public&& 
bool&& 
Activo&& 
{&& 
get&&  
;&&  !
set&&" %
;&&% &
}&&' (
[(( 	
JsonProperty((	 
((( 
$str((  
)((  !
]((! "
public)) 
Servicio)) 
Servicio))  
{))! "
get))# &
;))& '
set))( +
;))+ ,
}))- .
[++ 	
JsonProperty++	 
(++ 
$str++ 
)++  
]++  !
public,, 
List,, 
<,, 
Estado,, 
>,, 
Estados,, #
{,,$ %
get,,& )
;,,) *
set,,+ .
;,,. /
},,0 1
}-- 
public// 

partial// 
class// 
Estado// 
{00 
[11 	
JsonProperty11	 
(11 
$str11 $
)11$ %
]11% &
public22 
string22 
NombreEstado22 "
{22# $
get22% (
;22( )
set22* -
;22- .
}22/ 0
[44 	
JsonProperty44	 
(44 
$str44 #
)44# $
]44$ %
public55 
DateTimeOffset55 
FechaEstado55 )
{55* +
get55, /
;55/ 0
set551 4
;554 5
}556 7
[88 	
JsonProperty88	 
(88 
$str88 "
,88" #
NullValueHandling88$ 5
=886 7
NullValueHandling888 I
.88I J
Ignore88J P
)88P Q
]88Q R
public99 
string99 
?99 

IdCampania99 !
{99" #
get99$ '
;99' (
set99) ,
;99, -
}99. /
[;; 	
JsonProperty;;	 
(;; 
$str;;  
,;;  !
NullValueHandling;;" 3
=;;4 5
NullValueHandling;;6 G
.;;G H
Ignore;;H N
);;N O
];;O P
public<< 
string<< 
?<< 
CodigoQr<< 
{<<  !
get<<" %
;<<% &
set<<' *
;<<* +
}<<, -
}>> 
public@@ 

partial@@ 
class@@ 
Servicio@@ !
{AA 
[BB 	
JsonPropertyBB	 
(BB 
$strBB "
)BB" #
]BB# $
publicCC 
stringCC 

PkServicioCC  
{CC! "
getCC# &
;CC& '
setCC( +
;CC+ ,
}CC- .
[EE 	
JsonPropertyEE	 
(EE 
$strEE )
)EE) *
]EE* +
publicFF 
stringFF 
FechaAgendamientoFF '
{FF( )
getFF* -
;FF- .
setFF/ 2
;FF2 3
}FF4 5
[HH 	
JsonPropertyHH	 
(HH 
$strHH (
)HH( )
]HH) *
publicII 
stringII 
HoraAgendamientoII &
{II' (
getII) ,
;II, -
setII. 1
;II1 2
}II3 4
[KK 	
JsonPropertyKK	 
(KK 
$strKK (
)KK( )
]KK) *
publicLL 
longLL 
DuracionServicioLL $
{LL% &
getLL' *
;LL* +
setLL, /
;LL/ 0
}LL1 2
}MM 
}NN ¥
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\EnvioMail\Agendamiento.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
	EnvioMail  )
{ 
public 

class 
Agendamiento 
{ 
public 
string 
	IdUsuario 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
	IdTramite 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Estado 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}		 ›
hC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\EnvioMail\Parametro.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
	EnvioMail  )
{ 
public 

class 
	Parametro 
{ 
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
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
 
)

 
]

 
public 
string 
Valor 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ¿
oC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\EnvioMail\RequestEnvioMail.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
	EnvioMail  )
{ 
public 

class 
RequestEnvioMail !
{ 
[ 	
JsonProperty	 
( 
$str 
, 
Required  (
=) *
Required+ 3
.3 4
Always4 :
): ;
]; <
public 
string 
Fuente 
{ 
get "
;" #
set$ '
;' (
}) *
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
 !
,

! "
Required

# +
=

, -
Required

. 6
.

6 7
Always

7 =
)

= >
]

> ?
public 
string 
	IdCliente 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str "
," #
Required$ ,
=- .
Required/ 7
.7 8
Always8 >
)> ?
]? @
public 
string 

IdServicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
JsonProperty	 
( 
$str "
," #
Required$ ,
=- .
Required/ 7
.7 8
Always8 >
)> ?
]? @
public 
string 

IdTemplate  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
JsonProperty	 
( 
$str $
,$ %
Required& .
=/ 0
Required1 9
.9 :
Always: @
)@ A
]A B
public 
string 
Destinatario "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
JsonProperty	 
( 
$str +
,+ ,
Required- 5
=6 7
Required8 @
.@ A
AlwaysA G
)G H
]H I
public 
string 
MascaraDestinatario )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
JsonProperty	 
( 
$str $
,$ %
Required& .
=/ 0
Required1 9
.9 :
Default: A
)A B
]B C
public 
Agendamiento 
Agendamiento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
[ 	
JsonProperty	 
( 
$str "
," #
Required$ ,
=- .
Required/ 7
.7 8
Default8 ?
)? @
]@ A
public 
	Parametro 
[ 
] 
? 

Parametros &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
}"" 
}## Ò(
fC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\Input\AgendaInput.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
Input  %
{ 
[		 
OpenApiExample		 
(		 
typeof		 
(		 
AgendaInputExample		 -
)		- .
)		. /
]		/ 0
public

 

class

 
AgendaInput

 
{ 
[ 	
JsonProperty	 
( 
$str !
,! "
Required# +
=, -
Required. 6
.6 7
Always7 =
)= >
]> ?
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' h
,h i
Nullablej r
=s t
falseu z
)z {
]{ |
public 
string 
	IdUsuario 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
,  
Required! )
=* +
Required, 4
.4 5
Always5 ;
); <
]< =
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' D
,D E
NullableF N
=O P
falseQ V
)V W
]W X
public 
string 
IdMalla 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str 
, 
Required  (
=) *
Required+ 3
.3 4
Always4 :
): ;
]; <
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' C
,C D
NullableE M
=N O
falseP U
)U V
]V W
public 
string 
IdSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str !
,! "
Required# +
=, -
Required. 6
.6 7
Always7 =
)= >
]> ?
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' E
,E F
NullableG O
=P Q
falseR W
)W X
]X Y
public 
string 
	IdSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str "
," #
Required$ ,
=- .
Required/ 7
.7 8
Always8 >
)> ?
]? @
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' D
,D E
NullableF N
=O P
falseQ V
)V W
]W X
public 
string 

IdServicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[   	
JsonProperty  	 
(   
$str   )
,  ) *
Required  + 3
=  4 5
Required  6 >
.  > ?
Always  ? E
)  E F
]  F G
[!! 	
OpenApiProperty!!	 
(!! 
Description!! $
=!!% &
$str!!' :
,!!: ;
Nullable!!< D
=!!E F
false!!G L
)!!L M
]!!M N
public"" 
string"" 
FechaAgendamiento"" '
{""( )
get""* -
;""- .
set""/ 2
;""2 3
}""4 5
[$$ 	
JsonProperty$$	 
($$ 
$str$$ (
,$$( )
Required$$* 2
=$$3 4
Required$$5 =
.$$= >
Always$$> D
)$$D E
]$$E F
[%% 	
OpenApiProperty%%	 
(%% 
Description%% $
=%%% &
$str%%' R
,%%R S
Nullable%%T \
=%%] ^
false%%_ d
)%%d e
]%%e f
public&& 
string&& 
HoraAgendamiento&& &
{&&' (
get&&) ,
;&&, -
set&&. 1
;&&1 2
}&&3 4
[(( 	
JsonProperty((	 
((( 
$str(( 
,(( 
Required(( $
=((% &
Required((' /
.((/ 0
Always((0 6
)((6 7
]((7 8
[)) 	
OpenApiProperty))	 
()) 
Description)) $
=))% &
$str	))' ê
,
))ê ë
Nullable
))í ö
=
))õ ú
false
))ù ¢
)
))¢ £
]
))£ §
public** 
string** 
Ip** 
{** 
get** 
;** 
set**  #
;**# $
}**% &
}++ 
},, “
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\Input\CancelacionInput.cs
	namespace 	
FxAgendamiento
 
. 
Models 
.  
Input  %
{ 
[		 
OpenApiExample		 
(		 
typeof		 
(		 #
CancelacionInputExample		 2
)		2 3
)		3 4
]		4 5
public

 

class

 
CancelacionInput

 !
{ 
[ 	
JsonProperty	 
( 
$str !
,! "
Required# +
=, -
Required. 6
.6 7
Always7 =
)= >
]> ?
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' O
,O P
NullableQ Y
=Z [
false\ a
)a b
]b c
public 
string 
	IdTramite 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
,  
Required! )
=* +
Required, 4
.4 5
Always5 ;
); <
]< =
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' D
,D E
NullableF N
=O P
falseQ V
)V W
]W X
public 
string 
IdMalla 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str 
, 
Required  (
=) *
Required+ 3
.3 4
Always4 :
): ;
]; <
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' C
,C D
NullableE M
=N O
falseP U
)U V
]V W
public 
string 
IdSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str !
,! "
Required# +
=, -
Required. 6
.6 7
Always7 =
)= >
]> ?
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' E
,E F
NullableG O
=P Q
falseR W
)W X
]X Y
public 
string 
	IdSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str !
,! "
Required# +
=, -
Required. 6
.6 7
Always7 =
)= >
]> ?
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' :
,: ;
Nullable< D
=E F
falseG L
)L M
]M N
public 
string 
	FechaCita 
{  !
get" %
;% &
set' *
;* +
}, -
[   	
JsonProperty  	 
(   
$str   !
,  ! "
Required  # +
=  , -
Required  . 6
.  6 7
Always  7 =
)  = >
]  > ?
[!! 	
OpenApiProperty!!	 
(!! 
Description!! $
=!!% &
$str!!' h
,!!h i
Nullable!!j r
=!!s t
false!!u z
)!!z {
]!!{ |
public"" 
string"" 
	IdUsuario"" 
{""  !
get""" %
;""% &
set""' *
;""* +
}"", -
}## 
}$$ Å
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\Input\NuevoEstadoInput.cs
	namespace 	
FxAgendamiento
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
( #
NuevoEstadoInputExample 2
)2 3
)3 4
]4 5
public		 

class		 
NuevoEstadoInput		 !
{

 
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' j
,j k
Nullablel t
=u v
falsew |
)| }
]} ~
public 
string 
	IdUsuario 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
) 
]  
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' F
,F G
NullableH P
=Q R
falseS X
)X Y
]Y Z
public 
string 
Estado 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' H
,H I
NullableJ R
=S T
falseU Z
)Z [
][ \
public 
string 
	IdTramite 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' k
,k l
Nullablem u
=v w
truex |
)| }
]} ~
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public 
string 
? 

IdCampania !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' 2
,2 3
Nullable4 <
== >
true? C
)C D
]D E
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
string 
? 
QRCode 
{ 
get  #
;# $
set% (
;( )
}* +
} 
}   û
cC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\ResponseResult.cs
	namespace		 	
FxAgendamiento		
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
} Ç
cC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Models\ResposeTramite.cs
	namespace 	
FxAgendamiento
 
. 
Models 
{ 
public 

class 
ResposeTramite 
{ 
public 
string 
? 
	IdTramite  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
? 
Activo 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
?		 
IdMalla		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public 
string 
? 
IdSede 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
? 
	IdSubsede  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
? 

EstadoCita !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
? 
PuntoAtencion $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
? 
Tramite 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
Fecha 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
? 
Hora 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
? 
NumeroDocumento &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
? 
NombresApellidos '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
? 
CorreoElectronico (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
bool 
? 
TramiteVirtual #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
? 
TipoPago 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 
DuracionServicio '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
}   
}!! £
hC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\OpenApi\AgendaInputExample.cs
	namespace 	
FxAgendamiento
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
AgendaInputExample

 #
:

$ %
OpenApiExample

& 4
<

4 5
AgendaInput

5 @
>

@ A
{ 
public 
override 
IOpenApiExample '
<' (
AgendaInput( 3
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
$str '
,' (
new 
AgendaInput #
(# $
)$ %
{ 
	IdUsuario !
=" #
$str$ h
,h i
IdMalla 
=  !
$str" d
,d e
IdSede 
=  
$str! G
,G H
	IdSubSede !
=" #
$str$ N
,N O

IdServicio "
=# $
$str% J
,J K
FechaAgendamiento )
=* +
$str, 8
,8 9
HoraAgendamiento (
=) *
$str+ 2
,2 3
Ip 
= 
$str &
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
}"" •
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\OpenApi\CancelacionInputExample.cs
	namespace 	
FxAgendamiento
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
 #
CancelacionInputExample
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
9 :
CancelacionInput

: J
>

J K
{ 
public 
override 
IOpenApiExample '
<' (
CancelacionInput( 8
>8 9
Build: ?
(? @
NamingStrategy@ N
namingStrategyO ]
=^ _
null` d
)d e
{ 	
Examples 
. 
Add 
( "
OpenApiExampleResolver &
.& '
Resolve' .
(. /
$str (
,( )
new 
CancelacionInput (
(( )
)) *
{ 
	IdTramite !
=" #
$str$ h
,h i
	IdUsuario !
=" #
$str$ h
,h i
IdMalla 
=  !
$str" d
,d e
IdSede 
=  
$str! G
,G H
	IdSubSede !
=" #
$str$ N
,N O
	FechaCita !
=" #
$str$ 0
} 
, 
namingStrategy "
) 
) 
; 
return 
this 
; 
} 	
} 
}   ‡
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\OpenApi\NuevoEstadoInputExample.cs
	namespace 	
FxAgendamiento
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
 #
NuevoEstadoInputExample

 (
:

( )
OpenApiExample

) 7
<

7 8
NuevoEstadoInput

8 H
>

H I
{ 
public 
override 
IOpenApiExample '
<' (
NuevoEstadoInput( 8
>8 9
Build: ?
(? @
NamingStrategy@ N
namingStrategyO ]
=^ _
null` d
)d e
{ 	
Examples 
. 
Add 
( "
OpenApiExampleResolver &
.& '
Resolve' .
(. /
$str (
,( )
new 
NuevoEstadoInput (
(( )
)) *
{ 
	IdUsuario !
=! "
$str# g
,g h
Estado 
= 
$str +
,+ ,
	IdTramite !
=! "
$str# g
,g h

IdCampania "
=" #
$str$ h
,h i
QRCode 
=  
$str
! ìÒ
} 
, 
namingStrategy "
) 
) 
; 
return 
this 
; 
} 	
}   
}!! Î

kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\OpenApi\ResponseResultExample.cs
	namespace

 	
FxAgendamiento
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
} ¯
jC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Repositories\EmailRepository.cs
	namespace		 	
FxAgendamiento		
 
.		 
Repositories		 %
{

 
public 

class 
EmailRepository  
:! "
IEmailRepository# 3
{ 
	protected 
IDbTransaction  
Transaction! ,
{- .
get/ 2
;2 3
private4 ;
set< ?
;? @
}A B
	protected 
IDbConnection 

Connection  *
=>+ -
Transaction. 9
.9 :

Connection: D
;D E
public 
EmailRepository 
( 
IDbTransaction -
transaction. 9
)9 :
{ 	
Transaction 
= 
transaction %
;% &
} 	
public 
async 
Task 
< 
PlantillaDto &
>& ')
ObtenerConfiguracionPlantilla( E
(E F
stringF L
nombre_clienteM [
,[ \
string] c
nombre_serviciod s
,s t
stringu {
nombre_plantilla	| å
)
å ç
{ 	
string 
sqlQuery 
= 
$str4 /
;44/ 0
var66 

parameters66 
=66 
new66  
DynamicParameters66! 2
(662 3
)663 4
;664 5

parameters77 
.77 
Add77 
(77 
$str77 +
,77+ ,
nombre_cliente77- ;
,77; <
DbType77= C
.77C D
String77D J
)77J K
;77K L

parameters88 
.88 
Add88 
(88 
$str88 ,
,88, -
nombre_servicio88. =
,88= >
DbType88? E
.88E F
String88F L
)88L M
;88M N

parameters99 
.99 
Add99 
(99 
$str99 -
,99- .
nombre_plantilla99/ ?
,99? @
DbType99A G
.99G H
String99H N
)99N O
;99O P

parameters:: 
.:: 
Add:: 
(:: 
$str:: #
,::# $
true::% )
,::) *
DbType::+ 1
.::1 2
Boolean::2 9
)::9 :
;::: ;
PlantillaDto;; 
data;; 
=;; 
await;;  %

Connection;;& 0
.;;0 1$
QueryFirstOrDefaultAsync;;1 I
<;;I J
PlantillaDto;;J V
>;;V W
(;;W X
sqlQuery;;X `
,;;` a

parameters;;b l
,;;l m
Transaction;;n y
);;y z
;;;z {
return<< 
data<< 
;<< 
}== 	
}>> 
}?? ƒ¡
jC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Repositories\MallaRepository.cs
	namespace 	
FxAgendamiento
 
. 
Repositories %
{ 
public 

class 
MallaRepository  
:! "
RepositoryBase# 1
,1 2
IMallaRepository3 C
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
MallaRepository 
( 
CosmosClient +
client, 2
,2 3
IConfiguration4 B
configurationC P
)P Q
: 
base 
( 
client 
) 
{ 	
string 
containerId 
=  
configuration! .
[. /
$str/ H
]H I
;I J
string 
databaseName 
=  !
configuration" /
[/ 0
$str0 C
]C D
;D E
	container 
= 
client 
. 
GetContainer +
(+ ,
databaseName, 8
,8 9
containerId: E
)E F
;F G
} 	
public   
async   
Task   
CancelarCita   &
(  & '
MallaDto  ' /
data  0 4
,  4 5
string  6 <

horaInicio  = G
,  G H
string  I O
[  O P
]  P Q
tramites  R Z
,  Z [
string  \ b
	idTramite  c l
,  l m
string  n t
	idUsuario  u ~
,  ~ 
bool
  Ä Ñ
inactivarAgenda
  Ö î
)
  î ï
{!! 	
var"" 
indices"" 
="" 
await"" 
ObtenerIndices""  .
("". /
data""/ 3
,""3 4

horaInicio""5 ?
)""? @
;""@ A
var## 
listOfTramites## 
=##  
tramites##! )
.##) *
ToList##* 0
(##0 1
)##1 2
;##2 3
var$$ 
	patchOpts$$ 
=$$ 
new$$ 
List$$  $
<$$$ %
PatchOperation$$% 3
>$$3 4
($$4 5
)$$5 6
;$$6 7
var&& 
indexTramite&& 
=&& 
listOfTramites&& -
.&&- .
	FindIndex&&. 7
(&&7 8
tramite&&8 ?
=>&&@ B
tramite&&C J
.&&J K
Equals&&K Q
(&&Q R
	idTramite&&R [
)&&[ \
)&&\ ]
;&&] ^
string(( 
path(( 
=(( 
$"(( 
$str(( .
{((. /
indices((/ 6
.((6 7
	ElementAt((7 @
(((@ A
$num((A B
)((B C
}((C D
$str((D U
{((U V
indices((V ]
.((] ^
	ElementAt((^ g
(((g h
$num((h i
)((i j
}((j k
$str((k t
{((t u
indices((u |
.((| }
	ElementAt	((} Ü
(
((Ü á
$num
((á à
)
((à â
}
((â ä
"
((ä ã
;
((ã å
	patchOpts** 
.** 
Add** 
(** 
PatchOperation** (
.**( )
Set**) ,
(**, -
$"**- /
{**/ 0
path**0 4
}**4 5
$str**5 F
"**F G
,**G H
inactivarAgenda**I X
)**X Y
)**Y Z
;**Z [
	patchOpts++ 
.++ 
Add++ 
(++ 
PatchOperation++ (
.++( )
Remove++) /
(++/ 0
$"++0 2
{++2 3
path++3 7
}++7 8
$str++8 B
{++B C
indexTramite++C O
}++O P
"++P Q
)++Q R
)++R S
;++S T
	patchOpts,, 
.,, 
Add,, 
(,, 
PatchOperation,, (
.,,( )
Add,,) ,
(,,, -
$",,- /
{,,/ 0
path,,0 4
},,4 5
$str,,5 F
{,,F G
indices,,G N
.,,N O
	ElementAt,,O X
(,,X Y
$num,,Y Z
),,Z [
},,[ \
",,\ ]
,,,] ^
	idUsuario,,_ h
),,h i
),,i j
;,,j k
await.. 
	container.. 
... 
PatchItemAsync.. *
<..* +
Malla..+ 0
>..0 1
(..1 2
data..2 6
...6 7
IdMalla..7 >
,..> ?
new..@ C
PartitionKey..D P
(..P Q
data..Q U
...U V
IdSede..V \
)..\ ]
,..] ^
	patchOpts.._ h
)..h i
;..i j
}// 	
public11 
async11 
Task11 
<11 
bool11 
>11 

ExistMalla11  *
(11* +
string11+ 1
idMalla112 9
)119 :
{22 	
dynamic33 
data33 
=33 
null33 
;33  
try44 
{55 
var66 
queryString66 
=66  !
$str6:" 9
;::9 :
var<< 
queryDef<< 
=<< 
new<< "
QueryDefinition<<# 2
(<<2 3
queryString<<3 >
)<<> ?
;<<? @
queryDef== 
.== 
WithParameter== &
(==& '
$str==' 1
,==1 2
idMalla==3 :
)==: ;
;==; <
queryDef>> 
.>> 
WithParameter>> &
(>>& '
$str>>' 0
,>>0 1
true>>2 6
)>>6 7
;>>7 8
var@@ 
query@@ 
=@@ 
	container@@ %
.@@% & 
GetItemQueryIterator@@& :
<@@: ;
dynamic@@; B
>@@B C
(@@C D
queryDef@@D L
)@@L M
;@@M N
whileAA 
(AA 
queryAA 
.AA 
HasMoreResultsAA +
)AA+ ,
{BB 
varCC 
responseCC  
=CC! "
awaitCC# (
queryCC) .
.CC. /
ReadNextAsyncCC/ <
(CC< =
)CC= >
;CC> ?
dataDD 
=DD 
responseDD #
.DD# $
SingleOrDefaultDD$ 3
(DD3 4
)DD4 5
;DD5 6
}EE 
returnGG 
dataGG 
!=GG 
nullGG #
;GG# $
}HH 
catchII 
(II 
CosmosExceptionII "
exII# %
)II% &
whenII' +
(II, -
exII- /
.II/ 0

StatusCodeII0 :
==II; =
HttpStatusCodeII> L
.IIL M
NotFoundIIM U
)IIU V
{JJ 
returnKK 
falseKK 
;KK 
}LL 
}MM 	
publicRR 
asyncRR 
TaskRR 
InactivarTiemposRR *
(RR* +
MallaDtoRR+ 3
dataRR4 8
,RR8 9
stringRR: @

horaInicioRRA K
,RRK L
stringRRM S
	idUsuarioRRT ]
,RR] ^
boolRR_ c
inactivarAgendaRRd s
)RRs t
{SS 	
varTT 
indicesTT 
=TT 
awaitTT 
ObtenerIndicesTT  .
(TT. /
dataTT/ 3
,TT3 4

horaInicioTT5 ?
)TT? @
;TT@ A
varUU 
	patchOptsUU 
=UU 
newUU 
ListUU  $
<UU$ %
PatchOperationUU% 3
>UU3 4
(UU4 5
)UU5 6
;UU6 7
stringWW 
pathWW 
=WW 
$"WW 
$strWW .
{WW. /
indicesWW/ 6
.WW6 7
	ElementAtWW7 @
(WW@ A
$numWWA B
)WWB C
}WWC D
$strWWD U
{WWU V
indicesWWV ]
.WW] ^
	ElementAtWW^ g
(WWg h
$numWWh i
)WWi j
}WWj k
$strWWk t
{WWt u
indicesWWu |
.WW| }
	ElementAt	WW} Ü
(
WWÜ á
$num
WWá à
)
WWà â
}
WWâ ä
"
WWä ã
;
WWã å
	patchOptsYY 
.YY 
AddYY 
(YY 
PatchOperationYY (
.YY( )
SetYY) ,
(YY, -
$"YY- /
{YY/ 0
pathYY0 4
}YY4 5
$strYY5 F
"YYF G
,YYG H
inactivarAgendaYYI X
)YYX Y
)YYY Z
;YYZ [
	patchOptsZZ 
.ZZ 
AddZZ 
(ZZ 
PatchOperationZZ (
.ZZ( )
AddZZ) ,
(ZZ, -
$"ZZ- /
{ZZ/ 0
pathZZ0 4
}ZZ4 5
$strZZ5 ?
{ZZ? @
indicesZZ@ G
.ZZG H
	ElementAtZZH Q
(ZZQ R
$numZZR S
)ZZS T
}ZZT U
"ZZU V
,ZZV W
	idUsuarioZZX a
)ZZa b
)ZZb c
;ZZc d
await\\ 
	container\\ 
.\\ 
PatchItemAsync\\ *
<\\* +
Malla\\+ 0
>\\0 1
(\\1 2
data\\2 6
.\\6 7
IdMalla\\7 >
,\\> ?
new\\@ C
PartitionKey\\D P
(\\P Q
data\\Q U
.\\U V
IdSede\\V \
)\\\ ]
,\\] ^
	patchOpts\\_ h
)\\h i
;\\i j
}]] 	
public__ 
async__ 
Task__ 
<__ 
List__ 
<__ 
CancelacionDto__ -
>__- .
>__. /#
ObtenerHorasCancelacion__0 G
(__G H
MallaDto__H P
data__Q U
,__U V
string__W ]
	idTramite__^ g
)__g h
{`` 	
varaa 
tiemposaa 
=aa 
newaa 
Listaa "
<aa" #
CancelacionDtoaa# 1
>aa1 2
(aa2 3
)aa3 4
{aa5 6
}aa7 8
;aa8 9
trybb 
{cc 
vardd 
queryStringdd 
=dd  !
@$"dd" %
$strds% 2
{ss2 3
	idTramitess3 <
}ss< =
$strss= ?
"ss? @
;ss@ A
varuu 
queryDefuu 
=uu 
newuu "
QueryDefinitionuu# 2
(uu2 3
queryStringuu3 >
)uu> ?
;uu? @
queryDefvv 
.vv 
WithParametervv &
(vv& '
$strvv' 1
,vv1 2
datavv3 7
.vv7 8
IdMallavv8 ?
)vv? @
;vv@ A
queryDefww 
.ww 
WithParameterww &
(ww& '
$strww' 0
,ww0 1
dataww2 6
.ww6 7
IdSedeww7 =
)ww= >
;ww> ?
queryDefxx 
.xx 
WithParameterxx &
(xx& '
$strxx' 3
,xx3 4
dataxx5 9
.xx9 :
	IdSubSedexx: C
)xxC D
;xxD E
queryDefyy 
.yy 
WithParameteryy &
(yy& '
$stryy' /
,yy/ 0
datayy1 5
.yy5 6
Fechayy6 ;
)yy; <
;yy< =
var{{ 
query{{ 
={{ 
	container{{ %
.{{% & 
GetItemQueryIterator{{& :
<{{: ;
CancelacionDto{{; I
>{{I J
({{J K
queryDef{{K S
){{S T
;{{T U
while|| 
(|| 
query|| 
.|| 
HasMoreResults|| +
)||+ ,
{}} 
var~~ 
response~~  
=~~! "
await~~# (
query~~) .
.~~. /
ReadNextAsync~~/ <
(~~< =
)~~= >
;~~> ?
tiempos 
. 
AddRange $
($ %
response% -
.- .
ToList. 4
(4 5
)5 6
)6 7
;7 8
}
ÄÄ 
return
ÇÇ 
tiempos
ÇÇ 
;
ÇÇ 
}
ÉÉ 
catch
ÑÑ 
(
ÑÑ 
CosmosException
ÑÑ "
ex
ÑÑ# %
)
ÑÑ% &
when
ÑÑ' +
(
ÑÑ, -
ex
ÑÑ- /
.
ÑÑ/ 0

StatusCode
ÑÑ0 :
==
ÑÑ; =
HttpStatusCode
ÑÑ> L
.
ÑÑL M
NotFound
ÑÑM U
)
ÑÑU V
{
ÖÖ 
return
ÜÜ 
tiempos
ÜÜ 
;
ÜÜ 
}
áá 
}
àà 	
public
ää 
async
ää 
Task
ää 
<
ää 
List
ää 
<
ää 
int
ää "
>
ää" #
>
ää# $
ObtenerIndices
ää% 3
(
ää3 4
MallaDto
ää4 <
data
ää= A
,
ääA B
string
ääC I
hora
ääJ N
)
ääN O
{
ãã 	
var
åå 
indices
åå 
=
åå 
new
åå 
List
åå "
<
åå" #
int
åå# &
>
åå& '
(
åå' (
)
åå( )
;
åå) *
try
çç 
{
éé 
var
èè 
result
èè 
=
èè 
	container
èè &
.
èè& '"
GetItemLinqQueryable
èè' ;
<
èè; <
Malla
èè< A
>
èèA B
(
èèB C
)
èèC D
.
èèD E
Where
èèE J
(
èèJ K
m
êê 
=>
êê 
m
êê 
.
êê 
PkSede
êê 
.
êê 
Equals
êê $
(
êê$ %
data
êê% )
.
êê) *
IdSede
êê* 0
)
êê0 1
&&
êê2 4
m
ëë 
.
ëë 
Id
ëë 
.
ëë 
Equals
ëë 
(
ëë 
data
ëë  
.
ëë  !
IdMalla
ëë! (
)
ëë( )
&&
ëë* ,
m
íí 
.
íí 
Activo
íí 
)
ìì 
.
ìì 
ToFeedIterator
ìì  
(
ìì  !
)
ìì! "
;
ìì" #
if
ïï 
(
ïï 
result
ïï 
.
ïï 
HasMoreResults
ïï )
)
ïï) *
{
ññ 
var
óó 
existingDocuments
óó )
=
óó* +
await
óó, 1
result
óó2 8
.
óó8 9
ReadNextAsync
óó9 F
(
óóF G
)
óóG H
;
óóH I
List
òò 
<
òò 
MallasPorSubSede
òò )
>
òò) *
listSubsedes
òò+ 7
=
òò8 9
existingDocuments
òò: K
.
òòK L
Resource
òòL T
?
òòT U
.
òòU V
Select
òòV \
(
òò\ ]
d
òò] ^
=>
òò_ a
d
òòb c
.
òòc d
MallasPorSubSede
òòd t
)
òòt u
.
òòu v
FirstOrDefaultòòv Ñ
(òòÑ Ö
)òòÖ Ü
;òòÜ á
int
öö 
indiceSubSede
öö %
=
öö& '
listSubsedes
öö( 4
.
öö4 5
	FindIndex
öö5 >
(
öö> ?
subsede
öö? F
=>
ööG I
subsede
ööJ Q
.
ööQ R
	PkSubSede
ööR [
.
öö[ \
Equals
öö\ b
(
ööb c
data
ööc g
.
öög h
	IdSubSede
ööh q
)
ööq r
)
öör s
;
öös t
MallasPorSubSede
õõ $
subsede
õõ% ,
=
õõ- .
listSubsedes
õõ/ ;
.
õõ; <
	ElementAt
õõ< E
(
õõE F
indiceSubSede
õõF S
)
õõS T
;
õõT U
int
ùù #
indiceTiemposAtencion
ùù -
=
ùù. /
subsede
ùù0 7
.
ùù7 8
TiemposAtencion
ùù8 G
.
ùùG H
	FindIndex
ùùH Q
(
ùùQ R
ta
ùùR T
=>
ùùU W
ta
ùùX Z
.
ùùZ [
Fecha
ùù[ `
.
ùù` a
Equals
ùùa g
(
ùùg h
data
ùùh l
.
ùùl m
Fecha
ùùm r
)
ùùr s
)
ùùs t
;
ùùt u
TiemposAtencion
ûû #
tiempoAtencion
ûû$ 2
=
ûû3 4
subsede
ûû5 <
.
ûû< =
TiemposAtencion
ûû= L
.
ûûL M
	ElementAt
ûûM V
(
ûûV W#
indiceTiemposAtencion
ûûW l
)
ûûl m
;
ûûm n
int
†† 

indiceHora
†† "
=
††# $
tiempoAtencion
††% 3
.
††3 4
Tiempos
††4 ;
.
††; <
	FindIndex
††< E
(
††E F
t
††F G
=>
††H J
t
††K L
.
††L M

HoraInicio
††M W
.
††W X
Equals
††X ^
(
††^ _
hora
††_ c
)
††c d
)
††d e
;
††e f
Tiempo
¢¢ 
tiempo
¢¢ !
=
¢¢" #
tiempoAtencion
¢¢$ 2
.
¢¢2 3
Tiempos
¢¢3 :
[
¢¢: ;

indiceHora
¢¢; E
]
¢¢E F
;
¢¢F G
indices
§§ 
.
§§ 
Add
§§ 
(
§§  
indiceSubSede
§§  -
)
§§- .
;
§§. /
indices
•• 
.
•• 
Add
•• 
(
••  #
indiceTiemposAtencion
••  5
)
••5 6
;
••6 7
indices
¶¶ 
.
¶¶ 
Add
¶¶ 
(
¶¶  

indiceHora
¶¶  *
)
¶¶* +
;
¶¶+ ,
indices
ßß 
.
ßß 
Add
ßß 
(
ßß  
tiempo
ßß  &
.
ßß& '
Tramites
ßß' /
.
ßß/ 0
Length
ßß0 6
)
ßß6 7
;
ßß7 8
indices
®® 
.
®® 
Add
®® 
(
®®  
tiempo
®®  &
.
®®& '
UsuariosVetados
®®' 6
.
®®6 7
Length
®®7 =
)
®®= >
;
®®> ?
}
©© 
return
´´ 
indices
´´ 
;
´´ 
}
¨¨ 
catch
≠≠ 
(
≠≠ 
CosmosException
≠≠ "
ex
≠≠# %
)
≠≠% &
when
≠≠' +
(
≠≠, -
ex
≠≠- /
.
≠≠/ 0

StatusCode
≠≠0 :
==
≠≠; =
HttpStatusCode
≠≠> L
.
≠≠L M
NotFound
≠≠M U
)
≠≠U V
{
ÆÆ 
return
ØØ 
indices
ØØ 
;
ØØ 
}
∞∞ 
}
±± 	
public
≥≥ 
async
≥≥ 
Task
≥≥ 
<
≥≥ 
List
≥≥ 
<
≥≥ 
	TiempoDto
≥≥ (
>
≥≥( )
>
≥≥) *
ValidarEspacio
≥≥+ 9
(
≥≥9 :
string
≥≥: @
idMalla
≥≥A H
,
≥≥H I
string
≥≥J P
idSede
≥≥Q W
,
≥≥W X
string
≥≥Y _
	idSubsede
≥≥` i
,
≥≥i j
string
≥≥k q
fecha
≥≥r w
)
≥≥w x
{
¥¥ 	
var
µµ 
tiempos
µµ 
=
µµ 
new
µµ 
List
µµ "
<
µµ" #
	TiempoDto
µµ# ,
>
µµ, -
(
µµ- .
)
µµ. /
{
µµ0 1
}
µµ2 3
;
µµ3 4
try
∂∂ 
{
∑∑ 
var
∏∏ 
queryString
∏∏ 
=
∏∏  !
@$"
∏∏" %
$str
∏√% 8
"
√√8 9
;
√√9 :
var
≈≈ 
queryDef
≈≈ 
=
≈≈ 
new
≈≈ "
QueryDefinition
≈≈# 2
(
≈≈2 3
queryString
≈≈3 >
)
≈≈> ?
;
≈≈? @
queryDef
∆∆ 
.
∆∆ 
WithParameter
∆∆ &
(
∆∆& '
$str
∆∆' 1
,
∆∆1 2
idMalla
∆∆3 :
)
∆∆: ;
;
∆∆; <
queryDef
«« 
.
«« 
WithParameter
«« &
(
««& '
$str
««' 0
,
««0 1
idSede
««2 8
)
««8 9
;
««9 :
queryDef
»» 
.
»» 
WithParameter
»» &
(
»»& '
$str
»»' 3
,
»»3 4
	idSubsede
»»5 >
)
»»> ?
;
»»? @
queryDef
…… 
.
…… 
WithParameter
…… &
(
……& '
$str
……' /
,
……/ 0
fecha
……1 6
)
……6 7
;
……7 8
var
ÀÀ 
query
ÀÀ 
=
ÀÀ 
	container
ÀÀ %
.
ÀÀ% &"
GetItemQueryIterator
ÀÀ& :
<
ÀÀ: ;
	TiempoDto
ÀÀ; D
>
ÀÀD E
(
ÀÀE F
queryDef
ÀÀF N
)
ÀÀN O
;
ÀÀO P
while
ÃÃ 
(
ÃÃ 
query
ÃÃ 
.
ÃÃ 
HasMoreResults
ÃÃ +
)
ÃÃ+ ,
{
ÕÕ 
var
ŒŒ 
response
ŒŒ  
=
ŒŒ! "
await
ŒŒ# (
query
ŒŒ) .
.
ŒŒ. /
ReadNextAsync
ŒŒ/ <
(
ŒŒ< =
)
ŒŒ= >
;
ŒŒ> ?
tiempos
œœ 
.
œœ 
AddRange
œœ $
(
œœ$ %
response
œœ% -
.
œœ- .
ToList
œœ. 4
(
œœ4 5
)
œœ5 6
)
œœ6 7
;
œœ7 8
}
–– 
return
““ 
tiempos
““ 
;
““ 
}
”” 
catch
‘‘ 
(
‘‘ 
CosmosException
‘‘ "
ex
‘‘# %
)
‘‘% &
when
‘‘' +
(
‘‘, -
ex
‘‘- /
.
‘‘/ 0

StatusCode
‘‘0 :
==
‘‘; =
HttpStatusCode
‘‘> L
.
‘‘L M
NotFound
‘‘M U
)
‘‘U V
{
’’ 
return
÷÷ 
tiempos
÷÷ 
;
÷÷ 
}
◊◊ 
}
ÿÿ 	
public
⁄⁄ 
async
⁄⁄ 
Task
⁄⁄ 
<
⁄⁄ 
List
⁄⁄ 
<
⁄⁄ 

TramiteDto
⁄⁄ )
>
⁄⁄) *
>
⁄⁄* +
ValidarTiempos
⁄⁄, :
(
⁄⁄: ;
MallaDto
⁄⁄; C
data
⁄⁄D H
,
⁄⁄H I
string
⁄⁄J P
[
⁄⁄P Q
]
⁄⁄Q R
horas
⁄⁄S X
)
⁄⁄X Y
{
€€ 	
var
‹‹ 
tiempos
‹‹ 
=
‹‹ 
new
‹‹ 
List
‹‹ "
<
‹‹" #

TramiteDto
‹‹# -
>
‹‹- .
(
‹‹. /
)
‹‹/ 0
{
‹‹1 2
}
‹‹3 4
;
‹‹4 5
try
›› 
{
ﬁﬁ 
var
ﬂﬂ 
queryString
ﬂﬂ 
=
ﬂﬂ  !
@$"
ﬂﬂ" %
$str
ﬂÌ% 9
{
ÌÌ9 :
string
ÌÌ: @
.
ÌÌ@ A
Join
ÌÌA E
(
ÌÌE F
$str
ÌÌF I
,
ÌÌI J
horas
ÌÌK P
)
ÌÌP Q
}
ÌÌQ R
$str
ÌÌR S
"
ÌÌS T
;
ÌÌT U
var
ÔÔ 
queryDef
ÔÔ 
=
ÔÔ 
new
ÔÔ "
QueryDefinition
ÔÔ# 2
(
ÔÔ2 3
queryString
ÔÔ3 >
)
ÔÔ> ?
;
ÔÔ? @
queryDef
 
.
 
WithParameter
 &
(
& '
$str
' 1
,
1 2
data
3 7
.
7 8
IdMalla
8 ?
)
? @
;
@ A
queryDef
ÒÒ 
.
ÒÒ 
WithParameter
ÒÒ &
(
ÒÒ& '
$str
ÒÒ' 0
,
ÒÒ0 1
data
ÒÒ2 6
.
ÒÒ6 7
IdSede
ÒÒ7 =
)
ÒÒ= >
;
ÒÒ> ?
queryDef
ÚÚ 
.
ÚÚ 
WithParameter
ÚÚ &
(
ÚÚ& '
$str
ÚÚ' 3
,
ÚÚ3 4
data
ÚÚ5 9
.
ÚÚ9 :
	IdSubSede
ÚÚ: C
)
ÚÚC D
;
ÚÚD E
queryDef
ÛÛ 
.
ÛÛ 
WithParameter
ÛÛ &
(
ÛÛ& '
$str
ÛÛ' /
,
ÛÛ/ 0
data
ÛÛ1 5
.
ÛÛ5 6
Fecha
ÛÛ6 ;
)
ÛÛ; <
;
ÛÛ< =
var
ıı 
query
ıı 
=
ıı 
	container
ıı %
.
ıı% &"
GetItemQueryIterator
ıı& :
<
ıı: ;

TramiteDto
ıı; E
>
ııE F
(
ııF G
queryDef
ııG O
)
ııO P
;
ııP Q
while
ˆˆ 
(
ˆˆ 
query
ˆˆ 
.
ˆˆ 
HasMoreResults
ˆˆ +
)
ˆˆ+ ,
{
˜˜ 
var
¯¯ 
response
¯¯  
=
¯¯! "
await
¯¯# (
query
¯¯) .
.
¯¯. /
ReadNextAsync
¯¯/ <
(
¯¯< =
)
¯¯= >
;
¯¯> ?
tiempos
˘˘ 
.
˘˘ 
AddRange
˘˘ $
(
˘˘$ %
response
˘˘% -
.
˘˘- .
ToList
˘˘. 4
(
˘˘4 5
)
˘˘5 6
)
˘˘6 7
;
˘˘7 8
}
˙˙ 
return
¸¸ 
tiempos
¸¸ 
;
¸¸ 
}
˝˝ 
catch
˛˛ 
(
˛˛ 
CosmosException
˛˛ "
ex
˛˛# %
)
˛˛% &
when
˛˛' +
(
˛˛, -
ex
˛˛- /
.
˛˛/ 0

StatusCode
˛˛0 :
==
˛˛; =
HttpStatusCode
˛˛> L
.
˛˛L M
NotFound
˛˛M U
)
˛˛U V
{
ˇˇ 
return
ÄÄ 
tiempos
ÄÄ 
;
ÄÄ 
}
ÅÅ 
}
ÇÇ 	
}
ÖÖ 
}ÜÜ Ò
iC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Repositories\RepositoryBase.cs
	namespace 	
FxAgendamiento
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
} ”=
iC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Repositories\SedeRepository.cs
	namespace 	
FxAgendamiento
 
. 
Repositories %
{ 
internal 
class 
SedeRepository !
:" #
RepositoryBase$ 2
,2 3
ISedeRepository4 C
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
SedeRepository 
( 
CosmosClient *
client+ 1
,1 2
IConfiguration3 A
configurationB O
)O P
: 
base 
( 
client 
) 
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
public 
async 
Task 
< 
bool 
> 

ExisteSede  *
(* +
string+ 1
idSede2 8
)8 9
{ 	
dynamic 
data 
= 
null 
;  
try 
{ 
var 
queryString 
=  !
$str#" 9
;##9 :
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
$str&&' 0
,&&0 1
idSede&&2 8
)&&8 9
;&&9 :
queryDef'' 
.'' 
WithParameter'' &
(''& '
$str''' 0
,''0 1
true''2 6
)''6 7
;''7 8
var)) 
query)) 
=)) 
	container)) %
.))% & 
GetItemQueryIterator))& :
<)): ;
dynamic)); B
>))B C
())C D
queryDef))D L
)))L M
;))M N
while** 
(** 
query** 
.** 
HasMoreResults** +
)**+ ,
{++ 
var,, 
response,,  
=,,! "
await,,# (
query,,) .
.,,. /
ReadNextAsync,,/ <
(,,< =
),,= >
;,,> ?
data-- 
=-- 
response-- #
.--# $
SingleOrDefault--$ 3
(--3 4
)--4 5
;--5 6
}.. 
return00 
data00 
!=00 
null00 #
;00# $
}11 
catch22 
(22 
CosmosException22 "
ex22# %
)22% &
when22' +
(22, -
ex22- /
.22/ 0

StatusCode220 :
==22; =
HttpStatusCode22> L
.22L M
NotFound22M U
)22U V
{33 
return44 
false44 
;44 
}55 
}66 	
public88 
async88 
Task88 
<88 
bool88 
>88 
ExisteSubSede88  -
(88- .
string88. 4
idSede885 ;
,88< =
string88= C
	idSubSede88D M
)88M N
{99 	
dynamic:: 
data:: 
=:: 
null:: 
;::  
try;; 
{<< 
var== 
queryString== 
===  !
$str=C" N
;CCN O
varEE 
queryDefEE 
=EE 
newEE "
QueryDefinitionEE# 2
(EE2 3
queryStringEE3 >
)EE> ?
;EE? @
queryDefFF 
.FF 
WithParameterFF &
(FF& '
$strFF' 0
,FF0 1
idSedeFF2 8
)FF8 9
;FF9 :
queryDefGG 
.GG 
WithParameterGG &
(GG& '
$strGG' 3
,GG3 4
	idSubSedeGG5 >
)GG> ?
;GG? @
queryDefHH 
.HH 
WithParameterHH &
(HH& '
$strHH' 0
,HH0 1
trueHH2 6
)HH6 7
;HH7 8
varJJ 
queryJJ 
=JJ 
	containerJJ %
.JJ% & 
GetItemQueryIteratorJJ& :
<JJ: ;
dynamicJJ; B
>JJB C
(JJC D
queryDefJJD L
)JJL M
;JJM N
whileKK 
(KK 
queryKK 
.KK 
HasMoreResultsKK +
)KK+ ,
{LL 
varMM 
responseMM  
=MM! "
awaitMM# (
queryMM) .
.MM. /
ReadNextAsyncMM/ <
(MM< =
)MM= >
;MM> ?
dataNN 
=NN 
responseNN #
.NN# $
SingleOrDefaultNN$ 3
(NN3 4
)NN4 5
;NN5 6
}OO 
returnQQ 
dataQQ 
!=QQ 
nullQQ #
;QQ# $
}RR 
catchSS 
(SS 
CosmosExceptionSS "
exSS# %
)SS% &
whenSS' +
(SS, -
exSS- /
.SS/ 0

StatusCodeSS0 :
==SS; =
HttpStatusCodeSS> L
.SSL M
NotFoundSSM U
)SSU V
{TT 
returnUU 
falseUU 
;UU 
}VV 
}WW 	
publicXX 
asyncXX 
TaskXX 
<XX 
SedeDtoXX !
>XX! "
ObtenerDatosSedeXX# 3
(XX3 4
stringXX4 :
idSedeXX; A
,XXA B
stringXXC I
	idSubsedeXXJ S
)XXS T
{YY 	
SedeDtoZZ 
sedeZZ 
=ZZ 
nullZZ 
;ZZ  
try[[ 
{\\ 
var]] 
queryString]] 
=]]  !
$str]e" <
;ee< =
vargg 
queryDefgg 
=gg 
newgg "
QueryDefinitiongg# 2
(gg2 3
queryStringgg3 >
)gg> ?
;gg? @
queryDefhh 
.hh 
WithParameterhh &
(hh& '
$strhh' 0
,hh0 1
idSedehh2 8
)hh8 9
;hh9 :
queryDefii 
.ii 
WithParameterii &
(ii& '
$strii' 3
,ii3 4
	idSubsedeii5 >
)ii> ?
;ii? @
varkk 
querykk 
=kk 
	containerkk %
.kk% & 
GetItemQueryIteratorkk& :
<kk: ;
SedeDtokk; B
>kkB C
(kkC D
queryDefkkD L
)kkL M
;kkM N
whilell 
(ll 
queryll 
.ll 
HasMoreResultsll +
)ll+ ,
{mm 
varnn 
responsenn  
=nn! "
awaitnn# (
querynn) .
.nn. /
ReadNextAsyncnn/ <
(nn< =
)nn= >
;nn> ?
sedeoo 
=oo 
responseoo #
.oo# $
SingleOrDefaultoo$ 3
(oo3 4
)oo4 5
;oo5 6
}pp 
returnrr 
sederr 
;rr 
}ss 
catchtt 
(tt 
CosmosExceptiontt "
extt# %
)tt% &
whentt' +
(tt, -
extt- /
.tt/ 0

StatusCodett0 :
==tt; =
HttpStatusCodett> L
.ttL M
NotFoundttM U
)ttU V
{uu 
returnvv 
sedevv 
;vv 
}ww 
}xx 	
}yy 
}zz Â
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Repositories\ServicioRepository.cs
	namespace 	
FxAgendamiento
 
. 
Repositories %
{ 
public 

class 
ServicioRepository #
:$ %
RepositoryBase& 4
,4 5
IServicioRepository6 I
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
ServicioRepository !
(! "
CosmosClient" .
client/ 5
,5 6
IConfiguration7 E
configurationF S
)S T
: 
base 
( 
client 
) 
{ 	
string 
containerId 
=  
configuration! .
[. /
$str/ K
]K L
;L M
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
< 
ServicioDto %
>% &+
ObtenerTiempodeAtencionServicio' F
(F G
stringG M

idServicioN X
)X Y
{ 	
ServicioDto 
tiempo 
=  
null! %
;% &
try 
{ 
var 
queryString 
=  !
$str$" ;
;$$; <
var&& 
queryDef&& 
=&& 
new&& "
QueryDefinition&&# 2
(&&2 3
queryString&&3 >
)&&> ?
;&&? @
queryDef'' 
.'' 
WithParameter'' &
(''& '
$str''' 4
,''4 5

idServicio''6 @
)''@ A
;''A B
var)) 
query)) 
=)) 
	container)) %
.))% & 
GetItemQueryIterator))& :
<)): ;
ServicioDto)); F
>))F G
())G H
queryDef))H P
)))P Q
;))Q R
while** 
(** 
query** 
.** 
HasMoreResults** +
)**+ ,
{++ 
var,, 
response,,  
=,,! "
await,,# (
query,,) .
.,,. /
ReadNextAsync,,/ <
(,,< =
),,= >
;,,> ?
tiempo-- 
=-- 
response-- %
.--% &
SingleOrDefault--& 5
(--5 6
)--6 7
;--7 8
}.. 
return00 
tiempo00 
;00 
}11 
catch22 
(22 
CosmosException22 "
ex22# %
)22% &
when22' +
(22, -
ex22- /
.22/ 0

StatusCode220 :
==22; =
HttpStatusCode22> L
.22L M
NotFound22M U
)22U V
{33 
return44 
tiempo44 
;44 
}55 
}66 	
}77 
}88 ñ®
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Repositories\TramiteRepository.cs
	namespace 	
FxAgendamiento
 
. 
Repositories %
{ 
public 

class 
TramiteRepository "
:# $
RepositoryBase% 3
,3 4
ITramiteRepository5 G
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
public 
TramiteRepository  
(  !
CosmosClient! -
client. 4
,4 5
IConfiguration6 D
configurationE R
)R S
:T U
baseV Z
(Z [
client[ a
)a b
{ 	
_configuration 
= 
configuration *
;* +
string 
containerId 
=  
_configuration! /
[/ 0
$str0 K
]K L
;L M
string 
databaseName 
=  !
_configuration" 0
[0 1
$str1 D
]D E
;E F
	container 
= 
client 
. 
GetContainer +
(+ ,
databaseName, 8
,8 9
containerId: E
)E F
;F G
} 	
public!! 
async!! 
Task!! 
<!! 
string!!  
>!!  !
AgregarEstado!!" /
(!!/ 0
string!!0 6
	idUsuario!!7 @
,!!@ A
string!!B H
	idTramite!!I R
,!!R S
Estado!!T Z
estado!![ a
)!!a b
{"" 	
var## 
result## 
=## 
	container## "
.##" # 
GetItemLinqQueryable### 7
<##7 8
Agenda##8 >
>##> ?
(##? @
)##@ A
.##A B
Where##B G
(##G H
m$$ 
=>$$  "
m$$# $
.$$$ %
Id$$% '
.$$' (
Equals$$( .
($$. /
	idUsuario$$/ 8
)$$8 9
)$$9 :
.$$: ;
ToFeedIterator$$; I
($$I J
)$$J K
;$$K L
int&& 
indiceTramite&& 
=&& 
-&&  !
$num&&! "
,&&" #
indiceEstados'' 
='' 
-''  !
$num''! "
;''" #
if)) 
()) 
result)) 
.)) 
HasMoreResults)) %
)))% &
{** 
var++ 
existingDocuments++ %
=++& '
await++( -
result++. 4
.++4 5
ReadNextAsync++5 B
(++B C
)++C D
;++D E
List-- 
<-- 
Tramite-- 
>-- 
tramites-- &
=--' (
existingDocuments--) :
.--: ;
Resource--; C
?--C D
.--D E
Select--E K
(--K L
d--L M
=>--N P
d--Q R
.--R S
Tramites--S [
)--[ \
.--\ ]
FirstOrDefault--] k
(--k l
)--l m
;--m n
indiceTramite// 
=// 
tramites//  (
.//( )
	FindIndex//) 2
(//2 3
tr//3 5
=>//6 8
tr//9 ;
.//; <
	PkTramite//< E
.//E F
Equals//F L
(//L M
	idTramite//M V
)//V W
)//W X
;//X Y
indiceEstados00 
=00 
tramites00  (
.00( )
	ElementAt00) 2
(002 3
indiceTramite003 @
)00@ A
.00A B
Estados00B I
.00I J
Count00J O
;00O P
}11 
var33 
	patchOpts33 
=33 
new33 
List33  $
<33$ %
PatchOperation33% 3
>333 4
{44 
PatchOperation55 
.55 
Add55 "
(55" #
$"55# %
$str55% /
{55/ 0
indiceTramite550 =
}55= >
$str55> G
{55G H
indiceEstados55H U
}55U V
"55V W
,55W X
estado55Y _
)55_ `
}66 
;66 
var88 
	resultado88 
=88 
await88 !
	container88" +
.88+ ,
PatchItemAsync88, :
<88: ;
Tramite88; B
>88B C
(88C D
	idUsuario88D M
,88M N
new88O R
PartitionKey88S _
(88_ `
	idUsuario88` i
)88i j
,88j k
	patchOpts88l u
)88u v
;88v w
if:: 
(:: 
estado:: 
.:: 
NombreEstado:: #
.::# $
Equals::$ *
(::* +
_configuration::+ 9
[::9 :
$str::: O
]::O P
)::P Q
)::Q R
await;; 
InactivarCita;; #
(;;# $
	idUsuario;;$ -
,;;- .
	idTramite;;/ 8
);;8 9
;;;9 :
return== 
	resultado== 
.== 

StatusCode== '
.==' (
ToString==( 0
(==0 1
)==1 2
;==2 3
}>> 	
public@@ 
async@@ 
Task@@ 
CrearTramite@@ &
(@@& '
Agenda@@' -
tramite@@. 5
)@@5 6
{AA 	
tryBB 
{CC 
ItemResponseDD 
<DD 
AgendaDD #
>DD# $
itemResponseDD% 1
=DD2 3
awaitDD4 9
	containerDD: C
.DDC D
ReadItemAsyncDDD Q
<DDQ R
AgendaDDR X
>DDX Y
(DDY Z
tramiteDDZ a
.DDa b
IdDDb d
,DDd e
newDDf i
PartitionKeyDDj v
(DDv w
tramiteDDw ~
.DD~ 
Id	DD Å
)
DDÅ Ç
)
DDÇ É
;
DDÉ Ñ
awaitEE 
	containerEE 
.EE  
PatchItemAsyncEE  .
<EE. /
AgendaEE/ 5
>EE5 6
(EE6 7
tramiteEE7 >
.EE> ?
IdEE? A
,EEA B
newEEC F
PartitionKeyEEG S
(EES T
tramiteEET [
.EE[ \
IdEE\ ^
)EE^ _
,EE_ `
newGG 
[GG 
]GG 
{GG 
PatchOperationHH #
.HH# $
AddHH$ '
(HH' (
$"HH( *
$strHH* 4
{HH4 5
itemResponseHH5 A
.HHA B
ResourceHHB J
.HHJ K
TramitesHHK S
.HHS T
CountHHT Y
}HHY Z
"HHZ [
,HH[ \
tramiteHH] d
.HHd e
TramitesHHe m
[HHm n
$numHHn o
]HHo p
)HHp q
}II 
)II 
;II 
}JJ 
catchKK 
(KK 
CosmosExceptionKK "
exKK# %
)KK% &
whenKK' +
(KK, -
exKK- /
.KK/ 0

StatusCodeKK0 :
==KK; =
HttpStatusCodeKK> L
.KKL M
NotFoundKKM U
)KKU V
{LL 
awaitMM 
	containerMM 
.MM  
CreateItemAsyncMM  /
(MM/ 0
tramiteMM0 7
,MM7 8
newMM9 <
PartitionKeyMM= I
(MMI J
tramiteMMJ Q
.MMQ R
IdMMR T
)MMT U
)MMU V
;MMV W
}NN 
}OO 	
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
ListQQ 
<QQ 
CitasDtoQQ '
>QQ' (
>QQ( )
ObtenerCitasQQ* 6
(QQ6 7
stringQQ7 =
	idUsuarioQQ> G
)QQG H
{RR 	
varSS 
citasSS 
=SS 
newSS 
ListSS  
<SS  !
CitasDtoSS! )
>SS) *
(SS* +
)SS+ ,
{SS- .
}SS/ 0
;SS0 1
tryTT 
{UU 
varVV 
queryStringVV 
=VV  !
@$"VV" %
$strVd% 5
"dd5 6
;dd6 7
varff 
queryDefff 
=ff 
newff "
QueryDefinitionff# 2
(ff2 3
queryStringff3 >
)ff> ?
;ff? @
queryDefgg 
.gg 
WithParametergg &
(gg& '
$strgg' 3
,gg3 4
	idUsuariogg5 >
)gg> ?
;gg? @
varii 
queryii 
=ii 
	containerii %
.ii% & 
GetItemQueryIteratorii& :
<ii: ;
CitasDtoii; C
>iiC D
(iiD E
queryDefiiE M
)iiM N
;iiN O
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
;ll> ?
citasmm 
.mm 
AddRangemm "
(mm" #
responsemm# +
.mm+ ,
ToListmm, 2
(mm2 3
)mm3 4
)mm4 5
;mm5 6
}nn 
returnpp 
citaspp 
;pp 
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
returntt 
citastt 
;tt 
}uu 
}vv 	
publicxx 
asyncxx 
Taskxx 
<xx 
SolicitudesDtoxx (
>xx( )&
ValidarCantidadSolicitudesxx* D
(xxD E
stringxxE K
	idUsuarioxxL U
)xxU V
{yy 	
SolicitudesDtozz 
cantidadzz #
=zz$ %
nullzz& *
;zz* +
try{{ 
{|| 
var}} 
queryString}} 
=}}  !
$@"}}" %
$str	}Ç% =
{
ÇÇ= >
DateTime
ÇÇ> F
.
ÇÇF G
Today
ÇÇG L
:
ÇÇL M
$str
ÇÇM i
}
ÇÇi j
$str
ÇÉj ;
{
ÉÉ; <
DateTime
ÉÉ< D
.
ÉÉD E
Today
ÉÉE J
.
ÉÉJ K
AddDays
ÉÉK R
(
ÉÉR S
$num
ÉÉS T
)
ÉÉT U
:
ÉÉU V
$str
ÉÉV r
}
ÉÉr s
$str
ÉÉs t
"
ÉÉt u
;
ÉÉu v
var
ÖÖ 
queryDef
ÖÖ 
=
ÖÖ 
new
ÖÖ "
QueryDefinition
ÖÖ# 2
(
ÖÖ2 3
queryString
ÖÖ3 >
)
ÖÖ> ?
;
ÖÖ? @
queryDef
ÜÜ 
.
ÜÜ 
WithParameter
ÜÜ &
(
ÜÜ& '
$str
ÜÜ' 3
,
ÜÜ3 4
	idUsuario
ÜÜ5 >
)
ÜÜ> ?
;
ÜÜ? @
var
àà 
query
àà 
=
àà 
	container
àà %
.
àà% &"
GetItemQueryIterator
àà& :
<
àà: ;
SolicitudesDto
àà; I
>
ààI J
(
ààJ K
queryDef
ààK S
)
ààS T
;
ààT U
while
ââ 
(
ââ 
query
ââ 
.
ââ 
HasMoreResults
ââ +
)
ââ+ ,
{
ää 
var
ãã 
response
ãã  
=
ãã! "
await
ãã# (
query
ãã) .
.
ãã. /
ReadNextAsync
ãã/ <
(
ãã< =
)
ãã= >
;
ãã> ?
cantidad
åå 
=
åå 
response
åå '
.
åå' (
SingleOrDefault
åå( 7
(
åå7 8
)
åå8 9
;
åå9 :
}
çç 
return
èè 
cantidad
èè 
;
èè  
}
êê 
catch
ëë 
(
ëë 
CosmosException
ëë "
ex
ëë# %
)
ëë% &
when
ëë' +
(
ëë, -
ex
ëë- /
.
ëë/ 0

StatusCode
ëë0 :
==
ëë; =
HttpStatusCode
ëë> L
.
ëëL M
NotFound
ëëM U
)
ëëU V
{
íí 
return
ìì 
cantidad
ìì 
;
ìì  
}
îî 
}
ïï 	
public
óó 
async
óó 
Task
óó 
<
óó 
ValidarTramiteDto
óó +
>
óó+ ,#
ValidarServicioActivo
óó- B
(
óóB C
string
óóC I
	idUsuario
óóJ S
,
óóS T
string
óóU [

idServicio
óó\ f
)
óóf g
{
òò 	
ValidarTramiteDto
ôô 
tramite
ôô %
=
ôô& '
null
ôô( ,
;
ôô, -
try
öö 
{
õõ 
var
úú 
queryString
úú 
=
úú  !
$str
ú§" K
;
§§K L
var
¶¶ 
queryDef
¶¶ 
=
¶¶ 
new
¶¶ "
QueryDefinition
¶¶# 2
(
¶¶2 3
queryString
¶¶3 >
)
¶¶> ?
;
¶¶? @
queryDef
ßß 
.
ßß 
WithParameter
ßß &
(
ßß& '
$str
ßß' 3
,
ßß3 4
	idUsuario
ßß5 >
)
ßß> ?
;
ßß? @
queryDef
®® 
.
®® 
WithParameter
®® &
(
®®& '
$str
®®' 0
,
®®0 1
true
®®2 6
)
®®6 7
;
®®7 8
queryDef
©© 
.
©© 
WithParameter
©© &
(
©©& '
$str
©©' 4
,
©©4 5

idServicio
©©6 @
)
©©@ A
;
©©A B
var
´´ 
query
´´ 
=
´´ 
	container
´´ %
.
´´% &"
GetItemQueryIterator
´´& :
<
´´: ;
ValidarTramiteDto
´´; L
>
´´L M
(
´´M N
queryDef
´´N V
)
´´V W
;
´´W X
while
¨¨ 
(
¨¨ 
query
¨¨ 
.
¨¨ 
HasMoreResults
¨¨ +
)
¨¨+ ,
{
≠≠ 
var
ÆÆ 
response
ÆÆ  
=
ÆÆ! "
await
ÆÆ# (
query
ÆÆ) .
.
ÆÆ. /
ReadNextAsync
ÆÆ/ <
(
ÆÆ< =
)
ÆÆ= >
;
ÆÆ> ?
tramite
ØØ 
=
ØØ 
response
ØØ &
.
ØØ& '
SingleOrDefault
ØØ' 6
(
ØØ6 7
)
ØØ7 8
;
ØØ8 9
}
∞∞ 
return
≤≤ 
tramite
≤≤ 
;
≤≤ 
}
≥≥ 
catch
¥¥ 
(
¥¥ 
CosmosException
¥¥ "
ex
¥¥# %
)
¥¥% &
when
¥¥' +
(
¥¥, -
ex
¥¥- /
.
¥¥/ 0

StatusCode
¥¥0 :
==
¥¥; =
HttpStatusCode
¥¥> L
.
¥¥L M
NotFound
¥¥M U
)
¥¥U V
{
µµ 
return
∂∂ 
tramite
∂∂ 
;
∂∂ 
}
∑∑ 
}
∏∏ 	
public
∫∫ 
async
∫∫ 
Task
∫∫ 
<
∫∫ 
	EstadoDto
∫∫ #
>
∫∫# $
ValidarEstado
∫∫% 2
(
∫∫2 3
string
∫∫3 9
	idUsuario
∫∫: C
,
∫∫C D
string
∫∫E K
	idTramite
∫∫L U
,
∫∫U V
string
∫∫W ]
estado
∫∫^ d
)
∫∫d e
{
ªª 	
	EstadoDto
ºº 
data
ºº 
=
ºº 
null
ºº !
;
ºº! "
try
ΩΩ 
{
ææ 
var
øø 
queryString
øø 
=
øø  !
$@"
øø" %
$str
ø¬% R
{
¬¬R S
estado
¬¬S Y
}
¬¬Y Z
$str
¬∆Z ?
"
∆∆? @
;
∆∆@ A
var
»» 
queryDef
»» 
=
»» 
new
»» "
QueryDefinition
»»# 2
(
»»2 3
queryString
»»3 >
)
»»> ?
;
»»? @
queryDef
…… 
.
…… 
WithParameter
…… &
(
……& '
$str
……' 3
,
……3 4
	idUsuario
……5 >
)
……> ?
;
……? @
queryDef
   
.
   
WithParameter
   &
(
  & '
$str
  ' 3
,
  3 4
	idTramite
  5 >
)
  > ?
;
  ? @
var
ÃÃ 
query
ÃÃ 
=
ÃÃ 
	container
ÃÃ %
.
ÃÃ% &"
GetItemQueryIterator
ÃÃ& :
<
ÃÃ: ;
	EstadoDto
ÃÃ; D
>
ÃÃD E
(
ÃÃE F
queryDef
ÃÃF N
)
ÃÃN O
;
ÃÃO P
while
ÕÕ 
(
ÕÕ 
query
ÕÕ 
.
ÕÕ 
HasMoreResults
ÕÕ +
)
ÕÕ+ ,
{
ŒŒ 
var
œœ 
response
œœ  
=
œœ! "
await
œœ# (
query
œœ) .
.
œœ. /
ReadNextAsync
œœ/ <
(
œœ< =
)
œœ= >
;
œœ> ?
data
–– 
=
–– 
response
–– #
.
––# $
SingleOrDefault
––$ 3
(
––3 4
)
––4 5
;
––5 6
}
—— 
return
”” 
data
”” 
;
”” 
}
‘‘ 
catch
’’ 
(
’’ 
CosmosException
’’ "
ex
’’# %
)
’’% &
when
’’' +
(
’’, -
ex
’’- /
.
’’/ 0

StatusCode
’’0 :
==
’’; =
HttpStatusCode
’’> L
.
’’L M
NotFound
’’M U
)
’’U V
{
÷÷ 
return
◊◊ 
data
◊◊ 
;
◊◊ 
}
ÿÿ 
}
ŸŸ 	
public
€€ 
async
€€ 
Task
€€ 
<
€€ 
CitasDto
€€ "
>
€€" #
ObtenerCita
€€$ /
(
€€/ 0
string
€€0 6
	idUsuario
€€7 @
,
€€@ A
string
€€B H
idCita
€€I O
)
€€O P
{
‹‹ 	
CitasDto
›› 
data
›› 
=
›› 
null
››  
;
››  !
try
ﬁﬁ 
{
ﬂﬂ 
var
‡‡ 
queryString
‡‡ 
=
‡‡  !
$@"
‡‡" %
$str
‡Ô% ;
"
ÔÔ; <
;
ÔÔ< =
var
ÒÒ 
queryDef
ÒÒ 
=
ÒÒ 
new
ÒÒ "
QueryDefinition
ÒÒ# 2
(
ÒÒ2 3
queryString
ÒÒ3 >
)
ÒÒ> ?
;
ÒÒ? @
queryDef
ÚÚ 
.
ÚÚ 
WithParameter
ÚÚ &
(
ÚÚ& '
$str
ÚÚ' 3
,
ÚÚ3 4
	idUsuario
ÚÚ5 >
)
ÚÚ> ?
;
ÚÚ? @
queryDef
ÛÛ 
.
ÛÛ 
WithParameter
ÛÛ &
(
ÛÛ& '
$str
ÛÛ' 3
,
ÛÛ3 4
idCita
ÛÛ5 ;
)
ÛÛ; <
;
ÛÛ< =
var
ÙÙ 
query
ÙÙ 
=
ÙÙ 
	container
ÙÙ %
.
ÙÙ% &"
GetItemQueryIterator
ÙÙ& :
<
ÙÙ: ;
CitasDto
ÙÙ; C
>
ÙÙC D
(
ÙÙD E
queryDef
ÙÙE M
)
ÙÙM N
;
ÙÙN O
while
ıı 
(
ıı 
query
ıı 
.
ıı 
HasMoreResults
ıı +
)
ıı+ ,
{
ˆˆ 
var
˜˜ 
response
˜˜  
=
˜˜! "
await
˜˜# (
query
˜˜) .
.
˜˜. /
ReadNextAsync
˜˜/ <
(
˜˜< =
)
˜˜= >
;
˜˜> ?
data
¯¯ 
=
¯¯ 
response
¯¯ #
.
¯¯# $
SingleOrDefault
¯¯$ 3
(
¯¯3 4
)
¯¯4 5
;
¯¯5 6
}
˘˘ 
return
˚˚ 
data
˚˚ 
;
˚˚ 
}
¸¸ 
catch
˝˝ 
(
˝˝ 
CosmosException
˝˝ "
ex
˝˝# %
)
˝˝% &
when
˝˝' +
(
˝˝, -
ex
˝˝- /
.
˝˝/ 0

StatusCode
˝˝0 :
==
˝˝; =
HttpStatusCode
˝˝> L
.
˝˝L M
NotFound
˝˝M U
)
˝˝U V
{
˛˛ 
return
ˇˇ 
data
ˇˇ 
;
ˇˇ 
}
ÄÄ 
}
ÅÅ 	
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
InactivarCita
ÉÉ '
(
ÉÉ' (
string
ÉÉ( .
	idUsuario
ÉÉ/ 8
,
ÉÉ8 9
string
ÉÉ: @
idCita
ÉÉA G
)
ÉÉG H
{
ÑÑ 	
List
ÖÖ 
<
ÖÖ 
CitasDto
ÖÖ 
>
ÖÖ 
citas
ÖÖ  
=
ÖÖ! "
await
ÖÖ# (
ObtenerCitas
ÖÖ) 5
(
ÖÖ5 6
	idUsuario
ÖÖ6 ?
)
ÖÖ? @
;
ÖÖ@ A
int
ÜÜ 
indexTramite
ÜÜ 
=
ÜÜ 
citas
ÜÜ $
.
ÜÜ$ %
	FindIndex
ÜÜ% .
(
ÜÜ. /
cita
ÜÜ/ 3
=>
ÜÜ4 6
cita
ÜÜ7 ;
.
ÜÜ; <
	PkTramite
ÜÜ< E
.
ÜÜE F
Equals
ÜÜF L
(
ÜÜL M
idCita
ÜÜM S
)
ÜÜS T
)
ÜÜT U
;
ÜÜU V
await
áá 
	container
áá 
.
áá 
PatchItemAsync
áá *
<
áá* +
Agenda
áá+ 1
>
áá1 2
(
áá2 3
	idUsuario
áá3 <
,
áá< =
new
áá> A
PartitionKey
ááB N
(
ááN O
	idUsuario
ááO X
)
ááX Y
,
ááY Z
new
àà 
[
àà 
]
àà 
{
àà 
PatchOperation
ââ #
.
ââ# $
Set
ââ$ '
(
ââ' (
$"
ââ( *
$str
ââ* 4
{
ââ4 5
indexTramite
ââ5 A
}
ââA B
$str
ââB I
"
ââI J
,
ââJ K
false
ââL Q
)
ââQ R
}
ää 
)
ää 
;
ää 
}
ãã 	
}
åå 
}çç ´
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Repositories\UsuarioRepository.cs
	namespace		 	
FxAgendamiento		
 
.		 
Repositories		 %
{

 
public 

class 
UsuarioRepository "
:# $
IUsuarioRepository% 7
{ 
	protected 
IDbTransaction  
Transaction! ,
{- .
get/ 2
;2 3
private4 ;
set< ?
;? @
}A B
	protected 
IDbConnection 

Connection  *
=>+ -
Transaction. 9
.9 :

Connection: D
;D E
public 
UsuarioRepository  
(  !
IDbTransaction! /
transaction0 ;
); <
{ 	
Transaction 
= 
transaction %
;% &
} 	
public 
async 
Task 
< 

UsuarioDto $
>$ %
ObtenerUsuario& 4
(4 5
string5 ;
	IdUsuario< E
)E F
{ 	
string 
sqlQuery 
= 
$str$ =
;$$= >
var&& 

parameters&& 
=&& 
new&&  
DynamicParameters&&! 2
(&&2 3
)&&3 4
;&&4 5

parameters'' 
.'' 
Add'' 
('' 
$str'' &
,''& '
	IdUsuario''( 1
,''1 2
DbType''3 9
.''9 :
String'': @
)''@ A
;''A B

UsuarioDto)) 
data)) 
=)) 
await)) #

Connection))$ .
.)). /$
QueryFirstOrDefaultAsync))/ G
<))G H

UsuarioDto))H R
>))R S
())S T
sqlQuery))T \
,))\ ]

parameters))^ h
,))h i
Transaction))j u
)))u v
;))v w
return** 
data** 
;** 
}++ 	
},, 
}-- Ü
bC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Services\HttpService.cs
	namespace 	
FxAgendamiento
 
. 
Services !
{ 
public 

class 
HttpService 
: 
IHttpService +
{ 
private 
readonly 

HttpClient #
_client$ +
;+ ,
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
public 
HttpService 
( 

HttpClient %
client& ,
,, -
IConfiguration. <
configuration= J
)J K
{ 	
_client 
= 
client 
; 
_configuration 
= 
configuration *
;* +
} 	
public 
async 
Task 
< 
HttpResponseMessage -
>- .
GetAsync/ 7
(7 8
string8 >
data? C
)C D
{ 	
string 
url 
= 
ConstruirURL %
(% &
data& *
)* +
;+ ,
return 
await 
_client  
.  !
GetAsync! )
() *
url* -
)- .
;. /
} 	
public 
string 
ConstruirURL "
(" #
string# )
data* .
). /
{ 	
string   
urlBase   
=   
_configuration   +
[  + ,
$str  , A
]  A B
;  B C

Dictionary"" 
<"" 
string"" 
,"" 
string"" %
>""% &
values""' -
="". /
new""0 3
(""3 4
)""4 5
{## 
{$$ 
_configuration$$ !
[$$! "
$str$$" 9
]$$9 :
,$$: ;
data$$< @
}$$B C
}%% 
;%% 
var'' 
uri'' 
='' 
QueryHelpers'' "
.''" #
AddQueryString''# 1
(''1 2
urlBase''2 9
,''9 :
values''; A
)''A B
;''B C
return(( 
new(( 
Uri(( 
((( 
uri(( 
)(( 
.((  
ToString((  (
(((( )
)(() *
;((* +
})) 	
}** 
}++ ”^
eC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Services\MessageService.cs
	namespace 	
FxAgendamiento
 
. 
Services !
{ 
public 

class 
MessageService 
:  !
IMessageService" 1
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IServiceBusService +
_serviceBus, 7
;7 8
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IHttpService %
_httpService& 2
;2 3
public 
MessageService 
( 
IConfiguration ,
configuration- :
,: ;
IServiceBusService< N

serviceBusO Y
,Y Z
IUnitOfWork[ f

unitOfWorkg q
,q r
IHttpServices 
httpService
Ä ã
)
ã å
{ 	
_configuration 
= 
configuration *
;* +
_serviceBus 
= 

serviceBus $
;$ %
_unitOfWork 
= 

unitOfWork $
;$ %
_httpService 
= 
httpService &
;& '
} 	
public!! 
IServiceBusService!! !

ServiceBus!!" ,
{"" 	
get## 
{## 
return## 
_serviceBus## $
;##$ %
}##& '
}$$ 	
public&& 
async&& 
Task&& 
CrearMensaje&& &
(&&& '
string&&' -
email&&. 3
,&&3 4

ValoresDto&&5 ?
values&&@ F
,&&F G
string&&H N
	operacion&&O X
)&&X Y
{'' 	
ServiceBusClient(( 
client(( #
=(($ %
_serviceBus((& 1
.((1 2
GetServiceBusClient((2 E
(((E F
)((F G
;((G H
RequestEnvioMail)) 
mensaje)) $
=))% &
await))' ,
ConstruirRequest))- =
())= >
email))> C
,))C D
values))E K
,))K L
	operacion))M V
)))V W
;))W X
await** 
_serviceBus** 
.** 
EnviarMensaje** +
(**+ ,
client**, 2
,**2 3
JsonConvert**4 ?
.**? @
SerializeObject**@ O
(**O P
mensaje**P W
)**W X
)**X Y
;**Y Z
}++ 	
public-- 
string-- 
ObtenerCodigoQR-- %
(--% &
string--& ,
cadena--- 3
)--3 4
{.. 	
string// 
qrCode// 
=// 
string// "
.//" #
Empty//# (
;//( )
var00 
result00 
=00 
_httpService00 %
.00% &
GetAsync00& .
(00. /
cadena00/ 5
)005 6
.006 7

GetAwaiter007 A
(00A B
)00B C
.00C D
	GetResult00D M
(00M N
)00N O
;00O P
var11 
qrCodeResult11 
=11 
result11 %
.11% &
Content11& -
.11- .
ReadAsStringAsync11. ?
(11? @
)11@ A
.11A B

GetAwaiter11B L
(11L M
)11M N
.11N O
	GetResult11O X
(11X Y
)11Y Z
;11Z [
if33 
(33 
!33 
qrCodeResult33 
.33 
IsNullOrWhiteSpace33 0
(330 1
)331 2
&&333 5
result336 <
.33< =
IsSuccessStatusCode33= P
)33P Q
{44 
dynamic55 
qr55 
=55 
JsonConvert55 (
.55( )
DeserializeObject55) :
(55: ;
qrCodeResult55; G
)55G H
;55H I
qrCode66 
=66 
qr66 
.66 
qrbase6466 $
;66$ %
}77 
return99 
qrCode99 
;99 
}:: 	
public<< 
string<< 
ConstruirURL<< "
(<<" #
PlantillaDto<<# /
	plantilla<<0 9
,<<9 :

ValoresDto<<; E
values<<F L
)<<L M
{== 	
return>> 
string>> 
.>> 
Concat>>  
(>>  !
	plantilla>>! *
.>>* +
param_url_base>>+ 9
,>>9 :
$char>>; >
,>>> ?
values>>@ F
.>>F G
	IdTramite>>G P
)>>P Q
;>>Q R
}?? 	
publicAA 

DictionaryAA 
<AA 
stringAA  
,AA  !
stringAA" (
>AA( )#
GetDictionaryParametersAA* A
(AAA B

ValoresDtoAAB L
valuesAAM S
,AAS T
PlantillaDtoAAU a
	plantillaAAb k
,AAk l
stringAAm s
	operacionAAt }
)AA} ~
{BB 	
stringCC 
cadenaCC 
=CC 
ConstruirURLCC (
(CC( )
	plantillaCC) 2
,CC2 3
valuesCC4 :
)CC: ;
;CC; <
stringDD 
codigoQRDD 
=DD 
ObtenerCodigoQRDD -
(DD- .
cadenaDD. 4
)DD4 5
;DD5 6

DictionaryFF 
<FF 
stringFF 
,FF 
stringFF %
>FF% &
valoresFF' .
=FF/ 0
newFF1 4
(FF4 5
)FF5 6
{GG 
{HH 
$strHH 
,HH  
valuesHH! '
.HH' (
NombreHH( .
}HH. /
,HH/ 0
{II 
$strII "
,II" #
valuesII$ *
.II* +
	DireccionII+ 4
}II6 7
,II7 8
{JJ 
$strJJ (
,JJ( )
valuesJJ* 0
.JJ0 1
NombreServicioJJ1 ?
}JJA B
,JJB C
{KK 
$strKK #
,KK# $
valuesKK% +
.KK+ ,
FechaKK, 1
}KK2 3
,KK3 4
{LL 
$strLL "
,LL" #
valuesLL$ *
.LL* +
HoraLL+ /
}LL0 1
,LL1 2
{MM 
$strMM 
,MM  
valuesMM! '
.MM' (
TiempoMM( .
}MM/ 0
,MM0 1
{NN 
$strNN "
,NN" #
	plantillaNN$ -
.NN- .
param_url_baseNN. <
}NN> ?
}OO 
;OO 
ifQQ 
(QQ 
	operacionQQ 
.QQ 
EqualsQQ  
(QQ  !
$strQQ! /
)QQ/ 0
)QQ0 1
valoresRR 
.RR 
AddRR 
(RR 
$strRR )
,RR) *
$"RR+ -
$strRR- C
{RRC D
codigoQRRRD L
}RRL M
"RRM N
)RRN O
;RRO P
returnTT 
valoresTT 
;TT 
}UU 	
publicWW 
	ParametroWW 
[WW 
]WW 
ConstruirParametrosWW .
(WW. /
PlantillaDtoWW/ ;
	plantillaWW< E
,WWE F

ValoresDtoWWG Q
valuesWWR X
,WWX Y
stringWWZ `
	operacionWWa j
)WWj k
{XX 	
varYY 
valoresYY 
=YY #
GetDictionaryParametersYY 1
(YY1 2
valuesYY2 8
,YY8 9
	plantillaYY: C
,YYC D
	operacionYYE N
)YYN O
;YYO P
varZZ 
parametrosEnvioZZ 
=ZZ  !
newZZ" %
ListZZ& *
<ZZ* +
	ParametroZZ+ 4
>ZZ4 5
(ZZ5 6
)ZZ6 7
;ZZ7 8
var[[ 

parametros[[ 
=[[ 
	plantilla[[ &
.[[& '
orden_parametros[[' 7
.[[7 8
Split[[8 =
([[= >
$str[[> A
)[[A B
;[[B C
foreach\\ 
(\\ 
var\\ 
param\\ 
in\\ !

parametros\\" ,
)\\, -
{]] 
parametrosEnvio^^ 
.^^  
Add^^  #
(^^# $
new^^$ '
	Parametro^^( 1
(^^1 2
)^^2 3
{__ 
Nombre`` 
=`` 
param`` "
,``" #
Valoraa 
=aa 
valoresaa #
[aa# $
paramaa$ )
]aa) *
}bb 
)bb 
;bb 
}cc 
returndd 
parametrosEnviodd "
.dd" #
ToArraydd# *
(dd* +
)dd+ ,
;dd, -
}ee 	
publicgg 
asyncgg 
Taskgg 
<gg 
RequestEnvioMailgg *
>gg* +
ConstruirRequestgg, <
(gg< =
stringgg= C
emailggD I
,ggI J

ValoresDtoggK U
valuesggV \
,gg\ ]
stringgg^ d
	operaciongge n
)ggn o
{hh 	
stringii 
clienteii 
=ii 
_configurationii +
[ii+ ,
$strii, E
]iiE F
;iiF G
stringjj 
serviciojj 
=jj 
_configurationjj ,
[jj, -
$strjj- G
]jjG H
;jjH I
stringkk 
	plantillakk 
=kk 
_configurationkk -
[kk- .
$"kk. 0
$strkk0 E
{kkE F
	operacionkkF O
}kkO P
"kkP Q
]kkQ R
;kkR S
PlantillaDtoll 
responsell !
=ll" #
awaitll$ )
_unitOfWorkll* 5
.ll5 6
EmailRepositoryll6 E
.llE F)
ObtenerConfiguracionPlantillallF c
(llc d
clientelld k
,llk l
serviciollm u
,llu v
	plantilla	llw Ä
)
llÄ Å
;
llÅ Ç
RequestEnvioMailmm 
mensajemm $
=mm% &
newmm' *
(mm* +
)mm+ ,
{nn 
Fuenteoo 
=oo 
	operacionoo "
,oo" #
	IdClientepp 
=pp 
responsepp $
.pp$ %
clientepp% ,
.pp, -
ToStringpp- 5
(pp5 6
)pp6 7
,pp7 8

IdServicioqq 
=qq 
responseqq %
.qq% &
servicioqq& .
.qq. /
ToStringqq/ 7
(qq7 8
)qq8 9
,qq9 :

IdTemplaterr 
=rr 
responserr %
.rr% &
	plantillarr& /
.rr/ 0
ToStringrr0 8
(rr8 9
)rr9 :
,rr: ;
Destinatarioss 
=ss 
emailss $
,ss$ %
MascaraDestinatariott #
=tt$ %
valuestt& ,
.tt, -
Nombrett- 3
}uu 
;uu 
ifww 
(ww 
	operacionww 
.ww 
Equalsww  
(ww  !
$strww! /
)ww/ 0
)ww0 1
mensajexx 
.xx 
Agendamientoxx $
=xx% &
newxx' *
(xx* +
)xx+ ,
{yy 
	IdTramitezz 
=zz 
valueszz  &
.zz& '
	IdTramitezz' 0
,zz0 1
	IdUsuario{{ 
={{ 
values{{  &
.{{& '
IdUser{{' -
,{{- .
Estado|| 
=|| 
_configuration|| +
[||+ ,
$str||, B
]||B C
}}} 
;}} 
if 
( 
response 
. 
es_dinamica $
)$ %
mensaje
ÄÄ 
.
ÄÄ 

Parametros
ÄÄ "
=
ÄÄ# $!
ConstruirParametros
ÄÄ% 8
(
ÄÄ8 9
response
ÄÄ9 A
,
ÄÄA B
values
ÄÄC I
,
ÄÄI J
	operacion
ÄÄK T
)
ÄÄT U
;
ÄÄU V
return
ÇÇ 
mensaje
ÇÇ 
;
ÇÇ 
}
ÉÉ 	
}
ÑÑ 
}ÖÖ ˝
hC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Services\ServiceBusService.cs
	namespace		 	
FxAgendamiento		
 
.		 
Services		 !
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
ServiceBusClient* :
(: ;
connectionString; K
,K L
clientOptionsM Z
)Z [
;[ \
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
}11 ÷P
UC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Startup.cs
[ 
assembly 	
:	 

FunctionsStartup 
( 
typeof "
(" #
Startup# *
)* +
)+ ,
], -
	namespace 	
FxAgendamiento
 
{ 
public 

class 
Startup 
: 
FunctionsStartup +
{   
public!! 
override!! 
void!! 
	Configure!! &
(!!& '!
IFunctionsHostBuilder!!' <
builder!!= D
)!!D E
{"" 	
var## 
keyVaultName## 
=## 
Environment## *
.##* +"
GetEnvironmentVariable##+ A
(##A B
$str##B R
)##R S
;##S T
var$$ 
kvUri$$ 
=$$ 
$"$$ 
$str$$ "
{$$" #
keyVaultName$$# /
}$$/ 0
$str$$0 A
"$$A B
;$$B C
var&& 
tenant&& 
=&& 
new&& )
DefaultAzureCredentialOptions&& :
{''  
VisualStudioTenantId(( $
=((% &
Environment((' 2
.((2 3"
GetEnvironmentVariable((3 I
(((I J
$str((J Y
)((Y Z
})) 
;))  
ConfigurationBuilder++   
configurationBuilder++! 5
=++6 7
new++8 ;
(++; <
)++< =
;++= >
var,, 
configuration,, 
=,,  
configurationBuilder,,  4
.-- 
SetBasePath-- 
(-- 
	Directory-- &
.--& '
GetCurrentDirectory--' :
(--: ;
)--; <
)--< =
... 
AddJsonFile.. 
(.. 
$str.. 2
,..2 3
optional..4 <
:..< =
true..> B
,..B C
reloadOnChange..D R
:..R S
true// 
)// 
.00 
AddAzureKeyVault00 !
(00! "
vaultUri00" *
:00* +
new00, /
Uri000 3
(003 4
kvUri004 9
)009 :
,00: ;

credential00< F
:00F G
new00H K"
DefaultAzureCredential00L b
(00b c
tenant00c i
)00i j
)00j k
.11 #
AddEnvironmentVariables11 (
(11( )
)11) *
.22 
Build22 
(22 
)22 
;22 
string44 
nombreAccount44  
=44! "
configuration44# 0
[440 1
$str441 K
]44K L
;44L M
string55 
nombreSecreto55  
=55! "
configuration55# 0
[550 1
$str551 C
]55C D
;55D E
string77 
account77 
=77 
configuration77 *
[77* +
nombreAccount77+ 8
]778 9
;779 :
string88 
key88 
=88 
configuration88 &
[88& '
nombreSecreto88' 4
]884 5
;885 6
string99 
databaseName99 
=99  !
configuration99" /
[99/ 0
$str990 C
]99C D
;99D E
builder;; 
.;; 
Services;; 
.;; 
AddSingleton;; )
<;;) *
SecretClient;;* 6
>;;6 7
(;;7 8
);;8 9
;;;9 :
builder<< 
.<< 
Services<< 
.<< 
AddSingleton<< )
<<<) *
DapperContext<<* 7
><<7 8
(<<8 9
)<<9 :
;<<: ;
builder== 
.== 
Services== 
.== 
AddAutoMapper== *
(==* +
typeof==+ 1
(==1 2
Startup==2 9
)==9 :
)==: ;
;==; <
CosmosClientBuilder?? 
clientBuilder??  -
=??. /
new??0 3
(??3 4
account??4 ;
,??; <
key??= @
)??@ A
;??A B
CosmosClient@@ 
client@@ 
=@@  !
clientBuilder@@" /
.AA 
WithApplicationNameAA $
(AA$ %
databaseNameAA% 1
)AA1 2
.BB 
WithApplicationNameBB $
(BB$ %
RegionsBB% ,
.BB, -
EastUS2BB- 4
)BB4 5
.CC $
WithConnectionModeDirectCC )
(CC) *
)CC* +
.DD !
WithSerializerOptionsDD &
(DD& '
newDD' *&
CosmosSerializationOptionsDD+ E
(DDE F
)DDF G
{DDH I 
PropertyNamingPolicyDDJ ^
=DD_ `&
CosmosPropertyNamingPolicyDDa {
.DD{ |
	CamelCase	DD| Ö
}
DDÜ á
)
DDá à
.EE 
BuildEE 
(EE 
)EE 
;EE 
builderGG 
.GG 
ServicesGG 
.GG 
AddSingletonGG )
(GG) *
serviceProviderGG* 9
=>GG: <
{HH 
returnII 
clientII 
;II 
}JJ 
)JJ 
;JJ 
builderLL 
.LL 
ServicesLL 
.LL 

AddMvcCoreLL '
(LL' (
)LL( )
.LL) *
AddNewtonsoftJsonLL* ;
(LL; <
jsonOptionsLL< G
=>LLH J
{MM 
jsonOptionsNN 
.NN 
SerializerSettingsNN .
.NN. /
NullValueHandlingNN/ @
=NNA B
NullValueHandlingNNC T
.NNT U
IncludeNNU \
;NN\ ]
}OO 
)OO 
;OO 
stringSS 

ApiKeyNameSS 
=SS 
configurationSS  -
[SS- .
$strSS. E
]SSE F
;SSF G
stringTT 
ApiKeyTT 
=TT 
configurationTT )
[TT) *

ApiKeyNameTT* 4
]TT4 5
;TT5 6
builderVV 
.VV 
ServicesVV 
.VV 
AddHttpClientVV *
(VV* +
)VV+ ,
;VV, -
builderWW 
.WW 
ServicesWW 
.WW 
AddHttpClientWW *
<WW* +
IHttpServiceWW+ 7
,WW7 8
HttpServiceWW9 D
>WWD E
(WWE F
clientWWF L
=>WWM O
{XX 
clientYY 
.YY !
DefaultRequestHeadersYY ,
.YY, -
AcceptYY- 3
.YY3 4
AddYY4 7
(YY7 8
newYY8 ;+
MediaTypeWithQualityHeaderValueYY< [
(YY[ \
$strYY\ n
)YYn o
)YYo p
;YYp q
clientZZ 
.ZZ !
DefaultRequestHeadersZZ ,
.ZZ, -
AddZZ- 0
(ZZ0 1
$strZZ1 L
,ZZL M
ApiKeyZZN T
)ZZT U
;ZZU V
}[[ 
)[[ 
;[[ 
builderaa 
.aa 
Servicesaa 
.aa 
	AddScopedaa &
<aa& '
IMallaRepositoryaa' 7
,aa7 8
MallaRepositoryaa9 H
>aaH I
(aaI J
)aaJ K
;aaK L
builderbb 
.bb 
Servicesbb 
.bb 
	AddScopedbb &
<bb& '
ISedeRepositorybb' 6
,bb6 7
SedeRepositorybb8 F
>bbF G
(bbG H
)bbH I
;bbI J
buildercc 
.cc 
Servicescc 
.cc 
	AddScopedcc &
<cc& '
IServicioRepositorycc' :
,cc: ;
ServicioRepositorycc< N
>ccN O
(ccO P
)ccP Q
;ccQ R
builderdd 
.dd 
Servicesdd 
.dd 
	AddScopeddd &
<dd& '
ITramiteRepositorydd' 9
,dd9 :
TramiteRepositorydd; L
>ddL M
(ddM N
)ddN O
;ddO P
builderee 
.ee 
Servicesee 
.ee 
	AddScopedee &
<ee& '
IEmailRepositoryee' 7
,ee7 8
EmailRepositoryee9 H
>eeH I
(eeI J
)eeJ K
;eeK L
builderff 
.ff 
Servicesff 
.ff 
	AddScopedff &
<ff& '
IUsuarioRepositoryff' 9
,ff9 :
UsuarioRepositoryff; L
>ffL M
(ffM N
)ffN O
;ffO P
builderll 
.ll 
Servicesll 
.ll 
	AddScopedll &
<ll& '

IValidatorll' 1
<ll1 2
AgendaInputll2 =
>ll= >
,ll> ? 
AgendaInputValidatorll@ T
>llT U
(llU V
)llV W
;llW X
buildermm 
.mm 
Servicesmm 
.mm 
	AddScopedmm &
<mm& '

IValidatormm' 1
<mm1 2
NuevoEstadoInputmm2 B
>mmB C
,mmC D 
NuevoEstadoValidatormmE Y
>mmY Z
(mmZ [
)mm[ \
;mm\ ]
buildernn 
.nn 
Servicesnn 
.nn 
	AddScopednn &
<nn& '

IValidatornn' 1
<nn1 2
CancelacionInputnn2 B
>nnB C
,nnC D 
CancelacionValidatornnE Y
>nnY Z
(nnZ [
)nn[ \
;nn\ ]
builderrr 
.rr 
Servicesrr 
.rr 
AddTransientrr )
<rr) *
IUnitOfWorkrr* 5
,rr5 6

UnitOfWorkrr7 A
>rrA B
(rrB C
)rrC D
;rrD E
builderss 
.ss 
Servicesss 
.ss 
AddSingletonss )
<ss) *
IServiceBusServicess* <
,ss< =
ServiceBusServicess> O
>ssO P
(ssP Q
)ssQ R
;ssR S
buildertt 
.tt 
Servicestt 
.tt 
AddTransienttt )
<tt) *
IMessageServicett* 9
,tt9 :
MessageServicett; I
>ttI J
(ttJ K
)ttK L
;ttL M
buildervv 
.vv 
Servicesvv 
.vv 
AddSingletonvv )
<vv) *
IConfigurationvv* 8
>vv8 9
(vv9 :
configurationvv: G
)vvG H
;vvH I
}ww 	
}xx 
}yy ∑
fC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Utils\HttpResponseHelper.cs
	namespace 	
FxAgendamiento
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
} Ì
bC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Utils\SecurityHelper.cs
	namespace 	
FxAgendamiento
 
. 
Utils 
{ 
public		 

static		 
class		 
SecurityHelper		 &
{

 
public 
static 
string 
SHA256Encrypt *
(* +
string+ 1
llave2 7
)7 8
{ 	
SHA256 
sha256 
= 
SHA256 "
." #
Create# )
() *
)* +
;+ ,
ASCIIEncoding 
encoding "
=# $
new% (
(( )
)) *
;* +
StringBuilder 
sb 
= 
new "
(" #
)# $
;$ %
byte 
[ 
] 
stream 
= 
sha256 "
." #
ComputeHash# .
(. /
encoding/ 7
.7 8
GetBytes8 @
(@ A
llaveA F
)F G
)G H
;H I
for 
( 
int 
i 
= 
$num 
; 
i 
< 
stream  &
.& '
Length' -
;- .
i/ 0
++0 2
)2 3
sb4 6
.6 7
AppendFormat7 C
(C D
$strD L
,L M
streamN T
[T U
iU V
]V W
)W X
;X Y
return 
$str 
+ 
sb 
. 
ToString %
(% &
)& '
.' (
ToUpper( /
(/ 0
)0 1
;1 2
} 	
public 
static 
string 
CalcularLlave *
(* +
AgendaInput+ 6
request7 >
)> ?
{ 	
return 
SHA256Encrypt  
(  !
string" (
.( )
Concat) /
(/ 0
request0 7
.7 8
	IdUsuario8 A
,A B
request0 7
.7 8

IdServicio8 B
,B C
request0 7
.7 8
IdSede8 >
,> ?
request0 7
.7 8
	IdSubSede8 A
,A B
request0 7
.7 8
IdMalla8 ?
,? @
DateTime0 8
.8 9
Now9 <
.< =
ToString= E
(E F
$strF [
)[ \
,\ ]
Guid0 4
.4 5
NewGuid5 <
(< =
)= >
.> ?
ToString? G
(G H
)H I
)0 1
)1 2
;2 3
}   	
}!! 
}"" –<
^C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Utils\TimeHelper.cs
	namespace 	
FxAgendamiento
 
. 
Utils 
{ 
public		 

static		 
class		 

TimeHelper		 "
{

 
public 
static 
List 
< 
DateTime #
># $
ObtenerHoras% 1
(1 2
AgendaInput2 =
request> E
,E F
SedeDtoG N
sedeO S
,S T
ServicioDtoU `
servicioa i
)i j
{ 	
DateTime 

HoraInicio 
=  !
DateTime" *
.* +

ParseExact+ 5
(5 6
request6 =
.= >
HoraAgendamiento> N
,N O
$strP W
,W X
nullY ]
)] ^
;^ _
int 
finRango 
= 
CalcularIntervalos -
(- .
sede. 2
,2 3
servicio4 <
)< =
;= >
int 
	intervalo 
= 
( 
int  
)  !
sede! %
.% &
IntervaloAtencion& 7
;7 8
List 
< 
DateTime 
> 
horas  
=! "
new# &
(& '
)' (
;( )
for 
( 
int 
i 
= 
$num 
; 
i 
< 
finRango  (
;( )
i* +
+++ -
)- .
{ 
if 
( 
i 
== 
$num 
) 
{ 
horas 
. 
Add 
( 

HoraInicio (
.( )

AddMinutes) 3
(3 4
$num4 5
)5 6
)6 7
;7 8
} 
else 
{ 
horas 
. 
Add 
( 
horas #
[# $
i$ %
-& '
$num( )
]) *
.* +

AddMinutes+ 5
(5 6
	intervalo6 ?
)? @
)@ A
;A B
} 
} 
return 
horas 
; 
}   	
public"" 
static"" 
string"" 
["" 
]"" 
CambiarHoras"" +
(""+ ,
List"", 0
<""0 1
DateTime""1 9
>""9 :
horas""; @
)""@ A
{## 	
List$$ 
<$$ 
string$$ 
>$$ 
result$$ 
=$$  !
new$$" %
($$% &
)$$& '
{$$( )
}$$* +
;$$+ ,
foreach&& 
(&& 
var&& 
fecha&& 
in&& !
horas&&" '
)&&' (
{'' 
result(( 
.(( 
Add(( 
((( 
string(( !
.((! "
Concat((" (
(((( )
$char(() -
,((- .
fecha((/ 4
.((4 5
ToString((5 =
(((= >
$str((> E
)((E F
,((F G
$char((H L
)((L M
)((M N
;((N O
})) 
return** 
result** 
.** 
ToArray** !
(**! "
)**" #
;**# $
}++ 	
public-- 
static-- 
int-- 
CalcularIntervalos-- ,
(--, -
SedeDto--- 4
sede--5 9
,--9 :
ServicioDto--; F
servicio--G O
)--O P
{.. 	
var// 
	respuesta// 
=// 
Convert// #
.//# $
	ToDecimal//$ -
(//- .
Convert//. 5
.//5 6
ToDouble//6 >
(//> ?
servicio//? G
.//G H
tiempoAtencion//H V
)//V W
///X Y
Convert//Z a
.//a b
ToDouble//b j
(//j k
sede//k o
.//o p
IntervaloAtencion	//p Å
)
//Å Ç
)
//Ç É
;
//É Ñ
return11 
(11 
int11 
)11 
Math11 
.11 
Ceiling11 $
(11$ %
	respuesta11% .
)11. /
;11/ 0
}22 	
public44 
static44 
bool44 
ValidacionFecha44 *
(44* +
string44+ 1
fecha442 7
)447 8
{55 	
return66 
ConvertirFecha66 !
(66! "
fecha66" '
)66' (
.66( )
Date66) -
>=66. 0 
ObtenerFechaColombia661 E
(66E F
)66F G
.66G H
Date66H L
;66L M
}77 	
public88 
static88 
DateTime88  
ObtenerFechaColombia88 3
(883 4
)884 5
{99 	
TimeZoneInfo;; 
zonaColombia;; %
=;;& '
TimeZoneInfo;;( 4
.;;4 5"
FindSystemTimeZoneById;;5 K
(;;K L
$str;;L c
);;c d
;;;d e
DateTime<< 
today<< 
=<< 
TimeZoneInfo<< )
.<<) *
ConvertTime<<* 5
(<<5 6
DateTime<<6 >
.<<> ?
UtcNow<<? E
,<<E F
zonaColombia<<G S
)<<S T
;<<T U
return== 
today== 
;== 
}>> 	
public@@ 
static@@ 
DateTime@@ 
ConvertirFecha@@ -
(@@- .
string@@. 4
fecha@@5 :
)@@: ;
{AA 	
tryBB 
{CC 
varDD 
datosDD 
=DD 
fechaDD !
.DD! "
SplitDD" '
(DD' (
$strDD( +
)DD+ ,
;DD, -
intEE 
yearEE 
=EE 
intEE 
.EE 
ParseEE $
(EE$ %
datosEE% *
[EE* +
$numEE+ ,
]EE, -
.EE- .
SplitEE. 3
(EE3 4
)EE4 5
[EE5 6
$numEE6 7
]EE7 8
)EE8 9
;EE9 :
intFF 
monthFF 
=FF 
intFF 
.FF  
ParseFF  %
(FF% &
datosFF& +
[FF+ ,
$numFF, -
]FF- .
)FF. /
;FF/ 0
intGG 
dayGG 
=GG 
intGG 
.GG 
ParseGG #
(GG# $
datosGG$ )
[GG) *
$numGG* +
]GG+ ,
)GG, -
;GG- .
TimeZoneInfoHH 
zonaColombiaHH )
=HH* +
TimeZoneInfoHH, 8
.HH8 9"
FindSystemTimeZoneByIdHH9 O
(HHO P
$strHHP g
)HHg h
;HHh i
DateTimeII 
convertDateII $
=II% &
newII' *
(II* +
yearII+ /
,II/ 0
monthII1 6
,II6 7
dayII8 ;
)II; <
;II< =
DateTimeLL 
fechaColombiaLL &
=LL' (
TimeZoneInfoLL) 5
.LL5 6
ConvertTimeLL6 A
(LLA B
convertDateLLB M
,LLM N
zonaColombiaLLO [
)LL[ \
;LL\ ]
returnOO 
fechaColombiaOO $
;OO$ %
}PP 
catchQQ 
(QQ 
	ExceptionQQ 
)QQ 
{RR 
returnTT 
newTT 
(TT 
$numTT 
,TT  
$numTT! "
,TT" #
$numTT$ %
)TT% &
;TT& '
}UU 
}WW 	
}XX 
}YY  y
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Validator\AgendaInputValidator.cs
	namespace 	
FxAgendamiento
 
. 
	Validator "
{ 
public 

class  
AgendaInputValidator %
:& '
AbstractValidator( 9
<9 :
AgendaInput: E
>E F
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
int &
cantidadSolicitudesDiarias 7
;7 8
public  
AgendaInputValidator #
(# $
IConfiguration$ 2
config3 9
,9 :
IUnitOfWork; F

unitOfWorkG Q
)Q R
{ 	
_config 
= 
config 
; 
_unitOfWork 
= 

unitOfWork $
;$ %&
cantidadSolicitudesDiarias &
=' (
_config) 0
.0 1
GetValue1 9
<9 :
int: =
>= >
(> ?
$str? e
)e f
;f g
RuleFor   
(   
property   
=>   
property    (
.  ( )
	IdUsuario  ) 2
)  2 3
.!! 
NotEmpty!! 
(!! 
)!! 
."" 
NotNull"" 
("" 
)"" 
."" 
WithMessage"" &
(""& '
$str""' R
)""R S
.## 
Must## 
(## 
(## 
property## 
,##  
	IdUsuario##! *
)##* +
=>##, .
ValidarUsuario##/ =
(##= >
	IdUsuario##> G
)##G H
)##H I
.##I J
WithMessage##J U
(##U V
$str	##V ¡
)
##¡ ¬
.$$ 
Must$$ 
($$ 
($$ 
property$$ 
,$$  
	IdUsuario$$! *
)$$* +
=>$$, .$
ValidarCitaActivaUsuario$$/ G
($$G H
property$$H P
)$$P Q
)$$Q R
.$$R S
WithMessage$$S ^
($$^ _
$str	$$_ æ
)
$$æ ø
.%% 
Must%% 
(%% 
(%% 
property%% 
,%%  
	IdUsuario%%! *
)%%* +
=>%%, .%
ValidarSolicitudesDiarias%%/ H
(%%H I
property%%I Q
)%%Q R
)%%R S
.%%S T
WithMessage%%T _
(%%_ `
$str	%%` ≈
)
%%≈ ∆
;
%%∆ «
RuleFor(( 
((( 
property(( 
=>(( 
property((  (
.((( )
IdMalla(() 0
)((0 1
.)) 
NotEmpty)) 
()) 
))) 
.** 
NotNull** 
(** 
)** 
.** 
WithMessage** %
(**% &
$str**& Q
)**Q R
.++ 
Must++ 
(++ 
(++ 
property++ 
,++ 
IdMalla++  '
)++' (
=>++) +
VerificarMalla++, :
(++: ;
IdMalla++; B
)++B C
)++C D
.++D E
WithMessage++E P
(++P Q
$str++Q 
)	++ Ä
;
++Ä Å
RuleFor-- 
(-- 
property-- 
=>-- 
property--  (
.--( )
IdSede--) /
)--/ 0
... 
NotEmpty.. 
(.. 
).. 
.// 
NotNull// 
(// 
)// 
.// 
WithMessage// &
(//& '
$str//' R
)//R S
.00 
Must00 
(00 
property00 
=>00 !
VerificarSede00" /
(00/ 0
property000 8
)008 9
)009 :
.00: ;
WithMessage00; F
(00F G
$str00G t
)00t u
;00u v
RuleFor22 
(22 
property22 
=>22 
property22  (
.22( )
	IdSubSede22) 2
)222 3
.33 
NotEmpty33 
(33 
)33 
.44 
NotNull44 
(44 
)44 
.44 
WithMessage44 &
(44& '
$str44' R
)44R S
.55 
Must55 
(55 
(55 
property55 
,55  
	IdSubSede55! *
)55* +
=>55, .
VerificarSubSede55/ ?
(55? @
property55@ H
)55H I
)55I J
.55J K
WithMessage55K V
(55V W
$str	55W á
)
55á à
;
55à â
RuleFor88 
(88 
property88 
=>88 
property88  (
.88( )

IdServicio88) 3
)883 4
.99 
NotEmpty99 
(99 
)99 
.:: 
NotNull:: 
(:: 
):: 
.:: 
WithMessage:: %
(::% &
$str::& Q
)::Q R
.;; 
Must;; 
(;; 
property;; 
=>;;  
VerificarServicio;;! 2
(;;2 3
property;;3 ;
);;; <
);;< =
.;;= >
WithMessage;;> I
(;;I J
$str;;J z
);;z {
.<< 
Must<< 
(<< 
(<< 
property<< 
,<<  

IdServicio<<! +
)<<+ ,
=><<- /
VerificarServicio<<0 A
(<<A B

IdServicio<<B L
)<<L M
)<<M N
.<<N O
WithMessage<<O Z
(<<Z [
$str	<<[ ã
)
<<ã å
;
<<å ç
RuleFor?? 
(?? 
property?? 
=>?? 
property??  (
.??( )
FechaAgendamiento??) :
)??: ;
.@@ 
NotEmpty@@ 
(@@ 
)@@ 
.AA 
NotNullAA 
(AA 
)AA 
.AA 
WithMessageAA &
(AA& '
$strAA' R
)AAR S
.BB 
MatchesBB 
(BB 
_configBB  
[BB  !
$strBB! 8
]BB8 9
)BB9 :
.BB: ;
WithMessageBB; F
(BBF G
$str	BBG á
)
BBá à
.CC 
MustCC 
(CC 
(CC 
propertyCC 
,CC  
FechaAgendamientoCC! 2
)CC2 3
=>CC4 6
ValidacionFechaCC7 F
(CCF G
FechaAgendamientoCCG X
)CCX Y
)CCY Z
.CCZ [
WithMessageCC[ f
(CCf g
$str	CCg ø
)
CCø ¿
;
CC¿ ¡
RuleForGG 
(GG 
propertyGG 
=>GG 
propertyGG  (
.GG( )
HoraAgendamientoGG) 9
)GG9 :
.HH 
NotEmptyHH 
(HH 
)HH 
.II 
NotNullII 
(II 
)II 
.II 
WithMessageII &
(II& '
$strII' R
)IIR S
.JJ 
MatchesJJ 
(JJ 
_configJJ  
[JJ  !
$strJJ! 7
]JJ7 8
)JJ8 9
.JJ9 :
WithMessageJJ: E
(JJE F
$str	JJF å
)
JJå ç
.KK 
MustKK 
(KK 
(KK 
propertyKK 
,KK  
FechaAgendamientoKK! 2
)KK2 3
=>KK4 6%
ValidacionFechaHabilitadaKK7 P
(KKP Q
propertyKKQ Y
)KKY Z
)KKZ [
.KK[ \
WithMessageKK\ g
(KKg h
$str	KKh ¥
)
KK¥ µ
;
KKµ ∂
RuleForNN 
(NN 
propertyNN 
=>NN 
propertyNN  (
.NN( )
IpNN) +
)NN+ ,
.OO 
NotEmptyOO 
(OO 
)OO 
.PP 
NotNullPP 
(PP 
)PP 
.PP 
WithMessagePP %
(PP% &
$strPP& Q
)PPQ R
.QQ 
MatchesQQ 
(QQ 
_configQQ 
[QQ  
$strQQ  =
]QQ= >
)QQ> ?
.QQ? @
WithMessageQQ@ K
(QQK L
$strQQL f
)QQf g
;QQg h
}RR 	
privateTT 
boolTT %
ValidacionFechaHabilitadaTT .
(TT. /
AgendaInputTT/ :
propertyTT; C
)TTC D
{UU 	
ListVV 
<VV 
	TiempoDtoVV 
>VV 
tiemposVV #
=VV$ %
_unitOfWorkVV& 1
.VV1 2
MallaRepositoryVV2 A
.VVA B
ValidarEspacioVVB P
(VVP Q
propertyVVQ Y
.VVY Z
IdMallaVVZ a
,VVa b
propertyVVc k
.VVk l
IdSedeVVl r
,VVr s
propertyVVt |
.VV| }
	IdSubSede	VV} Ü
,
VVÜ á
property
VVà ê
.
VVê ë
FechaAgendamiento
VVë ¢
)
VV¢ £
.
VV£ §

GetAwaiter
VV§ Æ
(
VVÆ Ø
)
VVØ ∞
.
VV∞ ±
	GetResult
VV± ∫
(
VV∫ ª
)
VVª º
;
VVº Ω
ifYY 
(YY 
tiemposYY 
.YY 
AnyYY 
(YY 
)YY 
)YY 
{ZZ 
var[[ 
data[[ 
=[[ 
tiempos[[ "
.[[" #
Where[[# (
([[( )
t[[) *
=>[[+ -
t[[. /
.[[/ 0

HoraInicio[[0 :
.[[: ;
Equals[[; A
([[A B
property[[B J
.[[J K
HoraAgendamiento[[K [
)[[[ \
&&[[] _
t\\) *
.\\* +
AgendaDisponible\\+ ;
&&\\< >
!]]) *
t]]* +
.]]+ ,
UsuariosVetados]], ;
.]]; <
Contains]]< D
(]]D E
property]]E M
.]]M N
	IdUsuario]]N W
)]]W X
)]]X Y
.^^( )
Select^^) /
(^^/ 0
t^^0 1
=>^^1 3
t^^4 5
)^^5 6
;^^6 7
return__ 
!__ 
data__ 
.__ 
IsEmpty__ $
(__$ %
)__% &
;__& '
}`` 
elseaa 
{bb 
returncc 
falsecc 
;cc 
}dd 
}ff 	
privatehh 
boolhh 
ValidarUsuariohh #
(hh# $
stringhh$ *
	idUsuariohh+ 4
)hh4 5
{ii 	
varjj 
datajj 
=jj 
_unitOfWorkjj "
.jj" #
UsuarioRepositoryjj# 4
.jj4 5
ObtenerUsuariojj5 C
(jjC D
	idUsuariojjD M
)jjM N
.jjN O

GetAwaiterjjO Y
(jjY Z
)jjZ [
.jj[ \
	GetResultjj\ e
(jje f
)jjf g
;jjg h
returnkk 
datakk 
!=kk 
nullkk 
;kk  
}ll 	
privatenn 
staticnn 
boolnn 
ValidacionFechann +
(nn+ ,
stringnn, 2
fechann3 8
)nn8 9
{oo 	
returnqq 

TimeHelperqq 
.qq 
ValidacionFechaqq -
(qq- .
fechaqq. 3
)qq3 4
;qq4 5
}rr 	
privatett 
booltt 
VerificarServiciott &
(tt& '
stringtt' -

idServiciott. 8
)tt8 9
{uu 	
varvv 
datavv 
=vv 
_unitOfWorkvv "
.vv" #
ServicioRepositoryvv# 5
.vv5 6+
ObtenerTiempodeAtencionServiciovv6 U
(vvU V

idServiciovvV `
)vv` a
;vva b
returnww 
dataww 
!=ww 
nullww 
;ww  
}xx 	
privatezz 
boolzz 
VerificarSubSedezz %
(zz% &
AgendaInputzz& 1
propertyzz2 :
)zz: ;
{{{ 	
return|| 
_unitOfWork|| 
.|| 
SedeRepository|| -
.||- .
ExisteSubSede||. ;
(||; <
property||< D
.||D E
IdSede||E K
,||K L
property||M U
.||U V
	IdSubSede||V _
)||_ `
.||` a

GetAwaiter||a k
(||k l
)||l m
.||m n
	GetResult||n w
(||w x
)||x y
;||y z
}}} 	
private 
bool 
VerificarMalla #
(# $
string$ *
idMalla+ 2
)2 3
{
ÄÄ 	
return
ÅÅ 
_unitOfWork
ÅÅ 
.
ÅÅ 
MallaRepository
ÅÅ .
.
ÅÅ. /

ExistMalla
ÅÅ/ 9
(
ÅÅ9 :
idMalla
ÅÅ: A
)
ÅÅA B
.
ÅÅB C

GetAwaiter
ÅÅC M
(
ÅÅM N
)
ÅÅN O
.
ÅÅO P
	GetResult
ÅÅP Y
(
ÅÅY Z
)
ÅÅZ [
;
ÅÅ[ \
}
ÇÇ 	
private
ÑÑ 
bool
ÑÑ 
VerificarSede
ÑÑ "
(
ÑÑ" #
string
ÑÑ# )
property
ÑÑ* 2
)
ÑÑ2 3
{
ÖÖ 	
return
ÜÜ 
_unitOfWork
ÜÜ 
.
ÜÜ 
SedeRepository
ÜÜ -
.
ÜÜ- .

ExisteSede
ÜÜ. 8
(
ÜÜ8 9
property
ÜÜ9 A
)
ÜÜA B
.
ÜÜB C

GetAwaiter
ÜÜC M
(
ÜÜM N
)
ÜÜN O
.
ÜÜO P
	GetResult
ÜÜP Y
(
ÜÜY Z
)
ÜÜZ [
;
ÜÜ[ \
}
áá 	
private
àà 
bool
àà '
ValidarSolicitudesDiarias
àà .
(
àà. /
AgendaInput
àà/ :
property
àà; C
)
ààC D
{
ââ 	
SolicitudesDto
ää 
cantidad
ää #
=
ää$ %
_unitOfWork
ää& 1
.
ää1 2
TramiteRepository
ää2 C
.
ääC D(
ValidarCantidadSolicitudes
ääD ^
(
ää^ _
property
ää_ g
.
ääg h
	IdUsuario
ääh q
)
ääq r
.
äär s

GetAwaiter
ääs }
(
ää} ~
)
ää~ 
.ää Ä
	GetResultääÄ â
(ääâ ä
)äää ã
;ääã å
return
åå 
(
åå 
cantidad
åå 
==
åå 
null
åå  $
||
åå% '
cantidad
åå( 0
.
åå0 1!
CantidadSolicitudes
åå1 D
<
ååE F(
cantidadSolicitudesDiarias
ååG a
)
ååa b
;
ååb c
}
éé 	
private
êê 
bool
êê &
ValidarCitaActivaUsuario
êê -
(
êê- .
AgendaInput
êê. 9
property
êê: B
)
êêB C
{
ëë 	
ValidarTramiteDto
íí 
data
íí "
=
íí# $
_unitOfWork
íí% 0
.
íí0 1
TramiteRepository
íí1 B
.
ííB C#
ValidarServicioActivo
ííC X
(
ííX Y
property
ííY a
.
íía b
	IdUsuario
ííb k
,
íík l
property
íím u
.
ííu v

IdServicioíív Ä
)ííÄ Å
.ííÅ Ç

GetAwaiterííÇ å
(ííå ç
)ííç é
.ííé è
	GetResultííè ò
(ííò ô
)ííô ö
;ííö õ
return
ìì 
data
ìì 
==
ìì 
null
ìì 
;
ìì  
}
ïï 	
}
ññ 
}óó °B
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Validator\CancelacionValidator.cs
	namespace 	
FxAgendamiento
 
. 
	Validator "
{ 
public 

class  
CancelacionValidator %
:& '
AbstractValidator( 9
<9 :
CancelacionInput: J
>J K
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public  
CancelacionValidator #
(# $
IConfiguration$ 2
config3 9
,9 :
IUnitOfWork; F

unitOfWorkG Q
)Q R
{ 	
_config 
= 
config 
; 
_unitOfWork 
= 

unitOfWork $
;$ %
RuleFor 
( 
property 
=> 
property  (
.( )
	IdUsuario) 2
)2 3
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage %
(% &
$str& Q
)Q R
.   
Must   
(   
(   
property   
,   
	IdUsuario    )
)  ) *
=>  + -
ValidarUsuario  . <
(  < =
	IdUsuario  = F
)  F G
)  G H
.  H I
WithMessage  I T
(  T U
$str	  U ó
)
  ó ò
;
  ò ô
RuleFor## 
(## 
property## 
=>## 
property##  (
.##( )
	IdTramite##) 2
)##2 3
.$$ 
NotEmpty$$ 
($$ 
)$$ 
.%% 
NotNull%% 
(%% 
)%% 
.%% 
WithMessage%% #
(%%# $
$str%%$ O
)%%O P
.&& 
Must&& 
(&& 
(&& 
property&& 
,&& 
	IdUsuario&& '
)&&' (
=>&&) +
ValidarTramite&&, :
(&&: ;
property&&; C
)&&C D
)&&D E
.&&E F
WithMessage&&F Q
(&&Q R
$str	&&R ∂
)
&&∂ ∑
;
&&∑ ∏
RuleFor(( 
((( 
property(( 
=>(( 
property((  (
.((( )
IdMalla(() 0
)((0 1
.)) 
NotEmpty)) 
()) 
))) 
.** 
NotNull** 
(** 
)** 
.** 
WithMessage** $
(**$ %
$str**% P
)**P Q
.++ 
Must++ 
(++ 
(++ 
property++ 
,++ 
IdMalla++ &
)++& '
=>++( *
VerificarMalla+++ 9
(++9 :
IdMalla++: A
)++A B
)++B C
.++C D
WithMessage++D O
(++O P
$str++P ~
)++~ 
;	++ Ä
RuleFor-- 
(-- 
property--  
=>--! #
property--$ ,
.--, -
IdSede--- 3
)--3 4
... 
NotEmpty.. 
(.. 
).. 
.// 
NotNull// 
(// 
)// 
.// 
WithMessage// %
(//% &
$str//& Q
)//Q R
.00 
Must00 
(00 
property00 
=>00  
VerificarSede00! .
(00. /
property00/ 7
)007 8
)008 9
.009 :
WithMessage00: E
(00E F
$str00F s
)00s t
;00t u
RuleFor22 
(22 
property22  
=>22! #
property22$ ,
.22, -
	IdSubSede22- 6
)226 7
.33 
NotEmpty33 
(33 
)33 
.44 
NotNull44 
(44 
)44 
.44 
WithMessage44 '
(44' (
$str44( S
)44S T
.55 
Must55 
(55 
(55 
property55  
,55  !
	IdSubSede55" +
)55+ ,
=>55- /
VerificarSubSede550 @
(55@ A
property55A I
)55I J
)55J K
.55K L
WithMessage55L W
(55W X
$str	55X à
)
55à â
;
55â ä
RuleFor99 
(99 
property99 
=>99 
property99  (
.99( )
	FechaCita99) 2
)992 3
.:: 
NotEmpty:: 
(:: 
):: 
.;; 
NotNull;; 
(;; 
);; 
.;; 
WithMessage;; %
(;;% &
$str;;& Q
);;Q R
.<< 
Matches<< 
(<< 
_config<< 
[<<  
$str<<  7
]<<7 8
)<<8 9
.<<9 :
WithMessage<<: E
(<<E F
$str	<<F Ü
)
<<Ü á
;
<<á à
}>> 	
private@@ 
bool@@ 
ValidarUsuario@@ #
(@@# $
string@@$ *
	idUsuario@@+ 4
)@@4 5
{AA 	
varBB 
dataBB 
=BB 
_unitOfWorkBB "
.BB" #
UsuarioRepositoryBB# 4
.BB4 5
ObtenerUsuarioBB5 C
(BBC D
	idUsuarioBBD M
)BBM N
.BBN O

GetAwaiterBBO Y
(BBY Z
)BBZ [
.BB[ \
	GetResultBB\ e
(BBe f
)BBf g
;BBg h
returnCC 
dataCC 
!=CC 
nullCC 
;CC  
}DD 	
privateFF 
boolFF 
ValidarTramiteFF #
(FF# $
CancelacionInputFF$ 4
propertyFF5 =
)FF= >
{GG 	
CitasDtoHH 
dataHH 
=HH 
_unitOfWorkHH '
.HH' (
TramiteRepositoryHH( 9
.HH9 :
ObtenerCitaHH: E
(HHE F
propertyHHF N
.HHN O
	IdUsuarioHHO X
,HHX Y
propertyHHZ b
.HHb c
	IdTramiteHHc l
)HHl m
.HHm n

GetAwaiterHHn x
(HHx y
)HHy z
.HHz {
	GetResult	HH{ Ñ
(
HHÑ Ö
)
HHÖ Ü
;
HHÜ á
ifJJ 
(JJ 
dataJJ 
!=JJ 
nullJJ 
)JJ 
returnKK 
dataKK 
.KK 
FechaAgendamientoKK -
.KK- .
EqualsKK. 4
(KK4 5
propertyKK5 =
.KK= >
	FechaCitaKK> G
)KKG H
;KKH I
returnLL 
falseLL 
;LL 
}NN 	
privateQQ 
boolQQ 
VerificarSubSedeQQ %
(QQ% &
CancelacionInputQQ& 6
propertyQQ7 ?
)QQ? @
{RR 	
returnSS 
_unitOfWorkSS 
.SS 
SedeRepositorySS -
.SS- .
ExisteSubSedeSS. ;
(SS; <
propertySS< D
.SSD E
IdSedeSSE K
,SSK L
propertySSM U
.SSU V
	IdSubSedeSSV _
)SS_ `
.SS` a

GetAwaiterSSa k
(SSk l
)SSl m
.SSm n
	GetResultSSn w
(SSw x
)SSx y
;SSy z
}TT 	
privateVV 
boolVV 
VerificarMallaVV #
(VV# $
stringVV$ *
idMallaVV+ 2
)VV2 3
{WW 	
returnXX 
_unitOfWorkXX 
.XX 
MallaRepositoryXX .
.XX. /

ExistMallaXX/ 9
(XX9 :
idMallaXX: A
)XXA B
.XXB C

GetAwaiterXXC M
(XXM N
)XXN O
.XXO P
	GetResultXXP Y
(XXY Z
)XXZ [
;XX[ \
}YY 	
private[[ 
bool[[ 
VerificarSede[[ "
([[" #
string[[# )
property[[* 2
)[[2 3
{\\ 	
return]] 
_unitOfWork]] 
.]] 
SedeRepository]] -
.]]- .

ExisteSede]]. 8
(]]8 9
property]]9 A
)]]A B
.]]B C

GetAwaiter]]C M
(]]M N
)]]N O
.]]O P
	GetResult]]P Y
(]]Y Z
)]]Z [
;]][ \
}^^ 	
}__ 
}`` ƒ8
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxAgendamiento\Validator\NuevoEstadoValidator.cs
	namespace

 	
FxAgendamiento


 
.

 
	Validator

 "
{ 
public 

class  
NuevoEstadoValidator %
:& '
AbstractValidator( 9
<9 :
NuevoEstadoInput: J
>J K
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IList 
< 
string %
>% &
estados' .
;. /
public  
NuevoEstadoValidator #
(# $
IConfiguration$ 2
config3 9
,9 :
IUnitOfWork; F

unitOfWorkG Q
)Q R
{ 	
_config 
= 
config 
; 
_unitOfWork 
= 

unitOfWork $
;$ %
estados 
= 
_config 
. 

GetSection (
(( )
$str) 2
)2 3
.3 4
Get4 7
<7 8
List8 <
<< =
string= C
>C D
>D E
(E F
)F G
;G H
RuleFor 
( 
property 
=> 
property  (
.( )
	IdUsuario) 2
)2 3
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' R
)R S
. 
Must 
( 
( 
property 
,  
	IdUsuario! *
)* +
=>, .
ValidarUsuario/ =
(= >
	IdUsuario> G
)G H
)H I
.I J
WithMessageJ U
(U V
$str	V ò
)
ò ô
;
ô ö
RuleFor"" 
("" 
property"" 
=>"" 
property""  (
.""( )
Estado"") /
)""/ 0
.## 
NotEmpty## 
(## 
)## 
.$$ 
NotNull$$ 
($$ 
)$$ 
.$$ 
WithMessage$$ &
($$& '
$str$$' R
)$$R S
.%% 
Must%% 
(%% 
e%% 
=>%% 
estados%% "
.%%" #
Contains%%# +
(%%+ ,
e%%, -
)%%- .
)%%. /
.%%/ 0
WithMessage%%0 ;
(%%; <
$str	%%< à
)
%%à â
;
%%â ä
RuleFor(( 
((( 
property(( 
=>(( 
property((  (
.((( )
	IdTramite(() 2
)((2 3
.)) 
NotEmpty)) 
()) 
))) 
.** 
NotNull** 
(** 
)** 
.** 
WithMessage** &
(**& '
$str**' R
)**R S
.++ 
Must++ 
(++ 
(++ 
property++ 
,++  
	IdUsuario++! *
)++* +
=>++, .
ValidarTramite++/ =
(++= >
property++> F
)++F G
)++G H
.++H I
WithMessage++I T
(++T U
$str	++U ë
)
++ë í
;
++í ì
RuleFor-- 
(-- 
property-- 
=>-- 
property--  (
.--( )

IdCampania--) 3
)--3 4
... 
NotEmpty.. 
(.. 
).. 
... 
When.. 
(..  
p..  !
=>.." $
p..% &
...& '
Estado..' -
...- .
Equals... 4
(..4 5
_config..5 <
[..< =
$str..= S
]..S T
)..T U
)..U V
.// 
NotNull// 
(// 
)// 
.// 
WithMessage// %
(//% &
$str//& Q
)//Q R
.//R S
When//S W
(//W X
p//X Y
=>//Z \
p//] ^
.//^ _
Estado//_ e
.//e f
Equals//f l
(//l m
_config//m t
[//t u
$str	//u ã
]
//ã å
)
//å ç
)
//ç é
;
//é è
RuleFor11 
(11 
property11 
=>11 
property11  (
.11( )
QRCode11) /
)11/ 0
.22 
NotEmpty22 
(22 
)22 
.22 
WithMessage22 &
(22& '
$str22' R
)22R S
.22S T
When22T X
(22X Y
p22Y Z
=>22[ ]
p22^ _
.22_ `
Estado22` f
.22f g
Equals22g m
(22m n
_config22n u
[22u v
$str	22v å
]
22å ç
)
22ç é
)
22é è
.33 
NotNull33 
(33 
)33 
.33 
WithMessage33 %
(33% &
$str33& Q
)33Q R
.33R S
When33S W
(33W X
p33X Y
=>33Z \
p33] ^
.33^ _
Estado33_ e
.33e f
Equals33f l
(33l m
_config33m t
[33t u
$str	33u ã
]
33ã å
)
33å ç
)
33ç é
;
33é è
}44 	
private66 
bool66 
ValidarUsuario66 #
(66# $
string66$ *
	idUsuario66+ 4
)664 5
{77 	
var88 
data88 
=88 
_unitOfWork88 "
.88" #
UsuarioRepository88# 4
.884 5
ObtenerUsuario885 C
(88C D
	idUsuario88D M
)88M N
.88N O

GetAwaiter88O Y
(88Y Z
)88Z [
.88[ \
	GetResult88\ e
(88e f
)88f g
;88g h
return99 
data99 
!=99 
null99 
;99  
}:: 	
private<< 
bool<< 
ValidarTramite<< #
(<<# $
NuevoEstadoInput<<$ 4
property<<5 =
)<<= >
{== 	
var>> 
data>> 
=>> 
_unitOfWork>> "
.>>" #
TramiteRepository>># 4
.>>4 5
ValidarEstado>>5 B
(>>B C
property>>C K
.>>K L
	IdUsuario>>L U
,>>U V
property>>W _
.>>_ `
	IdTramite>>` i
,>>i j
property>>j r
.>>r s
Estado>>s y
)>>y z
.>>z {

GetAwaiter	>>{ Ö
(
>>Ö Ü
)
>>Ü á
.
>>á à
	GetResult
>>à ë
(
>>ë í
)
>>í ì
;
>>ì î
if?? 
(?? 
data?? 
==?? 
null?? 
)?? 
return@@ 
false@@ 
;@@ 
returnAA 
!AA 
dataAA 
.AA 
estadoAA 
;AA  
}BB 	
}CC 
}DD 