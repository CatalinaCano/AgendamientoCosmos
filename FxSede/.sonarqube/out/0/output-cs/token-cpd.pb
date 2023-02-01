Ç
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\DataContext\UnitOfWork.cs
	namespace		 	
FxSede		
 
.		 
DataContext		 
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
private 
ISedeRepository 
_sedeRepository  /
;/ 0
private 
IServicioRepository #
_servicioRepository$ 7
;7 8
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
public 
ISedeRepository 
SedeRepository -
{ 	
get 
{ 
return 
_sedeRepository (
??) +
(, -
_sedeRepository- <
== >
new? B
SedeRepositoryC Q
(Q R
_clientR Y
,Y Z
_configuration[ i
)i j
)j k
;k l
}m n
} 	
public 
IServicioRepository "
ServicioRepository# 5
{   	
get!! 
{!! 
return!! 
_servicioRepository!! ,
??!!- /
(!!0 1
_servicioRepository!!1 D
=!!E F
new!!G J
ServicioRepository!!K ]
(!!] ^
_client!!^ e
,!!e f
_configuration!!g u
)!!u v
)!!v w
;!!w x
}!!y z
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
}88 ˇG
fC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\FxActualizarSede.cs
	namespace 	
FxSede
 
{ 
public 

class 
FxActualizarSede !
{ 
private   
readonly   
IUnitOfWork   $
_unitOfWork  % 0
;  0 1
private!! 
readonly!! 

IValidator!! #
<!!# $
	SedeInput!!$ -
>!!- .
_sedeValidator!!/ =
;!!= >
private"" 
readonly"" 
IMapper""  
_mapper""! (
;""( )
public$$ 
FxActualizarSede$$ 
($$  
IUnitOfWork$$  +

unitOfWork$$, 6
,$$6 7

IValidator$$8 B
<$$B C
	SedeInput$$C L
>$$L M
sedeValidator$$N [
,$$[ \
IMapper$$] d
mapper$$e k
)$$k l
{%% 	
_unitOfWork&& 
=&& 

unitOfWork&& $
;&&$ %
_sedeValidator'' 
='' 
sedeValidator'' *
;''* +
_mapper(( 
=(( 
mapper(( 
;(( 
})) 	
[++ 	
FunctionName++	 
(++ 
nameof++ 
(++ 
ActualizarSede++ +
)+++ ,
)++, -
]++- .
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
$str--' 7
,--7 8
tags--9 =
:--= >
new--? B
[--B C
]--C D
{--E F
$str--G X
}--Y Z
,--Z [
Description--\ g
=--h i
$str--j ~
,--~ 
Summary
--Ä á
=
--à â
$str
--ä û
)
--û ü
]
--ü †
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
$str//  (
,//( )
In//* ,
=//- .
ParameterLocation/// @
.//@ A
Path//A E
,//E F
Required//G O
=//P Q
true//R V
,//V W
Type//X \
=//] ^
typeof//_ e
(//e f
string//f l
)//l m
,//m n
Description//o z
=//{ |
$str	//} ó
)
//ó ò
]
//ò ô
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
(00M N
	SedeInput00N W
)00W X
,00X Y
Required00Z b
=00c d
true00e i
,00i j
Description00k v
=00w x
$str00y 
)	00 Ä
]
00Ä Å
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
>44' (
ActualizarSede44) 7
(447 8
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
$str55E Y
)55Y Z
]55Z [
HttpRequest55\ g
req55h k
,55k l
string55m s
idSede55t z
)55z {
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
;998 9
	SedeInput:: 
request:: !
=::" #
JsonConvert::$ /
.::/ 0
DeserializeObject::0 A
<::A B
	SedeInput::B K
>::K L
(::L M
json::M Q
)::Q R
;::R S
var<< 
validationResult<< $
=<<% &
_sedeValidator<<' 5
.<<5 6
Validate<<6 >
(<<> ?
request<<? F
)<<F G
;<<G H
if== 
(== 
validationResult== $
.==$ %
IsValid==% ,
)==- .
{>> 
Sede?? 
sede?? 
=?? 
_mapper??  '
.??' (
Map??( +
<??+ ,
Sede??, 0
>??0 1
(??1 2
request??2 9
)??9 :
;??: ;
sede@@ 
.@@ 
UsuarioModificacion@@ ,
=@@- .
request@@/ 6
.@@6 7
Usuario@@7 >
;@@> ?
sedeAA 
.AA 
FechaModificacionAA *
=AA+ ,
DateTimeOffsetAA- ;
.AA; <
NowAA< ?
;AA? @
stringBB 
resultBB !
=BB" #
awaitBB$ )
_unitOfWorkBB* 5
.BB5 6
SedeRepositoryBB6 D
.BBD E
PatchSedeAsyncBBE S
(BBS T
sedeBBT X
,BBX Y
idSedeBBZ `
)BB` a
;BBa b
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
DDÑ ≠
}
DDÆ Ø
)
DDØ ∞
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
EEä ≈
}
EE∆ «
)
EE« »
;
EE» …
}FF 
elseGG 
{HH 
returnII 
HttpResponseHelperII -
.II- .
ResponseII. 6
(II6 7
StatusCodesII7 B
.IIB C
Status400BadRequestIIC V
,IIV W
newIIX [
ResponseResultII\ j
(IIj k
)IIk l
{JJ 
IsErrorKK 
=KK  !
trueKK" &
,KK& '
MessageLL 
=LL  !
validationResultLL" 2
.LL2 3
ErrorsLL3 9
.LL9 :
FirstLL: ?
(LL? @
)LL@ A
.LLA B
ErrorMessageLLB N
}MM 
)MM 
;MM 
}NN 
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
}UU 
}VV ÁP
iC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\FxActualizarSubSede.cs
	namespace 	
FxSede
 
{ 
public 

class 
FxActualizarSubSede $
{ 
private   
readonly   
IUnitOfWork   $
_unitOfWork  % 0
;  0 1
private!! 
readonly!! 

IValidator!! #
<!!# $
SubSedeInput!!$ 0
>!!0 1
_subSedeValidator!!2 C
;!!C D
private"" 
readonly"" 
IMapper""  
_mapper""! (
;""( )
public$$ 
FxActualizarSubSede$$ "
($$" #
IUnitOfWork$$# .

unitOfWork$$/ 9
,$$9 :

IValidator$$; E
<$$E F
SubSedeInput$$F R
>$$R S
subSedeValidator$$T d
,$$d e
IMapper$$f m
mapper$$n t
)$$t u
{%% 	
_unitOfWork&& 
=&& 

unitOfWork&& $
;&&$ %
_subSedeValidator'' 
='' 
subSedeValidator''  0
;''0 1
_mapper(( 
=(( 
mapper(( 
;(( 
})) 	
[++ 	
FunctionName++	 
(++ 
nameof++ 
(++ 
ActualizarSubSede++ .
)++. /
)++/ 0
]++0 1
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
$str--' :
,--: ;
tags--< @
:--@ A
new--B E
[--E F
]--F G
{--H I
$str--J ^
}--_ `
,--` a
Description--b m
=--n o
$str	--p á
,
--á à
Summary
--â ê
=
--ë í
$str
--ì ™
)
--™ ´
]
--´ ¨
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
$str//  (
,//( )
In//* ,
=//- .
ParameterLocation/// @
.//@ A
Path//A E
,//E F
Required//G O
=//P Q
true//R V
,//V W
Type//X \
=//] ^
typeof//_ e
(//e f
string//f l
)//l m
,//m n
Description//o z
=//{ |
$str	//} ó
)
//ó ò
]
//ò ô
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
(00M N
SubSedeInput00N Z
)00Z [
,00[ \
Required00] e
=00f g
true00h l
,00l m
Description00n y
=00z {
$str	00| Ö
)
00Ö Ü
]
00Ü á
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
.33; <
Conflict33< D
,33D E
contentType33F Q
:33Q R
$str33S e
,33e f
bodyType33g o
:33o p
typeof33q w
(33w x
ResponseResult	33x Ü
)
33Ü á
,
33á à
Description
33â î
=
33ï ñ
$str
33ó ™
)
33™ ´
]
33´ ¨
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
>55' (
ActualizarSubSede55) :
(55: ;
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
$str66E \
)66\ ]
]66] ^
HttpRequest66_ j
req66k n
,66n o
string66p v
idSede66w }
)66} ~
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
;::8 9
SubSedeInput;; 
request;; $
=;;% &
JsonConvert;;' 2
.;;2 3
DeserializeObject;;3 D
<;;D E
SubSedeInput;;E Q
>;;Q R
(;;R S
json;;S W
);;W X
;;;X Y
request<< 
.<< 
idSede<< 
=<<  
idSede<<! '
;<<' (
bool== 
existeRecurso== "
===# $
await==% *
_unitOfWork==+ 6
.==6 7
SedeRepository==7 E
.==E F
ExistsSubSedeAsync==F X
(==X Y
idSede==Y _
,==_ `
request==a h
.==h i
	IdSubSede==i r
)==r s
;==s t
var>> 
validationResult>> $
=>>% &
_subSedeValidator>>' 8
.>>8 9
Validate>>9 A
(>>A B
request>>B I
)>>I J
;>>J K
if?? 
(?? 
validationResult?? $
.??$ %
IsValid??% ,
&&??- /
existeRecurso??0 =
)??= >
{@@ 
SubSedeAA 
subsedeAA #
=AA$ %
_mapperAA& -
.AA- .
MapAA. 1
<AA1 2
SubSedeAA2 9
>AA9 :
(AA: ;
requestAA; B
)AAB C
;AAC D
subsedeBB 
.BB 
UsuarioModificacionBB /
=BB0 1
requestBB2 9
.BB9 :
UsuarioBB: A
;BBA B
subsedeCC 
.CC 
	IdSubSedeCC %
=CC& '
requestCC( /
.CC/ 0
	IdSubSedeCC0 9
;CC9 :
varDD 
resultDD 
=DD  
awaitDD! &
_unitOfWorkDD' 2
.DD2 3
SedeRepositoryDD3 A
.DDA B
UpdateSubSedeDDB O
(DDO P
subsedeDDP W
,DDW X
idSedeDDY _
)DD_ `
;DD` a
returnEE 
resultEE !
.EE! "
EqualsEE" (
(EE( )
$strEE) -
)EE- .
?FF 
HttpResponseHelperFF /
.FF/ 0
ResponseFF0 8
(FF8 9
StatusCodesFF9 D
.FFD E
Status200OKFFE P
,FFP Q
newFFR U
ResponseResultFFV d
(FFd e
)FFe f
{FFg h
IsErrorFFi p
=FFq r
falseFFs x
,FFx y
Message	FFz Å
=
FFÇ É
$str
FFÑ ∞
}
FF± ≤
)
FF≤ ≥
:GG 
HttpResponseHelperGG /
.GG/ 0
ResponseGG0 8
(GG8 9
StatusCodesGG9 D
.GGD E
Status409ConflictGGE V
,GGV W
newGGX [
ResponseResultGG\ j
(GGj k
)GGk l
{GGm n
IsErrorGGo v
=GGw x
falseGGy ~
,GG~ 
Message
GGÄ á
=
GGà â
$str
GGä »
}
GG…  
)
GG  À
;
GGÀ Ã
}HH 
elseII 
{JJ 
returnKK 
HttpResponseHelperKK -
.KK- .
ResponseKK. 6
(KK6 7
StatusCodesKK7 B
.KKB C
Status400BadRequestKKC V
,KKV W
newKKX [
ResponseResultKK\ j
(KKj k
)KKk l
{LL 
IsErrorMM 
=MM  !
trueMM" &
,MM& '
MessageNN 
=NN  !
!NN" #
existeRecursoNN# 0
?NN1 2
$strNN3 `
:NNa b
validationResultNNc s
.NNs t
ErrorsNNt z
.NNz {
First	NN{ Ä
(
NNÄ Å
)
NNÅ Ç
.
NNÇ É
ErrorMessage
NNÉ è
}OO 
)OO 
;OO 
}QQ 
}SS 
catchTT 
(TT 
	ExceptionTT 
exTT 
)TT  
{UU 
returnVV 
HttpResponseHelperVV )
.VV) *
ResponseVV* 2
(VV2 3
StatusCodesVV3 >
.VV> ?(
Status500InternalServerErrorVV? [
,VV[ \
newVV] `
ResponseResultVVa o
(VVo p
)VVp q
{VVr s
IsErrorVVt {
=VV| }
true	VV~ Ç
,
VVÇ É
Message
VVÑ ã
=
VVå ç
ex
VVé ê
.
VVê ë
Message
VVë ò
}
VVô ö
)
VVö õ
;
VVõ ú
}WW 
}XX 	
}YY 
}ZZ îH
aC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\FxCrearSede.cs
	namespace 	
FxSede
 
{ 
public 

class 
FxCrearSede 
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private   
readonly   

IValidator   #
<  # $
	SedeInput  $ -
>  - .
_sedeValidator  / =
;  = >
private!! 
readonly!! 
IMapper!!  
_mapper!!! (
;!!( )
public## 
FxCrearSede## 
(## 
IUnitOfWork## &

unitOfWork##' 1
,##1 2

IValidator##3 =
<##= >
	SedeInput##> G
>##G H
sedeValidator##I V
,##V W
IMapper##X _
mapper##` f
)##f g
{$$ 	
_unitOfWork%% 
=%% 

unitOfWork%% $
;%%$ %
_sedeValidator&& 
=&& 
sedeValidator&& *
;&&* +
_mapper'' 
='' 
mapper'' 
;'' 
}(( 	
[** 	
FunctionName**	 
(** 
nameof** 
(** 
	CrearSede** &
)**& '
)**' (
]**( )
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
$str,,' 2
,,,2 3
tags,,4 8
:,,8 9
new,,: =
[,,= >
],,> ?
{,,@ A
$str,,B N
},,O P
,,,P Q
Description,,R ]
=,,^ _
$str,,` o
,,,o p
Summary,,q x
=,,y z
$str	,,{ ä
)
,,ä ã
]
,,ã å
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
(..M N
	SedeInput..N W
)..W X
,..X Y
Required..Z b
=..c d
true..e i
,..i j
Description..k v
=..w x
$str..y 
)	.. Ä
]
..Ä Å
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
.11; <
Conflict11< D
,11D E
contentType11F Q
:11Q R
$str11S e
,11e f
bodyType11g o
:11o p
typeof11q w
(11w x
ResponseResult	11x Ü
)
11Ü á
,
11á à
Description
11â î
=
11ï ñ
$str
11ó Ω
)
11Ω æ
]
11æ ø
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
>33' (
	CrearSede33) 2
(332 3
[44 
HttpTrigger44 
(44 
AuthorizationLevel44 +
.44+ ,
Function44, 4
,444 5
$str446 <
,44< =
Route44> C
=44D E
$str44F Q
)44Q R
]44R S
HttpRequest44T _
req44` c
)44c d
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
;888 9
	SedeInput99 
request99 !
=99" #
JsonConvert99$ /
.99/ 0
DeserializeObject990 A
<99A B
	SedeInput99B K
>99K L
(99L M
json99M Q
)99Q R
;99R S
bool:: 
existeRecurso:: "
=::# $
await::% *
_unitOfWork::+ 6
.::6 7
SedeRepository::7 E
.::E F
ExistsSedeAsync::F U
(::U V
request::V ]
.::] ^

NombreSede::^ h
)::h i
;::i j
var;; 
validationResult;; $
=;;% &
_sedeValidator;;' 5
.;;5 6
Validate;;6 >
(;;> ?
request;;? F
);;F G
;;;G H
if<< 
(<< 
validationResult<< $
.<<$ %
IsValid<<% ,
&&<<- /
!<<0 1
existeRecurso<<1 >
)<<> ?
{== 
Sede>> 
sede>> 
=>> 
_mapper>>  '
.>>' (
Map>>( +
<>>+ ,
Sede>>, 0
>>>0 1
(>>1 2
request>>2 9
)>>9 :
;>>: ;
string?? 
result?? !
=??" #
await??$ )
_unitOfWork??* 5
.??5 6
SedeRepository??6 D
.??D E
CreateSedeAsync??E T
(??T U
sede??U Y
)??Y Z
;??Z [
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
$strII2 W
:IIX Y
validationResultIIZ j
.IIj k
ErrorsIIk q
.IIq r
FirstIIr w
(IIw x
)IIx y
.IIy z
ErrorMessage	IIz Ü
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
}SS ·K
dC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\FxCrearSubSede.cs
	namespace 	
FxSede
 
{ 
public 

class 
FxCrearSubSede 
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private   
readonly   

IValidator   #
<  # $
SubSedeInput  $ 0
>  0 1
_subSedeValidator  2 C
;  C D
private!! 
readonly!! 
IMapper!!  
_mapper!!! (
;!!( )
public## 
FxCrearSubSede## 
(## 
IUnitOfWork## )

unitOfWork##* 4
,##4 5

IValidator##6 @
<##@ A
SubSedeInput##A M
>##M N
subSedeValidator##O _
,##_ `
IMapper##a h
mapper##i o
)##o p
{$$ 	
_unitOfWork%% 
=%% 

unitOfWork%% $
;%%$ %
_subSedeValidator&& 
=&& 
subSedeValidator&&  0
;&&0 1
_mapper'' 
='' 
mapper'' 
;'' 
}(( 	
[** 	
FunctionName**	 
(** 
nameof** 
(** 
CrearSubSede** )
)**) *
)*** +
]**+ ,
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
$str,,' 5
,,,5 6
tags,,7 ;
:,,; <
new,,= @
[,,@ A
],,A B
{,,C D
$str,,E T
},,U V
,,,V W
Description,,X c
=,,d e
$str,,f x
,,,x y
Summary	,,z Å
=
,,Ç É
$str
,,Ñ ñ
)
,,ñ ó
]
,,ó ò
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
$str..  (
,..( )
In..* ,
=..- .
ParameterLocation../ @
...@ A
Path..A E
,..E F
Required..G O
=..P Q
true..R V
,..V W
Type..X \
=..] ^
typeof.._ e
(..e f
string..f l
)..l m
,..m n
Description..o z
=..{ |
$str	..} ó
)
..ó ò
]
..ò ô
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
(//M N
SubSedeInput//N Z
)//Z [
,//[ \
Required//] e
=//f g
true//h l
,//l m
Description//n y
=//z {
$str	//| Ö
)
//Ö Ü
]
//Ü á
[00 	#
OpenApiResponseWithBody00	  
(00  !

statusCode00! +
:00+ ,
HttpStatusCode00- ;
.00; <
Created00< C
,00C D
contentType00E P
:00P Q
$str00R d
,00d e
bodyType00f n
:00n o
typeof00p v
(00v w
ResponseResult	00w Ö
)
00Ö Ü
,
00Ü á
Description
00à ì
=
00î ï
$str
00ñ ß
)
00ß ®
]
00® ©
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
>33' (
CrearSubSede33) 5
(335 6
[44 
HttpTrigger44 
(44 
AuthorizationLevel44 +
.44+ ,
Function44, 4
,444 5
$str446 <
,44< =
Route44> C
=44D E
$str44F ]
)44] ^
]44^ _
HttpRequest44` k
req44l o
,44o p
string44q w
idSede44x ~
)44~ 
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
;888 9
SubSedeInput:: 
request:: $
=::% &
JsonConvert::' 2
.::2 3
DeserializeObject::3 D
<::D E
SubSedeInput::E Q
>::Q R
(::R S
json::S W
)::W X
;::X Y
request;; 
.;; 
idSede;; 
=;;  
idSede;;! '
;;;' (
bool<< 
existeSubSede<< "
=<<$ %
await<<& +
_unitOfWork<<, 7
.<<7 8
SedeRepository<<8 F
.<<F G
GetSubSedeByName<<G W
(<<W X
idSede<<X ^
,<<^ _
request<<` g
.<<g h
NombreSubSede<<h u
)<<u v
!=<<v x
null<<x |
;<<| }
var?? 
validationResult?? $
=??% &
_subSedeValidator??' 8
.??8 9
Validate??9 A
(??A B
request??B I
)??I J
;??J K
if@@ 
(@@ 
validationResult@@ $
.@@$ %
IsValid@@% ,
&&@@- /
!@@0 1
existeSubSede@@1 >
)@@> ?
{AA 
SubSedeBB 
subsedeBB #
=BB$ %
_mapperBB& -
.BB- .
MapBB. 1
<BB1 2
SubSedeBB2 9
>BB9 :
(BB: ;
requestBB; B
)BBB C
;BBC D
stringDD 
resultDD !
=DD# $
awaitDD% *
_unitOfWorkDD+ 6
.DD6 7
SedeRepositoryDD7 E
.DDE F

AddSubSedeDDF P
(DDP Q
subsedeDDQ X
,DDX Y
idSedeDDZ `
)DD` a
;DDa b
returnEE 
resultEE !
.EE! "
ContainsEE" *
(EE* +
$strEE+ 2
)EE2 3
?EE4 5
HttpResponseHelperEE6 H
.EEH I
ResponseEEI Q
(EEQ R
StatusCodesEER ]
.EE] ^
Status409ConflictEE^ o
,EEo p
newEEq t
ResponseResult	EEu É
(
EEÉ Ñ
)
EEÑ Ö
{
EEÜ á
IsError
EEà è
=
EEê ë
true
EEí ñ
,
EEñ ó
Message
EEò ü
=
EE† °
$"
EE¢ §
$str
EE§ ‘
{
EE‘ ’
result
EE’ €
}
EE€ ‹
"
EE‹ ›
}
EEﬁ ﬂ
)
EEﬂ ‡
:FF2 3
HttpResponseHelperFF4 F
.FFF G
ResponseFFG O
(FFO P
StatusCodesFFP [
.FF[ \
Status201CreatedFF\ l
,FFl m
newFFn q
ResponseResult	FFr Ä
(
FFÄ Å
)
FFÅ Ç
{
FFÉ Ñ
IsError
FFÖ å
=
FFç é
false
FFè î
,
FFî ï
Message
FFñ ù
=
FFû ü
result
FF† ¶
}
FFß ®
)
FF® ©
;
FF© ™
}GG 
elseHH 
{II 
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
=MM  !
existeSubSedeMM" /
?MM0 1
$strMM2 x
:MMy z
validationResult	MM{ ã
.
MMã å
Errors
MMå í
.
MMí ì
First
MMì ò
(
MMò ô
)
MMô ö
.
MMö õ
ErrorMessage
MMõ ß
}NN 
)NN 
;NN 
}OO 
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
}WW ≈+
fC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\FxListarSedeByID.cs
	namespace 	
