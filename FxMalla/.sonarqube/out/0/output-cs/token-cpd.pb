≠	
bC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\DataContext\DapperContext.cs
	namespace 	
FxMalla
 
. 
DataContext 
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
} œ4
_C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\DataContext\UnitOfWork.cs
	namespace

 	
FxMalla


 
.

 
DataContext

 
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
IUsuarioRepository "
_usuarioRepository# 5
;5 6
private 
bool 
	_disposed 
=  
false! &
;& '
public 

UnitOfWork 
( 
IConfiguration (
configuration) 6
,6 7
CosmosClient8 D
clientE K
,K L
DapperContextM Z
context[ b
)b c
{ 	
_configuration 
= 
configuration *
;* +
_client   
=   
client   
;   
_connection"" 
="" 
context"" !
.""! "
CreateConnection""" 2
(""2 3
)""3 4
;""4 5
_connection## 
.## 
Open## 
(## 
)## 
;## 
_transaction$$ 
=$$ 
_connection$$ &
.$$& '
BeginTransaction$$' 7
($$7 8
)$$8 9
;$$9 :
}%% 	
public'' 
IMallaRepository'' 
MallaRepository''  /
{(( 	
get)) 
{)) 
return)) 
_mallaRepository)) )
??=))* -
new)). 1
MallaRepository))2 A
())A B
_client))B I
,))I J
_configuration))K Y
)))Y Z
;))Z [
}))\ ]
}** 	
public,, 
ISedeRepository,, 
SedeRepository,, -
{-- 	
get.. 
{.. 
return.. 
_sedeRepository.. (
??=..) ,
new..- 0
SedeRepository..1 ?
(..? @
_client..@ G
,..G H
_configuration..I W
)..W X
;..X Y
}..Z [
}// 	
public11 
IServicioRepository11 "
ServicioRepository11# 5
{22 	
get33 
{33 
return33 
_servicioRepository33 ,
??=33- 0
new331 4
ServicioRepository335 G
(33G H
_client33H O
,33O P
_configuration33Q _
)33_ `
;33` a
}33b c
}44 	
public66 
ITramiteRepository66 !
TramiteRepository66" 3
{77 	
get88 
{88 
return88 
_tramiteRepository88 +
??=88, /
new880 3
TramiteRepository884 E
(88E F
_client88F M
,88M N
_configuration88O ]
)88] ^
;88^ _
}88` a
}99 	
public;; 
IUsuarioRepository;; !
UsuarioRepository;;" 3
{<< 	
get== 
{== 
return== 
_usuarioRepository== +
??===, /
new==0 3
UsuarioRepository==4 E
(==E F
_transaction==F R
)==R S
;==S T
}==U V
}>> 	
public@@ 
void@@ 
Commit@@ 
(@@ 
)@@ 
{AA 	
tryBB 
{CC 
_transactionDD 
.DD 
CommitDD #
(DD# $
)DD$ %
;DD% &
}EE 
catchFF 
{GG 
_transactionHH 
.HH 
RollbackHH %
(HH% &
)HH& '
;HH' (
throwII 
;II 
}JJ 
finallyKK 
{LL 
_transactionMM 
.MM 
DisposeMM $
(MM$ %
)MM% &
;MM& '
_transactionNN 
=NN 
_connectionNN *
.NN* +
BeginTransactionNN+ ;
(NN; <
)NN< =
;NN= >
ResetRepositoriesOO !
(OO! "
)OO" #
;OO# $
}PP 
}QQ 	
privateSS 
voidSS 
ResetRepositoriesSS &
(SS& '
)SS' (
{TT 	
_usuarioRepositoryUU 
=UU  
nullUU! %
;UU% &
}VV 	
publicXX 
voidXX 
DisposeXX 
(XX 
)XX 
{YY 	
DisposeZZ 
(ZZ 
trueZZ 
)ZZ 
;ZZ 
GC[[ 
.[[ 
SuppressFinalize[[ 
([[  
this[[  $
)[[$ %
;[[% &
}\\ 	
	protected^^ 
virtual^^ 
void^^ 
Dispose^^ &
(^^& '
bool^^' +
	disposing^^, 5
)^^5 6
{__ 	
if`` 
(`` 
!`` 
	_disposed`` 
)`` 
{aa 
ifbb 
(bb 
	disposingbb 
)bb 
{cc 
ifdd 
(dd 
_transactiondd $
!=dd% '
nulldd( ,
)dd, -
{ee 
_transactionff $
.ff$ %
Disposeff% ,
(ff, -
)ff- .
;ff. /
_transactiongg $
=gg% &
nullgg' +
;gg+ ,
}hh 
ifii 
(ii 
_connectionii #
!=ii$ &
nullii' +
)ii+ ,
{jj 
_connectionkk #
.kk# $
Disposekk$ +
(kk+ ,
)kk, -
;kk- .
_connectionll #
=ll$ %
nullll& *
;ll* +
}mm 
}nn 
	_disposedoo 
=oo 
trueoo  
;oo  !
}pp 
}qq 	
~ss 	

UnitOfWorkss	 
(ss 
)ss 
{tt 	
Disposeuu 
(uu 
falseuu 
)uu 
;uu 
}vv 	
}ww 
}xx ß|
WC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\FxGenerarMalla.cs
	namespace 	
FxMalla
 
{ 
public   

class   
FxGenerarMalla   
{"" 
private## 
readonly## 
IUnitOfWork## $
_unitOfWork##% 0
;##0 1
private$$ 
readonly$$ 

IValidator$$ #
<$$# $

MallaInput$$$ .
>$$. /

_validator$$0 :
;$$: ;
private%% 
readonly%% 
IMapper%%  
_mapper%%! (
;%%( )
private&& 
readonly&& 
IHttpService&& %
_httpService&&& 2
;&&2 3
private(( 
const(( 
string(( 
FORMATO_FECHA(( *
=((+ ,
$str((- 9
;((9 :
private)) 
const)) 
string)) 
FORMATO_HORA)) )
=))* +
$str)), 3
;))3 4
public++ 
FxGenerarMalla++ 
(++ 
IUnitOfWork++ )

unitOfWork++* 4
,++4 5

IValidator++6 @
<++@ A

MallaInput++A K
>++K L
	validator++M V
,++V W
IMapper++X _
mapper++` f
,++f g
IHttpService++h t
httpService	++u Ä
)
++Ä Å
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
;// 
_httpService00 
=00 
httpService00 &
;00& '
}11 	
[33 	
FunctionName33	 
(33 
nameof33 
(33 

CrearMalla33 '
)33' (
)33( )
]33) *
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
$str55' 3
,553 4
tags555 9
:559 :
new55; >
[55> ?
]55? @
{55A B
$str55C P
}55Q R
,55R S
Description55T _
=55` a
$str	55b ë
,
55ë í
Summary
55ì ö
=
55õ ú
$str
55ù Ã
)
55Ã Õ
]
55Õ Œ
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
(77M N

MallaInput77N X
)77X Y
,77Y Z
Required77[ c
=77d e
true77f j
,77j k
Description77l w
=77x y
$str	77z é
)
77é è
]
77è ê
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
><<' (

CrearMalla<<) 3
(<<3 4
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
$str==F R
)==R S
]==S T
HttpRequest==U `
req==a d
)==d e
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
;AA8 9

MallaInputBB 
requestBB "
=BB# $
JsonConvertBB% 0
.BB0 1
DeserializeObjectBB1 B
<BBB C

MallaInputBBC M
>BBM N
(BBN O
jsonBBO S
)BBS T
;BBT U
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
{FF 
MallaGG 
mallaGG 
=GG  !
_mapperGG" )
.GG) *
MapGG* -
<GG- .
MallaGG. 3
>GG3 4
(GG4 5
requestGG5 <
)GG< =
;GG= >
mallaHH 
.HH 
MallasPorSubSedeHH *
=HH+ ,
newHH- 0
ListHH1 5
<HH5 6
MallasPorSubSedeHH6 F
>HHF G
(HHG H
)HHH I
{HHJ K
}HHL M
;HHM N
ListII 
<II 
SedeDtoII  
>II  !
subsedesII" *
=II+ ,
awaitII- 2
_unitOfWorkII3 >
.II> ?
SedeRepositoryII? M
.IIM N
ObtenerSubsedesIIN ]
(II] ^
$"II^ `
$strII` a
{IIa b
mallaIIb g
.IIg h
PkSedeIIh n
}IIn o
$strIIo p
"IIp q
)IIq r
;IIr s
ListJJ 
<JJ 
stringJJ 
>JJ  
festivosJJ! )
=JJ* +
ObtenerFestivosJJ, ;
(JJ; <
requestJJ< C
.JJC D
FechaInicioJJD O
,JJO P
requestJJQ X
.JJX Y
FechaFinJJY a
)JJa b
;JJb c
foreachLL 
(LL 
SedeDtoLL $
subsedeLL% ,
inLL- /
subsedesLL0 8
)LL8 9
{MM 
varNN 
agendaMallaNN '
=NN( )
GenerarMallaSubsedeNN* =
(NN= >
mallaNN> C
,NNC D
subsedeNNE L
,NNL M
festivosNNN V
)NNV W
;NNW X
mallaOO 
.OO 
MallasPorSubSedeOO .
.OO. /
AddOO/ 2
(OO2 3
newPP 
(PP  
)PP  !
{QQ 
	PkSubSedeRR  )
=RR* +
subsedeRR, 3
.RR3 4
	IdSubSedeRR4 =
,RR= >
TiemposAtencionSS  /
=SS0 1
agendaMallaSS2 =
}TT 
)UU 
;UU 
}VV 
stringXX 
resultXX !
=XX" #
awaitXX$ )
_unitOfWorkXX* 5
.XX5 6
MallaRepositoryXX6 E
.XXE F
InsertarMallaAsyncXXF X
(XXX Y
mallaXXY ^
)XX^ _
;XX_ `
ifZZ 
(ZZ 
resultZZ 
.ZZ 
EqualsZZ %
(ZZ% &
$strZZ& 8
)ZZ8 9
)ZZ9 :
{[[ 
await\\ 
_unitOfWork\\ )
.\\) *
MallaRepository\\* 9
.\\9 :
InactivarMallas\\: I
(\\I J
malla\\J O
.\\O P
PkSede\\P V
,\\V W
malla\\X ]
.\\] ^
Id\\^ `
,\\` a
request\\b i
.\\i j
Usuario\\j q
)\\q r
;\\r s
return^^ 
HttpResponseHelper^^ 1
.^^1 2
Response^^2 :
(^^: ;
StatusCodes^^; F
.^^F G
Status201Created^^G W
,^^W X
new^^Y \
ResponseResult^^] k
(^^k l
)^^l m
{^^n o
IsError^^p w
=^^x y
false^^z 
,	^^ Ä
Message
^^Å à
=
^^â ä
$"
^^ã ç
$str
^^ç ª
{
^^ª º
request
^^º √
.
^^√ ƒ
FechaInicio
^^ƒ œ
}
^^œ –
$str
^^– ⁄
{
^^⁄ €
request
^^€ ‚
.
^^‚ „
FechaFin
^^„ Î
}
^^Î Ï
$str
^^Ï Ì
"
^^Ì Ó
}
^^Ô 
)
^^ Ò
;
^^Ò Ú
}__ 
else`` 
{aa 
returnbb 
HttpResponseHelperbb 1
.bb1 2
Responsebb2 :
(bb: ;
StatusCodesbb; F
.bbF G
Status409ConflictbbG X
,bbX Y
newbbZ ]
ResponseResultbb^ l
(bbl m
)bbm n
{bbo p
IsErrorbbq x
=bby z
truebb{ 
,	bb Ä
Message
bbÅ à
=
bbâ ä
$str
bbã º
}
bbΩ æ
)
bbæ ø
;
bbø ¿
}cc 
}dd 
elseee 
{ff 
returngg 
HttpResponseHelpergg -
.gg- .
Responsegg. 6
(gg6 7
StatusCodesgg7 B
.ggB C
Status400BadRequestggC V
,ggV W
newggX [
ResponseResultgg\ j
(ggj k
)ggk l
{hh 
IsErrorii 
=ii  !
trueii" &
,ii& '
Messagejj 
=jj  !
validationResultjj" 2
.jj2 3
Errorsjj3 9
.jj9 :
Firstjj: ?
(jj? @
)jj@ A
.jjA B
ErrorMessagejjB N
}kk 
)kk 
;kk 
}ll 
}mm 
catchnn 
(nn 
	Exceptionnn 
exnn 
)nn  
{oo 
returnpp 
HttpResponseHelperpp )
.pp) *
Responsepp* 2
(pp2 3
StatusCodespp3 >
.pp> ?(
Status500InternalServerErrorpp? [
,pp[ \
newpp] `
ResponseResultppa o
(ppo p
)ppp q
{ppr s
IsErrorppt {
=pp| }
true	pp~ Ç
,
ppÇ É
Message
ppÑ ã
=
ppå ç
ex
ppé ê
.
ppê ë
Message
ppë ò
}
ppô ö
)
ppö õ
;
ppõ ú
}qq 
}rr 	
privatett 
Listtt 
<tt 
Agendatt 
>tt 
GenerarMallaSubsedett 0
(tt0 1
Mallatt1 6
mallatt7 <
,tt< =
SedeDtott> E
subsedettF M
,ttM N
ListttO S
<ttS T
stringttT Z
>ttZ [
festivostt\ d
)ttd e
{uu 	
AgendaInputvv 
inputvv 
=vv 
_mappervv  '
.vv' (
Mapvv( +
<vv+ ,
AgendaInputvv, 7
>vv7 8
(vv8 9
subsedevv9 @
)vv@ A
;vvA B
inputww 
.ww 
FechaInicioww 
=ww 

TimeHelperww  *
.ww* +
ConvertirFechaww+ 9
(ww9 :
mallaww: ?
.ww? @
FechaInicioww@ K
)wwK L
;wwL M
inputxx 
.xx 
FechaFinxx 
=xx 

TimeHelperxx '
.xx' (
ConvertirFechaxx( 6
(xx6 7
mallaxx7 <
.xx< =
FechaFinxx= E
)xxE F
;xxF G
inputyy 
.yy 
InactivaFestivosyy "
=yy# $
subsedeyy% ,
.yy, -
InactivarFestivosyy- >
;yy> ?
varzz 
	resultadozz 
=zz 

TimeHelperzz &
.zz& '
CalcularAgendazz' 5
(zz5 6
inputzz6 ;
,zz; <
festivoszz= E
,zzE F
FORMATO_FECHAzzG T
,zzT U
FORMATO_HORAzzV b
)zzb c
;zzc d
return|| 
	resultado|| 
;|| 
}}} 	
private 
List 
< 
string 
> 
ObtenerFestivos ,
(, -
string- 3
fechaInicio4 ?
,? @
stringA G
fechaFinH P
)P Q
{
ÄÄ 	
List
ÅÅ 
<
ÅÅ 
string
ÅÅ 
>
ÅÅ 
fechasFestivos
ÅÅ '
=
ÅÅ( )
new
ÅÅ* -
(
ÅÅ- .
)
ÅÅ. /
{
ÅÅ0 1
}
ÅÅ2 3
;
ÅÅ3 4
var
ÇÇ 
result
ÇÇ 
=
ÇÇ 
_httpService
ÇÇ %
.
ÇÇ% &
GetAsync
ÇÇ& .
(
ÇÇ. /
fechaInicio
ÇÇ/ :
,
ÇÇ: ;
fechaFin
ÇÇ< D
)
ÇÇD E
.
ÇÇE F

GetAwaiter
ÇÇF P
(
ÇÇP Q
)
ÇÇQ R
.
ÇÇR S
	GetResult
ÇÇS \
(
ÇÇ\ ]
)
ÇÇ] ^
;
ÇÇ^ _
var
ÉÉ 
festivosResult
ÉÉ 
=
ÉÉ  
result
ÉÉ! '
.
ÉÉ' (
Content
ÉÉ( /
.
ÉÉ/ 0
ReadAsStringAsync
ÉÉ0 A
(
ÉÉA B
)
ÉÉB C
.
ÉÉC D

GetAwaiter
ÉÉD N
(
ÉÉN O
)
ÉÉO P
.
ÉÉP Q
	GetResult
ÉÉQ Z
(
ÉÉZ [
)
ÉÉ[ \
;
ÉÉ\ ]
if
ÖÖ 
(
ÖÖ 
!
ÖÖ 
festivosResult
ÖÖ 
.
ÖÖ   
IsNullOrWhiteSpace
ÖÖ  2
(
ÖÖ2 3
)
ÖÖ3 4
&&
ÖÖ5 7
result
ÖÖ8 >
.
ÖÖ> ?!
IsSuccessStatusCode
ÖÖ? R
)
ÖÖR S
{
ÜÜ 
List
áá 
<
áá 
Festivo
áá 
>
áá 
objFestivos
áá )
=
áá* +
JsonConvert
áá, 7
.
áá7 8
DeserializeObject
áá8 I
<
ááI J
List
ááJ N
<
ááN O
Festivo
ááO V
>
ááV W
>
ááW X
(
ááX Y
festivosResult
ááY g
)
áág h
;
ááh i
foreach
àà 
(
àà 
Festivo
àà  
festivo
àà! (
in
àà) +
objFestivos
àà, 7
)
àà7 8
{
ââ 
fechasFestivos
ää "
.
ää" #
Add
ää# &
(
ää& '
festivo
ää' .
.
ää. /
Fecha
ää/ 4
)
ää4 5
;
ää5 6
}
ãã 
}
åå 
return
éé 
fechasFestivos
éé !
;
éé! "
}
èè 	
}
êê 
}ëë  E
VC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\FxObtenerDias.cs
	namespace 	
FxMalla
 
{ 
public 

class 
FxObtenerDias 
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private   
readonly   

IValidator   #
<  # $
Tuple  $ )
<  ) *
string  * 0
,  0 1
string  2 8
>  8 9
>  9 :

_validator  ; E
;  E F
public"" 
FxObtenerDias"" 
("" 
IConfiguration"" +
config"", 2
,""2 3
IUnitOfWork""4 ?

unitOfWork""@ J
,""J K

IValidator""L V
<""V W
Tuple""W \
<""\ ]
string""] c
,""c d
string""e k
>""k l
>""l m
	validator""n w
)""w x
{## 	
_config$$ 
=$$ 
config$$ 
;$$ 
_unitOfWork%% 
=%% 

unitOfWork%% $
;%%$ %

_validator&& 
=&& 
	validator&& "
;&&" #
}'' 	
[)) 	
FunctionName))	 
()) 
nameof)) 
()) 
ObtenerDias)) (
)))( )
)))) *
]))* +
[** 	
FixedDelayRetry**	 
(** 
$num** 
,** 
$str** &
)**& '
]**' (
[++ 	
OpenApiOperation++	 
(++ 
operationId++ %
:++% &
$str++' 4
,++4 5
tags++6 :
:++: ;
new++< ?
[++? @
]++@ A
{++B C
$str++D ^
}++_ `
,++` a
Description++b m
=++n o
$str	++p æ
,
++æ ø
Summary
++¿ «
=
++» …
$str
++  ò
)
++ò ô
]
++ô ö
[,, 	
OpenApiSecurity,,	 
(,, 
$str,, '
,,,' (
SecuritySchemeType,,) ;
.,,; <
ApiKey,,< B
,,,B C
Name,,D H
=,,I J
$str,,K Q
,,,Q R
In,,S U
=,,V W'
OpenApiSecurityLocationType,,X s
.,,s t
Query,,t y
),,y z
],,z {
[-- 	#
OpenApiResponseWithBody--	  
(--  !

statusCode--! +
:--+ ,
HttpStatusCode--- ;
.--; <
OK--< >
,--> ?
contentType--@ K
:--K L
$str--M _
,--_ `
bodyType--a i
:--i j
typeof--k q
(--q r
ResponseResult	--r Ä
)
--Ä Å
,
--Å Ç
Description
--É é
=
--è ê
$str
--ë ü
)
--ü †
]
--† °
[.. 	#
OpenApiResponseWithBody..	  
(..  !

statusCode..! +
:..+ ,
HttpStatusCode..- ;
...; <

BadRequest..< F
,..F G
contentType..H S
:..S T
$str..U g
,..g h
bodyType..i q
:..q r
typeof..s y
(..y z
ResponseResult	..z à
)
..à â
,
..â ä
Description
..ã ñ
=
..ó ò
$str
..ô ¶
)
..¶ ß
]
..ß ®
[// 	#
OpenApiResponseWithBody//	  
(//  !

statusCode//! +
://+ ,
HttpStatusCode//- ;
.//; <
InternalServerError//< O
,//O P
contentType//Q \
://\ ]
$str//^ p
,//p q
bodyType//r z
://z {
typeof	//| Ç
(
//Ç É
ResponseResult
//É ë
)
//ë í
,
//í ì
Description
//î ü
=
//† °
$str
//¢ ∏
)
//∏ π
]
//π ∫
public00 
async00 
Task00 
<00 
IActionResult00 '
>00' (
ObtenerDias00) 4
(004 5
[11 
HttpTrigger11 
(11 
AuthorizationLevel11 +
.11+ ,
Function11, 4
,114 5
$str116 ;
,11; <
Route11= B
=11C D
$str11E l
)11l m
]11m n
HttpRequest11o z
req11{ ~
,11~ 
string
11Ä Ü
idSede
11á ç
,
11ç é
string
11è ï

idServicio
11ñ †
)
11† °
{22 	
try33 
{44 
Tuple55 
<55 
string55 
,55 
string55 $
>55$ %
data55& *
=55+ ,
new55- 0
(550 1
idSede551 7
,557 8

idServicio559 C
)55C D
;55D E
var66 
validationResult66 $
=66% &

_validator66' 1
.661 2
Validate662 :
(66: ;
data66; ?
)66? @
;66@ A
if77 
(77 
validationResult77 $
.77$ %
IsValid77% ,
)77, -
{88 
List99 
<99 
DiasDto99  
>99  !
response99" *
=99+ ,
await99- 2
_unitOfWork993 >
.99> ?
MallaRepository99? N
.99N O"
ObtenerDiasDisponibles99O e
(99e f
idSede99f l
)99l m
;99m n
var:: 
subsedesPorServicio:: +
=::, -
await::. 3
_unitOfWork::4 ?
.::? @
SedeRepository::@ N
.::N O&
ObtenerSubsedesPorServicio::O i
(::i j

idServicio::j t
)::t u
;::u v
List;; 
<;; 
string;; 
>;;  
datos;;! &
=;;' (
new;;) ,
(;;, -
);;- .
;;;. /
if== 
(== 
response==  
.==  !
Any==! $
(==$ %
)==% &
&&==' )
subsedesPorServicio==* =
.=== >
Any==> A
(==A B
)==B C
)==C D
{>> 
var?? 

joinedList?? &
=??' (
(??) *
from??* .
dias??/ 3
in??4 6
response??7 ?
join@@* .
subsede@@/ 6
in@@7 9
subsedesPorServicio@@: M
on@@N P
dias@@Q U
.@@U V
	PkSubSede@@V _
equals@@` f
subsede@@g n
.@@n o
	IdSubSede@@o x
selectAA* 0
diasAA1 5
.AA5 6
FechaAA6 ;
)AA; <
.AA< =
DistinctAA= E
(AAE F
)AAF G
.AAG H
ToListAAH N
(AAN O
)AAO P
;AAP Q

joinedListCC "
.CC" #
	RemoveAllCC# ,
(CC, -
xCC- .
=>CC/ 1

TimeHelperCC2 <
.CC< = 
ValidacionFechaMenorCC= Q
(CCQ R
xCCR S
)CCS T
)CCT U
;CCU V
returnEE 
HttpResponseHelperEE 1
.EE1 2
ResponseEE2 :
(EE: ;
StatusCodesEE; F
.EEF G
Status200OKEEG R
,EER S

joinedListEET ^
)EE^ _
;EE_ `
}FF 
elseGG 
{HH 
returnII 
HttpResponseHelperII 1
.II1 2
ResponseII2 :
(II: ;
StatusCodesII; F
.IIF G
Status200OKIIG R
,IIR S
datosIIT Y
)IIY Z
;IIZ [
}JJ 
}KK 
elseLL 
{MM 
returnNN 
HttpResponseHelperNN -
.NN- .
ResponseNN. 6
(NN6 7
StatusCodesNN7 B
.NNB C
Status400BadRequestNNC V
,NNV W
newNNX [
ResponseResultNN\ j
(NNj k
)NNk l
{OO 
IsErrorPP 
=PP  !
truePP" &
,PP& '
MessageQQ 
=QQ  !
validationResultQQ" 2
.QQ2 3
ErrorsQQ3 9
.QQ9 :
FirstQQ: ?
(QQ? @
)QQ@ A
.QQA B
ErrorMessageQQB N
}RR 
)RR 
;RR 
}SS 
}TT 
catchUU 
(UU 
	ExceptionUU 
exUU 
)UU  
{VV 
returnWW 
HttpResponseHelperWW )
.WW) *
ResponseWW* 2
(WW2 3
StatusCodesWW3 >
.WW> ?(
Status500InternalServerErrorWW? [
,WW[ \
newWW] `
ResponseResultWWa o
(WWo p
)WWp q
{WWr s
IsErrorWWt {
=WW| }
true	WW~ Ç
,
WWÇ É
Message
WWÑ ã
=
WWå ç
ex
WWé ê
.
WWê ë
Message
WWë ò
}
WWô ö
)
WWö õ
;
WWõ ú
}XX 
}YY 	
}ZZ 
}[[ ‰6
^C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\FxObtenerMallaByFecha.cs
	namespace 	
FxMalla
 
{ 
public 

class !
FxObtenerMallaByFecha &
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
private 
readonly 

IValidator #
<# $

FechaInput$ .
>. /

_validator0 :
;: ;
private 
readonly 
IDataService %
_dataService& 2
;2 3
public !
FxObtenerMallaByFecha $
($ %
IConfiguration% 3
config4 :
,: ;
IDataService< H
dataServiceI T
,T U

IValidatorV `
<` a

FechaInputa k
>k l
	validatorm v
)v w
{   	
_config!! 
=!! 
config!! 
;!! 
_dataService"" 
="" 
dataService"" &
;""& '

_validator## 
=## 
	validator## "
;##" #
}$$ 	
[&& 	
FunctionName&&	 
(&& 
nameof&& 
(&& 
ObtenerMallaByFecha&& 0
)&&0 1
)&&1 2
]&&2 3
['' 	
FixedDelayRetry''	 
('' 
$num'' 
,'' 
$str'' &
)''& '
]''' (
[(( 	
OpenApiOperation((	 
((( 
operationId(( %
:((% &
$str((' <
,((< =
tags((> B
:((B C
new((D G
[((G H
]((H I
{((J K
$str	((L ä
}
((ã å
,
((å ç
Description
((é ô
=
((ö õ
$str
((ú Í
,
((Í Î
Summary
((Ï Û
=
((Ù ı
$str
((ˆ ƒ
)
((ƒ ≈
]
((≈ ∆
[)) 	
OpenApiSecurity))	 
()) 
$str)) '
,))' (
SecuritySchemeType))) ;
.)); <
ApiKey))< B
,))B C
Name))D H
=))I J
$str))K Q
,))Q R
In))S U
=))V W'
OpenApiSecurityLocationType))X s
.))s t
Query))t y
)))y z
]))z {
[** 	#
OpenApiResponseWithBody**	  
(**  !

statusCode**! +
:**+ ,
HttpStatusCode**- ;
.**; <
OK**< >
,**> ?
contentType**@ K
:**K L
$str**M _
,**_ `
bodyType**a i
:**i j
typeof**k q
(**q r
ResponseResult	**r Ä
)
**Ä Å
,
**Å Ç
Description
**É é
=
**è ê
$str
**ë ü
)
**ü †
]
**† °
[++ 	#
OpenApiResponseWithBody++	  
(++  !

statusCode++! +
:+++ ,
HttpStatusCode++- ;
.++; <

BadRequest++< F
,++F G
contentType++H S
:++S T
$str++U g
,++g h
bodyType++i q
:++q r
typeof++s y
(++y z
ResponseResult	++z à
)
++à â
,
++â ä
Description
++ã ñ
=
++ó ò
$str
++ô ¶
)
++¶ ß
]
++ß ®
[,, 	#
OpenApiResponseWithBody,,	  
(,,  !

statusCode,,! +
:,,+ ,
HttpStatusCode,,- ;
.,,; <
InternalServerError,,< O
,,,O P
contentType,,Q \
:,,\ ]
$str,,^ p
,,,p q
bodyType,,r z
:,,z {
typeof	,,| Ç
(
,,Ç É
ResponseResult
,,É ë
)
,,ë í
,
,,í ì
Description
,,î ü
=
,,† °
$str
,,¢ ∏
)
,,∏ π
]
,,π ∫
public-- 
async-- 
Task-- 
<-- 
IActionResult-- '
>--' (
ObtenerMallaByFecha--) <
(--< =
[.. 
HttpTrigger.. 
(.. 
AuthorizationLevel.. +
...+ ,
Function.., 4
,..4 5
$str..6 ;
,..; <
Route..= B
=..C D
$str..E X
)..X Y
]..Y Z
HttpRequest..[ f
req..g j
)..j k
{// 	
try00 
{11 
string22 
fechaInicio22 "
=22# $
req22% (
.22( )
Query22) .
[22. /
$str22/ <
]22< =
;22= >
string33 
fechaFin33 
=33  !
req33" %
.33% &
Query33& +
[33+ ,
$str33, 6
]336 7
;337 8

FechaInput55 
fecha55  
=55! "
new55# &
(55& '
)55' (
{66 
FechaInicio77 
=77  !
fechaInicio77" -
,77- .
FechaFin88 
=88 
fechaFin88 '
}99 
;99 
var;; 
validationResult;; $
=;;% &

_validator;;' 1
.;;1 2
Validate;;2 :
(;;: ;
fecha;;; @
);;@ A
;;;A B
if== 
(== 
validationResult== $
.==$ %
IsValid==% ,
)==, -
{>> 
var?? 
result?? 
=??  
await??! &
_dataService??' 3
.??3 4
GetMallaByFecha??4 C
(??C D
fecha??D I
)??I J
;??J K
return@@ 
HttpResponseHelper@@ -
.@@- ."
SuccessfulObjectResult@@. D
(@@D E
result@@E K
)@@K L
;@@L M
}AA 
elseBB 
{CC 
returnDD 
HttpResponseHelperDD -
.DD- .
ResponseDD. 6
(DD6 7
StatusCodesDD7 B
.DDB C
Status400BadRequestDDC V
,DDV W
newDDX [
ResponseResultDD\ j
(DDj k
)DDk l
{EE 
IsErrorFF 
=FF  !
trueFF" &
,FF& '
MessageGG 
=GG  !
validationResultGG" 2
.GG2 3
ErrorsGG3 9
.GG9 :
FirstGG: ?
(GG? @
)GG@ A
.GGA B
ErrorMessageGGB N
}HH 
)HH 
;HH 
}II 
}JJ 
catchKK 
(KK 
	ExceptionKK 
exKK 
)KK  
{LL 
returnMM 
HttpResponseHelperMM )
.MM) *
ResponseMM* 2
(MM2 3
StatusCodesMM3 >
.MM> ?(
Status500InternalServerErrorMM? [
,MM[ \
newMM] `
ResponseResultMMa o
(MMo p
)MMp q
{MMr s
IsErrorMMt {
=MM| }
true	MM~ Ç
,
MMÇ É
Message
MMÑ ã
=
MMå ç
ex
MMé ê
.
MMê ë
Message
MMë ò
}
MMô ö
)
MMö õ
;
MMõ ú
}NN 
}OO 	
}PP 
}QQ û)
[C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\FxObtenerMallaByID.cs
	namespace 	
FxMalla
 
{ 
public 

class 
FxObtenerMallaByID #
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
private 
readonly 
IDataService %
_dataService& 2
;2 3
public 
FxObtenerMallaByID !
(! "
IConfiguration" 0
config1 7
,7 8
IDataService9 E
dataServiceF Q
)Q R
{ 	
_config 
= 
config 
; 
_dataService 
= 
dataService &
;& '
} 	
[!! 	
FunctionName!!	 
(!! 
nameof!! 
(!! 
ObtenerMallaByID!! -
)!!- .
)!!. /
]!!/ 0
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
$str##' 9
,##9 :
tags##; ?
:##? @
new##A D
[##D E
]##E F
{##G H
$str##I x
}##y z
,##z {
Description	##| á
=
##à â
$str
##ä »
,
##» …
Summary
##  —
=
##“ ”
$str
##‘ ë
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
[%% 	#
OpenApiResponseWithBody%%	  
(%%  !

statusCode%%! +
:%%+ ,
HttpStatusCode%%- ;
.%%; <
OK%%< >
,%%> ?
contentType%%@ K
:%%K L
$str%%M _
,%%_ `
bodyType%%a i
:%%i j
typeof%%k q
(%%q r
ResponseResult	%%r Ä
)
%%Ä Å
,
%%Å Ç
Description
%%É é
=
%%è ê
$str
%%ë ü
)
%%ü †
]
%%† °
[&& 	#
OpenApiResponseWithBody&&	  
(&&  !

statusCode&&! +
:&&+ ,
HttpStatusCode&&- ;
.&&; <
	NoContent&&< E
,&&E F
contentType&&G R
:&&R S
$str&&T f
,&&f g
bodyType&&h p
:&&p q
typeof&&r x
(&&x y
ResponseResult	&&y á
)
&&á à
,
&&à â
Description
&&ä ï
=
&&ñ ó
$str
&&ò ¨
)
&&¨ ≠
]
&&≠ Æ
['' 	#
OpenApiResponseWithBody''	  
(''  !

statusCode''! +
:''+ ,
HttpStatusCode''- ;
.''; <
InternalServerError''< O
,''O P
contentType''Q \
:''\ ]
$str''^ p
,''p q
bodyType''r z
:''z {
typeof	''| Ç
(
''Ç É
ResponseResult
''É ë
)
''ë í
,
''í ì
Description
''î ü
=
''† °
$str
''¢ ∏
)
''∏ π
]
''π ∫
public(( 
async(( 
Task(( 
<(( 
IActionResult(( '
>((' (
ObtenerMallaByID(() 9
(((9 :
[)) 
HttpTrigger)) 
()) 
AuthorizationLevel)) +
.))+ ,
Function)), 4
,))4 5
$str))6 ;
,)); <
Route))= B
=))C D
$str))E c
)))c d
]))d e
HttpRequest))f q
req))r u
,))u v
string))w }
idMalla	))~ Ö
)
))Ö Ü
{** 	
try++ 
{,, 
var-- 
result-- 
=-- 
await-- "
_dataService--# /
.--/ 0
GetMallaByID--0 <
(--< =
idMalla--= D
)--D E
;--E F
return.. 
result.. 
!=..  
null..! %
?..& '
HttpResponseHelper..( :
...: ;"
SuccessfulObjectResult..; Q
(..Q R
result..R X
)..X Y
:..Z [
HttpResponseHelper//' 9
.//9 :!
HttpExplicitNoContent//: O
(//O P
)//P Q
;//Q R
}00 
catch11 
(11 
	Exception11 
ex11 
)11  
{22 
return33 
HttpResponseHelper33 )
.33) *
Response33* 2
(332 3
StatusCodes333 >
.33> ?(
Status500InternalServerError33? [
,33[ \
new33] `
ResponseResult33a o
(33o p
)33p q
{33r s
IsError33t {
=33| }
true	33~ Ç
,
33Ç É
Message
33Ñ ã
=
33å ç
ex
33é ê
.
33ê ë
Message
33ë ò
}
33ô ö
)
33ö õ
;
33õ ú
}44 
}55 	
}66 
}77 ÔZ
YC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\FxObtenerTiempos.cs
	namespace 	
FxMalla
 
{ 
public 

class 
FxObtenerTiempos !
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
private!! 
readonly!! 
IUnitOfWork!! $
_unitOfWork!!% 0
;!!0 1
private"" 
readonly"" 
IMapper""  
_mapper""! (
;""( )
private## 
readonly## 

IValidator## #
<### $
Tuple##$ )
<##) *
string##* 0
,##0 1
string##2 8
,##8 9
string##: @
>##@ A
>##A B

_validator##C M
;##M N
public%% 
FxObtenerTiempos%% 
(%%  
IConfiguration%%  .
config%%/ 5
,%%5 6
IUnitOfWork%%7 B

unitOfWork%%C M
,%%M N
IMapper%%O V
mapper%%W ]
,%%] ^

IValidator%%_ i
<%%i j
Tuple%%j o
<%%o p
string%%p v
,%%v w
string%%x ~
,%%~ 
string
%%Ä Ü
>
%%Ü á
>
%%á à
	validator
%%â í
)
%%í ì
{&& 	
_config'' 
='' 
config'' 
;'' 
_unitOfWork(( 
=(( 

unitOfWork(( $
;(($ %
_mapper)) 
=)) 
mapper)) 
;)) 

_validator** 
=** 
	validator** "
;**" #
}++ 	
[-- 	
FunctionName--	 
(-- 
nameof-- 
(-- 
ObtenerTiempos-- +
)--+ ,
)--, -
]--- .
[.. 	
FixedDelayRetry..	 
(.. 
$num.. 
,.. 
$str.. &
)..& '
]..' (
[// 	
OpenApiOperation//	 
(// 
operationId// %
://% &
$str//' 7
,//7 8
tags//9 =
://= >
new//? B
[//B C
]//C D
{//E F
$str//G `
}//a b
,//b c
Description//d o
=//p q
$str	//r ¬
,
//¬ √
Summary
//ƒ À
=
//Ã Õ
$str
//Œ ü
)
//ü †
]
//† °
[00 	
OpenApiSecurity00	 
(00 
$str00 '
,00' (
SecuritySchemeType00) ;
.00; <
ApiKey00< B
,00B C
Name00D H
=00I J
$str00K Q
,00Q R
In00S U
=00V W'
OpenApiSecurityLocationType00X s
.00s t
Query00t y
)00y z
]00z {
[11 	
OpenApiRequestBody11	 
(11 
contentType11 '
:11' (
$str11) ;
,11; <
bodyType11= E
:11E F
typeof11G M
(11M N

MallaInput11N X
)11X Y
,11Y Z
Required11[ c
=11d e
true11f j
,11j k
Description11l w
=11x y
$str	11z é
)
11é è
]
11è ê
[22 	#
OpenApiResponseWithBody22	  
(22  !

statusCode22! +
:22+ ,
HttpStatusCode22- ;
.22; <
OK22< >
,22> ?
contentType22@ K
:22K L
$str22M _
,22_ `
bodyType22a i
:22i j
typeof22k q
(22q r
ResponseResult	22r Ä
)
22Ä Å
,
22Å Ç
Description
22É é
=
22è ê
$str
22ë ü
)
22ü †
]
22† °
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
>55' (
ObtenerTiempos55) 7
(557 8
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
$str66E s
)66s t
]66t u
HttpRequest	66v Å
req
66Ç Ö
,
66Ö Ü
string
66á ç
idSede
66é î
,
66î ï
string
66ñ ú

idServicio
66ù ß
,
66ß ®
string
66© Ø
	idUsuario
66∞ π
)
66π ∫
{77 	
try88 
{99 
string:: 
fecha:: 
=:: 
req:: "
.::" #
Query::# (
[::( )
$str::) 6
]::6 7
;::7 8
Tuple;; 
<;; 
string;; 
,;; 
string;; $
,;;$ %
string;;& ,
>;;, -
data;;. 2
=;;3 4
new;;5 8
(;;8 9
idSede;;9 ?
,;;? @

idServicio;;A K
,;;K L
fecha;;M R
);;R S
;;;S T
var<< 
validationResult<< $
=<<% &

_validator<<' 1
.<<1 2
Validate<<2 :
(<<: ;
data<<; ?
)<<? @
;<<@ A
if== 
(== 
validationResult== $
.==$ %
IsValid==% ,
)==, -
{>> 
var?? 
tiempos?? 
=??  !
await??" '
_unitOfWork??( 3
.??3 4
MallaRepository??4 C
.??C D
ObtenerTiempos??D R
(??R S
idSede??S Y
,??Y Z
fecha??[ `
,??` a
	idUsuario??b k
)??k l
;??l m
var@@ 
subsedesPorServicio@@ +
=@@, -
await@@. 3
_unitOfWork@@4 ?
.@@? @
SedeRepository@@@ N
.@@N O&
ObtenerSubsedesPorServicio@@O i
(@@i j

idServicio@@j t
)@@t u
;@@u v
ListAA 
<AA 
RespuestaTiemposAA )
>AA) *
datosAA+ 0
=AA1 2
newAA3 6
(AA6 7
)AA7 8
;AA8 9
ifCC 
(CC 
tiemposCC 
.CC  
AnyCC  #
(CC# $
)CC$ %
&&CC& (
subsedesPorServicioCC) <
.CC< =
AnyCC= @
(CC@ A
)CCA B
)CCB C
{DD 
varEE 

joinedListEE &
=EE' (
(EE) *
fromEE* .
tiempoEE/ 5
inEE6 8
tiemposEE9 @
joinFF* .
subsedeFF/ 6
inFF7 9
subsedesPorServicioFF: M
onFFN P
tiempoFFQ W
.FFW X
	IdSubSedeFFX a
equalsFFb h
subsedeFFi p
.FFp q
	IdSubSedeFFq z
selectGG* 0
newGG1 4
{HH* +
tiempoII. 4
.II4 5
IdMallaII5 <
,II< =
tiempoJJ. 4
.JJ4 5
IdSedeJJ5 ;
,JJ; <
tiempoKK. 4
.KK4 5
	IdSubSedeKK5 >
,KK> ?
tiempoLL. 4
.LL4 5
FechaLL5 :
,LL: ;
tiempoMM. 4
.MM4 5

HoraInicioMM5 ?
,MM? @
subsedeNN. 5
.NN5 6
	PrioridadNN6 ?
,NN? @
tiempoOO. 4
.OO4 5
UsuarioVetadoOO5 B
}PP* +
)PP+ ,
.PP, -
OrderByPP- 4
(PP4 5
rowPP5 8
=>PP9 ;
rowPP< ?
.PP? @

HoraInicioPP@ J
)PPJ K
.PPK L
ThenByPPL R
(PPR S
rowPPS V
=>PPW Y
rowPPZ ]
.PP] ^
	PrioridadPP^ g
)PPg h
.PPh i

DistinctByPPi s
(PPs t
rowPPt w
=>PPx z
rowPP{ ~
.PP~ 

HoraInicio	PP â
)
PPâ ä
;
PPä ã
ifRR 
(RR 

joinedListRR &
.RR& '
AnyRR' *
(RR* +
)RR+ ,
)RR, -
{SS 
varTT 

FilterListTT  *
=TT+ ,

joinedListTT- 7
.TT7 8
WhereTT8 =
(TT= >
userTT> B
=>TTC E
!TTF G
userTTG K
.TTK L
UsuarioVetadoTTL Y
)TTY Z
.UU 
SelectUU "
(UU" #
uUU# $
=>UU% '
newUU( +
RespuestaTiempoUU, ;
{VV 
PkMallaWW &
=WW' (
uWW) *
.WW* +
IdMallaWW+ 2
,WW2 3
PkSedeXX %
=XX& '
uXX( )
.XX) *
IdSedeXX* 0
,XX0 1
	PkSubSedeYY (
=YY) *
uYY+ ,
.YY, -
	IdSubSedeYY- 6
,YY6 7
FechaZZ $
=ZZ% &
uZZ' (
.ZZ( )
FechaZZ) .
,ZZ. /

HoraInicio[[ )
=[[* +
u[[, -
.[[- .

HoraInicio[[. 8
}\\ 
)\\ 
;\\ 
datos^^ !
=^^" #
_mapper^^$ +
.^^+ ,
Map^^, /
<^^/ 0
List^^0 4
<^^4 5
RespuestaTiempos^^5 E
>^^E F
>^^F G
(^^G H

FilterList^^H R
)^^R S
;^^S T
}__ 
}`` 
returnaa 
HttpResponseHelperaa -
.aa- .
Responseaa. 6
(aa6 7
StatusCodesaa7 B
.aaB C
Status200OKaaC N
,aaN O
datosaaP U
)aaU V
;aaV W
}bb 
elsecc 
{dd 
returnee 
HttpResponseHelperee -
.ee- .
Responseee. 6
(ee6 7
StatusCodesee7 B
.eeB C
Status400BadRequesteeC V
,eeV W
neweeX [
ResponseResultee\ j
(eej k
)eek l
{ff 
IsErrorgg 
=gg  !
truegg" &
,gg& '
Messagehh 
=hh  !
validationResulthh" 2
.hh2 3
Errorshh3 9
.hh9 :
Firsthh: ?
(hh? @
)hh@ A
.hhA B
ErrorMessagehhB N
}ii 
)ii 
;ii 
}jj 
}kk 
catchll 
(ll 
	Exceptionll 
exll 
)ll  
{mm 
returnnn 
HttpResponseHelpernn )
.nn) *
Responsenn* 2
(nn2 3
StatusCodesnn3 >
.nn> ?(
Status500InternalServerErrornn? [
,nn[ \
newnn] `
ResponseResultnna o
(nno p
)nnp q
{nnr s
IsErrornnt {
=nn| }
true	nn~ Ç
,
nnÇ É
Message
nnÑ ã
=
nnå ç
ex
nné ê
.
nnê ë
Message
nnë ò
}
nnô ö
)
nnö õ
;
nnõ ú
}oo 
}pp 	
}qq 
}rr •
`C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Interfaces\IDataService.cs
	namespace 	
FxMalla
 
. 

Interfaces 
{		 
public

 

	interface

 
IDataService

 !
{ 
public 
Task 
< 
object 
> 
GetMallaByID (
(( )
string) /
idMalla0 7
)7 8
;8 9
public 
Task 
< 
IEnumerable 
<  
object  &
>& '
>' ( 
ObterDataConsolidada) =
(= >
List> B
<B C
MallaC H
>H I
mallaJ O
)O P
;P Q
public 
Task 
< 
List 
< 
DatosSedeDto %
>% &
>& '
GetDatosSedes( 5
(5 6
string6 <
idSedes= D
)D E
;E F
public 
Task 
< 
List 
< 
SedeDto  
>  !
>! "
GetSubSedes# .
(. /
string/ 5
idSedes6 =
)= >
;> ?
public 
string 
GetUsuariosVetados (
(( )
List) -
<- .
Malla. 3
>3 4
malla5 :
): ;
;; <
public 
Task 
< 
IEnumerable 
<  
dynamic  '
>' (
>( )
GetTramitesJoined* ;
(; <
List< @
<@ A

TramiteDtoA K
>K L
tramitesM U
)U V
;V W
public 
Task 
< 
List 
< 
object 
>  
>  !
GetMallaByFecha" 1
(1 2

FechaInput2 <
fecha= B
)B C
;C D
} 
} ì
`C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Interfaces\IHttpService.cs
	namespace 	
FxMalla
 
. 

Interfaces 
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
string2 8
fechaInicio9 D
,D E
stringF L
fechaFinM U
)U V
;V W
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
# )
fechaInicio

* 5
,

5 6
string

7 =
fechaFin

> F
)

F G
;

G H
} 
} ∫
vC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Interfaces\RepositoryPattern\IMallaRepository.cs
	namespace 	
FxMalla
 
. 

Interfaces 
. 
RepositoryPattern .
{		 
public

 

	interface

 
IMallaRepository

 %
{ 
public 
Task 
< 
string 
> 
InsertarMallaAsync .
(. /
Malla/ 4
malla5 :
): ;
;; <
public 
Task 
< 
List 
< 
MallaDto !
>! "
>" #
ValidarMalla$ 0
(0 1
string1 7
idSede8 >
)> ?
;? @
public 
Task 
InactivarMallas #
(# $
string$ *
idSede+ 1
,1 2
string3 9
idMalla: A
,A B
stringC I
usuarioJ Q
)Q R
;R S
public 
Task 
< 
List 
< 
TiempoMallaDto '
>' (
>( )
ObtenerTiempos* 8
(8 9
string9 ?
idSede@ F
,F G
stringH N
fechaAgendaO Z
,Z [
string\ b
	idUsuarioc l
)l m
;m n
public 
Task 
< 
List 
< 
DiasDto  
>  !
>! ""
ObtenerDiasDisponibles# 9
(9 :
string: @
idSedeA G
)G H
;H I
public 
Task 
< 
List 
< 
Malla 
> 
>  
ObtenerMallaporID! 2
(2 3
string3 9
idMalla: A
)A B
;B C
public 
Task 
< 
List 
< 
Malla 
> 
>   
ObtenerMallaporFecha! 5
(5 6

FechaInput6 @
fechaA F
)F G
;G H
} 
} ã
uC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Interfaces\RepositoryPattern\ISedeRepository.cs
	namespace 	
FxMalla
 
. 

Interfaces 
. 
RepositoryPattern .
{ 
public 

	interface 
ISedeRepository $
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
public 
Task 
< 
List 
< 
SedeDto  
>  !
>! "
ObtenerSubsedes# 2
(2 3
string3 9
idSedes: A
)A B
;B C
public 
Task 
< 
List 
< 
ServicioDto $
>$ %
>% &&
ObtenerSubsedesPorServicio' A
(A B
stringB H

idServicioI S
)S T
;T U
public 
Task 
< 
bool 
> 
PoseeSubSedes '
(' (
string( .
idSede/ 5
)5 6
;6 7
public 
Task 
< 
List 
< 
DatosSedeDto %
>% &
>& '
ObtenerDatosSede( 8
(8 9
string9 ?
idSedes@ G
)G H
;H I
} 
} ·
yC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Interfaces\RepositoryPattern\IServicioRepository.cs
	namespace 	
FxMalla
 
. 

Interfaces 
. 
RepositoryPattern .
{ 
public 

	interface 
IServicioRepository (
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
bool

 
>

 
ExisteServicio

 (
(

( )
string

) /

idServicio

0 :
)

: ;
;

; <
public 
Task 
< 
List 
< 
ServicioDataDto (
>( )
>) *+
ObtenerTiempodeAtencionServicio+ J
(J K
stringK Q
idServiciosR ]
)] ^
;^ _
} 
} Ç
xC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Interfaces\RepositoryPattern\ITramiteRepository.cs
	namespace 	
FxMalla
 
. 

Interfaces 
. 
RepositoryPattern .
{ 
public 

	interface 
ITramiteRepository '
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
 

TramiteDto

 #
>

# $
>

$ %!
ObtenerTramitesMallas

& ;
(

; <
string

< B
idMallas

C K
)

K L
;

L M
} 
} ˇ
qC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Interfaces\RepositoryPattern\IUnitOfWork.cs
	namespace 	
FxMalla
 
. 

Interfaces 
. 
RepositoryPattern .
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
IServicioRepository

 
ServicioRepository

 .
{

/ 0
get

1 4
;

4 5
}

6 7
IUsuarioRepository 
UsuarioRepository ,
{- .
get/ 2
;2 3
}4 5
} 
} ¸
xC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Interfaces\RepositoryPattern\IUsuarioRepository.cs
	namespace 	
FxMalla
 
. 

Interfaces 
. 
RepositoryPattern .
{ 
public 

	interface 
IUsuarioRepository '
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
 

UsuarioDto

 #
>

# $
>

$ %
ObtenerUsuario

& 4
(

4 5
string

5 ;
	IdUsuario

< E
)

E F
;

F G
} 
} à
jC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Mappers\MappingProfileInputAgenda.cs
	namespace 	
FxMalla
 
. 
Mappers 
{ 
public 

class %
MappingProfileInputAgenda *
:+ ,
Profile- 4
{		 
public

 %
MappingProfileInputAgenda

 (
(

( )
)

) *
{ 	
	CreateMap 
< 
SedeDto 
, 
AgendaInput *
>* +
(+ ,
), -
. 
	ForMember 
( 
dest 
=> 
dest  $
.$ %
	Intervalo% .
,. /
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
IntervaloAtencion4 E
)E F
)F G
. 
	ForMember 
( 
dest 
=>  
dest! %
.% &
CantidadPersonas& 6
,6 7
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4"
NumeroPersonasAtencion4 J
)J K
)K L
;L M
} 	
} 
} ” 
dC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Mappers\MappingProfileMalla.cs
	namespace		 	
FxMalla		
 
.		 
Mappers		 
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
< 

MallaInput  
,  !
Malla" '
>' (
(( )
)) *
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
Id$ &
,& '
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
SecurityHelper0 >
.> ?
SHA256Encrypt? L
(L M
stringM S
.S T
ConcatT Z
(Z [
src[ ^
.^ _
IdSede_ e
,e f
srcg j
.j k
FechaIniciok v
,v w
srcx {
.{ |
FechaFin	| Ñ
)
Ñ Ö
)
Ö Ü
)
Ü á
)
á à
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
PkSede$ *
,* +
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
IdSede4 :
): ;
); <
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
FechaInicio$ /
,/ 0
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
FechaInicio4 ?
)? @
)@ A
. 
	ForMember 
( 
dest 
=> 
dest "
." #
FechaFin# +
,+ ,
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
FechaFin4 <
)< =
)= >
. 
	ForMember 
( 
dest 
=> 
dest "
." #
Activo# )
,) *
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
true0 4
)4 5
)5 6
.
 
	ForMember 
( 
dest 
=> 
dest !
.! "
UsuarioCreacion" 1
,1 2
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
."" 
	ForMember"" 
("" 
dest"" 
=>"" 
dest"" "
.""" #
FechaCreacion""# 0
,""0 1
opt## 
=>## 
opt##  
.##  !
MapFrom##! (
(##( )
src##) ,
=>##- /
DateTime##0 8
.##8 9
UtcNow##9 ?
)##? @
)##@ A
.%% 
	ForMember%% 
(%% 
dest%% 
=>%% 
dest%% "
.%%" #
UsuarioModificacion%%# 6
,%%6 7
opt&& 
=>&& 
opt&&  
.&&  !
UseDestinationValue&&! 4
(&&4 5
)&&5 6
)&&6 7
.(( 
	ForMember(( 
((( 
dest(( 
=>(( 
dest(( "
.((" #
FechaModificacion((# 4
,((4 5
opt)) 
=>)) 
opt))  
.))  !
UseDestinationValue))! 4
())4 5
)))5 6
)))6 7
;))7 8
}** 	
}++ 
},, ›
oC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Mappers\MappingProfileRespuestaTiempos.cs
	namespace 	
