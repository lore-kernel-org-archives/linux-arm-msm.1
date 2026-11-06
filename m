Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007369;
	b=wczdrKAZ6bH4k2SdtXFqRbI4ppZaN6ApKETZIyUbCaeB88aiZNJLW+O87Qn5pHsxktxt
	 YR0vxNz0qE9cuwodgevH3dTOBCv2d12Qu0giPMYC9BhdDmt8kMy6Xklg5odAKEgHp/5Ew
	 sHW+5CEbjBtkbo5L8UGWdonn5k4pRkKYQYhCRwYCAYzZ+OeXrzTyAlQ0YZ9/JV82/Kee0
	 PJw0CNCCynYvS4Eky5URKCtjN9xCloKOuFeAT+H8gudG9msfHQr1Y9exGvB2HbuNxniYB
	 ZteV37L9aUtkLbITxvvWt2nCcRvEllPupRRMY3WpOJcbxvIfKREE98YVYMipCRL2hjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
	b=IkvqH4+SZsCrlw29AK3o6nIQqRJI7fqJbENbSWe4LOU+W1PFeA9wOfnCtGb8OpCsgNWb
	 q5QdgeKEU2tJ/fyRU6AhEoFx/b2ef3H5XxzIsyS0uvi6oqK/CTl4XDvZ6mwQNSyFZ4m0e
	 GKkkLSsntK77ALaIYMrFdOTx+8fOD0NNnxsSoRLJNhB4i14h3uw3GtPbxYlyQ6FjdavED
	 WqVQHrvxA2XBtyff5jWTAMXGXtqSbvwhMOWYUcQdDbup/nZ4fnqAglLhl1zkt3QCFeUeQ
	 7t11KyOzoy13Nz0kXEVC71WEjEyipKkdz9y26c90zlT2LYUxLzBCqjd5sKDj5Tq9+Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DXvajpiA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DuOJ5vPd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4604606D812
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4604606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DXvajpiA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DuOJ5vPd
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoRds1105095
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=srWWDrFCDRP
	ROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=; b=DXvajpiAJZ8KK3v7j5nbZV3MxHh
	vWzxQvQNKRb4S5U5aBbbJd3LCIob8sLwzn7vkYC/rim/0A1L2cRjvGWMBnRPdTmE
	LsJc8IflLn9JLm8ornSuKxhqI404CwO02EaO9/7CdKiiWm4j86R67d5Eu8wdqTcZ
	cjT95H9YvpAj42PDvL4w+JEgIXMx3m4ELtkT9/VL4V+c3eP2tK9JXzz3uiW4fifF
	45x6h/b9dLlZN0AJ8uaWqOHPbYpifOFetXie5oeF/PDOfHl1dtN9tED0bfP/eAPy
	5Fl0/9j2KAcdU5xe7VLi5myYR7oy8XBoe1F06mD+G5NCP6irY1cCtvnV5DQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsk3wh7g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:22:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso794758a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007366; x=1794612166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
        b=DuOJ5vPdflT+qoyGVYuVdrCN9cHVAUfYcTJN4SCXpAKGlAK3eLvolvPkknWcc78tWd
         MOZKmT12wgDyvykQO/Sziun0JZfJsroSQZuMl4ATEFTO7eS24Bn8gr72FYxJaC9Cn4FS
         ETpxMA5u9uMUrUPMsBKkw/2J8Oq6VSepGR2KLXciMuEDisslu0Xfu2c1yMosYpJZF56b
         1TyozV8ALexe75KPYJxT3rG5YUNlvvP4CIlaF1JvWwKlIQacH1R6WY7A25apreEPTW5d
         xVFUCuLK/r1GExs/EP1pottKwwmFMrhtTL+KGz2rwDBrVKdThyz3mVX2YNuaEJnjD48H
         clmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007366; x=1794612166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
        b=Qg5c30vF8q/8JitUvj2dW3cSNPC7QF+GxTCr0UTuPa1VfpzWboplutBD5iu7PMstbx
         x/94YaZ8wLjQ1xJ/R11Q+yxj6E3ET79C/YagrAE7ExV30FNpue+Ac9rtrl2285dMEL91
         Ysl291qfMC7a9hx2deP0J74T2zXzNIzOtSoRVqub3v3or1l8tAQ4FFTvXW+y1o7ml2Q9
         KueLIDPWjWJTxzrnMGwbM3YP1nxfgdtY0xaGqa9LZNF9iZLRqbxBbAq9IzLuOilnXOhX
         Ym0lexrJwOHEVuU+knm+CRdny2Uj1rWMtYmU6YP30XkyA6A7oeWEuzTdGOe0uq9lXt8L
         azPA==
