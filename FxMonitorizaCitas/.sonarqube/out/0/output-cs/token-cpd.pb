£
rC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\DataContext\UnitOfWork.cs
	namespace		 	
FxMonitorizaCitas		
 
.		 
DataContext		 '
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
ITramiteRepository !
TramiteRepository" 3
{ 	
get 
{ 
return 
_tramiteRepository +
??=, /
new0 3
TramiteRepository4 E
(E F
_clientF M
,M N
_configurationO ]
)] ^
;^ _
}` a
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
}22 ï!
mC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\FxMonitorizaCitas.cs
	namespace 	
FxMonitorizaCitas
 
{ 
public 

class 
FxMonitorizaCitas "
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
FxMonitorizaCitas  
(  !
IUnitOfWork! ,

unitOfWork- 7
,7 8
IConfiguration9 G
configurationH U
)U V
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
MonitorizarCitas -
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
MonitorizarCitas *
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
$str! D
{D E

TimeHelperE O
.O P 
ObtenerFechaColombiaP d
(d e
)e f
}f g
"g h
)h i
;i j
List!! 
<!! 
TramitesDiaDto!! 
>!!  
citas!!! &
=!!' (
await!!) .
_unitOfWork!!/ :
.!!: ;
TramiteRepository!!; L
.!!L M
ObtenerCitasDia!!M \
(!!\ ]
)!!] ^
;!!^ _
if## 
(## 
citas## 
.## 
Any## 
(## 
)## 
)## 
{$$ 
var%% 
citasFiltradas%% "
=%%# $
citas%%% *
.%%* +
Where%%+ 0
(%%0 1
c%%1 2
=>%%3 5

TimeHelper%%6 @
.%%@ A
ObtenerFechaConHora%%A T
(%%T U
c%%U V
.%%V W
FechaAgendamiento%%W h
,%%h i
c%%j k
.%%k l
HoraAgendamiento%%l |
)%%| }
<=	%%~ €

TimeHelper
%% ‹
.
%%‹ Œ"
ObtenerFechaColombia
%%Œ  
(
%%  ¡
)
%%¡ ¢
)
%%¢ £
.&&* +
Select&&+ 1
(&&1 2
c&&2 3
=>&&4 6
new&&7 :
{&&; <
c&&= >
.&&> ?
IdCita&&? E
,&&E F
c&&G H
.&&H I
	IdUsuario&&I R
}&&S T
)&&T U
;&&U V
if'' 
('' 
citasFiltradas'' "
.''" #
Any''# &
(''& '
)''' (
)''( )
{(( 
foreach)) 
()) 
var))  
cita))! %
in))& (
citasFiltradas))) 7
)))7 8
{** 
await++ 
_unitOfWork++ )
.++) *
TramiteRepository++* ;
.++; <
InactivarCita++< I
(++I J
cita++J N
.++N O
	IdUsuario++O X
,++X Y
cita++Z ^
.++^ _
IdCita++_ e
)++e f
;++f g
await,, 
_unitOfWork,, )
.,,) *
TramiteRepository,,* ;
.,,; <
AgregarEstado,,< I
(,,I J
cita,,J N
.,,N O
	IdUsuario,,O X
,,,X Y
cita,,Z ^
.,,^ _
IdCita,,_ e
,,,e f
new,,g j
(,,j k
),,k l
{,,m n
NombreEstado,,o {
=,,| }
_configuration	,,~ Œ
[
,,Œ 
$str
,,  
]
,,  ¡
}
,,¢ £
)
,,£ ¤
;
,,¤ ¥
}-- 
}.. 
}// 
}00 	
}11 
}22 ü

‹C:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\Interfaces\RepositoryPattern\ITramiteRepository.cs
	namespace 	
FxMonitorizaCitas
 
. 

Interfaces &
.& '
RepositoryPattern' 8
{ 
public		 

	interface		 
ITramiteRepository		 '
{

 
public 
Task 
< 
List 
< 
TramitesDiaDto '
>' (
>( )
ObtenerCitasDia* 9
(9 :
): ;
;; <
public 
Task 
< 
List 
< 
CitasDto !
>! "
>" #
ObtenerCitas$ 0
(0 1
string1 7
	idUsuario8 A
)A B
;B C
public 
Task 
InactivarCita !
(! "
string" (
	idUsuario) 2
,2 3
string4 :
idCita; A
)A B
;B C
public 
Task 
< 
string 
> 
AgregarEstado )
() *
string* 0
	idUsuario1 :
,: ;
string< B
	idTramiteC L
,L M
EstadoN T
estadoU [
)[ \
;\ ]
} 
} ±
„C:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\Interfaces\RepositoryPattern\IUnitOfWork.cs
	namespace 	
FxMonitorizaCitas
 
. 

Interfaces &
.& '
RepositoryPattern' 8
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
} 
}		 »
C:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\Models\DataTransferObjects\CitasDto.cs
	namespace 	
FxMonitorizaCitas
 
. 
Models "
." #
DataTransferObjects# 6
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
}(( ª
…C:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\Models\DataTransferObjects\TramitesDiaDto.cs
	namespace 	
FxMonitorizaCitas
 
. 
Models "
." #
DataTransferObjects# 6
{ 
public 

class 
TramitesDiaDto 
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
 
)

 
]

  
public 
string 
IdCita 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str )
)) *
]* +
public 
string 
FechaAgendamiento '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
[ 	
JsonProperty	 
( 
$str (
)( )
]) *
public 
string 
HoraAgendamiento &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} ”0
rC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\Models\Entities\Agenda.cs
	namespace 	
FxMonitorizaCitas
 
. 
Models "
." #
Entities# +
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
=558 9
DateTime55: B
.55B C
UtcNow55C I
;55I J
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
}PP ‚
wC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\Repositories\RepositoryBase.cs
	namespace 	
FxMonitorizaCitas
 
. 
Repositories (
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
} ØV
zC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\Repositories\TramiteRepository.cs
	namespace 	
FxMonitorizaCitas
 
. 
Repositories (
{ 
public 

class 
TramiteRepository "
:# $
RepositoryBase% 3
,3 4
ITramiteRepository5 G
{ 
private 
readonly 
	Container "
	container# ,
;, -
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
public 
TramiteRepository  
(  !
CosmosClient! -
client. 4
,4 5
IConfiguration6 D
configurationE R
)R S
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
$str/ J
]J K
;K L
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
< 
List 
< 
TramitesDiaDto -
>- .
>. /
ObtenerCitasDia0 ?
(? @
)@ A
{ 	
string   
fecha   
=   

TimeHelper   %
.  % & 
ObtenerFechaColombia  & :
(  : ;
)  ; <
.  < =
ToString  = E
(  E F
$str  F R
)  R S
;  S T
var!! 
citas!! 
=!! 
new!! 
List!!  
<!!  !
TramitesDiaDto!!! /
>!!/ 0
(!!0 1
)!!1 2
{!!3 4
}!!5 6
;!!6 7
try"" 
{## 
var$$ 
queryString$$ 
=$$  !
@$"$$" %
$str$,% E
",,E F
;,,F G
var.. 
queryDef.. 
=.. 
new.. "
QueryDefinition..# 2
(..2 3
queryString..3 >
)..> ?
;..? @
queryDef// 
.// 
WithParameter// &
(//& '
$str//' /
,/// 0
fecha//1 6
)//6 7
;//7 8
var11 
query11 
=11 
	container11 %
.11% & 
GetItemQueryIterator11& :
<11: ;
TramitesDiaDto11; I
>11I J
(11J K
queryDef11K S
)11S T
;11T U
while22 
(22 
query22 
.22 
HasMoreResults22 +
)22+ ,
{33 
var44 
response44  
=44! "
await44# (
query44) .
.44. /
ReadNextAsync44/ <
(44< =
)44= >
;44> ?
citas55 
.55 
AddRange55 "
(55" #
response55# +
.55+ ,
ToList55, 2
(552 3
)553 4
)554 5
;555 6
}66 
return88 
citas88 
;88 
}99 
catch:: 
(:: 
CosmosException:: "
ex::# %
)::% &
when::' +
(::, -
ex::- /
.::/ 0

StatusCode::0 :
==::; =
HttpStatusCode::> L
.::L M
NotFound::M U
)::U V
{;; 
return<< 
citas<< 
;<< 
}== 
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
List@@ 
<@@ 
CitasDto@@ '
>@@' (
>@@( )
ObtenerCitas@@* 6
(@@6 7
string@@7 =
	idUsuario@@> G
)@@G H
{AA 	
varBB 
citasBB 
=BB 
newBB 
ListBB  
<BB  !
CitasDtoBB! )
>BB) *
(BB* +
)BB+ ,
{BB- .
}BB/ 0
;BB0 1
tryCC 
{DD 
varEE 
queryStringEE 
=EE  !
@$"EE" %
$strES% 5
"SS5 6
;SS6 7
varUU 
queryDefUU 
=UU 
newUU "
QueryDefinitionUU# 2
(UU2 3
queryStringUU3 >
)UU> ?
;UU? @
queryDefVV 
.VV 
WithParameterVV &
(VV& '
$strVV' 3
,VV3 4
	idUsuarioVV5 >
)VV> ?
;VV? @
varXX 
queryXX 
=XX 
	containerXX %
.XX% & 
GetItemQueryIteratorXX& :
<XX: ;
CitasDtoXX; C
>XXC D
(XXD E
queryDefXXE M
)XXM N
;XXN O
whileYY 
(YY 
queryYY 
.YY 
HasMoreResultsYY +
)YY+ ,
{ZZ 
var[[ 
response[[  
=[[! "
await[[# (
query[[) .
.[[. /
ReadNextAsync[[/ <
([[< =
)[[= >
;[[> ?
citas\\ 
.\\ 
AddRange\\ "
(\\" #
response\\# +
.\\+ ,
ToList\\, 2
(\\2 3
)\\3 4
)\\4 5
;\\5 6
}]] 
return__ 
citas__ 
;__ 
}`` 
catchaa 
(aa 
CosmosExceptionaa "
exaa# %
)aa% &
whenaa' +
(aa, -
exaa- /
.aa/ 0

StatusCodeaa0 :
==aa; =
HttpStatusCodeaa> L
.aaL M
NotFoundaaM U
)aaU V
{bb 
returncc 
citascc 
;cc 
}dd 
}ee 	
publicgg 
asyncgg 
Taskgg 
InactivarCitagg '
(gg' (
stringgg( .
	idUsuariogg/ 8
,gg8 9
stringgg: @
idCitaggA G
)ggG H
{hh 	
Listii 
<ii 
CitasDtoii 
>ii 
citasii  
=ii! "
awaitii# (
ObtenerCitasii) 5
(ii5 6
	idUsuarioii6 ?
)ii? @
;ii@ A
intjj 
indexTramitejj 
=jj 
citasjj $
.jj$ %
	FindIndexjj% .
(jj. /
citajj/ 3
=>jj4 6
citajj7 ;
.jj; <
	PkTramitejj< E
.jjE F
EqualsjjF L
(jjL M
idCitajjM S
)jjS T
)jjT U
;jjU V
awaitkk 
	containerkk 
.kk 
PatchItemAsynckk *
<kk* +
Agendakk+ 1
>kk1 2
(kk2 3
	idUsuariokk3 <
,kk< =
newkk> A
PartitionKeykkB N
(kkN O
	idUsuariokkO X
)kkX Y
,kkY Z
newll 
[ll 
]ll 
{ll 
PatchOperationmm #
.mm# $
Setmm$ '
(mm' (
$"mm( *
$strmm* 4
{mm4 5
indexTramitemm5 A
}mmA B
$strmmB I
"mmI J
,mmJ K
falsemmL Q
)mmQ R
}nn 
)nn 
;nn 
}oo 	
publicqq 
asyncqq 
Taskqq 
<qq 
stringqq  
>qq  !
AgregarEstadoqq" /
(qq/ 0
stringqq0 6
	idUsuarioqq7 @
,qq@ A
stringqqB H
	idTramiteqqI R
,qqR S
EstadoqqT Z
estadoqq[ a
)qqa b
{rr 	
varss 
resultss 
=ss 
	containerss "
.ss" # 
GetItemLinqQueryabless# 7
<ss7 8
Agendass8 >
>ss> ?
(ss? @
)ss@ A
.ssA B
WheressB G
(ssG H
mtt 
=>tt  "
mtt# $
.tt$ %
Idtt% '
.tt' (
Equalstt( .
(tt. /
	idUsuariott/ 8
)tt8 9
)tt9 :
.tt: ;
ToFeedIteratortt; I
(ttI J
)ttJ K
;ttK L
intvv 
indiceTramitevv 
=vv 
-vv  !
$numvv! "
,vv" #
indiceEstadosww 
=ww 
-ww  !
$numww! "
;ww" #
ifyy 
(yy 
resultyy 
.yy 
HasMoreResultsyy %
)yy% &
{zz 
var{{ 
existingDocuments{{ %
={{& '
await{{( -
result{{. 4
.{{4 5
ReadNextAsync{{5 B
({{B C
){{C D
;{{D E
List}} 
<}} 
Tramite}} 
>}} 
tramites}} &
=}}' (
existingDocuments}}) :
.}}: ;
Resource}}; C
?}}C D
.}}D E
Select}}E K
(}}K L
d}}L M
=>}}N P
d}}Q R
.}}R S
Tramites}}S [
)}}[ \
.}}\ ]
FirstOrDefault}}] k
(}}k l
)}}l m
;}}m n
indiceTramite 
= 
tramites  (
.( )
	FindIndex) 2
(2 3
tr3 5
=>6 8
tr9 ;
.; <
	PkTramite< E
.E F
EqualsF L
(L M
	idTramiteM V
)V W
)W X
;X Y
indiceEstados
€€ 
=
€€ 
tramites
€€  (
.
€€( )
	ElementAt
€€) 2
(
€€2 3
indiceTramite
€€3 @
)
€€@ A
.
€€A B
Estados
€€B I
.
€€I J
Count
€€J O
;
€€O P
}
 
var
ƒƒ 
	patchOpts
ƒƒ 
=
ƒƒ 
new
ƒƒ 
List
ƒƒ  $
<
ƒƒ$ %
PatchOperation
ƒƒ% 3
>
ƒƒ3 4
{
„„ 
PatchOperation
…… 
.
…… 
Add
…… "
(
……" #
$"
……# %
$str
……% /
{
……/ 0
indiceTramite
……0 =
}
……= >
$str
……> G
{
……G H
indiceEstados
……H U
}
……U V
"
……V W
,
……W X
estado
……Y _
)
……_ `
}
†† 
;
†† 
var
ˆˆ 
	resultado
