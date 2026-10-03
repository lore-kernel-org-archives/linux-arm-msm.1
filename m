Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6E51E1024
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 02:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790995169; cv=none; b=ayLOBwnDk6p0B2ucjUsZxBwn4Hln7hOL8Nqqso/DaryWZCVdNUz1k3PmC9G++BuHwS4+Gl4INoeBub2cwj/LW2CSbDGg2ymNp45rZDopDuwYGnuKRs0K3RJDmlu8WPW7Xb4zvkoGlSjhj6hpUnCLwST7mf8LttwmlQ7qnFTG/+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790995169; c=relaxed/simple;
	bh=7dW1e9qn6ID6Nqs45YgbKFMF6FDKoBw28UxyJmqUlxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPNeoi7iEKVJnkY4We0JxJrDe+68q8sZ4SSt8V98JQmt9K+H59dr6BTqzjiHDldwcdMb+bmEkSl/hnjBrPz8rdDNPzsK+bUDwazI4zNBGBhkZmz+2nQplgdRPmdn3OvdYThKw2xOtQqTstgwQ51XByNUyuEbbiGWax1H/FJlj04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6ZCGp3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyyHG+QX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6ZCGp3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyyHG+QX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6932CDxU3494826
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 02:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M2LXMbXDrS/
	cvpdl+x70zPZ5Av0Isjk+0DwgcfKVkvA=; b=i6ZCGp3tFTP7Belfc0Tm9BMy+xd
	FtSBNbeTUK65YISqM1+Yg8uSWl1tiqPYhztCkPkF8xDIKbA96Rz9rdnYTmbmm10b
	8dv54AqhHix5AhIDdF2AYfnYlBxjIcziX/Hd3nMZzJgHCNwSpkllUA3+JTrKFU4f
	NS0CR8iLkHQf+S3kF5l6BuWf5o1tn3wyL7mZTWFxaVWW+h9c+h+CatdOFQK0RgEx
	ky5g+LhtQYmWUDH0FU5NRSripaNdby8C7Cj37Neuqbn4uJBSzTqKFKjNk4wCZosh
	AfZeg/dOnW84S0yjehaTbodfMJ9hfqLb+Aj4M2llAmNSgoO8lTpYcS6NoqA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2rq581ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 02:39:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so536602eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 19:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790995165; x=1791599965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2LXMbXDrS/cvpdl+x70zPZ5Av0Isjk+0DwgcfKVkvA=;
        b=CyyHG+QXzd7wbYeA8U3NQ4vmG/xM9KQdqb7PjYSFSs+gN1ZTsEqQBfEOQkYhkgT7/+
         QImd3WWO1s5Ip5ivx41aUjuEsm5AdFwg8kbFy68L3vnkshNPhyf0cV4GU4gW5KBx9q6o
         96dhDq7yoA2/cu1lTn0N8iG1s/956hNEVStqe7jzm2CVe5g34vC7BM5+lPjDillWWE20
         C7DOI58jMLC9hoRunY7xRCPOzZl4bWS7p7DPWsS3TJSLfTIrdJrgjfuGGZEIVWUQE27c
         iQ4TMD18iaDhDHELh0KUZNOJVM1r5MnoyByqX+Wro2Sjm/JxOpaoTvdyzs6wnukiVnD6
         PWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790995165; x=1791599965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M2LXMbXDrS/cvpdl+x70zPZ5Av0Isjk+0DwgcfKVkvA=;
        b=ZITLId/mZayjWhv/c8tr3fdC6AOCEdOgpPCzwP9S2AcA7rw8dz9m10cu67T34sRGjZ
         ZI4vja7gpEj1sOr+Bte+wK0hFGioI39Q8UsIPcCihcwDOVk17IO+ggd3T7obNUvj3Y07
         H/SSjG4xrp3G5bYGEgqW6kXsMmI0eUYVjlBFg36QVnfWDHtDBiMck0kGdpX9p2Zh6RRh
         PBj2w7+kRXwT0MMBKSx4d9HgZjYfel7GzNFZUDFEESho2wnZIohxZFYzsJWo4Q60jyhZ
         gk5w01hzEiHEvJF20M+TQazqiJc6NGEprzB6ZWzXRWBGQR4tdbgplolvtUBF/uN9hqJT
         bSug==
X-Forwarded-Encrypted: i=1; AKwUvBx0VuSTFrfn+rSJQyqI/FpfStOMnsAo+elnRWjUehjErk36DI5hiNyRGjTiq9W38+ggsV+OzffY9FfXa8SH@vger.kernel.org
X-Gm-Message-State: AFuF++nQ1Fss3xnh5w3cAJGAMcX/QGfnsibLMBeqO3pyBzcHTUQIsFab
	zZgO+uEEqfRK9Qpgi1+RJ5CEV7kHHTJ8c1OvFR6qW6f6xWddIy/mfVhpWa5CWuNZ3IHv4Rq7m3/
	fgKvw7D49JcWCWiFq5Jj7koz189emcJb3nJZMzcCCNBQdk3tKqEn0oYX21wvEtfFQ6DDR