FxSede
 
{ 
public 

class 
FxListarSedeByID !
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
FxListarSedeByID 
(  
IUnitOfWork  +

unitOfWork, 6
)6 7
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
( 
ListarSedeByID +
)+ ,
), -
]- .
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
$str' 7
,7 8
tags9 =
:= >
new? B
[B C
]C D
{E F
$strG [
}\ ]
,] ^
Description_ j
=k l
$str	m î
,
î ï
Summary
ñ ù
=
û ü
$str
† «
)
« »
]
» …
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
$str!!  (
,!!( )
In!!* ,
=!!- .
ParameterLocation!!/ @
.!!@ A
Path!!A E
,!!E F
Required!!G O
=!!P Q
true!!R V
,!!V W
Type!!X \
=!!] ^
typeof!!_ e
(!!e f
string!!f l
)!!l m
,!!m n
Description!!o z
=!!{ |
$str	!!} ó
)
!!ó ò
]
!!ò ô
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
(""q r
SedeDto""r y
)""y z
,""z {
Description	""| á
=
""à â
$str
""ä õ
)
""õ ú
]
""ú ù
[## 	#
OpenApiResponseWithBody##	  
(##  !

statusCode##! +
:##+ ,
HttpStatusCode##- ;
.##; <
	NoContent##< E
,##E F
contentType##G R
:##R S
$str##T f
,##f g
bodyType##h p
:##p q
typeof##r x
(##x y
ResponseResult	##y á
)
##á à
,
##à â
Description
##ä ï
=
##ñ ó
$str
##ò §
)
##§ •
]
##• ¶
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
>%%' (
ListarSedeByID%%) 7
(%%7 8
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
$str&&E Y
)&&Y Z
]&&Z [
HttpRequest&&\ g
req&&h k
,&&k l
string&&m s
idSede&&t z
)&&z {
{'' 	
try(( 
{)) 
SedeDto** 
sede** 
=** 
await** $
_unitOfWork**% 0
.**0 1
SedeRepository**1 ?
.**? @
GetSedeByID**@ K
(**K L
idSede**L R
)**R S
;**S T
return++ 
sede++ 
==++ 
null++ #
?++$ %
HttpResponseHelper++& 8
.++8 9!
HttpExplicitNoContent++9 N
(++N O
)++O P
:++Q R
HttpResponseHelper++S e
.++e f"
SuccessfulObjectResult++f |
(++| }
sede	++} Å
)
++Å Ç
;
++Ç É
},, 
catch-- 
(-- 
	Exception-- 
ex-- 
)--  
{.. 
return// 
HttpResponseHelper// )
.//) *
Response//* 2
(//2 3
StatusCodes//3 >
.//> ?(
Status500InternalServerError//? [
,//[ \
new//] `
ResponseResult//a o
(//o p
)//p q
{//r s
IsError//t {
=//| }
true	//~ Ç
,
//Ç É
Message
//Ñ ã
=
//å ç
ex
//é ê
.
//ê ë
Message
//ë ò
}
//ô ö
)
//ö õ
;
//õ ú
}00 
}11 	
}22 
}33 ú"
cC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\FxListarSedes.cs
	namespace 	
FxSede
 
{ 
public 

class 
FxListarSedes 
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
FxListarSedes 
( 
IUnitOfWork (

unitOfWork) 3
)3 4
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
( 
ListarSedes (
)( )
)) *
]* +
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
$str  ' 4
,  4 5
tags  6 :
:  : ;
new  < ?
[  ? @
]  @ A
{  B C
$str  D R
}  S T
,  T U
Description  V a
=  b c
$str  d 
,	   Ä
Summary
  Å à
=
  â ä
$str
  ã ∏
)
  ∏ π
]
  π ∫
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
<""w x
SedeDto""x 
>	"" Ä
)
""Ä Å
,
""Å Ç
Description
""É é
=
""è ê
$str
""ë ¢
)
""¢ £
]
""£ §
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
>$$' (
ListarSedes$$) 4
($$4 5
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
$str%%E P
)%%P Q
]%%Q R
HttpRequest%%S ^
req%%_ b
)%%b c
{&& 	
try'' 
{(( 
IList)) 
<)) 
SedeDto)) 
>)) 
sedes)) $
=))% &
await))' ,
_unitOfWork))- 8
.))8 9
SedeRepository))9 G
.))G H
GetSedesAsync))H U
())U V
)))V W
;))W X
return** 
HttpResponseHelper** )
.**) *"
SuccessfulObjectResult*** @
(**@ A
sedes**A F
)**F G
;**G H
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
}22 †*
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\FxListarSedesByServicio.cs
	namespace 	
FxSede
 
{ 
public 

class #
FxListarSedesByServicio (
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public #
FxListarSedesByServicio &
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
ListarSedesByServicio 2
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
{  L M
$str  N i
}  j k
,  k l
Description  m x
=  y z
$str	  { ≥
,
  ≥ ¥
Summary
  µ º
=
  Ω æ
$str
  ø ˜
)
  ˜ ¯
]
  ¯ ˘
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
<""w x
SedeDto""x 
>	"" Ä
)
""Ä Å
,
""Å Ç
Description
""É é
=
""è ê
$str
""ë ¢
)
""¢ £
]
""£ §
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
ListarSedesByServicio$$) >
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
$str%%E f
)%%f g
]%%g h
HttpRequest%%i t
req%%u x
,%%x y
string	%%z Ä

idServicio
%%Å ã
)
%%ã å
{&& 	
try'' 
{(( 
bool)) 
servicioValido)) #
=))$ %
await))& +
_unitOfWork)), 7
.))7 8
ServicioRepository))8 J
.))J K 
GetServicioByIdAsync))K _
())_ `

idServicio))` j
)))j k
;))k l
if++ 
(++ 
servicioValido++ "
)++" #
{,, 
IList-- 
<-- 
SedeDto-- !
>--! "
sedes--# (
=--) *
await--+ 0
_unitOfWork--1 <
.--< =
SedeRepository--= K
.--K L
GetSedesByServicio--L ^
(--^ _

idServicio--_ i
)--i j
;--j k
return.. 
HttpResponseHelper.. -
...- ."
SuccessfulObjectResult... D
(..D E
sedes..E J
)..J K
;..K L
}// 
else00 
{11 
return22 
HttpResponseHelper22 -
.22- .
Response22. 6
(226 7
StatusCodes227 B
.22B C
Status400BadRequest22C V
,22V W
new22X [
ResponseResult22\ j
(22j k
)22k l
{22m n
IsError22o v
=22w x
true22y }
,22} ~
Message	22 Ü
=
22á à
$str
22â Õ
}
22Œ œ
)
22œ –
;
22– —
}33 
}44 
catch55 
(55 
	Exception55 
ex55 
)55  
{66 
return77 
HttpResponseHelper77 )
.77) *
Response77* 2
(772 3
StatusCodes773 >
.77> ?(
Status500InternalServerError77? [
,77[ \
new77] `
ResponseResult77a o
(77o p
)77p q
{77r s
IsError77t {
=77| }
true	77~ Ç
,
77Ç É
Message
77Ñ ã
=
77å ç
ex
77é ê
.
77ê ë
Message
77ë ò
}
77ô ö
)
77ö õ
;
77õ ú
}88 
}99 	
}:: 
};; Ω3
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\FxListarSubsedeByName.cs
	namespace 	
FxSede
 
{ 
public 

class !
FxListarSubsedeByName &
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public !
FxListarSubsedeByName $
($ %
IUnitOfWork% 0

unitOfWork1 ;
); <
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
ListarSubsedeByName 0
)0 1
)1 2
]2 3
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
$str' <
,< =
tags> B
:B C
newD G
[G H
]H I
{J K
$strL n
}o p
,p q
Descriptionr }
=~ 
$str
Ä £
,
£ §
Summary
• ¨
=
≠ Æ
$str
Ø “
)
“ ”
]
” ‘
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
$str!!  (
,!!( )
In!!* ,
=!!- .
ParameterLocation!!/ @
.!!@ A
Path!!A E
,!!E F
Required!!G O
=!!P Q
true!!R V
,!!V W
Type!!X \
=!!] ^
typeof!!_ e
(!!e f
string!!f l
)!!l m
,!!m n
Description!!o z
=!!{ |
$str	!!} ó
)
!!ó ò
]
!!ò ô
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
(""q r
SedeDto""r y
)""y z
,""z {
Description	""| á
=
""à â
$str
""ä õ
)
""õ ú
]
""ú ù
[## 	#
OpenApiResponseWithBody##	  
(##  !

statusCode##! +
:##+ ,
HttpStatusCode##- ;
.##; <
	NoContent##< E
,##E F
contentType##G R
:##R S
$str##T f
,##f g
bodyType##h p
:##p q
typeof##r x
(##x y
ResponseResult	##y á
)
##á à
,
##à â
Description
##ä ï
=
##ñ ó
$str
##ò §
)
##§ •
]
##• ¶
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
ListarSubsedeByName%%) <
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
$str&&E j
)&&j k
]&&k l
HttpRequest&&m x
req&&y |
,&&| }
string	&&~ Ñ
idSede
&&Ö ã
,
&&ã å
string
&&ç ì
nombre
&&î ö
)
&&ö õ
{'' 	
try(( 
{)) 
var,, 
data,, 
=,, 
await,,  
_unitOfWork,,! ,
.,,, -
SedeRepository,,- ;
.,,; <
GetSedeByID,,< G
(,,G H
idSede,,H N
),,N O
;,,O P
if.. 
(.. 
data.. 
!=.. 
null..  
)..  !
{// 

SubSedeDto00 
subSede00 &
=00' (
await00) .
_unitOfWork00/ :
.00: ;
SedeRepository00; I
.00I J
GetSubSedeByName00J Z
(00Z [
idSede00[ a
,00a b
nombre00c i
)00i j
;00j k
return22 
subSede22 "
==22# %
null22& *
?22+ ,
HttpResponseHelper22- ?
.22? @!
HttpExplicitNoContent22@ U
(22U V
)22V W
:22X Y
HttpResponseHelper22Z l
.22l m#
SuccessfulObjectResult	22m É
(
22É Ñ
subSede
22Ñ ã
)
22ã å
;
22å ç
}33 
else44 
{55 
return66 
HttpResponseHelper66 -
.66- .
Response66. 6
(666 7
StatusCodes667 B
.66B C
Status400BadRequest66C V
,66V W
new66X [
ResponseResult66\ j
(66j k
)66k l
{77 
IsError88 
=88  !
true88" &
,88& '
Message99 
=99  !
$str99# [
}:: 
):: 
;:: 
};; 
}>> 
catch?? 
(?? 
	Exception?? 
ex?? 
)??  
{@@ 
returnAA 
HttpResponseHelperAA )
.AA) *
ResponseAA* 2
(AA2 3
StatusCodesAA3 >
.AA> ?(
Status500InternalServerErrorAA? [
,AA[ \
newAA] `
ResponseResultAAa o
(AAo p
)AAp q
{AAr s
IsErrorAAt {
=AA| }
true	AA~ Ç
,
AAÇ É
Message
AAÑ ã
=
AAå ç
ex
AAé ê
.
AAê ë
Message
AAë ò
}
AAô ö
)
AAö õ
;
AAõ ú
}BB 
}CC 	
}DD 
}EE è.
jC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\FxListarSubSedesByID.cs
	namespace 	
