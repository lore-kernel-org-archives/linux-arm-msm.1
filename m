Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305112;
	b=u8DjT1omnC1ngVGoDqWANlSmVDyLK201hWjvJ3L4q8/MD2INAJcXef7tkQrOv+vWBZdH
	 wPm+SQM8EbzLMmtAf9mWZgKpFfjghOve1BJ7tgExaUlg4KeVFzJ+wDFsyXD1fgHZwgpGn
	 ZjQXW+KwPXgq20skun6FDK4fDNAIE5myK87QwqErFlcLBm/hJRodOQHL97U/eEOwD4HyO
	 YEU22DgL6fKoIe6Jwv5kapOYm1ELj7tVS04UfG3TJ3L447WsrWOxoxFEcG47DQbCdxJF0
	 kbnxcIcrQW62b3Y65PlNifGZS81j1zj/DMJn5BnobnPZOfTdPs0eX6mYuGWRJsfPNQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8ezEVu/wf9LIg8Dnb2467LtGKEBxep11x0ghaaw5IxI=;
	b=SdxT7S/XC+52LomN9RtttGST2vWaAUkZ0feX1SE0YMEE+kHFrVQCUJapzVPxADhHvIHm
	 h/wiDZk5B3ALKfBe9j6gxKNuVBn2gQWfuzIK3n0NtRtzZxyhv75JU5kEe70b5sO6mCljN
	 H07w1gyHHsO3KB/Y8jfC8NW0gCasqYLTalyc00VPFKpL1PtP3ies9VV6/il36HWPuG7L3
	 NTGdDKT9CIkOTKEgW+Lk9xZwewFpBvsD8Kks5LhI9AsR3cQjc+mOt+MoLnJ0+I9gDd858
	 arTwLO3+cmvLRX/dik4Dnqebu7VMekN41j023Nl/X+gBv05jI/H9Juc+gzC1sDQsweg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EC7ofjzx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INAS2edq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E106D606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E106D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EC7ofjzx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INAS2edq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjQqS1656808
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8ezEVu/wf9L
	Ig8Dnb2467LtGKEBxep11x0ghaaw5IxI=; b=EC7ofjzxolr8nIxz3oLc7q8L5Hu
	FeKJc01cKQpzdfxSgPkfzno5pNxha/enC7hkjkhVqOghsoYPINxQwF7EZ61tZcJJ
	grUlU1LqLAaRI3XtdvqXqrXEyot69XH0zsdhijexNbss0imw2yov60NbGXGZiTvq
	5IMKqVJdWIxckG+7+sQ6hk4AVHLAgT64L1LSYB1QJH30IXNnJuanpebQpokiHtz3
	AWUAiEnqgJNz23l8iC7eVLl/CmfpNt6L4HldY7RoURnvnqWQynHAvcu6zFtjYvt3
	qsbw5Zv5ngO81pVdwO3vLukuuzTV/YI+/P03WTfR4oo12rMtNu9Dc7A1QJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmaunhhc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2038565b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305110; x=1793909910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ezEVu/wf9LIg8Dnb2467LtGKEBxep11x0ghaaw5IxI=;
        b=INAS2edqqGmxvCpEo5pRz6B7cJ8iG7XJygnl8XAFvQ1nnFVy/Sx2if/RP5rJ8FtS/C
         kB6RryV8N1gzLV6jZ5dRcC5CP55XapItr7q7Y5FveqnIHEyCqg1h5hBtTJ8EXSBJlfAI
         8e7CKKHXvPOpJIxVGcDLMosy8hbFvGdvoMRbWbtSAfTxTawPjbkiZZS6cnNcqvfqJlcR
         8tI/yz/odw+Jf79zjutufZB6qhm1uJfp0TrQrYoyf2PiRy5+Fx3otHlrrqdvWazabowy
         u+RcV1VOtdiOHJWTS2T7UTLMRrZtknLCHvHh8EihgF5NHRk0dt3I6XeiUmwqJqtNHp84
         HVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305110; x=1793909910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ezEVu/wf9LIg8Dnb2467LtGKEBxep11x0ghaaw5IxI=;
        b=op51RCa/Xsr2gVF9mDU0vfmarXgv+E+n5BOeH8hCdb/CzdGf0GksOfNmWuwsQ299UP
         7+vdi5kMbjFYr9JM9k1tRSuErgc8UY1XNrsl0JA5KIVnw1PZWxAeTCIk/4tH0Ka+yhvT
         ZlN6Bbqigfwai7eqfsRinXc8XlNjX7T/l+NGZFQTYl0A0FHwjdH2D9h6Lwo/QD4XwIbo
         EUXUFpvwEjypJfqrrgeefyXiGROMuGJb4R+Kl2FqXL7sZ+Z/k/cuNo2Mml3nms3lMt4p
         8e1KhzMd3pp6POCnaHdYFZjJBsa74HbLAmILm16KEgQVqKB+Qrxt/21MEZ4nQbnfO347
         +U0Q==