X-Gm-Gg: AYBFou3pT7EqmTudcjBw6rKezZuLW6XNeaJevUd6q3BhUr2oN+viWD87rMF2CeWgdtg
	Nx32xyMIK4FxR7Zq1WgmLt/FPQE1qhFzyI9mHjCPVspe2mz/a5HY1lwnk5RznJm1Pk0J61hIKB8
	Y9rbL0wJg6e5wUlpFJLmKO0O3jHmy9Qt6AeS/IHcvrZPpKYC5KKlr+FXXlv5XT4wlQFTfNrJ3rd
	tZd7IS9pQuppycyrTd0fg6zZOrpBVHkjVPnpT9SUy7h9aqUKBT9ZClbV03cx6evLUjIVyAfoKL9
	6E2cZCDObGsQlbDArgHI0+NclUWriVEmqG/bJXAFB1KwmY3n6RWJDhGmTG3ceXc8L5opBEkDGo7
	mYLuEE3eH1xDTNeJHd4mw16YMovDMNTwypNenrwM2Cvge1gGaqCWiOouZ
X-Received: by 2002:a05:7022:7e0c:b0:144:f089:b189 with SMTP id a92af1059eb24-14f5cfbcb83mr4677709c88.36.1790995165109;
        Fri, 02 Oct 2026 19:39:25 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0c:b0:144:f089:b189 with SMTP id a92af1059eb24-14f5cfbcb83mr4677682c88.36.1790995164523;
        Fri, 02 Oct 2026 19:39:24 -0700 (PDT)
Received: from carlv-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm7665736eec.6.2026.10.02.19.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 19:39:24 -0700 (PDT)
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sashiko <sashiko-bot@kernel.org>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: [PATCH 5/6] accel/qaic: Split oversized BO requests into multiple jobs
Date: Fri,  2 Oct 2026 19:38:17 -0700
Message-ID: <20261003023818.1161666-6-carl.vanderlip@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003023818.1161666-1-carl.vanderlip@oss.qualcomm.com>
References: <20261003023818.1161666-1-carl.vanderlip@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uP6_r7AWUEuxNO8C-tt0zBCjx2-42Szf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAxMCBTYWx0ZWRfX1GHB6n903Kwj
 WM3GDC4n5AuTyXMsOZNJrJkLeenlXathE6EbrH9hqSNkC9+vNQM9RCcY8h6702EOiua6JVr0BLX
 rhrPLsPLSeABSsv8qStbzyTLOb2siTk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAxMCBTYWx0ZWRfX2PKS0aRbyj8F
 tn4DcvL42OpGsjPRyaP3xBe5D4saXGRO4O+wAtrwez1JanUnPhUm9zal9IyzgKM73iwfBSRRbpq
 ZUSUC47Kh/v4zoNbwjJOXfqt9giU26jqzDHTJf4IQ4FkPXTA9Zu00l3+QqD3eZvbM7D/Uw+A2UZ
 0GzLCH2Q85tvvc5U7+229/Z+1ENM47g9V+F2sL+aTsidbcthv/21qT/KKqxg1SZpmBATeE9MbvD
 CW65rIVNEi8I/Qbn46FQAOv6c/yEF0RhJX3929lfpXDWjXM2qwV5+24MmUXFZBs60SVANED0lVX
 18nxnqvtI4V31hgfu0G/F31vRRgi8gHkj7f7LHI948ArAeo3YH2y7bvPR30/lZZYxa0Rm7Rf6fV
 M7Qq3ryUC7pJqFJyWLlAb9/t5wZ5IL1Ik0bddGApTtfM7xzueKJgiQEVs+2VSN2YYFy29KFWukV
 n1odArwi2sUyDYKdvwg==
X-Authority-Analysis: v=2.4 cv=QY/zLcbv c=1 sm=1 tr=0 ts=6ac06ade cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=0sLLXIQUKGWDk0rsDugA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uP6_r7AWUEuxNO8C-tt0zBCjx2-42Szf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030010

