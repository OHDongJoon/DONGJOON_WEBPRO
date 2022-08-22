-- [III] JOIN : 테이블 2개 이상을 연결하여 검색

SELECT * FROM EMP WHERE ENAME='SCOTT'; -- 부서번호 (DEPTNO 20)

SELECT * FROM DEPT ;

-- CROSS JOIN (FROM절에 테이블 2개 이상 넣는것)
SELECT * FROM EMP, DEPT WHERE ENAME='SCOTT';
SELECT * FROM EMP, DEPT ;
-----------------1  *  4

---- 중요 1. EQUI JOIN (동등조인 : 공통필드엔 DEPTNO값이 일치되는 조건 JOIN)
SELECT * FROM EMP, DEPT
    WHERE ENAME = 'SCOTT' AND EMP.DEPTNO=DEPT.DEPTNO;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, EMP.DEPTNO , DNAME, LOC
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO;
    
    -- 테이블의 별칭 이 있으면 별칭으로만 테이블을 액세스할 수 있습니다.
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
    
    --EX. 급여가 2000이상인 직원만 이름, 직책(JOB), 급여, 부서명, 근무지 출력
SELECT EMPNO, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL >= 2000;
    -------(조     인     조     건 )----
    
    
    --EX. LOC이 'CHICAGO'인 사람의 이름, 업무, 급여, 부서번호 , 근무지를 출력
    
SELECT ENAME, JOB,SAL, D.DEPTNO, LOC       
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND LOC = 'CHICAGO';
    
    
    -- EX. 부서번호가 10이거나 20번인 사원의 이름 업무 근무지 급여 (급여순 정렬)

SELECT ENAME , JOB, LOC,SAL
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO IN(10,20)
    ORDER BY SAL;
    
    
  
  
  
  
  
  
    --EX. JOB이 SALESMAN 이거나 MANGER인 사원의 이름, 급여, 상여, 연봉 ((SAL+COMM)*12), 부서명 
    -- 근무지를 출력(연봉이 큰순으로 정렬)
    
SELECT ENAME, SAL,COMM,LOC,((SAL+COMM)*12)
    FROM  EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB = 'SALESMAN' OR JOB ='MANGER' ORDER BY SAL DESC;

    -- EX. COMM이 NULL이고 급여가 1200이상인 사원의 이름 급여 입사일 부서번호 부서명 출력
                -- (부서명순, 급여큰순 정렬)
SELECT ENAME,SAL,HIREDATE, D.DEPTNO,DNAME
FROM EMP E, DEPT D                                                                            
WHERE E.DEPTNO = D.DEPTNO AND COMM IS NULL AND SAL >=1200 ORDER BY DNAME, SAL DESC;
                                                                                                                   --부서명순                  급여 큰순   
      
      --EX. 'NEW YORK'에서 근무하는 사원의 이름과 급여 출력
SELECT ENAME,SAL,LOC
FROM EMP E, DEPT D 
WHERE E.DEPTNO=D.DEPTNO AND LOC = 'NEW YORK';

      --EX. 'ACCOUNTING' 부서 소속의 사원이름과 입사일 출력
SELECT ENAME, HIREDATE, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND DNAME = 'ACCOUNTING';
     
      --EX. 직급(JOB)이 MANAGER인 사원의 이름, 부서명 출력
SELECT ENAME,DNAME,JOB
FROM EMP E, DEPT D
WHERE E.DEPT=D.DEPT AND JOB = 'MANAGER';
     
      --EX. COMM이 NULL이 아닌 사원의 이름, 급여, 부서번호, 근무지 출력
SELECT ENAME,SAL,E.DEPTNO,LOC,COMM
FROM EMP E, DEPT D
WHERE  E.DEPTNO=D.DEPTNO AND COMM  IS NULL;
      
      
      
      
      
      
      
 -- ★ 2. NON-EQUI JOIN ( 똑같다 아니고 어디부터 어디까지)
 SELECT * FROM EMP WHERE ENAME ='SCOTT'; -- 사원 정보 
 
 
 
 
 SELECT * FROM SALGRADE; --급여 등급 정보 
 -- CROSS JOIN = EMP 의 행 * SALGRADE 의 5행 
 SELECT * FROM EMP, SALGRADE WHERE ENAME = 'SCOTT';

