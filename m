Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615965;
	b=A7UEDZIDe9nDLdJyuD6plG39kvydoxHbJwzuZQ9JjzgVlLhGn8u6eWF60/BHRPFuMlAQ
	 kUU2SMV/06ZYP/KjJADA8AV+l8wqbEgXQvBu7zxynmHcVN38K6RZIA7WbgUXiUO+rxUmL
	 xbzg9wn7OTXQ2/HcB2pdPuvC8WIn7oAkCkbfq2nvahKE4oetMPmbuSTrtV0YNxO30BrGT
	 IRvjdb7DrviLBXhwcchEzBw5HdXyE7SCp/OaLRKBm/ojgec+XFpNIYOALoTNdm/oFkfIE
	 SLcktzoaEN2jfF5vC8CUOWvaOU/qy5GuA/4T3Q+qIXyotueLfjqh/hlyEPX4LTUDIzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
	b=5ScDMH8ND2VtnKxYbuwiefWBnmYt0G3O2UZ85SrIgr03AuDCTvCSRtx85KLzkzHnjGo2
	 ee4mNTxscvGphVo3h2C5+iZAikRFlNUtQn3P9GnhaVZvGNdKvb/YfGMnCZQA3Ev+CpwG+
	 TbJP2FxRowbS41u0TR2ml1xHKytddcZYKM/vFJz4bbp9Pzf0qyL2LHLYy0rUgDELfLMI8
	 YbxaiMlLjaHgAEl9aDbMOHtfmir5FPIWnJ35g3s0JNtLx3VHuhfcUZH5Hc9KMJPZj92Ft
	 s7vu/sVkhZdcF5uPcqjstvwPk7dkdgn21YJRq6jXBWIGtfrOsFMagopNhCmF9/dGj3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j8RRdlVR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chLpZRgS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAD1606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BAD1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j8RRdlVR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chLpZRgS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeUIP1360904
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0EyBq73M3y6
	JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=; b=j8RRdlVRjDiQF3pXkDomo3bZ/5m
	boEKOmUqNRzkpPAz2iq0gvRAF1+yng7ThA92inWWQgmJDhKLuetjY6bDNnYzDgoU
	g/ANetPkEQ2GLk6GL74a+rQHeRdPTbdjlBxrk2jtZ9xugkCTae4cC1GM1onxOBmW
	zuv8DvvU//6z5jT32AWP2M6EVTUTy0EsHDkWfsBqsNOtiKS3z4TzfK2VvzsTUlBZ
	VgSKPYQUJl/bvDOzrZBJnR3QXqkMtiNeTUZKLR1PMM05Hyuf3c9R392fRlXlzzVb
	RXxDikuuqk0oDQc3ZIKeHAvlCRRqYdWFnZXTgKGE7DxzcnX7lArtCiS3UOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vstw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so1118159a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615963; x=1793220763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
        b=chLpZRgSCCWD8vefpenoq2xLy81iTxTz5Ah6GE2b8hjWJNW5WVmgV953Lum28R2cbK
         TBcyp5vXTWEVsPyxgk1B4Elp0UI4iqgN2ibNAtSgXB2e7+hSvGppScMsxoSmLv//ya9e
         8ZFriF2c14/iMSz0/RYJ2SO26x0hrJdmx1XRL5iTcqe1L8NhZQTAvwzfSGixEi8le3Wp
         2+phEJ6IJYu5IaD/4OFM5eJfbs2tdzoQWMJ2ylP+SbIrIMOMg9t03VjTfn0COMiNcVfC
         LyWCpoQGTTZ+TeHU0iGQ1bIRKX4v+3jXqh7m7+so8y7Y7oV5WkssVFvLm82JYv8V08mE
         iHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615963; x=1793220763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
        b=cFTIyaB22qW5clRMHGSlLM8z2wmGKuw8lHLSZ7ntz8a6h3otMpMSrfb/gSpvxWjVoU
         bVdVDV3EXHRsf1rXN+NHZBu8/OgplRSaqgxnooc6ysGpDN7nfJ2ATPLI/lln7kDS4FIE
         6w001Malq/aTP9Hwop6PrXmiDWaraB5WqsEskVgnzckjIyVyHAKxTD6/cCrk1sHryD/F
         6483MwrMSDOrYTnu0X+4RF4pH7oYX2c1t/5PY0SR9d9Oss9L+4uUEOXhmTS7hHXnvWty
         I9mgo3npIqoU6UT7Vx7g1tP6x8DWY9tTyB07wPlJZmwqVEKDAwpo0kPwq4MdTsR1VBGR
         PgsA==
