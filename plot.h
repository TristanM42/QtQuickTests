#ifndef PLOT_H
#define PLOT_H

#include <QObject>
#include <QQmlEngine>
#include <QQuickPaintedItem>
#include <QPainter>

#include <QDebug>
#include <QElapsedTimer>

class Plot : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
public:
    Plot();

    // QQuickPaintedItem interface
public:
    void paint(QPainter *painter);
    int m_nbPoints = 0;

private:
    QPointF m_points[640*480];
    uint64_t fullLoopStartTimestamp = 0;
    uint64_t paintLoopStartTimestamp = 0;
    QElapsedTimer timerAnim;
    QElapsedTimer timerLogs;

    float pX[456] = {23.03945642325823, 27.47903888741928, 39.67764963393813, 50.612104575715875, 60.01973947756619, 70.63151764576924, 81.09386517624228, 92.985511640754, 103.09816745820865, 112.80728458971635, 123.93872530875899, 135.5569730021407, 148.6093614507903, 159.52856726528034, 170.78541298147206, 181.873932081877, 192.527838576283, 205.76807759250858, 216.46299008528126, 227.84569613657175, 239.6212066711537, 252.26611451467613, 269.33579680677656, 285.22697630044706, 302.3992105630923, 317.4675041623501, 330.5781179857162, 348.3267049657665, 365.98554826414784, 378.795705436314, 381.032828565999, 376.9500751654149, 371.64260690679777, 360.43327560310604, 347.37213983571263, 336.1519269312646, 325.13217217641613, 320.4323026542196, 326.4854832703003, 335.2245100556985, 343.6084760884351, 356.25567821458463, 368.866123233213, 379.64274128189015, 390.9546451742833, 399.34844876432373, 407.29820998528237, 416.5774627405281, 424.67158097139276, 433.0006130484713, 441.0259130728945, 450.6770372568465, 462.0934203668348, 473.6422700840593, 486.62466744664414, 497.86046899192314, 508.72308440726624, 522.2194648772738, 531.9056957412927, 537.3898838720911, 541.9017811402693, 542.2822688084552, 542.5256269208344, 540.4697815680138, 530.0188739789307, 519.0480536587388, 506.8522172954396, 492.38778476309204, 480.9692052787976, 469.68816642077076, 458.8788093059337, 446.14517501515013, 429.54865446279535, 413.592569829386, 400.2652803280654, 392.76708360283055, 395.63551373316005, 407.6822084688963, 419.60240961232796, 431.57150167096273, 448.0356532457949, 464.5865117432004, 478.88613086221613, 492.777066012451, 506.69095997407607, 514.6803668783807, 515.9108974634673, 513.7467429352439, 505.3775312739021, 492.71258132806065, 481.1344881341693, 469.76117948829, 459.07485010575226, 445.92862001276774, 425.50586436794555, 406.8492799797625, 391.8932090161477, 375.5681848804667, 362.13473896985107, 351.82350777386756, 340.06179540618564, 326.1460774555902, 313.92636761060805, 302.87912617322365, 292.295146379989, 284.98750843423613, 278.3398698985118, 272.1027250372149, 264.46810373423125, 257.32029699349243, 249.68835678015898, 232.52924933726229, 217.40601976454252, 209.48767325574477, 204.3744393465488, 208.62954064802443, 219.0208054408614, 229.1445544016326, 237.74950203231754, 244.16452268386297, 241.4037984823069, 226.58050709319116, 205.40340548978622, 181.29208329930293, 162.64038658774984, 148.2849976912015, 133.09042521284346, 124.49901000776106, 122.67849462360346, 122.6279815144452, 126.77119519113012, 131.6982237446059, 133.15672771083723, 132.64951567919138, 125.72083276495471, 113.76055154554012, 102.83797673871993, 91.65063168382517, 79.98172171520082, 70.34699672405986, 63.760818037229456, 64.34713277116555, 75.5848031173881, 90.47091890235163, 101.82394990510477, 109.92323665472827, 114.47072845870878, 115.60120133197745, 115.02218810458578, 110.09137697262838, 100.36229746667368, 88.29566689567139, 74.25207188248373, 60.48237931256119, 49.34272461359774, 39.58951105060942, 31.205322554106374, 27.253575708978815, 27.115526125794645, 26.836896896982694, 26.27851009999995, 23.06457168115037, 14.90103239849509, 7.454327055380531, 2.4029626419784336, 0.0, 0.20106993330728073, 0.4247388447006415, 2.743215102641102, 6.3201513245454635, 10.43375654337433, 19.02671993083152, 30.437044182755585, 41.66912171575973, 52.924202643970716, 62.627584770109365, 72.63082074047065, 84.08856834627511, 95.03006671698063, 106.25463270649675, 117.32762726626652, 128.3934792176475, 140.79291128846614, 154.56482908319515, 166.7245551180756, 177.28770543878875, 189.4911066547561, 196.9374767924037, 197.95130475620806, 193.92685763445627, 183.4762298722294, 171.0801946096683, 154.7402134816765, 136.60856887739965, 119.64695287253846, 102.63510499146082, 88.93756314633197, 74.71654203331104, 63.49152147740381, 62.85007219111844, 67.3245431854167, 74.85613234890639, 86.19002404483228, 97.40566895542622, 108.90097573370565, 122.78259942834995, 127.25938368385971, 116.15832220004859, 103.50580737244718, 91.118067359056, 78.40192109932923, 73.03308905515792, 76.668911212735, 92.74864798647388, 111.6339611228151, 127.0086637296057, 144.4166082668704, 157.18094348481645, 164.39180261665194, 168.5227499389698, 168.0343154427967, 163.82166108106298, 156.83435765274487, 148.15900256250563, 142.35983682693382, 147.7154019574582, 159.80991424496528, 170.23969083422185, 182.27000485337317, 195.0117245709988, 206.62402638178185, 217.57196906668457, 223.4086934430445, 224.36884068644304, 220.06973951046643, 212.27385521360543, 203.447465127579, 188.77094528867394, 170.4589888191523, 152.14941124564245, 134.43998703654154, 118.17435946415537, 101.03891459072133, 80.8550565412828, 61.81574750878303, 48.73060826679182, 36.3874636327356, 23.918628853706196, 19.77284055529185, 28.269886217434987, 44.36510404685407, 59.86374962522177, 75.67957308263215, 93.57511359765692, 112.12056552758588, 134.01909824342465, 157.77375316316034, 176.39013608705204, 179.11815437518885, 167.61132395160894, 156.71877053776302, 144.25845660307232, 128.63091800744178, 116.20767612374038, 99.13720559593867, 79.46603625369801, 66.24959643168813, 54.37004348168364, 50.07568425185684, 58.93356781781563, 70.00037245686406, 81.52483042963888, 96.00432642340115, 111.95577359639674, 129.18745762660376, 145.5797944316223, 163.97758862449245, 183.70538845745205, 197.5425553400703, 210.03095233804845, 222.33201061059856, 233.24646749949898, 244.0616340873048, 245.1213380475773, 238.830912476883, 233.5333423851099, 227.71485011687673, 221.97679588950848, 221.94688440832363, 235.14034420808343, 255.22417826351034, 272.6443838125258, 286.6329276066615, 294.4423161771588, 299.19733588569443, 303.6453254803122, 309.4752589855275, 319.43116398707923, 329.8700639043034, 343.35786882743093, 361.16578411890924, 379.1790766544483, 396.66526172713014, 414.703047118486, 430.92871099962, 445.38700489306046, 467.338074820908, 489.7824566339199, 503.4259878411424, 508.93540371644855, 502.5941857139762, 493.7420105036234, 487.32716295106013, 476.5922748397429, 457.7956030314975, 431.6011010428234, 408.8359211873051, 395.2962690092842, 388.5196794039181, 387.91334089675826, 396.932027824001, 418.6914448071363, 440.2600852034072, 453.7525261379794, 467.7044561162344, 481.12571843571556, 487.69178119294946, 480.11994499891836, 457.994935530203, 435.4936287358592, 415.2142969219895, 393.232243370135, 374.30632167882953, 352.7574831755327, 328.80047612512124, 311.6847798739093, 298.92972458403983, 289.47496592854543, 280.46651301342354, 273.7507624756653, 271.94568371349214, 269.08227989390923, 266.86224432235224, 265.07898037710095, 266.7173247654192, 277.246611054587, 290.5423976859736, 305.90992387381584, 324.37390107703516, 339.78802061218335, 351.2806450737534, 361.7844402543203, 375.29707797416546, 388.3743404231508, 393.0836868198642, 390.8454225344115, 383.89660833355947, 375.08588637342365, 365.7188715508881, 354.1469317736596, 341.7785476773743, 329.43678905083493, 318.53082441166623, 309.123775554178, 298.4141238207793, 287.75305010398836, 278.25159748694364, 266.938275358723, 255.5987316660387, 250.69014687308447, 252.41692800613077, 259.2888338153589, 270.75273735082453, 281.60774250056375, 293.50382336205666, 308.09768854107244, 320.0931858817504, 329.0433143381629, 337.05029145973464, 345.34754411074357, 353.66710579456924, 362.60552079213375, 371.7771683215624, 380.288584524069, 390.7213437297558, 402.27483685031007, 412.9213522914783, 422.0764383275291, 430.0563886650381, 439.1725911737176, 448.01507025928623, 455.8334818120251, 463.9569244376401, 471.06052253691456, 479.11746885946786, 487.55601290571326, 494.6918563851196, 502.44373547426136, 508.69501416799415, 513.168056520941, 517.8622464595537, 521.5609319486903, 525.0076966763165, 529.166179506529, 531.2033965323519, 531.73228202262, 532.9242949977366, 534.4963850772062, 536.5163616662323, 542.9715996931398, 550.6318069252582, 550.5629655393033, 548.2881488684952, 547.9661280869883, 548.4701462643899, 549.1035342880016, 548.2440861926584, 548.12100203504, 546.4713420274489, 543.9006958078484, 541.5779131525676, 536.4947703005633, 531.988163338413, 527.2631997527026, 514.5815731351183, 500.5833845997443, 496.26080258336583, 496.01424286369206, 499.69403628877717, 510.65489446630176, 523.1975648811748, 534.7042812800789, 543.7069085431323, 550.3017621791748, 556.3578865338133, 559.576338571751, 560.2290899449822, 559.0938152170197, 548.551743040148, 532.9724038895899, 522.4700821083428, 513.0734186175839, 504.6459070862553, 499.9956490339448, 502.7958002562333, 513.0496333005559, 524.2240829473828, 535.8596920447943, 546.2848861650791, 556.2555754223337, 559.2610069162722, 551.9474210557801, 544.1089581924921, 534.398426145045, 528.0564272645098, 526.48796471865};
    float pY[456] = {71.52904163667915, 72.11701073024881, 75.49635999472002, 78.86843939726509, 81.1008891669943, 83.85840876564828, 87.24205331710482, 89.44823375557075, 91.33163285428839, 94.56376090528431, 97.29216846591896, 99.01673467620594, 100.58408139150094, 101.41576881633046, 101.40942423502918, 100.05813926936571, 95.08631196419424, 88.52096993732084, 83.1149072083291, 77.30706206350715, 73.37961487341329, 71.18474970643877, 69.45904245120903, 69.51037477492514, 69.50179240381408, 69.54791266446091, 69.4057061362737, 69.65335638230624, 69.26019314236748, 70.26287831050968, 78.68505860962273, 87.22308263232992, 91.26796905151082, 96.14145951603166, 101.16661588788031, 105.77037619279497, 114.65768227039757, 126.28324966206242, 133.61722228832082, 137.09066151996967, 140.35924739272025, 141.7076817500689, 141.91358215098592, 142.13014622703736, 137.1832070510419, 128.94570794828246, 120.03112608855224, 110.82403640953635, 102.79752867318052, 94.03995365720414, 87.38743454105781, 80.63119529547464, 74.0574644026326, 73.16159643100923, 73.67024456924639, 72.94388963802976, 74.204441733831, 77.88892701995621, 81.18998011508063, 86.53397107192086, 97.08188121115097, 109.93105254121929, 121.83332640303331, 130.52565356656464, 134.41899786507895, 136.25911553325204, 139.0941129636817, 141.7422425674962, 143.78873286382384, 146.8528040741162, 149.9416679254159, 151.5281463450126, 154.1785768413447, 157.70505227344518, 162.63505063226864, 172.3272614515398, 184.34716271378272, 193.5143791681254, 198.43716887663982, 201.61353397322716, 202.13943063996385, 202.24098568095326, 203.7532901207419, 204.22434581991376, 205.6807944091372, 209.69747757109224, 219.46723525393327, 229.8637866692353, 235.0283539380422, 240.16928589178735, 243.8613512890994, 245.76349380680517, 247.0050096711558, 246.4363514268789, 246.7147655180445, 246.5568364212262, 244.36695481953336, 240.94277236329128, 236.41956439636192, 232.55718817096817, 228.5964837790383, 222.68801205662987, 216.2484843974538, 208.44349452802328, 198.80824747869588, 189.05380447745813, 178.44185945881577, 164.5494536459022, 145.89733479325776, 129.16155296052568, 122.66528521096257, 123.56767528493174, 127.4784227951252, 136.85552445664973, 150.08071331984752, 162.81266655341278, 175.56752156531275, 188.72253551568315, 204.48874081952113, 220.23923922977156, 228.52478734827082, 231.74696078677482, 233.22332593415615, 232.6426779795587, 229.26729569103702, 220.71183780729905, 209.77804338151293, 198.4609289409533, 186.95965444899502, 176.4919856902951, 166.95107343192262, 158.98949037622663, 149.25076261122717, 138.68903835608216, 129.62558717998422, 121.66328940855226, 119.5575120035918, 119.81211592183809, 119.64796459751642, 123.31188776667864, 130.61349245837357, 141.73986063722668, 156.07539457017594, 172.03361358745485, 186.23034764345073, 197.35822179343552, 208.3731330715882, 219.75400755464386, 230.61246591187694, 238.4694304079901, 242.54710726200892, 243.92585813853486, 243.78149506793807, 243.7145925609792, 243.8707581949601, 239.98316233119942, 229.57832732789313, 218.19800821139927, 207.09080528624702, 195.7833186732064, 184.62213293624075, 174.7212230434452, 174.0021300301721, 181.9806065515504, 192.51810031032187, 203.7025963167947, 215.04472848569196, 225.3714892239683, 233.45301941745277, 244.10626944432477, 254.31303069888247, 261.05691442443583, 269.7126891651434, 276.69890738221295, 280.8724729528856, 283.76169438827424, 284.18930509656593, 284.2261797989993, 284.16404731239004, 284.1818459404187, 283.3848998664687, 280.93756468372044, 278.40583597755926, 275.01911395943125, 272.1587120726655, 271.0423051567127, 271.2875694389719, 277.5330281212217, 288.2228813102731, 296.23209529983933, 299.5688517588053, 300.556766149311, 301.90869864189426, 301.9004157293025, 301.8987712721653, 303.20597055293706, 305.6263207933282, 309.82765387943846, 314.7808740086575, 322.3420602339522, 329.3045247920893, 334.4650606191467, 340.1856892145722, 343.8212676539574, 346.4005607121135, 349.62953799534466, 352.69861932259187, 353.3986552042361, 353.41053993051696, 356.5392821894618, 360.89783758430644, 368.60576029146637, 379.43235614168157, 386.5143006832643, 389.11931296957937, 389.1743902496248, 388.4218789500728, 385.9146384180199, 379.5688953262502, 371.03411163998885, 360.68321287997765, 349.90658004306056, 340.74533810772687, 333.43772919461503, 326.5440208719733, 319.6204751993505, 315.80043999370037, 315.65005073578914, 317.5141351678908, 320.74555538591835, 325.38813125015463, 334.5409429358965, 349.4695422792727, 364.1732028986944, 377.37779490750995, 387.904370477004, 393.9824567341616, 401.3200477794603, 408.86027104479217, 413.6996431791406, 415.92468471658276, 415.79942811548744, 414.11326150175023, 410.09285097400107, 406.12477154545263, 404.4837797575876, 405.0471190486178, 409.4123365377877, 419.3158006182589, 431.0592209401757, 440.33812183185546, 445.6403502145406, 446.44993601363444, 446.25764894491203, 446.39617954749474, 445.6491864514601, 445.1820694464129, 445.19404194698404, 445.30314103618025, 446.27504262927573, 449.0652395127013, 450.97437425493877, 451.4600945800694, 452.72949702657684, 453.45747498992614, 455.62705346431994, 459.3283532738178, 462.5398851395496, 467.3231681063612, 472.3416623795763, 476.2416502222736, 479.2408428019719, 479.9855593455313, 479.93467979144657, 479.8183262044902, 480.0, 479.3500786802747, 476.3819757948113, 474.10773308148487, 472.7575451729192, 470.6637189465939, 468.01062086950515, 464.69164010956774, 456.45569881712095, 445.46579817371094, 437.31764165270124, 426.8751557139542, 413.8772438503022, 404.2019058443336, 400.7056261889277, 399.9571188723155, 402.75308907341537, 411.31157316176905, 420.2118811439036, 432.04245523453415, 444.6507136927487, 455.5243535883885, 464.5941624114332, 469.0058476556469, 473.1028033596865, 475.23354296796424, 474.95138585287486, 474.79866336951727, 473.86613140439385, 472.1444327935251, 470.9979817398689, 469.40671327562427, 466.36578407453385, 465.701414246254, 460.4254273749391, 449.0332031789919, 437.26758804135784, 427.6584175707935, 425.51749573624807, 425.36918960165167, 425.5795505238732, 424.8872796571218, 421.36428295704263, 417.00304991258963, 407.35116017536984, 399.5114380112552, 396.50180938385597, 393.588738831319, 391.89710611896976, 390.0851284653736, 388.3576056021984, 382.9573001940107, 372.9705472380781, 365.66576156868337, 361.7107838487518, 359.8406316432431, 361.45496570747605, 364.2997956025972, 366.0138766367286, 366.3587449307745, 366.16846110794404, 366.55010163515453, 363.73800956822333, 354.469117124866, 342.22460729502154, 329.57880599604664, 318.23281730220583, 309.4492904804813, 296.71518187663924, 282.7616229704274, 278.386915692456, 277.6802332818204, 279.9690764193267, 288.93826527239344, 296.7391573767686, 304.8836781277746, 313.8283531768425, 320.66303946746575, 323.85701791221345, 316.72755053644414, 305.8764969661006, 299.09645541967916, 293.1978946572474, 288.3021418065696, 284.32534761491615, 280.5027374112424, 277.5035826689485, 274.3995300774459, 271.98674457587424, 269.5165734469157, 266.8748973320976, 265.61501952785886, 263.972021971319, 262.5630441067774, 256.32778302542727, 246.29988920714231, 241.11862656723258, 237.14775242722305, 235.37359926285842, 235.60175382879174, 235.53089254218196, 238.52019802739687, 241.30622413828826, 244.41078001062294, 248.92525730082104, 253.2133895764165, 257.57090636324415, 260.5790488416211, 263.74733552551015, 267.11139500650677, 269.6882546408052, 273.44055484792307, 277.6152243673529, 282.0203172165352, 288.9192395177963, 295.51696053392766, 301.0520692581531, 307.8996458051115, 312.5964542738825, 318.4670447040869, 326.63920510266985, 332.55785473476317, 338.8048451847442, 344.61549731201694, 350.5825517459584, 357.26786265574106, 365.97567249521603, 377.4540129660229, 386.7462986660871, 397.1692803337926, 408.82014931870117, 419.6097152175107, 430.09770986479, 438.0694295240503, 449.10760295697673, 455.4230398676232, 447.9501993978681, 437.9848482820694, 427.588257995033, 417.163442747835, 407.6144924847847, 396.09821594412006, 385.0919512049368, 373.80408257858676, 364.1003942086902, 354.55965107066527, 342.6798261903509, 333.67936464561376, 326.2427638686395, 314.8605958630071, 300.92800597585074, 289.15763666014504, 278.28963351090295, 267.36291317605367, 261.11098379410214, 257.0570073204873, 252.66536484064068, 251.08805641605522, 245.1396480033343, 233.71918110694173, 222.92227356574517, 209.97990659326263, 198.8245203112009, 191.7279775919493, 186.06792002763314, 182.34654431232707, 178.99440916076014, 174.5422567641283, 166.79514988463757, 158.8401442424473, 154.8511320090688, 153.33895865273655, 153.42914093983768, 153.692339704828, 154.63649774058376, 161.2467686131945, 168.2637935342524, 170.80201909890422, 172.9422158833811, 168.030251361527, 162.67757415077313};
    int linePointToAddIndex = 0;
};

#endif // PLOT_H
