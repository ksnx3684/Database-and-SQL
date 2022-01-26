----- DDL -----

------------------------------ JOIN ------------------------------
-- INNER JOIN, NATURAL JOIN, OUTER JOIN

SELECT * FROM USER_CONSTRAINTS; -- 제약 조건 조회

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMPLOYEES';

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DEPARTMENTS';

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 200; -- 결과물이 1개 아니면 0
SELECT * FROM EMPLOYEES WHERE SALARY = 10000; -- 결과물이 N개 아니면 0

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 200;
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 10;

-- 사원번호가 200인 사원의 이름, 월급, 부서명을 조회
SELECT E.FIRST_NAME, E.SALARY, D.DEPARTMENT_NAME    ----- 3 -- 중복 컬럼을 방지하기 위해 별칭. 을 붙여준다
FROM EMPLOYEES E                                    ----- 1
    INNER JOIN
    DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID)
WHERE E.EMPLOYEE_ID = 200;                          ----- 2
    
-- 20번부서에 근무하는 사원들의 사원번호, 입사일, 월급, 부서명 출력
SELECT E.EMPLOYEE_ID, E.HIRE_DATE, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E
    INNER JOIN
    DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID)
WHERE E.DEPARTMENT_ID = 20;


-- 급여 8200, 16000에 속하는 사원의 ID와 JOB_TITLE
SELECT E.EMPLOYEE_ID, J.JOB_TITLE
FROM EMPLOYEES E
    JOIN
    JOBS J
    ON E.SALARY BETWEEN 8200 AND 16000;
    
SELECT E.*, D.*
FROM EMPLOYEES E
    INNER JOIN
    DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID); -- 컬럼 내의 공통 데이터끼리 연결
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES;
SELECT * FROM EMPLOYEES;

-- 사원번호가 192번인 사원의 이름, 성, 부서명, 도시명 출력
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E
    INNER JOIN
    DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID)
        INNER JOIN
        LOCATIONS L
        ON(D.LOCATION_ID = L.LOCATION_ID)
WHERE E.EMPLOYEE_ID = 192;
    

SELECT C.COUNTRY_NAME, R.REGION_NAME -- 기존의 INNER JOIN
FROM COUNTRIES C
    INNER JOIN
    REGIONS R
    ON(C.REGION_ID = R.REGION_ID);
    
SELECT C.COUNTRY_NAME, R.REGION_NAME, REGION_ID -- 공통 컬럼명이 있을 경우 NATURAL JOIN
FROM COUNTRIES C                                -- 공통 컬럼명인 REGION_ID같은 경우에는 테이블명.컬럼명을 사용하면 안된다.
    NATURAL JOIN                                -- 단독으로 REGION_ID로 사용해야 정상 출력된다.
    REGIONS R;

-- 사원번호가 192인 사원의 이름, 월급, 매니저의 이름, 매니저의 월급 출력
SELECT FIRST_NAME, SALARY,
    (SELECT FIRST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID = (SELECT MANAGER_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 192)) AS MANAGER_NAME,
    (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = (SELECT MANAGER_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 192)) AS MANAGER_SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 192;

SELECT E.FIRST_NAME, E.SALARY, AE.FIRST_NAME AS "MANAGER NAME", AE.SALARY AS "MANAGER SALARY" -- SELF JOIN을 이용한 방법
FROM EMPLOYEES E
    LEFT OUTER JOIN
    EMPLOYEES AE -- SELF JOIN
    ON (E.MANAGER_ID = AE.EMPLOYEE_ID)
WHERE E.EMPLOYEE_ID = 100;


-- 부서별 부서정보와 사원들의 정보를 모두 출력
SELECT E.*, D.*
FROM EMPLOYEES E
    FULL OUTER JOIN
    DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);


-- 200번부서에 근무하는 사원들의 사원번호, 입사일, 월급, 부서명 출력
SELECT E.EMPLOYEE_ID, E.HIRE_DATE, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E
    INNER JOIN
    DEPARTMENTS D
    --ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID)
    USING(DEPARTMENT_ID) -- 공통 컬럼명이 DEPARTMENT_ID로 같으므로 USING 사용 가능
WHERE E.EMPLOYEE_ID = 200;

-- Oxford에 근무하는 사원의 이름과 성, 업무, 부서이름, 도시이름을 출력
SELECT E.FIRST_NAME, E.LAST_NAME, E.JOB_ID, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E
    INNER JOIN
    DEPARTMENTS D
    USING(DEPARTMENT_ID)
        INNER JOIN
        LOCATIONS L
        USING(LOCATION_ID)
WHERE L.CITY = 'Oxford';


SELECT D.*, E.*
FROM DEPARTMENTS D
    INNER JOIN
    EMPLOYEES E
    ON (D.DEPARTMENT_ID = E.DEPARTMENT_ID);
SELECT *
FROM DEPARTMENTS D
    INNER JOIN
    EMPLOYEES E
    USING(DEPARTMENT_ID);
    
DESC EMPLOYEES;

-- 사원번호 198번 사원의 정보와 부서정보
SELECT E.*, D.*
FROM EMPLOYEES E
    INNER JOIN
    DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID = 198;

desc employees;




