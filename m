Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99E4D90C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351946; cv=none; b=CqtkAC7jcAvyTp19Fdnc21UuIkZQs6EKIgsjsUWt9OlwKrdnnfS5pcfe2VB8GSglRl3ktPKsejq5rCH2nqsnrq9z2zfOf0ZgJN8dRiKzuOFn73fnEnYvxJb2lkeYisczcgMZkqg00mpBlH21lVTxYZkn5cPWbja20+C7JgjebjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351946; c=relaxed/simple;
	bh=QaVcCt7Cl7nU6VeWY+Vur4I+1RuVSN+tC3sOeWr2eqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3SrI1kzrh/N8K8Axr5ALjLzdv8pfmqosc4d/xouEb00XamEgDAu6PEAkLoacgcJd1Fq1cqeKjYq4SnxiDHg1yD5e8Y2WLqyL29FkacZZUA8tzvyBZrOEwceJgeM3kLiGJ0h74dbUCKoXXn/ih04jQ5VzX54lFyFA0flK6eGkTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Je5YtJ+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMxhH4OD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Je5YtJ+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMxhH4OD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PE5kER3627535
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p+LQPvJJTeU
	1GNlByxbclHTDDGT157UOusSi7k44uBE=; b=Je5YtJ+ZLvxiFAY66mMnDfFDIQN
	R9qeiE+x6COa9tg25fml5sOLY1QiFg24hhrXIruKfUNtaKbitUT6no5g0XOTJOcB
	EFcm6/LaLj3XVn595RsvDa/Afmkmw68JlIvx53aBg9smhjQ92PhP5ZTV6tDmqr99
	21njqzbQ9k/Lpvo5QnrpunBoc4FaTYMtv0zGxTJl/RiTfBOjIsMnWiACLxLUeF8L
	wbVas0Rf/I5utcdI3brpB6B+TY5M/+QWQJCNYcAjE3hu/A+sNeN/qyXRM36f8aVe
	LKgfdh8K5Ks0+olNeJw6im3zs54wUQhAvbbMJ93Gght8pmCmfSMFmLMgNHA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq3a3ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:59:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-877ef1457aeso954420b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351942; x=1790956742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+LQPvJJTeU1GNlByxbclHTDDGT157UOusSi7k44uBE=;
        b=DMxhH4ODAamwNSj02yc5WXAbLjAJPecZ0rmiDaTFbWuv0d318s04F8/Yn8gRWjbuiR
         FAAlhF6zixn6QNpLbcJKfKa/0oizzipvELjrvotWJr8YdzOpXL0InzbLgyn7uFwm1tQG
         Ogl7Kt9po5cqDesywuqtURm3PqwVkaBAsi1/1PVmeDCDhNhnR+loaAFxzB+BMJCoV7gT
         dSQ1bDSwl6rJ3G6lJ4OOGs7zML3/w8mmRu7V6zENRYcnPzbuTNxmvHk7tr/B2ZS+9ZM5
         +QPaFJZs2jxQefPM/sMgaKfOBfT7xc6T91++4Dgb4zUE1NAitU784HIE2wcB6PZGgjAD
         Fm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351942; x=1790956742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+LQPvJJTeU1GNlByxbclHTDDGT157UOusSi7k44uBE=;
        b=zyayaJ+xG8Uym16sphvq/rBcL7hWRxGvsYciu9mcCuvZWbW1pnWk/sC31V6Cg+nIqc
         TdyktnmRepF5mFVVhu8mMrlLQPblZauBr9Oegcf0r2uEaxqfzhndkSiPaBD/m/NKkgAi
         8OOw4AE3rIyPhC+QCUZfBj6gyLVJk361k1EJhlQC+dyqzhLvszHWEUqxZbrM1S1+wrSC
         GjusTFJJFdAQAxcpM4ruMcV7zqkRLKtVqBg6+GGNTPw69akJIvyf/LYCx30opyzynzxa
         2GzQ7/2YZvbMemwZr7aL98yHe9Zur7Lz2zSX408pAuSZLHbkeJX3hOCl1UNDaC0yRtfW
         EBcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfDyzbi0DhVl7HDDclJ1dMYOvRP6lriAoQItwb1cO4DVrG9enm31kt5/8RppXXR0U3YVJ2slFDyiwRz6Au@vger.kernel.org
X-Gm-Message-State: AFuF++mDalM1k+RKT4X+Vifj2VjBbV6pQIYueVBTJiJKXO6nfqKSNBuO
	YTcBJI2iOS2DrddsjVBvy+ImckfYf4Yhxeh16ggpfMWHAC4RylizyS0qaqfWE2LEM+sMFtP6P5w
	6EtK5A7eeH/h1LtwTEQwi2i0JmAMvnNSR9SlsXC/fkv0GV8iIC4eRI145P288P9u8jvqZ
X-Gm-Gg: AYBFou2q759nmVorikkbSvHSVCvZsCpUW28gtahlQJY58VzWv0iDz82JJRn4sJAKOIF
	V68GZHV0PF0QGnPF/8A/yaAb1JqB34iMY+qp+dtnqkNRfNV9TL7xnxQBPm4f9IynTq/IStoaPCG
	pUyU1GBMqK0SjMP68MdxqYJghDzowYfW1BKfBuGKHhEKmnKFDFT7KhW083/u0a6Fewt40KG3m9o
	HO/hJfs7ZUbruQTREqq1GlUu5aTcCrStJfvpyaCXkFKDhJ3udrNLTbPd0hs+JleZDq8eyR2Kkio
	X+cm/wE9a0zc1CCwG6dp62PzPn0LPWBjaJTkZ1ETGfvhW8cbDUPrEwLWwCE4oENEMZXIz9ocWB+
	PxojyMkdJdQ3BbxHO/yWomCjK5Zw=
