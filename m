Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797638;
	b=5Z6+djpm2cUPJ6BQovNlp2AmB1uIBEpe4KE8cpycAFYBWLgdZTRHvH0n2UmRhMMSMcrj
	 Jrz9x6psKS/e660u9gsxe7FaX+H5ITCJMZPaTloigjPk6nSBdqSiQaAcxiav6eEp8YWhf
	 TsxQnTUUuzhQ++MxZxouiE3jgLe9EaGoVN9Tiz+WQ+JJvYVWUtFOw+5edXBdHYFiPIAJA
	 rbEFc1FaPpxLfxXhFx2IUUFjFtkihUeWNTV9Rxw6XcCBfgGTm5Ay2FECZtjKdvtxPqhpf
	 BLxl4XB9rNc3X0pyQz5ExbJ5hltNNeHHao/59cE9CcIuyebOMi3WLE4bnOhg1X8fC3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=;
	b=SY9WA2durgnGoudIH/lpwhB2dcl6H/wSgkYEnkwOjuSDnHlZraDapN5zI6BlxAMTK4Os
	 kIK0/XrwEkxU1h61Kh+2wd7KdtdcU4njWBseKbNCr1EKHe4LWkucY3I9/fu4CjImMiVqP
	 A1k0e25uoze8J9Ns1HJs/P80MdHV+v/AaK4Q91a07GAqcTL9x2DxxV9f4YfyN6J7+fexq
	 8jjCZ3bbhGLlZtgtjlHYYQVikqPUUadxj42Jyl0lX6yb05sT13gqE8O860pclTIO4nKv5
	 rxnO656kKntDlp85clS1r3ThYrEIuXe1J3DyCNGU17+JLydQaqNCXkJirygAEiNxmng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k/zcNqib";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fTUwPsWB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157D9606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 157D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k/zcNqib;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fTUwPsWB
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvAGZ2495824
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=; b=k/zcNqib6o3a3F1E
	UiOycBmImHXspTfur9uZU5ciDwoAKETzh+DVgpD0LF4xgWZmN44tN1jU8fMx2X2g
	VsJoFarfRpjhzdV+Fan832+Bb2of1+vE2jEjL0s/4ZrJ56ytKmPVl+YPtdsPDZBy
	NqHMFLYoScMVLXc+8IpCgMGu9fpts7Uk1II2KK0G/kY/B5DTeB6ncjhxeMDhq12R
	1UFRZ7S9W7W7Zrzv0GD/+wtzStBn101uKXwa66fooToVPIuaJ/AdnL/8CznT3DET
	1l4tQrG4HO0lchcI5mFlaX0cxk61DnEYX+qB+hB2Qj7t85y7fhC4SJb9SFz1Kr2o
	mvCrVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr08vd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso450303785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797636; x=1793402436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=;
        b=fTUwPsWBJHM1rJXxWn6U/8xHUaJ+WGyAeiQk4a/QLKeuDcfrn8amJBjfQm9VfOwMmx
         QpKjpuasi1iuohByaLK87H2a1Pj60/8BpJrr4x0EJucL6YSGl7G2Mdac8cbBPrXBMSTf
         cvLEsQF9A8qySfRww1PRvLVwWiF9uzbPQxZ3ZsK78lKd/lyEPehkmS0ox7r7TwY10ICj
         SLHGw4HELRgKmuEU1CdXKJi6t3F2v+uejr/eC6TKhZI4PvrP+3ygq8/tsbBhbtYx8Gds
         QAVcPid7dOtKT3Oufg+GC4fY13jf+kSwwG+Ir6/14ZEZ61A0dL+pvPMLUpUPNpDPePo7
         7v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797636; x=1793402436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=;
        b=wkcy71YZdCKMNNr58ep2vgQgQkJTrUsMYBoXQBH+C/FlR2hAkMsjET3pBWfxbQavwi
         go5ZF9kNa/hHIaebQ6Ws5q9M1G9WEYGJImDjOCkucIu94kE31ArVMi6wczv2HmYthBMD
         wdQPHL0GQgx1MrcS94eWiEAIFgIeLL/OAHBy/Z+KorzcaKMdHpZMnO3+mgwbVOwufCsR
         EnXLHgYCwGfPnO3U+D2jtw8vcVz1M+NDun7Vqx58+66sd4fziaug+wTNl8P5D4vuKqeu
         XKi1GEkttTH9emWLXEPp4CnqPprxn4KK31vOI20VoSz4pqNUO+juwhgAYiF214CQSYp+
         HUYQ==
