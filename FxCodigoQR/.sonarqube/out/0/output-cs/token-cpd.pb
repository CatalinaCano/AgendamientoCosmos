Å
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\DataContext\UnitOfWork.cs
	namespace		 	

FxCodigoQR		
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
ITramiteRepository "
_tramiteRepository# 5
;5 6
private 
ICodigoQRRepository #
_codigoQRRepository$ 7
;7 8
private 
bool 
	_disposed 
=  
false! &
;& '
public 

UnitOfWork 
( 
IConfiguration (
configuration) 6
,6 7
CosmosClient8 D
clientE K
)K L
{ 	
_configuration 
= 
configuration *
;* +
_client 
= 
client 
; 
} 	
public 
ITramiteRepository !
TramiteRepository" 3
{ 	
get 
{ 
return 
_tramiteRepository +
??=, /
new0 3
TramiteRepository4 E
(E F
_clientF M
,M N
_configurationO ]
)] ^
;^ _
}` a
} 	
public   
ICodigoQRRepository   "
CodigoQRRepository  # 5
{!! 	
get"" 
{"" 
return"" 
_codigoQRRepository"" ,
??=""- 0
new""1 4
CodigoQRRepository""5 G
(""G H
_client""H O
,""O P
_configuration""Q _
)""_ `
;""` a
}""b c
}## 	
	protected%% 
virtual%% 
void%% 
Dispose%% &
(%%& '
bool%%' +
	disposing%%, 5
)%%5 6
{&& 	
if'' 
('' 
!'' 
	_disposed'' 
&&'' 
!'' 
	disposing'' (
)''( )
{(( 
_client)) 
.)) 
Dispose)) 
())  
)))  !
;))! "
}** 
	_disposed++ 
=++ 
true++ 
;++ 
},, 	
public.. 
void.. 
Dispose.. 
(.. 
).. 
{// 	
Dispose00 
(00 
true00 
)00 
;00 
GC11 
.11 
SuppressFinalize11 
(11  
this11  $
)11$ %
;11% &
}22 	
~44 	

UnitOfWork44	 
(44 
)44 
{55 	
Dispose66 
(66 
false66 
)66 
;66 
}77 	
}88 
}99 üD
dC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\FxActivarCodigo.cs
	namespace 	

FxCodigoQR
 
{ 
public 

class 
FxActivarCodigo  
{ 
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
FxActivarCodigo 
( 
IUnitOfWork *

unitOfWork+ 5
,5 6
IConfiguration7 E
configurationF S
)S T
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_configuration 
= 
configuration *
;* +
}   	
["" 	
FunctionName""	 
("" 
nameof"" 
("" 
ActivarCodigoQR"" ,
)"", -
)""- .
]"". /
[## 	
FixedDelayRetry##	 
(## 
$num## 
,## 
$str## &
)##& '
]##' (
[$$ 	
OpenApiOperation$$	 
($$ 
operationId$$ %
:$$% &
$str$$' 8
,$$8 9
tags$$: >
:$$> ?
new$$@ C
[$$C D
]$$D E
{$$F G
$str$$H [
}$$\ ]
,$$] ^
Description$$_ j
=$$k l
$str	$$m ì
,
$$ì î
Summary
$$ï ú
=
$$ù û
$str
$$ü ≈
)
$$≈ ∆
]
$$∆ «
[%% 	
OpenApiSecurity%%	 
(%% 
$str%% '
,%%' (
SecuritySchemeType%%) ;
.%%; <
ApiKey%%< B
,%%B C
Name%%D H
=%%I J
$str%%K Q
,%%Q R
In%%S U
=%%V W'
OpenApiSecurityLocationType%%X s
.%%s t
Query%%t y
)%%y z
]%%z {
[&& 	#
OpenApiResponseWithBody&&	  
(&&  !

statusCode&&! +
:&&+ ,
HttpStatusCode&&- ;
.&&; <
OK&&< >
,&&> ?
contentType&&@ K
:&&K L
$str&&M _
,&&_ `
bodyType&&a i
:&&i j
typeof&&k q
(&&q r
QRDto&&r w
)&&w x
,&&x y
Description	&&z Ö
=
&&Ü á
$str
&&à ô
)
&&ô ö
]
&&ö õ
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
>((' (
ActivarCodigoQR(() 8
(((8 9
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
$str))E a
)))a b
]))b c
HttpRequest))d o
req))p s
,))s t
string))u {
id))| ~
)))~ 
{** 	
try++ 
{,, 
CodigoQRDto-- 
data--  
=--! "
await--# (
_unitOfWork--) 4
.--4 5
CodigoQRRepository--5 G
.--G H
ObtenerTramite--H V
(--V W
id--W Y
)--Y Z
;--Z [
if// 
(// 
data// 
!=// 
null//  
)//  !
{00 
DateTime11 
fechaActivacion11 ,
=11- .
new11/ 2
(112 3
data113 7
.117 8
TiempoActivacion118 H
)11H I
;11I J
DateTime22 
fechaCaducidad22 +
=22, -
new22. 1
(221 2
data222 6
.226 7
TiempoCaducidad227 F
)22F G
;22G H
DateTime33 
hoy33  
=33! "

TimeHelper33# -
.33- .
ObtenerFechaHoy33. =
(33= >
)33> ?
;33? @
string44 
nombreEstado44 '
=44( )
_configuration44* 8
[448 9
$str449 K
]44K L
;44L M
	EstadoDto55 
resultEstado55 *
=55+ ,
await55- 2
_unitOfWork553 >
.55> ?
TramiteRepository55? P
.55P Q
ValidarEstado55Q ^
(55^ _
data55_ c
.55c d
	IdUsuario55d m
,55m n
data55o s
.55s t
	IdTramite55t }
,55} ~
nombreEstado	55 ã
)
55ã å
;
55å ç
if77 
(77 
hoy77 
>=77 
fechaActivacion77 .
&&77/ 1
hoy772 5
<=776 8
fechaCaducidad779 G
&&77H J
!77K L
resultEstado77L X
.77X Y
estado77Y _
)77_ `
{88 
Estado99 
estado99 %
=99& '
new99( +
Estado99, 2
(992 3
)993 4
{:: 
NombreEstado;; (
=;;) *
nombreEstado;;+ 7
,;;7 8
FechaEstado<< '
=<<( )
DateTime<<* 2
.<<2 3
UtcNow<<3 9
}== 
;== 
string>> 
result>> %
=>>& '
await>>( -
_unitOfWork>>. 9
.>>9 :
TramiteRepository>>: K
.>>K L
AgregarEstado>>L Y
(>>Y Z
data>>Z ^
.>>^ _
	IdUsuario>>_ h
,>>h i
data>>j n
.>>n o
	IdTramite>>o x
,>>x y
estado	>>z Ä
)
>>Ä Å
;
>>Å Ç
return?? 
result?? %
.??% &
Equals??& ,
(??, -
$str??- 1
)??1 2
???3 4
HttpResponseHelper??5 G
.??G H
Response??H P
(??P Q
StatusCodes??Q \
.??\ ]
Status201Created??] m
,??m n
new@@H K
ResponseResult@@L Z
(@@Z [
)@@[ \
{AAH I
IsErrorBBL S
=BBT U
falseBBV [
,BB[ \
MessageCCL S
=CCT U
$strCCV t
}DDH I
)DDI J
:DDK L
HttpResponseHelperDDM _
.DD_ `
ResponseDD` h
(DDh i
StatusCodesDDi t
.DDt u
Status409Conflict	DDu Ü
,
DDÜ á
newEEH K
ResponseResultEEL Z
(EEZ [
)EE[ \
{FFH I
IsErrorGGL S
=GGT U
trueGGV Z
,GGZ [
MessageHHL S
=HHT U
$str	HHV Ü
}IIH I
)III J
;IIJ K
}JJ 
elseKK 
{LL 
returnMM 
HttpResponseHelperMM 1
.MM1 2
ResponseMM2 :
(MM: ;
StatusCodesMM; F
.MMF G
Status409ConflictMMG X
,MMX Y
newNN: =
ResponseResultNN> L
(NNL M
)NNM N
{OO: ;
IsErrorPP> E
=PPF G
truePPH L
,PPL M
MessageQQ> E
=QQF G
$str	QQH ú
}RR: ;
)RR; <
;RR< =
}SS 
}TT 
elseUU 
{VV 
returnWW 
HttpResponseHelperWW -
.WW- .
ResponseWW. 6
(WW6 7
StatusCodesWW7 B
.WWB C
Status404NotFoundWWC T
,WWT U
newXX8 ;
ResponseResultXX< J
(XXJ K
)XXK L
{YY8 9
IsErrorZZ< C
=ZZD E
trueZZF J
,ZZJ K
Message[[< C
=[[D E
$str	[[F ê
}\\8 9
)\\9 :
;\\: ;
}]] 
}^^ 
catch__ 
(__ 
	Exception__ 
ex__ 
)__  
{`` 
returnaa 
HttpResponseHelperaa )
.aa) *
Responseaa* 2
(aa2 3
StatusCodesaa3 >
.aa> ?(
Status500InternalServerErroraa? [
,aa[ \
newbb4 7
ResponseResultbb8 F
(bbF G
)bbG H
{cc4 5
IsErrordd8 ?
=dd@ A
trueddB F
,ddF G
Messageee8 ?
=ee@ A
exeeB D
.eeD E
MessageeeE L
}ff4 5
)ff5 6
;ff6 7
}gg 
}hh 	
}ii 
}jj ™_
_C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\FxCodigoQR.cs
	namespace 	

FxCodigoQR
 
{ 
public 

class 

FxCodigoQR 
{   
public!! 
readonly!! 
IConfiguration!! &
_configuration!!' 5
;!!5 6
private## 
readonly## 
	IGeneraQR## "
	_generaQR### ,
;##, -
private$$ 
readonly$$ 

IValidator$$ #
<$$# $
	DataInput$$$ -
>$$- .

_validator$$/ 9
;$$9 :
private%% 
readonly%% 
IMapper%%  
_mapper%%! (
;%%( )
private&& 
readonly&& 
IUnitOfWork&& $
_unitOfWork&&% 0
;&&0 1
public(( 

FxCodigoQR(( 
((( 
	IGeneraQR(( #
generaQR(($ ,
,((, -

IValidator((. 8
<((8 9
	DataInput((9 B
>((B C
	validator((D M
,((M N
IMapper((O V
mapper((W ]
,((] ^
IUnitOfWork((_ j

unitOfWork((k u
,((u v
IConfiguration	((w Ö
configuration
((Ü ì
)
((ì î
{)) 	
	_generaQR** 
=** 
generaQR**  
;**  !

_validator++ 
=++ 
	validator++ "
;++" #
_mapper,, 
=,, 
mapper,, 
;,, 
_unitOfWork-- 
=-- 

unitOfWork-- $
;--$ %
_configuration.. 
=.. 
configuration.. *
;..* +
}// 	
[11 	
FunctionName11	 
(11 
nameof11 
(11 
GeneraCodigoQR11 +
)11+ ,
)11, -
]11- .
[22 	
FixedDelayRetry22	 
(22 
$num22 
,22 
$str22 &
)22& '
]22' (
[33 	
OpenApiOperation33	 
(33 
operationId33 %
:33% &
$str33' 7
,337 8
tags339 =
:33= >
new33? B
[33B C
]33C D
{33E F
$str33G ]
}33^ _
,33_ `
Description33a l
=33m n
$str	33o í
,
33í ì
Summary
33î õ
=
33ú ù
$str
33û ¡
)
33¡ ¬
]
33¬ √
[44 	
OpenApiSecurity44	 
(44 
$str44 '
,44' (
SecuritySchemeType44) ;
.44; <
ApiKey44< B
,44B C
Name44D H
=44I J
$str44K Q
,44Q R
In44S U
=44V W'
OpenApiSecurityLocationType44X s
.44s t
Query44t y
)44y z
]44z {
[55 	
OpenApiRequestBody55	 
(55 
contentType55 '
:55' (
$str55) ;
,55; <
bodyType55= E
:55E F
typeof55G M
(55M N
	DataInput55N W
)55W X
,55X Y
Required55Z b
=55c d
true55e i
,55i j
Description55k v
=55w x
$str	55y ç
)
55ç é
]
55é è
[66 	#
OpenApiResponseWithBody66	  
(66  !

statusCode66! +
:66+ ,
HttpStatusCode66- ;
.66; <
OK66< >
,66> ?
contentType66@ K
:66K L
$str66M _
,66_ `
bodyType66a i
:66i j
typeof66k q
(66q r
QRDto66r w
)66w x
,66x y
Description	66z Ö
=
66Ü á
$str
66à ô
)
66ô ö
]
66ö õ
[77 	#
OpenApiResponseWithBody77	  
(77  !

statusCode77! +
:77+ ,
HttpStatusCode77- ;
.77; <
Created77< C
,77C D
contentType77E P
:77P Q
$str77R d
,77d e
bodyType77f n
:77n o
typeof77p v
(77v w
ResponseResult	77w Ö
)
77Ö Ü
,
77Ü á
Description
77à ì
=
77î ï
$str
77ñ ≠
)
77≠ Æ
]
77Æ Ø
[88 	#
OpenApiResponseWithBody88	  
(88  !

statusCode88! +
:88+ ,
HttpStatusCode88- ;
.88; <
InternalServerError88< O
,88O P
contentType88Q \
:88\ ]
$str88^ p
,88p q
bodyType88r z
:88z {
typeof	88| Ç
(
88Ç É
ResponseResult
88É ë
)
88ë í
,
88í ì
Description
88î ü
=
88† °
$str
88¢ ∏
)
88∏ π
]
88π ∫
public99 
async99 
Task99 
<99 
IActionResult99 '
>99' (
GeneraCodigoQR99) 7
(997 8
[:: 
HttpTrigger:: 
(:: 
AuthorizationLevel:: +
.::+ ,
Function::, 4
,::4 5
$str::6 <
,::< =
Route::> C
=::D E
$str::F U
)::U V
]::V W
HttpRequest::X c
req::d g
)::g h
{;; 	
try<< 
{== 
var>> 
json>> 
=>> 
await>>  
req>>! $
.>>$ %
ReadAsStringAsync>>% 6
(>>6 7
)>>7 8
;>>8 9
	DataInput?? 
request?? !
=??" #
JsonConvert??$ /
.??/ 0
DeserializeObject??0 A
<??A B
	DataInput??B K
>??K L
(??L M
json??M Q
)??Q R
;??R S
varAA 
validationResultAA $
=AA% &

_validatorAA' 1
.AA1 2
ValidateAA2 :
(AA: ;
requestAA; B
)AAB C
;AAC D
ifBB 
(BB 
validationResultBB $
.BB$ %
IsValidBB% ,
)BB, -
{CC 
CitasDtoDD 
citaDD !
=DD" #
awaitDD$ )
_unitOfWorkDD* 5
.DD5 6
TramiteRepositoryDD6 G
.DDG H
ObtenerCitaDDH S
(DDS T
requestDDT [
.DD[ \
	IdUsuarioDD\ e
,DDe f
requestDDg n
.DDn o
	IdTramiteDDo x
)DDx y
;DDy z
CodigoQREE 
dataEE !
=EE" #
_mapperEE$ +
.EE+ ,
MapEE, /
<EE/ 0
CodigoQREE0 8
>EE8 9
(EE9 :
requestEE: A
)EEA B
;EEB C
dataFF 
.FF 
TiempoActivacionFF )
=FF* +#
ObtenerTiempoActivacionFF, C
(FFC D
citaFFD H
)FFH I
;FFI J
dataGG 
.GG 
TiempoCaducidadGG (
=GG) *"
ObtenerTiempoCaducidadGG+ A
(GGA B
citaGGB F
)GGF G
;GGG H
stringII 
resultII !
=II" #
awaitII$ )
_unitOfWorkII* 5
.II5 6
CodigoQRRepositoryII6 H
.IIH I
InsertarSolictudIII Y
(IIY Z
dataIIZ ^
)II^ _
;II_ `
ifKK 
(KK 
resultKK 
.KK 
EqualsKK %
(KK% &
$strKK& *
)KK* +
)KK+ ,
{LL 
QRDtoMM 

dataResultMM (
=MM) *
newMM+ .
(MM. /
)MM/ 0
{NN 
qrbase64OO $
=OO% &
	_generaQROO' 0
.OO0 1
construyeQROO1 <
(OO< =
requestOO= D
.OOD E
DataOOE I
)OOI J
}PP 
;PP 
returnQQ 
HttpResponseHelperQQ 1
.QQ1 2"
SuccessfulObjectResultQQ2 H
(QQH I

dataResultQQI S
)QQS T
;QQT U
}RR 
elseSS 
{TT 
returnUU 
HttpResponseHelperUU 1
.UU1 2
ResponseUU2 :
(UU: ;
StatusCodesUU; F
.UUF G
Status409ConflictUUG X
,UUX Y
newUUZ ]
ResponseResultUU^ l
(UUl m
)UUm n
{VV 
IsErrorWW #
=WW$ %
trueWW& *
,WW* +
MessageXX #
=XX$ %
$strXX& b
}YY 
)YY 
;YY 
}ZZ 
}[[ 
else\\ 
{]] 
return^^ 
HttpResponseHelper^^ -
.^^- .
Response^^. 6
(^^6 7
StatusCodes^^7 B
.^^B C
Status400BadRequest^^C V
,^^V W
new^^X [
ResponseResult^^\ j
(^^j k
)^^k l
{__ 
IsError`` 
=``  !
true``" &
,``& '
Messageaa 
=aa  !
validationResultaa" 2
.aa2 3
Errorsaa3 9
.aa9 :
Firstaa: ?
(aa? @
)aa@ A
.aaA B
ErrorMessageaaB N
}bb 
)bb 
;bb 
}cc 
}dd 
catchee 
(ee 
	Exceptionee 
exee 
)ee  
{ff 
returngg 
HttpResponseHelpergg )
.gg) *
Responsegg* 2
(gg2 3
StatusCodesgg3 >
.gg> ?(
Status500InternalServerErrorgg? [
,gg[ \
newgg] `
ResponseResultgga o
(ggo p
)ggp q
{ggr s
IsErrorggt {
=gg| }
true	gg~ Ç
,
ggÇ É
Message
ggÑ ã
=
ggå ç
ex
ggé ê
.
ggê ë
Message
ggë ò
}
ggô ö
)
ggö õ
;
ggõ ú
}hh 
}ii 	
privatekk 
longkk #
ObtenerTiempoActivacionkk ,
(kk, -
CitasDtokk- 5
citakk6 :
)kk: ;
{ll 	
intmm 
tiempoVigenciamm 
=mm  
_configurationmm! /
.mm/ 0
GetValuemm0 8
<mm8 9
intmm9 <
>mm< =
(mm= >
$strmm> Y
)mmY Z
;mmZ [
DateTimenn 
horaActivacionnn #
=nn$ %

TimeHelpernn& 0
.nn0 1
ConevrtirHorann1 >
(nn> ?
citann? C
.nnC D
HoraAgendamientonnD T
)nnT U
.nnU V

AddMinutesnnV `
(nn` a
-nna b
tiempoVigenciannb p
)nnp q
;nnq r
returnoo 

TimeHelperoo 
.oo 
ObtenerFechaConHoraoo 1
(oo1 2
citaoo2 6
.oo6 7
FechaAgendamientooo7 H
,ooH I
horaActivacionooJ X
.ooX Y
HourooY ]
,oo] ^
horaActivacionoo_ m
.oom n
Minuteoon t
)oot u
.oou v
Ticksoov {
;oo{ |
}pp 	
privaterr 
longrr "
ObtenerTiempoCaducidadrr +
(rr+ ,
CitasDtorr, 4
citarr5 9
)rr9 :
{ss 	
inttt 
tiempoVigenciatt 
=tt  
_configurationtt! /
.tt/ 0
GetValuett0 8
<tt8 9
inttt9 <
>tt< =
(tt= >
$strtt> Y
)ttY Z
;ttZ [
intuu 
totaluu 
=uu 
Convertuu 
.uu  
ToInt32uu  '
(uu' (
citauu( ,
.uu, -
DuracionServiciouu- =
+uu> ?
tiempoVigenciauu@ N
)uuN O
;uuO P
DateTimevv 
horaExpiracionvv #
=vv$ %

TimeHelpervv& 0
.vv0 1
ConevrtirHoravv1 >
(vv> ?
citavv? C
.vvC D
HoraAgendamientovvD T
)vvT U
.vvU V

AddMinutesvvV `
(vv` a
totalvva f
)vvf g
;vvg h
returnww 

TimeHelperww 
.ww 
ObtenerFechaConHoraww 1
(ww1 2
citaww2 6
.ww6 7
FechaAgendamientoww7 H
,wwH I
horaExpiracionwwJ X
.wwX Y
HourwwY ]
,ww] ^
horaExpiracionww_ m
.wwm n
Minutewwn t
)wwt u
.wwu v
Tickswwv {
;ww{ |
}xx 	
}yy 
}zz –
iC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Interfaces\IGeneraQR.cs
	namespace 	

FxCodigoQR
 
. 

Interfaces 
{ 
public 

	interface 
	IGeneraQR 
{ 
Image 
construyeQR 
( 
int 
barWidth &
,& '
int( +

leftMargin, 6
,6 7
int8 ;
rigthMargin< G
,G H
intI L
	topMarginM V
,V W
intX [
bottomMargin\ h
,h i
stringj p
dataq u
)u v
;v w
string		 
construyeQR		 
(		 
string		 !
data		" &
)		& '
;		' (
}

 
} ©
ÑC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Interfaces\RepositoryPattern\CodigoQRRepository.cs
	namespace 	

FxCodigoQR
 
. 

Interfaces 
.  
RepositoryPattern  1
{ 
public 

	interface 
ICodigoQRRepository (
{		 
public

 
Task

 
<

 
string

 
>

 
InsertarSolictud

 ,
(

, -
CodigoQR

- 5
data

6 :
)

: ;
;

; <
public 
Task 
< 
CodigoQRDto 
>  
ObtenerTramite! /
(/ 0
string0 6
	idTramite7 @
)@ A
;A B
} 
} â

ÑC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Interfaces\RepositoryPattern\ITramiteRepository.cs
	namespace 	

FxCodigoQR
 
. 

Interfaces 
.  
RepositoryPattern  1
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
 
CitasDto

 
>

 
ObtenerCita

 )
(

) *
string

* 0
	idUsuario

1 :
,

: ;
string

< B
idCita

C I
)

I J
;

J K
public 
Task 
< 
string 
> 
AgregarEstado )
() *
string* 0
	idUsuario1 :
,: ;
string< B
	idTramiteC L
,L M
EstadoN T
estadoU [
)[ \
;\ ]
public 
Task 
< 
	EstadoDto 
> 
ValidarEstado ,
(, -
string- 3
	idUsuario4 =
,= >
string? E
	idTramiteF O
,O P
stringQ W
estadoX ^
)^ _
;_ `
} 
} °
}C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Interfaces\RepositoryPattern\IUnitOfWork.cs
	namespace 	

FxCodigoQR
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
ITramiteRepository 
TramiteRepository ,
{- .
get/ 2
;2 3
}4 5
ICodigoQRRepository 
CodigoQRRepository .
{/ 0
get1 4
;4 5
}6 7
}		 
}

 ¨
