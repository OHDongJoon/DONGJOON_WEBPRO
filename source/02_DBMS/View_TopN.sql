-- [x] VIEW , INLINE VIEW , TOP-N 구문

-- 1. VIEW : 가상의 테이블 (1)단순뷰 (2) 복합뷰

-- (1) 단순뷰 : 하나의 테이블로 구성한 뷰 
--EMPv0이라는 VIEW 생성 또는 수정 = EMP테이블 일부 필드를갖는 가상의 테이블
 -- 데이터 딕셔너리 뷰 확인
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO FROM EMP; -- DDL을 수행하면 데이터딕셔너리 자동 수정 

SELECT * FROM USER_VIEWS;
SELECT * FROM EMPv0; --가상의 테이블
INSERT INTO EMPv0 VALUES (1111,'홍','ITMANAGER',7369,SYSDATE, 40); -- 뷰에 INSERT하면 EMP 테이블에도 INSERT 됨 

SELECT * FROM EMPv0 WHERE EMPNO= 1111; -- '홍' 확인

SELECT * FROM EMPv0;
SELECT * FROM EMP; -- EMP에도 데이터가 들어감 
UPDATE EMPv0 SET JOB='MANAGER' WHERE EMPNO = 1111; -- 업데이트도 가능 

DELETE FROM EMPv0 WHERE EMPNO=1111; -- 뷰 DELETE 하면 EMP 에서도 DELETE 됨  와우 


-- EMPv0이라는 VIEW : EMP테이블의 30번 부서행만
CREATE OR REPLACE VIEW EMPv0 
    AS SELECT * FROM EMP WHERE DEPTNO=30;
    DESC EMPv0;
SELECT * FROM EMPv0;
-- 30번 부서 INSERT
INSERT INTO EMPv0 VALUES (1111, '홍', NULL, NULL, SYSDATE,9000, 900, 30); --30번 부서 INSERT

--40번 부서 입력 안나옴  가상의 테이블이기 때문에 30번부서로 설정해놔서 보이지 않음 EMP에서는 보임
INSERT INTO EMPv0 VALUES (1112, '박', NULL, NULL, SYSDATE, 8000, 800, 40);
SELECT * FROM EMPv0;--안나옴  가상의 테이블이기 때문에 30번부서로 설정해놔서 보이지 않음 EMP에서는 보임
SELECT * FROM EMP;  -- 여기서는 찐 테이블이기 때문에 보임
DELETE FROM EMPv0 WHERE EMPNO IN(1111,1112); -- 1111은 지워지나 1112는 EMP에서 안 없어짐 
 -- EMPv0 은 처음에 30번부서로 설정해 놔서 여기에 30번만 있다고 생각함 1111만 지워짐 
 DELETE FROM EMP WHERE EMPNO = 1112; --40번 부서 EMP 에서 삭제 
 
-- EMPv0 뷰 생성 : ENAME, JOB, HIREDATE만으로 뷰  (NOT NULL 필드를 미포함하면 INSERT 불가  )
CREATE OR REPLACE VIEW EMPv0
    AS SELECT ENAME, JOB, HIREDATE FROM EMP; -- 모든걸 가져온게아니고 일부 필드만 가져옴
    
INSERT INTO EMPv0 VALUES ('홍','SALESMAN', SYSDATE); -- 이렇게 하면 EMPNO에 NULL이 들어가는데 EMPNO은 NOTNULL 이기때문에 안됨
SELECT * FROM EMPv0;
COMMIT;




-- VIEW의 제한 조건 (1) 뷰의 조건  (2) 읽기전용

-- WITH CHECK OPTION 설정한 뷰는 뷰의 조건에 해당되는 데이터만 삽입, 수정, 삭제 가능 

-- WITH READ ONLY을 설정한 뷰는 읽기 전용 뷰

-- EMPv0 : EMP테이블에서 30번 부서만
CREATE OR REPLACE VIEW EMPv0 
    AS SELECT * FROM EMP WHERE DEPTNO =30
        WITH CHECK OPTION;
INSERT INTO EMPv0 VALUES (1111,'홍', NULL, NULL, SYSDATE, 9000,900,30); -- 30번 부서만 INSERT 
INSERT INTO EMPv0 VALUES (1112,'홍', NULL, NULL, SYSDATE, 9000,900,40); -- WHERE 조건에 만족하지 않으면 불가