X-Gm-Message-State: AFq9FYLWDhiNASTXgFFN1rPo9PaRHZcscGrjg/66v3PoSa0NdXlgVoMt
	nujdTTXZr4TPD8qFx6K0qFicI2RlmtJJUGtRL9ICn5XMU3bH4Hj5JMtinISsHFTRUWr+5aqRKWo
	sFZCpUNBeTwXM7AjoUhxW92pLl3nxphCqKQMC/Yq8/nsledI1PgylwAFZeST8NIVeSt+O
X-Gm-Gg: AYBFou0SyYenpeqhnFNWB14uz8643b8Q1fI2fH+Dj0sRZ29w9fZmeFf/dDk63oMhK2u
	jpWC7TEIUtzfh4U0yH2Oju3O+lQUU2h7KRgwl2QcnInbEBIn3pu71mYvqH3nFN8OIIavEGCjQxK
	R5nYFWMOsBQM9MrSyaeKY45Jj3F1hwHGoQoI+mbTTbgc6hseCI8VqZ85xQmU4zlUwntoA7hZJWG
	iMGWu4puXze6YOQeJreD3g2nqsv1m9lzBoiVw19y60JOlcRRqv2GnEyG3W1u4sKLN06QslAKRPX
	u1eor5FTe+V1rc2hAmaF+X6f6ac1Igj3Pi5GtNybXM+OxsIgyxxwelZAQQ0VaF6Qd6fKpwfzCRw
	4f0evfi38XnJkB5Uy8ZYHOMQFpskjTm2sT0XScUIp2kQQQ225MiTxqcPrLLjAhYYkzRBPROcwej
	eXiA7EjMWo7CnY
X-Received: by 2002:a05:620a:d94:b0:93f:59b8:e29d with SMTP id af79cd13be357-940efaf66e6mr77844985a.26.1792797636342;
        Fri, 23 Oct 2026 16:20:36 -0700 (PDT)
X-Received: by 2002:a05:620a:d94:b0:93f:59b8:e29d with SMTP id af79cd13be357-940efaf66e6mr77843185a.26.1792797635887;
        Fri, 23 Oct 2026 16:20:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:45 +0300