When a BO's requests would exceed FIFO size and credit balance, divide
the requests into groups to be handled by multiple jobs. This addresses
limitations where large or fragmented buffers could not be submitted due
to FIFO capacity.

Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic.h       |  9 ++++---
 drivers/accel/qaic/qaic_data.c  | 45 +++++++++++++++++++++------------
 drivers/accel/qaic/qaic_sched.c | 25 ++++++++++++++----
 3 files changed, 55 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 40c7492ea121..53c71584edf9 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -88,6 +88,8 @@ struct qaic_job {
 	/* Node of list of jobs associated with a DBC */
 	struct list_head	queue;
 	struct kref		ref_count;
+	/* Offset of requests this job needs to skip within the slice */
+	unsigned int		req_offset;
 	/* Number of requests this job executes */
 	unsigned int		num_req;
 	/* True if this job is partially executed */
@@ -461,8 +463,8 @@ void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
 void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
 void release_dbc(struct qaic_device *qdev, u32 dbc_id);
 void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail);
-int qaic_submit_reqs_to_hw(struct bo_slice *slice, unsigned int num_req,
-			   bool is_partial, u32 partial_size, u16 job_id);
+int qaic_submit_reqs_to_hw(struct bo_slice *slice, struct dbc_req *reqs,
+			   unsigned int num_req, bool is_partial, u32 partial_size, u16 job_id);
 
 void wake_all_cntl(struct qaic_device *qdev);
 void qaic_dev_reset_clean_local_state(struct qaic_device *qdev);
@@ -491,7 +493,8 @@ void qaic_remove_bo_fence(struct qaic_bo *bo);
 int qaicm_sched_init(struct drm_device *drm, struct dma_bridge_chan *dbc);
 void qaic_sched_entity_init(struct dma_bridge_chan *dbc);
 struct qaic_job *qaic_create_job(struct drm_file *file_priv, struct bo_slice *slice,
-				 unsigned int num_req, u64 seq_no, struct list_head *tmp_list);
+				 unsigned int req_offset, unsigned int num_full_reqs, u64 seq_no,
+				 struct list_head *tmp_list);
 void qaic_submit_job(struct dma_bridge_chan *dbc, struct qaic_job *job);
 void qaic_free_job(struct kref *ref);
 void qaic_put_job(struct qaic_job *job);
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 63ca4a489a9a..7287370e4fab 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -948,11 +948,6 @@ static int qaic_attach_slicing_bo(struct qaic_device *qdev, struct qaic_bo *bo,
 		}
 	}
 
-	if (bo->total_slice_nents > bo->dbc->nelem) {
-		qaic_free_slices_bo(bo);
-		return -ENOSPC;
-	}
-
 	return 0;
 }
 
@@ -1108,11 +1103,11 @@ static void submit_reqs_to_fifo(struct dma_bridge_chan *dbc, struct dbc_req *req
 }
 
 /* Caller should be holding dbc->req_lock */