SELECT * FROM EMP, SALGRADE WHERE ENAME = 'SCOTT' AND  SAL BETWEEN LOSAL AND HISAL;

        -- EX. 모든 사원의 사번, 이름, JOB, 상사사번, 급여, 급여등급(1등급,2등급, 
SELECT * FROM SALGRADE;
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE||'등급' GRADE
     FROM EMP, SALGRADE 
     WHERE SAL BETWEEN LOSAL AND HISAL;
     
--● 	탄탄다지기 연습문제
-- 탄탄1. Comm이 null이 아닌 사원의 이름, 급여, 등급, 부서번호(EMPNO), 부서이름(DNAME), 근무지(LOC)를 출력하시오. EQUI JOIN

SELECT ENAME,SAL,GRADE,D. EMPNO,DNAME, LOC
    FROM EMP E, SALGRADE, DEPT D
    WHERE SAL BETWEEN LOSAL AND HISAL 
        AND E.DEPTNO=D.DEPTNO
        AND NOT COMM IS NULL;

-- 탄탄 2.	이름, 급여, 입사일, 급여등급
SELECT ENMAE , SAL , GRADE
FROM EMP E, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL;


-- 3 이름, 급여, 입사일, 급여등급, 부서명, 근무지
SELECT ENAME, SAL, HIRDATE, GRADE, DNAME, LOC
FROM EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;


--4 	이름, 급여, 등급, 부서코드(E.DEPTNO), 근무지. 단 comm 이 null아닌 경우
SELECT ENAME, SAL, GRADE, E.DEPTNO, LOC,COMM
FROM EMP E, DEPT D, SALGRADE 
WHERE E.DEPTNO = D.DEPTNO AND SAL  BETWEEN LOSAL AND HISAL AND NOT COMM IS NULL;


--5	이름, 급여, 급여등급, 연봉, 부서명, (부서별 출력, 부서가 같으면 연봉순. 연봉=(sal+comm)*12 comm이 null이면 0)
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 , DNAME
FROM EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
ORDER BY DNAME;


--	4이름, 업무, 급여, 등급, 부서코드, 부서명 출력. 급여가 1000~3000사이. 정렬조건 : 부서별, 부서같으면 업무별, 업무같으면 급여 큰순
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
    AND SAL BETWEEN 1000 AND 3000
    ORDER BY DNAME, JOB, SAL DESC;



--	이름, 급여, 등급, 입사일, 근무지. 81년에 입사한 사람. 등급 큰순 
SELECT ENAME, SAL, GRADE, HIREDATE, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
        AND HIREDATE LIKE '%81%'
        ORDER BY GRADE DESC;
    
    
    
    
-----------★ 3. SELF JOIN ------------------
    --        사번         이름       상사사번
SELECT EMPNO , ENAME , MGR     FROM EMP WHERE ENAME='SMITH'; -- SMITH 상사 사번: 7902

SELECT EMPNO, ENAME FROM EMP WHERE EMPNO = 7902;

SELECT * FROM EMP WORKER, EMP MANAGER;

                    -- (    부하 ) ( 상사 ---- 사번     상사 이름 )
SELECT WORKER.EMPNO 사번 , WORKER. ENAME 이름, WORKER.MGR 상사사번, MANAGER.EMPNO 상사번호, MANAGER.ENAME 상사이름
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.ENAME='SMITH' AND WORKER.MGR=MANAGER.EMPNO;
    
    
    -- EX. 모든 사원의 사번, 이름 상사사번, 상사이름 (13행 만나오는데 KING의 MGR이 NULL이라서 KING출력안됨)
SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
     FROM EMP W, EMP M 
     WHERE  W.MGR=M.EMPNO;
  
    -- EX. 'SMITH의 상사는 FORD다' 포맷으로 사원들을 출력
    SELECT W.ENAME || '의 상사는' || M.ENAME || '다'
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;
    
    

-- ★ 4. OUTER JOIN : 조인시 조건에 만족하지 않은 행까지 나타나게 
    
    SELECT W.EMPNO 사번, W.ENAME 이름, W.MGR 상사사번, M.ENAME 상사이름
     FROM EMP W, EMP M 
     WHERE  W.MGR=M.EMPNO;
    
SELECT ENAME, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO(+) = D.DEPTNO; -- E.DEPTNO에는 40번 부서 없음  그래서 조인하면 4 0 안나옴 

SELECT * FROM DEPT;
    
  -- 말단 사원의 이름만 출력   
    SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
     FROM EMP W, EMP M 
     WHERE  W.MGR(+) =M.EMPNO AND W.EMPNO IS NULL;
    
    
    
    -- 탄탄 1. ­ 	SCOTT과 동일한 부서번호(DEPTNO) 에서 근무하는 사원의 이름을 출력하시오
  
    SELECT * FROM EMP 
    WHERE ENAME = 'SCOTT';
    SELECT ENAME FROM EMP WHERE DEPTNO = 20 AND ENAME != 'SCOTT';
    
     -- 1단계
    SELECT E1.ENAME, E1.DEPTNO, E2.ENAME, E2.DEPTNO
    FROM EMP E1, EMP E2
    WHERE E1.ENAME = 'SCOTT' AND E1.DEPTNO=E2.DEPTNO AND E2.ENAME != 'SCOTT';
   
    --2단계
    SELECT E2.ENAME
    FROM EMP E1, EMP E2
    WHERE E1.ENAME = 'SCOTT' AND E1.DEPTNO=E2.DEPTNO AND E2.ENAME != 'SCOTT';
   
    --탄탄 2. 	SCOTT과 동일한 근무지(LOC)에서 근무하는 사원의 이름을 출력하시오(2단계 최종문제)
    SELECT * FROM DEPT;
   
   -- 인위적으로 DALLAS 근무지 부서를 하나 추가
    INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
    SELECT * FROM DEPT;
       
        --인위적으로 50번 부서 사원 추가
    SELECT * FROM EMP ;
    INSERT INTO EMP VALUES (9999, '홍길동' , NULL, NULL, NULL, 9000,900,50);
     SELECT * FROM EMP ;
   
     
       --탄탄 2. 	SCOTT과 동일한 근무지(DALLAS)에서 근무하는 사원의 이름을 출력하시오(2단계 최종문제)
     --1단계      (EMP E1) (DEPT D1)  (EMP E2)     (DEPT D2)
      SELECT E1.ENAME, D1.LOC,    E2.ENAME, D2.LOC , E1.DEPTNO ,D2.DEPTNO
            
     FROM EMP E1, DEPT D1, EMP E2, DEPT D2
               
     WHERE E1.DEPTNO=D1.DEPTNO AND  E2.DEPTNO=D2.DEPTNO AND D1.LOC=D2.LOC
    AND E1.ENAME='SCOTT';

    --2단계 정답
    SELECT E2.ENAME
    FROM EMP E1, DEPT D1, EMP E2, DEPT D2
    WHERE E1.DEPTNO=D1.DEPTNO AND  E2.DEPTNO=D2.DEPTNO AND D1.LOC=D2.LOC
    AND E1.ENAME='SCOTT' AND E2.ENAME != 'SCOTT';

    
    
    
    
    
    
    -- 탄탄 3  상사의 이름이 KING인 사원들의 이름과 JOB 을 출력
SELECT W.ENAME, W.JOB
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO AND M.ENAME='KING';
    
    
    
    -- ----------------------PART1 -------------------------------
--1. 이름, 직속상사

SELECT  W.ENAME 이름, M.ENAME 상사이름
     FROM EMP W, EMP M 
     WHERE  W.MGR=M.EMPNO; --조인조건

--2. 이름, 급여, 업무, 직속상사
SELECT W.ENAME 이름, W.SAL 급여, W.JOB 업무, M.ENAME 상사이름
    FROM EMP W, EMP M 
    WHERE W.MGR = M.EMPNO;

--3. 이름, 급여, 업무, 직속상사. (상사가 없는 직원까지 전체 직원 다 출력.
    --상사가 없을 시 '없음'으로 출력)
SELECT W.ENAME , W.SAL 급여, W.JOB 업무, NVL(M.ENAME,'없음')  MANAGER
     FROM EMP W, EMP M
     WHERE W.MGR = M.EMPNO(+) ;
    

--4. 이름, 급여, 부서명, 직속상사명
SELECT W.ENAME , W.SAL , DNAME , M.ENAME MANAGER
    FROM EMP W,  EMP M, DEPT D
   
    WHERE  W.MGR = M.EMPNO AND 
    W.DEPTNO = D.DEPTNO;

--5. 이름, 급여, 부서코드, 부서명, 근무지, 직속상사명, (상사가 없는 직원까지 전체 직원 다 출력)
SELECT W.ENAME, W.SAL, W.DEPTNO, DNAME, LOC, M.ENAME
FROM EMP W , EMP M, DEPT D 
WHERE W.DEPTNO =  D.DEPTNO AND 
 W.MGR = M.EMPNO;

--6. 이름, 급여, 등급, 부서명, 직속상사명. 급여가 2000이상인 사람
SELECT W.ENAME, W. SAL , GRADE, D.DNAME , M.ENAME
FROM EMP W, EMP M,  DEPT D , SALGRADE
WHERE W.SAL BETWEEN LOSAL AND HISAL 
AND W.DEPTNO = D.DEPTNO
AND W.MGR = M.EMPNO 
AND W.SAL >= 2000;





--7. 이름, 급여, 등급, 부서명, 직속상사명, (직속상사가 없는 직원까지 전체직원 부서명 순 정렬)
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME MANAGER
  FROM EMP W, EMP M, DEPT D, SALGRADE
  WHERE W.MGR=M.EMPNO(+) AND W.DEPTNO=D.DEPTNO 
    AND W.SAL BETWEEN LOSAL AND HISAL
  ORDER BY DNAME;



--8. 이름, 급여, 등급, 부서명, 연봉, 직속상사명. 연봉=(급여+comm)*12 단 comm이 null이면 0
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL+NVL(W.COMM,0))*12 ANNUAL_SAL, M.ENAME MANAGER
  FROM EMP W, EMP M, DEPT D, SALGRADE 
  WHERE W.MGR=M.EMPNO(+) AND W.DEPTNO=D.DEPTNO 
        AND W.SAL BETWEEN LOSAL AND HISAL;





