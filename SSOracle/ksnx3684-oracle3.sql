SELECT * FROM DEPARTMENTS;

SELECT * -- 조회하고 싶은 컬럼명들
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 60;-- 조건식

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 60 OR DEPARTMENT_ID = 90;

-- Employees 사원번호, 이름, 성, 월급, 월급이 10000 이상인 사람만 출력

SELECT * FROM EMPLOYEES;
DESC EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY >= 10000;

-- Employees 사원번호, 이름, 성, 월급, 월급이 10000 이상이고, 부서번호가 110
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY >= 10000 AND DEPARTMENT_ID = 110;

-- 사원의 모든 정보 LAST NAME이 KING
SELECT * FROM EMPLOYEES WHERE LAST_NAME = 'King'; -- 문자열은 작은따옴표로 감싸서 처리해야 하며 대소문자를 구분한다.

-- 사원의 모든 정보 중 입사일이 2002/06/07
SELECT * FROM EMPLOYEES WHERE HIRE_DATE = '2002/06/07'; -- '-'나 '/' 어떤것을 사용해도 상관없다. 시 분 초는 ':'으로 구분

-- 사원의 모든 정보 중 커미션이 null이 아닌 사원들
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL; -- IS NULL을 사용하여 NULL값이 아닌 값 찾기
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT != 0; -- 또는 COMMISION_PCT는 데이터 타입이 NUMBER 이므로 NULL값을 찾을때에는 0으로 찾는다.

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 10;

SELECT SALARY * 12 FROM EMPLOYEES;

SELECT nvl(commission_pct, 0) AS PCT FROM EMPLOYEES;

-- 사원테이블에서 급여가 8000이상 10000이하의 사원의 정보를 출력
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 8000 AND 10000;

-- 사원테이블에서 2002년부터 2003년 12월 31일 사이에 입사한 사원들의 정보 출력
SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '02/01/01' AND '03/12/31';

-- 부서테이블에 부서번호가 10번이거나 30번 정보 출력
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID IN (10, 30);

SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%nal%';

-- FIRST_NAME : Sh로 시작하거나
-- LAST_NAME : K로 시작하는 모든 것 출력
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'Sh%' OR LAST_NAME LIKE 'K%';

-- 부서번호가 20번인 사원들을 월급 순 정렬
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 20 ORDER BY SALARY;


-- 1 --
-- 사원정보(Employees) 테이블에서 사원번호, 이름, 급여, 업무, 입사일, 상사의 사원번호를 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID, HIRE_DATE, MANAGER_ID FROM EMPLOYEES;

-- 2 --
-- 사원정보(Employees) 테이블에서 사원의 이름, 성, 급여와  연봉에 $100 보너스를 추가하여 계산한 값은 Increased Ann_Salary,
-- 급여에 $100 보너스를 추가하여 계산한 연봉은 Increased Salary라는 별칭을 붙여 출력
SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY*12+100 AS "Increased Ann_Salary", (SALARY+100)*12 AS "Increased Salary" FROM EMPLOYEES;

-- 3 --
-- 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다.
-- 사원정보(Employees) 테이블에서 급여가 $7000 ~ $10000 범위 이외인 사람의 이름과 성 및 급여를 급여가 적은 순서로 출력
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY NOT BETWEEN 7000 AND 10000 ORDER BY SALARY;

-- 4 --
-- 사원의 성(last_name) 중에 'e', 'o' 글자가 포함된 사원을 출력
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE '%e%' AND LAST_NAME LIKE '%o%';

-- 5 --
-- 급여(salary)와 수당율(commission_pct)에 대한 지출 보고서를 작성하려고 한다.
-- 수당을 받는(null이 아닌) 모든 사원의 이름과 성, 급여, 업무, 수당율을 출력하시오.
-- 이때 급여가 큰 순서대로 정렬하되, 급여가 같으면 수당율이 큰 순서대로 정렬
SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID, COMMISSION_PCT FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL ORDER BY SALARY DESC, COMMISSION_PCT DESC;