-int qaic_submit_reqs_to_hw(struct bo_slice *slice, unsigned int num_req,
-			   bool is_partial, u32 partial_size, u16 job_id)
+int qaic_submit_reqs_to_hw(struct bo_slice *slice, struct dbc_req *reqs,
+			   unsigned int num_req, bool is_partial,
+			   u32 partial_size, u16 job_id)
 {
 	struct dma_bridge_chan *dbc = slice->bo->dbc;
-	struct dbc_req *reqs = slice->reqs;
 	struct qaic_bo *bo = slice->bo;
 	struct dbc_req *last_req;
 	u32 head, tail, avail;
@@ -1129,12 +1124,12 @@ int qaic_submit_reqs_to_hw(struct bo_slice *slice, unsigned int num_req,
 
 	submit_reqs_to_fifo(dbc, reqs, num_req, head, tail);
 
+	last_req = fifo_at(dbc->req_q_base, (tail + num_req - 1) % dbc->nelem);
 	if (is_partial) {
 		/*
 		 * Copy over the last entry. Here we need to adjust len to the left over
 		 * size, and set src and dst to the entry it is copied to.
 		 */
-		last_req = fifo_at(dbc->req_q_base, (tail + num_req - 1) % dbc->nelem);
 		memcpy(last_req, &slice->reqs[slice->nents - 1], sizeof(*last_req));
 		last_req->len = cpu_to_le32(partial_size);
 		last_req->src_addr = reqs[num_req - 1].src_addr;
@@ -1144,6 +1139,8 @@ int qaic_submit_reqs_to_hw(struct bo_slice *slice, unsigned int num_req,
 		if (!last_req->len)
 			last_req->cmd &= ~GENMASK(1, 0);
 	}
+	/* When a BO has been split into multiple jobs, each job needs to signal its completion */
+	last_req->cmd |= GEN_COMPLETION;
 
 	tail = (tail + num_req) % dbc->nelem;
 
@@ -1169,11 +1166,11 @@ static inline void qaic_dbc_put_job(struct dma_bridge_chan *dbc, struct qaic_job
 static int create_slice_jobs(struct drm_file *file_priv, struct bo_slice *slice, bool partial,
 			     u64 resize, struct list_head *tmp_list)
 {
+	unsigned int nents_offset, nents_xfer;
 	struct dbc_req *reqs = slice->reqs;
-	struct qaic_job *job = NULL;
+	struct qaic_job *job, *job_i;
 	unsigned int job_count = 0;
-	unsigned int nents_xfer;
-	u64 last_bytes;
+	u64 last_bytes, seq_no;
 	u32 first_n;
 
 	/*
@@ -1194,16 +1191,32 @@ static int create_slice_jobs(struct drm_file *file_priv, struct bo_slice *slice,
 	else
 		nents_xfer = slice->nents;
 
-	job = qaic_create_job(file_priv, slice, nents_xfer, 0, tmp_list);
-	if (IS_ERR(job))
-		return PTR_ERR(job);
-	job_count++;
+	nents_offset = 0;
+	seq_no = 0;
+	job = NULL;
+	while (nents_xfer > nents_offset) {
+		job = qaic_create_job(file_priv, slice, nents_offset, nents_xfer,
+				      seq_no++, tmp_list);
+		if (IS_ERR(job))
+			goto free_jobs;
+
+		job_count++;
+		nents_offset += job->num_req;
+	}
 
 	/* job points to the last job for this slice, only valid for partial execute ioctl */
 	job->partial_size = last_bytes;
 	job->partial = partial;
 
 	return job_count;
+
+free_jobs:
+	list_for_each_entry_safe_reverse(job, job_i, tmp_list, queue)
+		if (job_count--)
+			qaic_cleanup_job(job);
+		else
+			break;
+	return job_count;
 }
 
 static int send_bo_list_to_sched(struct qaic_device *qdev, struct drm_file *file_priv,
diff --git a/drivers/accel/qaic/qaic_sched.c b/drivers/accel/qaic/qaic_sched.c
index b0992d63c2b6..ded0bdccdfdb 100644
--- a/drivers/accel/qaic/qaic_sched.c
+++ b/drivers/accel/qaic/qaic_sched.c
@@ -41,8 +41,8 @@ static struct dma_fence *qaic_job_run(struct drm_sched_job *sched_job)
 	if (ret)
 		goto exit;
 
-	ret = qaic_submit_reqs_to_hw(slice, job->num_req, job->partial,
-				     job->partial_size, job->id);
+	ret = qaic_submit_reqs_to_hw(slice, &slice->reqs[job->req_offset], job->num_req,
+				     job->partial, job->partial_size, job->id);
 	if (ret)
 		goto unlock_dbc;
 	mutex_unlock(&dbc->req_lock);
@@ -146,15 +146,19 @@ void qaic_sched_entity_init(struct dma_bridge_chan *dbc)
 }
 
 struct qaic_job *qaic_create_job(struct drm_file *file_priv, struct bo_slice *slice,
-				 unsigned int num_req, u64 seq_no, struct list_head *tmp_list)
+				 unsigned int req_offset, unsigned int num_full_reqs, u64 seq_no,
+				 struct list_head *tmp_list)
 {
 	struct dma_bridge_chan *dbc = slice->bo->dbc;
 	struct qaic_bo *bo = slice->bo;
-	struct qaic_job *job;
+	struct qaic_job *job, *dep_job;
+	unsigned int num_req;
 	u32 credits;
 	u16 req_id;
 	int ret, i;
 
+	num_req = min(slice->bo->dbc->nelem - 1, num_full_reqs - req_offset);
+
 	if (check_mul_overflow((u32)num_req, dbc->credit_ratio, &credits))
 		return ERR_PTR(-EINVAL);
 
@@ -185,13 +189,24 @@ struct qaic_job *qaic_create_job(struct drm_file *file_priv, struct bo_slice *sl
 		goto job_cleanup;
 
 	job->slice = slice;
+	job->req_offset = req_offset;
 	job->num_req = num_req;
 	job->dbc = dbc;
 	INIT_LIST_HEAD(&job->queue);
 	job->id = req_id;
 	kref_init(&job->ref_count);
 	for (i = 0; i < job->num_req; i++)
-		slice->reqs[i].req_id = cpu_to_le16(job->id);
+		slice->reqs[i + job->req_offset].req_id = cpu_to_le16(job->id);
+
+	/* Handle BOs that have been split into many jobs */
+	if (seq_no) {
+		dep_job = list_last_entry(tmp_list, struct qaic_job, queue);
+		ret = drm_sched_job_add_dependency(&job->base,
+						   dma_fence_get(&dep_job->irq_fence->base));
+		/* add_dependency() will put() the fence on error */
+		if (ret)
+			goto job_cleanup;
+	}
 
 	list_add_tail(&job->queue, tmp_list);
 	drm_gem_object_get(&bo->base);
-- 
2.43.0