X-Received: by 2002:a05:6a00:2a0f:b0:874:705d:f640 with SMTP id d2e1a72fcca58-87e9b89660dmr4973900b3a.34.1790351942068;
        Fri, 25 Sep 2026 08:59:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a0f:b0:874:705d:f640 with SMTP id d2e1a72fcca58-87e9b89660dmr4973873b3a.34.1790351941480;
        Fri, 25 Sep 2026 08:59:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:59:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 6/8] wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:35 +0530
Message-ID: <20260925155737.4161358-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX8+Q2Tt8UepUg
 6PXqBrioH4+15dZoa84SM/Rp3P0ucHmGDpN6iWC8UkFU5sjG5BZlBFD08eaR61AwvMi+2zM+3hi
 JXPh4sRZEgA7wVZFdEoPc4ElZNuGuxQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX0goiN7V0tzmD
 dKukPVKdbBFmdL3CbzmKX2aQbJHdA/u4Ow8r1aGahIXsQI8v6mF8l4K33EF/PGFNMc9cu+6XRrD
 tGVYU6ZRVGZVMljVdFr6n/5ODAMeLdCG0iKM1n0aNU8EeEB7QeYVmFg2jXln/FgQF3Kn8N1s63L
 KfrVqB4sQSByEA1qQXHeh6YBCDjKL+N0mBwflfk2Cd4o9sW6lC4nnK/d/znL7+E3DQeJiVAGZad
 vMAhlVwLrg66X3/7MgTdXn4XawZBlqyxzmsTq4sjfJzT2XN3hYdPOaC/hKK3vnnwWUYEk68YXFu
 dmBTft1qpJgRqqBR2gjIgve1sgppd8wQtuUlo9nXFFaTm0wxQPqRLuUsvGHBU93gXqwClKbV9fq
 wJr4srjm7q7xP3QAIYjcBJ8XBJVWTQaoAK9qXk/kapXfDOpE8I7pghJvNB+UOcRhok7qT2Mu4yc
 RI7nFJEtvRoRKocunWA==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab69a47 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=MUQpB1KlM5cd8qnWRq8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: -AmlogoBX0lOjPdX1qKB-pMWkr06Uuih
X-Proofpoint-ORIG-GUID: -AmlogoBX0lOjPdX1qKB-pMWkr06Uuih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063

ath12k_ahb_power_up() and ath12k_ahb_load_auth_shared_fw() call
qcom_mdt_load() for SCM-authenticated paths and then
qcom_pas_auth_and_reset() which skips the shmbridge prepare step
required before TrustZone authentication.

Replace `qcom_mdt_load()` with `devm_qcom_pas_context_alloc()` and
`qcom_mdt_pas_load()` in both call sites. In `ath12k_ahb_power_up()` the
PAS context was allocated inside the first `scm_auth_enabled` block; hoist
it to function scope so it remains visible at the authentication step in
the second `scm_auth_enabled` block, then replace
`qcom_pas_auth_and_reset()` with `qcom_pas_prepare_and_auth_reset()`.

The non-SCM-authenticated fw2 path and no-auth path retain their existing
qcom_mdt_load_no_init() calls with the persistent mem_region mapping.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 31 +++++++++++++++++++--------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 85360365aa4b..6f0ad29a83f8 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -391,6 +391,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
 	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
 	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
+	struct qcom_pas_context *ctx = NULL;
 	struct device *dev = ab->dev;
 	const struct firmware *fw, *fw2;
 	unsigned long time_left;
@@ -424,14 +425,20 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	if (ab_ahb->scm_auth_enabled)
-		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
-				    rproc_info->mem_phys, rproc_info->mem_size,
-				    NULL);
-	else
+	if (ab_ahb->scm_auth_enabled) {
+		ctx = devm_qcom_pas_context_alloc(dev, pasid,
+						  rproc_info->mem_phys,
+						  rproc_info->mem_size);
+		if (IS_ERR(ctx)) {
+			ret = PTR_ERR(ctx);
+			goto err_fw;
+		}
+		ret = qcom_mdt_pas_load(ctx, fw, fw_name, NULL);
+	} else {
 		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
 					    rproc_info->mem_phys, rproc_info->mem_size,
 					    NULL);
+	}
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -465,7 +472,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 
 	if (ab_ahb->scm_auth_enabled) {
 		/* Authenticate FW image using peripheral ID */
-		ret = qcom_pas_auth_and_reset(pasid);
+		ret = qcom_pas_prepare_and_auth_reset(ctx);
 		if (ret) {
 			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
 			goto err_fw2;
@@ -994,6 +1001,7 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 					  struct ath12k_ahb_rproc_info *rproc_info,
 					  const char *fw_name, u32 pasid)
 {
+	struct qcom_pas_context *ctx;
 	int ret;
 
 	const struct firmware *fw __free(firmware) = NULL;
@@ -1012,14 +1020,19 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
 		   fw->size);
 
-	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
-			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
+	ctx = devm_qcom_pas_context_alloc(ab->dev, pasid,
+					  rproc_info->mem_phys,
+					  rproc_info->mem_size);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = qcom_mdt_pas_load(ctx, fw, fw_name, NULL);
 	if (ret) {
 		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(ctx);
 	if (ret)
 		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
 			   ret);
-- 
2.55.0