FxMalla
 
. 
Mappers 
{ 
public 

class *
MappingProfileRespuestaTiempos /
:0 1
Profile2 9
{		 
public

 *
MappingProfileRespuestaTiempos

 -
(

- .
)

. /
{ 	
	CreateMap 
< 
RespuestaTiempo %
,% &
RespuestaTiempos' 7
>7 8
(8 9
)9 :
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
IdMalla$ +
,+ ,
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
src/ 2
.2 3
PkMalla3 :
): ;
); <
. 
	ForMember 
( 
dest 
=> 
dest  $
.$ %
IdSede% +
,+ ,
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
src/ 2
.2 3
PkSede3 9
)9 :
): ;
. 
	ForMember 
( 
dest 
=>  
dest! %
.% &
	IdSubSede& /
,/ 0
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
src/ 2
.2 3
	PkSubSede3 <
)< =
)= >
. 
	ForMember 
( 
dest 
=> !
dest" &
.& '
Fecha' ,
,, -
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
src/ 2
.2 3
Fecha3 8
)8 9
)9 :
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Hora( ,
,, -
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
src/ 2
.2 3

HoraInicio3 =
)= >
)> ?
;? @
} 	
} 
} á
VC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\Agenda.cs
	namespace 	
FxMalla
 
. 
Models 
{ 
public 

class 
Agenda 
{ 
[		 	
JsonProperty			 
(		 
$str		 
,		 
Required		 '
=		( )
Required		* 2
.		2 3
Always		3 9
)		9 :
]		: ;
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
( )
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
]> ?
public 
string 
	DiaSemana 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
,  
Required! )
=* +
Required, 4
.4 5
Default5 <
)< =
]= >
public 
Tiempo 
[ 
] 
Tiempos 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} Ω
pC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\DataTransferObjects\DatosSedeDto.cs
	namespace 	