qC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Mappers\MappingProfileCodigo.cs
	namespace		 	

FxCodigoQR		
 
.		 
Mappers		 
{

 
public 

class  
MappingProfileCodigo %
:& '
Profile( /
{ 
public  
MappingProfileCodigo #
(# $
)$ %
{ 	
	CreateMap 
< 
	DataInput 
,  
CodigoQR! )
>) *
(* +
)+ ,
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
Id$ &
,& '
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
SecurityHelper/ =
.= >
SHA256Encrypt> K
(K L
srcL O
.O P
	IdTramiteP Y
.Y Z
TrimZ ^
(^ _
)_ `
)` a
)a b
)b c
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
	IdUsuario$ -
,- .
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
src/ 2
.2 3
	IdUsuario3 <
.< =
Trim= A
(A B
)B C
)C D
)D E
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
	IdTramite$ -
,- .
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
src/ 2
.2 3
	IdTramite3 <
.< =
Trim= A
(A B
)B C
)C D
)D E
. 
	ForMember 
( 
dest 
=>  
dest! %
.% &
Datos& +
,+ ,
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
src/ 2
.2 3
Data3 7
.7 8
Trim8 <
(< =
)= >
)> ?
)? @
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
FechaCreacion$ 1
,1 2
opt 
=> 
opt 
.  
MapFrom  '
(' (
src( +
=>, .
DateTime/ 7
.7 8
UtcNow8 >
)> ?
)? @
;@ A
} 	
} 
} ≠
xC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Models\DataTransferObjects\CitasDto.cs
	namespace 	