--9. 8번을 부서명 순 부서가 같으면 급여가 큰 순 정렬
   SELECT W.ENAME, W.SAL, GRADE, DNAME, 
        (W.SAL+NVL(W.COMM,0))*12 ANNUAL_SAL, M.ENAME MANAGER
  FROM EMP W, EMP M, DEPT D, SALGRADE 
  WHERE W.MGR=M.EMPNO(+) AND W.DEPTNO=D.DEPTNO 
        AND W.SAL BETWEEN LOSAL AND HISAL
  ORDER BY DNAME, W.SAL DESC;



--  PART2
--1.EMP 테이블에서 모든 사원에 대한 이름,부서번호,부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT ENAME ,E.DEPTNO, DNAME 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--2. EMP 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름,업무,급여,부서명을 출력

SELECT ENAME , JOB, SAL , DNAME

FROM EMP E, DEPT D

WHERE E.DEPTNO=D.DEPTNO AND 
LOC = 'NEW YORK';


--3. EMP 테이블에서 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력
SELECT ENAME , DNAME, LOC , COMM
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND
  COMM IS NOT NULL AND COMM != 0;



--4. EMP 테이블에서 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력
SELECT ENAME , JOB, DNAME , LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND
 ENAME LIKE '%L%';


--5. 사번, 사원명, 부서코드, 부서명을 검색하라. 사원명기준으로 오름차순정열
SELECT EMPNO , ENAME , D. DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO ORDER BY ENAME;