FxMalla
 
. 
Models 
. 
DataTransferObjects ,
{ 
public 

class 
DatosSedeDto 
{ 
public 
string 
IdSede 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 

NombreSede  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
string		 
	Direccion		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
}

 
} î
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\DataTransferObjects\DiasDto.cs
	namespace 	
FxMalla
 
. 
Models 
. 
DataTransferObjects ,
{ 
public 

class 
DiasDto 
{ 
public 
string 
	PkSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Fecha 
{ 
get !
;! "
set# &
;& '
}( )
} 
} õ
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\DataTransferObjects\MallaDto.cs
	namespace 	
FxMalla
 
. 
Models 
. 
DataTransferObjects ,
{ 
public 

class 
MallaDto 
{ 
public 
string 
FechaInicio !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
FechaFin 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
}		 ˇ
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\DataTransferObjects\RespuestaTiempo.cs
	namespace 	
FxMalla
 
. 
Models 
. 
DataTransferObjects ,
{ 
public 

class 
RespuestaTiempo  
{ 
[ 	
JsonProperty	 
( 
$str 
)  
]  !
public		 
string		 
PkMalla		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
string 
PkSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	PkSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
) 
] 
public 
string 
Fecha 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} Ò
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\DataTransferObjects\SedeDto.cs
	namespace 	
FxMalla
 
. 
Models 
. 
DataTransferObjects ,
{ 
public 

class 
SedeDto 
{ 
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
string 
PkSede 
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
 )
)

) *
]

* +
public 
bool 
InactivarFestivos %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	IdSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str %
)% &
]& '
public 
string 
NombreSubSede #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
JsonProperty	 
( 
$str 
)  
]  !
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str )
)) *
]* +
public 
long 
IntervaloAtencion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 	
JsonProperty	 
( 
$str .
). /
]/ 0
public 
long "
NumeroPersonasAtencion *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
JsonProperty	 
( 
$str #
)# $
]$ %
public   
string   
[   
]   
DiasOffline   #
{  $ %
get  & )
;  ) *
set  + .
;  . /
}  0 1
["" 	
JsonProperty""	 
("" 
$str"" &
)""& '
]""' (
public## 
TiempoOffline## 
[## 
]## 
TiemposOffline## -
{##. /
get##0 3
;##3 4
set##5 8
;##8 9
}##: ;
}$$ 
}%% ä	
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\DataTransferObjects\ServicioDataDto.cs
	namespace 	
FxMalla
 
. 
Models 
. 
DataTransferObjects ,
{ 
public 

class 
ServicioDataDto  
{ 
public 
string 

IdServicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
NombreServicio $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
long 
TiempoAtencion "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
TramiteVirtual "
{# $
get% (
;( )
set* -
;- .
}/ 0
public		 
string		 
TipoPago		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
}

 
} Ô
oC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\DataTransferObjects\ServicioDto.cs
	namespace 	
FxMalla
 
. 
Models 
. 
DataTransferObjects ,
{ 
public 

class 
ServicioDto 
{ 
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
string 
PkSede 
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
)

! "
]

" #
public 
string 
	IdSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
int 
	Prioridad 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ñ
rC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\DataTransferObjects\TiempoMallaDto.cs
	namespace 	
FxMalla
 
. 
Models 
. 
DataTransferObjects ,
{ 
public 

class 
TiempoMallaDto 
{ 
[ 	
JsonProperty	 
( 
$str 
)  
]  !
public 
string 
IdMalla 
{ 
get  #
;# $
set% (
;( )
}* +
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
IdSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	IdSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
) 
] 
public 
string 
Fecha 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
JsonProperty	 
( 
$str %
)% &
]& '
public 
bool 
UsuarioVetado !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ó
nC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\DataTransferObjects\TramiteDto.cs
	namespace 	
FxMalla
 
. 
Models 
. 
DataTransferObjects ,
{ 
public 

class 

TramiteDto 
{ 
[		 	
JsonProperty			 
(		 
$str		 !
)		! "
]		" #
public

 
string

 
	IdUsuario

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	PkTramite 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str %
)% &
]& '
public 
DateTimeOffset 
FechaRegistro +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
[ 	
JsonProperty	 
( 
$str 
) 
]  
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
JsonProperty	 
( 
$str $
)$ %
]% &
public 
string 
NombreEstado "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
JsonProperty	 
( 
$str "
)" #
]# $
public 
string 

PkServicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
JsonProperty	 
( 
$str (
)( )
]) *
public 
long 
DuracionServicio $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} È
nC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\DataTransferObjects\UsuarioDto.cs
	namespace 	
FxMalla
 
. 
Models 
. 
DataTransferObjects ,
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
 ’
^C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\Entities\Malla.cs
	namespace 	
FxMalla
 
. 
Models 
. 
Entities !
{ 
public 

class 
Malla 
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
}'' 
}(( Œ"
iC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\Entities\MallasPorSubSede.cs
	namespace 	
FxMalla
 
. 
Models 
. 
Entities !
{ 
public 

partial 
class 
MallasPorSubSede )
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
 !
)

! "
]

" #
public 
string 
	PkSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str '
)' (
]( )
public 
List 
< 
Agenda 
> 
TiemposAtencion +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
public 

partial 
class 
TiemposAtencion (
{ 
[ 	
JsonProperty	 
( 
$str 
) 
] 
public 
string 
Fecha 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	DiaSemana 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
)  
]  !
public 
Tiempo 
[ 
] 
Tiempos 
{  !
get" %
;% &
set' *
;* +
}, -
} 
public 