FxCodigoQR
 
. 
Models 
. 
DataTransferObjects /
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
}(( í
{C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Models\DataTransferObjects\CodigoQRDto.cs
	namespace 	

FxCodigoQR
 
. 
Models 
. 
DataTransferObjects /
{ 
public 

class 
CodigoQRDto 
{ 
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
public 
string 
	IdTramite 
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
 !
)

! "
]

" #
public 
string 
	IdUsuario 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str (
)( )
]) *
public 
long 
TiempoActivacion $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
JsonProperty	 
( 
$str '
)' (
]( )
public 
long 
TiempoCaducidad #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} º
yC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Models\DataTransferObjects\EstadoDto.cs
	namespace 	

FxCodigoQR
 
. 
Models 
. 
DataTransferObjects /
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
}		 Ó
uC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Models\DataTransferObjects\QRDto.cs
	namespace 	

FxCodigoQR
 
. 
Models 
. 
DataTransferObjects /
{ 
[		 
OpenApiExample		 
(		 
typeof		 
(		 
ResponseExample		 *
)		* +
)		+ ,
]		, -
public

 

class

 
QRDto

 
{ 
[ 	
JsonProperty	 
( 
$str  
)  !
]! "
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' E
,E F
NullableG O
=P Q
falseR W
)W X
]X Y
public 
string 
qrbase64 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ø/
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Models\Entities\Agenda.cs
	namespace 	