FxSede
 
{ 
public 

class  
FxListarSubSedesByID %
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public  
FxListarSubSedesByID #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
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
ListarSubSedesByID /
)/ 0
)0 1
]1 2
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
$str' ;
,; <
tags= A
:A B
newC F
[F G
]G H
{I J
$strK r
}s t
,t u
Description	v Å
=
Ç É
$str
Ñ ´
,
´ ¨
Summary
≠ ¥
=
µ ∂
$str
∑ ﬁ
)
ﬁ ﬂ
]
ﬂ ‡
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
$str!!  (
,!!( )
In!!* ,
=!!- .
ParameterLocation!!/ @
.!!@ A
Path!!A E
,!!E F
Required!!G O
=!!P Q
true!!R V
,!!V W
Type!!X \
=!!] ^
typeof!!_ e
(!!e f
string!!f l
)!!l m
,!!m n
Description!!o z
=!!{ |
$str	!!} ó
)
!!ó ò
]
!!ò ô
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
(""q r

SubSedeDto""r |
)""| }
,""} ~
Description	"" ä
=
""ã å
$str
""ç û
)
""û ü
]
""ü †
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
ListarSubSedesByID$$) ;
($$; <
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
string	%%} É
idSede
%%Ñ ä
,
%%ä ã
string
%%å í
	idSubSede