partial 
class 
Tiempo 
{ 
[ 	
JsonProperty	 
( 
$str %
)% &
]& '
public   
string   
IdTiempoMalla   #
{  $ %
get  & )
;  ) *
set  + .
;  . /
}  0 1
["" 	
JsonProperty""	 
("" 
$str"" "
)""" #
]""# $
public## 
string## 

HoraInicio##  
{##! "
get### &
;##& '
set##( +
;##+ ,
}##- .
[%% 	
JsonProperty%%	 
(%% 
$str%% 
)%%  
]%%  !
public&& 
string&& 
HoraFin&& 
{&& 
get&&  #
;&&# $
set&&% (
;&&( )
}&&* +
[(( 	
JsonProperty((	 
((( 
$str(( (
)((( )
](() *
public)) 
bool)) 
AgendaDisponible)) $
{))% &
get))' *
;))* +
set)), /
;))/ 0
}))1 2
[++ 	
JsonProperty++	 
(++ 
$str++ (
)++( )
]++) *
public,, 
long,, 
CantidadPersonas,, $
{,,% &
get,,' *
;,,* +
set,,, /
;,,/ 0
},,1 2
[.. 	
JsonProperty..	 
(.. 
$str..  
,..  !
Required.." *
=..+ ,
Required..- 5
...5 6
Default..6 =
)..= >
]..> ?
public// 
string// 
[// 
]// 
Tramites//  
{//! "
get//# &
;//& '
set//( +
;//+ ,
}//- .
=/// 0
Array//1 6
.//6 7
Empty//7 <
<//< =
string//= C
>//C D
(//D E
)//E F
;//F G
[11 	
JsonProperty11	 
(11 
$str11 '
,11' (
Required11) 1
=112 3
Required114 <
.11< =
Default11= D
)11D E
]11E F
public22 
string22 
[22 
]22 
UsuariosVetados22 '
{22( )
get22* -
;22- .
set22/ 2
;222 3
}224 5
=226 7
Array228 =
.22= >
Empty22> C
<22C D
string22D J
>22J K
(22K L
)22L M
;22M N
}33 
}44 Ø

WC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\Festivo.cs
	namespace 	
FxMalla
 
. 
Models 
{ 
public 

class 
Festivo 
{ 
[ 	
JsonProperty	 
( 
$str 
)  
]  !
public 
string 
IdFecha 
{ 
get  #
;# $
set% (
;( )
}* +
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
Fecha 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonProperty	 
( 
$str %
)% &
]& '
public 
string 
NombreEspanol #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
JsonProperty	 
( 
$str $
)$ %
]% &
public 
string 
NombreIngles "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} •
aC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\Input\AgendaInput.cs
	namespace 	
FxMalla
 
. 
Models 
. 
Input 
{ 
public 

class 
AgendaInput 
{ 
public 
DateTime 
FechaInicio #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
DateTime 
FechaFin  
{! "
get# &
;& '
set( +
;+ ,
}- .
public

 
string

 

HoraInicio
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
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
long 
	Intervalo 
{ 
get  #
;# $
set% (
;( )
}* +
public 
long 
CantidadPersonas $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
[ 
] 
DiasOffline #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
TiempoOffline 
[ 
] 
TiemposOffline -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
bool 
InactivaFestivos $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ≠
`C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\Input\FechaInput.cs
	namespace 	
FxMalla
 
. 
Models 
. 
Input 
{ 
public 

class 

FechaInput 
{ 
[ 	
JsonProperty	 
( 
$str #
,# $
Required% -
=. /
Required0 8
.8 9
Always9 ?
)? @
]@ A
public 
string 
FechaInicio !
{" #
get$ '
;' (
set) ,
;, -
}. /
[		 	
JsonProperty			 
(		 
$str		  
,		  !
Required		" *
=		+ ,
Required		- 5
.		5 6
Always		6 <
)		< =
]		= >
public

 
string

 
FechaFin
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
} ù
`C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\Input\MallaInput.cs
	namespace 	
FxMalla
 
. 
Models 
. 
Input 
{ 
[		 
OpenApiExample		 
(		 
typeof		 
(		 
InputMallaExample		 ,
)		, -
)		- .
]		. /
public

 

class

 

MallaInput

 
{ 
[ 	
JsonProperty	 
( 
$str #
,# $
Required% -
=. /
Required0 8
.8 9
Always9 ?
)? @
]@ A
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' D
,D E
NullableF N
=O P
falseQ V
)V W
]W X
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
,  !
Required" *
=+ ,
Required- 5
.5 6
Always6 <
)< =
]= >
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' A
,A B
NullableC K
=L M
falseN S
)S T
]T U
public 
string 
FechaFin 
{  
get! $
;$ %
set& )
;) *
}+ ,
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
$str' e
,e f
Nullableg o
=p q
falser w
)w x
]x y
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
$str 
,  
Required! )
=* +
Required, 4
.4 5
Always5 ;
); <
]< =
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' _
,_ `
Nullablea i
=j k
falsel q
)q r
]r s
public 
string 
Usuario 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} í
^C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\ResponseResult.cs
	namespace		 	
FxMalla		
 
.		 
Models		 
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
} ∑
`C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\RespuestaTiempos.cs
	namespace 	
FxMalla
 
. 
Models 
{ 
public 

class 
RespuestaTiempos !
{ 
[ 	
JsonProperty	 
( 
$str 
)  
]  !
public 
string 
IdMalla 
{ 
get  #
;# $
set% (
;( )
}* +
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
IdSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	IdSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
) 
] 
public 
string 
Fecha 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonProperty	 
( 
$str 
) 
] 
public 
string 
Hora 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ‚
]C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Models\TiempoOffline.cs
	namespace 	
FxMalla
 
. 
Models 
{ 
public 

partial 
class 
TiempoOffline &
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
$str 
) 
] 
public 
string 
[ 
] 
Dias 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ó

bC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\OpenApi\InputMallaExample.cs
	namespace 	
FxMalla
 
. 
OpenApi 
{		 
public

 

class

 
InputMallaExample

 "
:

# $
OpenApiExample

% 3
<

3 4

MallaInput

4 >
>

> ?
{ 
public 
override 
IOpenApiExample '
<' (

MallaInput( 2
>2 3
Build4 9
(9 :
NamingStrategy: H
namingStrategyI W
=X Y
nullZ ^
)^ _
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
new 

MallaInput "
(" #
)# $
{ 
FechaInicio #
=$ %
$str& 2
,2 3
FechaFin  
=! "
$str# /
,/ 0
IdSede 
=  
$str! G
,G H
Usuario 
=  !
$str" 0
} 
, 
namingStrategy "
) 
) 
; 
return 
this 
; 
} 	
} 
} ﬂ

fC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\OpenApi\ResponseResultExample.cs
	namespace

 	
FxMalla


 
.

 
OpenApi

 
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
} Ãë
eC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Repositories\MallaRepository.cs
	namespace 	
FxMalla
 
. 
Repositories 
{ 
public 

class 
MallaRepository  
:! "
RepositoryBase# 1
,1 2
IMallaRepository3 C
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
MallaRepository 
( 
CosmosClient +
client, 2
,2 3
IConfiguration4 B
configurationC P
)P Q
: 
base 
( 
client 
) 
{ 	
string 
containerId 
=  
configuration! .
[. /
$str/ H
]H I
;I J
string 
databaseName 
=  !
configuration" /
[/ 0
$str0 C
]C D
;D E
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
>!!  !
InsertarMallaAsync!!" 4
(!!4 5
Malla!!5 :
malla!!; @
)!!@ A
{"" 	
try## 
{$$ 
ItemResponse%% 
<%% 
Malla%% "
>%%" #
itemResponse%%$ 0
=%%1 2
await%%3 8
	container%%9 B
.%%B C
ReadItemAsync%%C P
<%%P Q
Malla%%Q V
>%%V W
(%%W X
malla%%X ]
.%%] ^
Id%%^ `
,%%` a
new%%b e
PartitionKey%%f r
(%%r s
malla%%s x
.%%x y
PkSede%%y 
)	%% Ä
)
%%Ä Å
;
%%Å Ç
return&& 
itemResponse&& #
.&&# $

StatusCode&&$ .
.&&. /
ToString&&/ 7
(&&7 8
)&&8 9
;&&9 :
}'' 
catch(( 
((( 
CosmosException(( "
ex((# %
)((% &
when((' +
(((, -
ex((- /
.((/ 0

StatusCode((0 :
==((; =
HttpStatusCode((> L
.((L M
NotFound((M U
)((U V
{)) 
await** 
	container** 
.**  
CreateItemAsync**  /
(**/ 0
malla**0 5
,**5 6
new**7 :
PartitionKey**; G
(**G H
malla**H M
.**M N
PkSede**N T
)**T U
)**U V
;**V W
return,, 
$str,, )
;,,) *
}-- 
}.. 	
public00 
async00 
Task00 
InactivarMallas00 )
(00) *
string00* 0
idSede001 7
,007 8
string009 ?
idMalla00@ G
,00G H
string00I O
usuario00P W
)00W X
{11 	
var22 
result22 
=22 
	container22 "
.22" # 
GetItemLinqQueryable22# 7
<227 8
Malla228 =
>22= >
(22> ?
)22? @
.22@ A
Where22A F
(22F G
m33 
=>33 
m33 
.33 
PkSede33 
.33 
Equals33 $
(33$ %
idSede33% +
)33+ ,
&&33- /
m44 
.44 
Id44 
!=44 
idMalla44 
&&44  "
m55 
.55 
Activo55 
)66 
.66 
ToFeedIterator66 
(66 
)66 
;66 
if88 
(88 
result88 
.88 
HasMoreResults88 %
)88% &
{99 
var:: 
existingDocuments:: %
=::& '
await::( -
result::. 4
.::4 5
ReadNextAsync::5 B
(::B C
)::C D
;::D E
var;; 
filteredList;;  
=;;! "
existingDocuments;;# 4
?;;4 5
.;;5 6
Resource;;6 >
.;;> ?
Where;;? D
(;;D E
x;;E F
=>;;G I

TimeHelper;;J T
.;;T U
FechaActiva;;U `
(;;` a
x;;a b
.;;b c
FechaFin;;c k
);;k l
);;l m
.;;m n
ToList;;n t
(;;t u
);;u v
;;;v w
filteredList== 
?== 
.== 
ForEach== %
(==% &
document==& .
=>==/ 1
{>> 
var?? 
partitionKey??  ,
=??- .
new??/ 2
PartitionKey??3 ?
(??? @
document??@ H
.??H I
PkSede??I O
)??O P
;??P Q
	container@@ %
.@@% &
PatchItemAsync@@& 4
<@@4 5
Malla@@5 :
>@@: ;
(@@; <
idAA 
:AA 
documentAA  (
.AA( )
IdAA) +
,AA+ ,
partitionKeyBB (
:BB( )
partitionKeyBB* 6
,BB6 7
patchOperationsCC +
:CC+ ,
newCC- 0
[CC0 1
]CC1 2
{CC3 4
PatchOperationDD  .
.DD. /
SetDD/ 2
(DD2 3
$strDD3 <
,DD< =
falseDD> C
)DDC D
,DDD E
PatchOperationEE  .
.EE. /
SetEE/ 2
(EE2 3
$strEE3 G
,EEG H
DateTimeOffsetEEI W
.EEW X
UtcNowEEX ^
)EE^ _
,EE_ `
PatchOperationFF  .
.FF. /
SetFF/ 2
(FF2 3
$strFF3 I
,FFI J
usuarioFFK R
)FFR S
}GG 
)GG 
;GG 
}HH 
)HH 
;HH 
}II 
}JJ 	
publicLL 
asyncLL 
TaskLL 
<LL 
ListLL 
<LL 
MallaDtoLL '
>LL' (
>LL( )
ValidarMallaLL* 6
(LL6 7
stringLL7 =
idSedeLL> D
)LLD E
{MM 	
varNN 
mallasNN 
=NN 
newNN 
ListNN !
<NN! "
MallaDtoNN" *
>NN* +
(NN+ ,
)NN, -
{NN. /
}NN0 1
;NN1 2
tryOO 
{PP 
varQQ 
queryStringQQ 
=QQ  !
$strQV" 5
;VV5 6
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
,YY0 1
idSedeYY2 8
)YY8 9
;YY9 :
queryDefZZ 
.ZZ 
WithParameterZZ &
(ZZ& '
$strZZ' 0
,ZZ0 1
trueZZ2 6
)ZZ6 7
;ZZ7 8
var\\ 
query\\ 
=\\ 
	container\\ %
.\\% & 
GetItemQueryIterator\\& :
<\\: ;
MallaDto\\; C
>\\C D
(\\D E
queryDef\\E M
)\\M N
;\\N O
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
;__> ?
mallas`` 
.`` 
AddRange`` #
(``# $
response``$ ,
.``, -
ToList``- 3
(``3 4
)``4 5
)``5 6
;``6 7
}aa 
returncc 
mallascc 
;cc 
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
returngg 
mallasgg 
;gg 
}hh 
}ii 	
publickk 
asynckk 
Taskkk 
<kk 
Listkk 
<kk 
TiempoMallaDtokk -
>kk- .
>kk. /
ObtenerTiemposkk0 >
(kk> ?
stringkk? E
idSedekkF L
,kkL M
stringkkN T
fechaAgendakkU `
,kk` a
stringkkb h
	idUsuariokki r
)kkr s
{ll 	
varmm 
tiemposmm 
=mm 
newmm 
Listmm "
<mm" #
TiempoMallaDtomm# 1
>mm1 2
(mm2 3
)mm3 4
{mm5 6
}mm7 8
;mm8 9
trynn 
{oo 
varpp 
queryStringpp 
=pp  !
$@"pp" %
$strpv% J
{vvJ K
	idUsuariovvK T
}vvT U
$strv~U D
"~~D E
;~~E F
var
ÄÄ 
queryDef
ÄÄ 
=
ÄÄ 
new
ÄÄ "
QueryDefinition
ÄÄ# 2
(
ÄÄ2 3
queryString
ÄÄ3 >
)
ÄÄ> ?
;
ÄÄ? @
queryDef
ÅÅ 
.
ÅÅ 
WithParameter
ÅÅ &
(
ÅÅ& '
$str
ÅÅ' 0
,
ÅÅ0 1
idSede
ÅÅ2 8
)
ÅÅ8 9
;
ÅÅ9 :
queryDef
ÇÇ 
.
ÇÇ 
WithParameter
ÇÇ &
(
ÇÇ& '
$str
ÇÇ' 5
,
ÇÇ5 6
fechaAgenda
ÇÇ7 B
)
ÇÇB C
;
ÇÇC D
queryDef
ÉÉ 
.
ÉÉ 
WithParameter
ÉÉ &
(
ÉÉ& '
$str
ÉÉ' 0
,
ÉÉ0 1
true
ÉÉ2 6
)
ÉÉ6 7
;
ÉÉ7 8
var
ÖÖ 
query
ÖÖ 
=
ÖÖ 
	container
ÖÖ %
.
ÖÖ% &"
GetItemQueryIterator
ÖÖ& :
<
ÖÖ: ;
TiempoMallaDto
ÖÖ; I
>
ÖÖI J
(
ÖÖJ K
queryDef
ÖÖK S
)
ÖÖS T
;
ÖÖT U
while
ÜÜ 
(
ÜÜ 
query
ÜÜ 
.
ÜÜ 
HasMoreResults
ÜÜ +
)
ÜÜ+ ,
{
áá 
var
àà 
response
àà  
=
àà! "
await
àà# (
query
àà) .
.
àà. /
ReadNextAsync
àà/ <
(
àà< =
)
àà= >
;
àà> ?
tiempos
ââ 
.
ââ 
AddRange
ââ $
(
ââ$ %
response
ââ% -
.
ââ- .
ToList
ââ. 4
(
ââ4 5
)
ââ5 6
)
ââ6 7
;
ââ7 8
}
ää 
return
åå 
tiempos
åå 
;
åå 
}
çç 
catch
éé 
(
éé 
CosmosException
éé "
ex
éé# %
)
éé% &
when
éé' +
(
éé, -
ex
éé- /
.
éé/ 0

StatusCode
éé0 :
==
éé; =
HttpStatusCode
éé> L
.
ééL M
NotFound
ééM U
)
ééU V
{
èè 
return
êê 
tiempos
êê 
;
êê 
}
ëë 
}
íí 	
public
îî 
async
îî 
Task
îî 
<
îî 
List
îî 
<
îî 
DiasDto
îî &
>
îî& '
>
îî' ($
ObtenerDiasDisponibles
îî) ?
(
îî? @
string
îî@ F
idSede
îîG M
)
îîM N
{
ïï 	
var
ññ 
dias
ññ 
=
ññ 
new
ññ 
List
ññ 
<
ññ  
DiasDto
ññ  '
>
ññ' (
(
ññ( )
)
ññ) *
{
ññ+ ,
}
ññ- .
;
ññ. /
try
óó 
{
òò 
var
ôô 
queryString
ôô 
=
ôô  !
$@"
ôô" %
$str
ô°% f
"
°°f g
;
°°g h
var
££ 
queryDef
££ 
=
££ 
new
££ "
QueryDefinition
££# 2
(
££2 3
queryString
££3 >
)
££> ?
;
££? @
queryDef
§§ 
.
§§ 
WithParameter
§§ &
(
§§& '
$str
§§' 0
,
§§0 1
idSede
§§2 8
)
§§8 9
;
§§9 :
var
¶¶ 
query
¶¶ 
=
¶¶ 
	container
¶¶ %
.
¶¶% &"
GetItemQueryIterator
¶¶& :
<
¶¶: ;
DiasDto
¶¶; B
>
¶¶B C
(
¶¶C D
queryDef
¶¶D L
)
¶¶L M
;
¶¶M N
while
ßß 
(
ßß 
query
ßß 
.
ßß 
HasMoreResults
ßß +
)
ßß+ ,
{
®® 
var
©© 
response
©©  
=
©©! "
await
©©# (
query
©©) .
.
©©. /
ReadNextAsync
©©/ <
(
©©< =
)
©©= >
;
©©> ?
dias
™™ 
.
™™ 
AddRange
™™ !
(
™™! "
response
™™" *
.
™™* +
ToList
™™+ 1
(
™™1 2
)
™™2 3
)
™™3 4
;
™™4 5
}
´´ 
return
≠≠ 
dias
≠≠ 
;
≠≠ 
}
ÆÆ 
catch
ØØ 
(
ØØ 
CosmosException
ØØ "
ex
ØØ# %
)
ØØ% &
when
ØØ' +
(
ØØ, -
ex
ØØ- /
.
ØØ/ 0

StatusCode
ØØ0 :
==
ØØ; =
HttpStatusCode
ØØ> L
.
ØØL M
NotFound
ØØM U
)
ØØU V
{
∞∞ 
return
±± 
dias
±± 
;
±± 
}
≤≤ 
}
≥≥ 	
public
µµ 
async
µµ 
Task
µµ 
<
µµ 
List
µµ 
<
µµ 
Malla
µµ $
>
µµ$ %
>
µµ% &
ObtenerMallaporID
µµ' 8
(
µµ8 9
string
µµ9 ?
idMalla
µµ@ G
)
µµG H
{
∂∂ 	
List
∑∑ 
<
∑∑ 
Malla
∑∑ 
>
∑∑ 
malla
∑∑ 
=
∑∑ 
new
∑∑  #
(
∑∑# $
)
∑∑$ %
{
∑∑& '
}
∑∑( )
;
∑∑) *
try
∏∏ 
{
ππ 
var
∫∫ 
queryString
∫∫ 
=
∫∫  !
$str
∫º" 7
;
ºº7 8
var
ææ 
queryDef
ææ 
=
ææ 
new
ææ "
QueryDefinition
ææ# 2
(
ææ2 3
queryString
ææ3 >
)
ææ> ?
;
ææ? @
queryDef
øø 
.
øø 
WithParameter
øø &
(
øø& '
$str
øø' 1
,
øø1 2
idMalla
øø3 :
)
øø: ;
;
øø; <
var
¡¡ 
query
¡¡ 
=
¡¡ 
	container
¡¡ %
.
¡¡% &"
GetItemQueryIterator
¡¡& :
<
¡¡: ;
Malla
¡¡; @
>
¡¡@ A
(
¡¡A B
queryDef
¡¡B J
)
¡¡J K
;
¡¡K L
while
¬¬ 
(
¬¬ 
query
¬¬ 
.
¬¬ 
HasMoreResults
¬¬ +
)
¬¬+ ,
{
√√ 
var
ƒƒ 
response
ƒƒ  
=
ƒƒ! "
await
ƒƒ# (
query
ƒƒ) .
.
ƒƒ. /
ReadNextAsync
ƒƒ/ <
(
ƒƒ< =
)
ƒƒ= >
;
ƒƒ> ?
malla
≈≈ 
.
≈≈ 
AddRange
≈≈ "
(
≈≈" #
response
≈≈# +
.
≈≈+ ,
ToList
≈≈, 2
(
≈≈2 3
)
≈≈3 4
)
≈≈4 5
;
≈≈5 6
}
∆∆ 
return
»» 
malla
»» 
;
»» 
}
…… 
catch
   
(
   
CosmosException
   "
ex
  # %
)
  % &
when
  ' +
(
  , -
ex
  - /
.
  / 0

StatusCode
  0 :
==
  ; =
HttpStatusCode
  > L
.
  L M
NotFound
  M U
)
  U V
{
ÀÀ 
return
ÃÃ 
malla
ÃÃ 
;
ÃÃ 
}
ÕÕ 
}
ŒŒ 	
public
—— 
async
—— 
Task
—— 
<
—— 
List
—— 
<
—— 
Malla
—— $
>
——$ %
>
——% &"
ObtenerMallaporFecha
——' ;
(
——; <

FechaInput
——< F
fecha
——G L
)
——L M
{
““ 	
List
”” 
<
”” 
Malla
”” 
>
”” 
malla
”” 
=
”” 
new
””  #
(
””# $
)
””$ %
{
””& '
}
””( )
;
””) *
try
‘‘ 
{
’’ 
var
÷÷ 
queryString
÷÷ 
=
÷÷  !
$str
÷Ÿ" F
;
ŸŸF G
var
€€ 
queryDef
€€ 
=
€€ 
new
€€ "
QueryDefinition
€€# 2
(
€€2 3
queryString
€€3 >
)
€€> ?
;
€€? @
queryDef
‹‹ 
.
‹‹ 
WithParameter
‹‹ &
(
‹‹& '
$str
‹‹' 5
,
‹‹5 6
fecha
‹‹7 <
.
‹‹< =
FechaInicio
‹‹= H
)
‹‹H I
;
‹‹I J
queryDef
›› 
.
›› 
WithParameter
›› &
(
››& '
$str
››' 2
,
››2 3
fecha
››4 9
.
››9 :
FechaFin
››: B
)
››B C
;
››C D
var
ﬂﬂ 
query
ﬂﬂ 
=
ﬂﬂ 
	container
ﬂﬂ %
.
ﬂﬂ% &"
GetItemQueryIterator
ﬂﬂ& :
<
ﬂﬂ: ;
Malla
ﬂﬂ; @
>
ﬂﬂ@ A
(
ﬂﬂA B
queryDef
ﬂﬂB J
)
ﬂﬂJ K
;
ﬂﬂK L
while
‡‡ 
(
‡‡ 
query
‡‡ 
.
‡‡ 
HasMoreResults
‡‡ +
)
‡‡+ ,
{
·· 
var
‚‚ 
response
‚‚  
=
‚‚! "
await
‚‚# (
query
‚‚) .
.
‚‚. /
ReadNextAsync
‚‚/ <
(
‚‚< =
)
‚‚= >
;
‚‚> ?
malla
„„ 
.
„„ 
AddRange
„„ "
(
„„" #
response
„„# +
.
„„+ ,
ToList
„„, 2
(
„„2 3
)
„„3 4
)
„„4 5
;
„„5 6
}
‰‰ 
return
ÊÊ 
malla
ÊÊ 
;
ÊÊ 
}
ÁÁ 
catch
ËË 
(
ËË 
CosmosException
ËË "
ex
ËË# %
)
ËË% &
when
ËË' +
(
ËË, -
ex
ËË- /
.
ËË/ 0

StatusCode
ËË0 :
==
ËË; =
HttpStatusCode
ËË> L
.
ËËL M
NotFound
ËËM U
)
ËËU V
{
ÈÈ 
return
ÍÍ 
malla
ÍÍ 
;
ÍÍ 
}
ÎÎ 
}
ÏÏ 	
}
ÌÌ 
}ÓÓ Â
dC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Repositories\RepositoryBase.cs
	namespace 	
FxMalla
 
. 
Repositories 
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
} éa
dC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Repositories\SedeRepository.cs
	namespace 	
FxMalla
 
. 
Repositories 
{ 
internal 
class 
SedeRepository !
:" #
RepositoryBase$ 2
,2 3
ISedeRepository4 C
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
SedeRepository 
( 
CosmosClient *
client+ 1
,1 2
IConfiguration3 A
configurationB O
)O P
: 
base 
( 
client 
) 
{ 	
string 
containerId 
=  
configuration! .
[. /
$str/ G
]G H
;H I
string 
databaseName 
=  !
configuration" /
[/ 0
$str0 C
]C D
;D E
	container 
= 
client 
. 
GetContainer +
(+ ,
databaseName, 8
,8 9
containerId: E
)E F
;F G
} 	
public 
async 
Task 
< 
bool 
> 
PoseeSubSedes  -
(- .
string. 4
idSede5 ;
); <
{ 	
try 
{ 
var 
queryString 
=  !
$str$" 5
;$$5 6
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
$str''' 0
,''0 1
idSede''2 8
)''8 9
;''9 :
queryDef(( 
.(( 
WithParameter(( &
(((& '
$str((' 0
,((0 1
true((2 6
)((6 7
;((7 8
var** 
query** 
=** 
	container** %
.**% & 
GetItemQueryIterator**& :
<**: ;
dynamic**; B
>**B C
(**C D
queryDef**D L
)**L M
;**M N
if,, 
(,, 
query,, 
.,, 
HasMoreResults,, (
),,( )
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
;..> ?
var// 
cantidad//  
=//! "
response//# +
.//+ ,
SingleOrDefault//, ;
(//; <
)//< =
;//= >
return00 
cantidad00 #
!=00$ &
null00' +
;00+ ,
}11 
return33 
false33 
;33 
}44 
catch55 
(55 
CosmosException55 "
ex55# %
)55% &
when55' +
(55, -
ex55- /
.55/ 0

StatusCode550 :
==55; =
HttpStatusCode55> L
.55L M
NotFound55M U
)55U V
{66 
return77 
false77 
;77 
}88 
}99 	
public;; 
async;; 
Task;; 
<;; 
bool;; 
>;; 

ExisteSede;;  *
(;;* +
string;;+ 1
idSede;;2 8
);;8 9
{<< 	
dynamic== 
data== 
=== 
null== 
;==  
try>> 
{?? 
var@@ 
queryString@@ 
=@@  !
$str@D" 9
;DD9 :
varFF 
queryDefFF 
=FF 
newFF "
QueryDefinitionFF# 2
(FF2 3
queryStringFF3 >
)FF> ?
;FF? @
queryDefGG 
.GG 
WithParameterGG &
(GG& '
$strGG' 0
,GG0 1
idSedeGG2 8
)GG8 9
;GG9 :
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
publicYY 
asyncYY 
TaskYY 
<YY 
ListYY 
<YY 
DatosSedeDtoYY +
>YY+ ,
>YY, -
ObtenerDatosSedeYY. >
(YY> ?
stringYY? E
idSedesYYF M
)YYM N
{ZZ 	
List[[ 
<[[ 
DatosSedeDto[[ 
>[[ 
sedes[[ $
=[[% &
new[[' *
([[* +
)[[+ ,
{[[- .
}[[/ 0
;[[0 1
try\\ 
{]] 
var^^ 
queryString^^ 
=^^  !
@$"^^" %
$str^c% 3
{cc3 4
idSedescc4 ;
}cc; <
$strcc< =
"cc= >
;cc> ?
vardd 
querydd 
=dd 
	containerdd %
.dd% & 
GetItemQueryIteratordd& :
<dd: ;
DatosSedeDtodd; G
>ddG H
(ddH I
queryStringddI T
)ddT U
;ddU V
whileee 
(ee 
queryee 
.ee 
HasMoreResultsee +
)ee+ ,
{ff 
vargg 
responsegg  
=gg! "
awaitgg# (
querygg) .
.gg. /
ReadNextAsyncgg/ <
(gg< =
)gg= >
;gg> ?
sedeshh 
.hh 
AddRangehh "
(hh" #
responsehh# +
.hh+ ,
ToListhh, 2
(hh2 3
)hh3 4
)hh4 5
;hh5 6
}ii 
returnkk 
sedeskk 
;kk 
}ll 
catchmm 
(mm 
CosmosExceptionmm "
exmm# %
)mm% &
whenmm' +
(mm, -
exmm- /
.mm/ 0

StatusCodemm0 :
==mm; =
HttpStatusCodemm> L
.mmL M
NotFoundmmM U
)mmU V
{nn 
returnoo 
sedesoo 
;oo 
}pp 
}qq 	
publicss 
asyncss 
Taskss 
<ss 
Listss 
<ss 
SedeDtoss &
>ss& '
>ss' (
ObtenerSubsedesss) 8
(ss8 9
stringss9 ?
idSedesss@ G
)ssG H
{tt 	
Listuu 
<uu 
SedeDtouu 
>uu 
subsedesuu "
=uu# $
newuu% (
(uu( )
)uu) *
{uu+ ,
}uu- .
;uu. /
tryvv 
{ww 
varxx 
queryStringxx 
=xx  !
$@"xx" %
$str	xÖ% 3
{
ÖÖ3 4
idSedes
ÖÖ4 ;
}
ÖÖ; <
$str
ÖÜ< N
"
ÜÜN O
;
ÜÜO P
var
àà 
queryDef
àà 
=
àà 
new
àà "
QueryDefinition
àà# 2
(
àà2 3
queryString
àà3 >
)
àà> ?
;
àà? @
queryDef
ââ 
.
ââ 
WithParameter
ââ &
(
ââ& '
$str
ââ' 0
,
ââ0 1
true
ââ2 6
)
ââ6 7
;
ââ7 8
var
ãã 
query
ãã 
=
ãã 
	container
ãã %
.
ãã% &"
GetItemQueryIterator
ãã& :
<
ãã: ;
SedeDto
ãã; B
>
ããB C
(
ããC D
queryDef
ããD L
)
ããL M
;
ããM N
while
åå 
(
åå 
query
åå 
.
åå 
HasMoreResults
åå +
)
åå+ ,
{
çç 
var
éé 
response
éé  
=
éé! "
await
éé# (
query
éé) .
.
éé. /
ReadNextAsync
éé/ <
(
éé< =
)
éé= >
;
éé> ?
subsedes
èè 
.
èè 
AddRange
èè %
(
èè% &
response
èè& .
.
èè. /
ToList
èè/ 5
(
èè5 6
)
èè6 7
)
èè7 8
;
èè8 9
}
êê 
return
íí 
subsedes
íí 
;
íí  
}
ìì 
catch
îî 
(
îî 
CosmosException
îî "
ex
îî# %
)
îî% &
when
îî' +
(
îî, -
ex
îî- /
.
îî/ 0

StatusCode
îî0 :
==
îî; =
HttpStatusCode
îî> L
.
îîL M
NotFound
îîM U
)
îîU V
{
ïï 
return
ññ 
subsedes
ññ 
;
ññ  
}
óó 
}
òò 	
public
öö 
async
öö 
Task
öö 
<
öö 
List
öö 
<
öö 
ServicioDto
öö *
>
öö* +
>
öö+ ,(
ObtenerSubsedesPorServicio
öö- G
(
ööG H
string
ööH N

idServicio
ööO Y
)
ööY Z
{
õõ 	
List
úú 
<
úú 
ServicioDto
úú 
>
úú 
subsedesServicio
úú .
=
úú/ 0
new
úú1 4
(
úú4 5
)
úú5 6
{
úú7 8
}
úú9 :
;
úú: ;
try
ùù 
{
ûû 
var
üü 
queryString
üü 
=
üü  !
$str
ü©" :
;
©©: ;
var
´´ 
queryDef
´´ 
=
´´ 
new
´´ "
QueryDefinition
´´# 2
(
´´2 3
queryString
´´3 >
)
´´> ?
;
´´? @
queryDef
¨¨ 
.
¨¨ 
WithParameter
¨¨ &
(
¨¨& '
$str
¨¨' 4
,
¨¨4 5

idServicio
¨¨6 @
)
¨¨@ A
;
¨¨A B
queryDef
≠≠ 
.
≠≠ 
WithParameter
≠≠ &
(
≠≠& '
$str
≠≠' 0
,
≠≠0 1
true
≠≠2 6
)
≠≠6 7
;
≠≠7 8
var
ØØ 
query
ØØ 
=
ØØ 
	container
ØØ %
.
ØØ% &"
GetItemQueryIterator
ØØ& :
<
ØØ: ;
ServicioDto
ØØ; F
>
ØØF G
(
ØØG H
queryDef
ØØH P
)
ØØP Q
;
ØØQ R
while
∞∞ 
(
∞∞ 
query
∞∞ 
.
∞∞ 
HasMoreResults
∞∞ +
)
∞∞+ ,
{
±± 
var
≤≤ 
response
≤≤  
=
≤≤! "
await
≤≤# (
query
≤≤) .
.
≤≤. /
ReadNextAsync
≤≤/ <
(
≤≤< =
)
≤≤= >
;
≤≤> ?
subsedesServicio
≥≥ $
.
≥≥$ %
AddRange
≥≥% -
(
≥≥- .
response
≥≥. 6
.
≥≥6 7
ToList
≥≥7 =
(
≥≥= >
)
≥≥> ?
)
≥≥? @
;
≥≥@ A
}
¥¥ 
return
∂∂ 
subsedesServicio
∂∂ '
;
∂∂' (
}
∑∑ 
catch
∏∏ 
(
∏∏ 
CosmosException
∏∏ "
ex
∏∏# %
)
∏∏% &
when
∏∏' +
(
∏∏, -
ex
∏∏- /
.
∏∏/ 0

StatusCode
∏∏0 :
==
∏∏; =
HttpStatusCode
∏∏> L
.
∏∏L M
NotFound
∏∏M U
)
∏∏U V
{
ππ 
return
∫∫ 
subsedesServicio
∫∫ '
;
∫∫' (
}
ªª 
}
ºº 	
}
ΩΩ 
}ææ ◊*
hC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Repositories\ServicioRepository.cs
	namespace 	
FxMalla
 
. 
Repositories 
{ 
public 

class 
ServicioRepository #
:$ %
RepositoryBase& 4
,4 5
IServicioRepository6 I
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
ServicioRepository !
(! "
CosmosClient" .
client/ 5
,5 6
IConfiguration7 E
configurationF S
)S T
: 
base 
( 
client 
) 
{ 	
string 
containerId 
=  
configuration! .
[. /
$str/ K
]K L
;L M
string 
databaseName 
=  !
configuration" /
[/ 0
$str0 C
]C D
;D E
	container 
= 
client 
. 
GetContainer +
(+ ,
databaseName, 8
,8 9
containerId: E
)E F
;F G
} 	
public 
async 
Task 
< 
bool 
> 
ExisteServicio  .
(. /
string/ 5

idServicio6 @
)@ A
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
$str"" 9
;""9 :
var$$ 
queryDef$$ 
=$$ 
new$$ "
QueryDefinition$$# 2
($$2 3
queryString$$3 >
)$$> ?
;$$? @
queryDef%% 
.%% 
WithParameter%% &
(%%& '
$str%%' 4
,%%4 5

idServicio%%6 @
)%%@ A
;%%A B
queryDef&& 
.&& 
WithParameter&& &
(&&& '
$str&&' 0
,&&0 1
true&&2 6
)&&6 7
;&&7 8
var(( 
query(( 
=(( 
	container(( %
.((% & 
GetItemQueryIterator((& :
<((: ;
dynamic((; B
>((B C
(((C D
queryDef((D L
)((L M
;((M N
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
}55 	
public77 
async77 
Task77 
<77 
List77 
<77 
ServicioDataDto77 .
>77. /
>77/ 0+
ObtenerTiempodeAtencionServicio771 P
(77P Q
string77Q W
idServicios77X c
)77c d
{88 	
List99 
<99 
ServicioDataDto99  
>99  !
	servicios99" +
=99, -
new99. 1
(991 2
)992 3
{994 5
}996 7
;997 8
try:: 
{;; 
var<< 
queryString<< 
=<<  !
$@"<<" %
$str<C% 3
{CC3 4
idServiciosCC4 ?
}CC? @
$strCC@ A
"CCA B
;CCB C
varDD 
queryDD 
=DD 
	containerDD %
.DD% & 
GetItemQueryIteratorDD& :
<DD: ;
ServicioDataDtoDD; J
>DDJ K
(DDK L
queryStringDDL W
)DDW X
;DDX Y
whileEE 
(EE 
queryEE 
.EE 
HasMoreResultsEE +
)EE+ ,
{FF 
FeedResponseGG  
<GG  !
ServicioDataDtoGG! 0
>GG0 1
responseGG2 :
=GG; <
awaitGG= B
queryGGC H
.GGH I
ReadNextAsyncGGI V
(GGV W
)GGW X
;GGX Y
	serviciosHH 
.HH 
AddRangeHH &
(HH& '
responseHH' /
.HH/ 0
ToListHH0 6
(HH6 7
)HH7 8
)HH8 9
;HH9 :
}II 
returnJJ 
	serviciosJJ  
;JJ  !
}KK 
catchLL 
(LL 
CosmosExceptionLL "
exLL# %
)LL% &
whenLL' +
(LL, -
exLL- /
.LL/ 0

StatusCodeLL0 :
==LL; =
HttpStatusCodeLL> L
.LLL M
NotFoundLLM U
)LLU V
{MM 
returnNN 
	serviciosNN  
;NN  !
}OO 
}PP 	
}QQ 
}RR ı
gC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Repositories\TramiteRepository.cs
	namespace 	
FxMalla
 
. 
Repositories 
{ 
public 

class 
TramiteRepository "
:# $
RepositoryBase% 3
,3 4
ITramiteRepository5 G
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
public 
TramiteRepository  
(  !
CosmosClient! -
client. 4
,4 5
IConfiguration6 D
configurationE R
)R S
:T U
baseV Z
(Z [
client[ a
)a b
{ 	
_configuration 
= 
configuration *
;* +
string 
containerId 
=  
_configuration! /
[/ 0
$str0 K
]K L
;L M
string 
databaseName 
=  !
_configuration" 0
[0 1
$str1 D
]D E
;E F
	container 
= 
client 
. 
GetContainer +
(+ ,
databaseName, 8
,8 9
containerId: E
)E F
;F G
} 	
public 
async 
Task 
< 
List 
< 

TramiteDto )
>) *
>* +!
ObtenerTramitesMallas, A
(A B
stringB H
idMallasI Q
)Q R
{ 	
List 
< 

TramiteDto 
> 
tramites %
=& '
new( +
(+ ,
), -
{. /
}0 1
;1 2
try 
{ 
var   
queryString   
=    !
@$"  " %
$str *% <
{**< =
idMallas**= E
}**E F
$str**F G
"**G H
;**H I
var++ 
query++ 
=++ 
	container++ %
.++% & 
GetItemQueryIterator++& :
<++: ;

TramiteDto++; E
>++E F
(++F G
queryString++G R
)++R S
;++S T
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
;..> ?
tramites// 
.// 
AddRange// %
(//% &
response//& .
.//. /
ToList/// 5
(//5 6
)//6 7
)//7 8
;//8 9
}00 
return22 
tramites22 
;22  
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
return66 
tramites66 
;66  
}77 
}88 	
}99 
}:: ‰
gC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Repositories\UsuarioRepository.cs
	namespace 	
FxMalla
 
. 
Repositories 
{ 
public 

class 
UsuarioRepository "
:# $
IUsuarioRepository% 7
{ 
	protected 
IDbTransaction  
Transaction! ,
{- .
get/ 2
;2 3
private4 ;
set< ?
;? @
}A B
	protected 
IDbConnection 

Connection  *
=>+ -
Transaction. 9
.9 :

Connection: D
;D E
public 
UsuarioRepository  
(  !
IDbTransaction! /
transaction0 ;
); <
{ 	
Transaction 
= 
transaction %
;% &
} 	
public 
async 
Task 
< 
List 
< 

UsuarioDto )
>) *
>* +
ObtenerUsuario, :
(: ;
string; A
	IdUsuarioB K
)K L
{ 	
string 
sqlQuery 
= 
$@" !
$str&! 6
{&&6 7
	IdUsuario&&7 @
}&&@ A
$str&&A B
"&&B C
;&&C D
var(( 
data(( 
=(( 
await(( 

Connection(( '
.((' (

QueryAsync((( 2
<((2 3

UsuarioDto((3 =
>((= >
(((> ?
sqlQuery((? G
,((G H
null((I M
,((M N
Transaction((O Z
)((Z [
;(([ \
return** 
data** 
.** 
ToList** 
(** 
)**  
;**  !
}++ 	
},, 
}-- §â
]C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Services\DataService.cs
	namespace 	
FxMalla
 
. 
Services 
{ 
public 

class 
DataService 
: 
IDataService +
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
DataService 
( 
IConfiguration )
config* 0
,0 1
IUnitOfWork2 =

unitOfWork> H
)H I
{ 	
_config 
= 
config 
; 
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
public 
async 
Task 
< 
object  
>  !
GetMallaByID" .
(. /
string/ 5
idMalla6 =
)= >
{   	
List!! 
<!! 
Malla!! 
>!! 
malla!! 
=!! 
await!!  %
_unitOfWork!!& 1
.!!1 2
MallaRepository!!2 A
.!!A B
ObtenerMallaporID!!B S
(!!S T
idMalla!!T [
)!![ \
;!!\ ]
var"" 
result"" 
="" 
malla"" 
."" 
Any"" "
(""" #
)""# $
?""% & 
ObterDataConsolidada""' ;
(""; <
malla""< A
)""A B
.""B C
Result""C I
.""I J
FirstOrDefault""J X
(""X Y
)""Y Z
:""[ \
null""] a
;""a b
return## 
result## 
;## 
}$$ 	
public'' 
async'' 
Task'' 
<'' 
List'' 
<'' 
object'' %
>''% &
>''& '
GetMallaByFecha''( 7
(''7 8

FechaInput''8 B
fecha''C H
)''H I
{(( 	
List)) 
<)) 
Malla)) 
>)) 
malla)) 
=)) 
await))  %
_unitOfWork))& 1
.))1 2
MallaRepository))2 A
.))A B 
ObtenerMallaporFecha))B V
())V W
fecha))W \
)))\ ]
;))] ^
var** 
result** 
=** 
malla** 
.** 
Any** "
(**" #
)**# $
?**% & 
ObterDataConsolidada**' ;
(**; <
malla**< A
)**A B
.**B C
Result**C I
.**I J
ToList**J P
(**P Q
)**Q R
:**S T
new**U X
List**Y ]
<**] ^
object**^ d
>**d e
(**e f
)**f g
{**h i
}**j k
;**k l
return++ 
result++ 
;++ 
},, 	
public// 
async// 
Task// 
<// 
IEnumerable// %
<//% &
object//& ,
>//, -
>//- . 
ObterDataConsolidada/// C
(//C D
List//D H
<//H I
Malla//I N
>//N O
malla//P U
)//U V
{00 	
string11 
idSedes11 
=11 

DataHelper11 '
.11' (
ListaValores11( 4
(114 5
malla115 :
,11: ;
$str11< D
)11D E
;11E F
List22 
<22 
DatosSedeDto22 
>22 

datosSedes22 )
=22* +
await22, 1
GetDatosSedes222 ?
(22? @
idSedes22@ G
)22G H
;22H I
List33 
<33 
SedeDto33 
>33 
subsedes33 "
=33# $
await33% *
GetSubSedes33+ 6
(336 7
idSedes337 >
)33> ?
;33? @
string44 
idMallas44 
=44 

DataHelper44 (
.44( )
ListaValores44) 5
(445 6
malla446 ;
,44; <
$str44= A
)44A B
;44B C
List66 
<66 

TramiteDto66 
>66 
tramites66 %
=66& '
await66( -
_unitOfWork66. 9
.669 :
TramiteRepository66: K
.66K L!
ObtenerTramitesMallas66L a
(66a b
idMallas66b j
)66j k
;66k l
var77 
tramitesJoined77 
=77  
await77! &
GetTramitesJoined77' 8
(778 9
tramites779 A
)77A B
;77B C
string88 
idUsuariosVentados88 %
=88& '
GetUsuariosVetados88( :
(88: ;
malla88; @
)88@ A
;88A B
List:: 
<:: 

UsuarioDto:: 
>:: "
listadoUsuariosVetados:: 3
=::4 5
!::6 7
idUsuariosVentados::7 I
.::I J
IsEmpty::J Q
(::Q R
)::R S
?::T U
await::U Z
_unitOfWork::[ f
.::f g
UsuarioRepository::g x
.::x y
ObtenerUsuario	::y á
(
::á à 
idUsuariosVentados
::à ö
)
::ö õ
:
::ú ù
new
::û °
List
::¢ ¶
<
::¶ ß

UsuarioDto
::ß ±
>
::± ≤
(
::≤ ≥
)
::≥ ¥
{
::µ ∂
}
::∑ ∏
;
::∏ π
var<< 

mallasSede<< 
=<< 
(<< 
from<< "
m<<# $
in<<% '
malla<<( -
join== "
s==# $
in==% '

datosSedes==( 2
on==3 5
m==6 7
.==7 8
PkSede==8 >
equals==? E
s==F G
.==G H
IdSede==H N
select>> $
new>>% (
{?? 
IdMalla@@" )
=@@* +
m@@, -
.@@- .
Id@@. 0
,@@0 1
sAA" #
.AA# $

NombreSedeAA$ .
,AA. /
sBB" #
.BB# $
	DireccionBB$ -
,BB- .
mCC" #
.CC# $
FechaInicioCC$ /
,CC/ 0
mDD" #
.DD# $
FechaFinDD$ ,
,DD, -
mEE" #
.EE# $
ActivoEE$ *
,EE* +
MallasPorSubSedeFF" 2
=FF3 4
mFF5 6
.FF6 7
MallasPorSubSedeFF7 G
.FFG H
JoinFFH L
(FFL M
subsedesFFM U
,FFU V
mallaSubSedeGG" .
=>GG/ 1
mallaSubSedeGG2 >
.GG> ?
	PkSubSedeGG? H
,GGH I
subsedeHH" )
=>HH* ,
subsedeHH- 4
.HH4 5
	IdSubSedeHH5 >
,HH> ?
(HH@ A
mallaSubSedeHHA M
,HHM N
subsedeHHO V
)HHV W
=>HHX Z
newHH[ ^
{II" #
nombreSubSedeJJ& 3
=JJ4 5
subsedeJJ6 =
.JJ= >
NombreSubSedeJJ> K
,JJK L
horaInicioSubSedeKK& 7
=KK8 9
subsedeKK: A
.KKA B

HoraInicioKKB L
,KKL M
horaFinSubSedeLL& 4
=LL5 6
subsedeLL7 >
.LL> ?
HoraFinLL? F
,LLF G
intervaloAtencionMM& 7
=MM8 9
subsedeMM: A
.MMA B
IntervaloAtencionMMB S
,MMS T
tiemposAtencionNN& 5
=NN6 7
mallaSubSedeNN8 D
.NND E
TiemposAtencionNNE T
.OO& '
SelectOO' -
(OO- .
xOO. /
=>OO0 2
newPP, /
{QQ, -
xRR0 1
.RR1 2
FechaRR2 7
,RR7 8
xSS0 1
.SS1 2
	DiaSemanaSS2 ;
,SS; <
tiemposTT0 7
=TT8 9
xTT: ;
.TT; <
TiemposTT< C
?TTC D
.TTD E
WhereTTE J
(TTJ K
tTTK L
=>TTM O
tTTP Q
.TTQ R
IdTiempoMallaTTR _
!=TT` b
nullTTc g
)TTg h
.TTh i
SelectTTi o
(TTo p
tTTp q
=>TTr t
newTTu x
{UU0 1
tVV4 5
.VV5 6

HoraInicioVV6 @
,VV@ A
tWW4 5
.WW5 6
HoraFinWW6 =
,WW= >
tXX4 5
.XX5 6
AgendaDisponibleXX6 F
,XXF G
tYY4 5
.YY5 6
CantidadPersonasYY6 F
,YYF G
tramitesZZ4 <
=ZZ= >
(ZZ? @
fromZZ@ D
trZZE G
inZZH J
tZZK L
.ZZL M
TramitesZZM U
join[[@ D
dtr[[E H
in[[I K
tramitesJoined[[L Z
on[[[ ]
tr[[^ `
equals[[a g
dtr[[h k
.[[k l
	IdTramite[[l u
select\\@ F
new\\G J
{]]@ A
dtr^^D G
.^^G H
Nombres^^H O
,^^O P
dtr__D G
.__G H
CorreoElectronico__H Y
,__Y Z
dtr``D G
.``G H 
NumeroIdentificacion``H \
,``\ ]
dtraaD G
.aaG H
NombreServicioaaH V
,aaV W
dtrbbD G
.bbG H
DuracionServiciobbH X
,bbX Y
dtrccD G
.ccG H
TiempoAtencionccH V
,ccV W
dtrddD G
.ddG H
FechaRegistroddH U
,ddU V
dtreeD G
.eeG H
NombreEstadoeeH T
,eeT U
dtrffD G
.ffG H
TramiteVirtualffH V
}gg@ A
)ggA B
.ggB C
DistinctggC K
(ggK L
)ggL M
,ggM N
usuariosVetadoshh4 C
=hhD E
(hhF G
fromhhG K
ushhL N
inhhO Q
thhR S
.hhS T
UsuariosVetadoshhT c
joiniiG K
uiiL M
iniiN P"
listadoUsuariosVetadosiiQ g
oniih j
usiik m
equalsiin t
uiiu v
.iiv w
	IdUsuario	iiw Ä
selectjjG M
newjjN Q
{kkG H
ullK L
.llL M
NombresllM T
,llT U
ummK L
.mmL M 
NumeroIdentificacionmmM a
,mma b
unnK L
.nnL M
CorreoElectroniconnM ^
}ooG H
)ooH I
.ooI J
DistinctooJ R
(ooR S
)ooS T
}pp0 1
)pp1 2
}qq, -
)qq- .
}rr" #
)ss! "
}tt 
)tt  
;tt  !
returnvv 

mallasSedevv 
;vv 
}ww 	
publicyy 
asyncyy 
Taskyy 
<yy 
Listyy 
<yy 
DatosSedeDtoyy +
>yy+ ,
>yy, -
GetDatosSedesyy. ;
(yy; <
stringyy< B
idSedesyyC J
)yyJ K
{zz 	
return{{ 
await{{ 
_unitOfWork{{ $
.{{$ %
SedeRepository{{% 3
.{{3 4
ObtenerDatosSede{{4 D
({{D E
idSedes{{E L
){{L M
;{{M N
}|| 	
public~~ 
async~~ 
Task~~ 
<~~ 
List~~ 
<~~ 
SedeDto~~ &
>~~& '
>~~' (
GetSubSedes~~) 4
(~~4 5
string~~5 ;
idSedes~~< C
)~~C D
{ 	
List
ÄÄ 
<
ÄÄ 
SedeDto
ÄÄ 
>
ÄÄ 
subSedes
ÄÄ "
=
ÄÄ# $
await
ÄÄ% *
_unitOfWork
ÄÄ+ 6
.
ÄÄ6 7
SedeRepository
ÄÄ7 E
.
ÄÄE F
ObtenerSubsedes
ÄÄF U
(
ÄÄU V
idSedes
ÄÄV ]
)
ÄÄ] ^
;
ÄÄ^ _
return
ÅÅ 
subSedes
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
public
ÑÑ 
string
ÑÑ  
GetUsuariosVetados
ÑÑ (
(
ÑÑ( )
List
ÑÑ) -
<
ÑÑ- .
Malla
ÑÑ. 3
>
ÑÑ3 4
malla
ÑÑ5 :
)
ÑÑ: ;
{
ÖÖ 	
var
ÜÜ 
usuariosVetados
ÜÜ 
=
ÜÜ  !
malla
ÜÜ" '
.
ÜÜ' (

SelectMany
ÜÜ( 2
(
ÜÜ2 3
x
ÜÜ3 4
=>
ÜÜ5 7
x
ÜÜ8 9
.
ÜÜ9 :
MallasPorSubSede
ÜÜ: J
.
áá( )

SelectMany
áá) 3
(
áá3 4
mps
áá4 7
=>
áá8 :
mps
áá; >
.
áá> ?
TiemposAtencion
áá? N
?
ááN O
.
àà( )
Where
àà) .
(
àà. /
ta
àà/ 1
=>
àà2 4
ta
àà5 7
.
àà7 8
Tiempos
àà8 ?
!=
àà@ B
null
ààC G
)
ààG H
.
ààH I

SelectMany
ààI S
(
ààS T
ta
ààT V
=>
ààW Y
ta
ààZ \
.
àà\ ]
Tiempos
àà] d
.
ââ( )

SelectMany
ââ) 3
(
ââ3 4
t
ââ4 5
=>
ââ6 8
t
ââ9 :
.
ââ: ;
UsuariosVetados
ââ; J
)
ââJ K
)
ââK L
)
ââL M
)
ââM N
.
ââN O
Distinct
ââO W
(
ââW X
)
ââX Y
;
ââY Z
return
ãã 
string
ãã 
.
ãã 
Join
ãã 
(
ãã 
$str
ãã "
,
ãã" #
usuariosVetados
ãã$ 3
.
ãã3 4
Select
ãã4 :
(
ãã: ;
x
ãã; <
=>
ãã= ?
$"
ãã@ B
$str
ããB C
{
ããC D
x
ããD E
}
ããE F
$str
ããF G
"
ããG H
)
ããH I
)
ããI J
;
ããJ K
}
åå 	
public
éé 
async
éé 
Task
éé 
<
éé 
IEnumerable
éé %
<
éé% &
dynamic
éé& -
>
éé- .
>
éé. /
GetTramitesJoined
éé0 A
(
ééA B
List
ééB F
<
ééF G

TramiteDto
ééG Q
>
ééQ R
tramites
ééS [
)
éé[ \
{
èè 	
string
êê 

idUsuarios
êê 
=
êê 

DataHelper
êê  *
.
êê* +
ListaValores
êê+ 7
(
êê7 8
tramites
êê8 @
,
êê@ A
$str
êêB M
)
êêM N
;
êêN O
List
ëë 
<
ëë 

UsuarioDto
ëë 
>
ëë 
usuarios
ëë %
=
ëë& '
!
ëë( )

idUsuarios
ëë) 3
.
ëë3 4
IsEmpty
ëë4 ;
(
ëë; <
)
ëë< =
?
ëë> ?
await
ëë@ E
_unitOfWork
ëëF Q
.
ëëQ R
UsuarioRepository
ëëR c
.
ëëc d
ObtenerUsuario
ëëd r
(
ëër s

idUsuarios
ëës }
)
ëë} ~
:
ëë~ 
newëëÄ É
ListëëÑ à
<ëëà â

UsuarioDtoëëâ ì
>ëëì î
(ëëî ï
)ëëï ñ
{ëëó ò
}ëëô ö
;ëëõ ú
string
ìì 
idServicios
ìì 
=
ìì  

DataHelper
ìì! +
.
ìì+ ,
ListaValores
ìì, 8
(
ìì8 9
tramites
ìì9 A
,
ììA B
$str
ììC O
)
ììO P
;
ììP Q
List
îî 
<
îî 
ServicioDataDto
îî  
>
îî  !
	servicios
îî" +
=
îî, -
!
îî. /
idServicios
îî/ :
.
îî: ;
IsEmpty
îî; B
(
îîB C
)
îîC D
?
îîD E
await
îîF K
_unitOfWork
îîL W
.
îîW X 
ServicioRepository
îîX j
.
îîj k.
ObtenerTiempodeAtencionServicioîîk ä
(îîä ã
idServiciosîîã ñ
)îîñ ó
:îîó ò
newîîò õ
Listîîú †
<îî† °
ServicioDataDtoîî° ∞
>îî∞ ±
(îî± ≤
)îî≤ ≥
{îî¥ µ
}îî∂ ∑
;îî∑ ∏
var
ññ 
tramitesJoined
ññ 
=
ññ  
(
ññ! "
from
ññ" &
u
ññ' (
in
ññ) +
usuarios
ññ, 4
join
óó" &
tr
óó' )
in
óó* ,
tramites
óó- 5
on
óó6 8
u
óó9 :
.
óó: ;
	IdUsuario
óó; D
equals
óóE K
tr
óóL N
.
óóN O
	IdUsuario
óóO X
from
òò" &
s
òò' (
in
òò) +
	servicios
òò, 5
join
ôô" &
tr1
ôô' *
in
ôô+ -
tramites
ôô. 6
on
ôô7 9
s
ôô: ;
.
ôô; <

IdServicio
ôô< F
equals
ôôG M
tr1
ôôN Q
.
ôôQ R

PkServicio
ôôR \
select
öö" (
new
öö) ,
{
õõ" #
	IdTramite
úú& /
=
úú0 1
tr
úú2 4
.
úú4 5
	PkTramite
úú5 >
,
úú> ?
u
ùù& '
.
ùù' (
Nombres
ùù( /
,
ùù/ 0
u
ûû& '
.
ûû' (
CorreoElectronico
ûû( 9
,
ûû9 :
u
üü& '
.
üü' ("
NumeroIdentificacion
üü( <
,
üü< =
tr
††& (
.
††( )
NombreEstado
††) 5
,
††5 6
tr
°°& (
.
°°( )
FechaRegistro
°°) 6
,
°°6 7
tr
¢¢& (
.
¢¢( )
DuracionServicio
¢¢) 9
,
¢¢9 :
s
££& '
.
££' (
NombreServicio
££( 6
,
££6 7
s
§§& '
.
§§' (
TiempoAtencion
§§( 6
,
§§6 7
s
••& '
.
••' (
TramiteVirtual
••( 6
}
¶¶" #
)
¶¶# $
;
¶¶$ %
return
®® 
tramitesJoined
®® !
;
®®! "
}
©© 	
}
™™ 
}´´ î
]C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Services\HttpService.cs
	namespace 	
FxMalla
 
. 
Services 
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
string8 >
fechaInicio? J
,J K
stringL R
fechaFinS [
)[ \
{ 	
string 
url 
= 
ConstruirURL %
(% &
fechaInicio& 1
,1 2
fechaFin3 ;
); <
;< =
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
string# )
fechaInicio* 5
,5 6
string7 =
fechaFin> F
)F G
{ 	
string   
urlBase   
=   
_configuration   +
[  + ,
$str  , G
]  G H
;  H I

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
$str$$" ?
]$$? @
,$$@ A
fechaInicio$$B M
}$$M N
,$$N O
{%% 
_configuration%% !
[%%! "
$str%%" ?
]%%? @
,%%@ A
fechaFin%%B J
}%%L M
}&& 
;&& 
var(( 
uri(( 
=(( 
QueryHelpers(( "
.((" #
AddQueryString((# 1
(((1 2
urlBase((2 9
,((9 :
values((; A
)((A B
;((B C
string)) 
url)) 
=)) 
new)) 
Uri))  
())  !
uri))! $
)))$ %
.))% &
ToString))& .
()). /
)))/ 0
;))0 1
return++ 
url++ 
.++ 
Replace++ 
(++ 
$str++ $
,++$ %
$str++& )
)++) *
;++* +
},, 	
}-- 
}.. ßP
PC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Startup.cs
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
	namespace 	
FxMalla
 
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
.NNT U
IgnoreNNU [
;NN[ \
}OO 
)OO 
;OO 
builderQQ 
.QQ 
ServicesQQ 
.QQ 
AddTransientQQ )
<QQ) *
IUnitOfWorkQQ* 5
,QQ5 6

UnitOfWorkQQ7 A
>QQA B
(QQB C
)QQC D
;QQD E
builderRR 
.RR 
ServicesRR 
.RR 
AddTransientRR )
<RR) *
IDataServiceRR* 6
,RR6 7
DataServiceRR8 C
>RRC D
(RRD E
)RRE F
;RRF G
stringVV 
ApiKeyVV 
=VV 
configurationVV )
[VV) *
$strVV* G
]VVG H
;VVH I
stringWW 
valueApiKeyWW 
=WW  
configurationWW! .
[WW. /
ApiKeyWW/ 5
]WW5 6
;WW6 7
builderYY 
.YY 
ServicesYY 
.YY 
AddHttpClientYY *
(YY* +
)YY+ ,
;YY, -
builderZZ 
.ZZ 
ServicesZZ 
.ZZ 
AddHttpClientZZ *
<ZZ* +
IHttpServiceZZ+ 7
,ZZ7 8
HttpServiceZZ9 D
>ZZD E
(ZZE F
clientZZF L
=>ZZM O
{[[ 
client\\ 
.\\ !
DefaultRequestHeaders\\ ,
.\\, -
Accept\\- 3
.\\3 4
Add\\4 7
(\\7 8
new\\8 ;+
MediaTypeWithQualityHeaderValue\\< [
(\\[ \
$str\\\ n
)\\n o
)\\o p
;\\p q
client]] 
.]] !
DefaultRequestHeaders]] ,
.]], -
Add]]- 0
(]]0 1
$str]]1 L
,]]L M
valueApiKey]]N Y
)]]Y Z
;]]Z [
}^^ 
)^^ 
;^^ 
builderdd 
.dd 
Servicesdd 
.dd 
	AddScopeddd &
