Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957E35DA7F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775368; cv=none; b=rz4DTQ5+NHsws6tLLP+jj/cyrYOv6CTmY1OZVKnnS8RBuW1fFC8U48ubPTeFHRIewSIdJwCDaXtzM9elmLNDGfdhoJK35xSurR5jbMbJfHlzzj0f6lFc/jOVaH539OLECOGy9MHOm24+V6/umHWzJT1jm0XDZVia4MFwiKHGG+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775368; c=relaxed/simple;
	bh=67T+j2UaaqerqBmfkIf5ha2iI2hIJXUPaaxcGjCzXpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qEJO6X9ptPrpN0PvSS6tvcsAT8JVncAOW3l+2JCazb2LpdqQXg3vk0+qm149HpsI/qWIF7BvAlR9mCQzk6BmfPoQq/qFtwOgiAjdDrUgVq8gnL+DYS1nnJ2HcexcK73EueaREGeswPf9hbchiRj4h5YL/HbuUpTgAMvMFY29JoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HT+x7s5K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRxixDtT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HT+x7s5K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRxixDtT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X71m2365286
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/A2BPK33hk+N6cYzrrKnqQx5oEu98QF1RBTx8l3A/c=; b=HT+x7s5KOM3iBrc0
	gyBonF9IRHHokzWtfZ++yrE/NAnrMytUQReG9W72MVOXoGNVAOXJv3xgA4BV/tUp
	DWg0DuDovZFi5nQbLKa0iffQ0ufEvh9BBGj+BmZFIC8gd00fimQE3Ukgua5y1pJB
	k9OzcsceFkel5SOVH3P0qFkoX6ZZceBIwaeYeRFDnmC8z9v8p/vhVjSEx9IL0qdG
	5YfEixNHmWXVR8J9WKAxe7kaljkoRzkOKyYbQg36Gsd1vrtxfEBdn5Swa97sdTxE
	dQseIy8XIP/f/Hmpz+5hkVhzzxgRyjWn4rrYmQkG9d41yn+ayOiRUDHQLgHum0X5
	nUNEaA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28vhy0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:56:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso177220a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 19:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784775364; x=1785380164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/A2BPK33hk+N6cYzrrKnqQx5oEu98QF1RBTx8l3A/c=;
        b=IRxixDtTuI/8oh/ixKhnH3gOPkKuBzLJTj941JKpYB8gk7v52diGze6IiwQl8+rbup
         bTwmHvXriL0CwesREROzO1Gq4r7cl21W9J7BTwIz+wTxuYG13jZJC0YCOvzwmwzuOX/g
         xmOYK84DdLxAw4Xo/WhYPfEHe6K47+nDFp/7eOR+jdVtZiCEF1w/9Alv0p0KrDtrmlge
         hsXB6wIAfxbTb40T6z48TbgLzASBJ3Cqhu22/OGXn7vV94ZIriGQNH3R4e/jPZxw7Afu
         DGitaamJ3EyyOvU6omuV30seGWU9YCXXewAZBRt03rKCATuxxCMHUtxcK6OuxwPRLm8m
         RG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784775364; x=1785380164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/A2BPK33hk+N6cYzrrKnqQx5oEu98QF1RBTx8l3A/c=;
        b=Md1kNttGRfgO911OQHAHyoyNt2hmW2QY2QQo02+10oqfo3LN20O75N7cu8EEnsWxFv
         K1G2VIWBGM6fZ/9FuleA+uazzCR+93trfVOxNo71V9JzLYIR3V0yNhfg7nIosSGKaX8o
         k0Z4B7eMJ3+m1MF1kPXUjU6bT5yj1Iz0stY5O9zbCDE/thnmVkR7HidZdG1Ic+ECEpqp
         KGccD47PzjrsAdkex/RxAxu/0XMvENEF8v0Wp2qj953v0mO/Ko1lnek0CBdH8P1G24vH
         60ZVcYhMJHwlZNnZvjOv5TalBvV9ZFY0qf3poUOa/xHscjAIbwQAWpSCsfqeBl8uEQdA
         FtZA==
X-Forwarded-Encrypted: i=1; AHgh+Royqtm7zwd3FQSRyPntw4GblwgeLsLoC17CMBrmECwIhAngFvG9hmhuGTim4yfAQ8Xq9deXcL/PsknMVyVi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Sf7XPn7DhbuNCppWnQARLiZLBFRanknYAFFm62wxoWN71YKM
	aC9a/ArhWPNDkzmC5P4DwuzQhwA3PRA8TKzJHNuIhI5Jf4FSGt7rOCvoDZhefoSqhGH9OGhRQVB
	D3ytGd/pkiJDfc0zUdKdYX4zuK6oHi5N/NZIHu+ydq60u4kLRFjo/xSbSPRx1GyhxWV6G