FxCodigoQR
 
. 
Models 
. 
Entities $
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
[99 	
JsonProperty99	 
(99 
$str99 "
,99" #
NullValueHandling99$ 5
=996 7
NullValueHandling998 I
.99I J
Ignore99J P
)99P Q
]99Q R
public:: 
string:: 
?:: 

IdCampania:: !
{::" #
get::$ '
;::' (
set::) ,
;::, -
}::. /
[<< 	
JsonProperty<<	 
(<< 
$str<<  
,<<  !
NullValueHandling<<" 3
=<<4 5
NullValueHandling<<6 G
.<<G H
Ignore<<H N
)<<N O
]<<O P
public== 
string== 
?== 
CodigoQr== 
{==  !
get==" %
;==% &
set==' *
;==* +
}==, -
}@@ 
publicBB 

partialBB 
classBB 
ServicioBB !
{CC 
[DD 	
JsonPropertyDD	 
(DD 
$strDD "
)DD" #
]DD# $
publicEE 
stringEE 

PkServicioEE  
{EE! "
getEE# &
;EE& '
setEE( +
;EE+ ,
}EE- .
[GG 	
JsonPropertyGG	 
(GG 
$strGG )
)GG) *
]GG* +
publicHH 
stringHH 
FechaAgendamientoHH '
{HH( )
getHH* -
;HH- .
setHH/ 2
;HH2 3
}HH4 5
[JJ 	
JsonPropertyJJ	 
(JJ 
$strJJ (
)JJ( )
]JJ) *
publicKK 
stringKK 
HoraAgendamientoKK &
{KK' (
getKK) ,
;KK, -
setKK. 1
;KK1 2
}KK3 4
[MM 	
JsonPropertyMM	 
(MM 
$strMM (
)MM( )
]MM) *
publicNN 
longNN 
DuracionServicioNN $
{NN% &
getNN' *
;NN* +
setNN, /
;NN/ 0
}NN1 2
}OO 
}PP Ü
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Models\Entities\CodigoQR.cs
	namespace 	