<dd& '
IMallaRepositorydd' 7
,dd7 8
MallaRepositorydd9 H
>ddH I
(ddI J
)ddJ K
;ddK L
builderee 
.ee 
Servicesee 
.ee 
	AddScopedee &
<ee& '
ISedeRepositoryee' 6
,ee6 7
SedeRepositoryee8 F
>eeF G
(eeG H
)eeH I
;eeI J
builderff 
.ff 
Servicesff 
.ff 
	AddScopedff &
<ff& '
IServicioRepositoryff' :
,ff: ;
ServicioRepositoryff< N
>ffN O
(ffO P
)ffP Q
;ffQ R
buildergg 
.gg 
Servicesgg 
.gg 
	AddScopedgg &
<gg& '
ITramiteRepositorygg' 9
,gg9 :
TramiteRepositorygg; L
>ggL M
(ggM N
)ggN O
;ggO P
builderhh 
.hh 
Serviceshh 
.hh 
	AddScopedhh &
<hh& '
IUsuarioRepositoryhh' 9
,hh9 :
UsuarioRepositoryhh; L
>hhL M
(hhM N
)hhN O
;hhO P
buildernn 
.nn 
Servicesnn 
.nn 
	AddScopednn &
<nn& '

IValidatornn' 1
<nn1 2

