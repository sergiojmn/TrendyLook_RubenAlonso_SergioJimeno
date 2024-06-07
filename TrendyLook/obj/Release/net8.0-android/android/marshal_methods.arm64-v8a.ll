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

@assembly_image_cache = dso_local local_unnamed_addr global [215 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [430 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 59
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 214
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 72
	i64 195258733703605363, ; 3: System.Net.Http.Formatting => 0x2b5b2c8a5b22c73 => 38
	i64 196720943101637631, ; 4: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 149
	i64 210515253464952879, ; 5: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 90
	i64 232391251801502327, ; 6: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 107
	i64 560278790331054453, ; 7: System.Reflection.Primitives => 0x7c6829760de3975 => 173
	i64 590337075967009532, ; 8: Microsoft.Maui.Maps.dll => 0x8314c715ec1a2fc => 74
	i64 648449422406355874, ; 9: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x8ffc15065568ba2 => 49
	i64 670564002081277297, ; 10: Microsoft.Identity.Client.dll => 0x94e526837380571 => 60
	i64 687654259221141486, ; 11: Xamarin.GooglePlayServices.Base => 0x98b09e7c92917ee => 113
	i64 750875890346172408, ; 12: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 200
	i64 799765834175365804, ; 13: System.ComponentModel.dll => 0xb1956c9f18442ac => 132
	i64 805302231655005164, ; 14: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 12
	i64 872800313462103108, ; 15: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 95
	i64 937459790420187032, ; 16: Microsoft.SqlServer.Server.dll => 0xd0286b667351798 => 75
	i64 1010599046655515943, ; 17: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 173
	i64 1060858978308751610, ; 18: Azure.Core.dll => 0xeb8ed9ebee080fa => 35
	i64 1120440138749646132, ; 19: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 112
	i64 1268860745194512059, ; 20: System.Drawing.dll => 0x119be62002c19ebb => 142
	i64 1278906455852160409, ; 21: Microsoft.EntityFrameworkCore.SqlServer.dll => 0x11bf96a54a059599 => 44
	i64 1369545283391376210, ; 22: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 103
	i64 1404195534211153682, ; 23: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 147
	i64 1476839205573959279, ; 24: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 157
	i64 1486715745332614827, ; 25: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 68
	i64 1513467482682125403, ; 26: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 213
	i64 1537168428375924959, ; 27: System.Threading.Thread.dll => 0x15551e8a954ae0df => 200
	i64 1624659445732251991, ; 28: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 87
	i64 1628611045998245443, ; 29: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 100
	i64 1731380447121279447, ; 30: Newtonsoft.Json => 0x18071957e9b889d7 => 76
	i64 1735388228521408345, ; 31: System.Net.Mail.dll => 0x181556663c69b759 => 154
	i64 1743969030606105336, ; 32: System.Memory.dll => 0x1833d297e88f2af8 => 152
	i64 1767386781656293639, ; 33: System.Private.Uri.dll => 0x188704e9f5582107 => 168
	i64 1795316252682057001, ; 34: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 86
	i64 1825687700144851180, ; 35: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 174
	i64 1835311033149317475, ; 36: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 37: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 107
	i64 1865037103900624886, ; 38: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 39
	i64 1875417405349196092, ; 39: System.Drawing.Primitives => 0x1a06d2319b6c713c => 141
	i64 1881198190668717030, ; 40: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 41: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 70
	i64 1930726298510463061, ; 42: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 37
	i64 1972385128188460614, ; 43: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 185
	i64 1981742497975770890, ; 44: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 99
	i64 2040001226662520565, ; 45: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 199
	i64 2102659300918482391, ; 46: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 141
	i64 2133195048986300728, ; 47: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 76
	i64 2165725771938924357, ; 48: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 88
	i64 2192948757939169934, ; 49: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 42
	i64 2262844636196693701, ; 50: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 95
	i64 2287834202362508563, ; 51: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 123
	i64 2316229908869312383, ; 52: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x2024e6d4884a6f7f => 66
	i64 2329709569556905518, ; 53: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 98
	i64 2335503487726329082, ; 54: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 195
	i64 2470498323731680442, ; 55: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 91
	i64 2497223385847772520, ; 56: System.Runtime => 0x22a7eb7046413568 => 182
	i64 2547086958574651984, ; 57: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 85
	i64 2554797818648757682, ; 58: System.Runtime.Caching.dll => 0x23747714858085b2 => 83
	i64 2602673633151553063, ; 59: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2612152650457191105, ; 60: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 67
	i64 2624866290265602282, ; 61: mscorlib.dll => 0x246d65fbde2db8ea => 209
	i64 2632269733008246987, ; 62: System.Net.NameResolution => 0x2487b36034f808cb => 155
	i64 2656907746661064104, ; 63: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 51
	i64 2662981627730767622, ; 64: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2789714023057451704, ; 65: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 63
	i64 2815524396660695947, ; 66: System.Security.AccessControl => 0x2712c0857f68238b => 183
	i64 2851879596360956261, ; 67: System.Configuration.ConfigurationManager => 0x2793e9620b477965 => 80
	i64 2895129759130297543, ; 68: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 69: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 112
	i64 3106852385031680087, ; 70: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 181
	i64 3110390492489056344, ; 71: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 187
	i64 3289520064315143713, ; 72: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 97
	i64 3311221304742556517, ; 73: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 164
	i64 3325875462027654285, ; 74: System.Runtime.Numerics => 0x2e27e21c8958b48d => 177
	i64 3328853167529574890, ; 75: System.Net.Sockets.dll => 0x2e327651a008c1ea => 161
	i64 3344514922410554693, ; 76: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 118
	i64 3396143930648122816, ; 77: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 53
	i64 3402534845034375023, ; 78: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 81
	i64 3411255996856937470, ; 79: Xamarin.GooglePlayServices.Basement => 0x2f5737416a942bfe => 114
	i64 3429672777697402584, ; 80: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 72
	i64 3494946837667399002, ; 81: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 47
	i64 3522470458906976663, ; 82: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 108
	i64 3523004241079211829, ; 83: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 46
	i64 3531994851595924923, ; 84: System.Numerics => 0x31042a9aade235bb => 165
	i64 3551103847008531295, ; 85: System.Private.CoreLib.dll => 0x31480e226177735f => 211
	i64 3567343442040498961, ; 86: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 87: System.Runtime.dll => 0x319037675df7e556 => 182
	i64 3638003163729360188, ; 88: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 48
	i64 3647754201059316852, ; 89: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 205
	i64 3655542548057982301, ; 90: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 47
	i64 3716579019761409177, ; 91: netstandard.dll => 0x3393f0ed5c8c5c99 => 210
	i64 3727469159507183293, ; 92: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 106
	i64 3869221888984012293, ; 93: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 56
	i64 3889433610606858880, ; 94: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 54
	i64 3890352374528606784, ; 95: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 70
	i64 3919223565570527920, ; 96: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 188
	i64 3933965368022646939, ; 97: System.Net.Requests => 0x369840a8bfadc09b => 158
	i64 3966267475168208030, ; 98: System.Memory => 0x370b03412596249e => 152
	i64 4009997192427317104, ; 99: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 180
	i64 4070326265757318011, ; 100: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 3
	i64 4073500526318903918, ; 101: System.Private.Xml.dll => 0x3887fb25779ae26e => 170
	i64 4120493066591692148, ; 102: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 103: System.ComponentModel => 0x39a7562737acb67e => 132
	i64 4167269041631776580, ; 104: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 201
	i64 4168469861834746866, ; 105: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 184
	i64 4187479170553454871, ; 106: System.Linq.Expressions => 0x3a1cea1e912fa117 => 149
	i64 4202567570116092282, ; 107: Newtonsoft.Json.Bson => 0x3a5284f05958a17a => 77
	i64 4205801962323029395, ; 108: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 131
	i64 4247996603072512073, ; 109: Xamarin.GooglePlayServices.Tasks => 0x3af3ea6755340049 => 116
	i64 4360412976914417659, ; 110: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 28
	i64 4373617458794931033, ; 111: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 148
	i64 4513320955448359355, ; 112: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 43
	i64 4603257529164880280, ; 113: QRCoder => 0x3fe20e556b83d998 => 79
	i64 4612482779465751747, ; 114: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 42
	i64 4672453897036726049, ; 115: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 147
	i64 4716677666592453464, ; 116: System.Xml.XmlSerializer => 0x417501590542f358 => 207
	i64 4743821336939966868, ; 117: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 128
	i64 4794310189461587505, ; 118: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 85
	i64 4795410492532947900, ; 119: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 108
	i64 4809057822547766521, ; 120: System.Drawing => 0x42bd349c3145ecf9 => 142
	i64 4814660307502931973, ; 121: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 155
	i64 4853321196694829351, ; 122: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 176
	i64 4871824391508510238, ; 123: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 18
	i64 4953714692329509532, ; 124: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 26
	i64 5103417709280584325, ; 125: System.Collections.Specialized => 0x46d2fb5e161b6285 => 126
	i64 5182934613077526976, ; 126: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 126
	i64 5203618020066742981, ; 127: Xamarin.Essentials => 0x4836f704f0e652c5 => 111
	i64 5278787618751394462, ; 128: System.Net.WebClient.dll => 0x4942055efc68329e => 162
	i64 5290786973231294105, ; 129: System.Runtime.Loader => 0x496ca6b869b72699 => 176
	i64 5423376490970181369, ; 130: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 174
	i64 5471532531798518949, ; 131: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5507995362134886206, ; 132: System.Core.dll => 0x4c705499688c873e => 134
	i64 5522859530602327440, ; 133: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 134: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 144
	i64 5573260873512690141, ; 135: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 191
	i64 5573669443803475672, ; 136: Microsoft.Maui.Controls.Maps => 0x4d59a6d41d5aeed8 => 69
	i64 5650097808083101034, ; 137: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 185
	i64 5692067934154308417, ; 138: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 110
	i64 5979151488806146654, ; 139: System.Formats.Asn1 => 0x52fa3699a489d25e => 143
	i64 5984759512290286505, ; 140: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 189
	i64 6200764641006662125, ; 141: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 142: System.Text.Json.dll => 0x565a67a0ffe264a7 => 196
	i64 6251069312384999852, ; 143: System.Transactions.Local => 0x56c0426b870da1ac => 203
	i64 6278736998281604212, ; 144: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 167
	i64 6284145129771520194, ; 145: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 171
	i64 6300676701234028427, ; 146: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 6
	i64 6357457916754632952, ; 147: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 148: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 98
	i64 6471714727257221498, ; 149: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 7
	i64 6478287442656530074, ; 150: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6504860066809920875, ; 151: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 88
	i64 6548213210057960872, ; 152: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 94
	i64 6560151584539558821, ; 153: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 58
	i64 6617685658146568858, ; 154: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 193
	i64 6743165466166707109, ; 155: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6786606130239981554, ; 156: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 139
	i64 6814185388980153342, ; 157: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 206
	i64 6876862101832370452, ; 158: System.Xml.Linq => 0x5f6f85a57d108914 => 204
	i64 6893283808111824265, ; 159: Plugin.Maui.Calendar.dll => 0x5fa9dd19ee750d89 => 78
	i64 6894844156784520562, ; 160: System.Numerics.Vectors => 0x5faf683aead1ad72 => 164
	i64 7083547580668757502, ; 161: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 169
	i64 7141281584637745974, ; 162: Xamarin.GooglePlayServices.Maps.dll => 0x631aedc3dd5f1b36 => 115
	i64 7270811800166795866, ; 163: System.Linq => 0x64e71ccf51a90a5a => 151
	i64 7316205155833392065, ; 164: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 121
	i64 7348123982286201829, ; 165: System.Memory.Data.dll => 0x65f9c7d471b2a3e5 => 82
	i64 7377312882064240630, ; 166: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 131
	i64 7488575175965059935, ; 167: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 204
	i64 7489048572193775167, ; 168: System.ObjectModel => 0x67ee71ff6b419e3f => 166
	i64 7496222613193209122, ; 169: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 81
	i64 7592577537120840276, ; 170: System.Diagnostics.Process => 0x695e410af5b2aa54 => 137
	i64 7637365915383206639, ; 171: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 111
	i64 7654504624184590948, ; 172: System.Net.Http => 0x6a3a4366801b8264 => 153
	i64 7694700312542370399, ; 173: System.Net.Mail => 0x6ac9112a7e2cda5f => 154
	i64 7714652370974252055, ; 174: System.Private.CoreLib => 0x6b0ff375198b9c17 => 211
	i64 7735176074855944702, ; 175: Microsoft.CSharp => 0x6b58dda848e391fe => 120
	i64 7735352534559001595, ; 176: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 117
	i64 7742555799473854801, ; 177: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 14
	i64 7791074099216502080, ; 178: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 146
	i64 7836164640616011524, ; 179: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 87
	i64 7972383140441761405, ; 180: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 45
	i64 7975724199463739455, ; 181: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 25
	i64 8064050204834738623, ; 182: System.Collections.dll => 0x6fe942efa61731bf => 127
	i64 8083354569033831015, ; 183: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 97
	i64 8087206902342787202, ; 184: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 136
	i64 8108129031893776750, ; 185: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 16
	i64 8167236081217502503, ; 186: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 212
	i64 8185542183669246576, ; 187: System.Collections => 0x7198e33f4794aa70 => 127
	i64 8234598844743906698, ; 188: Microsoft.Identity.Client.Extensions.Msal.dll => 0x72472c0540cd758a => 61
	i64 8246048515196606205, ; 189: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 73
	i64 8264926008854159966, ; 190: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 137
	i64 8368701292315763008, ; 191: System.Security.Cryptography => 0x7423997c6fd56140 => 191
	i64 8386351099740279196, ; 192: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 31
	i64 8400357532724379117, ; 193: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 105
	i64 8410671156615598628, ; 194: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 172
	i64 8513291706828295435, ; 195: Microsoft.SqlServer.Server => 0x762549b3b6c78d0b => 75
	i64 8518412311883997971, ; 196: System.Collections.Immutable => 0x76377add7c28e313 => 124
	i64 8563666267364444763, ; 197: System.Private.Uri => 0x76d841191140ca5b => 168
	i64 8626175481042262068, ; 198: Java.Interop => 0x77b654e585b55834 => 212
	i64 8638972117149407195, ; 199: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 120
	i64 8639588376636138208, ; 200: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 104
	i64 8677882282824630478, ; 201: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 202: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 136
	i64 8941376889969657626, ; 203: System.Xml.XDocument => 0x7c1626e87187471a => 206
	i64 8954753533646919997, ; 204: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 179
	i64 8955323522379913726, ; 205: Microsoft.Identity.Client => 0x7c47b34bd82799fe => 60
	i64 9045785047181495996, ; 206: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9052662452269567435, ; 207: Microsoft.IdentityModel.Protocols => 0x7da184898b0b4dcb => 65
	i64 9111603110219107042, ; 208: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 46
	i64 9138683372487561558, ; 209: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 187
	i64 9250544137016314866, ; 210: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 41
	i64 9271551713462316287, ; 211: QRCoder.dll => 0x80ab2b291d95ecff => 79
	i64 9312692141327339315, ; 212: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 110
	i64 9324707631942237306, ; 213: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 86
	i64 9363564275759486853, ; 214: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 5
	i64 9427266486299436557, ; 215: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 64
	i64 9500688326720985260, ; 216: Microsoft.EntityFrameworkCore.SqlServer => 0x83d939b243e798ac => 44
	i64 9551379474083066910, ; 217: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 29
	i64 9650158550865574924, ; 218: Microsoft.Extensions.Configuration.Json => 0x85ec4012c28a7c0c => 50
	i64 9659729154652888475, ; 219: System.Text.RegularExpressions => 0x860e407c9991dd9b => 197
	i64 9662334977499516867, ; 220: System.Numerics.dll => 0x8617827802b0cfc3 => 165
	i64 9667360217193089419, ; 221: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 138
	i64 9678050649315576968, ; 222: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 91
	i64 9702891218465930390, ; 223: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 125
	i64 9773637193738963987, ; 224: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 1
	i64 9808709177481450983, ; 225: Mono.Android.dll => 0x881f890734e555e7 => 214
	i64 9819168441846169364, ; 226: Microsoft.IdentityModel.Protocols.dll => 0x8844b1ac75f77f14 => 65
	i64 9875200773399460291, ; 227: Xamarin.GooglePlayServices.Base.dll => 0x890bc2c8482339c3 => 113
	i64 9933555792566666578, ; 228: System.Linq.Queryable.dll => 0x89db145cf475c552 => 150
	i64 9956195530459977388, ; 229: Microsoft.Maui => 0x8a2b8315b36616ac => 71
	i64 9994308163963284983, ; 230: Newtonsoft.Json.Bson.dll => 0x8ab2ea52b0d16df7 => 77
	i64 10038780035334861115, ; 231: System.Net.Http.dll => 0x8b50e941206af13b => 153
	i64 10051358222726253779, ; 232: System.Private.Xml => 0x8b7d990c97ccccd3 => 170
	i64 10089571585547156312, ; 233: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 146
	i64 10092835686693276772, ; 234: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 68
	i64 10143853363526200146, ; 235: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10209869394718195525, ; 236: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 19
	i64 10229024438826829339, ; 237: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 94
	i64 10236703004850800690, ; 238: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 160
	i64 10245369515835430794, ; 239: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 172
	i64 10364469296367737616, ; 240: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 171
	i64 10406448008575299332, ; 241: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 118
	i64 10430153318873392755, ; 242: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 92
	i64 10447083246144586668, ; 243: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 39
	i64 10506226065143327199, ; 244: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10546663366131771576, ; 245: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 179
	i64 10670374202010151210, ; 246: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 121
	i64 10761706286639228993, ; 247: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 33
	i64 10785150219063592792, ; 248: System.Net.Primitives => 0x95ac8cfb68830758 => 157
	i64 10811915265162633087, ; 249: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 43
	i64 10822644899632537592, ; 250: System.Linq.Queryable => 0x9631c23204ca5ff8 => 150
	i64 10889380495983713167, ; 251: Microsoft.Data.SqlClient.dll => 0x971ed9dddf2d1b8f => 40
	i64 10964653383833615866, ; 252: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 140
	i64 11002576679268595294, ; 253: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 57
	i64 11009005086950030778, ; 254: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 71
	i64 11023048688141570732, ; 255: System.Core => 0x98f9bc61168392ac => 134
	i64 11103970607964515343, ; 256: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11156122287428000958, ; 257: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 27
	i64 11157797727133427779, ; 258: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 8
	i64 11162124722117608902, ; 259: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 109
	i64 11220793807500858938, ; 260: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 261: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 58
	i64 11340910727871153756, ; 262: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 93
	i64 11341245327015630248, ; 263: System.Configuration.ConfigurationManager.dll => 0x9d643289535355a8 => 80
	i64 11347436699239206956, ; 264: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 207
	i64 11485890710487134646, ; 265: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 175
	i64 11517440453979132662, ; 266: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 62
	i64 11518296021396496455, ; 267: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 268: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 109
	i64 11530571088791430846, ; 269: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 56
	i64 11597940890313164233, ; 270: netstandard => 0xa0f429ca8d1805c9 => 210
	i64 11855031688536399763, ; 271: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 30
	i64 12011556116648931059, ; 272: System.Security.Cryptography.ProtectedData => 0xa6b19ea5ec87aef3 => 84
	i64 12040886584167504988, ; 273: System.Net.ServicePoint => 0xa719d28d8e121c5c => 160
	i64 12048689113179125827, ; 274: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 54
	i64 12058074296353848905, ; 275: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 55
	i64 12102847907131387746, ; 276: System.Buffers => 0xa7f5f40c43256f62 => 122
	i64 12145679461940342714, ; 277: System.Text.Json => 0xa88e1f1ebcb62fba => 196
	i64 12198439281774268251, ; 278: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0xa9498fe58c538f5b => 66
	i64 12201331334810686224, ; 279: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 180
	i64 12269460666702402136, ; 280: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 124
	i64 12439275739440478309, ; 281: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 63
	i64 12451044538927396471, ; 282: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 96
	i64 12466513435562512481, ; 283: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 101
	i64 12475113361194491050, ; 284: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12493213219680520345, ; 285: Microsoft.Data.SqlClient => 0xad60cf3b3e458899 => 40
	i64 12517810545449516888, ; 286: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 139
	i64 12538491095302438457, ; 287: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 89
	i64 12550732019250633519, ; 288: System.IO.Compression => 0xae2d28465e8e1b2f => 145
	i64 12699999919562409296, ; 289: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 138
	i64 12700543734426720211, ; 290: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 90
	i64 12708922737231849740, ; 291: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 194
	i64 12717050818822477433, ; 292: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 181
	i64 12835242264250840079, ; 293: System.IO.Pipes => 0xb21ff0d5d6c0740f => 148
	i64 12843321153144804894, ; 294: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 59
	i64 12859557719246324186, ; 295: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 163
	i64 12989346753972519995, ; 296: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 0
	i64 13005833372463390146, ; 297: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 21
	i64 13068258254871114833, ; 298: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 178
	i64 13343850469010654401, ; 299: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 213
	i64 13381594904270902445, ; 300: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13431476299110033919, ; 301: System.Net.WebClient => 0xba663087f18829ff => 162
	i64 13463706743370286408, ; 302: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 167
	i64 13465488254036897740, ; 303: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 117
	i64 13540124433173649601, ; 304: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13550417756503177631, ; 305: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 53
	i64 13572454107664307259, ; 306: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 106
	i64 13581429335308513849, ; 307: TrendyLook.dll => 0xbc7aee05e1223239 => 119
	i64 13710614125866346983, ; 308: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 183
	i64 13717397318615465333, ; 309: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 130
	i64 13742054908850494594, ; 310: Azure.Identity => 0xbeb596218df25c82 => 36
	i64 13881769479078963060, ; 311: System.Console.dll => 0xc0a5f3cade5c6774 => 133
	i64 13959074834287824816, ; 312: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 96
	i64 13995262516031000757, ; 313: TrendyLook => 0xc239291bb65e10b5 => 119
	i64 14124974489674258913, ; 314: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 89
	i64 14125464355221830302, ; 315: System.Threading.dll => 0xc407bafdbc707a9e => 202
	i64 14133832980772275001, ; 316: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 41
	i64 14212104595480609394, ; 317: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 186
	i64 14254574811015963973, ; 318: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 194
	i64 14327709162229390963, ; 319: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 190
	i64 14349907877893689639, ; 320: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 23
	i64 14461014870687870182, ; 321: System.Net.Requests.dll => 0xc8afd8683afdece6 => 158
	i64 14464374589798375073, ; 322: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14491877563792607819, ; 323: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 32
	i64 14551742072151931844, ; 324: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 195
	i64 14561513370130550166, ; 325: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 189
	i64 14610046442689856844, ; 326: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 2
	i64 14622043554576106986, ; 327: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 178
	i64 14648804764802849406, ; 328: Azure.Identity.dll => 0xcb4b0252261f9a7e => 36
	i64 14669215534098758659, ; 329: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 51
	i64 14705122255218365489, ; 330: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14735017007120366644, ; 331: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 15
	i64 14744092281598614090, ; 332: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14832630590065248058, ; 333: System.Security.Claims => 0xcdd816ef5d6e873a => 184
	i64 14852515768018889994, ; 334: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 93
	i64 14904040806490515477, ; 335: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14912225920358050525, ; 336: System.Security.Principal.Windows => 0xcef2de7759506add => 192
	i64 14935719434541007538, ; 337: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 193
	i64 14954917835170835695, ; 338: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 52
	i64 14984936317414011727, ; 339: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 163
	i64 14987728460634540364, ; 340: System.IO.Compression.dll => 0xcfff1ba06622494c => 145
	i64 15015154896917945444, ; 341: System.Net.Security.dll => 0xd0608bd33642dc64 => 159
	i64 15076659072870671916, ; 342: System.ObjectModel.dll => 0xd13b0d8c1620662c => 166
	i64 15082578449315132289, ; 343: Plugin.Maui.Calendar => 0xd15015305063f381 => 78
	i64 15111608613780139878, ; 344: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 345: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 144
	i64 15133485256822086103, ; 346: System.Linq.dll => 0xd204f0a9127dd9d7 => 151
	i64 15138356091203993725, ; 347: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 62
	i64 15203009853192377507, ; 348: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 22
	i64 15227001540531775957, ; 349: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 48
	i64 15370334346939861994, ; 350: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 92
	i64 15383240894167415497, ; 351: System.Memory.Data => 0xd57c4016df1c7ac9 => 82
	i64 15391712275433856905, ; 352: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 52
	i64 15527772828719725935, ; 353: System.Console => 0xd77dbb1e38cd3d6f => 133
	i64 15536481058354060254, ; 354: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15541854775306130054, ; 355: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 190
	i64 15557562860424774966, ; 356: System.Net.Sockets => 0xd7e790fe7a6dc536 => 161
	i64 15582737692548360875, ; 357: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 100
	i64 15609085926864131306, ; 358: System.dll => 0xd89e9cf3334914ea => 208
	i64 15661133872274321916, ; 359: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 205
	i64 15783653065526199428, ; 360: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15827202283623377193, ; 361: Microsoft.Extensions.Configuration.Json.dll => 0xdba5849eef9f6929 => 50
	i64 15847085070278954535, ; 362: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 198
	i64 15930129725311349754, ; 363: Xamarin.GooglePlayServices.Tasks.dll => 0xdd1330956f12f3fa => 116
	i64 15937190497610202713, ; 364: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 186
	i64 15963349826457351533, ; 365: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 199
	i64 16018552496348375205, ; 366: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 156
	i64 16056281320585338352, ; 367: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 24
	i64 16154507427712707110, ; 368: System => 0xe03056ea4e39aa26 => 208
	i64 16182611612321266217, ; 369: Microsoft.Maui.Maps => 0xe0942f85b2853a29 => 74
	i64 16219561732052121626, ; 370: System.Net.Security => 0xe1177575db7c781a => 159
	i64 16288847719894691167, ; 371: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 372: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 57
	i64 16337011941688632206, ; 373: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 192
	i64 16454459195343277943, ; 374: System.Net.NetworkInformation => 0xe459fb756d988f77 => 156
	i64 16648892297579399389, ; 375: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 37
	i64 16649148416072044166, ; 376: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 73
	i64 16677317093839702854, ; 377: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 105
	i64 16803648858859583026, ; 378: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 17
	i64 16833383113903931215, ; 379: mscorlib => 0xe99c30c1484d7f4f => 209
	i64 16856067890322379635, ; 380: System.Data.Common.dll => 0xe9ecc87060889373 => 135
	i64 16890310621557459193, ; 381: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 197
	i64 16942731696432749159, ; 382: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16945858842201062480, ; 383: Azure.Core => 0xeb2bc8d57f4e7c50 => 35
	i64 16998075588627545693, ; 384: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 103
	i64 17008137082415910100, ; 385: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 125
	i64 17027804579603049667, ; 386: Microsoft.Maui.Controls.Maps.dll => 0xec4eea0c48026cc3 => 69
	i64 17031351772568316411, ; 387: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 102
	i64 17047433665992082296, ; 388: Microsoft.Extensions.Configuration.FileExtensions => 0xec94a699197e4378 => 49
	i64 17062143951396181894, ; 389: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 130
	i64 17118171214553292978, ; 390: System.Threading.Channels => 0xed8ff6060fc420b2 => 198
	i64 17137864900836977098, ; 391: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 67
	i64 17187273293601214786, ; 392: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 128
	i64 17197986060146327831, ; 393: Microsoft.Identity.Client.Extensions.Msal => 0xeeab8533ef244117 => 61
	i64 17201328579425343169, ; 394: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 129
	i64 17202182880784296190, ; 395: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 188
	i64 17203614576212522419, ; 396: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 20
	i64 17205988430934219272, ; 397: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 55
	i64 17230721278011714856, ; 398: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 169
	i64 17234219099804750107, ; 399: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 203
	i64 17260702271250283638, ; 400: System.Data.Common => 0xef8a5543bba6bc76 => 135
	i64 17310278548634113468, ; 401: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 10
	i64 17333249706306540043, ; 402: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 140
	i64 17342750010158924305, ; 403: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17371436720558481852, ; 404: System.Runtime.Caching => 0xf113bda8d710a1bc => 83
	i64 17514990004910432069, ; 405: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17523946658117960076, ; 406: System.Security.Cryptography.ProtectedData.dll => 0xf33190a3c403c18c => 84
	i64 17623389608345532001, ; 407: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17704177640604968747, ; 408: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 101
	i64 17710060891934109755, ; 409: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 99
	i64 17712670374920797664, ; 410: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 175
	i64 17727188866493996799, ; 411: System.Net.Http.Formatting.dll => 0xf603a059f5a25eff => 38
	i64 17777860260071588075, ; 412: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 177
	i64 17790600151040787804, ; 413: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 64
	i64 17827813215687577648, ; 414: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 11
	i64 17838668724098252521, ; 415: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 122
	i64 17942426894774770628, ; 416: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 4
	i64 17969331831154222830, ; 417: Xamarin.GooglePlayServices.Maps => 0xf95fe418471126ee => 115
	i64 17986907704309214542, ; 418: Xamarin.GooglePlayServices.Basement.dll => 0xf99e554223166d4e => 114
	i64 18017743553296241350, ; 419: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 45
	i64 18025913125965088385, ; 420: System.Threading => 0xfa28e87b91334681 => 202
	i64 18121036031235206392, ; 421: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 102
	i64 18146411883821974900, ; 422: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 143
	i64 18146811631844267958, ; 423: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 129
	i64 18225059387460068507, ; 424: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 201
	i64 18245806341561545090, ; 425: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 123
	i64 18305135509493619199, ; 426: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 104
	i64 18324163916253801303, ; 427: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18342408478508122430, ; 428: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 13
	i64 18358161419737137786 ; 429: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 9
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [430 x i32] [
	i32 59, ; 0
	i32 214, ; 1
	i32 72, ; 2
	i32 38, ; 3
	i32 149, ; 4
	i32 90, ; 5
	i32 107, ; 6
	i32 173, ; 7
	i32 74, ; 8
	i32 49, ; 9
	i32 60, ; 10
	i32 113, ; 11
	i32 200, ; 12
	i32 132, ; 13
	i32 12, ; 14
	i32 95, ; 15
	i32 75, ; 16
	i32 173, ; 17
	i32 35, ; 18
	i32 112, ; 19
	i32 142, ; 20
	i32 44, ; 21
	i32 103, ; 22
	i32 147, ; 23
	i32 157, ; 24
	i32 68, ; 25
	i32 213, ; 26
	i32 200, ; 27
	i32 87, ; 28
	i32 100, ; 29
	i32 76, ; 30
	i32 154, ; 31
	i32 152, ; 32
	i32 168, ; 33
	i32 86, ; 34
	i32 174, ; 35
	i32 6, ; 36
	i32 107, ; 37
	i32 39, ; 38
	i32 141, ; 39
	i32 28, ; 40
	i32 70, ; 41
	i32 37, ; 42
	i32 185, ; 43
	i32 99, ; 44
	i32 199, ; 45
	i32 141, ; 46
	i32 76, ; 47
	i32 88, ; 48
	i32 42, ; 49
	i32 95, ; 50
	i32 123, ; 51
	i32 66, ; 52
	i32 98, ; 53
	i32 195, ; 54
	i32 91, ; 55
	i32 182, ; 56
	i32 85, ; 57
	i32 83, ; 58
	i32 27, ; 59
	i32 67, ; 60
	i32 209, ; 61
	i32 155, ; 62
	i32 51, ; 63
	i32 2, ; 64
	i32 63, ; 65
	i32 183, ; 66
	i32 80, ; 67
	i32 7, ; 68
	i32 112, ; 69
	i32 181, ; 70
	i32 187, ; 71
	i32 97, ; 72
	i32 164, ; 73
	i32 177, ; 74
	i32 161, ; 75
	i32 118, ; 76
	i32 53, ; 77
	i32 81, ; 78
	i32 114, ; 79
	i32 72, ; 80
	i32 47, ; 81
	i32 108, ; 82
	i32 46, ; 83
	i32 165, ; 84
	i32 211, ; 85
	i32 22, ; 86
	i32 182, ; 87
	i32 48, ; 88
	i32 205, ; 89
	i32 47, ; 90
	i32 210, ; 91
	i32 106, ; 92
	i32 56, ; 93
	i32 54, ; 94
	i32 70, ; 95
	i32 188, ; 96
	i32 158, ; 97
	i32 152, ; 98
	i32 180, ; 99
	i32 3, ; 100
	i32 170, ; 101
	i32 33, ; 102
	i32 132, ; 103
	i32 201, ; 104
	i32 184, ; 105
	i32 149, ; 106
	i32 77, ; 107
	i32 131, ; 108
	i32 116, ; 109
	i32 28, ; 110
	i32 148, ; 111
	i32 43, ; 112
	i32 79, ; 113
	i32 42, ; 114
	i32 147, ; 115
	i32 207, ; 116
	i32 128, ; 117
	i32 85, ; 118
	i32 108, ; 119
	i32 142, ; 120
	i32 155, ; 121
	i32 176, ; 122
	i32 18, ; 123
	i32 26, ; 124
	i32 126, ; 125
	i32 126, ; 126
	i32 111, ; 127
	i32 162, ; 128
	i32 176, ; 129
	i32 174, ; 130
	i32 26, ; 131
	i32 134, ; 132
	i32 29, ; 133
	i32 144, ; 134
	i32 191, ; 135
	i32 69, ; 136
	i32 185, ; 137
	i32 110, ; 138
	i32 143, ; 139
	i32 189, ; 140
	i32 23, ; 141
	i32 196, ; 142
	i32 203, ; 143
	i32 167, ; 144
	i32 171, ; 145
	i32 6, ; 146
	i32 34, ; 147
	i32 98, ; 148
	i32 7, ; 149
	i32 11, ; 150
	i32 88, ; 151
	i32 94, ; 152
	i32 58, ; 153
	i32 193, ; 154
	i32 19, ; 155
	i32 139, ; 156
	i32 206, ; 157
	i32 204, ; 158
	i32 78, ; 159
	i32 164, ; 160
	i32 169, ; 161
	i32 115, ; 162
	i32 151, ; 163
	i32 121, ; 164
	i32 82, ; 165
	i32 131, ; 166
	i32 204, ; 167
	i32 166, ; 168
	i32 81, ; 169
	i32 137, ; 170
	i32 111, ; 171
	i32 153, ; 172
	i32 154, ; 173
	i32 211, ; 174
	i32 120, ; 175
	i32 117, ; 176
	i32 14, ; 177
	i32 146, ; 178
	i32 87, ; 179
	i32 45, ; 180
	i32 25, ; 181
	i32 127, ; 182
	i32 97, ; 183
	i32 136, ; 184
	i32 16, ; 185
	i32 212, ; 186
	i32 127, ; 187
	i32 61, ; 188
	i32 73, ; 189
	i32 137, ; 190
	i32 191, ; 191
	i32 31, ; 192
	i32 105, ; 193
	i32 172, ; 194
	i32 75, ; 195
	i32 124, ; 196
	i32 168, ; 197
	i32 212, ; 198
	i32 120, ; 199
	i32 104, ; 200
	i32 21, ; 201
	i32 136, ; 202
	i32 206, ; 203
	i32 179, ; 204
	i32 60, ; 205
	i32 31, ; 206
	i32 65, ; 207
	i32 46, ; 208
	i32 187, ; 209
	i32 41, ; 210
	i32 79, ; 211
	i32 110, ; 212
	i32 86, ; 213
	i32 5, ; 214
	i32 64, ; 215
	i32 44, ; 216
	i32 29, ; 217
	i32 50, ; 218
	i32 197, ; 219
	i32 165, ; 220
	i32 138, ; 221
	i32 91, ; 222
	i32 125, ; 223
	i32 1, ; 224
	i32 214, ; 225
	i32 65, ; 226
	i32 113, ; 227
	i32 150, ; 228
	i32 71, ; 229
	i32 77, ; 230
	i32 153, ; 231
	i32 170, ; 232
	i32 146, ; 233
	i32 68, ; 234
	i32 3, ; 235
	i32 19, ; 236
	i32 94, ; 237
	i32 160, ; 238
	i32 172, ; 239
	i32 171, ; 240
	i32 118, ; 241
	i32 92, ; 242
	i32 39, ; 243
	i32 1, ; 244
	i32 179, ; 245
	i32 121, ; 246
	i32 33, ; 247
	i32 157, ; 248
	i32 43, ; 249
	i32 150, ; 250
	i32 40, ; 251
	i32 140, ; 252
	i32 57, ; 253
	i32 71, ; 254
	i32 134, ; 255
	i32 12, ; 256
	i32 27, ; 257
	i32 8, ; 258
	i32 109, ; 259
	i32 15, ; 260
	i32 58, ; 261
	i32 93, ; 262
	i32 80, ; 263
	i32 207, ; 264
	i32 175, ; 265
	i32 62, ; 266
	i32 13, ; 267
	i32 109, ; 268
	i32 56, ; 269
	i32 210, ; 270
	i32 30, ; 271
	i32 84, ; 272
	i32 160, ; 273
	i32 54, ; 274
	i32 55, ; 275
	i32 122, ; 276
	i32 196, ; 277
	i32 66, ; 278
	i32 180, ; 279
	i32 124, ; 280
	i32 63, ; 281
	i32 96, ; 282
	i32 101, ; 283
	i32 34, ; 284
	i32 40, ; 285
	i32 139, ; 286
	i32 89, ; 287
	i32 145, ; 288
	i32 138, ; 289
	i32 90, ; 290
	i32 194, ; 291
	i32 181, ; 292
	i32 148, ; 293
	i32 59, ; 294
	i32 163, ; 295
	i32 0, ; 296
	i32 21, ; 297
	i32 178, ; 298
	i32 213, ; 299
	i32 9, ; 300
	i32 162, ; 301
	i32 167, ; 302
	i32 117, ; 303
	i32 30, ; 304
	i32 53, ; 305
	i32 106, ; 306
	i32 119, ; 307
	i32 183, ; 308
	i32 130, ; 309
	i32 36, ; 310
	i32 133, ; 311
	i32 96, ; 312
	i32 119, ; 313
	i32 89, ; 314
	i32 202, ; 315
	i32 41, ; 316
	i32 186, ; 317
	i32 194, ; 318
	i32 190, ; 319
	i32 23, ; 320
	i32 158, ; 321
	i32 24, ; 322
	i32 32, ; 323
	i32 195, ; 324
	i32 189, ; 325
	i32 2, ; 326
	i32 178, ; 327
	i32 36, ; 328
	i32 51, ; 329
	i32 16, ; 330
	i32 15, ; 331
	i32 32, ; 332
	i32 184, ; 333
	i32 93, ; 334
	i32 0, ; 335
	i32 192, ; 336
	i32 193, ; 337
	i32 52, ; 338
	i32 163, ; 339
	i32 145, ; 340
	i32 159, ; 341
	i32 166, ; 342
	i32 78, ; 343
	i32 17, ; 344
	i32 144, ; 345
	i32 151, ; 346
	i32 62, ; 347
	i32 22, ; 348
	i32 48, ; 349
	i32 92, ; 350
	i32 82, ; 351
	i32 52, ; 352
	i32 133, ; 353
	i32 4, ; 354
	i32 190, ; 355
	i32 161, ; 356
	i32 100, ; 357
	i32 208, ; 358
	i32 205, ; 359
	i32 5, ; 360
	i32 50, ; 361
	i32 198, ; 362
	i32 116, ; 363
	i32 186, ; 364
	i32 199, ; 365
	i32 156, ; 366
	i32 24, ; 367
	i32 208, ; 368
	i32 74, ; 369
	i32 159, ; 370
	i32 18, ; 371
	i32 57, ; 372
	i32 192, ; 373
	i32 156, ; 374
	i32 37, ; 375
	i32 73, ; 376
	i32 105, ; 377
	i32 17, ; 378
	i32 209, ; 379
	i32 135, ; 380
	i32 197, ; 381
	i32 25, ; 382
	i32 35, ; 383
	i32 103, ; 384
	i32 125, ; 385
	i32 69, ; 386
	i32 102, ; 387
	i32 49, ; 388
	i32 130, ; 389
	i32 198, ; 390
	i32 67, ; 391
	i32 128, ; 392
	i32 61, ; 393
	i32 129, ; 394
	i32 188, ; 395
	i32 20, ; 396
	i32 55, ; 397
	i32 169, ; 398
	i32 203, ; 399
	i32 135, ; 400
	i32 10, ; 401
	i32 140, ; 402
	i32 10, ; 403
	i32 83, ; 404
	i32 8, ; 405
	i32 84, ; 406
	i32 20, ; 407
	i32 101, ; 408
	i32 99, ; 409
	i32 175, ; 410
	i32 38, ; 411
	i32 177, ; 412
	i32 64, ; 413
	i32 11, ; 414
	i32 122, ; 415
	i32 4, ; 416
	i32 115, ; 417
	i32 114, ; 418
	i32 45, ; 419
	i32 202, ; 420
	i32 102, ; 421
	i32 143, ; 422
	i32 129, ; 423
	i32 201, ; 424
	i32 123, ; 425
	i32 104, ; 426
	i32 14, ; 427
	i32 13, ; 428
	i32 9 ; 429
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