X-Gm-Message-State: AFq9FYK0iG7LUZ4WQ6jEcc6LodQfymsiXGhNQ4A8Glubh9ODSfgkShwz
	jF7E60JCLE8R1LV7lAW1lkq2re7zfb/fzs2zN0M7qY6FHEVD6mjmuj9rZzfNlr95wovP9prBDCY
	ATTvMaV+6fOndAaEpZUy1M61SKOceVjnoyiEaiWMGRJYG6MKcJk/1tRFgnVGS9PndDGGF
X-Gm-Gg: AYBFou0hN+vIYFgQw5Xm94VjfvaeDsrTRffk0np8v3x4KGlkbL/eE6Zm2z2UaRtEn86
	t5F1m7Ei5dCXEqJJreotTvn5vmuHhvn+pLhu0ttgOk0C+mOCxlA49vwCTCujepJUdZb1MHBvoc0
	4rcMAsA/FJwhk0/rPV4gvd0oq/Z5KVLoX/VVrpRezzHWUbI1PFY67545SdEx5L71q0eCkvzwfnJ
	+1X24ZDdZNmlpyc1Ne+55jqR4wnSeIWPfJhXOgy7BldYXAgavWcvE7yT0UzXgGiIdjlYZa5N/bb
	Ha/kxPndXo8/tpSpp7f7jJdLhibzwHEq8ErUzqEZDanhuuCFeN5r371MmJDy682GgZ4NkkxT3i6
	EdnonZmNkLpniaUVpzNYV+YBcVRtxkO8+ps1C+qma/ut1IvvwSUySSQtwmli/V8mY+N0izEyyPP
	DrkkJ0zNOnUkJPxnN5VIXhLQ==
X-Received: by 2002:a05:6a00:1393:b0:899:27b5:214e with SMTP id d2e1a72fcca58-8a9bed5ba40mr156460b3a.30.1793305109761;
        Thu, 29 Oct 2026 13:18:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1393:b0:899:27b5:214e with SMTP id d2e1a72fcca58-8a9bed5ba40mr156437b3a.30.1793305109321;
        Thu, 29 Oct 2026 13:18:29 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a98a2b049csm254918b3a.56.2026.10.29.13.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:18:28 -0700 (PDT)
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
Subject: [PATCH v3 14/16] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Thu, 29 Oct 2026 13:16:24 -0700
Message-ID: <20261029201730.151754-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ZrqMSt32-0udXhAxRB1SWjxbL-cxL1tT
X-Proofpoint-GUID: ZrqMSt32-0udXhAxRB1SWjxbL-cxL1tT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX0z7KCf2mlz7x
 QJ7L0V8K6EsY+4fDFM5plIIWnYebLRwNrbRGPm66MJ3QQUut9BstiJBTABesgs/gpxFDk4n+fsU
 /MoIHekWADjix8fD+oknVtO0FWwM/7f+7RSyr52AaCntlL8cRxKMP64HCgJwvGJxaXrwhGj4rq3
 94H3zZmP6bQU8v/VO13VfVOJ4cIu3k/Hna80ag2Ft6r/KAdwXfsLBfyOeWSnOkKYvqSC62fNET+
 DDQ67uxnDRB9AW24QYCTv/VHQrxs7mH3366RG9TGOQ1t+/pmtmoObNYLvFXmV3h/ek+/s4lJ/fJ
 SSautqpuIvKBRFql14/q3rkLzoY/wnjozgPUV1LsIPVGS91fpTb9te2MPzbG89SxXXITXu7HnJw
 Zu7DBwe3IoThAItybbtRVGlkU/D7aOJQyIj/ec/n+jVl6re0zc74K8e87Mwfr13pSO/CZzDaS7O
 +EuYdoZbwXdnQS9ynHw==
X-Authority-Analysis: v=2.4 cv=It2L47/g c=1 sm=1 tr=0 ts=6ae3aa16 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Dhg23qV5XRRJQlZlKu4A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX1mWn2/CriQ6h
 p8pKOCAkhHv5UgHLJNGKWC856xkQ/uXJFKu0yIOlyGGlE/U50mXLqZkQExWv3neTJCL/H4SCapy
 5wFyv7BfVq4odgEINquJP1TKFm9E8t8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290079

If there are not enough global CP_PROTECT_GLOBAL regs, we can use
CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
them the same on all pipes.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a6146372cf7e..1f8dd688b967 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -258,12 +258,21 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 
 	a8xx_aperture_clear(gpu);
 
-	for (i = 0; i < protect->count; i++) {
+	for (i = 0; i < min(64, protect->count); i++) {
 		/* Intentionally skip writing to some registers */
-		if (protect->regs[i]) {
-			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
-			final_cfg = protect->regs[i];
-		}
+		if (!protect->regs[i])
+			continue;
+		gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
+		final_cfg = protect->regs[i];
+	}
+
+	for (; i < protect->count; i++) {
+		/* Intentionally skip writing to some registers */
+		if (!protect->regs[i])
+			continue;
+		a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		final_cfg = protect->regs[i];
 	}
 
 	/*
-- 
2.56.0

