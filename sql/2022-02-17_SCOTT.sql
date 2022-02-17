declare
v_empno emp.empno%type;
v_ename emp.ename%type;
v_sal emp.sal%type;
v_detpno emp.deptno%type;
grade varchar2(10);
v_dname varchar2(20);
begin
    select empno, ename, sal, deptno into v_empno, v_ename, v_sal, v_deptno
    from emp;
    
    --sal���� 1000�̸��̸� grade�� '����' 15000~20000�̸� '����', 20000�̻��� '����'
    if v_sal < 1000 then
        grade := '����';
    elsif v_sal <=2000 then
        grade :='����';
    else
        grade :='����';
    end if;
    
    case v_deptno
    when 10 then
        v_dname := 'ACCOUNTING';
    when 20 then
        v_dname := 'RESEARCH';
    when 30 then
        v_dname := 'SALES';
    when 40 then
        v_dname := 'OPERATIONS';
    end case;
    
    DBMS_OUTPUT.PUT_LINE('empno : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('empname : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('sal : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('grade : ' || grade);
    DBMS_OUTPUT.PUT_LINE('dname : ' || v_dname);
end;
    