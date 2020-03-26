# EasysShop
간편하고 사용하기 쉬운 헤어샵 고객관리 프로그램 입니다.

# Project Info
- 프로젝트 명 : EasysShop(고객관리)
- 개발 기간 : 2019.12.01 ~ 2020.02.12
- 참여 인원 : 5명 (PL)
- 담당 업무 : DB설계, 화면구현, 기능, 개발
## Use Technology
- 개발 환경 : Windows 10
- 사용 도구 : Eclipse Kepler Release, OracleDeveloper
- 사용 기술 : Java, oracle, jQuery, JSON, Ajax, HTML, CSS, JSP, XML
# Preview 
![S_예약일정](https://user-images.githubusercontent.com/58777597/75116068-d158b400-56a7-11ea-9442-89c4735ff4c8.PNG)
![S_월간 예약 목록](https://user-images.githubusercontent.com/58777597/75116069-d3227780-56a7-11ea-8afe-8dccbf875948.PNG)
![S_월간 일정 목록](https://user-images.githubusercontent.com/58777597/75116071-d453a480-56a7-11ea-8b30-b5c14e011a3c.PNG)

## Plan
![기획1](https://user-images.githubusercontent.com/58777597/75116197-1f21ec00-56a9-11ea-9c1e-4d7bdb333c83.png)
![기획2](https://user-images.githubusercontent.com/58777597/75116195-1df0bf00-56a9-11ea-93e3-d9241d16ecdf.png)
- Ovenapp.io를 사용하여 디자인 기획을 진행 하였습니다

## DB Design 
![스키마](https://user-images.githubusercontent.com/58777597/75116208-44165f00-56a9-11ea-95ee-79a805950688.PNG)
- Oracle을 사용하여 DB설계를 하였습니다
## [모듈화]
- 모듈화된 DB설계를 통하여 확장성 확보
- 공통 코드 사용을 통하여 데이터 사이즈 축소

## DB ERD
![ERD](https://user-images.githubusercontent.com/58777597/75116212-52647b00-56a9-11ea-8a9a-36c8735aec4d.png)
- Drawio를 이용하여 ERD설계를 하였습니다
![기능정의서](https://user-images.githubusercontent.com/58777597/75116252-b7b86c00-56a9-11ea-9ea7-3e56868b11be.png)
- 기능정의서 작성
![메타데이터](https://user-images.githubusercontent.com/58777597/75116253-b9822f80-56a9-11ea-83e5-513c5b0784e6.png)
- 기능정의서를 기반으로 나온 명사들의 명을 정의
- 회의를 통하여 팀원간 중복된 메타명 조정
## Table Definition
![테이블정의서](https://user-images.githubusercontent.com/58777597/75116220-601a0080-56a9-11ea-8fc5-1cb5826fbbf6.png)
- 모델링 데이터를 기준으로 테이블 정의서 작성

## Framework Design
[Spring 3.9]
- Annotation Driven을 통한 컨트롤러 호출
- Resource Mappting을 통한 리소스 폴더 관리

[MyBatis]
- MyBatis와 Oracle 연동 구현
- Connection Pool 셋팅을 통한 DB 연결 최적화

[MAVEN]
자바 프로젝트의 빌드(build)를 자동화 해주는 빌드 툴(build tool)이다.
즉, 자바 소스를 compile하고 package해서 deploy하는 일을 자동화 해주는 것이다.

## Devlop
[SVN을 통한 공동작업]
- SVN을 활용하여 팀 작업을 진행
- 파트별 개발을 통한 개발일정 단축

## Development Tools
- eclipse
- sqldeveloper

## Using Language
- Java
- HTML, CSS3, JavaScript, jQuery


## Development Environment
- JDK 1.8.0
- Spring Framework 3.9.10
- maven-eclipse-plugin 2.9
- Mybatis 3.2.7
- Log4j 1.2.15
- Servlet 3.0.1
- DB : Oracle 12.1.0.2.0
- Server : Tomcat 8.5
- jQuery 1.12.4

## DevOps
- Github
- SVN
