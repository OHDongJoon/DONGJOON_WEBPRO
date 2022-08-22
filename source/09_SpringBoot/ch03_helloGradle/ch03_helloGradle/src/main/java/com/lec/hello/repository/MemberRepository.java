package com.lec.hello.repository;

import com.lec.hello.domain.Member;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

//@Repository
public class MemberRepository {
    private static List<Member> store = new ArrayList<Member>();
    private static int cnt = 0;    //회원수
    public void save(Member member){
        member.setNo(++cnt); // 맨첨에 cnt 가 0이였다가  ++ 만나 회원가입시 1씩 증가
        store.add(member);   // 그값을 store에 add 함
    }
    public List<Member> list(){ // 회원 리스트
        return store;
    }
    public void clear(){
        store.clear(); // ArrayList 다 지우기
    }
}