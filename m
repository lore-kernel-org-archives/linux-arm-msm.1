Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114915;
	b=tSfK4LkggLcKpWNGpoEIBQoNb3+xsu3+ihf6Su8MX9/8Rc/c3Jk+0na04X/moqy9kkXk
	 w8SaA0QKwxZpc92uIi+8a84mLO4smHh/lO08aaYq2fix533VyyIvObUWE3iWRR79J3awL
	 GRoJxR9DhpCBWdyIofhMmm6LDeELiNxpGDilf4dYmdll0KApaHhy0g1Hs4c9PSv3MFmJn
	 G7lKdNsNiT/nmNSamN4ezjkRt7cCccWMU7cGWfp/6B/SnaiSDO+EtyB/4755u7VUfepkf
	 EXWk25vF8uWPR0KA7O/epfp+gprzDAJWBd1MlgBLJWy/+NlHxOAOmbqR4pzRu2/LyPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rWJwiQL2/XFLm3h5+bxetGJ+ZPFcBnTK0gADMZ2ejbs=;
	b=dlloE9Sy0C+2jaMZ/7KKKE1s6ZH7Avi05uLesanfbBMRPrPIP1hsjIXeeAIGiYeB/7xg
	 5Z9x1IX324nQA3VDFMS7QEwdAFNEXl6Pfp0TkPDocV7XCvNzZV9514fqJmM9lCRZRSL4M
	 HmSWEObUYxplGLTEnMCw5AzjFvLcVuRvVnpuLtX4o4rPA23OvszQnJy0blypbQ5jBEqnC
	 4Tpeu2ejPEvZFrArpq39c5CdyUrsopb05zFQoLxXovxBve/mHKLY53i+DET/RWydtQu9O
	 DNiXWcatnAFJ+jVuFWTmzjun0wl4ylWhSw//SQdcQM1VV2ZtTPfOMhzuABcUwWJOTRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qge6OcY8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5BJbzX7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF4D60A262A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF4D60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qge6OcY8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5BJbzX7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL6XC1522036
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rWJwiQL2/XF
	Lm3h5+bxetGJ+ZPFcBnTK0gADMZ2ejbs=; b=Qge6OcY8n9kSqehNikiFwmdi56Z
	BWEWL4C6y+D9bNAmQiufjrIZs+IxdGHISmUjApkeOKONT6UEJusp8TaiidQ711aG
	A5Gpqf7YerUThimUk8VVtNHrPpBKWw6z7x7SBgaCLG9zL0FoZVsBj+SoX4Bsi1rX
	n+lmxLznfKlrXYDXW2sxBO2yssxwjO6KqR2zSQz0ovJ/2VrVEVRK4+m2O9CzTLqM
	U4ym0v8iUi/mjOtqgDoN1MVV01Sd+aGRLlDwYwQvaQmb33iHUl5XA2qVs2jdDrRk
	rlaLe8/I6rzkI7vEnXzUEFaV7ZMEL3O/gSFWe5+HRBgrButVrtWi+4t4KnA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux98sww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso10597a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114913; x=1793719713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWJwiQL2/XFLm3h5+bxetGJ+ZPFcBnTK0gADMZ2ejbs=;
        b=W5BJbzX7fwX/2tR3tkBC6p5whWO1RlLNQ/884xSOB2Dp9IJnkPnRHSA4xd6/mLknv3
         RiK28baSp6HRI/SpncvNO4G9PvuQEyselLL/hL4tnrzuqGR6m1sUhH2CPGTUgAaFHVFo
         EmbRdGziNpR0vZ6SvJhPzCiucNPDYowxVScedKiAV6dObVMzOGK7aUKd4gUImkLQllI1
         x445ZIFTVGmKcyn7EDIualWSe3XWgTU5/5JR0hqVIGTPBg8cGA5/rFQXDJktVr0XyAHu
         quNOiBGShLuUH2Ef4qDzEdDErh3tcNvRAWkO31Px+rhIi3YsgaEMtuwf1eNEnxrCVA4m
         xu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114913; x=1793719713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rWJwiQL2/XFLm3h5+bxetGJ+ZPFcBnTK0gADMZ2ejbs=;
        b=Oyh13MAuqPOrw2n+Hsl3EJOpPmGC5xSuorUUJrOlhkk15z1JqPPf4sn2eltAp/wmca
         0blVs6L/d0EpWlR+EOX0zoHzFId8+TfIRE4EC6vWrXWPRfqXAz1X/NR+CaifmVEXwtcy
         ipWOmaVozeagoLOtygNMMlmIaPQ6vqYx2o3AePDLUnp2OZd9xT1ZMlJfY/w7lNfG2Q7j
         KVQJ/frLpuourDN+iFbA22efZQSGOWeLjDkRrgobIwQa84pb5eK93ub355P4N1r13h+g
         YLyvnuSW3v1HogqojZQeU7CwB5JR1TFbzLS4t4QO4P0i9eY7W9zq1DiKjRnQQMP6qOXL
         e67w==
