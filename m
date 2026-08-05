Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E7A471CEB
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 13:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937091; cv=none; b=Z/Ypn8G0/FlJ6lXhYvt4PH6iqBBCZ5+nLXm/MjMIB5MES1/nBfv7bLZ90MkO0MocVV4eMrNzYOlDOST16dzMAEY7RrgklE1ONar/cqPtFlHvjUIANb86V9LDJu2gkjOz3fwUK9CTnCtrULUJx2jEpZoMOCQbU8b142IALroS4yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937091; c=relaxed/simple;
	bh=OnRjT98dZqNSmeCRXSpJxFYaJQEhd3OrCpvIuT7vOV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N++wh8thABCqSg+fH/Yhp13fkuWGVQeEVLaKHIFpNjY8fCKlNULs5mYJeDKEY7zGb5K/F2sryPfjaZfS/YpuL0+ZuAjQ++f1cmcI7PH+AkrlFrs3nv4s7WC3w8d6qCqdCQVLrOG2yBBk9lpLo6yraImhjPDFZksuK40De3lA1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/LvbqC3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/VkoCX2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/LvbqC3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/VkoCX2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvuuI3124701
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 13:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vw8PgTmZdhvQmzo6d6mfcJ
	lCGMwMbx7pkqiQSYNZivY=; b=T/LvbqC3MHGfXDO2q1cEZVNT14owJJlJWQQmdD
	dTIaZv/AdToNu/wi3P3KUahmvWfUzzQ4sE3jOYg/1K63N8LskhZdhrKNeJVj2cRh
	i4Ysk46EasmL1oK9JdlUc/QHv/peceq/LidwlVF0y2dhWrejWjJ00ne8YrTasx/3
	UgYdr+Q5YNPxX3vM9KPvYSvduoTOYHlIWln8FgkGhzjv2uM7gYNp4qF1S6l9BgrV
	9uNRnxwuSf2pUMxMkYxuBgfEk/go2KHM3PmCFC4EDk8PtEU/aGZ6Blqr3i6ZU1aT
	aSdHye8yfniYZIpOtDCT0LMiaA/rx5BGkiGAHd6R0U7dGLHg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14w9fb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 13:38:08 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66988049306so1096718d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 06:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937088; x=1786541888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vw8PgTmZdhvQmzo6d6mfcJlCGMwMbx7pkqiQSYNZivY=;
        b=F/VkoCX2Uzfr1ZVvnuuOxUBX4BTMOCqi6AoEH9Ep3Y7jZHrj49gx2n7BFv2ZoPTR09
         4/VIfpHRXSKa1tL9BZippYVhRkYYtF24wScpqYzvktLFDpaFX9t1wi5xKt/s7TPHHBFp
         VJBwMCNykYjUOliq5mI5WmJL72MZedsW4WFPQw4Lj/opXEXJFG5G1hZUgJ/2jdqsRON3
         kDona8pLBktkiD26jI3jq90svJy+RSDM5EpCSCz398qaPD3pyE1YydKJnbo4QbuiS3+r
         9sll/KXC4yDeaVNy9UADAva2DVldyIA9DE475WFEoD6sD+JvtI9IWol3s9ez93Ij4BPz
         SOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937088; x=1786541888;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vw8PgTmZdhvQmzo6d6mfcJlCGMwMbx7pkqiQSYNZivY=;
        b=cYGaX/5vq/gd9GjEax+UeCwOgTNktGNpbMjtnK9KkaRndlH/+wQWycX68kyQsOjsxB
         fxo/K0FAsV//RcC09WLu2dkBEeZo75H/0aec7RtHlHKd5bEDvvtiB24LRzKvIMotdoSI
         3kb9nLNAWkwFH3WgxSXZ3P2hnkAarqOZQaPwg3tFxjdp1K5AEFQwqPsIL2Pf65ig/yM6
         cXpZI1GfJzJn8a4gf2N+rClQQ+CdDTbdxXWGWhvysXa5vrEh3CSI6zmIncZqJlHDhU4P
         47jNAjXYJ9EZmDPiAAyiuk3p2tulMArYojiYVE2P/uS94Rv7t7Sj2GKknv8Yqr2611t9
         0DOQ==
X-Gm-Message-State: AOJu0YyR0LaHX/Hib7bkjr8In3zqlesE8w0saf1Mbom0Gb88CejpU29x
	9nnBDVYlE/RqVdA8d9/WvvSD17k8yzmuohaqxfWKYPfY/1t1qne5dHkl+rRzJQL6ugsPuKP1r5s
	0GFvMHoIcYTUpXnWa8McDlNGH7exms3lgpRAtCTtW7qL+mmpkOseTOkSfqb8toLQw44sL
X-Gm-Gg: AR+sD11JwzhG11MECi8bjAP953R3k1Mxyr1RnJbU3Gpkh3N6cCdciWIIFXvEVBaUkxB
	SrsAJx11svZ042e9NUu0HmegY69LqBJsrJJ/m0nctSOIv3sTA96B30HTm6r16VapZa/w6QCrWDg
	/NCtU7Ir2gLG9umI+pVm6oJH8uTV0+iIfeti5v5w8BSM8dWBSSU+hd2i+zdXdSq649AiStWnwUE
	rFLGPZcd57Y3Ipeo3TeVSxonzuZt6lnSKozr9bX7q5ODO9YuHw1hkePLYE/t/Q8dX7HyOYNzKZB
	3dMSSrm2sUaA+ZWrrCoI+f8Kdk1hHj4PNjFdLYHz8zYfYHaXL+w/OWOOMqZfMtprbOt8OYRhOG1
	Ez4qGWkm0K8ziCEubKrzvKHctmRU=