%%ì ú
)
%%ú ù
{&& 	
try'' 
{(( 
var** 
data** 
=** 
await**  
_unitOfWork**! ,
.**, -
SedeRepository**- ;
.**; <
GetSedeByID**< G
(**G H
idSede**H N
)**N O
;**O P
if-- 
(-- 
data-- 
!=-- 
null--  
)--  !
{.. 

SubSedeDto// 
subsedes// '
=//( )
await//* /
_unitOfWork//0 ;
.//; <
SedeRepository//< J
.//J K 
GetSubSedesByIdAsync//K _
(//_ `
idSede//` f
,//f g
	idSubSede//g p
)//p q
;//q r
return00 
HttpResponseHelper00 -
.00- ."
SuccessfulObjectResult00. D
(00D E
subsedes00E M
)00M N
;00N O
}11 
else22 
{33 
return44 
HttpResponseHelper44 -
.44- .
Response44. 6
(446 7
StatusCodes447 B
.44B C
Status400BadRequest44C V
,44V W
new44X [
ResponseResult44\ j
(44j k
)44k l
{55 
IsError66 
=66  !
true66" &
,66& '
Message77 
=77  !
$str77" X
}88 
)88 
;88 
}99 
}== 
catch>> 
(>> 
	Exception>> 
ex>> 
)>>  
{?? 
return@@ 
HttpResponseHelper@@ )
.@@) *
Response@@* 2
(@@2 3
StatusCodes@@3 >
.@@> ?(
Status500InternalServerError@@? [
,@@[ \
new@@] `
ResponseResult@@a o
(@@o p
)@@p q
{@@r s
IsError@@t {
=@@| }
true	@@~ Ç
,
@@Ç É
Message
@@Ñ ã
=
@@å ç
ex
@@é ê
.
@@ê ë
Message
@@ë ò
}
@@ô ö
)
@@ö õ
;
@@õ ú
}AA 
}BB 	
}CC 
}DD é2
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\FxListarSubSedesBySede.cs
	namespace 	
FxSede
 
{ 
public 

class "
FxListarSubSedesBySede '
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public "
FxListarSubSedesBySede %
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
( "
ListarSubSedesByIDSede 3
)3 4
)4 5
]5 6
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
$str  ' ;
,  ; <
tags  = A
:  A B
new  C F
[  F G
]  G H
{  I J
$str  K r
}  s t
,  t u
Description	  v Å
=
  Ç É
$str
  Ñ ¶
,
  ¶ ß
Summary
  ® Ø
=
  ∞ ±
$str
  ≤ Ó
)
  Ó Ô
]
  Ô 
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
$str""  (
,""( )
In""* ,
=""- .
ParameterLocation""/ @
.""@ A
Path""A E
,""E F
Required""G O
=""P Q
true""R V
,""V W
Type""X \
=""] ^
typeof""_ e
(""e f
string""f l
)""l m
,""m n
Description""o z
=""{ |
$str	""} ó
)
""ó ò
]
""ò ô
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
(##q r
IList##r w
<##w x

SubSedeDto	##x Ç
>
##Ç É
)
##É Ñ
,
##Ñ Ö
Description
##Ü ë
=
##í ì
$str
##î •
)
##• ¶
]
##¶ ß
[$$ 	#
OpenApiResponseWithBody$$	  
($$  !

statusCode$$! +
:$$+ ,
HttpStatusCode$$- ;
.$$; <

BadRequest$$< F
,$$F G
contentType$$H S
:$$S T
$str$$U g
,$$g h
bodyType$$i q
:$$q r
typeof$$s y
($$y z
ResponseResult	$$z à
)
$$à â
,
$$â ä
Description
$$ã ñ
=
$$ó ò
$str
$$ô ™
)
$$™ ´
]
$$´ ¨
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
>&&' ("
ListarSubSedesByIDSede&&) ?
(&&? @
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
$str''E ]
)''] ^
]''^ _
HttpRequest''` k
req''l o
,''o p
string''q w
idSede''x ~
)''~ 
{(( 	
try)) 
{** 
var,, 
data,, 
=,, 
await,,  
_unitOfWork,,! ,
.,,, -
SedeRepository,,- ;
.,,; <
GetSedeByID,,< G
(,,G H
idSede,,H N
),,N O
;,,O P
if.. 
(.. 
data.. 
!=.. 
null..  
)..  !
{// 
IList00 
<00 

SubSedeDto00 $
>00$ %
subsedes00& .
=00/ 0
await001 6
_unitOfWork007 B
.00B C
SedeRepository00C Q
.00Q R$
GetSubSedesByIdSedeAsync00R j
(00j k
idSede00k q
)00q r
;00r s
return11 
HttpResponseHelper11 -
.11- ."
SuccessfulObjectResult11. D
(11D E
subsedes11E M
)11M N
;11N O
}22 
else33 
{44 
return55 
HttpResponseHelper55 -
.55- .
Response55. 6
(556 7
StatusCodes557 B
.55B C
Status400BadRequest55C V
,55V W
new55X [
ResponseResult55\ j
(55j k
)55k l
{66 
IsError77 
=77  !
true77" &
,77& '
Message88 
=88  !
$str88" Z
}99 
)99 
;99 
}:: 
}<< 
catch== 
(== 
	Exception== 
ex== 
)==  
{>> 
return?? 
HttpResponseHelper?? )
.??) *
Response??* 2
(??2 3
StatusCodes??3 >
.??> ?(
Status500InternalServerError??? [
,??[ \
new??] `
ResponseResult??a o
(??o p
)??p q
{??r s
IsError??t {
=??| }
true	??~ Ç
,
??Ç É
Message
??Ñ ã
=
??å ç
ex
??é ê
.
??ê ë
Message
??ë ò
}
??ô ö
)
??ö õ
;
??õ ú
}@@ 
}AA 	
}BB 
}CC ù
ÇC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Interfaces\RepositoryPattern\ISedeRepository.cs
	namespace 	
FxSede
 
. 

Interfaces 
. 
RepositoryPattern -
{ 
public		 

	interface		 
ISedeRepository		 $
{

 
public 
Task 
< 
string 
> 
CreateSedeAsync +
(+ ,
Sede, 0
sede1 5
)5 6
;6 7
public 
Task 
< 
SedeDto 
> 
GetSedeByName *
(* +
string+ 1

nombreSede2 <
)< =
;= >
public 
Task 
< 
SedeDto 
> 
GetSedeByID (
(( )
string) /
idSede0 6
)6 7
;7 8
public 
Task 
< 
List 
< 

SubSedeDto #
># $
>$ %$
GetSubSedesByIdSedeAsync& >
(> ?
string? E
idSedeF L
)L M
;M N
public 
Task 
< 

SubSedeDto 
>  
GetSubSedesByIdAsync  4
(4 5
string5 ;
idSede< B
,B C
stringD J
	idSubSedeK T
)T U
;U V
public 
Task 
< 
List 
< 
SedeDto  
>  !
>! "
GetSedesAsync# 0
(0 1
)1 2
;2 3
public 
Task 
< 
string 
> 
PatchSedeAsync *
(* +
Sede+ /
sede0 4
,4 5
string6 <
idSede= C
)C D
;D E
public 
Task 
< 
bool 
> 
ExistsSedeAsync )
() *
string* 0

nombreSede1 ;
); <
;< =
public 
Task 
< 
bool 
> 
ExistsSubSedeAsync ,
(, -
string- 3
idSede4 :
,: ;
string< B
	idSubSedeC L
)L M
;M N
public 
Task 
< 

SubSedeDto 
> 
GetSubSedeByName  0
(0 1
string1 7
idSede8 >
,> ?
string@ F
nombreSubSedeG T
)T U
;U V
public 
Task 
< 
List 
< 
SedeDto  
>  !
>! "
GetSedesByServicio# 5
(5 6
string6 <

idServicio= G
)G H
;H I
public 
Task 
< 
string 
> 

AddSubSede &
(& '
SubSede' .
subsede/ 6
,6 7
string8 >
idSede? E
)E F
;F G
public 
Task 
< 
string 
> 
UpdateSubSede )
() *
SubSede* 1
subsede2 9
,9 :
string; A
idSedeB H
)H I
;I J
} 
} ‹
ÜC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Interfaces\RepositoryPattern\IServicioRepository.cs
	namespace 	
FxSede
 
. 

Interfaces 
. 
RepositoryPattern -
{ 
public 

	interface 
IServicioRepository (
{ 
public 
Task 
< 
bool 
>  
GetServicioByIdAsync .
(. /
string/ 5

idServicio6 @
)@ A
;A B
} 
}		 ò
~C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Interfaces\RepositoryPattern\IUnitOfWork.cs
	namespace 	
FxSede
 
. 

Interfaces 
. 
RepositoryPattern -
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ 
ISedeRepository 
SedeRepository &
{' (
get) ,
;, -
}. /
IServicioRepository 
ServicioRepository .
{/ 0
get1 4
;4 5
}6 7
}		 
}

 €
pC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Mappers\MappingProfileSede.cs
	namespace		 	
FxSede		
 
.		 
Mappers		 
{

 
public 

class 
MappingProfileSede #
:$ %
Profile& -
{ 
public 
MappingProfileSede !
(! "
)" #
{ 	
	CreateMap 
< 
	SedeInput 
,  
Sede! %
>% &
(& '
)' (
. 
	ForMember 
( 
dest 
=> 
dest  $
.$ %
Id% '
,' (
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
(L M
srcM P
.P Q

NombreSedeQ [
.[ \
Trim\ `
(` a
)a b
)b c
)c d
)d e
. 
	ForMember 
( 
dest 
=> 
dest  $
.$ %

NombreSede% /
,/ 0
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4

NombreSede4 >
.> ?
Trim? C
(C D
)D E
)E F
)F G
. 
	ForMember 
( 
dest 
=> 
dest  $
.$ %
UsuarioCreacion% 4
,4 5
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
Usuario4 ;
); <
)< =
. 
	ForMember 
( 
dest 
=> 
dest  $
.$ %
FechaCreacion% 2
,2 3
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
DateTime0 8
.8 9
UtcNow9 ?
)? @
)@ A
. 
	ForMember 
( 
dest 
=> 
dest  $
.$ %
SubSedes% -
,- .
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
new0 3
SubSede4 ;
[; <
]< =
{> ?
}@ A
)A B
)B C
;C D
} 	
} 
}   Ä
tC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Mappers\MappingProfileServicio.cs
	namespace 	
FxSede
 
. 
Mappers 
{ 
public 

class "
MappingProfileServicio '
:( )
Profile* 1
{		 
public

 "
MappingProfileServicio

 %
(

% &
)

& '
{ 	
	CreateMap 
< 
ServicioInput #
,# $
Servicio% -
>- .
(. /
)/ 0
;0 1
} 	
} 
} Œ
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Mappers\MappingProfileSubSede.cs
	namespace

 	
FxSede


 
.

 
Mappers

 
{ 
public 

class !
MappingProfileSubSede &
:' (
Profile) 0
{ 
public !
MappingProfileSubSede $
($ %
)% &
{ 	
	CreateMap 
< 
SubSedeInput "
," #
SubSede$ +
>+ ,
(, -
)- .
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
	IdSubSede( 1
,1 2
opt 
=> 
opt 
. 
MapFrom $
($ %
src% (
=>) +
SecurityHelper, :
.: ;
SHA256Encrypt; H
(H I
srcI L
.L M
NombreSubSedeM Z
.Z [
Trim[ _
(_ `
)` a
)a b
)b c
)c d
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
NombreSubSede( 5
,5 6
opt 
=> 
opt 
. 
MapFrom $
($ %
src% (
=>) +
src, /
./ 0
NombreSubSede0 =
.= >
Trim> B
(B C
)C D
)D E
)E F
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
UsuarioCreacion( 7
,7 8
opt 
=> 
opt 
. 
MapFrom $
($ %
src% (
=>) +
src, /
./ 0
Usuario0 7
)7 8
)8 9
. 
	ForMember 
( 
dest  
=>! #
dest$ (
.( )
FechaCreacion) 6
,6 7
opt 
=> 
opt 
. 
MapFrom $
($ %
src% (
=>) +
DateTime, 4
.4 5
UtcNow5 ;
); <
)< =
. 
	ForMember 
( 
dest  
=>! #
dest$ (
.( )
DiasOffline) 4
,4 5
opt 
=> 
opt 
. 
MapFrom #
(# $
src$ '
=>( *
src+ .
.. /
DiasOffline/ :
??; =
Array> C
.C D
EmptyD I
<I J
stringJ P
>P Q
(Q R
)R S
)S T
)T U
. 
	ForMember 
( 
dest !
=>" $
dest% )
.) *
TiemposOffline* 8
,8 9
opt 
=> 
opt 
. 
MapFrom #
(# $
src$ '
=>( *
src+ .
.. /
TiemposOffline/ =
??> @
ArrayA F
.F G
EmptyG L
<L M
TiempoOfflineInputM _
>_ `
(` a
)a b
.b c
ToListc i
(i j
)j k
)k l
)l m
;m n
} 	
} 
}!! ô
yC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Mappers\MappingProfileTiempoOffline.cs
	namespace 	
FxSede
 
. 
Mappers 
{ 
public 

class '
MappingProfileTiempoOffline ,
:- .
Profile/ 6
{		 
public

 '
MappingProfileTiempoOffline

 *
(

* +
)

+ ,
{ 	
	CreateMap 
< 
TiempoOfflineInput (
,( )
TiempoOffline* 7
>7 8
(8 9
)9 :
;: ;
} 	
} 
} ÷
xC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\DataTransferObjects\SedeDto.cs
	namespace 	
FxSede
 
. 
Models 
. 
DataTransferObjects +
{ 
[ 
OpenApiExample 
( 
typeof 
( 
ResponseSede '
)' (
)( )
]) *
public 

class 
SedeDto 
{		 
[

 	
OpenApiProperty

	 
(

 
Description

 $
=

% &
$str

' G
,

G H
Nullable

I Q
=

R S
false

T Y
)

Y Z
]

Z [
public 
string 
idSede 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' :
,: ;
Nullable< D
=E F
falseG L
)L M
]M N
public 
string 
nombre 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' =
,= >
Nullable? G
=H I
falseJ O
)O P
]P Q
public 
string 
	direccion 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' F
,F G
NullableH P
=Q R
falseS X
)X Y
]Y Z
public 
string 
telefono 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' D
,D E
NullableF N
=O P
falseQ V
)V W
]W X
public 
string 

horaInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' F
,F G
NullableH P
=Q R
falseS X
)X Y
]Y Z
public 
string 
horaFin 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' x
,x y
Nullable	z Ç
=
É Ñ
false
Ö ä
)
ä ã
]
ã å
public 
bool 
inactivarFestivos %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ¬
|C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\DataTransferObjects\ServicioDto.cs
	namespace 	
FxSede
 
. 
Models 
. 
DataTransferObjects +
{ 
public 

class 
ServicioDto 
{ 
public 
string 

idServicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
	prioridad 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
bool		 
activo		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} Ñ
{C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\DataTransferObjects\SubSedeDto.cs
	namespace 	
FxSede
 
. 
Models 
. 
DataTransferObjects +
{ 
public 

class 

SubSedeDto 
{ 
public 
string 
	idSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
public

 
string

 
nombre

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
string 

horaInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
horaFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
	intervalo 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
numeroPersonas !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
[ 
] 
diasOffline #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
List 
< 
TiempoOfflineDto $
>$ %
tiemposOffline& 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
List 
< 
ServicioDto 
>  
	servicios! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} Ï
ÅC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\DataTransferObjects\TiempoOfflineDto.cs
	namespace 	
FxSede
 
. 
Models 
. 
DataTransferObjects +
{ 
public 

class 
TiempoOfflineDto !
{ 
public 
string 

horaInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
horaFin 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
string		 
[		 
]		 
dias		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} ú
jC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\Entities\Sede.cs
	namespace 	
FxSede
 
. 
Models 
. 
Entities  
{ 
public 

class 
Sede 
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
 

NombreSede
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
public 
string 
	Direccion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Telefono 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
InactivarFestivos %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTimeOffset 
FechaCreacion +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
string 
UsuarioModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DateTimeOffset 
FechaModificacion /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public   
List   
<   
SubSede   
>   
SubSedes   %
{  & '
get  ( +
;  + ,
set  - 0
;  0 1
}  2 3
}!! 
}"" ¶
nC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\Entities\Servicio.cs
	namespace 	
FxSede
 
. 
Models 
. 
Entities  
{ 
public 

class 
Servicio 
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
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
public		 
int		 
	Prioridad		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} ±
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\Entities\SubSede.cs
	namespace 	
FxSede
 
. 
Models 
. 
Entities  
{ 
public 

class 
SubSede 
{ 
public 
string 
	IdSubSede 
{  !
get" %
;% &
set' *
;* +
}, -
public

 
string

 
NombreSubSede

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
IntervaloAtencion $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int "
NumeroPersonasAtencion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
[ 
] 
DiasOffline #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTimeOffset 
FechaCreacion +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
string 
UsuarioModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DateTimeOffset 
FechaModificacion /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public   
List   
<   
TiempoOffline   !
>  ! "
TiemposOffline  # 1
{  2 3
get  4 7
;  7 8
set  9 <
;  < =
}  > ?
public"" 
List"" 
<"" 
Servicio"" 
>"" 
	Servicios"" '
{""( )
get""* -
;""- .
set""/ 2
;""2 3
}""4 5
}## 
}$$ œ
sC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\Entities\TiempoOffline.cs
	namespace 	
FxSede
 
. 
Models 
. 
Entities  
{ 
public 

class 
TiempoOffline 
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
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
string		 
[		 
]		 
Dias		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} ö)
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\Input\SedeInput.cs
	namespace 	
FxSede
 
. 
Models 
. 
Input 
{ 
[		 
OpenApiExample		 
(		 
typeof		 
(		 
SedeExample		 &
)		& '
)		' (
]		( )
public

 

class

 
	SedeInput

 
{ 
[ 	
JsonProperty	 
( 
$str 
, 
Required  (
=) *
Required+ 3
.3 4
Always4 :
): ;
]; <
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' :
,: ;
Nullable< D
=E F
falseG L
)L M
]M N
public 
string 

NombreSede  
{! "
get# &
;& '
set( +
;+ ,
}- .
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
]> ?
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' =
,= >
Nullable? G
=H I
falseJ O
)O P
]P Q
public 
string 
	Direccion 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonProperty	 
( 
$str  
,  !
Required" *
=+ ,
Required- 5
.5 6
Always6 <
)< =
]= >
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' F
,F G
NullableH P
=Q R
falseS X
)X Y
]Y Z
public 
string 
Telefono 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
JsonProperty	 
( 
$str "
," #
Required$ ,
=- .
Required/ 7
.7 8
Always8 >
)> ?
]? @
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' D
,D E
NullableF N
=O P
falseQ V
)V W
]W X
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
JsonProperty	 
( 
$str 
,  
Required! )
=* +
Required, 4
.4 5
Always5 ;
); <
]< =
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' F
,F G
NullableH P
=Q R
falseS X
)X Y
]Y Z
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
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
$str!!' x
,!!x y
Nullable	!!z Ç
=
!!É Ñ
false
!!Ö ä
)
!!ä ã
]
!!ã å
public"" 
bool"" 
InactivarFestivos"" %
{""& '
get""( +
;""+ ,
set""- 0
;""0 1
}""2 3
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
]$$< =
[%% 	
OpenApiProperty%%	 
(%% 
Description%% $
=%%% &
$str%%' R
,%%R S
Nullable%%T \
=%%] ^
true%%_ c
)%%c d
]%%d e
public&& 
bool&& 
?&& 
Activo&& 
{&& 
get&& !
;&&! "
set&&# &
;&&& '
}&&( )
=&&* +
true&&, 0
;&&0 1
[(( 	
JsonProperty((	 
((( 
$str(( 
,((  
Required((! )
=((* +
Required((, 4
.((4 5
Always((5 ;
)((; <
]((< =
[)) 	
OpenApiProperty))	 
()) 
Description)) $
=))% &
$str))' I
,))I J
Nullable))K S
=))T U
true))V Z
)))Z [
]))[ \
public** 
string** 
Usuario** 
{** 
get**  #
;**# $
set**% (
;**( )
}*** +
}++ 
},, ™
pC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\Input\ServicioInput.cs
	namespace 	
FxSede
 
. 
Models 
. 
Input 
{ 
public 

class 
ServicioInput 
{ 
[ 	
JsonProperty	 
( 
$str "
," #
Required$ ,
=- .
Required/ 7
.7 8
Always8 >
)> ?
]? @
public 
string 

IdServicio  
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
 
,

 
Required

  (
=

) *
Required

+ 3
.

3 4
Default

4 ;
)

; <
]

< =
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
$str !
,! "
Required# +
=, -
Required. 6
.6 7
Always7 =
)= >
]> ?
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
} Î&
oC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\Input\SubSedeInput.cs
	namespace 	
FxSede
 
. 
Models 
. 
Input 
{ 
public 

class 
SubSedeInput 
{		 
[ 	
JsonProperty	 
( 
$str !
,! "
Required# +
=, -
Required. 6
.6 7
Default7 >
)> ?
]? @
public 
string 
? 
	IdSubSede  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
JsonProperty	 
( 
$str #
,# $
Required% -
=. /
Required0 8
.8 9
Default9 @
)@ A
]A B
public 
string 
[ 
] 
? 
DiasOffline $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
JsonProperty	 
( 
$str &
,& '
Required( 0
=1 2
Required3 ;
.; <
Default< C
)C D
]D E
public 
List 
< 
TiempoOfflineInput &
>& '
?' (
TiemposOffline) 7
{8 9
get: =
;= >
set? B
;B C
}D E
[ 	
JsonProperty	 
( 
$str 
, 
Required  (
=) *
Required+ 3
.3 4
Always4 :
): ;
]; <
public 
string 
NombreSubSede #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
JsonProperty	 
( 
$str "
," #
Required$ ,
=- .
Required/ 7
.7 8
Always8 >
)> ?
]? @
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
JsonProperty	 
( 
$str 
,  
Required! )
=* +
Required, 4
.4 5
Always5 ;
); <
]< =
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str !
,! "
Required# +
=, -
Required. 6
.6 7
Always7 =
)= >
]> ?
public   
int   
IntervaloAtencion   $
{  % &
get  ' *
;  * +
set  , /
;  / 0
}  1 2
["" 	
JsonProperty""	 
("" 
$str"" &
,""& '
Required""( 0
=""1 2
Required""3 ;
.""; <
Always""< B
)""B C
]""C D
public## 
int## "
NumeroPersonasAtencion## )
{##* +
get##, /
;##/ 0
set##1 4
;##4 5
}##6 7
[%% 	
JsonProperty%%	 
(%% 
$str%% 
,%%  
Required%%! )
=%%* +
Required%%, 4
.%%4 5
Always%%5 ;
)%%; <
]%%< =
public&& 
string&& 
Usuario&& 
{&& 
get&&  #
;&&# $
set&&% (
;&&( )
}&&* +
[(( 	
JsonProperty((	 
((( 
$str(( !
,((! "
Required((# +
=((, -
Required((. 6
.((6 7
Always((7 =
)((= >
]((> ?
[)) 	
Required))	 
,)) 
	MinLength)) 
()) 
$num)) 
))) 
]))  
public** 
List** 
<** 
ServicioInput** !
>**! "
	Servicios**# ,
{**- .
get**/ 2
;**2 3
set**4 7
;**7 8
}**9 :
[,, 	
JsonProperty,,	 
(,, 
$str,, 
,,, 
Required,,  (
=,,) *
Required,,+ 3
.,,3 4
Always,,4 :
),,: ;
],,; <
public-- 
bool-- 
Activo-- 
{-- 
get--  
;--  !
set--" %
;--% &
}--' (
[// 	

JsonIgnore//	 
]// 
public00 
string00 
idSede00 
{00 
get00 "
;00" #
set00$ '
;00' (
}00) *
}11 
}22 ≤
uC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\Input\TiempoOfflineInput.cs
	namespace 	
FxSede
 
. 
Models 
. 
Input 
{ 
public 

class 
TiempoOfflineInput #
{ 
[		 	
JsonProperty			 
(		 
$str		 "
,		" #
Required		$ ,
=		- .
Required		/ 7
.		7 8
Always		8 >
)		> ?
]		? @
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
- .
[ 	
JsonProperty	 
( 
$str 
,  
Required! )
=* +
Required, 4
.4 5
Always5 ;
); <
]< =
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonProperty	 
( 
$str 
, 
Required &
=' (
Required) 1
.1 2
Always2 8
)8 9
]9 :
[ 	
Required	 
, 
	MinLength 
( 
$num 
) 
,  
	MaxLength  )
() *
$num* +
)+ ,
], -
public 
string 
[ 
] 
Dias 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} û
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Models\ResponseResult.cs
	namespace		 	
FxSede		
 
.		 
Models		 
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
} Î

sC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\OpenApi\ResponseResultExample.cs
	namespace

 	
FxSede


 
.

 
OpenApi

 
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
} ¿
jC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\OpenApi\ResponseSede.cs
	namespace 	
FxSede
 
. 
OpenApi 
{		 
public

 

class

 
ResponseSede

 
:

 
OpenApiExample

  .
<

. /
SedeDto

/ 6
>

6 7
{ 
public 
override 
IOpenApiExample '
<' (
SedeDto( /
>/ 0
Build1 6
(6 7
NamingStrategy7 E
namingStrategyF T
=U V
nullW [
)[ \
{ 	
Examples 
. 
Add 
( "
OpenApiExampleResolver &
.& '
Resolve' .
(. /
$str ,
,, -
new 
SedeDto 
(  
)  !
{ 
idSede 
=  
$str! e
,e f
nombre 
=  
$str! 4
,4 5
	direccion !
=" #
$str$ ;
,; <
telefono  
=! "
$str# ,
,, -

horaInicio "
=# $
$str% ,
,, -
horaFin 
=  !
$str" )
,) *
inactivarFestivos )
=* +
true, 0
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
}!! ç
iC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\OpenApi\SedeExample.cs
	namespace 	
FxSede
 
. 
OpenApi 
{		 
public

 

class

 
SedeExample

 
:

 
OpenApiExample

 -
<

- .
	SedeInput

. 7
>

7 8
{ 
public 
override 
IOpenApiExample '
<' (
	SedeInput( 1
>1 2
Build3 8
(8 9
NamingStrategy9 G
namingStrategyH V
=W X
nullY ]
)] ^
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
new 
	SedeInput !
(! "
)" #
{ 

NombreSede "
=# $
$str% ,
,, -
	Direccion !
=" #
$str$ 8
,8 9
Telefono  
=! "
$str# /
,/ 0

HoraInicio "
=# $
$str% ,
,, -
HoraFin 
=  !
$str" )
,) *
InactivarFestivos )
=* +
true, 0
,0 1
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
}"" Ò
qC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Repositories\RepositoryBase.cs
	namespace 	
FxSede
 
. 
Repositories 
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
} É˜
qC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Repositories\SedeRepository.cs
	namespace 	
FxSede
 
. 
Repositories 
{ 
public 

class 
SedeRepository 
:  !
RepositoryBase" 0
,0 1
ISedeRepository2 A
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
SedeRepository 
( 
CosmosClient *
client+ 1
,1 2
IConfiguration3 A
configurationB O
)O P
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
$str/ >
]> ?
;? @
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
} 	
public## 
async## 
Task## 
<## 
string##  
>##  !
CreateSedeAsync##" 1
(##1 2
Sede##2 6
sede##7 ;
)##; <
{$$ 	
try%% 
{&& 
ItemResponse'' 
<'' 
Servicio'' %
>''% &
itemResponse''' 3
=''4 5
await''6 ;
	container''< E
.''E F
ReadItemAsync''F S
<''S T
Servicio''T \
>''\ ]
(''] ^
sede''^ b
.''b c
Id''c e
,''e f
new''g j
PartitionKey''k w
(''w x
sede''x |
.''| }
Id''} 
)	'' Ä
)
''Ä Å
;
''Å Ç
return(( 
itemResponse(( #
==(($ &
null((' +
?((, -
$str((. 2
:((3 4
$str((5 <
;((< =
})) 
catch** 
(** 
CosmosException** "
ex**# %
)**% &
when**' +
(**, -
ex**- /
.**/ 0

StatusCode**0 :
==**; =
HttpStatusCode**> L
.**L M
NotFound**M U
)**U V
{++ 
var,, 
result,, 
=,, 
await,, "
	container,,# ,
.,,, -
CreateItemAsync,,- <
(,,< =
sede,,= A
,,,A B
new,,C F
PartitionKey,,G S
(,,S T
sede,,T X
.,,X Y
Id,,Y [
),,[ \
),,\ ]
;,,] ^
if-- 
(-- 
result-- 
.-- 

StatusCode-- %
.--% &
ToString--& .
(--. /
)--/ 0
is--1 3
$str--4 =
)--= >
return.. 
sede.. 
...  
Id..  "
;.." #
return// 
$str// 
;// 
}00 
}11 	
public33 
async33 
Task33 
<33 
bool33 
>33 
ExistsSedeAsync33  /
(33/ 0
string330 6

nombreSede337 A
)33A B
{44 	
SedeDto55 
data55 
=55 
null55 
;55  
try66 
{77 
var88 
queryString88 
=88  !
$str8A" =
;AA= >
varCC 
queryDefCC 
=CC 
newCC "
QueryDefinitionCC# 2
(CC2 3
queryStringCC3 >
)CC> ?
;CC? @
queryDefDD 
.DD 
WithParameterDD &
(DD& '
$strDD' 0
,DD0 1

nombreSedeDD2 <
)DD< =
;DD= >
queryDefEE 
.EE 
WithParameterEE &
(EE& '
$strEE' 0
,EE0 1
trueEE2 6
)EE6 7
;EE7 8
varFF 
queryFF 
=FF 
	containerFF %
.FF% & 
GetItemQueryIteratorFF& :
<FF: ;
SedeDtoFF; B
>FFB C
(FFC D
queryDefFFD L
)FFL M
;FFM N
whileHH 
(HH 
queryHH 
.HH 
HasMoreResultsHH +
)HH+ ,
{II 
varJJ 
responseJJ  
=JJ! "
awaitJJ# (
queryJJ) .
.JJ. /
ReadNextAsyncJJ/ <
(JJ< =
)JJ= >
;JJ> ?
dataKK 
=KK 
responseKK #
.KK# $
FirstOrDefaultKK$ 2
(KK2 3
)KK3 4
;KK4 5
}LL 
returnNN 
dataNN 
!=NN 
nullNN #
;NN# $
}OO 
catchPP 
(PP 
CosmosExceptionPP "
exPP# %
)PP% &
whenPP' +
(PP, -
exPP- /
.PP/ 0

StatusCodePP0 :
==PP; =
HttpStatusCodePP> L
.PPL M
NotFoundPPM U
)PPU V
{QQ 
returnRR 
falseRR 
;RR 
}SS 
}TT 	
publicVV 
asyncVV 
TaskVV 
<VV 
SedeDtoVV !
>VV! "
GetSedeByNameVV# 0
(VV0 1
stringVV1 7

nombreSedeVV8 B
)VVB C
{WW 	
SedeDtoXX 
sedeDtoXX 
=XX 
nullXX "
;XX" #
tryYY 
{ZZ 
var[[ 
queryString[[ 
=[[  !
$str[d" V
;ddV W
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
$strgg' 0
,gg0 1
truegg2 6
)gg6 7
;gg7 8
queryDefhh 
.hh 
WithParameterhh &
(hh& '
$strhh' 4
,hh4 5

nombreSedehh6 @
)hh@ A
;hhA B
varjj 
queryjj 
=jj 
	containerjj %
.jj% & 
GetItemQueryIteratorjj& :
<jj: ;
SedeDtojj; B
>jjB C
(jjC D
queryDefjjD L
)jjL M
;jjM N
whilekk 
(kk 
querykk 
.kk 
HasMoreResultskk +
)kk+ ,
{ll 
varmm 
responsemm  
=mm! "
awaitmm# (
querymm) .
.mm. /
ReadNextAsyncmm/ <
(mm< =
)mm= >
;mm> ?
sedeDtonn 
=nn 
responsenn &
.nn& '
SingleOrDefaultnn' 6
(nn6 7
)nn7 8
;nn8 9
}oo 
returnqq 
sedeDtoqq 
;qq 
}rr 
catchss 
(ss 
CosmosExceptionss "
exss# %
)ss% &
whenss' +
(ss, -
exss- /
.ss/ 0

StatusCodess0 :
==ss; =
HttpStatusCodess> L
.ssL M
NotFoundssM U
)ssU V
{tt 
returnuu 
sedeDtouu 
;uu 
}vv 
}ww 	
publiczz 
asynczz 
Taskzz 
<zz 
SedeDtozz !
>zz! "
GetSedeByIDzz# .
(zz. /
stringzz/ 5
idSedezz6 <
)zz< =
{{{ 	
SedeDto|| 
sedeDto|| 
=|| 
null|| "
;||" #
try}} 
{~~ 
var 
queryString 
=  !
$str	à" J
;
ààJ K
var
ää 
queryDef
ää 
=
ää 
new
ää "
QueryDefinition
ää# 2
(
ää2 3
queryString
ää3 >
)
ää> ?
;
ää? @
queryDef
ãã 
.
ãã 
WithParameter
ãã &
(
ãã& '
$str
ãã' 0
,
ãã0 1
true
ãã2 6
)
ãã6 7
;
ãã7 8
queryDef
åå 
.
åå 
WithParameter
åå &
(
åå& '
$str
åå' 0
,
åå0 1
idSede
åå2 8
)
åå8 9
;
åå9 :
var
éé 
query
éé 
=
éé 
	container
éé %
.
éé% &"
GetItemQueryIterator
éé& :
<
éé: ;
SedeDto
éé; B
>
ééB C
(
ééC D
queryDef
ééD L
)
ééL M
;
ééM N
while
èè 
(
èè 
query
èè 
.
èè 
HasMoreResults
èè +
)
èè+ ,
{
êê 
var
ëë 
response
ëë  
=
ëë! "
await
ëë# (
query
ëë) .
.
ëë. /
ReadNextAsync
ëë/ <
(
ëë< =
)
ëë= >
;
ëë> ?
sedeDto
íí 
=
íí 
response
íí &
.
íí& '
SingleOrDefault
íí' 6
(
íí6 7
)
íí7 8
;
íí8 9
}
ìì 
return
ïï 
sedeDto
ïï 
;
ïï 
}
ññ 
catch
óó 
(
óó 
CosmosException
óó "
ex
óó# %
)
óó% &
when
óó' +
(
óó, -
ex
óó- /
.
óó/ 0

StatusCode
óó0 :
==
óó; =
HttpStatusCode
óó> L
.
óóL M
NotFound
óóM U
)
óóU V
{
òò 
return
ôô 
sedeDto
ôô 
;
ôô 
}
öö 
}
õõ 	
public
ùù 
async
ùù 
Task
ùù 
<
ùù 
List
ùù 
<
ùù 
SedeDto
ùù &
>
ùù& '
>
ùù' (
GetSedesAsync
ùù) 6
(
ùù6 7
)
ùù7 8
{
ûû 	
var
üü 
queryString
üü 
=
üü 
$str
ü® 7
;
®®7 8
var
™™ 
queryDef
™™ 
=
™™ 
new
™™ 
QueryDefinition
™™ .
(
™™. /
queryString
™™/ :
)
™™: ;
;
™™; <
queryDef
´´ 
.
´´ 
WithParameter
´´ "
(
´´" #
$str
´´# ,
,
´´, -
true
´´. 2
)
´´2 3
;
´´3 4
var
≠≠ 
query
≠≠ 
=
≠≠ 
	container
≠≠ !
.
≠≠! ""
GetItemQueryIterator
≠≠" 6
<
≠≠6 7
SedeDto
≠≠7 >
>
≠≠> ?
(
≠≠? @
queryDef
≠≠@ H
)
≠≠H I
;
≠≠I J
var
ØØ 
sedes
ØØ 
=
ØØ 
new
ØØ 
List
ØØ  
<
ØØ  !
SedeDto
ØØ! (
>
ØØ( )
(
ØØ) *
)
ØØ* +
;
ØØ+ ,
while
±± 
(
±± 
query
±± 
.
±± 
HasMoreResults
±± '
)
±±' (
{
≤≤ 
var
≥≥ 
response
≥≥ 
=
≥≥ 
await
≥≥ $
query
≥≥% *
.
≥≥* +
ReadNextAsync
≥≥+ 8
(
≥≥8 9
)
≥≥9 :
;
≥≥: ;
sedes
¥¥ 
.
¥¥ 
AddRange
¥¥ 
(
¥¥ 
response
¥¥ '
.
¥¥' (
ToList
¥¥( .
(
¥¥. /
)
¥¥/ 0
)
¥¥0 1
;
¥¥1 2
}
µµ 
return
∑∑ 
sedes
∑∑ 
;
∑∑ 
}
∏∏ 	
public
∫∫ 
async
∫∫ 
Task
∫∫ 
<
∫∫ 
string
∫∫  
>
∫∫  !
PatchSedeAsync
∫∫" 0
(
∫∫0 1
Sede
∫∫1 5
sede
∫∫6 :
,
∫∫: ;
string
∫∫< B
idSede
∫∫C I
)
∫∫I J
{
ªª 	
try
ºº 
{
ΩΩ 
sede
ææ 
.
ææ 
Id
ææ 
=
ææ 
idSede
ææ  
;
ææ  !
var
øø 
result
øø 
=
øø 
await
øø "
	container
øø# ,
.
øø, -
PatchItemAsync
øø- ;
<
øø; <
Sede
øø< @
>
øø@ A
(
øøA B
idSede
øøB H
,
øøH I
new
øøJ M
PartitionKey
øøN Z
(
øøZ [
idSede
øø[ a
)
øøa b
,
øøb c
new
¿¿ 
[
¿¿ 
]
¿¿ 
{
¿¿ 
PatchOperation
¿¿ ,
.
¿¿, -
Set
¿¿- 0
(
¿¿0 1
$str
¿¿1 >
,
¿¿> ?
sede
¿¿@ D
.
¿¿D E

NombreSede
¿¿E O
.
¿¿O P
Trim
¿¿P T
(
¿¿T U
)
¿¿U V
)
¿¿V W
,
¿¿W X
PatchOperation
¡¡ (
.
¡¡( )
Set
¡¡) ,
(
¡¡, -
$str
¡¡- 9
,
¡¡9 :
sede
¡¡; ?
.
¡¡? @
	Direccion
¡¡@ I
)
¡¡I J
,
¡¡J K
PatchOperation
¬¬ (
.
¬¬( )
Set
¬¬) ,
(
¬¬, -
$str
¬¬- 8
,
¬¬8 9
sede
¬¬: >
.
¬¬> ?
Telefono
¬¬? G
)
¬¬G H
,
¬¬H I
PatchOperation
√√ (
.
√√( )
Set
√√) ,
(
√√, -
$str
√√- :
,
√√: ;
sede
√√< @
.
√√@ A

HoraInicio
√√A K
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
ƒƒ- 7
,
ƒƒ7 8
sede
ƒƒ9 =
.
ƒƒ= >
HoraFin
ƒƒ> E
)
ƒƒE F
,
ƒƒF G
PatchOperation
≈≈ (
.
≈≈( )
Set
≈≈) ,
(
≈≈, -
$str
≈≈- A
,
≈≈A B
sede
≈≈C G
.
≈≈G H
InactivarFestivos
≈≈H Y
)
≈≈Y Z
,
≈≈Z [
PatchOperation
∆∆ (
.
∆∆( )
Set
∆∆) ,
(
∆∆, -
$str
∆∆- 6
,
∆∆6 7
sede
∆∆8 <
.
∆∆< =
Activo
∆∆= C
)
∆∆C D
,
∆∆D E
PatchOperation
«« (
.
««( )
Set
««) ,
(
««, -
$str
««- C
,
««C D
sede
««E I
.
««I J!
UsuarioModificacion
««J ]
)
««] ^
,
««^ _
PatchOperation
»» (
.
»»( )
Set
»») ,
(
»», -
$str
»»- A
,
»»A B
sede
»»C G
.
»»G H
FechaModificacion
»»H Y
)
»»Y Z
}
»»Z [
)
»»[ \
;
»»\ ]
return
…… 
result
…… 
.
…… 

StatusCode
…… (
.
……( )
ToString
……) 1
(
……1 2
)
……2 3
;
……3 4
}
   
catch
ÀÀ 
(
ÀÀ 
	Exception
ÀÀ 
ex
ÀÀ 
)
ÀÀ  
{
ÃÃ 
return
ÕÕ 
ex
ÕÕ 
.
ÕÕ 
Message
ÕÕ !
;
ÕÕ! "
}
ŒŒ 
}
œœ 	
public
’’ 
async
’’ 
Task
’’ 
<
’’ 
bool
’’ 
>
’’  
ExistsSubSedeAsync
’’  2
(
’’2 3
string
’’3 9
idSede
’’: @
,
’’@ A
string
’’B H
	idSubSede
’’I R
)
’’R S
{
÷÷ 	
try
◊◊ 
{
ÿÿ 
ItemResponse
ŸŸ 
<
ŸŸ 
Sede
ŸŸ !
>
ŸŸ! "
sede
ŸŸ# '
=
ŸŸ( )
await
ŸŸ* /
	container
ŸŸ0 9
.
ŸŸ9 :
ReadItemAsync
ŸŸ: G
<
ŸŸG H
Sede
ŸŸH L
>
ŸŸL M
(
ŸŸM N
idSede
ŸŸN T
,
ŸŸT U
new
ŸŸV Y
PartitionKey
ŸŸZ f
(
ŸŸf g
idSede
ŸŸg m
)
ŸŸm n
)
ŸŸn o
;
ŸŸo p
return
⁄⁄ 
sede
⁄⁄ 
.
⁄⁄ 
Resource
⁄⁄ $
.
⁄⁄$ %
SubSedes
⁄⁄% -
.
⁄⁄- .
Any
⁄⁄. 1
(
⁄⁄1 2
ss
⁄⁄2 4
=>
⁄⁄5 7
ss
⁄⁄8 :
.
⁄⁄: ;
	IdSubSede
⁄⁄; D
==
⁄⁄E G
	idSubSede
⁄⁄H Q
)
⁄⁄Q R
;
⁄⁄R S
}
€€ 
catch
‹‹ 
(
‹‹ 
CosmosException
‹‹ "
ex
‹‹# %
)
‹‹% &
when
‹‹' +
(
‹‹, -
ex
‹‹- /
.
‹‹/ 0

StatusCode
‹‹0 :
==
‹‹; =
HttpStatusCode
‹‹> L
.
‹‹L M
NotFound
‹‹M U
)
‹‹U V
{
›› 
return
ﬁﬁ 
false
ﬁﬁ 
;
ﬁﬁ 
}
ﬂﬂ 
}
‡‡ 	
public
‚‚ 
async
‚‚ 
Task
‚‚ 
<
‚‚ 

SubSedeDto
‚‚ $
>
‚‚$ %
GetSubSedeByName
‚‚& 6
(
‚‚6 7
string
‚‚7 =
idSede
‚‚> D
,
‚‚D E
string
‚‚F L
nombreSubSede
‚‚M Z
)
‚‚Z [
{
„„ 	

SubSedeDto
‰‰ 
data
‰‰ 
=
‰‰ 
null
‰‰ "
;
‰‰" #
try
ÂÂ 
{
ÊÊ 
var
ÁÁ 
queryString
ÁÁ 
=
ÁÁ  !
$str
ÁÙ" D
;
ÙÙD E
var
ˆˆ 
queryDef
ˆˆ 
=
ˆˆ 
new
ˆˆ "
QueryDefinition
ˆˆ# 2
(
ˆˆ2 3
queryString
ˆˆ3 >
)
ˆˆ> ?
;
ˆˆ? @
queryDef
˜˜ 
.
˜˜ 
WithParameter
˜˜ &
(
˜˜& '
$str
˜˜' 0
,
˜˜0 1
idSede
˜˜2 8
)
˜˜8 9
;
˜˜9 :
queryDef
¯¯ 
.
¯¯ 
WithParameter
¯¯ &
(
¯¯& '
$str
¯¯' 0
,
¯¯0 1
true
¯¯2 6
)
¯¯6 7
;
¯¯7 8
queryDef
˘˘ 
.
˘˘ 
WithParameter
˘˘ &
(
˘˘& '
$str
˘˘' 7
,
˘˘7 8
nombreSubSede
˘˘9 F
)
˘˘F G
;
˘˘G H
var
˙˙ 
query
˙˙ 
=
˙˙ 
	container
˙˙ %
.
˙˙% &"
GetItemQueryIterator
˙˙& :
<
˙˙: ;

SubSedeDto
˙˙; E
>
˙˙E F
(
˙˙F G
queryDef
˙˙G O
)
˙˙O P
;
˙˙P Q
while
¸¸ 
(
¸¸ 
query
¸¸ 
.
¸¸ 
HasMoreResults
¸¸ +
)
¸¸+ ,
{
˝˝ 
var
˛˛ 
response
˛˛  
=
˛˛! "
await
˛˛# (
query
˛˛) .
.
˛˛. /
ReadNextAsync
˛˛/ <
(
˛˛< =
)
˛˛= >
;
˛˛> ?
data
ˇˇ 
=
ˇˇ 
response
ˇˇ #
.
ˇˇ# $
SingleOrDefault
ˇˇ$ 3
(
ˇˇ3 4
)
ˇˇ4 5
;
ˇˇ5 6
}
ÄÄ 
return
ÇÇ 
data
ÇÇ 
;
ÇÇ 
}
ÉÉ 
catch
ÑÑ 
(
ÑÑ 
CosmosException
ÑÑ "
ex
ÑÑ# %
)
ÑÑ% &
when
ÑÑ' +
(
ÑÑ, -
ex
ÑÑ- /
.
ÑÑ/ 0

StatusCode
ÑÑ0 :
==
ÑÑ; =
HttpStatusCode
ÑÑ> L
.
ÑÑL M
NotFound
ÑÑM U
)
ÑÑU V
{
ÖÖ 
return
ÜÜ 
data
ÜÜ 
;
ÜÜ 
}
áá 
}
àà 	
public
ãã 
async
ãã 
Task
ãã 
<
ãã 
List
ãã 
<
ãã 

SubSedeDto
ãã )
>
ãã) *
>
ãã* +&
GetSubSedesByIdSedeAsync
ãã, D
(
ããD E
string
ããE K
idSede
ããL R
)
ããR S
{
åå 	
var
çç 
queryString
çç 
=
çç 
$str
çô ^
;
ôô^ _
var
õõ 
queryDef
õõ 
=
õõ 
new
õõ 
QueryDefinition
õõ .
(
õõ. /
queryString
õõ/ :
)
õõ: ;
;
õõ; <
queryDef
úú 
.
úú 
WithParameter
úú "
(
úú" #
$str
úú# ,
,
úú, -
true
úú. 2
)
úú2 3
;
úú3 4
queryDef
ùù 
.
ùù 
WithParameter
ùù "
(
ùù" #
$str
ùù# ,
,
ùù, -
idSede
ùù. 4
)
ùù4 5
;
ùù5 6
var
üü 
query
üü 
=
üü 
	container
üü !
.
üü! ""
GetItemQueryIterator
üü" 6
<
üü6 7

SubSedeDto
üü7 A
>
üüA B
(
üüB C
queryDef
üüC K
)
üüK L
;
üüL M
List
°° 
<
°° 

SubSedeDto
°° 
>
°° 
subsedes
°° %
=
°°& '
new
°°( +
(
°°, -
)
°°- .
;
°°. /
while
££ 
(
££ 
query
££ 
.
££ 
HasMoreResults
££ '
)
££' (
{
§§ 
var
•• 
response
•• 
=
•• 
await
•• $
query
••% *
.
••* +
ReadNextAsync
••+ 8
(
••8 9
)
••9 :
;
••: ;
subsedes
¶¶ 
.
¶¶ 
AddRange
¶¶ !
(
¶¶! "
response
¶¶" *
.
¶¶* +
ToList
¶¶+ 1
(
¶¶1 2
)
¶¶2 3
)
¶¶3 4
;
¶¶4 5
}
ßß 
return
©© 
subsedes
©© 
;
©© 
}
™™ 	
public
≠≠ 
async
≠≠ 
Task
≠≠ 
<
≠≠ 
List
≠≠ 
<
≠≠ 
SedeDto
≠≠ &
>
≠≠& '
>
≠≠' ( 
GetSedesByServicio
≠≠) ;
(
≠≠; <
string
≠≠< B

idServicio
≠≠C M
)
≠≠M N
{
ÆÆ 	
var
ØØ 
queryString
ØØ 
=
ØØ 
$str
Øª P
;
ªªP Q
var
ΩΩ 
queryDef
ΩΩ 
=
ΩΩ 
new
ΩΩ 
QueryDefinition
ΩΩ .
(
ΩΩ. /
queryString
ΩΩ/ :
)
ΩΩ: ;
;
ΩΩ; <
queryDef
ææ 
.
ææ 
WithParameter
ææ "
(
ææ" #
$str
ææ# ,
,
ææ, -
true
ææ. 2
)
ææ2 3
;
ææ3 4
queryDef
øø 
.
øø 
WithParameter
øø "
(
øø" #
$str
øø# 0
,
øø0 1

idServicio
øø2 <
)
øø< =
;
øø= >
var
¡¡ 
query
¡¡ 
=
¡¡ 
	container
¡¡ !
.
¡¡! ""
GetItemQueryIterator
¡¡" 6
<
¡¡6 7
SedeDto
¡¡7 >
>
¡¡> ?
(
¡¡? @
queryDef
¡¡@ H
)
¡¡H I
;
¡¡I J
var
√√ 
sedes
√√ 
=
√√ 
new
√√ 
List
√√  
<
√√  !
SedeDto
√√! (
>
√√( )
(
√√) *
)
√√* +
;
√√+ ,
while
≈≈ 
(
≈≈ 
query
≈≈ 
.
≈≈ 
HasMoreResults
≈≈ '
)
≈≈' (
{
∆∆ 
var
«« 
response
«« 
=
«« 
await
«« $
query
««% *
.
««* +
ReadNextAsync
««+ 8
(
««8 9
)
««9 :
;
««: ;
sedes
»» 
.
»» 
AddRange
»» 
(
»» 
response
»» '
.
»»' (
ToList
»»( .
(
»». /
)
»»/ 0
)
»»0 1
;
»»1 2
}
…… 
return
ÀÀ 
sedes
ÀÀ 
;
ÀÀ 
}
ÃÃ 	
public
ŒŒ 
async
ŒŒ 
Task
ŒŒ 
<
ŒŒ 
string
ŒŒ  
>
ŒŒ  !

AddSubSede
ŒŒ" ,
(
ŒŒ, -
SubSede
ŒŒ- 4
subsede
ŒŒ5 <
,
ŒŒ< =
string
ŒŒ> D
idSede
ŒŒE K
)
ŒŒK L
{
œœ 	
try
—— 
{
““ 
ItemResponse
”” 
<
”” 
Sede
”” !
>
””! "
itemResponse
””# /
=
””0 1
await
””2 7
	container
””8 A
.
””A B
ReadItemAsync
””B O
<
””O P
Sede
””P T
>
””T U
(
””U V
idSede
””V \
,
””\ ]
new
””^ a
PartitionKey
””b n
(
””n o
idSede
””o u
)
””u v
)
””v w
;
””w x
if
‘‘ 
(
‘‘ 
itemResponse
‘‘  
!=
‘‘! #
null
‘‘$ (
)
‘‘( )
{
’’ 
await
÷÷ 
	container
÷÷ #
.
÷÷# $
PatchItemAsync
÷÷$ 2
<
÷÷2 3
Sede
÷÷3 7
>
÷÷7 8
(
÷÷8 9
idSede
÷÷9 ?
,
÷÷? @
new
÷÷A D
PartitionKey
÷÷E Q
(
÷÷Q R
idSede
÷÷R X
)
÷÷X Y
,
÷÷Y Z
new
ÿÿ 
[
ÿÿ 
]
ÿÿ 
{
ÿÿ 
PatchOperation
ŸŸ #
.
ŸŸ# $
Add
ŸŸ$ '
(
ŸŸ' (
$"
ŸŸ( *
$str
ŸŸ* 5
"
ŸŸ5 6
,
ŸŸ6 7
subsede
ŸŸ8 ?
)
ŸŸ? @
}
⁄⁄ 
)
⁄⁄ 
;
⁄⁄ 
return
€€ 
subsede
€€ "
.
€€" #
	IdSubSede
€€# ,
;
€€, -
}
‹‹ 
else
›› 
{
ﬁﬁ 
return
ﬂﬂ 
$str
ﬂﬂ ]
;
ﬂﬂ] ^
}
‡‡ 
}
·· 
catch
‚‚ 
(
‚‚ 
CosmosException
‚‚ "
ex
‚‚# %
)
‚‚% &
when
‚‚' +
(
‚‚, -
ex
‚‚- /
.
‚‚/ 0

StatusCode
‚‚0 :
==
‚‚; =
HttpStatusCode
‚‚> L
.
‚‚L M
NotFound
‚‚M U
)
‚‚U V
{
„„ 
return
‰‰ 
$str
‰‰ Y
;
‰‰Y Z
}
ÂÂ 
}
ÊÊ 	
public
ËË 
async
ËË 
Task
ËË 
<
ËË 

SubSedeDto
ËË $
>
ËË$ %"
GetSubSedesByIdAsync
ËË& :
(
ËË: ;
string
ËË; A
idSede
ËËB H
,
ËËH I
string
ËËJ P
	idSubSede
ËËQ Z
)
ËËZ [
{
ÈÈ 	

SubSedeDto
ÍÍ 

subSedeDto
ÍÍ !
=
ÍÍ" #
null
ÍÍ$ (
;
ÍÍ( )
try
ÎÎ 
{
ÏÏ 
var
ÌÌ 
queryString
ÌÌ 
=
ÌÌ  !
$str
Ì¸" B
;
¸¸B C
var
˛˛ 
queryDef
˛˛ 
=
˛˛ 
new
˛˛ "
QueryDefinition
˛˛# 2
(
˛˛2 3
queryString
˛˛3 >
)
˛˛> ?
;
˛˛? @
queryDef
ˇˇ 
.
ˇˇ 
WithParameter
ˇˇ &
(
ˇˇ& '
$str
ˇˇ' 0
,
ˇˇ0 1
true
ˇˇ2 6
)
ˇˇ6 7
;
ˇˇ7 8
queryDef
ÄÄ 
.
ÄÄ 
WithParameter
ÄÄ &
(
ÄÄ& '
$str
ÄÄ' 0
,
ÄÄ0 1
idSede
ÄÄ2 8
)
ÄÄ8 9
;
ÄÄ9 :
queryDef
ÅÅ 
.
ÅÅ 
WithParameter
ÅÅ &
(
ÅÅ& '
$str
ÅÅ' 3
,
ÅÅ3 4
	idSubSede
ÅÅ5 >
)
ÅÅ> ?
;
ÅÅ? @
var
ÉÉ 
query
ÉÉ 
=
ÉÉ 
	container
ÉÉ %
.
ÉÉ% &"
GetItemQueryIterator
ÉÉ& :
<
ÉÉ: ;

SubSedeDto
ÉÉ; E
>
ÉÉE F
(
ÉÉF G
queryDef
ÉÉG O
)
ÉÉO P
;
ÉÉP Q
while
ÑÑ 
(
ÑÑ 
query
ÑÑ 
.
ÑÑ 
HasMoreResults
ÑÑ +
)
ÑÑ+ ,
{
ÖÖ 
var
ÜÜ 
response
ÜÜ  
=
ÜÜ! "
await
ÜÜ# (
query
ÜÜ) .
.
ÜÜ. /
ReadNextAsync
ÜÜ/ <
(
ÜÜ< =
)
ÜÜ= >
;
ÜÜ> ?

subSedeDto
áá 
=
áá  
response
áá! )
.
áá) *
SingleOrDefault
áá* 9
(
áá9 :
)
áá: ;
;
áá; <
}
àà 
return
ää 

subSedeDto
ää !
;
ää! "
}
ãã 
catch
åå 
(
åå 
CosmosException
åå "
ex
åå# %
)
åå% &
when
åå' +
(
åå, -
ex
åå- /
.
åå/ 0

StatusCode
åå0 :
==
åå; =
HttpStatusCode
åå> L
.
ååL M
NotFound
ååM U
)
ååU V
{
çç 
return
éé 

subSedeDto
éé !
;
éé! "
}
èè 
}
êê 	
public
íí 
async
íí 
Task
íí 
<
íí 
string
íí  
>
íí  !
UpdateSubSede
íí" /
(
íí/ 0
SubSede
íí0 7
subsede
íí8 ?
,
íí? @
string
ííA G
idSede
ííH N
)
ííN O
{
ìì 	
var
îî 
result
îî 
=
îî 
	container
îî "
.
îî" #"
GetItemLinqQueryable
îî# 7
<
îî7 8
Sede
îî8 <
>
îî< =
(
îî= >
)
îî> ?
.
îî? @
Where
îî@ E
(
îîE F
s
ïï  
=>
ïï! #
s
ïï$ %
.
ïï% &
Id
ïï& (
.
ïï( )
Equals
ïï) /
(
ïï/ 0
idSede
ïï0 6
)
ïï6 7
)
ïï7 8
.
ïï8 9
ToFeedIterator
ïï9 G
(
ïïG H
)
ïïH I
;
ïïI J
int
óó 
indiceSubSede
óó 
=
óó 
-
óó  !
$num
óó! "
;
óó" #
if
òò 
(
òò 
result
òò 
.
òò 
HasMoreResults
òò %
)
òò% &
{
ôô 
var
öö 
existingDocuments
öö %
=
öö& '
await
öö( -
result
öö. 4
.
öö4 5
ReadNextAsync
öö5 B
(
ööB C
)
ööC D
;
ööD E
List
õõ 
<
õõ 
SubSede
õõ 
>
õõ 
subSedes
õõ &
=
õõ' (
existingDocuments
õõ) :
.
õõ: ;
Resource
õõ; C
?
õõC D
.
õõD E
Select
õõE K
(
õõK L
d
õõL M
=>
õõN P
d
õõQ R
.
õõR S
SubSedes
õõS [
)
õõ[ \
.
õõ\ ]
FirstOrDefault
õõ] k
(
õõk l
)
õõl m
;
õõm n
indiceSubSede
úú 
=
úú 
subSedes
úú  (
.
úú( )
	FindIndex
úú) 2
(
úú2 3
sb
úú3 5
=>
úú6 8
sb
úú9 ;
.
úú; <
	IdSubSede
úú< E
.
úúE F
Equals
úúF L
(
úúL M
subsede
úúM T
.
úúT U
	IdSubSede
úúU ^
)
úú^ _
)
úú_ `
;
úú` a
}
ûû 
var
†† 
	patchOpts
†† 
=
†† 
new
†† 
List
††  $
<
††$ %
PatchOperation
††% 3
>
††3 4
{
°° 
PatchOperation
¢¢ 
.
¢¢ 
Set
¢¢ "
(
¢¢" #
$"
¢¢# %
$str
¢¢% /
{
¢¢/ 0
indiceSubSede
¢¢0 =
}
¢¢= >
"
¢¢> ?
,
¢¢? @
subsede
¢¢A H
)
¢¢H I
}
££ 
;
££ 
subsede
§§ 
.
§§ 
FechaModificacion
§§ %
=
§§& '
DateTimeOffset
§§( 6
.
§§6 7
Now
§§7 :
;
§§: ;
var
•• 
	resultado
•• 
=
•• 
await
•• !
	container
••" +
.
••+ ,
PatchItemAsync
••, :
<
••: ;
Sede
••; ?
>
••? @
(
••@ A
idSede
••A G
,
••G H
new
••I L
PartitionKey
••M Y
(
••Y Z
idSede
••Z `
)
••` a
,
••a b
	patchOpts
••c l
)
••l m
;
••m n
return
¶¶ 
	resultado
¶¶ 
.
¶¶ 

StatusCode
¶¶ '
.
¶¶' (
ToString
¶¶( 0
(
¶¶0 1
)
¶¶1 2
;
¶¶2 3
}
®® 	
}
´´ 
}¨¨ £
uC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Repositories\ServicioRepository.cs
	namespace 	
FxSede
 
. 
Repositories 
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
$str/ B
]B C
;C D
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
GetServicioByIdAsync  4
(4 5
string5 ;

idServicio< F
)F G
{ 	
ServicioDto 
servicioDto #
=$ %
null& *
;* +
try 
{ 
var 
queryString 
=  !
$str"" L
;""L M
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
$str%%' 0
,%%0 1
true%%2 6
)%%6 7
;%%7 8
queryDef&& 
.&& 
WithParameter&& &
(&&& '
$str&&' 4
,&&4 5

idServicio&&6 @
)&&@ A
;&&A B
var(( 
query(( 
=(( 
	container(( %
.((% & 
GetItemQueryIterator((& :
<((: ;
ServicioDto((; F
>((F G
(((G H
queryDef((H P
)((P Q
;((Q R
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
;++> ?
servicioDto,, 
=,,  !
response,," *
.,,* +
SingleOrDefault,,+ :
(,,: ;
),,; <
;,,< =
}-- 
return// 
servicioDto// "
!=//# %
null//& *
;//* +
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
}77 ˇ;
]C:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Startup.cs
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
	namespace 	
FxSede
 
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
<QQ& '
ISedeRepositoryQQ' 6
,QQ6 7
SedeRepositoryQQ8 F
>QQF G
(QQG H
)QQH I
;QQI J
builderRR 
.RR 
ServicesRR 
.RR 
	AddScopedRR &
<RR& '
IServicioRepositoryRR' :
,RR: ;
ServicioRepositoryRR< N
>RRN O
(RRO P
)RRP Q
;RRQ R
builderXX 
.XX 
ServicesXX 
.XX 
	AddScopedXX &
<XX& '

IValidatorXX' 1
<XX1 2
	SedeInputXX2 ;
>XX; <
,XX< =
SedeValidatorXX> K
>XXK L
(XXL M
)XXM N
;XXN O
builderYY 
.YY 
ServicesYY 
.YY 
	AddScopedYY &
<YY& '

IValidatorYY' 1
<YY1 2
SubSedeInputYY2 >
>YY> ?
,YY? @
SubSedeValidatorYYA Q
>YYQ R
(YYR S
)YYS T
;YYT U
builderZZ 
.ZZ 
ServicesZZ 
.ZZ 
	AddScopedZZ &
<ZZ& '

IValidatorZZ' 1
<ZZ1 2
TiempoOfflineInputZZ2 D
>ZZD E
,ZZE F"
TiempoOfflineValidatorZZG ]
>ZZ] ^
(ZZ^ _
)ZZ_ `
;ZZ` a
builder[[ 
.[[ 
Services[[ 
.[[ 
	AddScoped[[ &
<[[& '

IValidator[[' 1
<[[1 2
ServicioInput[[2 ?
>[[? @
,[[@ A
ServicioValidator[[B S
>[[S T
([[T U
)[[U V
;[[V W
builder__ 
.__ 
Services__ 
.__ 
AddSingleton__ )
<__) *
IConfiguration__* 8
>__8 9
(__9 :
configuration__: G
)__G H
;__H I
}`` 	
}aa 
}bb ∑
nC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Utils\HttpResponseHelper.cs
	namespace 	
FxSede
 
. 
Utils 
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
} ‹
jC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Utils\SecurityHelper.cs
	namespace 	
FxSede
 
. 
Utils 
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
} Ç
fC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Utils\TimeHelper.cs
	namespace 	
FxSede
 
. 
Utils 
{ 
public 

static 
class 

TimeHelper "
{ 
public 
static 
TimeSpan 
ConevrtirHora ,
(, -
string- 3
hora4 8
)8 9
{ 	
string		 
[		 
]		 
data		 
=		 
hora		  
.		  !
Split		! &
(		& '
$str		' *
)		* +
;		+ ,
TimeSpan 
result 
= 
new !
TimeSpan" *
(* +
int+ .
.. /
Parse/ 4
(4 5
data5 9
[9 :
$num: ;
]; <
)< =
,= >
int? B
.B C
ParseC H
(H I
dataI M
[M N
$numN O
]O P
)P Q
,Q R
$numS T
)T U
;U V
return 
result 
; 
} 	
public 
static 
bool 
	HoraMayor $
($ %
dynamic% ,
property- 5
)5 6
{ 	
TimeSpan 

horaInicio 
=  !
ConevrtirHora" /
(/ 0
property0 8
.8 9

HoraInicio9 C
)C D
;D E
TimeSpan 
horaFin 
= 
ConevrtirHora ,
(, -
property- 5
.5 6
HoraFin6 =
)= >
;> ?
if 
( 
( 
horaFin 
- 

horaInicio %
)% &
.& '
TotalMinutes' 3
>4 5
$num6 7
)7 8
return 
true 
; 
return 
false 
; 
} 	
public 
static 
bool 

HoraValida %
(% &
string& ,
horaInicioPadre- <
,< =
string& ,
horaFinPadre- 9
,9 :
string& ,
horaInicioHijo- ;
,; <
string& ,
horaFinHijo- 8
)8 9
{ 	
TimeSpan 
horaInicioSubSede &
=' (
ConevrtirHora) 6
(6 7
horaInicioPadre7 F
)F G
;G H
TimeSpan 
horaFinSubSede #
=$ %
ConevrtirHora& 3
(3 4
horaFinPadre4 @
)@ A
;A B
TimeSpan!! 
horaInicioOffline!! &
=!!' (
ConevrtirHora!!) 6
(!!6 7
horaInicioHijo!!7 E
)!!E F
;!!F G
TimeSpan"" 
horaFinOffline"" #
=""$ %
ConevrtirHora""& 3
(""3 4
horaFinHijo""4 ?
)""? @
;""@ A
if$$ 
($$ 
($$ 
($$ 
horaInicioOffline$$ #
>=$$$ &
horaInicioSubSede$$' 8
)$$8 9
&&$$: <
($$= >
horaInicioOffline$$> O
<=$$P R
horaFinSubSede$$S a
)$$a b
)$$b c
&&$$d f
(%% 
(%% 
horaFinOffline%%  
>=%%! #
horaInicioSubSede%%$ 5
)%%5 6
&&%%7 9
(%%: ;
horaFinOffline%%; I
<=%%J L
horaFinSubSede%%M [
)%%[ \
)%%\ ]
)&& 
return'' 
true'' 
;'' 
return(( 
false(( 
;(( 
})) 	
}** 
}++ Ò	
kC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Utils\ValidatorHelper.cs
	namespace 	
FxSede
 
. 
Utils 
{ 
public 

static 
class 
ValidatorHelper '
{ 
public 
static 
bool 
CheckforDuplicates -
(- .
string. 4
[4 5
]5 6
lista7 <
)< =
{ 	
var		 

duplicates		 
=		 
lista		 "
.

 
GroupBy

 
(

 
p

 
=>

 
p

 
)

 
. 
Where 
( 
g 
=> 
g 
. 
Count 
( 
)  
>! "
$num# $
)$ %
. 
Select 
( 
g 
=> 
g 
. 
Key 
) 
; 
return 
! 
( 

duplicates 
.  
Any  #
(# $
)$ %
)% &
;& '
} 	
} 
} Ö$
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Validator\SedeValidator.cs
	namespace 	
FxSede
 
. 
	Validator 
{		 
public

 

class

 
SedeValidator

 
:

  
AbstractValidator

! 2
<

2 3
	SedeInput

3 <
>

< =
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
public 
SedeValidator 
( 
IConfiguration +
config, 2
)2 3
{ 	
_config 
= 
config 
; 
RuleFor 
( 
property 
=> 
property  (
.( )

NombreSede) 3
)3 4
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( R
)R S
;S T
RuleFor 
( 
property 
=> 
property  (
.( )
	Direccion) 2
)2 3
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( R
)R S
. 
Matches 
( 
_config  
[  !
$str! <
]< =
)= >
.> ?
WithMessage? J
(J K
$strK e
)e f
;f g
RuleFor 
( 
property 
=> 
property  (
.( )
Telefono) 1
)1 2
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( R
)R S
. 
Matches 
( 
_config  
[  !
$str! A
]A B
)B C
.C D
WithMessageD O
(O P
$strP j
)j k
;k l
RuleFor!! 
(!! 
property!! 
=>!! 
property!!  (
.!!( )

HoraInicio!!) 3
)!!3 4
."" 
NotNull"" 
("" 
)"" 
.## 
NotEmpty## 
(## 
)## 
.## 
WithMessage## '
(##' (
$str##( R
)##R S
.$$ 
Matches$$ 
($$ 
_config$$  
[$$  !
$str$$! 7
]$$7 8
)$$8 9
.$$9 :
WithMessage$$: E
($$E F
$str$$F `
)$$` a
;$$a b
RuleFor&& 
(&& 
property&& 
=>&& 
property&&  (
.&&( )
HoraFin&&) 0
)&&0 1
.'' 
NotNull'' 
('' 
)'' 
.(( 
NotEmpty(( 
((( 
)(( 
.(( 
WithMessage(( &
(((& '
$str((' Q
)((Q R
.)) 
Matches)) 
()) 
_config)) 
[))  
$str))  6
]))6 7
)))7 8
.))8 9
WithMessage))9 D
())D E
$str))E _
)))_ `
.** 
Must** 
(** 
(** 
property** 
,** 
HoraFin**  '
)**' (
=>**) +
	HoraMayor**, 5
(**5 6
property**6 >
)**> ?
)**? @
.**@ A
WithMessage**A L
(**L M
$str	**M Ä
)
**Ä Å
;
**Å Ç
RuleFor,, 
(,, 
property,, 
=>,, 
property,,  (
.,,( )
Usuario,,) 0
),,0 1
.-- 
NotNull-- 
(-- 
)-- 
... 
NotEmpty.. 
(.. 
).. 
... 
WithMessage.. &
(..& '
$str..' Q
)..Q R
;..R S
}// 	
private11 
static11 
bool11 
	HoraMayor11 %
(11% &
	SedeInput11& /
property110 8
)118 9
{22 	
return44 

TimeHelper44 
.44 
	HoraMayor44 '
(44' (
property44( 0
)440 1
;441 2
}55 	
}66 
}77 ò#
qC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Validator\ServicioValidator.cs
	namespace		 	
FxSede		
 
.		 
	Validator		 
{

 
public 

class 
ServicioValidator "
:# $
AbstractValidator% 6
<6 7
ServicioInput7 D
>D E
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
ServicioValidator  
(  !
IUnitOfWork! ,

unitOfWork- 7
,7 8
SubSedeInput9 E
padreF K
)K L
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
RuleFor 
( 
property 
=> 
property  (
.( )

IdServicio) 3
)3 4
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' Q
)Q R
. 
Must 
( 
( 
property 
, 

IdServicio  *
)* +
=>, .
ValidarServicio/ >
(> ?
property? G
)G H
)H I
.I J
WithMessageJ U
(U V
$str	V í
)
í ì
. 
Must 
( 
( 
property 
, 

IdServicio  *
)* +
=>, .
CheckforDuplicates/ A
(A B
padreB G
,G H
$strH T
)T U
)U V
.V W
WithMessageW b
(b c
$str	c Å
)
Å Ç
;
Ç É
RuleFor 
( 
property 
=> 
property  (
.( )
	Prioridad) 2
)2 3
.3 4
InclusiveBetween4 D
(D E
$numE F
,F G
padreH M
.M N
	ServiciosN W
.W X
CountX ]
)] ^
. 
WithMessage 
( 
$str `
)` a
. 
Must 
( 
( 
property 
, 
	Prioridad (
)( )
=>* ,
CheckforDuplicates- ?
(? @
padre@ E
,E F
$strF Q
)Q R
)R S
.S T
WithMessageT _
(_ `
$str	` Ä
)
Ä Å
;
Å Ç
} 	
private 
static 
bool 
CheckforDuplicates .
(. /
SubSedeInput/ ;
padre< A
,A B
stringC I
tipoJ N
)N O
{ 	
var   

filterList   
=   
tipo   !
.  ! "
Equals  " (
(  ( )
$str  ) 5
)  5 6
?  7 8
padre  9 >
.  > ?
	Servicios  ? H
.  H I
Select  I O
(  O P
x  P Q
=>  R T
x  U V
.  V W

IdServicio  W a
)  a b
:  c d
padre  e j
.  j k
	Servicios  k t
.  t u
Select  u {
(  { |
x  | }
=>	  ~ Ä
x
  Å Ç
.
  Ç É
	Prioridad
  É å
.
  å ç
ToString
  ç ï
(
  ï ñ
)
  ñ ó
)
  ó ò
;
  ò ô
return!! 
ValidatorHelper!! "
.!!" #
CheckforDuplicates!!# 5
(!!5 6

filterList!!6 @
.!!@ A
ToArray!!A H
(!!H I
)!!I J
)!!J K
;!!K L
}"" 	
private$$ 
bool$$ 
ValidarServicio$$ $
($$$ %
ServicioInput$$% 2
property$$3 ;
)$$; <
{%% 	
return&& 
_unitOfWork&& 
.&& 
ServicioRepository&& 1
.&&1 2 
GetServicioByIdAsync&&2 F
(&&F G
property&&G O
.&&O P

IdServicio&&P Z
)&&Z [
.&&[ \

GetAwaiter&&\ f
(&&f g
)&&g h
.&&h i
	GetResult&&i r
(&&r s
)&&s t
;&&t u
}(( 	
})) 
}**  b
pC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Validator\SubSedeValidator.cs
	namespace 	
FxSede
 
. 
	Validator 
{ 
public 

class 
SubSedeValidator !
:" #
AbstractValidator$ 5
<5 6
SubSedeInput6 B
>B C
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
private 
readonly 
int 
tiempoMaximo )
;) *
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
SubSedeValidator 
(  
IConfiguration  .
config/ 5
,5 6
IUnitOfWork7 B

unitOfWorkC M
,M N
stringO U
idSedeV \
)\ ]
{ 	
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
;$ %
List 
< 
string 
> 

diasSemana #
=$ %
new& )
() *
)* +
{, -
$str. 6
,6 7
$str8 A
,A B
$strC N
,N O
$strP Z
,Z [
$str\ d
,d e
$strf p
,p q
$strr z
}{ |
;| }
RuleFor 
( 
property 
=> 
property  (
.( )
idSede) /
)/ 0
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( J
)J K
.   
Must   
(   
(   
property   
,    
idSede  ! '
)  ' (
=>  ) +
ValidarSede  , 7
(  7 8
property  8 @
)  @ A
)  A B
.  B C
WithMessage  C N
(  N O
$str	  O ¨
)
  ¨ ≠
;
  ≠ Æ
RuleFor"" 
("" 
property"" 
=>"" 
property""  (
.""( )
NombreSubSede"") 6
)""6 7
.## 
NotNull## 
(## 
)## 
.$$ 
NotEmpty$$ 
($$ 
)$$ 
.$$ 
WithMessage$$ '
($$' (
$str$$( J
)$$J K
;$$K L
RuleFor'' 
('' 
property'' 
=>'' 
property''  (
.''( )

HoraInicio'') 3
)''3 4
.(( 
NotNull(( 
((( 
)(( 
.)) 
NotEmpty)) 
()) 
))) 
.)) 
WithMessage)) (
())( )
$str))) S
)))S T
.** 
Matches** 
(** 
_config** !
[**! "
$str**" 8
]**8 9
)**9 :
.**: ;
WithMessage**; F
(**F G
$str**G a
)**a b
;**b c
RuleFor,, 
(,, 
property,, 
=>,, 
property,,  (
.,,( )
HoraFin,,) 0
),,0 1
.-- 
NotNull-- 
(-- 
)-- 
... 
NotEmpty.. 
(.. 
).. 
... 
WithMessage.. &
(..& '
$str..' Q
)..Q R
.// 
Matches// 
(// 
_config// 
[//  
$str//  6
]//6 7
)//7 8
.//8 9
WithMessage//9 D
(//D E
$str//E _
)//_ `
.00 
Must00 
(00 
(00 
property00 
,00 
HoraFin00  '
)00' (
=>00) +
	HoraMayor00, 5
