Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21E1E1024
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 02:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790995164; cv=none; b=XPvalfzaJAl6DGc0glkkwRg7H46s48hcivwCEgoGA+q7YtJGgvcoJfoRa44iy6CScWSGPLtt8nqRzPgYGzwGobKHlT+Aes8F08ZMonQ/ZQsLrp+XqDQISs9HCa1ZmqirW6b1v0Sow0gFMUzFTrLK1moCx7QxEZ03FrOOEKq78/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790995164; c=relaxed/simple;
	bh=otocmUmftzsZHGB23VAnk0Hmt7s0UYRSpaf8ryL2+N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlDDLOVpXAW8UQiXekFyn4FjHJhjxFI9kB1z24SoaniJ+94dt6zId1E+Hl0vhmzY2eKFogesN1661cWtQEVP1jtWjcJAzU0xu38wJPqENyaLoiRmdEFePOAKy0eqyrrxsIyNzsdv/IFZAormt+Ew/M2QcxX9ljQqXlyrZ5vDoSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xh8IRWRO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcKTIgEn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xh8IRWRO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcKTIgEn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6932C5eK3494657
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 02:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gZz30RGqcyo
	oCKSyYx7ei9XqBKAr5VlUPv5vj+/0xSA=; b=Xh8IRWROjIc5YqGQ8a49jPS0U0x
	gFq+gWMxNtWo4/AJgIqi2YmmJQ8crMhFsmHo4IUG8TZMXo6JWtA5Ix60g57w0dJm
	VFBibWE832s4UKQkaFF9OjWVliJFoL30U8VDJTDXdf59Rn9AlgJfm5kHZ9qBsP5W
	Kfl/foWxpHcdY49+CmO7cnu5Ml6CbnmYGYVfMAS0EzFFiEx4IWL2JY3AyyqmRf42
	KQOR/NeJ2nlyXG+1PBtKvbr0Qmy1ViDGNt5NTqjm0kRmCR1zKj9TDSCGYVmdNlUR
	d/h4kqep9VPTi2iWpzYGmsSTGqSgvmh7asmm+F5vay2LYWonm676RlwfplA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2rq581dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 02:39:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510a481ae9so302065eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 19:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790995161; x=1791599961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZz30RGqcyooCKSyYx7ei9XqBKAr5VlUPv5vj+/0xSA=;
        b=fcKTIgEnLv3h677KGKTmsTX2pX2UmmrcqcYLXi33jTmvMz2M3fD2MxegdcqQhRAbJo
         JKu98rZatO/m1VaUeBat5wed91Z/a29g32NTGUdt7GSpnntM2dE6GlQ5zV0cCAo8Z0Xj
         1z32/VpptZimpUCUzz1ndyFhA/jNZlnPIdccMOZDJ4lNeiTgwDmn5ayAQWWnig1lgF4f
         8Cwj7efmQ/0VZoC6RQTUBP+xdYtTik2guWfMMQBtOLqBMYmdTTjov3Ibf/ZrJekulRtt
         mIxReHSQPE77q3tQ2Q2wwP+dQdpJvqdV9BvUABtu+cnO5O7r64oLqPt+3Wrj7FLfbJn3
         PnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790995161; x=1791599961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZz30RGqcyooCKSyYx7ei9XqBKAr5VlUPv5vj+/0xSA=;
        b=E61ZFNKaeG5MWRKU2wVTSXO8np/rJBLgHp7WNxYx3dC0jsG3mWEorlH5ihUVjrZsJ4
         BWkqm9LbfTorA+DBRfig2aG0JApwCi1rEF8fyMhDbGcmjblXrlXxyZHtZ8iaZPJlFJ/9
         hOkyWhV0h2aqC+apJ5kSNnDVRA+frK9ewmy9cDUq/xabWfKbZod77SVcJUmVq0jeIXhx
         9K1XVtMJMX/eDPjJfbc++xLQtll3p2vI4fIJNlT+DrK9CuGuKUjcVsuMn6H2OjqB9pef
         hcFrFD9I89H/FJ7zcr7CsqtSmue1q85oYGswkvNIdcFJZwhaYMyY9qwxWoI6p6HMpOJC
         qgRw==
