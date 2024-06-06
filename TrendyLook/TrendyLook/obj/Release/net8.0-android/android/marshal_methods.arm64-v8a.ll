; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [210 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [420 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 59
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 209
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 72
	i64 195258733703605363, ; 3: System.Net.Http.Formatting => 0x2b5b2c8a5b22c73 => 38
	i64 196720943101637631, ; 4: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 147
	i64 210515253464952879, ; 5: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 90
	i64 232391251801502327, ; 6: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 107
	i64 560278790331054453, ; 7: System.Reflection.Primitives => 0x7c6829760de3975 => 169
	i64 590337075967009532, ; 8: Microsoft.Maui.Maps.dll => 0x8314c715ec1a2fc => 74
	i64 648449422406355874, ; 9: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x8ffc15065568ba2 => 49
	i64 670564002081277297, ; 10: Microsoft.Identity.Client.dll => 0x94e526837380571 => 60
	i64 687654259221141486, ; 11: Xamarin.GooglePlayServices.Base => 0x98b09e7c92917ee => 112
	i64 750875890346172408, ; 12: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 196
	i64 799765834175365804, ; 13: System.ComponentModel.dll => 0xb1956c9f18442ac => 131
	i64 805302231655005164, ; 14: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 12
	i64 872800313462103108, ; 15: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 95
	i64 937459790420187032, ; 16: Microsoft.SqlServer.Server.dll => 0xd0286b667351798 => 75
	i64 1010599046655515943, ; 17: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 169
	i64 1060858978308751610, ; 18: Azure.Core.dll => 0xeb8ed9ebee080fa => 35
	i64 1120440138749646132, ; 19: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 111
	i64 1268860745194512059, ; 20: System.Drawing.dll => 0x119be62002c19ebb => 140
	i64 1278906455852160409, ; 21: Microsoft.EntityFrameworkCore.SqlServer.dll => 0x11bf96a54a059599 => 44
	i64 1369545283391376210, ; 22: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 103
	i64 1404195534211153682, ; 23: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 145
	i64 1476839205573959279, ; 24: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 154
	i64 1486715745332614827, ; 25: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 68
	i64 1513467482682125403, ; 26: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 208
	i64 1537168428375924959, ; 27: System.Threading.Thread.dll => 0x15551e8a954ae0df => 196
	i64 1624659445732251991, ; 28: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 87
	i64 1628611045998245443, ; 29: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 100
	i64 1731380447121279447, ; 30: Newtonsoft.Json => 0x18071957e9b889d7 => 76
	i64 1743969030606105336, ; 31: System.Memory.dll => 0x1833d297e88f2af8 => 150
	i64 1767386781656293639, ; 32: System.Private.Uri.dll => 0x188704e9f5582107 => 164
	i64 1795316252682057001, ; 33: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 86
	i64 1825687700144851180, ; 34: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 170
	i64 1835311033149317475, ; 35: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 36: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 107
	i64 1865037103900624886, ; 37: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 39
	i64 1875417405349196092, ; 38: System.Drawing.Primitives => 0x1a06d2319b6c713c => 139
	i64 1881198190668717030, ; 39: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 40: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 70
	i64 1930726298510463061, ; 41: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 37
	i64 1972385128188460614, ; 42: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 181
	i64 1981742497975770890, ; 43: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 99
	i64 2040001226662520565, ; 44: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 195
	i64 2102659300918482391, ; 45: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 139
	i64 2133195048986300728, ; 46: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 76
	i64 2165725771938924357, ; 47: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 88
	i64 2192948757939169934, ; 48: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 42
	i64 2262844636196693701, ; 49: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 95
	i64 2287834202362508563, ; 50: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 122
	i64 2316229908869312383, ; 51: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x2024e6d4884a6f7f => 66
	i64 2329709569556905518, ; 52: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 98
	i64 2335503487726329082, ; 53: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 191
	i64 2470498323731680442, ; 54: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 91
	i64 2497223385847772520, ; 55: System.Runtime => 0x22a7eb7046413568 => 178
	i64 2547086958574651984, ; 56: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 85
	i64 2554797818648757682, ; 57: System.Runtime.Caching.dll => 0x23747714858085b2 => 83
	i64 2602673633151553063, ; 58: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2612152650457191105, ; 59: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 67
	i64 2632269733008246987, ; 60: System.Net.NameResolution => 0x2487b36034f808cb => 152
	i64 2656907746661064104, ; 61: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 51
	i64 2662981627730767622, ; 62: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2789714023057451704, ; 63: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 63
	i64 2815524396660695947, ; 64: System.Security.AccessControl => 0x2712c0857f68238b => 179
	i64 2851879596360956261, ; 65: System.Configuration.ConfigurationManager => 0x2793e9620b477965 => 80
	i64 2895129759130297543, ; 66: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 67: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 111
	i64 3106852385031680087, ; 68: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 177
	i64 3110390492489056344, ; 69: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 183
	i64 3289520064315143713, ; 70: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 97
	i64 3311221304742556517, ; 71: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 161
	i64 3325875462027654285, ; 72: System.Runtime.Numerics => 0x2e27e21c8958b48d => 173
	i64 3328853167529574890, ; 73: System.Net.Sockets.dll => 0x2e327651a008c1ea => 158
	i64 3344514922410554693, ; 74: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 117
	i64 3396143930648122816, ; 75: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 53
	i64 3402534845034375023, ; 76: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 81
	i64 3411255996856937470, ; 77: Xamarin.GooglePlayServices.Basement => 0x2f5737416a942bfe => 113
	i64 3429672777697402584, ; 78: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 72
	i64 3494946837667399002, ; 79: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 47
	i64 3522470458906976663, ; 80: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 108
	i64 3523004241079211829, ; 81: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 46
	i64 3551103847008531295, ; 82: System.Private.CoreLib.dll => 0x31480e226177735f => 206
	i64 3567343442040498961, ; 83: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 84: System.Runtime.dll => 0x319037675df7e556 => 178
	i64 3638003163729360188, ; 85: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 48
	i64 3647754201059316852, ; 86: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 201
	i64 3655542548057982301, ; 87: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 47
	i64 3716579019761409177, ; 88: netstandard.dll => 0x3393f0ed5c8c5c99 => 205
	i64 3727469159507183293, ; 89: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 106
	i64 3869221888984012293, ; 90: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 56
	i64 3889433610606858880, ; 91: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 54
	i64 3890352374528606784, ; 92: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 70
	i64 3919223565570527920, ; 93: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 184
	i64 3933965368022646939, ; 94: System.Net.Requests => 0x369840a8bfadc09b => 155
	i64 3966267475168208030, ; 95: System.Memory => 0x370b03412596249e => 150
	i64 4009997192427317104, ; 96: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 176
	i64 4070326265757318011, ; 97: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 3
	i64 4073500526318903918, ; 98: System.Private.Xml.dll => 0x3887fb25779ae26e => 166
	i64 4120493066591692148, ; 99: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 100: System.ComponentModel => 0x39a7562737acb67e => 131
	i64 4167269041631776580, ; 101: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 197
	i64 4168469861834746866, ; 102: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 180
	i64 4187479170553454871, ; 103: System.Linq.Expressions => 0x3a1cea1e912fa117 => 147
	i64 4202567570116092282, ; 104: Newtonsoft.Json.Bson => 0x3a5284f05958a17a => 77
	i64 4205801962323029395, ; 105: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 130
	i64 4247996603072512073, ; 106: Xamarin.GooglePlayServices.Tasks => 0x3af3ea6755340049 => 115
	i64 4360412976914417659, ; 107: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 28
	i64 4373617458794931033, ; 108: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 146
	i64 4513320955448359355, ; 109: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 43
	i64 4603257529164880280, ; 110: QRCoder => 0x3fe20e556b83d998 => 79
	i64 4612482779465751747, ; 111: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 42
	i64 4672453897036726049, ; 112: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 145
	i64 4716677666592453464, ; 113: System.Xml.XmlSerializer => 0x417501590542f358 => 203
	i64 4743821336939966868, ; 114: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 127
	i64 4794310189461587505, ; 115: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 85
	i64 4795410492532947900, ; 116: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 108
	i64 4809057822547766521, ; 117: System.Drawing => 0x42bd349c3145ecf9 => 140
	i64 4814660307502931973, ; 118: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 152
	i64 4853321196694829351, ; 119: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 172
	i64 4871824391508510238, ; 120: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 18
	i64 4953714692329509532, ; 121: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 26
	i64 5103417709280584325, ; 122: System.Collections.Specialized => 0x46d2fb5e161b6285 => 125
	i64 5182934613077526976, ; 123: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 125
	i64 5278787618751394462, ; 124: System.Net.WebClient.dll => 0x4942055efc68329e => 159
	i64 5290786973231294105, ; 125: System.Runtime.Loader => 0x496ca6b869b72699 => 172
	i64 5423376490970181369, ; 126: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 170
	i64 5471532531798518949, ; 127: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 128: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 129: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 142
	i64 5573260873512690141, ; 130: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 187
	i64 5573669443803475672, ; 131: Microsoft.Maui.Controls.Maps => 0x4d59a6d41d5aeed8 => 69
	i64 5650097808083101034, ; 132: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 181
	i64 5692067934154308417, ; 133: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 110
	i64 5979151488806146654, ; 134: System.Formats.Asn1 => 0x52fa3699a489d25e => 141
	i64 5984759512290286505, ; 135: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 185
	i64 6200764641006662125, ; 136: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 137: System.Text.Json.dll => 0x565a67a0ffe264a7 => 192
	i64 6251069312384999852, ; 138: System.Transactions.Local => 0x56c0426b870da1ac => 199
	i64 6278736998281604212, ; 139: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 163
	i64 6284145129771520194, ; 140: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 167
	i64 6300676701234028427, ; 141: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 6
	i64 6357457916754632952, ; 142: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 143: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 98
	i64 6471714727257221498, ; 144: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 7
	i64 6478287442656530074, ; 145: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6504860066809920875, ; 146: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 88
	i64 6548213210057960872, ; 147: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 94
	i64 6560151584539558821, ; 148: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 58
	i64 6617685658146568858, ; 149: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 189
	i64 6743165466166707109, ; 150: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6786606130239981554, ; 151: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 137
	i64 6814185388980153342, ; 152: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 202
	i64 6876862101832370452, ; 153: System.Xml.Linq => 0x5f6f85a57d108914 => 200
	i64 6893283808111824265, ; 154: Plugin.Maui.Calendar.dll => 0x5fa9dd19ee750d89 => 78
	i64 6894844156784520562, ; 155: System.Numerics.Vectors => 0x5faf683aead1ad72 => 161
	i64 7083547580668757502, ; 156: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 165
	i64 7141281584637745974, ; 157: Xamarin.GooglePlayServices.Maps.dll => 0x631aedc3dd5f1b36 => 114
	i64 7270811800166795866, ; 158: System.Linq => 0x64e71ccf51a90a5a => 149
	i64 7316205155833392065, ; 159: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 120
	i64 7348123982286201829, ; 160: System.Memory.Data.dll => 0x65f9c7d471b2a3e5 => 82
	i64 7377312882064240630, ; 161: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 130
	i64 7488575175965059935, ; 162: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 200
	i64 7489048572193775167, ; 163: System.ObjectModel => 0x67ee71ff6b419e3f => 162
	i64 7496222613193209122, ; 164: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 81
	i64 7592577537120840276, ; 165: System.Diagnostics.Process => 0x695e410af5b2aa54 => 135
	i64 7654504624184590948, ; 166: System.Net.Http => 0x6a3a4366801b8264 => 151
	i64 7714652370974252055, ; 167: System.Private.CoreLib => 0x6b0ff375198b9c17 => 206
	i64 7735176074855944702, ; 168: Microsoft.CSharp => 0x6b58dda848e391fe => 119
	i64 7735352534559001595, ; 169: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 116
	i64 7742555799473854801, ; 170: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 14
	i64 7791074099216502080, ; 171: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 144
	i64 7836164640616011524, ; 172: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 87
	i64 7972383140441761405, ; 173: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 45
	i64 7975724199463739455, ; 174: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 25
	i64 8064050204834738623, ; 175: System.Collections.dll => 0x6fe942efa61731bf => 126
	i64 8083354569033831015, ; 176: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 97
	i64 8087206902342787202, ; 177: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 134
	i64 8108129031893776750, ; 178: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 16
	i64 8167236081217502503, ; 179: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 207
	i64 8185542183669246576, ; 180: System.Collections => 0x7198e33f4794aa70 => 126
	i64 8234598844743906698, ; 181: Microsoft.Identity.Client.Extensions.Msal.dll => 0x72472c0540cd758a => 61
	i64 8246048515196606205, ; 182: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 73
	i64 8264926008854159966, ; 183: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 135
	i64 8368701292315763008, ; 184: System.Security.Cryptography => 0x7423997c6fd56140 => 187
	i64 8386351099740279196, ; 185: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 31
	i64 8400357532724379117, ; 186: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 105
	i64 8410671156615598628, ; 187: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 168
	i64 8513291706828295435, ; 188: Microsoft.SqlServer.Server => 0x762549b3b6c78d0b => 75
	i64 8518412311883997971, ; 189: System.Collections.Immutable => 0x76377add7c28e313 => 123
	i64 8563666267364444763, ; 190: System.Private.Uri => 0x76d841191140ca5b => 164
	i64 8626175481042262068, ; 191: Java.Interop => 0x77b654e585b55834 => 207
	i64 8638972117149407195, ; 192: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 119
	i64 8639588376636138208, ; 193: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 104
	i64 8677882282824630478, ; 194: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 195: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 134
	i64 8941376889969657626, ; 196: System.Xml.XDocument => 0x7c1626e87187471a => 202
	i64 8954753533646919997, ; 197: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 175
	i64 8955323522379913726, ; 198: Microsoft.Identity.Client => 0x7c47b34bd82799fe => 60
	i64 9045785047181495996, ; 199: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9052662452269567435, ; 200: Microsoft.IdentityModel.Protocols => 0x7da184898b0b4dcb => 65
	i64 9111603110219107042, ; 201: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 46
	i64 9138683372487561558, ; 202: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 183
	i64 9250544137016314866, ; 203: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 41
	i64 9271551713462316287, ; 204: QRCoder.dll => 0x80ab2b291d95ecff => 79
	i64 9312692141327339315, ; 205: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 110
	i64 9324707631942237306, ; 206: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 86
	i64 9363564275759486853, ; 207: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 5
	i64 9427266486299436557, ; 208: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 64
	i64 9500688326720985260, ; 209: Microsoft.EntityFrameworkCore.SqlServer => 0x83d939b243e798ac => 44
	i64 9551379474083066910, ; 210: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 29
	i64 9650158550865574924, ; 211: Microsoft.Extensions.Configuration.Json => 0x85ec4012c28a7c0c => 50
	i64 9659729154652888475, ; 212: System.Text.RegularExpressions => 0x860e407c9991dd9b => 193
	i64 9667360217193089419, ; 213: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 136
	i64 9678050649315576968, ; 214: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 91
	i64 9702891218465930390, ; 215: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 124
	i64 9773637193738963987, ; 216: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 1
	i64 9808709177481450983, ; 217: Mono.Android.dll => 0x881f890734e555e7 => 209
	i64 9819168441846169364, ; 218: Microsoft.IdentityModel.Protocols.dll => 0x8844b1ac75f77f14 => 65
	i64 9875200773399460291, ; 219: Xamarin.GooglePlayServices.Base.dll => 0x890bc2c8482339c3 => 112
	i64 9933555792566666578, ; 220: System.Linq.Queryable.dll => 0x89db145cf475c552 => 148
	i64 9956195530459977388, ; 221: Microsoft.Maui => 0x8a2b8315b36616ac => 71
	i64 9994308163963284983, ; 222: Newtonsoft.Json.Bson.dll => 0x8ab2ea52b0d16df7 => 77
	i64 10038780035334861115, ; 223: System.Net.Http.dll => 0x8b50e941206af13b => 151
	i64 10051358222726253779, ; 224: System.Private.Xml => 0x8b7d990c97ccccd3 => 166
	i64 10089571585547156312, ; 225: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 144
	i64 10092835686693276772, ; 226: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 68
	i64 10143853363526200146, ; 227: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10209869394718195525, ; 228: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 19
	i64 10229024438826829339, ; 229: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 94
	i64 10236703004850800690, ; 230: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 157
	i64 10245369515835430794, ; 231: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 168
	i64 10364469296367737616, ; 232: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 167
	i64 10406448008575299332, ; 233: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 117
	i64 10430153318873392755, ; 234: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 92
	i64 10447083246144586668, ; 235: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 39
	i64 10506226065143327199, ; 236: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10546663366131771576, ; 237: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 175
	i64 10670374202010151210, ; 238: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 120
	i64 10761706286639228993, ; 239: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 33
	i64 10785150219063592792, ; 240: System.Net.Primitives => 0x95ac8cfb68830758 => 154
	i64 10811915265162633087, ; 241: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 43
	i64 10822644899632537592, ; 242: System.Linq.Queryable => 0x9631c23204ca5ff8 => 148
	i64 10889380495983713167, ; 243: Microsoft.Data.SqlClient.dll => 0x971ed9dddf2d1b8f => 40
	i64 10964653383833615866, ; 244: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 138
	i64 11002576679268595294, ; 245: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 57
	i64 11009005086950030778, ; 246: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 71
	i64 11103970607964515343, ; 247: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11156122287428000958, ; 248: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 27
	i64 11157797727133427779, ; 249: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 8
	i64 11162124722117608902, ; 250: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 109
	i64 11220793807500858938, ; 251: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 252: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 58
	i64 11340910727871153756, ; 253: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 93
	i64 11341245327015630248, ; 254: System.Configuration.ConfigurationManager.dll => 0x9d643289535355a8 => 80
	i64 11347436699239206956, ; 255: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 203
	i64 11485890710487134646, ; 256: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 171
	i64 11517440453979132662, ; 257: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 62
	i64 11518296021396496455, ; 258: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 259: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 109
	i64 11530571088791430846, ; 260: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 56
	i64 11597940890313164233, ; 261: netstandard => 0xa0f429ca8d1805c9 => 205
	i64 11855031688536399763, ; 262: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 30
	i64 12011556116648931059, ; 263: System.Security.Cryptography.ProtectedData => 0xa6b19ea5ec87aef3 => 84
	i64 12040886584167504988, ; 264: System.Net.ServicePoint => 0xa719d28d8e121c5c => 157
	i64 12048689113179125827, ; 265: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 54
	i64 12058074296353848905, ; 266: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 55
	i64 12102847907131387746, ; 267: System.Buffers => 0xa7f5f40c43256f62 => 121
	i64 12145679461940342714, ; 268: System.Text.Json => 0xa88e1f1ebcb62fba => 192
	i64 12198439281774268251, ; 269: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0xa9498fe58c538f5b => 66
	i64 12201331334810686224, ; 270: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 176
	i64 12269460666702402136, ; 271: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 123
	i64 12439275739440478309, ; 272: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 63
	i64 12451044538927396471, ; 273: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 96
	i64 12466513435562512481, ; 274: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 101
	i64 12475113361194491050, ; 275: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12493213219680520345, ; 276: Microsoft.Data.SqlClient => 0xad60cf3b3e458899 => 40
	i64 12517810545449516888, ; 277: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 137
	i64 12538491095302438457, ; 278: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 89
	i64 12550732019250633519, ; 279: System.IO.Compression => 0xae2d28465e8e1b2f => 143
	i64 12699999919562409296, ; 280: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 136
	i64 12700543734426720211, ; 281: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 90
	i64 12708922737231849740, ; 282: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 190
	i64 12717050818822477433, ; 283: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 177
	i64 12835242264250840079, ; 284: System.IO.Pipes => 0xb21ff0d5d6c0740f => 146
	i64 12843321153144804894, ; 285: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 59
	i64 12859557719246324186, ; 286: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 160
	i64 12989346753972519995, ; 287: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 0
	i64 13005833372463390146, ; 288: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 21
	i64 13068258254871114833, ; 289: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 174
	i64 13343850469010654401, ; 290: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 208
	i64 13381594904270902445, ; 291: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13431476299110033919, ; 292: System.Net.WebClient => 0xba663087f18829ff => 159
	i64 13463706743370286408, ; 293: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 163
	i64 13465488254036897740, ; 294: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 116
	i64 13540124433173649601, ; 295: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13550417756503177631, ; 296: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 53
	i64 13572454107664307259, ; 297: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 106
	i64 13581429335308513849, ; 298: TrendyLook.dll => 0xbc7aee05e1223239 => 118
	i64 13710614125866346983, ; 299: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 179
	i64 13717397318615465333, ; 300: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 129
	i64 13742054908850494594, ; 301: Azure.Identity => 0xbeb596218df25c82 => 36
	i64 13881769479078963060, ; 302: System.Console.dll => 0xc0a5f3cade5c6774 => 132
	i64 13959074834287824816, ; 303: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 96
	i64 13995262516031000757, ; 304: TrendyLook => 0xc239291bb65e10b5 => 118
	i64 14124974489674258913, ; 305: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 89
	i64 14125464355221830302, ; 306: System.Threading.dll => 0xc407bafdbc707a9e => 198
	i64 14133832980772275001, ; 307: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 41
	i64 14212104595480609394, ; 308: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 182
	i64 14254574811015963973, ; 309: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 190
	i64 14327709162229390963, ; 310: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 186
	i64 14349907877893689639, ; 311: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 23
	i64 14461014870687870182, ; 312: System.Net.Requests.dll => 0xc8afd8683afdece6 => 155
	i64 14464374589798375073, ; 313: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14491877563792607819, ; 314: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 32
	i64 14551742072151931844, ; 315: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 191
	i64 14561513370130550166, ; 316: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 185
	i64 14610046442689856844, ; 317: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 2
	i64 14622043554576106986, ; 318: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 174
	i64 14648804764802849406, ; 319: Azure.Identity.dll => 0xcb4b0252261f9a7e => 36
	i64 14669215534098758659, ; 320: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 51
	i64 14705122255218365489, ; 321: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14735017007120366644, ; 322: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 15
	i64 14744092281598614090, ; 323: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14832630590065248058, ; 324: System.Security.Claims => 0xcdd816ef5d6e873a => 180
	i64 14852515768018889994, ; 325: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 93
	i64 14904040806490515477, ; 326: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14912225920358050525, ; 327: System.Security.Principal.Windows => 0xcef2de7759506add => 188
	i64 14935719434541007538, ; 328: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 189
	i64 14954917835170835695, ; 329: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 52
	i64 14984936317414011727, ; 330: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 160
	i64 14987728460634540364, ; 331: System.IO.Compression.dll => 0xcfff1ba06622494c => 143
	i64 15015154896917945444, ; 332: System.Net.Security.dll => 0xd0608bd33642dc64 => 156
	i64 15076659072870671916, ; 333: System.ObjectModel.dll => 0xd13b0d8c1620662c => 162
	i64 15082578449315132289, ; 334: Plugin.Maui.Calendar => 0xd15015305063f381 => 78
	i64 15111608613780139878, ; 335: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 336: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 142
	i64 15133485256822086103, ; 337: System.Linq.dll => 0xd204f0a9127dd9d7 => 149
	i64 15138356091203993725, ; 338: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 62
	i64 15203009853192377507, ; 339: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 22
	i64 15227001540531775957, ; 340: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 48
	i64 15370334346939861994, ; 341: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 92
	i64 15383240894167415497, ; 342: System.Memory.Data => 0xd57c4016df1c7ac9 => 82
	i64 15391712275433856905, ; 343: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 52
	i64 15527772828719725935, ; 344: System.Console => 0xd77dbb1e38cd3d6f => 132
	i64 15536481058354060254, ; 345: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15541854775306130054, ; 346: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 186
	i64 15557562860424774966, ; 347: System.Net.Sockets => 0xd7e790fe7a6dc536 => 158
	i64 15582737692548360875, ; 348: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 100
	i64 15609085926864131306, ; 349: System.dll => 0xd89e9cf3334914ea => 204
	i64 15661133872274321916, ; 350: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 201
	i64 15783653065526199428, ; 351: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15827202283623377193, ; 352: Microsoft.Extensions.Configuration.Json.dll => 0xdba5849eef9f6929 => 50
	i64 15847085070278954535, ; 353: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 194
	i64 15930129725311349754, ; 354: Xamarin.GooglePlayServices.Tasks.dll => 0xdd1330956f12f3fa => 115
	i64 15937190497610202713, ; 355: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 182
	i64 15963349826457351533, ; 356: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 195
	i64 16018552496348375205, ; 357: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 153
	i64 16056281320585338352, ; 358: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 24
	i64 16154507427712707110, ; 359: System => 0xe03056ea4e39aa26 => 204
	i64 16182611612321266217, ; 360: Microsoft.Maui.Maps => 0xe0942f85b2853a29 => 74
	i64 16219561732052121626, ; 361: System.Net.Security => 0xe1177575db7c781a => 156
	i64 16288847719894691167, ; 362: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 363: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 57
	i64 16337011941688632206, ; 364: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 188
	i64 16454459195343277943, ; 365: System.Net.NetworkInformation => 0xe459fb756d988f77 => 153
	i64 16648892297579399389, ; 366: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 37
	i64 16649148416072044166, ; 367: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 73
	i64 16677317093839702854, ; 368: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 105
	i64 16803648858859583026, ; 369: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 17
	i64 16856067890322379635, ; 370: System.Data.Common.dll => 0xe9ecc87060889373 => 133
	i64 16890310621557459193, ; 371: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 193
	i64 16942731696432749159, ; 372: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16945858842201062480, ; 373: Azure.Core => 0xeb2bc8d57f4e7c50 => 35
	i64 16998075588627545693, ; 374: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 103
	i64 17008137082415910100, ; 375: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 124
	i64 17027804579603049667, ; 376: Microsoft.Maui.Controls.Maps.dll => 0xec4eea0c48026cc3 => 69
	i64 17031351772568316411, ; 377: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 102
	i64 17047433665992082296, ; 378: Microsoft.Extensions.Configuration.FileExtensions => 0xec94a699197e4378 => 49
	i64 17062143951396181894, ; 379: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 129
	i64 17118171214553292978, ; 380: System.Threading.Channels => 0xed8ff6060fc420b2 => 194
	i64 17137864900836977098, ; 381: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 67
	i64 17187273293601214786, ; 382: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 127
	i64 17197986060146327831, ; 383: Microsoft.Identity.Client.Extensions.Msal => 0xeeab8533ef244117 => 61
	i64 17201328579425343169, ; 384: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 128
	i64 17202182880784296190, ; 385: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 184
	i64 17203614576212522419, ; 386: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 20
	i64 17205988430934219272, ; 387: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 55
	i64 17230721278011714856, ; 388: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 165
	i64 17234219099804750107, ; 389: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 199
	i64 17260702271250283638, ; 390: System.Data.Common => 0xef8a5543bba6bc76 => 133
	i64 17310278548634113468, ; 391: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 10
	i64 17333249706306540043, ; 392: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 138
	i64 17342750010158924305, ; 393: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17371436720558481852, ; 394: System.Runtime.Caching => 0xf113bda8d710a1bc => 83
	i64 17514990004910432069, ; 395: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17523946658117960076, ; 396: System.Security.Cryptography.ProtectedData.dll => 0xf33190a3c403c18c => 84
	i64 17623389608345532001, ; 397: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17704177640604968747, ; 398: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 101
	i64 17710060891934109755, ; 399: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 99
	i64 17712670374920797664, ; 400: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 171
	i64 17727188866493996799, ; 401: System.Net.Http.Formatting.dll => 0xf603a059f5a25eff => 38
	i64 17777860260071588075, ; 402: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 173
	i64 17790600151040787804, ; 403: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 64
	i64 17827813215687577648, ; 404: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 11
	i64 17838668724098252521, ; 405: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 121
	i64 17942426894774770628, ; 406: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 4
	i64 17969331831154222830, ; 407: Xamarin.GooglePlayServices.Maps => 0xf95fe418471126ee => 114
	i64 17986907704309214542, ; 408: Xamarin.GooglePlayServices.Basement.dll => 0xf99e554223166d4e => 113
	i64 18017743553296241350, ; 409: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 45
	i64 18025913125965088385, ; 410: System.Threading => 0xfa28e87b91334681 => 198
	i64 18121036031235206392, ; 411: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 102
	i64 18146411883821974900, ; 412: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 141
	i64 18146811631844267958, ; 413: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 128
	i64 18225059387460068507, ; 414: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 197
	i64 18245806341561545090, ; 415: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 122
	i64 18305135509493619199, ; 416: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 104
	i64 18324163916253801303, ; 417: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18342408478508122430, ; 418: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 13
	i64 18358161419737137786 ; 419: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 9
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [420 x i32] [
	i32 59, ; 0
	i32 209, ; 1
	i32 72, ; 2
	i32 38, ; 3
	i32 147, ; 4
	i32 90, ; 5
	i32 107, ; 6
	i32 169, ; 7
	i32 74, ; 8
	i32 49, ; 9
	i32 60, ; 10
	i32 112, ; 11
	i32 196, ; 12
	i32 131, ; 13
	i32 12, ; 14
	i32 95, ; 15
	i32 75, ; 16
	i32 169, ; 17
	i32 35, ; 18
	i32 111, ; 19
	i32 140, ; 20
	i32 44, ; 21
	i32 103, ; 22
	i32 145, ; 23
	i32 154, ; 24
	i32 68, ; 25
	i32 208, ; 26
	i32 196, ; 27
	i32 87, ; 28
	i32 100, ; 29
	i32 76, ; 30
	i32 150, ; 31
	i32 164, ; 32
	i32 86, ; 33
	i32 170, ; 34
	i32 6, ; 35
	i32 107, ; 36
	i32 39, ; 37
	i32 139, ; 38
	i32 28, ; 39
	i32 70, ; 40
	i32 37, ; 41
	i32 181, ; 42
	i32 99, ; 43
	i32 195, ; 44
	i32 139, ; 45
	i32 76, ; 46
	i32 88, ; 47
	i32 42, ; 48
	i32 95, ; 49
	i32 122, ; 50
	i32 66, ; 51
	i32 98, ; 52
	i32 191, ; 53
	i32 91, ; 54
	i32 178, ; 55
	i32 85, ; 56
	i32 83, ; 57
	i32 27, ; 58
	i32 67, ; 59
	i32 152, ; 60
	i32 51, ; 61
	i32 2, ; 62
	i32 63, ; 63
	i32 179, ; 64
	i32 80, ; 65
	i32 7, ; 66
	i32 111, ; 67
	i32 177, ; 68
	i32 183, ; 69
	i32 97, ; 70
	i32 161, ; 71
	i32 173, ; 72
	i32 158, ; 73
	i32 117, ; 74
	i32 53, ; 75
	i32 81, ; 76
	i32 113, ; 77
	i32 72, ; 78
	i32 47, ; 79
	i32 108, ; 80
	i32 46, ; 81
	i32 206, ; 82
	i32 22, ; 83
	i32 178, ; 84
	i32 48, ; 85
	i32 201, ; 86
	i32 47, ; 87
	i32 205, ; 88
	i32 106, ; 89
	i32 56, ; 90
	i32 54, ; 91
	i32 70, ; 92
	i32 184, ; 93
	i32 155, ; 94
	i32 150, ; 95
	i32 176, ; 96
	i32 3, ; 97
	i32 166, ; 98
	i32 33, ; 99
	i32 131, ; 100
	i32 197, ; 101
	i32 180, ; 102
	i32 147, ; 103
	i32 77, ; 104
	i32 130, ; 105
	i32 115, ; 106
	i32 28, ; 107
	i32 146, ; 108
	i32 43, ; 109
	i32 79, ; 110
	i32 42, ; 111
	i32 145, ; 112
	i32 203, ; 113
	i32 127, ; 114
	i32 85, ; 115
	i32 108, ; 116
	i32 140, ; 117
	i32 152, ; 118
	i32 172, ; 119
	i32 18, ; 120
	i32 26, ; 121
	i32 125, ; 122
	i32 125, ; 123
	i32 159, ; 124
	i32 172, ; 125
	i32 170, ; 126
	i32 26, ; 127
	i32 29, ; 128
	i32 142, ; 129
	i32 187, ; 130
	i32 69, ; 131
	i32 181, ; 132
	i32 110, ; 133
	i32 141, ; 134
	i32 185, ; 135
	i32 23, ; 136
	i32 192, ; 137
	i32 199, ; 138
	i32 163, ; 139
	i32 167, ; 140
	i32 6, ; 141
	i32 34, ; 142
	i32 98, ; 143
	i32 7, ; 144
	i32 11, ; 145
	i32 88, ; 146
	i32 94, ; 147
	i32 58, ; 148
	i32 189, ; 149
	i32 19, ; 150
	i32 137, ; 151
	i32 202, ; 152
	i32 200, ; 153
	i32 78, ; 154
	i32 161, ; 155
	i32 165, ; 156
	i32 114, ; 157
	i32 149, ; 158
	i32 120, ; 159
	i32 82, ; 160
	i32 130, ; 161
	i32 200, ; 162
	i32 162, ; 163
	i32 81, ; 164
	i32 135, ; 165
	i32 151, ; 166
	i32 206, ; 167
	i32 119, ; 168
	i32 116, ; 169
	i32 14, ; 170
	i32 144, ; 171
	i32 87, ; 172
	i32 45, ; 173
	i32 25, ; 174
	i32 126, ; 175
	i32 97, ; 176
	i32 134, ; 177
	i32 16, ; 178
	i32 207, ; 179
	i32 126, ; 180
	i32 61, ; 181
	i32 73, ; 182
	i32 135, ; 183
	i32 187, ; 184
	i32 31, ; 185
	i32 105, ; 186
	i32 168, ; 187
	i32 75, ; 188
	i32 123, ; 189
	i32 164, ; 190
	i32 207, ; 191
	i32 119, ; 192
	i32 104, ; 193
	i32 21, ; 194
	i32 134, ; 195
	i32 202, ; 196
	i32 175, ; 197
	i32 60, ; 198
	i32 31, ; 199
	i32 65, ; 200
	i32 46, ; 201
	i32 183, ; 202
	i32 41, ; 203
	i32 79, ; 204
	i32 110, ; 205
	i32 86, ; 206
	i32 5, ; 207
	i32 64, ; 208
	i32 44, ; 209
	i32 29, ; 210
	i32 50, ; 211
	i32 193, ; 212
	i32 136, ; 213
	i32 91, ; 214
	i32 124, ; 215
	i32 1, ; 216
	i32 209, ; 217
	i32 65, ; 218
	i32 112, ; 219
	i32 148, ; 220
	i32 71, ; 221
	i32 77, ; 222
	i32 151, ; 223
	i32 166, ; 224
	i32 144, ; 225
	i32 68, ; 226
	i32 3, ; 227
	i32 19, ; 228
	i32 94, ; 229
	i32 157, ; 230
	i32 168, ; 231
	i32 167, ; 232
	i32 117, ; 233
	i32 92, ; 234
	i32 39, ; 235
	i32 1, ; 236
	i32 175, ; 237
	i32 120, ; 238
	i32 33, ; 239
	i32 154, ; 240
	i32 43, ; 241
	i32 148, ; 242
	i32 40, ; 243
	i32 138, ; 244
	i32 57, ; 245
	i32 71, ; 246
	i32 12, ; 247
	i32 27, ; 248
	i32 8, ; 249
	i32 109, ; 250
	i32 15, ; 251
	i32 58, ; 252
	i32 93, ; 253
	i32 80, ; 254
	i32 203, ; 255
	i32 171, ; 256
	i32 62, ; 257
	i32 13, ; 258
	i32 109, ; 259
	i32 56, ; 260
	i32 205, ; 261
	i32 30, ; 262
	i32 84, ; 263
	i32 157, ; 264
	i32 54, ; 265
	i32 55, ; 266
	i32 121, ; 267
	i32 192, ; 268
	i32 66, ; 269
	i32 176, ; 270
	i32 123, ; 271
	i32 63, ; 272
	i32 96, ; 273
	i32 101, ; 274
	i32 34, ; 275
	i32 40, ; 276
	i32 137, ; 277
	i32 89, ; 278
	i32 143, ; 279
	i32 136, ; 280
	i32 90, ; 281
	i32 190, ; 282
	i32 177, ; 283
	i32 146, ; 284
	i32 59, ; 285
	i32 160, ; 286
	i32 0, ; 287
	i32 21, ; 288
	i32 174, ; 289
	i32 208, ; 290
	i32 9, ; 291
	i32 159, ; 292
	i32 163, ; 293
	i32 116, ; 294
	i32 30, ; 295
	i32 53, ; 296
	i32 106, ; 297
	i32 118, ; 298
	i32 179, ; 299
	i32 129, ; 300
	i32 36, ; 301
	i32 132, ; 302
	i32 96, ; 303
	i32 118, ; 304
	i32 89, ; 305
	i32 198, ; 306
	i32 41, ; 307
	i32 182, ; 308
	i32 190, ; 309
	i32 186, ; 310
	i32 23, ; 311
	i32 155, ; 312
	i32 24, ; 313
	i32 32, ; 314
	i32 191, ; 315
	i32 185, ; 316
	i32 2, ; 317
	i32 174, ; 318
	i32 36, ; 319
	i32 51, ; 320
	i32 16, ; 321
	i32 15, ; 322
	i32 32, ; 323
	i32 180, ; 324
	i32 93, ; 325
	i32 0, ; 326
	i32 188, ; 327
	i32 189, ; 328
	i32 52, ; 329
	i32 160, ; 330
	i32 143, ; 331
	i32 156, ; 332
	i32 162, ; 333
	i32 78, ; 334
	i32 17, ; 335
	i32 142, ; 336
	i32 149, ; 337
	i32 62, ; 338
	i32 22, ; 339
	i32 48, ; 340
	i32 92, ; 341
	i32 82, ; 342
	i32 52, ; 343
	i32 132, ; 344
	i32 4, ; 345
	i32 186, ; 346
	i32 158, ; 347
	i32 100, ; 348
	i32 204, ; 349
	i32 201, ; 350
	i32 5, ; 351
	i32 50, ; 352
	i32 194, ; 353
	i32 115, ; 354
	i32 182, ; 355
	i32 195, ; 356
	i32 153, ; 357
	i32 24, ; 358
	i32 204, ; 359
	i32 74, ; 360
	i32 156, ; 361
	i32 18, ; 362
	i32 57, ; 363
	i32 188, ; 364
	i32 153, ; 365
	i32 37, ; 366
	i32 73, ; 367
	i32 105, ; 368
	i32 17, ; 369
	i32 133, ; 370
	i32 193, ; 371
	i32 25, ; 372
	i32 35, ; 373
	i32 103, ; 374
	i32 124, ; 375
	i32 69, ; 376
	i32 102, ; 377
	i32 49, ; 378
	i32 129, ; 379
	i32 194, ; 380
	i32 67, ; 381
	i32 127, ; 382
	i32 61, ; 383
	i32 128, ; 384
	i32 184, ; 385
	i32 20, ; 386
	i32 55, ; 387
	i32 165, ; 388
	i32 199, ; 389
	i32 133, ; 390
	i32 10, ; 391
	i32 138, ; 392
	i32 10, ; 393
	i32 83, ; 394
	i32 8, ; 395
	i32 84, ; 396
	i32 20, ; 397
	i32 101, ; 398
	i32 99, ; 399
	i32 171, ; 400
	i32 38, ; 401
	i32 173, ; 402
	i32 64, ; 403
	i32 11, ; 404
	i32 121, ; 405
	i32 4, ; 406
	i32 114, ; 407
	i32 113, ; 408
	i32 45, ; 409
	i32 198, ; 410
	i32 102, ; 411
	i32 141, ; 412
	i32 128, ; 413
	i32 197, ; 414
	i32 122, ; 415
	i32 104, ; 416
	i32 14, ; 417
	i32 13, ; 418
	i32 9 ; 419
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
