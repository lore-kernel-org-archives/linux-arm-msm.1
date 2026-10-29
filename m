Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305080;
	b=aN0t4jnS9kwDYgYSUk+U/2TRqWj5142t+rgPPpTpOwGVjh2VNtWRsmhNegiSV32s6A0X
	 298LhgJu/KZrbdulcjtgccIRj0VEDRqRPPcKcaSQZdOWJJvwOliQd7DPgpEB+blFvBYp1
	 /PannZ2CMijL0C+yKWkR6FSov20BZTSlQEBkUGSfpJFVMR5+TLm7AmYxe8URgMSVKQnLH
	 6TImwIiT8zvsMwWfzxQSO1RpkVwp7Nv0xqA3Rq7nNmDQm11sfnywxMhQi+fhPkG1xK04/
	 RvO0L5sltYnCFntg1rZrhMq/gY6qA4PvbnaD5orqlHjx95vXhBdL9ShMJAodKOS/d0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
	b=Zn5kjK/k+Q7oMy3CUmkjBOQSQG5BOepIq/bxI3Xxf78nF6eDJvNYJIVt/T7hIBB2Czv3
	 5EieprwGCy0SwgVSJL+X6U6TrBz6ckRMkGmmTJurakoWJwOAJzSdbfPSOyO5CIyeeNXEr
	 ifj+Yn4MvnLQnsM3VW103hMTtFaoVA/LbpXhoH3LTnqnuQ5SI7yLZQwbqBEntASzC7sTL
	 B4TDXaNRn0CvJRc0naQnXyZ4G0+7dM36bHfQCi8VUDiy37yhGCGTZ4siZ0qXXvLEx/p0Z
	 ju0uomdxKIrXRn9c62w4MxVGIDkq2bTnUlsXw6TB6DIhNqvytoMOsna7XPirwSRESeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyIkzQ3y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fgJ44d3l;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E30A606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E30A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyIkzQ3y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fgJ44d3l
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJk9eR2105127
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+oVnjuYPbq3
	UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=; b=cyIkzQ3yCSbYHnDpcmxjazIyPdB
	mcPma2N5phCwcezKRESZjY02YApPc7vnJQf4/SBEdB7SMAucaKciuW/JLZMuvQ6t
	HlfrB9/+WUbIJWrYs81v03jZMoFpqqYBni0GymzGdG7lROR6qgHtIF8KpXRSumUc
	Vip/gszIFo4hY4xhIMEdsBIyGnwh2ghbGbBMeKVrtf5WP12kbrYAPjulfvLcgJhP
	2xetnQ0C+ghTCJKp54uQSldFLbQp8Qh47TRaTIyt8HBCSwKLjxozbqcMhDOiDSFF
	czB7zLdM/otkeXZuA+w4JIvCOLu5ZFBv3FOs/GLGAz+0Qp/b9HpHSwHlgVw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44qamuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2038188b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305079; x=1793909879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
        b=fgJ44d3lLPPKxjM67Md44DXqURPGwPg4J+6m677KnJgmg1KBlNQabtIfoZ10NF9sov
         fwJZXBJzQDbr338zH0YAoOA1N8vi6KYRdlVMjn1EqtPfEqt8lltaZDuV7egOEeKOGLHM
         ICj3zEx13Xs6olGqzXjXhKRm5Q/6uK+nt1B6+ndBzLCwR/3cDsnwmUJZ+KXXhsVEFxhl
         oVTxKQPrrivtPsXrFd9ULbkg8qZGrU3yXZZU5dj00pkHJCIKMWC6i5R7Cnk5tSa+ny9v
         pMrMMJZrLWAYnbwBG20igvx/t8bwYjIJk/YT6hgxbT2HYy3+0Tm1AEtUeAaWb9y1ieNp
         XjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305079; x=1793909879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
        b=2RGYm3JTdSMCK+B96YhepmqBj5fG+CxHJ3fJl5//a7PnuXZUHWzVACO2KoR5IEz/oQ
         a1JZmyHtL42ZhF2LkyvySVE5TkKaEx2ulFdkfhKOLmwkuEZqp19/vFWhRRp0hKL9/ov6
         YKW7PiQepUHMLTwtFXd9A+hrDTYTH0bd5vsSYwlrXSpJKKEcAiIXPBwBfBtjK43mEb86
         sRll3bz3rIXiqLsfT7AL0HNEiw/2dG6UPDQu7pIlVadIC7fcGGKiZO7iSvcgxwQl8/75
         MQCcDmW+9mAgyXEXKUcH1vCi/dW1JgdnnJ8abCpsqCbwqRJMpoucNIRUzgIDkhI+oY5q
         zZAQ==
X-Gm-Message-State: AFq9FYKu5rgua6ZlWWnKCmT6b5stA+yh5WlUFYNozfQRVxJihzLe1zuM
	iz9sbCDUhVrNlygSrmsWcetjvdVVVOZcx5Pb1hVEmXC4TXqSux/htXZuWBDlrSlnKse7ZO5vvr5
	TopUYTBjgYDDVqVHVNAGgsyXpR0ZKsSpBTSkp40QEvajjAkOgtfcKKbT1M8SNChcMP/Q4