FxCodigoQR
 
. 
Models 
. 
Entities $
{ 
public 

class 
CodigoQR 
{ 
[		 	
JsonProperty			 
(		 
$str		 
)		 
]		 
public

 
string

 
Id

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
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
$str !
)! "
]" #
public 
string 
	IdTramite 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
) 
] 
public 
string 
Datos 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonProperty	 
( 
$str (
)( )
]) *
public 
long 
TiempoActivacion $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
JsonProperty	 
( 
$str '
)' (
]( )
public 
long 
TiempoCaducidad #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
JsonProperty	 
( 
$str %
)% &
]& '
public 
DateTimeOffset 
FechaCreacion +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} ï
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Models\Input\DataInput.cs
	namespace 	

FxCodigoQR
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
(		 
DataInputExample		 +
)		+ ,
)		, -
]		- .
public

 

class

 
	DataInput

 
{ 
[ 	
JsonProperty	 
( 
$str !
)! "
]" #
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' A
,A B
NullableC K
=L M
falseN S
)S T
]T U
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
$str !
)! "
]" #
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' H
,H I
NullableJ R
=S T
falseU Z
)Z [
][ \
public 
string 
	IdUsuario 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str 
) 
] 
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' `
,` a
Nullableb j
=k l
falsem r
)r s
]s t
public 
string 
Data 
{ 
get  
;  !
set" %
;% &
}' (
} 
} °
jC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Models\ResponseResult.cs
	namespace		 	

FxCodigoQR		
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
} “

mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\OpenApi\DataInputExample.cs
	namespace 	

FxCodigoQR
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
 
DataInputExample

 !
:

" #
OpenApiExample

$ 2
<

2 3
	DataInput

3 <
>

< =
{ 
public 
override 
IOpenApiExample '
<' (
	DataInput( 1
>1 2
Build3 8
(8 9
NamingStrategy9 G
namingStrategyH V
=W X
nullY ]
)] ^
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
$str (
,( )
new 
	DataInput !
(! "
)" #
{ 
	IdUsuario !
=" #
$str$ h
,h i
	IdTramite !
=" #
$str$ h
,h i
Data 
= 
$str	 ™
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
} π	
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\OpenApi\ResponseExample.cs
	namespace 	

FxCodigoQR
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
ResponseExample
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
1 2
QRDto

2 7
>

7 8
{ 
public 
override 
IOpenApiExample '
<' (
QRDto( -
>- .
Build/ 4
(4 5
NamingStrategy5 C
namingStrategyD R
=S T
nullU Y
)Y Z
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
new 
QRDto 
( 
) 
{ 
qrbase64  
=! "
$str# 8
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
} è
rC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\OpenApi\ResponseResultExample.cs
	namespace

 	

FxCodigoQR
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
} ≥(
tC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Repositories\CodigoQRRepository.cs
	namespace 	

FxCodigoQR
 
. 
Repositories !
{ 
public 

class 
CodigoQRRepository #
:$ %
RepositoryBase& 4
,4 5
ICodigoQRRepository6 I
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
CodigoQRRepository !
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
$str/ I
]I J
;J K
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
< 
string  
>  !
InsertarSolictud" 2
(2 3
CodigoQR3 ;
data< @
)@ A
{ 	
try 
{ 
ItemResponse 
< 
CodigoQR %
>% &
itemResponse' 3
=4 5
await6 ;
	container< E
.E F
ReadItemAsyncF S
<S T
CodigoQRT \
>\ ]
(] ^
data^ b
.b c
Idc e
,e f
newg j
PartitionKeyk w
(w x
datax |
.| }
Id} 
)	 Ä
)
Ä Å
;
Å Ç
return 
itemResponse #
==$ &
null' +
?, -
$str. 2
:3 4
$str5 <
;< =
}   
catch!! 
(!! 
CosmosException!! "
ex!!# %
)!!% &
when!!' +
(!!, -
ex!!- /
.!!/ 0

StatusCode!!0 :
==!!; =
HttpStatusCode!!> L
.!!L M
NotFound!!M U
)!!U V
{"" 
var## 
result## 
=## 
await## "
	container### ,
.##, -
CreateItemAsync##- <
(##< =
data##= A
,##A B
new##C F
PartitionKey##G S
(##S T
data##T X
.##X Y
Id##Y [
)##[ \
)##\ ]
;##] ^
if$$ 
($$ 
result$$ 
.$$ 

StatusCode$$ %
.$$% &
ToString$$& .
($$. /
)$$/ 0
is$$1 3
$str$$4 =
)$$= >
return%% 
$str%% 
;%%  
return&& 
$str&& 
;&& 
}'' 
}(( 	
public** 
async** 
Task** 
<** 
CodigoQRDto** %
>**% &
ObtenerTramite**' 5
(**5 6
string**6 <
	idTramite**= F
)**F G
{++ 	
CodigoQRDto,, 
data,, 
=,, 
null,, #
;,,# $
try-- 
{.. 
var// 
queryString// 
=//  !
$str/5" =
;55= >
var77 
queryDef77 
=77 
new77 "
QueryDefinition77# 2
(772 3
queryString773 >
)77> ?
;77? @
queryDef88 
.88 
WithParameter88 &
(88& '
$str88' 3
,883 4
	idTramite885 >
)88> ?
;88? @
var:: 
query:: 
=:: 
	container:: %
.::% & 
GetItemQueryIterator::& :
<::: ;
CodigoQRDto::; F
>::F G
(::G H
queryDef::H P
)::P Q
;::Q R
while;; 
(;; 
query;; 
.;; 
HasMoreResults;; +
);;+ ,
{<< 
var== 
response==  
===! "
await==# (
query==) .
.==. /
ReadNextAsync==/ <
(==< =
)=== >
;==> ?
data>> 
=>> 
response>> #
.>># $
SingleOrDefault>>$ 3
(>>3 4
)>>4 5
;>>5 6
}?? 
returnAA 
dataAA 
;AA 
}BB 
catchCC 
(CC 
CosmosExceptionCC "
exCC# %
)CC% &
whenCC' +
(CC, -
exCC- /
.CC/ 0

StatusCodeCC0 :
==CC; =
HttpStatusCodeCC> L
.CCL M
NotFoundCCM U
)CCU V
{DD 
returnEE 
dataEE 
;EE 
}FF 
}GG 	
}HH 
}II Ù
pC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Repositories\RepositoryBase.cs
	namespace 	

FxCodigoQR
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
} ˇI
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Repositories\TramiteRepository.cs
	namespace 	

FxCodigoQR
 
. 
Repositories !
{ 
public 

class 
TramiteRepository "
:# $
RepositoryBase% 3
,3 4
ITramiteRepository5 G
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
public 
TramiteRepository  
(  !
CosmosClient! -
client. 4
,4 5
IConfiguration6 D
configurationE R
)R S
:T U
baseV Z
(Z [
client[ a
)a b
{ 	
_configuration 
= 
configuration *
;* +
string 
containerId 
=  
_configuration! /
[/ 0
$str0 K
]K L
;L M
string 
databaseName 
=  !
_configuration" 0
[0 1
$str1 D
]D E
;E F
	container 
= 
client 
. 
GetContainer +
(+ ,
databaseName, 8
,8 9
containerId: E
)E F
;F G
} 	
public 
async 
Task 
< 
CitasDto "
>" #
ObtenerCita$ /
(/ 0
string0 6
	idUsuario7 @
,@ A
stringB H
idCitaI O
)O P
{ 	
CitasDto 
data 
= 
null  
;  !
try   
{!! 
var"" 
queryString"" 
=""  !
$@"""" %
$str"1% ;
"11; <
;11< =
var33 
queryDef33 
=33 
new33 "
QueryDefinition33# 2
(332 3
queryString333 >
)33> ?
;33? @
queryDef44 
.44 
WithParameter44 &
(44& '
$str44' 3
,443 4
	idUsuario445 >
)44> ?
;44? @
queryDef55 
.55 
WithParameter55 &
(55& '
$str55' 3
,553 4
idCita555 ;
)55; <
;55< =
var66 
query66 
=66 
	container66 %
.66% & 
GetItemQueryIterator66& :
<66: ;
CitasDto66; C
>66C D
(66D E
queryDef66E M
)66M N
;66N O
while77 
(77 
query77 
.77 
HasMoreResults77 +
)77+ ,
{88 
var99 
response99  
=99! "
await99# (
query99) .
.99. /
ReadNextAsync99/ <
(99< =
)99= >
;99> ?
data:: 
=:: 
response:: #
.::# $
SingleOrDefault::$ 3
(::3 4
)::4 5
;::5 6
};; 
return== 
data== 
;== 
}>> 
catch?? 
(?? 
CosmosException?? "
ex??# %
)??% &
when??' +
(??, -
ex??- /
.??/ 0

StatusCode??0 :
==??; =
HttpStatusCode??> L
.??L M
NotFound??M U
)??U V
{@@ 
returnAA 
dataAA 
;AA 
}BB 
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
stringEE  
>EE  !
AgregarEstadoEE" /
(EE/ 0
stringEE0 6
	idUsuarioEE7 @
,EE@ A
stringEEB H
	idTramiteEEI R
,EER S
EstadoEET Z
estadoEE[ a
)EEa b
{FF 	
varGG 
resultGG 
=GG 
	containerGG "
.GG" # 
GetItemLinqQueryableGG# 7
<GG7 8
AgendaGG8 >
>GG> ?
(GG? @
)GG@ A
.GGA B
WhereGGB G
(GGG H
mHH 
=>HH  "
mHH# $
.HH$ %
IdHH% '
.HH' (
EqualsHH( .
(HH. /
	idUsuarioHH/ 8
)HH8 9
)HH9 :
.HH: ;
ToFeedIteratorHH; I
(HHI J
)HHJ K
;HHK L
intJJ 
indiceTramiteJJ 
=JJ 
-JJ  !
$numJJ! "
,JJ" #
indiceEstadosKK 
=KK 
-KK  !
$numKK! "
;KK" #
ifMM 
(MM 
resultMM 
.MM 
HasMoreResultsMM %
)MM% &
{NN 
varOO 
existingDocumentsOO %
=OO& '
awaitOO( -
resultOO. 4
.OO4 5
ReadNextAsyncOO5 B
(OOB C
)OOC D
;OOD E
ListQQ 
<QQ 
TramiteQQ 
>QQ 
tramitesQQ &
=QQ' (
existingDocumentsQQ) :
.QQ: ;
ResourceQQ; C
?QQC D
.QQD E
SelectQQE K
(QQK L
dQQL M
=>QQN P
dQQQ R
.QQR S
TramitesQQS [
)QQ[ \
.QQ\ ]
FirstOrDefaultQQ] k
(QQk l
)QQl m
;QQm n
indiceTramiteSS 
=SS 
tramitesSS  (
.SS( )
	FindIndexSS) 2
(SS2 3
trSS3 5
=>SS6 8
trSS9 ;
.SS; <
	PkTramiteSS< E
.SSE F
EqualsSSF L
(SSL M
	idTramiteSSM V
)SSV W
)SSW X
;SSX Y
indiceEstadosTT 
=TT 
tramitesTT  (
.TT( )
	ElementAtTT) 2
(TT2 3
indiceTramiteTT3 @
)TT@ A
.TTA B
EstadosTTB I
.TTI J
CountTTJ O
;TTO P
}UU 
varWW 
	patchOptsWW 
=WW 
newWW 
ListWW  $
<WW$ %
PatchOperationWW% 3
>WW3 4
{XX 
PatchOperationYY 
.YY 
AddYY "
(YY" #
$"YY# %
$strYY% /
{YY/ 0
indiceTramiteYY0 =
}YY= >
$strYY> G
{YYG H
indiceEstadosYYH U
}YYU V
"YYV W
,YYW X
estadoYYY _
)YY_ `
}ZZ 
;ZZ 
var\\ 
	resultado\\ 