Subject: [PATCH v3 12/14] drm/msm/dpu: unwind a failed dpu_kms_hw_init()
 step by step
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-msm-kms-destroy-fixes-v3-12-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3855;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CqSiLL5IBlX4YCUe6BZMO8fXF9pjuxvbGKp7tY7bOYI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uXRezNuWAVHO0XDxUZpHkJhvnEIk7EChiQR
 Fo6aKhsGceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrlwAKCRCLPIo+Aiko
 1RDvB/91eD0ioDaHLz9YmtbaBo8ltKUN5v7BxsU0fkhKOc7eHUIqYaIW33fqE0DfjvE5YKBQJc2
 MiklEVsMzb2bJTLdiFRx5ROkGAqXCtIC76zBleGHtvnurKg48Q8Ky86u0c7O8xQ/q+ENUXLj6V4
 a1xYtF62VOohFcLi1JRtXVEFgijHlfwtoiNTv+0cFVB3js3NUmUeXmnQlqER5+qb1BwUdtkvlPN
 UYYaOm3H2rnQMcN/z7+F1nL8q5hduxTHJ5rmU349JCIGwyGfsPwcBdIeH8mNDVCjeR4wenlrOd7
 3Qq4YMXFVzSbAeCmBh/vEWiRdQg89+MvcwN24mWQabquSe8L
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 8F9Mc_M1F58pSvaz35Le6_-suVIz15oz
X-Authority-Analysis: v=2.4 cv=FM6OVOos c=1 sm=1 tr=0 ts=6adbebc5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mqmjYGUTO374PHIbFJAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 8F9Mc_M1F58pSvaz35Le6_-suVIz15oz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXzH9zLKR1CvIc
 3ok250lZXPZxXIiNYZcJIkvAJIuTVYQNM6hAy4xgSjQdPSsEGMYFIIPvZ9v+lUpKzZIKPZTISvu
 KM4EVJLFO8UAvl69UdX2G3AJsVjzZ4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX/iQeUn74l3+7
 l9kwEK9oLLiGgp7TPzVxrU0YWIo2PFfZRzn92ZjxSY8vzwvWdun7eoVzpckKwj/SxtCXiz8sdR5
 t5PAT8PFdWWauzKV2wAVjtjOKrpESkqhu39OlHA8uNsCFbQ1LgSPjVIbeRiIZkAvqc9um5pvsL0
 I4aY5nm/h3eZLKalCN6+Lx9kT0ZCn75YXcTAEdHWiMt2dyyzzvmAaW98wYg1FoAbz5OgNmYeilg
 0DT8LCgQx5ImKTDHk85gSq7xKYsYPhmDJ1+Z9K9FGydr33T/9neKOq150M/i6GTNLvMt3sLRul1
 CsrCeziO02inCUBh7UwrefBuEQvNzCRWaeEBeVJPBIiCPqPCH+bgk2R7xflBj4VwWHOjCu05+YI
 iVtPtFDzb/MsuW+/IwwScGzHue/spi5e+g2ty+G2SVg8iimRxmfPYrC1os2c4ASwD360PiK8nH/
 nUqn2DAo+ocoCAMtjqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy(), the teardown
of a fully initialised KMS, whatever step it failed at.

Undo only the steps which have completed, in the reverse order, as the
kernel convention wants.

The hw_mdp, hw_vbif and hw_intr blocks are allocated with drmm and go
away with the DRM device, while dpu_kms stays around for the next bind
attempt, so clear the pointers to them as _dpu_kms_hw_destroy() did.
Otherwise dpu_runtime_resume() of the next bind attempt passes the stale
hw_vbif to dpu_vbif_init_memtypes() before dpu_kms_hw_init() sets it.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 934ba47b2dae..3546efacba3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1161,7 +1161,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)
-		goto error;
+		goto err_global_obj_fini;
 
 	core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
 
@@ -1188,19 +1188,19 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(dpu_kms->mdss)) {
 		rc = PTR_ERR(dpu_kms->mdss);
 		DPU_ERROR("failed to get UBWC config data: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	if (!dpu_kms->mdss) {
 		rc = -EINVAL;
 		DPU_ERROR("NULL MDSS data\n");
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	rc = dpu_rm_init(dev, &dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
@@ -1210,8 +1210,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(dpu_kms->hw_mdp)) {
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
-		dpu_kms->hw_mdp = NULL;
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	struct dpu_hw_vbif *hw;
@@ -1221,7 +1220,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(hw)) {
 		rc = PTR_ERR(hw);
 		DPU_ERROR("failed to init vbif: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_kms->hw_vbif = hw;
@@ -1236,7 +1235,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	/*
@@ -1253,8 +1252,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
-		dpu_kms->hw_intr = NULL;
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -1274,7 +1272,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	rc = _dpu_kms_drm_obj_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("modeset init failed: %d\n", rc);
-		goto err_pm_put;
+		goto err_self_refresh_cleanup;
 	}
 
 	dpu_vbif_init_memtypes(dpu_kms);
@@ -1283,10 +1281,17 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 
 	return 0;
 
+err_self_refresh_cleanup:
+	dpu_kms_self_refresh_cleanup(dpu_kms);
+err_mmu_destroy:
+	dpu_kms->hw_intr = NULL;
+	dpu_kms->hw_vbif = NULL;
+	dpu_kms->hw_mdp = NULL;
+	_dpu_kms_mmu_destroy(dpu_kms);
 err_pm_put:
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
-error:
-	_dpu_kms_hw_destroy(dpu_kms);
+err_global_obj_fini:
+	dpu_kms_global_obj_fini(dpu_kms);
 
 	return rc;
 }

-- 
2.47.3