X-Gm-Message-State: AFq9FYLPAylB5+S1oGAmC2U5uTQdAmQHW81TtCqMJ+k8gNrQR2SYK1Ki
	GwtCyaoSpPAIvJF2535BXJxjw6d6yzyg0BR+AS9hnUfnvXpaN9aHja0PMi36awIWnv4iExmyVUZ
	aGXVNXIpfVqGopYza33K1dTCdwcSTz5N72bQHwgc8JKxKC69nIXUm5502/yZ/q5bniake
X-Gm-Gg: AYBFou1auh2Kq3OYHUQie/Giaz3t3J7vc4KaQdFG8dEVsKKQcBK9/L/fTDMRBPXSfHW
	l+Lstq5yoKwf6930D4I6Kyc+0NfTvDmBKO6HxjBjaEqlbyiOzMfTcQeznWqT8/DPv2RrFz/hwba
	YJqhwNUSRqcFn6R5ZJehc7+0+RZzRIiveob0+0oA1u3vhqIsd0lG2TLPPJIKW+3C2kd2E+AUCO0
	rKWiq7Ay6LpAY0mbPbaqogksMpTz/llfqTC50ZuSspW3Ef6lJA7ucc9mmGNfJTuqojFnknFhfkZ
	pLIilR3mQFaPUNZWafjlWLRFVEsx5vTmYuiEwZNDJ76NkHE63IQeoTS5+TQlxYXSlir9dIeN49y
	0TGRp2Hojojoz5fGBPu8ECBLv10mEk9cnqphs0XPzLRNHj3lLUw==
X-Received: by 2002:a17:90b:3148:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ad86cef016mr2623560a91.21.1792615962666;
        Wed, 21 Oct 2026 13:52:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3148:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ad86cef016mr2623528a91.21.1792615962211;
        Wed, 21 Oct 2026 13:52:42 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm996115a91.2.2026.10.21.13.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:41 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 04/14] drm/msm/a8xx: Export slice helper
Date: Wed, 21 Oct 2026 13:41:29 -0700
Message-ID: <20261021204244.67160-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tKtomTChaR1Hr-If6BzDv7vATshTrztY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX24lNNUhtDGbi
 YP1I2aUHt2qVHL3OK21WOdxDksznNQnBcKuAPVYZkEtw78avz6SgpzESoynrkJaDwBd6Req7qFJ
 f5HeR+8lzbTZ+ZnAsYgF8n1HhnjdVfQ=
X-Proofpoint-GUID: tKtomTChaR1Hr-If6BzDv7vATshTrztY
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad9261b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=HwyinNJ2ww52bJxqQkAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX7imIzuSFRjt6
 qxKXyQUfN8MUAO7cNgCUIE8WRGeB7TBtrMbGC0myZR3tLGhb0I0BxJuYlEa2k4Ra+Oo/1I9Na2a
 3NASNEfjoU9A4+pr85H00K7laBg10yEtY5/sD4LcBJ7JUC6QON973ZpyokdAymJsB5LQBQ4FC+w
 S4YrELbBiDTdeGfwQrTLvUI8/E2R8C8wOJ1LkHD5YrjBJYCVnGzmAIOfVMR7go0bT4ChEhLoU49
 FBCAXjwdRZmwFCxytXhaIpCs+9YWCezGULZn2iK8riACvTfOQg/0UbkI1wgh8FxM1VHG7889Fn9
 Ko239Ipyy8Z399g98UQPUqR9rgvV2E1t7XGL5LoukdB4oMwEdAwJYnajgssY+iEursm1h7SSLdF
 mO2fiQqdtJMDj+lII++wlM2LhMs/ri6vR0GXPcrjbWmRRPvKKi/1JGZdM/pLfhqCPhLDkUGkdFm
 Xyns8T7VlB762AJHqcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

Something we'll need from the gpu snapshot code.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 2a2ddba6761f..6b23d301c144 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -359,6 +359,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
 int a8xx_hw_init(struct msm_gpu *gpu);
 irqreturn_t a8xx_irq(struct msm_gpu *gpu);
 void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a0983e2ee641..8e91edf16ec2 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -127,7 +127,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	}
 }
 
-static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
 {
 	return ffs(a6xx_gpu->slice_mask) - 1;
 }
-- 
2.56.0