MallaInputnn2 <
>nn< =
,nn= >
MallaInputValidatornn? R
>nnR S
(nnS T
)nnT U
;nnU V
builderpp 
.pp 
Servicespp 
.pp 
	AddScopedpp &
<pp& '

IValidatorpp' 1
<pp1 2
Tuplepp2 7
<pp7 8
stringpp8 >
,pp> ?
stringpp@ F
,ppF G
stringppH N
>ppN O
>ppO P
,ppP Q
TiemposValidatorppR b
>ppb c
(ppc d
)ppd e
;ppe f
builderqq 
.qq 
Servicesqq 
.qq 
	AddScopedqq &
<qq& '

IValidatorqq' 1
<qq1 2
Tupleqq2 7
<qq7 8
stringqq8 >
,qq> ?
stringqq@ F
>qqF G
>qqG H
,qqH I
DiasValidatorqqJ W
>qqW X
(qqX Y
)qqY Z
;qqZ [
builderrr 
.rr 
Servicesrr 
.rr 
	AddScopedrr &
<rr& '

IValidatorrr' 1
<rr1 2

FechaInputrr2 <
>rr< =
,rr= >
FechaInputValidatorrr? R
>rrR S
(rrS T
)rrT U
;rrU V
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
}yy Ø
YC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Utils\DataHelper.cs
	namespace 	