SELECT * FROM EMP;
SELECT * FROM EMPv0;
DELETE FROM EMPv0 WHERE ENAME='SMITH'; -- 20번 부서 SMITH
DELETE FROM EMPv0 WHERE EMPNO=1111; -- 30번 부서 DELETE


-- EMPv0 : 읽기전용 뷰 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, MGR, DEPTNO FROM EMP
    WITH READ ONLY; -- 읽기 전용  셀렉트 는 아무렇게나 가능 
INSERT INTO EMPv0 VALUES (1111,'홍', NULL, NULL, 40) ; -- 에러 (읽기전용)




-- (2) 복합뷰 : 2개 이상의 테이블로 구성한 뷰이거나 가상의 필드로 뷰를 만들 경우. DML문을 제한적으로 사용
-- ① 2개 이상의 테이블 뷰 생성
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
SELECT * FROM EMPv0;

INSERT INTO EMPv0 VALUES (1111, 'HONG', 'MANAGER', 'RESEARCH', 'DALLAS') ; -- 복합뷰는 갱신 불가쓰

-- ② 가상의 필드로 뷰  : 컬럼에 별칭 (영문자로시작, 영문자, 숫자, _) 을 이용하여 뷰 생성
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, SAL*12 "YEAR_SAL"FROM EMP WHERE DEPTNO= 10; -- (SAL*12는 없어)
    SELECT * FROM EMPv0;

CREATE OR REPLACE VIEW EMPv0 (EMPNO, ENAME, YEAR_SAL)   -- 요렇게도 가능   별칭들만 따로 나열 
    AS SELECT EMPNO, ENAME, SAL*12 FROM EMP WHERE DEPTNO= 10;
    SELECT * FROM EMPv0;
    INSERT INTO EMPv0 VALUES (1111, '홍', 2400); -- 복합뷰는 갱신 불가 


-- ex. 부서번호, 최소급여, 최대급여, 부서평균급여를 포함한 DEPTv1 뷰를 생성 
CREATE OR REPLACE VIEW DEPTv1(DEPTNO, MINSAL, MAXSAL, AVGSAL)
    AS SELECT DEPTNO,MIN(SAL),MAX(SAL),AVG(SAL) FROM EMP  
        GROUP BY DEPTNO;

-- ex. 직책, 부서를 포함한 EMPv0 뷰를 생성
SELECT * FROM DEPTv1;


-- ex. 직책, 부서를 포함한 EMPv0 뷰를 생성 : DISTINCT를 포함한 뷰는 읽기 전용
CREATE OR REPLACE VIEW EMPv0
    AS SELECT DISTINCT  JOB, DEPTNO FROM EMP ORDER BY DEPTNO;
SELECT * FROM EMPv0;
INSERT INTO EMPv0 VALUES ('CLERK', 10); -- 읽기 전용이라 에러 


-- 2. INLINE VIEW : FROM절 상의 서브쿼리 INLINE VIEW라 하며, FROM절에 오는 서브쿼리는 VIEW처럼 작용 
-- ex. 급여가 2000을 초과하는 사원의 평균 급여 
SELECT AVG(SAL) FROM EMP WHERE SAL > 2000; -- EMP테이블중에 2000넘는애 평균 
SELECT AVG(SAL) FROM (SELECT SAL FROM EMP WHERE SAL>2000);

--EX. 부서 평균 월급보다 높은 사원을 사번, 이름 급여 서브쿼리 연습분제 24,15

SELECT EMPNO, ENAME, SAL
        FROM EMP E
        WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = E.DEPTNO ); --섭쿼리

SELECT EMPNO, ENAME, SAL , AVGSAL
    FROM EMP E, (SELECT DEPTNO, AVG(SAL) AVGSAL FROM EMP GROUP BY DEPTNO) A 
    WHERE E.DEPTNO=A.DEPTNO AND SAL>AVGSAL; -- INLINE VIEW
        

-- 3. TOP-N 구문 ( TOP 1~10등 / TOP 11~20등 /TOP 6~10등)
-- ★ ROWNUM : FROM의 테이블로부터 가져온순서
SELECT ROWNUM, ENAME FROM EMP WHERE DEPTNO = 20 ORDER BY ENAME ;
SELECT ROWNUM, ENAME FROM EMP WHERE DEPTNO = 20;

-- 등수, 이름, SAL (전체행에 대해) 
SELECT ROWNUM,ENAME, SAL FROM EMP ORDER BY SAL DESC; -- ROWNUM이 등수가 아니고 테이블로 부터 가져온 순서 
                                                                        -- 샐 기준으로 가져온 순서