--6. 사번, 사원명, 급여, 부서명을 검색하라. 
    --단 급여가 2000이상인 사원에 대하여 급여를 기준으로 내림차순으로 정열하시오
SELECT EMPNO,ENAME, SAL , DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 2000 
ORDER BY SAL DESC;



--7. 사번, 사원명, 업무, 급여, 부서명을 검색하시오. 단 업무가 MANAGER이며 급여가 2500이상인
-- 사원에 대하여 사번을 기준으로 오름차순으로 정열하시오.
SELECT EMPNO , ENAME , JOB, SAL, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND
JOB = 'MANAGER' AND SAL >= 2500;





--8. 사번, 사원명, 업무, 급여, 등급을 검색하시오. 단, 급여기준 내림차순으로 정렬하시오
SELECT EMPNO, ENAME, JOB, SAL, GRADE
FROM EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO = D.DEPTNO 
AND SAL BETWEEN LOSAL AND HISAL  ORDER BY SAL DESC;




--9. 사원테이블에서 사원명, 사원의 상사를 검색하시오(상사가 없는 직원까지 전체)
SELECT E1. ENAME , E2.ENAME 
FROM EMP E1, EMP E2 
WHERE E1.MGR = E2.EMPNO(+);

--10. 사원명, 상사명, 상사의 상사명을 검색하시오
SELECT E1.ENAME, E2.ENAME, E3.ENAME
FROM EMP E1, EMP E2 , EMP E3
WHERE E1.MGR = E2.EMPNO AND E2.MGR = E3.EMPNO;



--11. 위의 결과에서 상위 상사가 없는 모든 직원의 이름도 출력되도록 수정하시오
SELECT E1.ENAME, E2.ENAME, E3.ENAME
FROM EMP E1, EMP E2 , EMP E3
WHERE E1.MGR = E2.EMPNO(+) AND E2.MGR = E3.EMPNO(+);