X-Forwarded-Encrypted: i=1; AKwUvBzcF4y+MCx/M/B88jn1u34ZWgLhOwW0312qOzVoufvJv8Hpsdqo3fQcuMXi3DATFuk4M3KZmyS8qJzzLmB4@vger.kernel.org
X-Gm-Message-State: AFq9FYIio5DVKX9XU8+YlmFOuktzyMqYLIMs7MLb5wb50wYxSH08J7ah
	gyjNg7GGnk/WB+2+aR06bm58H+PHe9d6xwEeYqF+pGr5hqt2S+QtvhjyAQiakXiNL/AsCQ16t3F
	iNqIxmuY4IF4U+f4IautCl47UvUWOM+yrt4mzxFXcS2EiSpKRaWZ4WprXDagonYF1lC3q
X-Gm-Gg: AYBFou33PAph/qYYEytS9YluHdCMwOwQJaqyL8FK3LsFTE8SmJpm3wDSIRHWGvfPrA+
	UnOefOmi2Ri5kckZgL24PRzLrWltNW5ZC+0kCSzAVE9CLIIbI2oUi+piboIdhZ/jSA5TgY6QUeU
	bG3K1vdDq/HKGha5V4K7X0f0J3ET+ZDTWyg25EOVhrDKVmVQweypYeTJygtrq6NWD0+Y8mZH9rr
	qpBnu6vcztK2ipYYlUrhTQZGySC3HvghcAk8j8MmJMliQtAuNtsQ22FA4Y8HjjBcqR/3EehS571
	JRYOeuLYPYWHoaWHlh9HTYzDFRJS15+hRGN3uvg6P/IWm5WIR4+eeOzdpl4pi7m9I8angWGjhew
	WjItM9ZBrM8xbVEJzMFkaaScXgmiwbO81Ffti0y5MlyWXKFjcMKL9II6w
X-Received: by 2002:a05:7301:1927:b0:33b:c69b:7074 with SMTP id 5a478bee46e88-34f11d6e11bmr4697887eec.4.1790995160999;
        Fri, 02 Oct 2026 19:39:20 -0700 (PDT)
X-Received: by 2002:a05:7301:1927:b0:33b:c69b:7074 with SMTP id 5a478bee46e88-34f11d6e11bmr4697871eec.4.1790995160457;
        Fri, 02 Oct 2026 19:39:20 -0700 (PDT)
Received: from carlv-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm7665736eec.6.2026.10.02.19.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 19:39:18 -0700 (PDT)
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sashiko <sashiko-bot@kernel.org>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: [PATCH 3/6] accel/qaic: Isolate hw submission
Date: Fri,  2 Oct 2026 19:38:15 -0700
Message-ID: <20261003023818.1161666-4-carl.vanderlip@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: jys4sWaagTvjgBlTLAES8sx1EfLniwvh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAxMCBTYWx0ZWRfX1vdGbfOCZhV8
 vSVcUXx6/v3PK6IP4tIfDYiA4N2zyQhcej3CeWmXHfLig9HN/QeNrh2MHZuV5OpEYIh1lt4seTF
 zufLjAaBBrqtcKEsJnUHVxqUoEQ66Wg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAxMCBTYWx0ZWRfXykLYaImYrM/2
 k0dcjJwi7+ssaawlb99YKepX/7vsEbsUD4hmqZ2FkzJBQLCg9mXFo1becp9ZZcAkp20x6Ka7FRr
 kXEVdKJrvnFBiAp9sL/hlYeFckYHoImNiaKD2vYrdpSrM+GTfl0OtroNJdz/1+hivnXGyQ3beYC
 PiflEdZrgjxR440TFvdUr0PK2YezrwZV4DL/vSc+faKbSZXnfVWPa9y28SsQcUhytmSzC1qZ1uz
 2fVkRxtcg8peXxdt438l9zAO0dHvogzdoaGCGlccq8mX9yHl/p0tGmmpZzs5Tm3VTkbh8PJdzd4
 laZgm8EOtMVx4KaOsCIp+n5+FxIqJJY67yioQbEICNd1SXEfYd6fdZCKGziLQeQwMvi7XpCAqiC
 mAG6tI1vcHnksofQ8vFHXpy1M60kwnb33v4gzMiUk0SNlsoFNTocmMUS9VrzJ8ZXuVt87/gEwuv
 4YABb3EFFrMM55UPQTA==