=\\ 
await\\ !
	container\\" +
.\\+ ,
PatchItemAsync\\, :
<\\: ;
Tramite\\; B
>\\B C
(\\C D
	idUsuario\\D M
,\\M N
new\\O R
PartitionKey\\S _
(\\_ `
	idUsuario\\` i
)\\i j
,\\j k
	patchOpts\\l u
)\\u v
;\\v w
return]] 
	resultado]] 
.]] 

StatusCode]] '
.]]' (
ToString]]( 0
(]]0 1
)]]1 2
;]]2 3
}^^ 	
public`` 
async`` 
Task`` 
<`` 
	EstadoDto`` #
>``# $
ValidarEstado``% 2
(``2 3
string``3 9
	idUsuario``: C
,``C D
string``E K
	idTramite``L U
,``U V
string``W ]
estado``^ d
)``d e
{aa 	
	EstadoDtobb 
databb 
=bb 
nullbb !
;bb! "
trycc 
{dd 
varee 
queryStringee 
=ee  !
$@"ee" %
$streh% R
{hhR S
estadohhS Y
}hhY Z
$strhlZ ?
"ll? @
;ll@ A
varnn 
queryDefnn 
=nn 
newnn "
QueryDefinitionnn# 2
(nn2 3
queryStringnn3 >
)nn> ?
;nn? @
queryDefoo 
.oo 
WithParameteroo &
(oo& '
$stroo' 3
,oo3 4
	idUsuariooo5 >
)oo> ?
;oo? @
queryDefpp 
.pp 
WithParameterpp &
(pp& '
$strpp' 3
,pp3 4
	idTramitepp5 >
)pp> ?
;pp? @
varrr 
queryrr 
=rr 
	containerrr %
.rr% & 
GetItemQueryIteratorrr& :
<rr: ;
	EstadoDtorr; D
>rrD E
(rrE F
queryDefrrF N
)rrN O
;rrO P
whiless 
(ss 
queryss 
.ss 
HasMoreResultsss +
)ss+ ,
{tt 
varuu 
responseuu  
=uu! "
awaituu# (
queryuu) .
.uu. /
ReadNextAsyncuu/ <
(uu< =
)uu= >
;uu> ?
datavv 
=vv 
responsevv #
.vv# $
SingleOrDefaultvv$ 3
(vv3 4
)vv4 5
;vv5 6
}ww 
returnyy 
datayy 
;yy 
}zz 
catch{{ 
({{ 
CosmosException{{ "
ex{{# %
){{% &
when{{' +
({{, -
ex{{- /
.{{/ 0

StatusCode{{0 :
=={{; =
HttpStatusCode{{> L
.{{L M
NotFound{{M U
){{U V
{|| 
return}} 
data}} 
;}} 
}~~ 
} 	
}
ÄÄ 
}ÅÅ ‰
fC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Services\GeneraQR.cs
	namespace		 	

FxCodigoQR		
 
.		 
Services		 
{

 
public 

class 
GeneraQR 
: 
	IGeneraQR %
{ 
private 
readonly 
BarcodeSettings (
settings) 1
;1 2
public 
GeneraQR 
( 
) 
{ 	
settings 
= 
new 
BarcodeSettings *
(* +
)+ ,
;, -
settings 
. 
Type 
= 
BarCodeType '
.' (
QRCode( .
;. /
settings 
. 
ShowText 
= 
false  %
;% &
settings 
. 
ResolutionType #
=$ %
ResolutionType& 4
.4 5
UseDpi5 ;
;; <
} 	
public 
Image 
construyeQR  
(  !
int! $
barWidth% -
,- .
int/ 2

leftMargin3 =
,= >
int? B
rigthMarginC N
,N O
intP S
	topMarginT ]
,] ^
int_ b
bottomMarginc o
,o p
stringq w
datax |
)| }
{ 	
settings 
. 
X 
= 
barWidth !
;! "
settings 
. 

LeftMargin 
=  !

leftMargin" ,
;, -
settings 
. 
RightMargin  
=! "
rigthMargin# .
;. /
settings 
. 
	TopMargin 
=  
	topMargin! *
;* +
settings 
. 
BottomMargin !
=" #
bottomMargin$ 0
;0 1
settings 
. 
	QRCodeECL 
=  
	QRCodeECL! *
.* +
M+ ,
;, -
settings   
.   
Data   
=   
data    
;    !
BarCodeGenerator!! 
	generator!! &
=!!' (
new!!) ,
(!!, -
settings!!- 5
)!!5 6
;!!6 7
return"" 
	generator"" 
."" 
GenerateImage"" *
(""* +
)""+ ,
;"", -
}## 	
public%% 
string%% 
construyeQR%% !
(%%! "
string%%" (
data%%) -
)%%- .
{&& 	
var'' 
imgType'' 
='' 
Base64QRCode'' &
.''& '
	ImageType''' 0
.''0 1
Jpeg''1 5
;''5 6
QRCodeGenerator(( 
qrGenerator(( '
=((( )
new((* -
QRCodeGenerator((. =
(((= >
)((> ?
;((? @

QRCodeData)) 

qrCodeData)) !
=))" #
qrGenerator))$ /
.))/ 0
CreateQrCode))0 <
())< =
data))= A
,))A B
QRCodeGenerator))C R
.))R S
ECCLevel))S [
.))[ \
Q))\ ]
)))] ^
;))^ _
Base64QRCode** 
qrCode** 
=**  !
new**" %
Base64QRCode**& 2
(**2 3

qrCodeData**3 =
)**= >
;**> ?
return++ 
qrCode++ 
.++ 

GetGraphic++ $
(++$ %
$num++% '
,++' (
Color++) .
.++. /
Black++/ 4
,++4 5
Color++6 ;
.++; <
White++< A
,++A B
true++C G
,++G H
imgType++I P
)++P Q
;++Q R
},, 	
}-- 
}.. Õ4
\C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Startup.cs
[ 
assembly 	
:	 

FunctionsStartup 
( 
typeof "
(" #

FxCodigoQR# -
.- .
Startup. 5
)5 6
)6 7
]7 8
	namespace 	

FxCodigoQR
 
{ 
public 

class 
Startup 
: 
FunctionsStartup +
{ 
public 
override 
void 
	Configure &
(& '!
IFunctionsHostBuilder' <
builder= D
)D E
{   	
var!! 
keyVaultName!! 
=!! 
Environment!! *
.!!* +"
GetEnvironmentVariable!!+ A
(!!A B
$str!!B R
)!!R S
;!!S T
var"" 
kvUri"" 
="" 
$""" 
$str"" "
{""" #
keyVaultName""# /
}""/ 0
$str""0 A
"""A B
;""B C
var$$ 
tenant$$ 
=$$ 
new$$ )
DefaultAzureCredentialOptions$$ :
{%%  
VisualStudioTenantId&& $
=&&% &
Environment&&' 2
.&&2 3"
GetEnvironmentVariable&&3 I
(&&I J
$str&&J Y
)&&Y Z
}'' 
;''  
ConfigurationBuilder))   
configurationBuilder))! 5
=))6 7
new))8 ;
()); <
)))< =
;))= >
var** 
configuration** 
=**  
configurationBuilder**  4
.++ 
SetBasePath++ 
(++ 
	Directory++ &
.++& '
GetCurrentDirectory++' :
(++: ;
)++; <
)++< =
.,, 
AddJsonFile,, 
(,, 
$str,, 2
,,,2 3
optional,,4 <
:,,< =
true,,> B
,,,B C
reloadOnChange,,D R
:,,R S
true-- 
)-- 
... 
AddAzureKeyVault.. !
(..! "
vaultUri.." *
:..* +
new.., /
Uri..0 3
(..3 4
kvUri..4 9
)..9 :
,..: ;

credential..< F
:..F G
new..H K"
DefaultAzureCredential..L b
(..b c
tenant..c i
)..i j
)..j k
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
builderOO 
.OO 
ServicesOO 
.OO 
	AddScopedOO &
<OO& '
ICodigoQRRepositoryOO' :
,OO: ;
CodigoQRRepositoryOO< N
>OON O
(OOO P
)OOP Q
;OOQ R
builderUU 
.UU 
ServicesUU 
.UU 
	AddScopedUU &
<UU& '

IValidatorUU' 1
<UU1 2
	DataInputUU2 ;
>UU; <
,UU< =
DataInputValidatorUU> P
>UUP Q
(UUQ R
)UUR S
;UUS T
builderYY 
.YY 
ServicesYY 
.YY 
AddTransientYY )
<YY) *
IUnitOfWorkYY* 5
,YY5 6

UnitOfWorkYY7 A
>YYA B
(YYB C
)YYC D
;YYD E
builderZZ 
.ZZ 
ServicesZZ 
.ZZ 
AddTransientZZ )
<ZZ) *
	IGeneraQRZZ* 3
,ZZ3 4
GeneraQRZZ5 =
>ZZ= >
(ZZ> ?
)ZZ? @
;ZZ@ A
builder[[ 
.[[ 
Services[[ 
.[[ 
AddSingleton[[ )
<[[) *
IConfiguration[[* 8
>[[8 9
([[9 :
configuration[[: G
)[[G H
;[[H I
}\\ 	
}]] 
}^^ ∫
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Utils\HttpResponseHelper.cs
	namespace 	

FxCodigoQR
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
} ì
iC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Utils\SecurityHelper.cs
	namespace 	

FxCodigoQR
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
public		 
static		 
string		 
SHA256Encrypt		 *
(		* +
string		+ 1
text		2 6
)		6 7
{

 	
SHA256 
sha256 
= 
SHA256 "
." #
Create# )
() *
)* +
;+ ,
ASCIIEncoding 
encoding "
=# $
new% (
ASCIIEncoding) 6
(6 7
)7 8
;8 9
StringBuilder 
sb 
= 
new "
StringBuilder# 0
(0 1
)1 2
;2 3
byte 
[ 
] 
stream 
= 
sha256 "
." #
ComputeHash# .
(. /
encoding/ 7
.7 8
GetBytes8 @
(@ A
textA E
)E F
)F G
;G H
for 
( 
int 
i 
= 
$num 
; 
i 
< 
stream  &
.& '
Length' -
;- .
i/ 0
++0 2
)2 3
sb4 6
.6 7
AppendFormat7 C
(C D
$strD L
,L M
streamN T
[T U
iU V
]V W
)W X
;X Y
return 
$str 
+ 
sb 
. 
ToString %
(% &
)& '
.' (
ToUpper( /
(/ 0
)0 1
;1 2
} 	
} 
} «
eC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Utils\TimeHelper.cs
	namespace 	

FxCodigoQR
 
. 
Utils 
{ 
public 

static 
class 

TimeHelper "
{ 
public 
static 
DateTime 
ConevrtirHora ,
(, -
string- 3
hora4 8
)8 9
{ 	
return		 
DateTime		 
.		 

ParseExact		 &
(		& '
hora		' +
,		+ ,
$str		- 4
,		4 5
null		6 :
)		: ;
;		; <
}

 	
public 
static 
DateTime 
ObtenerFechaHoy .
(. /
)/ 0
{ 	
TimeZoneInfo 
zonaColombia %
=& '
TimeZoneInfo( 4
.4 5"
FindSystemTimeZoneById5 K
(K L
$strL c
)c d
;d e
return 
TimeZoneInfo 
.  
ConvertTime  +
(+ ,
DateTime, 4
.4 5
UtcNow5 ;
,; <
zonaColombia= I
)I J
;J K
} 	
public 
static 
DateTime 
ObtenerFechaConHora 2
(2 3
string3 9
fecha: ?
,? @
intA D
horaE I
,I J
intK N
minutosO V
)V W
{ 	
try 
{ 
var 
datos 
= 
fecha !
.! "
Split" '
(' (
$str( +
)+ ,
;, -
int 
year 
= 
int 
. 
Parse $
($ %
datos% *
[* +
$num+ ,
], -
.- .
Split. 3
(3 4
)4 5
[5 6
$num6 7
]7 8
)8 9
;9 :
int 
month 
= 
int 
.  
Parse  %
(% &
datos& +
[+ ,
$num, -
]- .
). /
;/ 0
int 
day 
= 
int 
. 
Parse #
(# $
datos$ )
[) *
$num* +
]+ ,
), -
;- .
TimeZoneInfo 
zonaColombia )
=* +
TimeZoneInfo, 8
.8 9"
FindSystemTimeZoneById9 O
(O P
$strP g
)g h
;h i
DateTime 
convertDate $
=% &
new' *
(* +
year+ /
,/ 0
month1 6
,6 7
day8 ;
,; <
hora= A
,A B
minutosC J
,J K
$numL M
)M N
;N O
DateTime 
fechaColombia &
=' (
TimeZoneInfo) 5
.5 6
ConvertTime6 A
(A B
convertDateB M
,M N
zonaColombiaO [
)[ \
;\ ]
return 
fechaColombia $
;$ %
}   
catch!! 
(!! 
	Exception!! 
)!! 
{"" 
return## 
new## 
(## 
$num## 
,##  
$num##! "
,##" #
$num##$ %
)##% &
;##& '
}$$ 
}%% 	
}&& 
}'' ã
qC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_AGENDAMIENTO\FxCodigoQR\FxCodigoQR\Validator\DataInputValidator.cs
	namespace 	

FxCodigoQR
 
. 
	Validator 
{ 
public		 

class		 
DataInputValidator		 #
:		$ %
AbstractValidator		& 7
<		7 8
	DataInput		8 A
>		A B
{

 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
DataInputValidator !
(! "
IUnitOfWork" -

unitOfWork. 8
)8 9
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
RuleFor 
( 
data 
=> 
data  
.  !
	IdTramite! *
)* +
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage !
(! "
$str" Q
)Q R
. 
Must 
( 
( 
data 
, 
	IdTramite !
)! "
=># %
VerificarCita& 3
(3 4
data4 8
)8 9
)9 :
.: ;
WithMessage; F
(F G
$strG u
)u v
;v w
RuleFor 
( 
data 
=> 
data  
.  !
	IdUsuario! *
)* +
. 
NotEmpty 
( 
) 
. 
NotNull 
( 
) 
. 
WithMessage "
(" #
$str# Q
)Q R
;R S
RuleFor 
( 
data 
=> 
data  
.  !
Data! %
)% &
. 
NotEmpty 
( 
) 
.   
NotNull   
(   
)   
.   
WithMessage   "
(  " #
$str  # Q
)  Q R
;  R S
}!! 	
private## 
bool## 
VerificarCita## "
(##" #
	DataInput### ,
data##- 1
)##1 2
{$$ 	
CitasDto%% 
cita%% 
=%% 
_unitOfWork%% '
.%%' (
TramiteRepository%%( 9
.%%9 :
ObtenerCita%%: E
(%%E F
data%%F J
.%%J K
	IdUsuario%%K T
,%%T U
data%%V Z
.%%Z [
	IdTramite%%[ d
)%%d e
.%%e f

GetAwaiter%%f p
(%%p q
)%%q r
.%%r s
	GetResult%%s |
(%%| }
)%%} ~
;%%~ 
return&& 
cita&& 
!=&& 
null&& 
;&&  
}'' 	
}(( 
})) 