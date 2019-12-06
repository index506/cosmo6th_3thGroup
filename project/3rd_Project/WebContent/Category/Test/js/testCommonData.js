const TOTALNUM=100; // 총 문제
const LAST_NUM=100; // 마지막 문제번호
var nowNum=1; // 현재 문제번호

var licenseNum=2;
var yearNum=3;
var subjectNum=2;

var testLicense = ['정보처리기사','리눅스마스터 1급'];

var testYear = ['2020년 03월 08일', '2019년 04월 27일','2019년 03월 03일'];
var testYear2 = ['2019년 09월 21일', '2019년 03월 16일'];

var testSubject = [
     '데이터베이스 [1~20 문항]'
    ,'전자계산기 구조 [21~40 문항]'
    ,'운영체제 [41~60 문항]'
    ,'소프트웨어 공학 [61~80 문항]'
    ,'데이터 통신 [81~100 문항]'
];

var testSubject2 = [
     '소프트웨어 설계 [1~20 문항]'
    ,'소프트웨어 개발 [21~40 문항]'
    ,'데이터베이스 구축 [41~60 문항]'
    ,'프로그래밍 언어 활용 [61~80 문항]'
    ,'정보시스템 구축 관리 [81~100 문항]'
];

var testSubject3 = [
     '리눅스 실무의 이해 [1~20 문항]'
    ,'리눅스 시스템 관리 [21~60 문항]'
    ,'네트워크 및 서비스의 활용 [61~100 문항]'
];

var subjects = [
    '데이터베이스'
   ,'전자계산기 구조'
   ,'운영체제'
   ,'소프트웨어 공학'
   ,'데이터 통신'
];

/* 1~3번 문제 */
var quiz = new Array();
quiz[0] = [
    '1. SQL에서 VIEW를 삭제할 때 사용하는 명령은?'
    ,null
    ,'① ERASE'
    ,'② KILL'
    ,'③ DROP'
    ,'④ DELETE'
    ,'3'
    ,'55%'
    ,'DDL (Data Definition Language) : \
    <br>CREATE, DROP, ALTER, TRUNCATE\
    <br>DML (Data Manipulation Language) : \
    <br>SELECT, INSERT, UPDATE, DELETE'
];
quiz[1] = [
    '2. 다음 릴레이션의 Degree와 Cardinality는?'
    ,'../Category/Test/images/quizImageFolder/EIP_20190303/2.png'
    ,'① Degree : 4, Cardinality : 3'
    ,'② Degree : 3, Cardinality : 4'
    ,'③ Degree : 3, Cardinality : 12'
    ,'④ Degree : 12, Cardinality : 3'
    ,'1'
    ,'33%'
    ,'TABLE = Relation\
    <br>Degree = ATTRIBUTE = Column 열 = 필드 4\
    <br>Cardinality = TUPLE = Row 행 = 레코드 3'
];
quiz[2] = [
    '3.관계해석에서 ‘for all : 모든 것에 대하여’의 의미를 나타내는 논리 기호는?'
    ,null
    ,'① 개념스키마'
    ,'② 외부스키마'
    ,'③ 내부스키마'
    ,'④ 처리스키마'
    ,'1'
    ,'27%'
    ,'외부스키마(External Schema) : \
    <br>사용자나 응용 프로그래머가 각 [개인의 입장]에서 필요로 하는 [데이터베이스의 논리적 구조]\
    <br>개념스키마(Conceptual Schema) : \
    <br>데이터베이스의 [전체적인 논리적 구조]로서, 모든 응용 프로그램이나 사용자들이 필요로 하는 데이터를 통합한 [조직 전체의 데이터베이스]\
    <br>내부스키마(Internal Schema) : \
    <br>[물리적 저장장치]의 입장에서 본 데이터베이스 구조로 물리적인 저장장치와 밀접한 계층'
];

/* 98~100번 문제 */
var quiz2 = new Array();
quiz2[0] = [
    '98. OSI 7계층 데이터링크 계층의 프로토콜로 맞지 않는 것은?'
    ,null
    ,'① HTTP'
    ,'② HDLC'
    ,'③ PPP'
    ,'④ LLC'
    ,'1'
    ,'45%'
    ,'HTTP : 응용계층입니다.'
];
quiz2[1] = [
    '99. HDL에서 피기백킹(Piggybacking) 기법을 사용하여 데이터에 대한 확인 응답을 보낼 때 사용하는 프레임은?'
    ,null
    ,'① U-프레임'
    ,'② I-프레임'
    ,'③ A-프레임'
    ,'④ S-프레임'
    ,'2'
    ,'39%'
    ,'정보(Information) 프레임 : \
    <br>사용자 데이터 전달을 위해 피기백킹(piggyback)기법을 통해 확인 응답을 보낼 때 사용\
    <br>즉, 정답은 I-프레임'
];
quiz2[2] = [
    '100. 실제 전송요구가 있는 채널에만 시간 슬롯을 동적으로 할당하여 전송 효율을 높이는 방식은?'
    ,null
    ,'① 수파수 분할 다중화 방식'
    ,'② 베이스밴드 방식'
    ,'③ 광대역 대중화 방식'
    ,'④ 통계적 시분할 다중화 방식'
    ,'4'
    ,'67%'
    ,'[시간 슬롯]을 [실제 전송요구가 있는 채널]에만 동적으로 할당하므로\
    <br>[통계적 시분할] 다중화 방식이 적합합니다.'
];


var user_answer = [
    '2','1','4'
]
var user_answer2 = [
    '1','2','3'
]

/* 해설보기. 정답 여부 */
var ans = new Array('W','C','W','C','W'
                    ,'C','C','C','C','C'
                    ,'C','W','C','C','W'
                    ,'W','W','C','C','W'
                    ,'C','W','W','W','W'
                    ,'W','W','C','C','W'
                    ,'C','W','W','C','W'
                    ,'C','W','W','C','C'
                    ,'C','C','C','C','W'
                    ,'C','W','C','W','W'
                    ,'W','W','C','W','W'
                    ,'C','C','C','C','C'
                    ,'C','W','C','C','W'
                    ,'W','W','C','C','W'
                    ,'C','C','C','W','W'
                    ,'W','W','C','C','C'
                    ,'C','W','W','C','C'
                    ,'C','C','W','C','C'
                    ,'C','C','C','C','W'
                    ,'C','W','C','C','W');