(005 6
property006 >
)00> ?
)00? @
.00@ A
WithMessage00A L
(00L M
$str	00M ú
)
00ú ù
.11 
Must11 
(11 
(11 
property11 
,11 
HoraFin11  '
)11' (
=>11) +
ValidarHoraSede11, ;
(11; <
property11< D
)11D E
)11E F
.11F G
WithMessage11G R
(11R S
$str	11S °
)
11° ¢
;
11¢ £
RuleFor33 
(33 
property33 
=>33 
property33  (
.33( )
IntervaloAtencion33) :
)33: ;
.44 
Must44 
(44 
x44 
=>44 
x44 
>44 
$num44 
&&44 !
x44" #
<=44$ &
tiempoMaximo44' 3
)443 4
.444 5
WithMessage445 @
(44@ A
$"44A C
$str44C ~
{44~ 
tiempoMaximo	44 ã
}
44ã å
"
44å ç
)
44ç é
;
44é è
RuleFor66 
(66 
property66 
=>66 
property66  (
.66( )"
NumeroPersonasAtencion66) ?
)66? @
.77 
Must77 
(77 
x77 
=>77 
x77 
>77 
$num77 
)77 
.77  
WithMessage77  +
(77+ ,
$"77, .
$str77. _
"77_ `
)77` a
;77a b
RuleForEach99 
(99 
property99  
=>99! #
property99$ ,
.99, -
DiasOffline99- 8
)998 9
.:: 
Must:: 
(:: 
(:: 
property:: 
,:: 
d:: 
):: 
=>::  "
property::# +
.::+ ,
DiasOffline::, 7
.::7 8
Length::8 >
>::? @
$num::A B
&&::C E
property::F N
.::N O
DiasOffline::O Z
.::Z [
Length::[ a
<=::b d
$num::e f
)::f g
.::g h
WithMessage::h s
(::s t
$str	::t •
)
::• ¶
.;; 
Must;; 
(;; 
d;; 
=>;; 

diasSemana;; "
.;;" #
Contains;;# +
(;;+ ,
d;;, -
);;- .
);;. /
.;;/ 0
When;;0 4
(;;4 5
x;;5 6
=>;;7 9
x;;: ;
.;;; <
DiasOffline;;< G
?;;G H
.;;H I
Length;;I O
>;;P Q
$num;;R S
);;S T
.;;T U
WithMessage;;U `
(;;` a
$str	;;a ú
)
;;ú ù
.<< 
Must<< 
(<< 
(<< 
property<< 
,<< 
Dias<< "
)<<" #
=><<$ &
CheckforDuplicates<<' 9
(<<9 :
property<<: B
)<<B C
)<<C D
.<<D E
WithMessage<<E P
(<<P Q
$str<<Q }
)<<} ~
;<<~ 
RuleFor?? 
(?? 
property?? 
=>?? 
property??  (
.??( )
TiemposOffline??) 7
)??7 8
.@@ 
Must@@ 
(@@ 
(@@ 
TiemposOffline@@ %
)@@% &
=>@@' )
TiemposOffline@@* 8
?@@8 9
.@@9 :
Count@@: ?
>@@? @
$num@@@ A
)@@A B
.@@B C
When@@C G
(@@G H
property@@H P
=>@@Q S
property@@T \
.@@\ ]
TiemposOffline@@] k
?@@k l
.@@l m
Count@@m r
>@@s t
$num@@u v
)@@v w
.AA 
WithMessageAA 
(AA 
$strAA ?
)AA? @
.BB 
DependentRulesBB 
(BB  
(BB  !
)BB! "
=>BB# %
{CC 
RuleForEachDD 
(DD  
propertyDD  (
=>DD) +
propertyDD, 4
.DD4 5
TiemposOfflineDD5 C
)DDC D
.DDD E
SetValidatorDDE Q
(DDQ R
propertyDDR Z
=>DD[ ]
newDD^ a"
TiempoOfflineValidatorDDb x
(DDx y
_config	DDy Ä
,
DDÄ Å

diasSemana
DDÇ å
,
DDå ç
property
DDé ñ
)
DDñ ó
)
DDó ò
;
DDò ô
}EE 
)EE 
.EE 
WhenEE 
(EE 
propertyEE  
=>EE! #
propertyEE$ ,
.EE, -
TiemposOfflineEE- ;
?EE; <
.EE< =
CountEE= B
>EEC D
$numEEE F
)EEF G
;EEG H
RuleForGG 
(GG 
propertyGG 
=>GG 
propertyGG  (
.GG( )
	ServiciosGG) 2
)GG2 3
.HH 
MustHH 
(HH 
xHH 
=>HH 
xHH 
.HH 
AnyHH  
(HH  !
)HH! "
)HH" #
.HH# $
WithMessageHH$ /
(HH/ 0
$strHH0 f
)HHf g
.II 
DependentRulesII 
(II  
(II  !
)II! "
=>II# %
{JJ 
RuleForEachKK 
(KK  
propertyKK  (
=>KK) +
propertyKK, 4
.KK4 5
	ServiciosKK5 >
)KK> ?
.KK? @
SetValidatorKK@ L
(KKL M
propertyKKM U
=>KKV X
newKKY \
ServicioValidatorKK] n
(KKn o
_unitOfWorkKKo z
,KKz {
property	KK| Ñ
)
KKÑ Ö
)
KKÖ Ü
;
KKÜ á
}MM 
)MM 
;MM 
}OO 	
privateQQ 
staticQQ 
boolQQ 
CheckforDuplicatesQQ .
(QQ. /
SubSedeInputQQ/ ;
propertyQQ< D
)QQD E
{RR 	
returnSS 
ValidatorHelperSS "
.SS" #
CheckforDuplicatesSS# 5
(SS5 6
propertySS6 >
.SS> ?
DiasOfflineSS? J
)SSJ K
;SSK L
}TT 	
privateVV 
boolVV 
ValidarSedeVV !
(VV! "
SubSedeInputVV" .
propertyVV/ 7
)VV7 8
{WW 	
varXX 
dataXX 
=XX 
_unitOfWorkXX "
.XX" #
SedeRepositoryXX# 1
.XX1 2
GetSedeByIDXX2 =
(XX= >
propertyXX> F
.XXF G
idSedeXXG M
)XXM N
.XXN O

GetAwaiterXXO Y
(XXY Z
)XXZ [
.XX[ \
	GetResultXX\ e
(XXe f
)XXf g
;XXg h
ifYY 
(YY 
dataYY 
==YY 
nullYY 
)YY 
returnZZ 
falseZZ 
;ZZ 
return[[ 
true[[ 
;[[ 
}\\ 	
private__ 
static__ 
bool__ 
	HoraMayor__ %
(__% &
SubSedeInput__& 2
property__3 ;
)__; <
{`` 	
returnaa 

TimeHelperaa 
.aa 
	HoraMayoraa '
(aa' (
propertyaa( 0
)aa0 1
;aa1 2
}bb 	
privatedd 
booldd 
ValidarHoraSededd $
(dd$ %
SubSedeInputdd% 1
propertydd2 :
)dd: ;
{ee 	
SedeDtoff 
dataff 
=ff 
_unitOfWorkff &
.ff& '
SedeRepositoryff' 5
.ff5 6
GetSedeByIDff6 A
(ffA B
propertyffB J
.ffJ K
idSedeffK Q
)ffQ R
.ffR S

GetAwaiterffS ]
(ff] ^
)ff^ _
.ff_ `
	GetResultff` i
(ffi j
)ffj k
;ffk l
ifgg 
(gg 
datagg 
!=gg 
nullgg 
)gg 
returnhh 

TimeHelperhh !
.hh! "

HoraValidahh" ,
(hh, -
datahh- 1
.hh1 2

horaIniciohh2 <
,hh< =
datahh> B
.hhB C
horaFinhhC J
,hhJ K
propertyhhL T
.hhT U

HoraIniciohhU _
,hh_ `
propertyhha i
.hhi j
HoraFinhhj q
)hhq r
;hhr s
returnii 
falseii 
;ii 
}jj 	
}kk 
}ll ⁄(
vC:\Users\pc\source\repos\TRANSVERSALES\BCK_TRV_MAESTROS_AGENDAMIENTO\FxSede\FxSede\Validator\TiempoOfflineValidator.cs
	namespace

 	
FxSede


 
.

 
	Validator

 
{ 
public 

class "
TiempoOfflineValidator '
:( )
AbstractValidator* ;
<; <
TiempoOfflineInput< N
>N O
{ 
public 
readonly 
IConfiguration &
_config' .
;. /
public "
TiempoOfflineValidator %
(% &
IConfiguration& 4
config5 ;
,; <
List= A
<A B
stringB H
>H I

diasSemanaJ T
,T U
SubSedeInputV b
padrec h
)h i
{ 	
_config 
= 
config 
; 
RuleFor 
( 
property 
=> 
property  (
.( )

HoraInicio) 3
)3 4
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
WithMessage (
(( )
$str) S
)S T
. 
Matches 
( 
_config !
[! "
$str" 8
]8 9
)9 :
.: ;
WithMessage; F
(F G
$strG a
)a b
;b c
RuleFor 
( 
property 
=> 
property  (
.( )
HoraFin) 0
)0 1
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' Q
)Q R
.   
Matches   
(   
_config   
[    
$str    6
]  6 7
)  7 8
.  8 9
WithMessage  9 D
(  D E
$str  E _
)  _ `
.!! 
Must!! 
(!! 
(!! 
property!! 
,!! 
HoraFin!!  '
)!!' (
=>!!) +
	HoraMayor!!, 5
(!!5 6
property!!6 >
)!!> ?
)!!? @
.!!@ A
WithMessage!!A L
(!!L M
$str	!!M ¶
)
!!¶ ß
."" 
Must"" 
("" 
("" 
property"" 
,"" 
HoraFin""  '
)""' (
=>"") +
ValidarHoraSede"", ;
(""; <
property""< D
,""D E
padre""F K
)""K L
)""L M
.""M N
WithMessage""N Y
(""Y Z
$str	""Z µ
)
""µ ∂
;
""∂ ∑
RuleForEach%% 
(%% 
property%%  
=>%%! #
property%%$ ,
.%%, -
Dias%%- 1
)%%1 2
.&& 
NotNull&& 
(&& 
)&& 
.'' 
NotEmpty'' 
('' 
)'' 
.(( 
Must(( 
((( 
d(( 
=>(( 

diasSemana(( "
.((" #
Contains((# +
(((+ ,
d((, -
)((- .
)((. /
.((/ 0
WithMessage((0 ;
(((; <
$str	((< Ä
)
((Ä Å
.)) 
Must)) 
()) 
()) 
property)) 
,)) 
Dias)) "
)))" #
=>))$ &
CheckforDuplicates))' 9
())9 :
property)): B
)))B C
)))C D
.))D E
WithMessage))E P
())P Q
$str	))Q å
)
))å ç
;
))ç é
},, 	
private.. 
static.. 
bool.. 
CheckforDuplicates.. .
(... /
TiempoOfflineInput../ A
property..B J
)..J K
{// 	
return00 
ValidatorHelper00 "
.00" #
CheckforDuplicates00# 5
(005 6
property006 >
.00> ?
Dias00? C
)00C D
;00D E
}11 	
private33 
static33 
bool33 
ValidarHoraSede33 +
(33+ ,
TiempoOfflineInput33, >
property33? G
,33G H
SubSedeInput33I U
padre33V [
)33[ \
{44 	
return55 

TimeHelper55 
.55 

HoraValida55 (
(55( )
padre55) .
.55. /

HoraInicio55/ 9
,559 :
padre55; @
.55@ A
HoraFin55A H
,55H I
property55J R
.55R S

HoraInicio55S ]
,55] ^
property55_ g
.55g h
HoraFin55h o
)55o p
;55p q
}66 	
private88 
static88 
bool88 
	HoraMayor88 %
(88% &
TiempoOfflineInput88& 8
property889 A
)88A B
{99 	
return:: 

TimeHelper:: 
.:: 
	HoraMayor:: '
(::' (
property::( 0
)::0 1
;::1 2
};; 	
}<< 
}== 