ˆˆ 
=
ˆˆ 
await
ˆˆ !
	container
ˆˆ" +
.
ˆˆ+ ,
PatchItemAsync
ˆˆ, :
<
ˆˆ: ;
Tramite
ˆˆ; B
>
ˆˆB C
(
ˆˆC D
	idUsuario
ˆˆD M
,
ˆˆM N
new
ˆˆO R
PartitionKey
ˆˆS _
(
ˆˆ_ `
	idUsuario
ˆˆ` i
)
ˆˆi j
,
ˆˆj k
	patchOpts
ˆˆl u
)
ˆˆu v
;
ˆˆv w
return
‰‰ 
	resultado
‰‰ 
.
‰‰ 

StatusCode
‰‰ '
.
‰‰' (
ToString
‰‰( 0
(
‰‰0 1
)
‰‰1 2
;
‰‰2 3
}
ŠŠ 	
}
‹‹ 
}ŒŒ ¤+
cC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\Startup.cs
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
FxMonitorizaCitas
 
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
ITramiteRepositoryEE' 9
,EE9 :
TramiteRepositoryEE; L
>EEL M
(EEM N
)EEN O
;EEO P
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
}LL é!
lC:\Users\pc\source\repos\TRANSVERSALES\BCK_PROCESOS_BATCH_AGENDAMIENTO\FxMonitorizaCitas\Utils\TimeHelper.cs
	namespace 	