FxMalla
 
. 
Utils 
{ 
public 

static 
class 

DataHelper "
{ 
public 
static 
string 
ListaValores )
() *
IEnumerable* 5
<5 6
dynamic6 =
>= >
lista? D
,D E
stringF L
claveM R
)R S
{		 	
dynamic

 
[

 
]

 
valores

 
=

 
lista

  %
.

% &
Select

& ,
(

, -
x

- .
=>

/ 1
x

2 3
.

3 4
GetType

4 ;
(

; <
)

< =
.

= >
GetProperty

> I
(

I J
clave

J O
)

O P
.

P Q
GetValue

Q Y
(

Y Z
x

Z [
)

[ \
)

\ ]
.

] ^
Distinct

^ f
(

f g
)

g h
.

h i
ToArray

i p
(

p q
)

q r
;

r s
return 
string 
. 
Join 
( 
$str "
," #
valores$ +
.+ ,
Select, 2
(2 3
x3 4
=>5 7
$"8 :
$str: ;
{; <
x< =
}= >
$str> ?
"? @
)@ A
)A B
;B C
} 	
} 
} ´
aC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Utils\HttpResponseHelper.cs
	namespace 	
FxMalla
 
. 
Utils 
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
} –
]C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Utils\SecurityHelper.cs
	namespace 	
FxMalla
 
. 
Utils 
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
} Ê¢
YC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Utils\TimeHelper.cs
	namespace

 	
FxMalla


 
.

 
Utils

 
{ 
public 

static 
class 

TimeHelper "
{ 
public 
static 
bool 
ValidacionFecha *
(* +
string+ 1
fecha2 7
)7 8
{ 	
return 
ConvertirFecha !
(! "
fecha" '
)' (
.( )
Date) -
>=. 0 
ObtenerFechaColombia1 E
(E F
)F G
.G H
DateH L
;L M
} 	
public 
static 
bool  
ValidacionFechaMenor /
(/ 0
string0 6
fecha7 <
)< =
{ 	
return 
ConvertirFecha !
(! "
fecha" '
)' (
.( )
Date) -
<. / 
ObtenerFechaColombia0 D
(D E
)E F
.F G
DateG K
;K L
} 	
public 
static 
DateTime  
ObtenerFechaColombia 3
(3 4
)4 5
{ 	
TimeZoneInfo 
zonaColombia %
=& '
TimeZoneInfo( 4
.4 5"
FindSystemTimeZoneById5 K
(K L
$strL c
)c d
;d e
DateTime 
today 
= 
TimeZoneInfo )
.) *
ConvertTime* 5
(5 6
DateTime6 >
.> ?
UtcNow? E
,E F
zonaColombiaG S
)S T
;T U
return 
today 
; 
} 	
public 
static 
DateTime 
ConevrtirHora ,
(, -
string- 3
hora4 8
,8 9
string: @
formatoHoraA L
)L M
{   	
return!! 
DateTime!! 
.!! 

ParseExact!! &
(!!& '
hora!!' +
,!!+ ,
formatoHora!!- 8
,!!8 9
null!!: >
)!!> ?
;!!? @
}"" 	
public$$ 
static$$ 
DateTime$$ 
ConvertirFecha$$ -
($$- .
string$$. 4
fecha$$5 :
)$$: ;
{%% 	
try&& 
{'' 
var(( 
datos(( 
=(( 
fecha(( !
.((! "
Split((" '
(((' (
$str((( +
)((+ ,
;((, -
int)) 
year)) 
=)) 
int)) 
.)) 
Parse)) $
())$ %
datos))% *
[))* +
$num))+ ,
])), -
.))- .
Split)). 3
())3 4
)))4 5
[))5 6
$num))6 7
]))7 8
)))8 9
;))9 :
int** 
month** 
=** 
int** 
.**  
Parse**  %
(**% &
datos**& +
[**+ ,
$num**, -
]**- .
)**. /
;**/ 0
int++ 
day++ 
=++ 
int++ 
.++ 
Parse++ #
(++# $
datos++$ )
[++) *
$num++* +
]+++ ,
)++, -
;++- .
TimeZoneInfo,, 
zonaColombia,, )
=,,* +
TimeZoneInfo,,, 8
.,,8 9"
FindSystemTimeZoneById,,9 O
(,,O P
$str,,P g
),,g h
;,,h i
DateTime-- 
convertDate-- $
=--% &
new--' *
(--* +
year--+ /
,--/ 0
month--1 6
,--6 7
day--8 ;
)--; <
;--< =
DateTime// 
fechaColombia// &
=//' (
TimeZoneInfo//) 5
.//5 6
ConvertTime//6 A
(//A B
convertDate//B M
,//M N
zonaColombia//O [
)//[ \
;//\ ]
return11 
fechaColombia11 $
;11$ %
}22 
catch33 
(33 
	Exception33 
)33 
{44 
return55 
new55 
(55 
$num55 
,55  
$num55! "
,55" #
$num55$ %
)55% &
;55& '
}66 
}77 	
public99 
static99 
List99 
<99 
DateTime99 #
>99# $
GetDatesBetween99% 4
(994 5
DateTime995 =
start99> C
,99C D
DateTime99E M
end99N Q
)99Q R
{:: 	
var;; 
dates;; 
=;; 

Enumerable;; "
.;;" #
Range;;# (
(;;( )
$num;;) *
,;;* +
$num;;, -
+;;. /
end;;0 3
.;;3 4
Subtract;;4 <
(;;< =
start;;= B
);;B C
.;;C D
Days;;D H
);;H I
.<<" #
Select<<# )
(<<) *
offset<<* 0
=><<1 3
start<<4 9
.<<9 :
AddDays<<: A
(<<A B
offset<<B H
)<<H I
)<<I J
.==" #
ToList==# )
(==) *
)==* +
;==+ ,
return>> 
dates>> 
;>> 
}?? 	
publicAA 
staticAA 
ListAA 
<AA 
DateTimeAA #
>AA# $
CalcularTiempoAA% 3
(AA3 4
DateTimeAA4 <
diaAA= @
,AA@ A
DateTimeAAB J

horaInicioAAK U
,AAU V
DateTimeAAW _
horaFinAA` g
,AAg h
longAAi m
rangoAAn s
)AAs t
{BB 	
DateTimeCC 
TimeInCC 
=CC 
diaCC !
.CC! "
AddHoursCC" *
(CC* +

horaInicioCC+ 5
.CC5 6
HourCC6 :
)CC: ;
.CC; <

AddMinutesCC< F
(CCF G

horaInicioCCG Q
.CCQ R
MinuteCCR X
)CCX Y
;CCY Z
DateTimeDD 
TimeOutDD 
=DD 
diaDD "
.DD" #
AddHoursDD# +
(DD+ ,
horaFinDD, 3
.DD3 4
HourDD4 8
)DD8 9
.DD9 :

AddMinutesDD: D
(DDD E

horaInicioDDE O
.DDO P
MinuteDDP V
)DDV W
;DDW X
ListEE 
<EE 
DateTimeEE 
>EE 
horasEE  
=EE! "
newEE# &
(EE& '
)EE' (
;EE( )
intFF 
finRangoFF 
=FF 
(FF 
intFF 
)FF  
(FF  !
TimeOutFF! (
-FF) *
TimeInFF+ 1
)FF1 2
.FF2 3
TotalMinutesFF3 ?
/FF@ A
ConvertFFB I
.FFI J
ToInt32FFJ Q
(FFQ R
rangoFFR W
)FFW X
;FFX Y
forGG 
(GG 
intGG 
iGG 
=GG 
$numGG 
;GG 
iGG 
<=GG  
finRangoGG! )
;GG) *
iGG+ ,
++GG, .
)GG. /
{HH 
ifII 
(II 
iII 
==II 
$numII 
)II 
{JJ 
horasKK 
.KK 
AddKK 
(KK 
TimeInKK $
.KK$ %

AddMinutesKK% /
(KK/ 0
$numKK0 1
)KK1 2
)KK2 3
;KK3 4
}LL 
elseMM 
{NN 
horasOO 
.OO 
AddOO 
(OO 
horasOO #
[OO# $
iOO$ %
-OO& '
$numOO( )
]OO) *
.OO* +

AddMinutesOO+ 5
(OO5 6
rangoOO6 ;
)OO; <
)OO< =
;OO= >
}PP 
}QQ 
returnRR 
horasRR 
;RR 
}SS 	
publicUU 
staticUU 
voidUU #
InactivarTiemposOfflineUU 2
(UU2 3
refUU3 6
AgendaUU7 =
	agendaDiaUU> G
,UUG H
TiempoOfflineUUI V
[UUV W
]UUW X
TiemposOfflineUUY g
,UUg h
longUUi m
rangoUUn s
,UUs t
stringUUu {
formatoHora	UU| á
)
UUá à
{VV 	
AgendaWW 
agendaLocalWW 
=WW  
	agendaDiaWW! *
;WW* +
varYY 
tiemposInactivarYY  
=YY! "
fromYY# '
tYY( )
inYY* ,
TiemposOfflineYY- ;
whereZZ# (
tZZ) *
.ZZ* +
DiasZZ+ /
.ZZ/ 0
ContainsZZ0 8
(ZZ8 9
agendaLocalZZ9 D
.ZZD E
	DiaSemanaZZE N
)ZZN O
select[[# )
t[[* +
;[[+ ,
if]] 
(]] 
tiemposInactivar]]  
.]]  !
Any]]! $
(]]$ %
)]]% &
)]]& '
{^^ 
DateTime__ 

HoraInicio__ #
=__$ %
ConevrtirHora__& 3
(__3 4
tiemposInactivar__4 D
.__D E
FirstOrDefault__E S
(__S T
)__T U
?__U V
.__V W

HoraInicio__W a
,__a b
formatoHora__c n
)__n o
;__o p
DateTime`` 
HoraFin``  
=``! "
ConevrtirHora``# 0
(``0 1
tiemposInactivar``1 A
.``A B
FirstOrDefault``B P
(``P Q
)``Q R
?``R S
.``S T
HoraFin``T [
,``[ \
formatoHora``] h
)``h i
;``i j
varbb 
horasconDiabb 
=bb  !
CalcularTiempobb" 0
(bb0 1
ConvertirFechabb1 ?
(bb? @
	agendaDiabb@ I
.bbI J
FechabbJ O
)bbO P
,bbP Q

HoraIniciobbR \
,bb\ ]
HoraFinbb^ e
,bbe f
rangobbg l
)bbl m
;bbm n
horasconDiacc 
.cc 
RemoveAtcc $
(cc$ %
horasconDiacc% 0
.cc0 1
Countcc1 6
-cc7 8
$numcc9 :
)cc: ;
;cc; <
Listee 
<ee 
stringee 
>ee 
horasMilitaresee +
=ee, -
newee. 1
(ee1 2
)ee2 3
{ee4 5
}ee6 7
;ee7 8
foreachgg 
(gg 
vargg 
horagg !
ingg" $
horasconDiagg% 0
)gg0 1
{hh 
horasMilitaresii "
.ii" #
Addii# &
(ii& '
horaii' +
.ii+ ,
ToStringii, 4
(ii4 5
formatoHoraii5 @
)ii@ A
)iiA B
;iiB C
}jj 
	agendaDiall 
.ll 
Tiemposll !
.mm 
Wheremm  
(mm  !
diamm! $
=>mm% '
horasMilitaresmm( 6
.mm6 7
Containsmm7 ?
(mm? @
diamm@ C
.mmC D

HoraIniciommD N
)mmN O
)mmO P
.mmP Q
ToListmmQ W
(mmW X
)mmX Y
.nn 
ForEachnn "
(nn" #
diann# &
=>nn' )
diann* -
.nn- .
AgendaDisponiblenn. >
=nn? @
falsennA F
)nnF G
;nnG H
}oo 
}pp 	
publicrr 
staticrr 
Tiemporr 
[rr 
]rr 
CalcularAgendaDiarr 0
(rr0 1
DateTimerr1 9
diarr: =
,rr= >
DateTimerr? G

horaIniciorrH R
,rrR S
DateTimerrT \
horaFinrr] d
,rrd e
longrrf j
rangorrk p
,rrp q
longrrr v
cantidadPersonas	rrw á
,
rrá à
string
rrâ è
formatoHora
rrê õ
)
rrõ ú
{ss 	
vartt 
horastt 
=tt 
CalcularTiempott &
(tt& '
diatt' *
,tt* +

horaIniciott, 6
,tt6 7
horaFintt8 ?
,tt? @
rangottA F
)ttF G
;ttG H
intuu 
limiteuu 
=uu 
horasuu 
.uu 
Countuu $
-uu% &
$numuu' (
;uu( )
Listvv 
<vv 
Tiempovv 
>vv 

tiemposDiavv #
=vv$ %
newvv& )
(vv) *
)vv* +
;vv+ ,
forxx 
(xx 
intxx 
ixx 
=xx 
$numxx 
;xx 
ixx 
<=xx  
limitexx! '
;xx' (
ixx) *
++xx* ,
)xx, -
{yy 
varzz 
tiempozz 
=zz 
newzz  
Tiempozz! '
(zz' (
)zz( )
{{{ 
IdTiempoMalla|| !
=||" #
Guid||$ (
.||( )
NewGuid||) 0
(||0 1
)||1 2
.||2 3
ToString||3 ;
(||; <
)||< =
,||= >

HoraInicio}} 
=}}  
horas}}! &
[}}& '
i}}' (
]}}( )
.}}) *
ToString}}* 2
(}}2 3
formatoHora}}3 >
)}}> ?
,}}? @
HoraFin~~ 
=~~ 
i~~ 
==~~  "
limite~~# )
?~~* +
horas~~, 1
[~~1 2
i~~2 3
]~~3 4
.~~4 5
ToString~~5 =
(~~= >
formatoHora~~> I
)~~I J
:~~K L
horas~~M R
[~~R S
i~~S T
+~~U V
$num~~W X
]~~X Y
.~~Y Z
ToString~~Z b
(~~b c
formatoHora~~c n
)~~n o
,~~o p
AgendaDisponible $
=% &
true' +
,+ ,
Tramites
ÄÄ 
=
ÄÄ 
Array
ÄÄ $
.
ÄÄ$ %
Empty
ÄÄ% *
<
ÄÄ* +
string
ÄÄ+ 1
>
ÄÄ1 2
(
ÄÄ2 3
)
ÄÄ3 4
,
ÄÄ4 5
CantidadPersonas
ÅÅ $
=
ÅÅ% &
cantidadPersonas
ÅÅ' 7
}
ÇÇ 
;
ÇÇ 

tiemposDia
ÑÑ 
.
ÑÑ 
Add
ÑÑ 
(
ÑÑ 
tiempo
ÑÑ %
)
ÑÑ% &
;
ÑÑ& '
}
ÖÖ 
if
áá 
(
áá 

tiemposDia
áá 
.
áá 
Count
áá  
>=
áá! #
$num
áá$ %
)
áá% &

tiemposDia
àà 
.
àà 
RemoveAt
àà #
(
àà# $

tiemposDia
àà$ .
.
àà. /
Count
àà/ 4
-
àà5 6
$num
àà7 8
)
àà8 9
;
àà9 :
return
ää 

tiemposDia
ää 
.
ää 
ToArray
ää %
(
ää% &
)
ää& '
;
ää' (
}
ãã 	
public
çç 
static
çç 
bool
çç 
FechaActiva
çç &
(
çç& '
string
çç' -
fechaFin
çç. 6
)
çç6 7
{
éé 	
TimeZoneInfo
èè 
zonaColombia
èè %
=
èè& '
TimeZoneInfo
èè( 4
.
èè4 5$
FindSystemTimeZoneById
èè5 K
(
èèK L
$str
èèL c
)
èèc d
;
èèd e
DateTime
êê 
fechaColombia
êê "
=
êê# $
TimeZoneInfo
êê% 1
.
êê1 2
ConvertTime
êê2 =
(
êê= >
DateTime
êê> F
.
êêF G
Now
êêG J
,
êêJ K
zonaColombia
êêL X
)
êêX Y
;
êêY Z
return
íí 
ConvertirFecha
íí !
(
íí! "
fechaFin
íí" *
)
íí* +
<
íí, -
fechaColombia
íí. ;
;
íí; <
}
ìì 	
public
ïï 
static
ïï 
bool
ïï 
InactivarFestivos
ïï ,
(
ïï, -
List
ïï- 1
<
ïï1 2
string
ïï2 8
>
ïï8 9
fechasFestivos
ïï: H
,
ïïH I
Agenda
ïïJ P
	agendaDia
ïïQ Z
)
ïïZ [
{
ññ 	
return
óó 
fechasFestivos
óó !
.
óó! "
Contains
óó" *
(
óó* +
	agendaDia
óó+ 4
.
óó4 5
Fecha
óó5 :
)
óó: ;
;
óó; <
}
òò 	
public
öö 
static
öö 
List
öö 
<
öö 
Agenda
öö !
>
öö! "
CalcularAgenda
öö# 1
(
öö1 2
AgendaInput
öö2 =
input
öö> C
,
ööC D
List
ööE I
<
ööI J
string
ööJ P
>
ööP Q
festivos
ööR Z
,
ööZ [
string
öö\ b
FORMATO_FECHA
ööc p
,
ööp q
string
öör x
FORMATO_HORAööy Ö
)ööÖ Ü
{
õõ 	
List
úú 
<
úú 
DateTime
úú 
>
úú 
result
úú !
=
úú" #
GetDatesBetween
úú$ 3
(
úú3 4
input
úú4 9
.
úú9 :
FechaInicio
úú: E
,
úúE F
input
úúG L
.
úúL M
FechaFin
úúM U
)
úúU V
;
úúV W
List
ùù 
<
ùù 
Agenda
ùù 
>
ùù 
agenda
ùù 
=
ùù  !
new
ùù" %
(
ùù% &
)
ùù& '
;
ùù' (
bool
üü 
	isFestivo
üü 
=
üü 
false
üü "
;
üü" #
if
†† 
(
†† 
input
†† 
!=
†† 
null
†† 
)
†† 
{
°° 
foreach
¢¢ 
(
¢¢ 
var
¢¢ 
date
¢¢ !
in
¢¢" $
result
¢¢% +
)
¢¢+ ,
{
££ 
var
§§ 
	agendaDia
§§ !
=
§§" #
new
§§$ '
Agenda
§§( .
(
§§. /
)
§§/ 0
{
•• 
Fecha
¶¶ 
=
¶¶ 
date
¶¶  $
.
¶¶$ %
ToString
¶¶% -
(
¶¶- .
FORMATO_FECHA
¶¶. ;
)
¶¶; <
,
¶¶< =
	DiaSemana
ßß !
=
ßß" #
date
ßß$ (
.
ßß( )
	DayOfWeek
ßß) 2
.
ßß2 3
ToString
ßß3 ;
(
ßß; <
)
ßß< =
,
ßß= >
}
®® 
;
®® 
if
™™ 
(
™™ 
input
™™ 
.
™™ 
InactivaFestivos
™™ .
)
™™. /
	isFestivo
´´ !
=
´´" #
InactivarFestivos
´´$ 5
(
´´5 6
festivos
´´6 >
,
´´> ?
	agendaDia
´´@ I
)
´´I J
;
´´J K
if
≠≠ 
(
≠≠ 
!
≠≠ 
input
≠≠ 
.
≠≠ 
DiasOffline
≠≠ *
.
≠≠* +
Contains
≠≠+ 3
(
≠≠3 4
date
≠≠4 8
.
≠≠8 9
	DayOfWeek
≠≠9 B
.
≠≠B C
ToString
≠≠C K
(
≠≠K L
)
≠≠L M
)
≠≠M N
&&
≠≠O Q
!
≠≠R S
	isFestivo
≠≠S \
)
≠≠\ ]
{
ÆÆ 
	agendaDia
ØØ !
.
ØØ! "
Tiempos
ØØ" )
=
ØØ* +
CalcularAgendaDia
ØØ, =
(
ØØ= >
date
ØØ> B
,
ØØB C
ConevrtirHora
∞∞H U
(
∞∞U V
input
∞∞V [
.
∞∞[ \

HoraInicio
∞∞\ f
,
∞∞f g
FORMATO_HORA
∞∞h t
)
∞∞t u
,
∞∞u v
ConevrtirHora
±±H U
(
±±U V
input
±±V [
.
±±[ \
HoraFin
±±\ c
,
±±c d
FORMATO_HORA
±±e q
)
±±q r
,
±±r s
input
≤≤H M
.
≤≤M N
	Intervalo
≤≤N W
,
≤≤W X
input
≥≥H M
.
≥≥M N
CantidadPersonas
≥≥N ^
,
≥≥^ _
FORMATO_HORA
¥¥H T
)
¥¥T U
;
¥¥U V
if
∂∂ 
(
∂∂ 
input
∂∂ !
.
∂∂! "
TiemposOffline
∂∂" 0
.
∂∂0 1
Any
∂∂1 4
(
∂∂4 5
)
∂∂5 6
)
∂∂6 7%
InactivarTiemposOffline
∑∑ 3
(
∑∑3 4
ref
∑∑4 7
	agendaDia
∑∑8 A
,
∑∑A B
input
∑∑C H
.
∑∑H I
TiemposOffline
∑∑I W
,
∑∑W X
input
∑∑Y ^
.
∑∑^ _
	Intervalo
∑∑_ h
,
∑∑h i
FORMATO_HORA
∑∑j v
)
∑∑v w
;
∑∑w x
agenda
∏∏ 
.
∏∏ 
Add
∏∏ "
(
∏∏" #
	agendaDia
∏∏# ,
)
∏∏, -
;
∏∏- .
}
ππ 
else
∫∫ 
{
ªª 
agenda
ºº 
.
ºº 
Add
ºº "
(
ºº" #
	agendaDia
ºº# ,
)
ºº, -
;
ºº- .
}
ΩΩ 
}
ææ 
}
øø 
return
¡¡ 
agenda
¡¡ 
;
¡¡ 
}
¬¬ 	
}
√√ 
}ƒƒ Ø
`C:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Validator\DiasValidator.cs
	namespace		 	
FxMalla		
 
.		 
	Validator		 
{

 
public 

class 
DiasValidator 
:  
AbstractValidator! 2
<2 3
Tuple3 8
<8 9
string9 ?
,? @
stringA G
>G H
>H I
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
readonly 
IConfiguration &
_config' .
;. /
public 
DiasValidator 
( 
IUnitOfWork (

unitOfWork) 3
,3 4
IConfiguration5 C
configD J
)J K
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_config 
= 
config 
; 
RuleFor 
( 
property 
=> 
property  (
.( )
Item1) .
). /
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' K
)K L
. 
Must 
( 
property 
=> !
VerificarSede" /
(/ 0
property0 8
)8 9
)9 :
.: ;
WithMessage; F
(F G
$strG t
)t u
;u v
RuleFor 
( 
property 
=> 
property  (
.( )
Item2) .
). /
. 
NotEmpty 
( 
) 
.   
NotNull   
(   
)   
.   
WithMessage   #
(  # $
$str  $ T
)  T U
.!! 
Must!! 
(!! 
property!! 
=>!! 
VerificarServicio!! 0
(!!0 1
property!!1 9
)!!9 :
)!!: ;
.!!; <
WithMessage!!< G
(!!G H
$str!!H y
)!!y z
;!!z {
}"" 	
private$$ 
bool$$ 
VerificarServicio$$ &
($$& '
string$$' -
property$$. 6
)$$6 7
{%% 	
return&& 
_unitOfWork&& 
.&& 
ServicioRepository&& 1
.&&1 2
ExisteServicio&&2 @
(&&@ A
property&&A I
)&&I J
.&&J K

GetAwaiter&&K U
(&&U V
)&&V W
.&&W X
	GetResult&&X a
(&&a b
)&&b c
;&&c d
}'' 	
private)) 
bool)) 
VerificarSede)) "
())" #
string))# )
property))* 2
)))2 3
{** 	
return++ 
_unitOfWork++ 
.++ 
SedeRepository++ -
.++- .

ExisteSede++. 8
(++8 9
property++9 A
)++A B
.++B C

GetAwaiter++C M
(++M N
)++N O
.++O P
	GetResult++P Y
(++Y Z
)++Z [
;++[ \
},, 	
}-- 
}.. ™
fC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Validator\FechaInputValidator.cs
	namespace 	
