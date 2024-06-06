; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [210 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [420 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 153
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 152
	i32 38948123, ; 2: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 39109920, ; 3: Newtonsoft.Json.dll => 0x254c520 => 76
	i32 42244203, ; 4: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 5: System.Threading.Thread => 0x28aa24d => 196
	i32 66541672, ; 6: System.Diagnostics.StackTrace => 0x3f75868 => 136
	i32 67008169, ; 7: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 8: System.Security.Cryptography.Primitives => 0x410f24b => 185
	i32 72070932, ; 9: Microsoft.Maui.Graphics.dll => 0x44bb714 => 73
	i32 83839681, ; 10: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 11: System.Runtime.InteropServices => 0x6ffddbc => 171
	i32 122350210, ; 12: System.Threading.Channels.dll => 0x74aea82 => 194
	i32 123912772, ; 13: QRCoder => 0x762c244 => 79
	i32 136584136, ; 14: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 15: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 142721839, ; 16: System.Net.WebHeaderCollection => 0x881c32f => 160
	i32 149972175, ; 17: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 185
	i32 159306688, ; 18: System.ComponentModel.Annotations => 0x97ed3c0 => 127
	i32 165246403, ; 19: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 90
	i32 182336117, ; 20: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 108
	i32 205061960, ; 21: System.ComponentModel => 0xc38ff48 => 131
	i32 209399409, ; 22: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 88
	i32 230752869, ; 23: Microsoft.CSharp.dll => 0xdc10265 => 119
	i32 246610117, ; 24: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 168
	i32 317674968, ; 25: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 26: Xamarin.AndroidX.Activity.dll => 0x13031348 => 85
	i32 321963286, ; 27: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 330147069, ; 28: Microsoft.SqlServer.Server => 0x13ada4fd => 75
	i32 342366114, ; 29: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 97
	i32 367780167, ; 30: System.IO.Pipes => 0x15ebe147 => 146
	i32 374914964, ; 31: System.Transactions.Local => 0x1658bf94 => 199
	i32 375677976, ; 32: System.Net.ServicePoint.dll => 0x16646418 => 157
	i32 379916513, ; 33: System.Threading.Thread.dll => 0x16a510e1 => 196
	i32 385762202, ; 34: System.Memory.dll => 0x16fe439a => 150
	i32 392610295, ; 35: System.Threading.ThreadPool.dll => 0x1766c1f7 => 197
	i32 395744057, ; 36: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 37: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 38: System.Collections => 0x1a61054f => 126
	i32 450948140, ; 39: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 96
	i32 451504562, ; 40: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 186
	i32 459347974, ; 41: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 176
	i32 469710990, ; 42: System.dll => 0x1bff388e => 204
	i32 485463106, ; 43: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 62
	i32 489220957, ; 44: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 45: System.ObjectModel => 0x1dbae811 => 162
	i32 513247710, ; 46: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 59
	i32 530272170, ; 47: System.Linq.Queryable => 0x1f9b4faa => 148
	i32 538707440, ; 48: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 49: Microsoft.Extensions.Logging => 0x20216150 => 56
	i32 546455878, ; 50: System.Runtime.Serialization.Xml => 0x20924146 => 177
	i32 548916678, ; 51: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 39
	i32 577335427, ; 52: System.Security.Cryptography.Cng => 0x22697083 => 182
	i32 613668793, ; 53: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 181
	i32 627609679, ; 54: Xamarin.AndroidX.CustomView => 0x2568904f => 94
	i32 627931235, ; 55: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 56: System.Text.Encodings.Web.dll => 0x27787397 => 191
	i32 672442732, ; 57: System.Collections.Concurrent => 0x2814a96c => 122
	i32 683518922, ; 58: System.Net.Security => 0x28bdabca => 156
	i32 690569205, ; 59: System.Xml.Linq.dll => 0x29293ff5 => 200
	i32 722857257, ; 60: System.Runtime.Loader.dll => 0x2b15ed29 => 172
	i32 759454413, ; 61: System.Net.Requests => 0x2d445acd => 155
	i32 762598435, ; 62: System.IO.Pipes.dll => 0x2d745423 => 146
	i32 775507847, ; 63: System.IO.Compression => 0x2e394f87 => 143
	i32 777317022, ; 64: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 65: Microsoft.Extensions.Options => 0x2f0980eb => 58
	i32 804715423, ; 66: System.Data.Common => 0x2ff6fb9f => 133
	i32 823281589, ; 67: System.Private.Uri.dll => 0x311247b5 => 164
	i32 830298997, ; 68: System.IO.Compression.Brotli => 0x317d5b75 => 142
	i32 869139383, ; 69: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 70: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 71: System.ComponentModel.Primitives.dll => 0x35e25008 => 129
	i32 908888060, ; 72: Microsoft.Maui.Maps => 0x362c87fc => 74
	i32 918734561, ; 73: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 955402788, ; 74: Newtonsoft.Json => 0x38f24a24 => 76
	i32 961460050, ; 75: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 76: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 97
	i32 975236339, ; 77: System.Diagnostics.Tracing => 0x3a20ecf3 => 138
	i32 975874589, ; 78: System.Xml.XDocument => 0x3a2aaa1d => 202
	i32 986514023, ; 79: System.Private.DataContractSerialization.dll => 0x3acd0267 => 163
	i32 990727110, ; 80: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992238659, ; 81: TrendyLook => 0x3b245c43 => 118
	i32 992768348, ; 82: System.Collections.dll => 0x3b2c715c => 126
	i32 999186168, ; 83: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 55
	i32 1012816738, ; 84: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 107
	i32 1019214401, ; 85: System.Drawing => 0x3cbffa41 => 140
	i32 1028951442, ; 86: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 52
	i32 1035644815, ; 87: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 86
	i32 1036536393, ; 88: System.Drawing.Primitives.dll => 0x3dc84a49 => 139
	i32 1043950537, ; 89: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 90: System.Linq.Expressions.dll => 0x3e444eb4 => 147
	i32 1052210849, ; 91: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 99
	i32 1062017875, ; 92: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 61
	i32 1082857460, ; 93: System.ComponentModel.TypeConverter => 0x408b17f4 => 130
	i32 1084122840, ; 94: Xamarin.Kotlin.StdLib => 0x409e66d8 => 116
	i32 1098259244, ; 95: System => 0x41761b2c => 204
	i32 1106973742, ; 96: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 49
	i32 1108272742, ; 97: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 98: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 99: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1138436374, ; 100: Microsoft.Data.SqlClient.dll => 0x43db2916 => 40
	i32 1157931901, ; 101: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 42
	i32 1168523401, ; 102: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1173126369, ; 103: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 53
	i32 1178241025, ; 104: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 104
	i32 1186231468, ; 105: Newtonsoft.Json.Bson.dll => 0x46b474ac => 77
	i32 1202000627, ; 106: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 42
	i32 1204575371, ; 107: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 46
	i32 1208641965, ; 108: System.Diagnostics.Process => 0x480a69ad => 135
	i32 1214827643, ; 109: CommunityToolkit.Mvvm => 0x4868cc7b => 37
	i32 1260983243, ; 110: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 111: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 95
	i32 1308624726, ; 112: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1309188875, ; 113: System.Private.DataContractSerialization => 0x4e08a30b => 163
	i32 1324164729, ; 114: System.Linq => 0x4eed2679 => 149
	i32 1335329327, ; 115: System.Runtime.Serialization.Json.dll => 0x4f97822f => 175
	i32 1336711579, ; 116: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 117: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 118: Xamarin.AndroidX.SavedState => 0x52114ed3 => 107
	i32 1406073936, ; 119: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 91
	i32 1408764838, ; 120: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 174
	i32 1430672901, ; 121: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1452070440, ; 122: System.Formats.Asn1.dll => 0x568cd628 => 141
	i32 1458022317, ; 123: System.Net.Security.dll => 0x56e7a7ad => 156
	i32 1460893475, ; 124: System.IdentityModel.Tokens.Jwt => 0x57137723 => 81
	i32 1461004990, ; 125: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 126: System.Collections.Immutable.dll => 0x5718a9ef => 123
	i32 1462112819, ; 127: System.IO.Compression.dll => 0x57261233 => 143
	i32 1469204771, ; 128: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 87
	i32 1470490898, ; 129: Microsoft.Extensions.Primitives => 0x57a5e912 => 59
	i32 1479771757, ; 130: System.Collections.Immutable => 0x5833866d => 123
	i32 1480492111, ; 131: System.IO.Compression.Brotli.dll => 0x583e844f => 142
	i32 1487239319, ; 132: Microsoft.Win32.Primitives => 0x58a57897 => 120
	i32 1498168481, ; 133: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 63
	i32 1521091094, ; 134: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 55
	i32 1526286932, ; 135: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 136: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 193
	i32 1565310744, ; 137: System.Runtime.Caching => 0x5d4cbf18 => 83
	i32 1573704789, ; 138: System.Runtime.Serialization.Json => 0x5dccd455 => 175
	i32 1582305585, ; 139: Azure.Identity => 0x5e501131 => 36
	i32 1604827217, ; 140: System.Net.WebClient => 0x5fa7b851 => 159
	i32 1622152042, ; 141: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 101
	i32 1624863272, ; 142: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 110
	i32 1628113371, ; 143: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 66
	i32 1632842087, ; 144: Microsoft.Extensions.Configuration.Json => 0x61533167 => 50
	i32 1636350590, ; 145: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 93
	i32 1639515021, ; 146: System.Net.Http.dll => 0x61b9038d => 151
	i32 1639986890, ; 147: System.Text.RegularExpressions => 0x61c036ca => 193
	i32 1641389582, ; 148: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 128
	i32 1657153582, ; 149: System.Runtime => 0x62c6282e => 178
	i32 1658251792, ; 150: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 111
	i32 1677501392, ; 151: System.Net.Primitives.dll => 0x63fca3d0 => 154
	i32 1679769178, ; 152: System.Security.Cryptography => 0x641f3e5a => 187
	i32 1689493916, ; 153: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 41
	i32 1696967625, ; 154: System.Security.Cryptography.Csp => 0x6525abc9 => 183
	i32 1729485958, ; 155: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 89
	i32 1743415430, ; 156: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 157: System.Transactions.Local.dll => 0x67fe8db2 => 199
	i32 1750313021, ; 158: Microsoft.Win32.Primitives.dll => 0x6853a83d => 120
	i32 1763938596, ; 159: System.Diagnostics.TraceSource.dll => 0x69239124 => 137
	i32 1766324549, ; 160: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 108
	i32 1770582343, ; 161: Microsoft.Extensions.Logging.dll => 0x6988f147 => 56
	i32 1780572499, ; 162: Mono.Android.Runtime.dll => 0x6a216153 => 208
	i32 1782862114, ; 163: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 164: Xamarin.AndroidX.Fragment => 0x6a96652d => 96
	i32 1793755602, ; 165: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1794500907, ; 166: Microsoft.Identity.Client.dll => 0x6af5e92b => 60
	i32 1796167890, ; 167: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 39
	i32 1808609942, ; 168: Xamarin.AndroidX.Loader => 0x6bcd3296 => 101
	i32 1813058853, ; 169: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 116
	i32 1813201214, ; 170: Xamarin.Google.Android.Material => 0x6c13413e => 111
	i32 1818569960, ; 171: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 105
	i32 1824175904, ; 172: System.Text.Encoding.Extensions => 0x6cbab720 => 190
	i32 1824722060, ; 173: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 174
	i32 1828688058, ; 174: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 57
	i32 1853025655, ; 175: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 176: System.Linq.Expressions => 0x6ec71a65 => 147
	i32 1870277092, ; 177: System.Reflection.Primitives => 0x6f7a29e4 => 169
	i32 1871986876, ; 178: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 66
	i32 1875935024, ; 179: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 180: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1908813208, ; 181: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 113
	i32 1910275211, ; 182: System.Collections.NonGeneric.dll => 0x71dc7c8b => 124
	i32 1939592360, ; 183: System.Private.Xml.Linq => 0x739bd4a8 => 165
	i32 1953182387, ; 184: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 185: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 47
	i32 1986222447, ; 186: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 67
	i32 2003115576, ; 187: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 188: System.Buffers.dll => 0x77ec19b4 => 121
	i32 2019465201, ; 189: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 99
	i32 2040764568, ; 190: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 61
	i32 2045470958, ; 191: System.Private.Xml => 0x79eb68ee => 166
	i32 2055257422, ; 192: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 98
	i32 2066184531, ; 193: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2069514766, ; 194: Newtonsoft.Json.Bson => 0x7b5a4a0e => 77
	i32 2070888862, ; 195: System.Diagnostics.TraceSource => 0x7b6f419e => 137
	i32 2072397586, ; 196: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 54
	i32 2079903147, ; 197: System.Runtime.dll => 0x7bf8cdab => 178
	i32 2090596640, ; 198: System.Numerics.Vectors => 0x7c9bf920 => 161
	i32 2097405377, ; 199: QRCoder.dll => 0x7d03ddc1 => 79
	i32 2127167465, ; 200: System.Console => 0x7ec9ffe9 => 132
	i32 2129483829, ; 201: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 112
	i32 2142473426, ; 202: System.Collections.Specialized => 0x7fb38cd2 => 125
	i32 2143790110, ; 203: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 203
	i32 2159891885, ; 204: Microsoft.Maui => 0x80bd55ad => 71
	i32 2169148018, ; 205: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 206: Microsoft.Extensions.Options.dll => 0x820d22b3 => 58
	i32 2192057212, ; 207: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 57
	i32 2193016926, ; 208: System.ObjectModel.dll => 0x82b6c85e => 162
	i32 2201107256, ; 209: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 117
	i32 2201231467, ; 210: System.Net.Http => 0x8334206b => 151
	i32 2207618523, ; 211: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2252897993, ; 212: Microsoft.EntityFrameworkCore => 0x86487ec9 => 41
	i32 2253551641, ; 213: Microsoft.IdentityModel.Protocols => 0x86527819 => 65
	i32 2265110946, ; 214: System.Security.AccessControl.dll => 0x8702d9a2 => 179
	i32 2266799131, ; 215: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 48
	i32 2279755925, ; 216: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 106
	i32 2295906218, ; 217: System.Net.Sockets => 0x88d8bfaa => 158
	i32 2303073227, ; 218: Microsoft.Maui.Controls.Maps.dll => 0x89461bcb => 69
	i32 2303942373, ; 219: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 220: System.Private.CoreLib.dll => 0x896b7878 => 206
	i32 2320048964, ; 221: TrendyLook.dll => 0x8a492344 => 118
	i32 2340441535, ; 222: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 170
	i32 2353062107, ; 223: System.Net.Primitives => 0x8c40e0db => 154
	i32 2366048013, ; 224: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 225: System.Xml.ReaderWriter.dll => 0x8d24e767 => 201
	i32 2369706906, ; 226: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 64
	i32 2371007202, ; 227: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 47
	i32 2378619854, ; 228: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 183
	i32 2383496789, ; 229: System.Security.Principal.Windows.dll => 0x8e114655 => 188
	i32 2392818924, ; 230: System.Net.Http.Formatting.dll => 0x8e9f84ec => 38
	i32 2395872292, ; 231: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 232: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 233: System.Console.dll => 0x912896e5 => 132
	i32 2458678730, ; 234: System.Net.Sockets.dll => 0x928c75ca => 158
	i32 2471841756, ; 235: netstandard.dll => 0x93554fdc => 205
	i32 2475788418, ; 236: Java.Interop.dll => 0x93918882 => 207
	i32 2480646305, ; 237: Microsoft.Maui.Controls => 0x93dba8a1 => 68
	i32 2483903535, ; 238: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 128
	i32 2484371297, ; 239: System.Net.ServicePoint => 0x94147f61 => 157
	i32 2503351294, ; 240: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2538310050, ; 241: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 168
	i32 2550873716, ; 242: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 243: Microsoft.CSharp => 0x98ba5a04 => 119
	i32 2570120770, ; 244: System.Text.Encodings.Web => 0x9930ee42 => 191
	i32 2576534780, ; 245: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2585220780, ; 246: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 190
	i32 2589602615, ; 247: System.Threading.ThreadPool => 0x9a5a3337 => 197
	i32 2592341985, ; 248: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 53
	i32 2593496499, ; 249: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 250: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 117
	i32 2617129537, ; 251: System.Private.Xml.dll => 0x9bfe3a41 => 166
	i32 2620871830, ; 252: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 93
	i32 2626831493, ; 253: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2628210652, ; 254: System.Memory.Data => 0x9ca74fdc => 82
	i32 2634653062, ; 255: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 43
	i32 2640290731, ; 256: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 64
	i32 2640706905, ; 257: Azure.Core => 0x9d65fd59 => 35
	i32 2660759594, ; 258: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 84
	i32 2663698177, ; 259: System.Runtime.Loader => 0x9ec4cf01 => 172
	i32 2664396074, ; 260: System.Xml.XDocument.dll => 0x9ecf752a => 202
	i32 2665622720, ; 261: System.Drawing.Primitives => 0x9ee22cc0 => 139
	i32 2676780864, ; 262: System.Data.Common.dll => 0x9f8c6f40 => 133
	i32 2677098746, ; 263: Azure.Identity.dll => 0x9f9148fa => 36
	i32 2686887180, ; 264: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 177
	i32 2717744543, ; 265: System.Security.Claims => 0xa1fd7d9f => 180
	i32 2719963679, ; 266: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 182
	i32 2724373263, ; 267: System.Runtime.Numerics.dll => 0xa262a30f => 173
	i32 2732626843, ; 268: Xamarin.AndroidX.Activity => 0xa2e0939b => 85
	i32 2735172069, ; 269: System.Threading.Channels => 0xa30769e5 => 194
	i32 2737747696, ; 270: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 87
	i32 2740051746, ; 271: Microsoft.Identity.Client => 0xa351df22 => 60
	i32 2740698338, ; 272: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 273: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2755098380, ; 274: Microsoft.SqlServer.Server.dll => 0xa437770c => 75
	i32 2755643133, ; 275: Microsoft.EntityFrameworkCore.SqlServer => 0xa43fc6fd => 44
	i32 2758225723, ; 276: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 70
	i32 2764765095, ; 277: Microsoft.Maui.dll => 0xa4caf7a7 => 71
	i32 2765824710, ; 278: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 189
	i32 2778768386, ; 279: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 109
	i32 2785988530, ; 280: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 281: Microsoft.Maui.Graphics => 0xa7008e0b => 73
	i32 2810250172, ; 282: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 91
	i32 2847418871, ; 283: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 112
	i32 2847789619, ; 284: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 43
	i32 2853208004, ; 285: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 109
	i32 2861189240, ; 286: Microsoft.Maui.Essentials => 0xaa8a4878 => 72
	i32 2867946736, ; 287: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 84
	i32 2909740682, ; 288: System.Private.CoreLib => 0xad6f1e8a => 206
	i32 2911054922, ; 289: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 54
	i32 2916838712, ; 290: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 110
	i32 2919462931, ; 291: System.Numerics.Vectors.dll => 0xae037813 => 161
	i32 2940926066, ; 292: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 136
	i32 2944313911, ; 293: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 80
	i32 2959614098, ; 294: System.ComponentModel.dll => 0xb0682092 => 131
	i32 2968338931, ; 295: System.Security.Principal.Windows => 0xb0ed41f3 => 188
	i32 2972252294, ; 296: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 181
	i32 2978675010, ; 297: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 95
	i32 3012788804, ; 298: System.Configuration.ConfigurationManager => 0xb3938244 => 80
	i32 3017076677, ; 299: Xamarin.GooglePlayServices.Maps => 0xb3d4efc5 => 114
	i32 3033605958, ; 300: System.Memory.Data.dll => 0xb4d12746 => 82
	i32 3038032645, ; 301: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 302: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 303: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 102
	i32 3058099980, ; 304: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 115
	i32 3059408633, ; 305: Mono.Android.Runtime => 0xb65adef9 => 208
	i32 3059793426, ; 306: System.ComponentModel.Primitives => 0xb660be12 => 129
	i32 3069363400, ; 307: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 45
	i32 3084678329, ; 308: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 67
	i32 3090735792, ; 309: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 186
	i32 3099732863, ; 310: System.Security.Claims.dll => 0xb8c22b7f => 180
	i32 3103600923, ; 311: System.Formats.Asn1 => 0xb8fd311b => 141
	i32 3121463068, ; 312: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 144
	i32 3124832203, ; 313: System.Threading.Tasks.Extensions => 0xba4127cb => 195
	i32 3132293585, ; 314: System.Security.AccessControl => 0xbab301d1 => 179
	i32 3135354210, ; 315: Plugin.Maui.Calendar => 0xbae1b562 => 78
	i32 3147165239, ; 316: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 138
	i32 3159123045, ; 317: System.Reflection.Primitives.dll => 0xbc4c6465 => 169
	i32 3178803400, ; 318: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 103
	i32 3195844289, ; 319: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 45
	i32 3220365878, ; 320: System.Threading => 0xbff2e236 => 198
	i32 3230466174, ; 321: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 113
	i32 3258312781, ; 322: Xamarin.AndroidX.CardView => 0xc235e84d => 89
	i32 3265493905, ; 323: System.Linq.Queryable.dll => 0xc2a37b91 => 148
	i32 3265893370, ; 324: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 195
	i32 3280506390, ; 325: System.ComponentModel.Annotations.dll => 0xc3888e16 => 127
	i32 3290767353, ; 326: System.Security.Cryptography.Encoding => 0xc4251ff9 => 184
	i32 3305363605, ; 327: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3312457198, ; 328: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 63
	i32 3316684772, ; 329: System.Net.Requests.dll => 0xc5b097e4 => 155
	i32 3317135071, ; 330: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 94
	i32 3346324047, ; 331: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 104
	i32 3357674450, ; 332: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 333: System.Text.Json => 0xc82afec1 => 192
	i32 3362522851, ; 334: Xamarin.AndroidX.Core => 0xc86c06e3 => 92
	i32 3366347497, ; 335: Java.Interop => 0xc8a662e9 => 207
	i32 3374879918, ; 336: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 65
	i32 3374999561, ; 337: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 106
	i32 3381016424, ; 338: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 339: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 51
	i32 3430777524, ; 340: netstandard => 0xcc7d82b4 => 205
	i32 3458724246, ; 341: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 342: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 130
	i32 3476120550, ; 343: Mono.Android => 0xcf3163e6 => 209
	i32 3484440000, ; 344: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 345: System.Text.Json.dll => 0xcfbaacae => 192
	i32 3500773090, ; 346: Microsoft.Maui.Controls.Maps => 0xd0a98ee2 => 69
	i32 3509114376, ; 347: System.Xml.Linq => 0xd128d608 => 200
	i32 3545306353, ; 348: Microsoft.Data.SqlClient => 0xd35114f1 => 40
	i32 3561949811, ; 349: Azure.Core.dll => 0xd44f0a73 => 35
	i32 3570554715, ; 350: System.IO.FileSystem.AccessControl => 0xd4d2575b => 144
	i32 3570608287, ; 351: System.Runtime.Caching.dll => 0xd4d3289f => 83
	i32 3580758918, ; 352: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 353: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 354: System.Linq.dll => 0xd715a361 => 149
	i32 3624195450, ; 355: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 170
	i32 3641597786, ; 356: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 98
	i32 3643446276, ; 357: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 358: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 103
	i32 3657292374, ; 359: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 48
	i32 3660523487, ; 360: System.Net.NetworkInformation => 0xda2f27df => 153
	i32 3672681054, ; 361: Mono.Android.dll => 0xdae8aa5e => 209
	i32 3682565725, ; 362: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 88
	i32 3696332803, ; 363: Plugin.Maui.Calendar.dll => 0xdc519003 => 78
	i32 3700591436, ; 364: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 62
	i32 3722202641, ; 365: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 50
	i32 3724971120, ; 366: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 102
	i32 3732100267, ; 367: System.Net.NameResolution => 0xde7354ab => 152
	i32 3748608112, ; 368: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 134
	i32 3751619990, ; 369: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3758424670, ; 370: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 49
	i32 3786282454, ; 371: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 90
	i32 3792276235, ; 372: System.Collections.NonGeneric => 0xe2098b0b => 124
	i32 3802395368, ; 373: System.Collections.Specialized.dll => 0xe2a3f2e8 => 125
	i32 3823082795, ; 374: System.Security.Cryptography.dll => 0xe3df9d2b => 187
	i32 3841636137, ; 375: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 52
	i32 3849253459, ; 376: System.Runtime.InteropServices.dll => 0xe56ef253 => 171
	i32 3875112723, ; 377: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 184
	i32 3885497537, ; 378: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 160
	i32 3896106733, ; 379: System.Collections.Concurrent.dll => 0xe839deed => 122
	i32 3896760992, ; 380: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 92
	i32 3920221145, ; 381: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 382: System.Xml.ReaderWriter => 0xea213423 => 201
	i32 3931092270, ; 383: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 105
	i32 3953953790, ; 384: System.Text.Encoding.CodePages => 0xebac8bfe => 189
	i32 3955647286, ; 385: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 86
	i32 3970018735, ; 386: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 115
	i32 4003436829, ; 387: System.Diagnostics.Process.dll => 0xee9f991d => 135
	i32 4025784931, ; 388: System.Memory => 0xeff49a63 => 150
	i32 4046471985, ; 389: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 70
	i32 4054681211, ; 390: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 167
	i32 4068434129, ; 391: System.Private.Xml.Linq.dll => 0xf27f60d1 => 165
	i32 4073602200, ; 392: System.Threading.dll => 0xf2ce3c98 => 198
	i32 4091086043, ; 393: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 394: Microsoft.Maui.Essentials.dll => 0xf40add04 => 72
	i32 4099507663, ; 395: System.Drawing.dll => 0xf45985cf => 140
	i32 4100113165, ; 396: System.Private.Uri => 0xf462c30d => 164
	i32 4101842092, ; 397: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 46
	i32 4103439459, ; 398: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 399: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 51
	i32 4127667938, ; 400: System.IO.FileSystem.Watcher => 0xf60736e2 => 145
	i32 4131741489, ; 401: System.Net.Http.Formatting => 0xf6455f31 => 38
	i32 4147896353, ; 402: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 167
	i32 4150914736, ; 403: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4159265925, ; 404: System.Xml.XmlSerializer => 0xf7e95c85 => 203
	i32 4164802419, ; 405: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 145
	i32 4181436372, ; 406: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 176
	i32 4182413190, ; 407: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 100
	i32 4190991637, ; 408: Microsoft.Maui.Maps.dll => 0xf9cd7515 => 74
	i32 4194278001, ; 409: Microsoft.EntityFrameworkCore.SqlServer.dll => 0xf9ff9a71 => 44
	i32 4196529839, ; 410: System.Net.WebClient.dll => 0xfa21f6af => 159
	i32 4213026141, ; 411: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 134
	i32 4249188766, ; 412: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4260525087, ; 413: System.Buffers => 0xfdf2741f => 121
	i32 4263231520, ; 414: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 81
	i32 4271975918, ; 415: Microsoft.Maui.Controls.dll => 0xfea12dee => 68
	i32 4274623895, ; 416: CommunityToolkit.Mvvm.dll => 0xfec99597 => 37
	i32 4274976490, ; 417: System.Runtime.Numerics => 0xfecef6ea => 173
	i32 4278134329, ; 418: Xamarin.GooglePlayServices.Maps.dll => 0xfeff2639 => 114
	i32 4292120959 ; 419: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 100
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [420 x i32] [
	i32 153, ; 0
	i32 152, ; 1
	i32 0, ; 2
	i32 76, ; 3
	i32 9, ; 4
	i32 196, ; 5
	i32 136, ; 6
	i32 33, ; 7
	i32 185, ; 8
	i32 73, ; 9
	i32 17, ; 10
	i32 171, ; 11
	i32 194, ; 12
	i32 79, ; 13
	i32 32, ; 14
	i32 25, ; 15
	i32 160, ; 16
	i32 185, ; 17
	i32 127, ; 18
	i32 90, ; 19
	i32 108, ; 20
	i32 131, ; 21
	i32 88, ; 22
	i32 119, ; 23
	i32 168, ; 24
	i32 30, ; 25
	i32 85, ; 26
	i32 8, ; 27
	i32 75, ; 28
	i32 97, ; 29
	i32 146, ; 30
	i32 199, ; 31
	i32 157, ; 32
	i32 196, ; 33
	i32 150, ; 34
	i32 197, ; 35
	i32 34, ; 36
	i32 28, ; 37
	i32 126, ; 38
	i32 96, ; 39
	i32 186, ; 40
	i32 176, ; 41
	i32 204, ; 42
	i32 62, ; 43
	i32 6, ; 44
	i32 162, ; 45
	i32 59, ; 46
	i32 148, ; 47
	i32 27, ; 48
	i32 56, ; 49
	i32 177, ; 50
	i32 39, ; 51
	i32 182, ; 52
	i32 181, ; 53
	i32 94, ; 54
	i32 19, ; 55
	i32 191, ; 56
	i32 122, ; 57
	i32 156, ; 58
	i32 200, ; 59
	i32 172, ; 60
	i32 155, ; 61
	i32 146, ; 62
	i32 143, ; 63
	i32 25, ; 64
	i32 58, ; 65
	i32 133, ; 66
	i32 164, ; 67
	i32 142, ; 68
	i32 10, ; 69
	i32 24, ; 70
	i32 129, ; 71
	i32 74, ; 72
	i32 21, ; 73
	i32 76, ; 74
	i32 14, ; 75
	i32 97, ; 76
	i32 138, ; 77
	i32 202, ; 78
	i32 163, ; 79
	i32 23, ; 80
	i32 118, ; 81
	i32 126, ; 82
	i32 55, ; 83
	i32 107, ; 84
	i32 140, ; 85
	i32 52, ; 86
	i32 86, ; 87
	i32 139, ; 88
	i32 4, ; 89
	i32 147, ; 90
	i32 99, ; 91
	i32 61, ; 92
	i32 130, ; 93
	i32 116, ; 94
	i32 204, ; 95
	i32 49, ; 96
	i32 26, ; 97
	i32 20, ; 98
	i32 16, ; 99
	i32 40, ; 100
	i32 42, ; 101
	i32 22, ; 102
	i32 53, ; 103
	i32 104, ; 104
	i32 77, ; 105
	i32 42, ; 106
	i32 46, ; 107
	i32 135, ; 108
	i32 37, ; 109
	i32 2, ; 110
	i32 95, ; 111
	i32 11, ; 112
	i32 163, ; 113
	i32 149, ; 114
	i32 175, ; 115
	i32 31, ; 116
	i32 32, ; 117
	i32 107, ; 118
	i32 91, ; 119
	i32 174, ; 120
	i32 0, ; 121
	i32 141, ; 122
	i32 156, ; 123
	i32 81, ; 124
	i32 6, ; 125
	i32 123, ; 126
	i32 143, ; 127
	i32 87, ; 128
	i32 59, ; 129
	i32 123, ; 130
	i32 142, ; 131
	i32 120, ; 132
	i32 63, ; 133
	i32 55, ; 134
	i32 30, ; 135
	i32 193, ; 136
	i32 83, ; 137
	i32 175, ; 138
	i32 36, ; 139
	i32 159, ; 140
	i32 101, ; 141
	i32 110, ; 142
	i32 66, ; 143
	i32 50, ; 144
	i32 93, ; 145
	i32 151, ; 146
	i32 193, ; 147
	i32 128, ; 148
	i32 178, ; 149
	i32 111, ; 150
	i32 154, ; 151
	i32 187, ; 152
	i32 41, ; 153
	i32 183, ; 154
	i32 89, ; 155
	i32 1, ; 156
	i32 199, ; 157
	i32 120, ; 158
	i32 137, ; 159
	i32 108, ; 160
	i32 56, ; 161
	i32 208, ; 162
	i32 17, ; 163
	i32 96, ; 164
	i32 9, ; 165
	i32 60, ; 166
	i32 39, ; 167
	i32 101, ; 168
	i32 116, ; 169
	i32 111, ; 170
	i32 105, ; 171
	i32 190, ; 172
	i32 174, ; 173
	i32 57, ; 174
	i32 26, ; 175
	i32 147, ; 176
	i32 169, ; 177
	i32 66, ; 178
	i32 8, ; 179
	i32 2, ; 180
	i32 113, ; 181
	i32 124, ; 182
	i32 165, ; 183
	i32 13, ; 184
	i32 47, ; 185
	i32 67, ; 186
	i32 5, ; 187
	i32 121, ; 188
	i32 99, ; 189
	i32 61, ; 190
	i32 166, ; 191
	i32 98, ; 192
	i32 4, ; 193
	i32 77, ; 194
	i32 137, ; 195
	i32 54, ; 196
	i32 178, ; 197
	i32 161, ; 198
	i32 79, ; 199
	i32 132, ; 200
	i32 112, ; 201
	i32 125, ; 202
	i32 203, ; 203
	i32 71, ; 204
	i32 12, ; 205
	i32 58, ; 206
	i32 57, ; 207
	i32 162, ; 208
	i32 117, ; 209
	i32 151, ; 210
	i32 14, ; 211
	i32 41, ; 212
	i32 65, ; 213
	i32 179, ; 214
	i32 48, ; 215
	i32 106, ; 216
	i32 158, ; 217
	i32 69, ; 218
	i32 18, ; 219
	i32 206, ; 220
	i32 118, ; 221
	i32 170, ; 222
	i32 154, ; 223
	i32 12, ; 224
	i32 201, ; 225
	i32 64, ; 226
	i32 47, ; 227
	i32 183, ; 228
	i32 188, ; 229
	i32 38, ; 230
	i32 13, ; 231
	i32 10, ; 232
	i32 132, ; 233
	i32 158, ; 234
	i32 205, ; 235
	i32 207, ; 236
	i32 68, ; 237
	i32 128, ; 238
	i32 157, ; 239
	i32 16, ; 240
	i32 168, ; 241
	i32 11, ; 242
	i32 119, ; 243
	i32 191, ; 244
	i32 15, ; 245
	i32 190, ; 246
	i32 197, ; 247
	i32 53, ; 248
	i32 20, ; 249
	i32 117, ; 250
	i32 166, ; 251
	i32 93, ; 252
	i32 15, ; 253
	i32 82, ; 254
	i32 43, ; 255
	i32 64, ; 256
	i32 35, ; 257
	i32 84, ; 258
	i32 172, ; 259
	i32 202, ; 260
	i32 139, ; 261
	i32 133, ; 262
	i32 36, ; 263
	i32 177, ; 264
	i32 180, ; 265
	i32 182, ; 266
	i32 173, ; 267
	i32 85, ; 268
	i32 194, ; 269
	i32 87, ; 270
	i32 60, ; 271
	i32 1, ; 272
	i32 21, ; 273
	i32 75, ; 274
	i32 44, ; 275
	i32 70, ; 276
	i32 71, ; 277
	i32 189, ; 278
	i32 109, ; 279
	i32 27, ; 280
	i32 73, ; 281
	i32 91, ; 282
	i32 112, ; 283
	i32 43, ; 284
	i32 109, ; 285
	i32 72, ; 286
	i32 84, ; 287
	i32 206, ; 288
	i32 54, ; 289
	i32 110, ; 290
	i32 161, ; 291
	i32 136, ; 292
	i32 80, ; 293
	i32 131, ; 294
	i32 188, ; 295
	i32 181, ; 296
	i32 95, ; 297
	i32 80, ; 298
	i32 114, ; 299
	i32 82, ; 300
	i32 34, ; 301
	i32 7, ; 302
	i32 102, ; 303
	i32 115, ; 304
	i32 208, ; 305
	i32 129, ; 306
	i32 45, ; 307
	i32 67, ; 308
	i32 186, ; 309
	i32 180, ; 310
	i32 141, ; 311
	i32 144, ; 312
	i32 195, ; 313
	i32 179, ; 314
	i32 78, ; 315
	i32 138, ; 316
	i32 169, ; 317
	i32 103, ; 318
	i32 45, ; 319
	i32 198, ; 320
	i32 113, ; 321
	i32 89, ; 322
	i32 148, ; 323
	i32 195, ; 324
	i32 127, ; 325
	i32 184, ; 326
	i32 7, ; 327
	i32 63, ; 328
	i32 155, ; 329
	i32 94, ; 330
	i32 104, ; 331
	i32 24, ; 332
	i32 192, ; 333
	i32 92, ; 334
	i32 207, ; 335
	i32 65, ; 336
	i32 106, ; 337
	i32 3, ; 338
	i32 51, ; 339
	i32 205, ; 340
	i32 22, ; 341
	i32 130, ; 342
	i32 209, ; 343
	i32 23, ; 344
	i32 192, ; 345
	i32 69, ; 346
	i32 200, ; 347
	i32 40, ; 348
	i32 35, ; 349
	i32 144, ; 350
	i32 83, ; 351
	i32 31, ; 352
	i32 33, ; 353
	i32 149, ; 354
	i32 170, ; 355
	i32 98, ; 356
	i32 28, ; 357
	i32 103, ; 358
	i32 48, ; 359
	i32 153, ; 360
	i32 209, ; 361
	i32 88, ; 362
	i32 78, ; 363
	i32 62, ; 364
	i32 50, ; 365
	i32 102, ; 366
	i32 152, ; 367
	i32 134, ; 368
	i32 3, ; 369
	i32 49, ; 370
	i32 90, ; 371
	i32 124, ; 372
	i32 125, ; 373
	i32 187, ; 374
	i32 52, ; 375
	i32 171, ; 376
	i32 184, ; 377
	i32 160, ; 378
	i32 122, ; 379
	i32 92, ; 380
	i32 19, ; 381
	i32 201, ; 382
	i32 105, ; 383
	i32 189, ; 384
	i32 86, ; 385
	i32 115, ; 386
	i32 135, ; 387
	i32 150, ; 388
	i32 70, ; 389
	i32 167, ; 390
	i32 165, ; 391
	i32 198, ; 392
	i32 5, ; 393
	i32 72, ; 394
	i32 140, ; 395
	i32 164, ; 396
	i32 46, ; 397
	i32 29, ; 398
	i32 51, ; 399
	i32 145, ; 400
	i32 38, ; 401
	i32 167, ; 402
	i32 29, ; 403
	i32 203, ; 404
	i32 145, ; 405
	i32 176, ; 406
	i32 100, ; 407
	i32 74, ; 408
	i32 44, ; 409
	i32 159, ; 410
	i32 134, ; 411
	i32 18, ; 412
	i32 121, ; 413
	i32 81, ; 414
	i32 68, ; 415
	i32 37, ; 416
	i32 173, ; 417
	i32 114, ; 418
	i32 100 ; 419
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
