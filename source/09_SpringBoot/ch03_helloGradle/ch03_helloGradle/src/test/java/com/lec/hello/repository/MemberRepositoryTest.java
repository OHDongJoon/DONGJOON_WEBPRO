package com.lec.hello.repository;

import com.lec.hello.domain.Member;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.List;

public class MemberRepositoryTest {
        private MemberRepository memberRepository = new MemberRepository(); // 객체생성
        @AfterEach
        public void afterEach(){//?
                memberRepository.clear();
        }
        @Test
        public void save(){
                Member member = new Member(); // dto 객체생성
                member.setName("홍길동");
                memberRepository.save(member);

                Member member1 = new Member(); // dto 객체생성
                member1.setName("신길동");
                memberRepository.save(member1);
                List<Member> result = memberRepository.list(); // 회원목록
                //System.out.println(result); 이거 잘안씀
                Assertions.assertEquals(result.get(0), member);
                Assertions.assertEquals(result.get(1), member1);

                
        }
        @Test
        public void list(){
                Member member = new Member();
                member.setName("홍길동");
                memberRepository.save(member);
                Member member1 = new Member();
                member1.setName("홍길동");
                memberRepository.save(member1);
                List<Member> result = memberRepository.list();
                Assertions.assertEquals(result.size(), 2);
        }
}