X-Gm-Gg: AR+sD11t+N8sC+Mn4wOCRpttjKA3aaTPbUz6E8V7sTRRYqJJRXHvnCSCKA60a7oH3jf
	jAW35PymluQ+VeNpDRkP/SqvudB+TySDEPc0yHgwlgPoMyyuFDuGscFLVH6rNqtfXN/ifAPidAQ
	bwEN4Q+s4hfsAvEGdDTbEqSIB2EBlRIZq5RZwp0YZio5chrMFE5X1Dwubwhw7HPvqJeD/xp3PwP
	2GeBuU9w0R+BU5A585eAofLHB5xd2ZpEa5CvkbAvmeJUvv7h0KE1TTqUdYgLGTjlvylGJddwq9T
	/7u8le+hqlvGY+H3w4hrq62Ibg+EY0bNsXDoe2d/RBA/n8iZMxqdbaKOcEMN9NshbPbe6nCIZHr
	oun8RTPmgeWMRFzrxR43aSPT0pi4auOSujFGaWD9Gx1XHetjsw9HaV8dowlUGn0CNpXMGmm56Yl
	8=
X-Received: by 2002:a05:6a00:3485:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84e2b7e4035mr1636936b3a.6.1784775364194;
        Wed, 22 Jul 2026 19:56:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:3485:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84e2b7e4035mr1636900b3a.6.1784775363728;
        Wed, 22 Jul 2026 19:56:03 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17262e33sm2233312b3a.14.2026.07.22.19.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:56:03 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:55:54 +0800
Subject: [PATCH v4 1/2] media: qcom: iris: fix missing hfi_id in gen1
 GOP_SIZE cap
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dynamic_encode-v4-1-5fd6bd549ead@oss.qualcomm.com>
References: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
In-Reply-To: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784775356; l=3363;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=67T+j2UaaqerqBmfkIf5ha2iI2hIJXUPaaxcGjCzXpo=;
 b=W+lJtvX/IEwTKMwBbvG7yvu9DoJZt2JOo9VXsO/ljnBqXFYqD1ZJcZ9f8r9gTx/+g35QikzhE
 Wft6NJTl6aODTrJ4mYPtIm45m6ei4xtpjB2EjqzUXMsdjtkow4tLpHx
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX/kNtZfYI2oNG
 4mDS3YaMul/WVLcr1n34ZyBCkWe/SgqsZdUPug09Gbhvjlp2ZDnxGrfyNKJTCZcUDmXVWAElnKG
 AxxIJXrOHCHDWw/h2Xp1GmOY0aKisQw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX70ixr8J8SbTH
 ieYE/XTtcIUQVtFkKTUok4g5VTxMgjUsoG29MnyhqhI12o96larLr8UcpLwonPm4KJGniwra127
 WK5Ag8vYT2qyFHsH6ESdEHJL4OZ4zX9rJWPb1ZYBFCABdrcf/ylGJcw6CynWccvpAsf0hWjr8JA
 ly5Gtzubk25e++qky9yMfJhEit59M0wqcvE2M1BVlCI0Eum3biIdAvINh8NUjFIrJ0+tp6kK1qy
 u6ZP/ANqI1kKqUug7KoepJaddPTDVJZ9JV3KLizXzae9Be+BD5A1HcCRLrFuZmJzbX9l0PuTolJ
 90Ts+46jl01m0wi3pEwwVjjD2wGfhFWps5oS76NvUsaoYWRcAlpwu/+3YgIdJr8wKDzQ6/uREb7
 nkHICvWjxHQWHQTlXeouKXGNN4wb2/KSSjdhT0mlwTHTbDvVboS6EIO91fzEWUnntXSOIsoZk0J
 10ypfk9rsAQL1lnvlUQ==
X-Proofpoint-ORIG-GUID: XVKiQ3nx-__kCTTySsDwhEp4UR0fqICY
X-Proofpoint-GUID: XVKiQ3nx-__kCTTySsDwhEp4UR0fqICY
X-Authority-Analysis: v=2.4 cv=D4V37PRj c=1 sm=1 tr=0 ts=6a6182c5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5DhQ7PjHRkpX_HN-Ky4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230027

Add hfi_id to gen1 encoder GOP_SIZE cap and replace the set function,
remove the redundant INTRA_PERIOD cap.

Fixes: d22037f3fd33 ("media: iris: Set platform capabilities to firmware for encoder video device")

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c        | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 -
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f60759c4f1cb17b5c95897f0e1468f..391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1293,7 +1293,7 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
-	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 gop_size = inst->fw_caps[cap_id].value;
 	u32 b_frame = inst->fw_caps[B_FRAME].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	struct hfi_intra_period intra_period;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index ca1545d28b5310d8c45a905287dcb69f6184d9cc..eff9216bb50143c0d752051a6400605bbaf3803e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -171,7 +171,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.max = (1 << 16) - 1,
 		.step_or_mask = 1,
 		.value = 30,
-		.set = iris_set_u32
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -240,7 +242,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.step_or_mask = 1,
 		.value = 0,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
-		.flags = CAP_FLAG_OUTPUT_PORT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen1,
 	},
 	{
@@ -281,16 +283,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT,
 	},
-	{
-		.cap_id = INTRA_PERIOD,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-		.set = iris_set_intra_period,
-	},
 	{
 		.cap_id = LAYER_ENABLE,
 		.min = 0,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc4521f9eacaeffb0fc08a180de3ff..ff48333ad089894c3393e8ad45903c2603288eb9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -165,7 +165,6 @@ enum platform_inst_fw_cap_type {
 	USE_LTR,
 	MARK_LTR,
 	B_FRAME,
-	INTRA_PERIOD,
 	LAYER_ENABLE,
 	LAYER_TYPE_H264,
 	LAYER_TYPE_HEVC,

-- 
2.43.0