X-Gm-Gg: AYBFou3PGF9wCy1M5+hZUE2AykOm8JlNnKpevM39HZ9N+35unbz0bJ+Z/22RHFpjfVt
	GksHCwCbRa4IEAOG14ehrU2BNMM3wiNdwC/tiuY5gEVMSzPDNUFWfFT0Z/3w450kj3fC5APqcxh
	K/i3W0RMgRiRjs+VMB2nwsqaM9GatWfcBnuccF7uOmTxVtIC8kXNQvzsp+IxSdlxp2cB7lPqa2g
	/nCag3ORvg8pWNNyHmc33hYuWSBXjfAvTsGUvrdkj6Y+7jw335L3fhMaH+lSNDTpWbiFlrCtEWM
	jKfrv+5IcU6ZdxbQ9W8X/sw4LJJQKKzOcJm4gZcuNf+ipNqqZ9n2Efj8Y2DPPJK0tOKPK2o+NYi
	fTY6Bfg6dUU552d614gAs6FOpRTpuu84F0/D9fHISPUdd9Y0sZ6VDC4VjAsBDKa1JQin0fG25th
	WxV/Aqp9jm83OCOWeJPL/jM3w=
X-Received: by 2002:a05:6a21:7e8e:b0:3e9:f2f:a6fd with SMTP id adf61e73a8af0-3e9287523f6mr297178637.5.1793305078520;
        Thu, 29 Oct 2026 13:17:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e8e:b0:3e9:f2f:a6fd with SMTP id adf61e73a8af0-3e9287523f6mr297150637.5.1793305078023;
        Thu, 29 Oct 2026 13:17:58 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb05474fdfsm197528a12.11.2026.10.29.13.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:57 -0700 (PDT)
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
Subject: [PATCH v3 07/16] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Thu, 29 Oct 2026 13:16:17 -0700
Message-ID: <20261029201730.151754-8-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXyi4Y6AUngoAH
 GWhSEzYLMuGsZRoTB3BznNZfjLTWu5KYpkMGXQSH9EG6mqAG/VhpTKFSuJM3yaB2eYaQwW72vuM
 ZrRePF9etqTAwqKBX+HGleb2tmP3rbI=
X-Proofpoint-ORIG-GUID: a0WhiDiIS7XrL37tNaVdssN6jv2GD0_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX/iH3HvGqBTYk
 /DHPnf1ePshzfhtNkdiB6Vz1cFj9mXe+oiPrDjRRzkq7qjaMXqNXtbRAHnrqxwXs+adw3Hgtpms
 n+DkG9yCxiGcTWO/oR8y6BkohcpY/uFFnoM9Qy4chysrvI2XCtOdeXoJ8nQYSnmEJzuxO4rlYbc
 YSRu1ENxdOPAksxtkLPosWdZbgMcACammiNkzlihRG7/4g8xLwig/u/6R2Nl6rLkp9zwbwwyrFk
 pg6xzM1PpFMIh2ChcVqmmWAIFugzIdgZZbxZGhym2ypvyqeh0hVsDVJhEuT/mwe23y/raEWmckS
 3kcnnne3iyKKAp8b2PZv79JJgLr0Fgzu5+sUFc3BRM4qrxyabppKUTF2BSJ1z6F4yIttVLq2Wr1
 8fhqMxWwwC9Jjbj2G36W/1HjsFNkTqMydU2AR8XVG9441eBcum9dJ2dk8Wr+AAjwMR7GNsTRQpB
 h5YHfDOAF+t/R9EXawQ==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae3a9f7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=b4MSL0WmfgirtTH71F4A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: a0WhiDiIS7XrL37tNaVdssN6jv2GD0_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 795c16d88f45..a6146372cf7e 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -367,7 +367,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		  hbb_lo << 1 | ubwc_mode);
 }
 
-static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+static void a8xx_nonctxt_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
@@ -387,9 +387,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (!(BIT(pipe_id) & regs[i].pipe))
 				continue;
 
-			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
-				*gmem_protect = regs[i].value;
-
 			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
 				gmu_write(gmu, regs[i].offset, regs[i].value);
 			} else {
@@ -635,7 +632,6 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int pipe_id, i;
-	u32 gmem_protect = 0;
 	u64 gmem_range_min;
 	int ret;
 
@@ -716,7 +712,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
-	a8xx_nonctxt_config(gpu, &gmem_protect);
+	a8xx_nonctxt_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
@@ -835,8 +831,8 @@ static int hw_init(struct msm_gpu *gpu)
 	 * GMEM_PROTECT register should be programmed after GPU is transitioned to
 	 * non-secure mode
 	 */
-	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT, gmem_protect);
-	WARN_ON(!gmem_protect);
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT,
+		        (adreno_gpu->info->gmem / SZ_4K) << 16);
 	a8xx_aperture_clear(gpu);
 
 	if (!a6xx_gpu->pwrup_reglist_emitted) {
-- 
2.56.0