FxMonitorizaCitas
 
. 
Utils !
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
DateTime  
ObtenerFechaColombia 3
(3 4
)4 5
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
;d e
DateTime 
today 
= 
TimeZoneInfo )
.) *
ConvertTime* 5
(5 6
DateTime6 >
.> ?
UtcNow? E
,E F
zonaColombiaG S
)S T
;T U
return 
today 
; 
} 	
public 
static 
DateTime 
ObtenerFechaConHora 2
(2 3
string3 9
fecha: ?
,? @
stringA G
horaCitaH P
)P Q
{ 	
try 
{ 
var 
datos 
= 
fecha !
.! "
Split" '
(' (
$str( +
)+ ,
;, -
int 
year 
= 
int 
. 
Parse $
($ %
datos% *
[* +
$num+ ,
], -
.- .
Split. 3
(3 4
)4 5
[5 6
$num6 7
]7 8
)8 9
;9 :
int 
month 
= 
int 
.  
Parse  %
(% &
datos& +
[+ ,
$num, -
]- .
). /
;/ 0
int 
day 
= 
int 
. 
Parse #
(# $
datos$ )
[) *
$num* +
]+ ,
), -
;- .
var 
	datosHora 
= 
horaCita  (
.( )
Split) .
(. /
$str/ 2
)2 3
;3 4
int 
hora 
= 
int 
. 
Parse $
($ %
	datosHora% .
[. /
$num/ 0
]0 1
)1 2
;2 3
int 
minutos 
= 
int !
.! "
Parse" '
(' (
	datosHora( 1
[1 2
$num2 3
]3 4
)4 5
;5 6
TimeZoneInfo   
zonaColombia   )
=  * +
TimeZoneInfo  , 8
.  8 9"
FindSystemTimeZoneById  9 O
(  O P
$str  P g
)  g h
;  h i
DateTime!! 
convertDate!! $
=!!% &
new!!' *
(!!* +
year!!+ /
,!!/ 0
month!!1 6
,!!6 7
day!!8 ;
,!!; <
hora!!= A
,!!A B
minutos!!C J
,!!J K
$num!!L M
)!!M N
;!!N O
DateTime"" 
fechaColombia"" &
=""' (
TimeZoneInfo"") 5
.""5 6
ConvertTime""6 A
(""A B
convertDate""B M
,""M N
zonaColombia""O [
)""[ \
;""\ ]
return$$ 
fechaColombia$$ $
;$$$ %
}%% 
catch&& 
(&& 
	Exception&& 
)&& 
{'' 
return(( 
new(( 
((( 
$num(( 
,((  
$num((! "
,((" #
$num(($ %
)((% &
;((& '
})) 
}** 	
}++ 
},, 