FxMalla
 
. 
	Validator 
{		 
public

 

class

 
FechaInputValidator

 $
:

% &
AbstractValidator

' 8
<

8 9

FechaInput

9 C
>

C D
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
public 
FechaInputValidator "
(" #
IConfiguration# 1
config2 8
)8 9
{ 	
_config 
= 
config 
; 
RuleFor 
( 
property 
=> 
property  (
.( )
FechaInicio) 4
)4 5
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' R
)R S
. 
Matches 
( 
_config  
[  !
$str! 8
]8 9
)9 :
.: ;
WithMessage; F
(F G
$str	G á
)
á à
. 
Must 
( 
( 
property 
,  
FechaInicio! ,
), -
=>. 0
ValidacionFecha1 @
(@ A
FechaInicioA L
)L M
)M N
.N O
WithMessageO Z
(Z [
$str	[ ´
)
´ ¨
;
¨ ≠
RuleFor 
( 
property 
=> 
property  (
.( )
FechaFin) 1
)1 2
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' R
)R S
. 
Matches 
( 
_config  
[  !
$str! 8
]8 9
)9 :
.: ;
WithMessage; F
(F G
$str	G á
)
á à
. 
Must 
( 
( 
property 
,  
FechaFin! )
)) *
=>+ -
ValidacionFecha. =
(= >
FechaFin> F
)F G
)G H
.H I
WithMessageI T
(T U
$str	U •
)
• ¶
. 
Must 
( 
( 
property 
,  
FechaFin! )
)) *
=>+ -

FechaMayor. 8
(8 9
property9 A
)A B
)B C
.C D
WithMessageD O
(O P
$str	P Ç
)
Ç É
;
É Ñ
} 	
private!! 
static!! 
bool!! 
ValidacionFecha!! +
(!!+ ,
string!!, 2
fecha!!3 8
)!!8 9
{"" 	
return## 

TimeHelper## 
.## 
ValidacionFecha## -
(##- .
fecha##. 3
)##3 4
;##4 5
}$$ 	
private%% 
static%% 
bool%% 

FechaMayor%% &
(%%& '

FechaInput%%' 1
property%%2 :
)%%: ;
{&& 	
if'' 
('' 

TimeHelper'' 
.'' 
ConvertirFecha'' )
('') *
property''* 2
.''2 3
FechaInicio''3 >
)''> ?
<=''@ B

TimeHelper''C M
.''M N
ConvertirFecha''N \
(''\ ]
property''] e
.''e f
FechaFin''f n
)''n o
)''o p
return(( 
true(( 
;(( 
return)) 
false)) 
;)) 
}** 	
}++ 
},, ¥I
fC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Validator\MallaInputValidator.cs
	namespace 	
FxMalla
 
. 
	Validator 
{ 
public 

class 
MallaInputValidator $
:% &
AbstractValidator' 8
<8 9

MallaInput9 C
>C D
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
readonly 
IConfiguration &
_config' .
;. /
public 
MallaInputValidator "
(" #
IUnitOfWork# .

unitOfWork/ 9
,9 :
IConfiguration; I
configJ P
)P Q
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_config 
= 
config 
; 
RuleFor 
( 
property 
=> 
property  (
.( )
FechaInicio) 4
)4 5
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
.   
Matches   
(   
_config    
[    !
$str  ! 8
]  8 9
)  9 :
.  : ;
WithMessage  ; F
(  F G
$str	  G á
)
  á à
.!! 
Must!! 
(!! 
(!! 
property!! 
,!!  
FechaInicio!!! ,
)!!, -
=>!!. 0
ValidacionFecha!!1 @
(!!@ A
FechaInicio!!A L
)!!L M
)!!M N
.!!N O
WithMessage!!O Z
(!!Z [
$str	!![ ´
)
!!´ ¨
;
!!¨ ≠
RuleFor## 
(## 
property## 
=>## 
property##  (
.##( )
FechaFin##) 1
)##1 2
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
.&& 
Matches&& 
(&& 
_config&&  
[&&  !
$str&&! 8
]&&8 9
)&&9 :
.&&: ;
WithMessage&&; F
(&&F G
$str	&&G á
)
&&á à
.'' 
Must'' 
('' 
('' 
property'' 
,''  
FechaFin''! )
)'') *
=>''+ -
ValidacionFecha''. =
(''= >
FechaFin''> F
)''F G
)''G H
.''H I
WithMessage''I T
(''T U
$str	''U •
)
''• ¶
.(( 
Must(( 
((( 
((( 
property(( 
,((  
FechaFin((! )
)(() *
=>((+ -
VerificarBD((. 9
(((9 :
property((: B
)((B C
)((C D
.((D E
WithMessage((E P
(((P Q
$str	((Q ¬
)
((¬ √
.)) 
Must)) 
()) 
()) 
property)) 
,))  
FechaFin))! )
)))) *
=>))+ -

FechaMayor)). 8
())8 9
property))9 A
)))A B
)))B C
.))C D
WithMessage))D O
())O P
$str	))P Ç
)
))Ç É
;
))É Ñ
RuleFor++ 
(++ 
property++ 
=>++ 
property++  (
.++( )
IdSede++) /
)++/ 0
.,, 
NotEmpty,, 
(,, 
),, 
.-- 
NotNull-- 
(-- 
)-- 
.-- 
WithMessage-- &
(--& '
$str--' R
)--R S
... 
Must.. 
(.. 
(.. 
property.. 
,..  
IdSede..! '
)..' (
=>..) +
VerificarSede.., 9
(..9 :
property..: B
)..B C
)..C D
...D E
WithMessage..E P
(..P Q
$str	..Q µ
)
..µ ∂
.// 
Must// 
(// 
(// 
property// 
,//  
IdSede//! '
)//' (
=>//) +
VerificarSubSede//, <
(//< =
property//= E
)//E F
)//F G
.//G H
WithMessage//H S
(//S T
$str	//T ù
)
//ù û
;
//û ü
}00 	
private22 
bool22 
VerificarSubSede22 %
(22% &

MallaInput22& 0
property221 9
)229 :
{33 	
return44 
_unitOfWork44 
.44 
SedeRepository44 -
.44- .
PoseeSubSedes44. ;
(44; <
property44< D
.44D E
IdSede44E K
)44K L
.44L M

GetAwaiter44M W
(44W X
)44X Y
.44Y Z
	GetResult44Z c
(44c d
)44d e
;44e f
}55 	
private77 
bool77 
VerificarSede77 "
(77" #

MallaInput77# -
property77. 6
)776 7
{88 	
return99 
_unitOfWork99 
.99 
SedeRepository99 -
.99- .

ExisteSede99. 8
(998 9
property999 A
.99A B
IdSede99B H
)99H I
.99I J

GetAwaiter99J T
(99T U
)99U V
.99V W
	GetResult99W `
(99` a
)99a b
;99b c
}:: 	
private<< 
static<< 
bool<< 
ValidacionFecha<< +
(<<+ ,
string<<, 2
fecha<<3 8
)<<8 9
{== 	
return>> 

TimeHelper>> 
.>> 
ValidacionFecha>> -
(>>- .
fecha>>. 3
)>>3 4
;>>4 5
}?? 	
privateAA 
staticAA 
boolAA 

FechaMayorAA &
(AA& '

MallaInputAA' 1
propertyAA2 :
)AA: ;
{BB 	
ifCC 
(CC 

TimeHelperCC 
.CC 
ConvertirFechaCC )
(CC) *
propertyCC* 2
.CC2 3
FechaInicioCC3 >
)CC> ?
<=CC@ B

TimeHelperCCC M
.CCM N
ConvertirFechaCCN \
(CC\ ]
propertyCC] e
.CCe f
FechaFinCCf n
)CCn o
)CCo p
returnDD 
trueDD 
;DD 
returnEE 
falseEE 
;EE 
}FF 	
privateHH 
boolHH 
VerificarBDHH  
(HH  !

MallaInputHH! +
propertyHH, 4
)HH4 5
{II 	
ListJJ 
<JJ 
boolJJ 
>JJ 
resultJJ 
=JJ 
newJJ  #
(JJ# $
)JJ$ %
{JJ& '
}JJ( )
;JJ) *
ListKK 
<KK 
MallaDtoKK 
>KK 
dataKK 
=KK  !
_unitOfWorkKK" -
.KK- .
MallaRepositoryKK. =
.KK= >
ValidarMallaKK> J
(KKJ K
propertyKKK S
.KKS T
IdSedeKKT Z
)KKZ [
.KK[ \

GetAwaiterKK\ f
(KKf g
)KKg h
.KKh i
	GetResultKKi r
(KKr s
)KKs t
;KKt u
DateTimeLL 
inputInicioLL  
=LL! "

TimeHelperLL# -
.LL- .
ConvertirFechaLL. <
(LL< =
propertyLL= E
.LLE F
FechaInicioLLF Q
)LLQ R
;LLR S
DateTimeMM 
inputFinMM 
=MM 

TimeHelperMM  *
.MM* +
ConvertirFechaMM+ 9
(MM9 :
propertyMM: B
.MMB C
FechaFinMMC K
)MMK L
;MML M
ifNN 
(NN 
dataNN 
!=NN 
nullNN 
)NN 
{OO 
foreachPP 
(PP 
varPP 
fechaPP "
inPP# %
dataPP& *
)PP* +
{QQ 
DateTimeRR 
fechIniRR $
=RR% &

TimeHelperRR' 1
.RR1 2
ConvertirFechaRR2 @
(RR@ A
fechaRRA F
.RRF G
FechaInicioRRG R
)RRR S
;RRS T
DateTimeSS 
fechFinSS $
=SS% &

TimeHelperSS' 1
.SS1 2
ConvertirFechaSS2 @
(SS@ A
fechaSSA F
.SSF G
FechaFinSSG O
)SSO P
;SSP Q
resultTT 
.TT 
AddTT 
(TT 
inputInicioTT *
>=TT+ -
fechIniTT. 5
&&TT6 8
inputInicioTT9 D
<=TTE G
fechFinTTH O
||TTP R
inputFinTTS [
>=TT\ ^
fechIniTT_ f
&&TTg i
inputFinTTj r
<=TTs u
fechFinTTv }
)TT} ~
;TT~ 
}UU 
returnWW 
!WW 
resultWW 
.WW 
ContainsWW '
(WW' (
trueWW( ,
)WW, -
;WW- .
}XX 
elseYY 
{ZZ 
return[[ 
true[[ 
;[[ 
}\\ 
}]] 	
}^^ 
}__ ‘$
cC:\Users\pc\source\repos\TRANSVERSALES\BCK_AGENDAMIENTO_MALLA\FxMalla\Validator\TiemposValidator.cs
	namespace

 	
FxMalla


 
.

 
	Validator

 
{ 
public 

class 
TiemposValidator !
:" #
AbstractValidator$ 5
<5 6
Tuple6 ;
<; <
string< B
,B C
stringD J
,J K
stringL R
>R S
>S T
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
readonly 
IConfiguration &
_config' .
;. /
public 
TiemposValidator 
(  
IUnitOfWork  +

unitOfWork, 6
,6 7
IConfiguration8 F
configG M
)M N
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_config 
= 
config 
; 
RuleFor 
( 
property 
=> 
property  (
.( )
Item1) .
). /
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage %
(% &
$str& S
)S T
. 
Must 
( 
property 
=>  

ExisteSede! +
(+ ,
property, 4
)4 5
)5 6
.6 7
WithMessage7 B
(B C
$strC x
)x y
;y z
RuleFor 
( 
property 
=> 
property  (
.( )
Item2) .
). /
.   
NotEmpty   
(   
)   
.!! 
NotNull!! 
(!! 
)!! 
.!! 
WithMessage!! $
(!!$ %
$str!!% T
)!!T U
."" 
Must"" 
("" 
property"" 
=>"" 
ExisteServicio""  .
("". /
property""/ 7
)""7 8
)""8 9
.""9 :
WithMessage"": E
(""E F
$str""F 
)	"" Ä
;
""Ä Å
RuleFor$$ 
($$ 
property$$ 
=>$$ 
property$$  (
.$$( )
Item3$$) .
)$$. /
.%% 
NotEmpty%% 
(%% 
)%% 
.&& 
NotNull&& 
(&& 
)&& 
.&& 
WithMessage&& $
(&&$ %
$str&&% V
)&&V W
.'' 
Matches'' 
('' 
_config'' 
['' 
$str'' 6
]''6 7
)''7 8
.''8 9
WithMessage''9 D
(''D E
$str	''E é
)
''é è
.(( 
Must(( 
((( 
((( 
property(( 
,(( 
Fecha(( $
)(($ %
=>((& (
ValidacionFecha(() 8
(((8 9
Fecha((9 >
)((> ?
)((? @
.((@ A
WithMessage((A L
(((L M
$str	((M °
)
((° ¢
;
((¢ £
})) 	
private++ 
bool++ 
ExisteServicio++ #
(++# $
string++$ *
property+++ 3
)++3 4
{,, 	
return-- 
_unitOfWork-- 
.-- 
ServicioRepository-- 1
.--1 2
ExisteServicio--2 @
(--@ A
property--A I
)--I J
.--J K

GetAwaiter--K U
(--U V
)--V W
.--W X
	GetResult--X a
(--a b
)--b c
;--c d
}.. 	
private00 
bool00 

ExisteSede00 
(00  
string00  &
property00' /
)00/ 0
{11 	
return22 
_unitOfWork22 
.22 
SedeRepository22 -
.22- .

ExisteSede22. 8
(228 9
property229 A
)22A B
.22B C

GetAwaiter22C M
(22M N
)22N O
.22O P
	GetResult22P Y
(22Y Z
)22Z [
;22[ \
}33 	
private55 
static55 
bool55 
ValidacionFecha55 +
(55+ ,
string55, 2
fecha553 8
)558 9
{66 	
return77 

TimeHelper77 
.77 
ValidacionFecha77 -
(77- .
fecha77. 3
)773 4
;774 5
}88 	
}99 
}:: 