X-Gm-Message-State: APuU4Z8BVLtQlMc5YizCjc4qtI3wi4dhkJ4ZTDDaGYwdXymyeSptoQPP
	gpQlpHozfPmbhnV9VVK7tpihbI5oiEKnJ9YPyxsu36IWntdsBJE7VayGltIITKtOsGdTo6Ottc8
	RtKajV9CziaqEulmSZ1yw0nghCIeSWbgbuBzSgHDWWmCOt1u/GkoCuXPFYA0kBmtxW6ZpF/O3aw
	gg
X-Gm-Gg: AYBFou0DJQsaN6XWtxJ8ZCl0/eQzmoBM/+j1IAunWgQs9xZrgBtXirQRxm9xcr3miHb
	TxkC9ElagrHhT4WFpehZupomX7rxQda9xVTyukCyaVPZiL6hGW5L1LvXJ8W/A7xbYD1beEv5y6u
	xUHgZEY95cQyaqk2Hk/HzbhpkHbxEpi59X+o6dsjQBEfeAr5ECfuWoaHybmuqu1I9VRIDtucEsC
	tVR2VvoO7/cSUQQSceAB6/+3chc69mFXsExg6hnvbmmeQRmxpM9Qifcaq98HtuyFxjAw9uxA8L2
	5CPdpYf08/C2h/M1hstYtz+UnenVmTaMpTPYPNW4qtg2Zur7F2dthQwYnwP5DyFwDNq5AIGr0en
	YShy2sZBK9pRIe9+X2dWIeAAOU5NB39GE4xaVmfeEhmunXud6IZufHSHZWmamzFvdgcTT0Dcvbg
	hVatNTOZ7FtiATK+RXF4uzNUXJat5Zmg1RTwCYpHzlwu1V6EkuiEDo0Ui9iSR3gQ==
X-Received: by 2002:a17:90b:39ac:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b0db6f156emr3882675a91.29.1794007366493;
        Fri, 06 Nov 2026 15:22:46 -0800 (PST)
X-Received: by 2002:a17:90b:39ac:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b0db6f156emr3882652a91.29.1794007366006;
        Fri, 06 Nov 2026 15:22:46 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm1010142a12.15.2026.11.06.15.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:45 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 06/15] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Fri,  6 Nov 2026 15:20:58 -0800
Message-ID: <20261106232220.47602-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: TCgZEa3Ij-zkEyJ_1qfwbBWGxT7NA8Ju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX+VdgEUNDhfyB
 V2fTb7KBBA1kTggTbKhinbQ46G19LkAWfAL6+Okz5sGdSasvWCohCyLKC/6nSAM2xyt1V22O+S0
 8zgHLWeL1lAYIbHfnNNKadTwpJhLZHn5HNVIJhDYRRNGuMYmtZe6jrCH3U985IYcjZP3N7xO0HX
 Av2JX6XPe7T6edUPvuqPfeyHcHr/n1ZKMTvJnrh3lCuRJHdbao+2VtV+MWNq8UH17wLVl0t/sxl
 zWzhtuxBC0LZjs/Y6KERjs9TgiBRHEESpfh7+tIGjdCXBqGKAeRiRb8od5VlNL2m6JnWLOi5fYk
 QtRE1FXVw9tbgo021ULC4phJPvLWoNiEukwE2iOtht5WzhX88kLWBjs3GZR5GgrG12tnGjMazav
 Vc83Q/ry1obA7yt1SQ9Z1Tx6UQnioDe6s+2qiFDWUDAuvQmQkT34x31YLcmdBpRTIoNdQpUax4p
 PY3Q3B/geB698tWTKMA==
X-Authority-Analysis: v=2.4 cv=a6OlZkSF c=1 sm=1 tr=0 ts=6aee6147 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX+3juXRtQy94k
 spGByo5UzLjBf6mmzrUH3PlKhgvHB8bQefUkL/f/4R4qMSFGxDXbtPtqaWr1ZeHQORxNZTa3C4I
 yRQPOWDDWx/ZPGrTY6ZAIxT+Buh8orM=
X-Proofpoint-GUID: TCgZEa3Ij-zkEyJ_1qfwbBWGxT7NA8Ju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a29f8149493c..59898b49a201 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -373,6 +373,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -392,7 +393,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
 				*gmem_protect = regs[i].value;
 
-			gpu_write(gpu, regs[i].offset, regs[i].value);
+			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
+				gmu_write(gmu, regs[i].offset, regs[i].value);
+			} else {
+				gpu_write(gpu, regs[i].offset, regs[i].value);
+			}
 		}
 
 		a8xx_aperture_release(gpu, flags);
-- 
2.56.0