X-Authority-Analysis: v=2.4 cv=QY/zLcbv c=1 sm=1 tr=0 ts=6ac06ada cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=5-U_A-XKzxRuPHLIxtEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jys4sWaagTvjgBlTLAES8sx1EfLniwvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030010

Currently there are two pathways used to submit a request to the DBC
FIFO. In preparation for using the DRM scheduler, merge these two into
one so that job submission logic is simpler.

Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 171 +++++++++++++++++----------------
 1 file changed, 89 insertions(+), 82 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 3326d9da0e1e..0208400d2636 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1164,47 +1164,88 @@ static inline u32 fifo_space_avail(u32 head, u32 tail, u32 q_size)
 	return avail;
 }
 
-static inline int copy_exec_reqs(struct qaic_device *qdev, struct bo_slice *slice, u32 dbc_id,
-				 u32 head, u32 *ptail)
+static void submit_reqs_to_fifo(struct dma_bridge_chan *dbc, struct dbc_req *reqs,
+			       u32 num_req, u32 head, u32 tail)
 {
-	struct dma_bridge_chan *dbc = &qdev->dbc[dbc_id];
+	u32 num_submit;
+
+	if (tail + num_req > dbc->nelem) {
+		num_submit = dbc->nelem - tail;
+		memcpy(fifo_at(dbc->req_q_base, tail), reqs, sizeof(*reqs) * num_submit);
+		reqs += num_submit;
+		num_submit = num_req - num_submit;
+		memcpy(dbc->req_q_base, reqs, sizeof(*reqs) * num_submit);
+	} else {
+		memcpy(fifo_at(dbc->req_q_base, tail), reqs, sizeof(*reqs) * num_req);
+	}
+}
+
+/* Caller should be holding dbc->req_lock */
+static inline int qaic_submit_reqs_to_hw(struct bo_slice *slice,
+					 unsigned int num_req,
+					 bool is_partial, u32 partial_size)
+{
+	struct dma_bridge_chan *dbc = slice->bo->dbc;
 	struct dbc_req *reqs = slice->reqs;
-	u32 tail = *ptail;
-	u32 avail;
+	struct qaic_bo *bo = slice->bo;
+	struct dbc_req *last_req;
+	u32 head, tail, avail;
 
+	qaic_data_get_fifo_info(dbc, &head, &tail);
 	avail = fifo_space_avail(head, tail, dbc->nelem);
-	if (avail < slice->nents)
+
+	/* PCI link error */
+	if (head == U32_MAX || tail == U32_MAX)
+		return -ENODEV;
+
+	if (avail < num_req)
 		return -EAGAIN;
 
-	if (tail + slice->nents > dbc->nelem) {
-		avail = dbc->nelem - tail;
-		avail = min_t(u32, avail, slice->nents);
-		memcpy(fifo_at(dbc->req_q_base, tail), reqs, sizeof(*reqs) * avail);
-		reqs += avail;
-		avail = slice->nents - avail;
-		if (avail)
-			memcpy(dbc->req_q_base, reqs, sizeof(*reqs) * avail);
-	} else {
-		memcpy(fifo_at(dbc->req_q_base, tail), reqs, sizeof(*reqs) * slice->nents);
+	submit_reqs_to_fifo(dbc, reqs, num_req, head, tail);
+
+	if (is_partial) {
+		/*
+		 * Copy over the last entry. Here we need to adjust len to the left over
+		 * size, and set src and dst to the entry it is copied to.
+		 */
+		last_req = fifo_at(dbc->req_q_base, (tail + num_req - 1) % dbc->nelem);
+		memcpy(last_req, &slice->reqs[slice->nents - 1], sizeof(*last_req));
+		last_req->len = cpu_to_le32(partial_size);
+		last_req->src_addr = reqs[num_req - 1].src_addr;
+		last_req->dest_addr = reqs[num_req - 1].dest_addr;
+		last_req->req_id = reqs[num_req - 1].req_id;
+		/* Disable DMA transfer */
+		if (!last_req->len)
+			last_req->cmd &= ~GENMASK(1, 0);
 	}
 
-	*ptail = (tail + slice->nents) % dbc->nelem;
+	tail = (tail + num_req) % dbc->nelem;
 
+	/* Submit_ts will be taken for the last job of this BO */
+	bo->perf_stats.req_submit_ts = ktime_get_ns();
+
+	/* Finalize commit to hardware */
+	dma_sync_sgtable_for_device(&dbc->qdev->pdev->dev, bo->sgt, bo->dir);
+	writel(tail, dbc->dbc_base + REQTP_OFF);
 	return 0;
 }
 
-static inline int copy_partial_exec_reqs(struct qaic_device *qdev, struct bo_slice *slice,
-					 u64 resize, struct dma_bridge_chan *dbc, u32 head,
-					 u32 *ptail)
+static inline int copy_exec_reqs(struct bo_slice *slice)
+{
+	int ret;
+
+	ret = qaic_submit_reqs_to_hw(slice, slice->nents, false, 0);
+
+	return ret;
+}
+
+static inline int copy_partial_exec_reqs(struct bo_slice *slice, u64 resize)
 {
 	struct dbc_req *reqs = slice->reqs;
-	struct dbc_req *last_req;
-	u32 tail = *ptail;
+	unsigned int nents_xfer;
 	u64 last_bytes;
 	u32 first_n;
-	u32 avail;
-
-	avail = fifo_space_avail(head, tail, dbc->nelem);
+	int ret;
 
 	/*
 	 * After this for loop is complete, first_n represents the index
@@ -1219,50 +1260,15 @@ static inline int copy_partial_exec_reqs(struct qaic_device *qdev, struct bo_sli
 		else
 			break;
 
-	if (avail < (first_n + 1))
-		return -EAGAIN;
-
-	if (first_n) {
-		if (tail + first_n > dbc->nelem) {
-			avail = dbc->nelem - tail;
-			avail = min_t(u32, avail, first_n);
-			memcpy(fifo_at(dbc->req_q_base, tail), reqs, sizeof(*reqs) * avail);
-			last_req = reqs + avail;
-			avail = first_n - avail;
-			if (avail)
-				memcpy(dbc->req_q_base, last_req, sizeof(*reqs) * avail);
-		} else {
-			memcpy(fifo_at(dbc->req_q_base, tail), reqs, sizeof(*reqs) * first_n);
-		}
-	}
-
-	/*
-	 * Copy over the last entry. Here we need to adjust len to the left over
-	 * size, and set src and dst to the entry it is copied to.
-	 */
-	last_req = fifo_at(dbc->req_q_base, (tail + first_n) % dbc->nelem);
-	memcpy(last_req, reqs + slice->nents - 1, sizeof(*reqs));
-
-	/*
-	 * last_bytes holds size of a DMA segment, maximum DMA segment size is
-	 * set to UINT_MAX by qaic and hence last_bytes can never exceed u32
-	 * range. So, by down sizing we are not corrupting the value.
-	 */
-	last_req->len = cpu_to_le32((u32)last_bytes);
-	last_req->src_addr = reqs[first_n].src_addr;
-	last_req->dest_addr = reqs[first_n].dest_addr;
-	if (!last_bytes)
-		/* Disable DMA transfer */
-		last_req->cmd = GENMASK(7, 2) & reqs[first_n].cmd;
+	nents_xfer = first_n + 1;
 
-	*ptail = (tail + first_n + 1) % dbc->nelem;
+	ret = qaic_submit_reqs_to_hw(slice, nents_xfer, true, last_bytes);
 
-	return 0;
+	return ret;
 }
 
 static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *file_priv,
-				  struct execute_info *exec, struct dma_bridge_chan *dbc,
-				  u32 head, u32 *tail)
+				  struct execute_info *exec, struct dma_bridge_chan *dbc)
 {
 	struct ww_acquire_ctx acquire_ctx;
 	struct bo_slice *slice;
@@ -1309,37 +1315,40 @@ static int send_bo_list_to_device(struct qaic_device *qdev, struct drm_file *fil
 
 		bo->req_id = dbc->next_req_id++;
 
+		spin_lock_irqsave(&dbc->xfer_lock, flags);
+		list_add_tail(&bo->xfer_list, &dbc->xfer_list);
+		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+
+		ret = qaic_acquire_bo_fence(bo);
+		if (ret)
+			goto fence_failed;
+
 		list_for_each_entry(slice, &bo->slices, slice) {
 			for (j = 0; j < slice->nents; j++)
 				slice->reqs[j].req_id = cpu_to_le16(bo->req_id);
 
 			if (exec->is_partial && (!resize || resize <= slice->offset))
 				/* Configure the slice for no DMA transfer */
-				ret = copy_partial_exec_reqs(qdev, slice, 0, dbc, head, tail);
+				ret = copy_partial_exec_reqs(slice, 0);
 			else if (exec->is_partial && resize < slice->offset + slice->size)
 				/* Configure the slice to be partially DMA transferred */
-				ret = copy_partial_exec_reqs(qdev, slice,
-							     resize - slice->offset, dbc,
-							     head, tail);
+				ret = copy_partial_exec_reqs(slice, resize - slice->offset);
 			else
-				ret = copy_exec_reqs(qdev, slice, dbc->id, head, tail);
+				ret = copy_exec_reqs(slice);
 			if (ret)
-				goto unlock_bo;
+				goto submit_failed;
 		}
-
-		ret = qaic_acquire_bo_fence(bo);
-		if (ret)
-			goto unlock_bo;
-
-		spin_lock_irqsave(&dbc->xfer_lock, flags);
-		list_add_tail(&bo->xfer_list, &dbc->xfer_list);
-		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
-		dma_sync_sgtable_for_device(&qdev->pdev->dev, bo->sgt, bo->dir);
 		mutex_unlock(&bo->lock);
 	}
 
 	goto unlock_resv;
 
+submit_failed:
+	qaic_remove_bo_fence(bo);
+fence_failed:
+	spin_lock_irqsave(&dbc->xfer_lock, flags);
+	list_del_init(&bo->xfer_list);
+	spin_unlock_irqrestore(&dbc->xfer_lock, flags);
 unlock_bo:
 	drm_gem_object_put(&bo->base);
 	mutex_unlock(&bo->lock);
@@ -1536,13 +1545,11 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 
 	exec.perf_stats.queue_level = head <= tail ? tail - head : dbc->nelem - (head - tail);
 
-	ret = send_bo_list_to_device(qdev, file_priv, &exec, dbc, head, &tail);
+	ret = send_bo_list_to_device(qdev, file_priv, &exec, dbc);
 	if (ret)
 		goto unlock_req_lock;
 
-	/* Finalize commit to hardware */
 	exec.perf_stats.submit_ts = ktime_get_ns();
-	writel(tail, dbc->dbc_base + REQTP_OFF);
 	mutex_unlock(&dbc->req_lock);
 
 	update_profiling_data(&exec);
-- 
2.43.0