SELECT ROWNUM RANK, ENAME, SAL FROM  (SELECT * FROM EMP ORDER BY SAL DESC); -- ROWNUM은 등수 

-- 함수를 이용한 RANK 출력 (비TO THE 추)
SELECT RANK() OVER(ORDER BY SAL DESC) RANK, 
    DENSE_RANK() OVER(ORDER BY SAL DESC) DENSE_RANK,
    ROW_NUMBER() OVER(ORDER BY SAL DESC) ROW_NUMBER,
    ENAME, SAL FROM EMP;

-- SAL 기준으로 1~5등 






SELECT ROWNUM, ENAME, SAL 
    FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC)
    WHERE ROWNUM <= 5; -- 1~ 5등 

--SAL 기준으로 6~10등
SELECT ROWNUM, ENAME, SAL 
    FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC)
    WHERE ROWNUM BETWEEN 6 AND 10; -- 안나와용 ㅠㅠ 와이! 만족하는애가 들어오면 1이되기때문에 6이상 10은 나올수가 없음 
    
-- ★ TOP - N 구문 1단계 모든애 출력
SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC);
--★ TOP - N 구문 2단계 (완성된 TOP-N 구문) RN 엘리아스 필욧
SELECT ROWNUM, RN, ENAME, SAL 
    FROM(SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC))
    WHERE RN BETWEEN 1 AND 5 ;
    
-- 이름을 알파벳 순서대로 정렬해서 6~10번째까지 출력(등수 , 이름, 사번 , JOB, MGR, HIREDATE)

SELECT ROWNUM RN , ENAME,EMPNO, JOB, MGR,HIREDATE FROM (SELECT * FROM EMP ORDER BY ENAME);
SELECT RN, ENAME, EMPNO, JOB, MGR, HIREDATE
    FROM(SELECT ROWNUM RN , ENAME,EMPNO, JOB, MGR,HIREDATE FROM (SELECT * FROM EMP ORDER BY ENAME))
    WHERE RN BETWEEN 6 AND 10;
    



-- ★ 연습문제

-- 1. 부서명과 사원명을 출력하는 용도의 뷰, DNAME_ENAME_VU 를 작성하시오
CREATE OR REPLACE VIEW DNAME_ENAME_VU
    AS SELECT DNAME, ENAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
    SELECT * FROM DNAME_ENAME_VU;

-- 2. 사원명과 직속상관명을 출력하는 용도의 뷰,  WORKER_MANAGER_VU를 작성하시오
CREATE OR REPLACE VIEW WORKER_MANAGER_VU (WORKER, MANAGER)
    AS SELECT W.ENAME, M.ENAME FROM EMP W, EMP M WHERE W.MGR=M.EMPNO;
SELECT * FROM WORKER_MANAGER_VU;

-- 3. 부서별 급여합계 등수를 출력하시오(부서번호, 급여합계, 등수). -- 학생 질문
SELECT DEPTNO, SUM(SAL) SUM FROM EMP GROUP BY DEPTNO ORDER BY SUM DESC; -- 부서별 합계 출력(급여합계 내림차순)
SELECT DEPTNO, SUM, ROWNUM RANK
    FROM (SELECT DEPTNO, SUM(SAL) SUM FROM EMP GROUP BY DEPTNO ORDER BY SUM DESC);

-- 3-1. 부서별 급여합계 등수가 2~3등인 부서번호, 급여합계, 등수를 출력하시오.


SELECT *
    FROM (SELECT DEPTNO, SUM, ROWNUM RANK
            FROM (SELECT DEPTNO, SUM(SAL) SUM FROM EMP GROUP BY DEPTNO ORDER BY SUM DESC))
    WHERE RANK BETWEEN 2 AND 3;

-- 4. 사원테이블에서 사번, 사원명, 입사일을 입사일이 최신에서 오래된 사원 순으로 정렬하시오
SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC;

-- 5. 사원테이블에서 사번, 사원명, 입사일을 입사일이 최신에서 오래된 사원 5명을 출력하시오
SELECT *
    FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC)
    WHERE ROWNUM<=5; -- TOP N 구문이 아님




-- 6. 사원 테이블에서 사번, 사원명, 입사일을 최신부터 오래된 순으로 6번째로 늦은 사원부터 10번째 사원까지 출력
SELECT ROWNUM RN, A.*
    FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC) A; -- 최신부터 오래된 순으로 전체
SELECT EMPNO, ENAME, HIREDATE
    FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC) A)
    WHERE RN BETWEEN 6 AND 10; 







