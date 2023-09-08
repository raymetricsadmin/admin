package com.raymetrics.admin.web.repository;

import com.raymetrics.admin.web.entity.Inquiry;
import com.raymetrics.admin.web.entity.InquiryReply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
//public interface InquiryRepository extends GenericRepository<Inquiry>
public interface InquiryReplyRepository extends JpaRepository<InquiryReply, Integer> {
}