X-Received: by 2002:a05:690e:1a83:b0:662:f376:ae0e with SMTP id 956f58d0204a3-6699aa9cb6amr2618104d50.32.1785937087957;
        Wed, 05 Aug 2026 06:38:07 -0700 (PDT)
X-Received: by 2002:a05:690e:1a83:b0:662:f376:ae0e with SMTP id 956f58d0204a3-6699aa9cb6amr2618081d50.32.1785937087351;
        Wed, 05 Aug 2026 06:38:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6699136a3d5sm3107401d50.1.2026.08.05.06.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:38:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v6] firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context
Date: Wed,  5 Aug 2026 19:07:58 +0530
Message-ID: <20260805133759.2790755-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMCBTYWx0ZWRfX9K3aweuz7ngr
 l6ZF8M4l+dKtRwCj1hlYUIvovHrzw0u121pYaMs6c44PDjrPaj693JY/VGF+XCqZ/vRrBsSf1np
 mzwK/QzScFnlGkluJgEJj/CoF2P8B48=
X-Proofpoint-ORIG-GUID: XBXNyug8LTnySihwC-GjC5Kd9kKxxYRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMCBTYWx0ZWRfXw+ikffGPARPP
 37bMdhZPcyq7AanJYzFlxT+1gH4iXOnP4IF3RDCiiPWyHlAIC4XdOYyO9SEoezDcEs/XSXRAVsy
 P4WjgvISUO4BAGvJSyuURFo8jR4A1c8uHluSCkMen37G8o95zewm7niC5B+IGOo+VhKb1CA/OQR
 IJ5dldR/FXKjiPNOJ2a/BVKnQaPHeMFZeL24TRngJ5bwfyOuh3PF2abLq4lrIfS934OQlMYasFJ
 BOqhTWb+EN6JaayvbAn/MPiDJkSG4KujGIw40NmMpb7KgSm/lriks4oQyq8G+j5on2MHI3pmo8E
 RFJd8l1x3t+TEWaso7CUW9YcFdqtwlO62SfA0IF+WsRlEdXa4B0+R1ktLGsHvi75dfkuoE/S3BM
 6F0zwP5ivUxdJQznrIxB1wk3HseI8Vap6iVCNQNSWr/wvpu7HA8Tt1HoO1eNa8acPmCLJJMfbZA
 q/+j4FTJHqUf/QGgQww==
X-Proofpoint-GUID: XBXNyug8LTnySihwC-GjC5Kd9kKxxYRY
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a733cc0 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g7xFvzIaMl2GvowGQBkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050110

The PAS image initialization path always retains the metadata buffer
when a valid qcom_scm_pas_context is provided, even if the caller does
not require it. This implicit behavior leads to unclear buffer ownership
and forces new users of qcom_mdt_pas_load() to manually release
metadata, which is error‑ prone and incorrect.

Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
retention explicit.  Metadata buffers are now freed by default and are
only preserved when this flag is set. qcom_q6v5_pas enables this during
probe for contexts that require retained metadata for subsequent PAS
operations, while existing callers continue to work unchanged.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v6:
   - Other patches from the series is merged.
   - Removed dependency on below series by adding keep_mdt_buf
     into qcom_scm_pas_context structure as well.
     https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kernel.org/
   - Addressed minor comment on the documentationi.
    - Link to v5: 6/6 of https://lore.kernel.org/lkml/20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com/


 drivers/firmware/qcom/qcom_scm.c       | 10 +++++++---
 drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
 include/linux/firmware/qcom/qcom_pas.h |  1 +
 include/linux/firmware/qcom/qcom_scm.h |  1 +
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..0528a15903c1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -645,7 +645,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
 	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
-	if (ret < 0)
+	if (ret < 0 || !ctx->keep_mdt_buf)
 		qcom_tzmem_free(mdata_buf);
 	else
 		ctx->ptr = mdata_buf;
@@ -684,9 +684,13 @@ static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
 	memcpy(mdata_buf, metadata, size);
 
 	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
-	if (ret < 0 || !ctx) {
+
+	/*
+	 * free the metadata on error or if client didn't request us to keep it.
+	 */
+	if (ret < 0 || !ctx || !ctx->keep_mdt_buf) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
+	} else {
 		ctx->ptr = mdata_buf;
 		ctx->phys = mdata_phys;
 		ctx->size = size;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..6aff24d56ea8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -722,6 +722,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->pas_ctx))
 		return PTR_ERR(pas->pas_ctx);
 
+	pas->pas_ctx->keep_mdt_buf = true;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -740,6 +741,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->dtb_pas_ctx))
 		return PTR_ERR(pas->dtb_pas_ctx);
 
+	pas->dtb_pas_ctx->keep_mdt_buf = true;
+
 	return 0;
 }
 
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index fb2ec3be6a16..1d132e89536e 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -22,6 +22,7 @@ struct qcom_pas_context {
 	dma_addr_t phys;
 	ssize_t size;
 	bool use_tzmem;
+	bool keep_mdt_buf;
 };
 
 static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..6d8d3deb02e0 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -75,6 +75,7 @@ struct qcom_scm_pas_context {
 	dma_addr_t phys;
 	ssize_t size;
 	bool use_tzmem;
+	bool keep_mdt_buf;
 };
 
 struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
-- 
2.53.0

