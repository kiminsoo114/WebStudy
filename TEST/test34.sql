-- 2022-01-12 ����Ŭ(4��) => ��� SQL  ==> 209������ 
/*
       �����Լ� 
       �������� ��� (��Į�� �������� , �ζ��κ�)
       �� 
       ������
            => ���̺� ���� / �ʿ��� ������ ���� (����)  
       => �ε��� / => PL/SQL
       => JDBC(�ڹ� ����Ŭ ����)
            ---------------------------
*/
/*
     ���� �Լ� : ����Ŭ �����ϴ� �Լ� (PL/SQL => ����� ���� �Լ� ����)
     ROW������ ó��  ==> ������ �Լ� 
     COLUMN���� ó�� ==> ������ �Լ�(�����Լ� , �����Լ�)
     ������ �Լ� 
       = ���ڰ��� �Լ� (�ڹ�: String)
          ���� , ���� 
          = ���� 
                      �˻� (����Ŭ => SQL������ ��ҹ��ڸ� �������� �ʴ´�)
                      ==> ����� �����ʹ� ��ҹ��ڸ� �����Ѵ� 
                      ==> ����ڰ� �˻�� ���� �ٶ� (��ҹ��� ���о��� ������ ����)
             ------------------------------------------------------
             1) UPPER : �빮�� ��ȯ (�ڹ�: toUpperCase())
                   UPPER('abc'|�÷���) ==> ABC
             2) LOWER : �ҹ��� ��ȯ (�ڹ�:toLowerCase())
                   LOWER('ABC'|�÷���) ==> abc
             ------------------------------------------------------
             3) INITCAT ====> �ڹٿ��� �������� �ʴ´� 
                   INITCAP('abc'|�÷���) ==> Abc
             4) LTRIM : ���ʿ� �ִ� ���ڸ� ���� 
                   LTRIM('AABCD','A') => ���ʿ� �ִ� ��� A�� ���� => BCD
                   LTRIM(' AABCD') => ���ʿ� �ִ� ������ ���� 
                   *** �ڹٿ��� ����ϴ� trim() => �¿��� ������ ���� 
             5) RTRIM : �����ʿ� �ִ� ���ڸ� ���� 
                   RTRIM('AABBAA'|�÷���, 'A') => AABB
                   RTRIM('AABBAA ')  => �����ʿ� �ִ� ������ ���� 
             6) LPAD : ������ ������ �����ϰ� ���ڸ� ����� ��쿡
                            ������ ���ڶ�� ������ ���ڸ� ä���ش� (����)
                 LPAD('ABC',10,'#') ==> #######ABC => 10���ڸ� ����� �ش� 
                    => ���̵�ã�� , ��й�ȣ .. �̸����ּ� ... (����)
             ***7) RPAD : �����ʿ� ä��� (�ڹٿ� �������� �ʴ´�)
                 RPAD('ABC',7,'*') => ABC****
                 RPAD('ABCDEFG',5,'*') => ABCDE
                 RPAD('ABCDE',5,'^') => ABCDE
             ***8) REPLACE : ���ϴ� ���ڳ� ���ڿ��� �����Ҷ� ��� 
                 REPLACE('Hello Oracle!!','l','k') => Hekko Oracke!!
                 REPLACE('Hello Oracle!!','ra','oo') => Hello Ooocle!!
                 => ������ ���� ( & , || ) => ���ڸ� ���� 
                                        === �Է¿�û , || ���ڿ� ���� 
                                         & , || ==> �̹��� 
           -- https://mp-seoul-image-production-s3.mangoplate.com/254511/1679022_1640799901695_14797?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80
          = ���� 
             ***1) SUBSTR : ���ڿ��� �߶󳻱� �Ҷ� => ���ڼ��� ���̴� ���
                    SUBSTR('���ڿ�'|�÷���,������ġ,�ڸ� ����)
                    SUBSTR('Hello Oracle' , 3 , 2) ==> ll
                    H e l l o  O r a c l e
                    1 2 3456 7 8 9 10 11 12
                         ---
                    *** ����Ŭ�� ������ġ => 1
                         �ڹٴ� ������ġ => 0
             ***2) INSTR : ������ ��ġ�� ã�� ��� ��� (indexOf,lastIndexOf)
                     INSTR('ABCDECG','C',1,1) ==> 3
                     INSTR('ABCDECG','C',1,2) ==> 6
             ***3) LENGTH : ������ ���� 
                     LENGTH('ABC')  ==> 3
                     LENGTH('ȫ�浿') => 3

              *** �ϱ� (RPAD , REPLACE , SUBSTR , INSTR , LENGTH)
                           ----------------------------------------------------- �� ����Ʈ ���� 
       = ���ڰ��� �Լ� (�ڹ�: Math)
            ***1) ROUND() : �ݿø� �Լ� => ��� 
                    => ROUND(AGV(sal),2)  => ������ , ��� ...
                    => ROUND(AGV(sal)) 
            2) TRUNC() : ���� �Լ�
            ***3) CEIL() : �ø� �Լ� => �������� (����Ʈ�� �������� ������ ���) 
       = ��¥���� �Լ� (�ڹ�: Date)
            ***1) SYSDATE : �ý����� �ð� , ��¥ ( ������ ) =>��¥��+�ð� => �Ҽ���
                => ����� ���� (�Խ��� �����, ȸ������...)
            2) MONTHS_BETWEEN : ���� ~ ������ �� �������� ������ �ö� 
                                               �Ի���~���� (ERP:�������α׷�)
                => ����� (����û..����) , ������ (����,����,�ſ�,����)
       = ��ȯ �Լ� (�ڹ�: SimpleDateFormat,MessageFormat...)
          *** TO_CHAR : ��¥�� ���ڸ� ���ڿ��� ��ȯ 
               ����ó�� => �ڵ����� ��ȯ  '1'+'2'=> 1+2=3
                                 SYSDATE+1 ==> 22/01/13
               => ��¥ ��ȯ , ���� ��ȯ 
                    ======   =======  L999,999
                     YYYY/RRRR
                     MM / DD / HH24(HH12) / MI / SS ==���/�������� (�ڹٿ��� �ð�ó���� ���Ѵ�)
       = ��Ÿ 
         *** NVL : NULL���� �ٸ� ���� ��ü�ϴ� �Լ� 
              NVL(comm,1) => comm�� NULL���̸� 1�� ���� 
                    -------- -- �ݵ�� ��ġ 
              NVL(bunji, '') => NULL  ==> ''(NULL)
              NVL(bunji,' ') => ����    ==> ' '
              ****** NULL�� �ִ� ��� => �������� ��� (null)

      = ������ �Լ� (�����Լ�)
         *** �����Լ��� �Ϲ� �÷��̳� �������Լ��� ���� ����� �� ���� 
                              ----------------------------
              (�� ����� �Ϸ��� => �ݵ�� GROUP BY ó��)
         1) SUM => ��ü column�� ���� ���Ѵ� 
             SUM(�÷���)  ==> SUM(sal)
         2) AVG  => ��ü column�� ���� ����� ���Ѵ� 
             AVG(�÷���)  ==> AVG(sal)
         3) �ִ밪 , �ּҰ� 
             ***MAX(sal) , MIN(sal)
                ------------ �ڵ� ������ȣ 
         4) ROW�� ���� ���ϱ� 
             COUNT
              ***= COUNT(*) ==> NULL�� ���� 
                     �˻����,�α��� ,���̵��ߺ�,������
              = COUNT(�÷���) ==> NULL�� ������ 
         5) RANK : ������ ���� 
                ==> ORDER BY�� �̿� => ASC/DESC
             RANK() => ���� ������ �ִ� ��쿡 �ǳʶڴ� 
                              1
                              2
                              2
                              4
             DENSE_RANK() => ���� ������ �ִ� ��쿡 �ǳʶ��� �ʴ´� 
                              1
                              2
                              2
                              3
            ���� 
              RANK OVER(ORDER BY sal DESC) 
              RANK OVER(ORDER BY sal ASC)
              DENSE_RANK OVER(ORDER BY sal DESC) 
              DENSE_RANK OVER(ORDER BY sal ASC)
              => ������ , ���� �Ǹż� , ��Ʈ�� 
      
*/
/*
DROP TABLE member2;

CREATE TABLE Member2(
      no NUMBER,
      name VARCHAR2(34) CONSTRAINT mem_name_nn NOT NULL,
      sex VARCHAR2(6),
      CONSTRAINT mem_no_pk PRIMARY KEY(no),
      CONSTRAINT mem_sex_ck CHECK(sex IN('����','����'))
);
-- Member2�� �����͸� �߰� 
INSERT INTO Member2 VALUES(1,'ȫ�浿','����');
INSERT INTO Member2 VALUES(2,'��û��','����');
INSERT INTO Member2 VALUES((SELECT MAX(no)+1 FROM member2),'������','����');
INSERT INTO Member2 VALUES((SELECT MAX(no)+1 FROM member2),'�̼���','����');
INSERT INTO Member2 VALUES((SELECT MAX(no)+1 FROM member2),'�ڼ���','����');
COMMIT;
*/
-- SELECT COUNT(*) FROM member2;
SELECT COUNT(*) FROM member2
WHERE name='������';

SELECT COUNT(*) FROM member2
WHERE name='ȫ�浿';


SELECT COUNT(*) FROM member2
WHERE name LIKE '%��%';

SELECT COUNT(*) FROM member2
WHERE name LIKE '%��%';