X-Gm-Message-State: AFq9FYI/prib0tcwuhor58A+xoKp14di43SeLPd0dtFyotoMoQKG9c/e
	B8snJo4e2sWqP5TL1V90Ic+cB2Qc5AehyqYWW8sqKZdN7wrNAOtYruI3VA6FGmWQLV9PURZhCFc
	OFU6kUR/ZH/FXDzXhNOK+oeORrYmNZhm1S2kiGkV0MOsvoene1VTSsmvrr9kSBzPIQwLV
X-Gm-Gg: AYBFou3UZ8gACLWOucZXDCDjy8/7GhCSkX8ZoN1KL5h16UZG2osY8jEKVNF+RiCdr0p
	3PeSeDK1eaZsYiQG8rbH5dka1rZfN4ku7WVCZ6FYk5Bve3rH2uqVsNLurU9gLQACTn2ysDEf4QR
	NpuyDsLT4ivlqlaynteuzdhYgCdUxgU/UMAKQYnSfUYWmX1srtJUTjuypOFEJ6NxoEQfn4Eg3/M
	VRLIty5+vrdZU0nROtJ1imZMa6dTY9hbtJRzsy1fmxTToIb1xYtkypTJwDY8GC/H64G9vW+zNoY
	aitEsH4bLk1P8d3+FJLnJOOZBnQOmQ54/EYvca0V3d14R8lMdAO8PGF1EpPPxWKLxFxvJFHcSwZ
	r+HBz8+DhYQYD5I6wOKCmTaf25cYs7qmVhoBJAywZgiJ/IJZUCw==
X-Received: by 2002:a17:90b:224d:b0:3ac:a1c7:20fd with SMTP id 98e67ed59e1d1-3ade9b30a3emr8433514a91.4.1793114913266;
        Tue, 27 Oct 2026 08:28:33 -0700 (PDT)
X-Received: by 2002:a17:90b:224d:b0:3ac:a1c7:20fd with SMTP id 98e67ed59e1d1-3ade9b30a3emr8433490a91.4.1793114912711;
        Tue, 27 Oct 2026 08:28:32 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4064f4bdsm4256128a91.11.2026.10.27.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/5] drm/msm: Convert map helper to use dma-address
Date: Tue, 27 Oct 2026 08:28:19 -0700
Message-ID: <20261027152821.51144-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
References: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0c322 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=I_bc3XnsTyL_mMZFCHAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: nO9LIMe9Ex1DxA9mnhTUxg7utih9Fqq3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfXxb1ZHalKzPzx
 7pqpknfq2kJbc3G75OR2y2dDhQ76ZUXcGf9/6mAKfeIPwEfRRFSSkOf82NtMjzbQkEFW57RcLkz
 znsPbvwu0AImoLWY4VeC4a9rqMHY5DoOl01C/B2PfWGZ+nwXx3Wm+MQcizHDEoCZNOmsL90qQjn
 OI+s5rxBVt/BV4oSkfpHrtwkpLnF3ke8q7777DWRfb/CCH5Une9GSPFnVAeChy8SsOZ3eO9lTDq
 Uc7iFvuQ0Gwm1DytFGz6Yh/FG5FlwBLQKnceaSrDD50fC60TUaLTR++MyzxKuAppXVpIQ7QQqou
 uOfrm65XjwivmGCbBhEUnNV4a/htqjxS4jrZ2lbyUh6sS6u4bdXJyLVlhQqoWGGHKSrz4oAswJM
 KbjzvfAn609i8MTQMzSwSFrnceyomLmGVbnW1NN8LED0gcKWHXyS61rOBnpGY1BLjWcyEKo8Y4o
 cvywiBr+NjTYSyuljGg==
X-Proofpoint-GUID: nO9LIMe9Ex1DxA9mnhTUxg7utih9Fqq3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX6Xidrpt0JKgQ
 XT2knnunu1YEDKAV4907AMKijb5tqwsiPocZtLsKaYKsS5IY1eh4jnPMR0qs0Vt3KF996lUoeQL
 wq6hWeS3PjZzQbwslUJTkFywq0ebi+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270061

Now that we have everything unified in one path, switch over to using
dma addresses for setting up the mapping.  This avoids issues with
CONFIG_DMABUF_DEBUG stripping the pages from the sgt.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 435736c8d715..6258c942e66a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -148,9 +148,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
 	u64 addr = iova;
 	unsigned int i;
 
-	for_each_sgtable_sg (sgt, sg, i) {
-		size_t size = sg->length;
-		phys_addr_t phys = sg_phys(sg);
+	for_each_sgtable_dma_sg (sgt, sg, i) {
+		size_t size = sg_dma_len(sg);
+		phys_addr_t phys = sg_dma_address(sg);
 
 		if (!len)
 			break;
-- 
2.56.0

