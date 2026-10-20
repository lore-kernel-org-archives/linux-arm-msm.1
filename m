Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529276;
	b=lm+FOtn4LpMldOBpXRz4cCwMAhwBO3vIvdyFr7QoBXQTWeprPANerayB8BQgTVAJpBBv
	 Kknde6SHpcGwjf83NeqYmKu3ixWdl6g5dwXaoG9s9en5Mlu57Y7Ww2bkc0aZncy94T52i
	 ejC/oChhVnRqURKExyhE/yXNSKLGMSPlPpni/RUdHjOzNojd8h8tALyPkDNA65rwBC2bF
	 IzHmeWZgeehnlM2qbgRvIKYUBh+pSgQljfftVy9mTFQu2wAK0LqmzfsZH7msriNGbmLxD
	 WvakTWub+5X+a4wD7ae2uphZzlp2DVNLE9gBWsYWzIo58x8dtCaEDaaoiNZq2ICHvTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EkKOk7oGiQqyMwGz5IkcO9uuHyQkVlpszxGw/CqPXwg=;
	b=kzRUipYQ3AZhhzBaPFx4SFBoLIYL84Q4B1a1l4jLhw7Bv+yXdlP2nirpoNTvjC5cKNi5
	 L0w1jkXnKEczjOiqP02uZeQNp1AmJ5IY70a6m8OFzRXA6tBoIMql4JW93GGV2bpLjl+9F
	 kiJyIJLBQPA3QtVBuhMd5beSZFRN34Epbg/hY2vyTxG1O7m8bnqTMu2p4T4XKuP4yl1HA
	 E4NAzlf+yD7Kng7U6uUw2HTOT3Op8stuVq5W1z+y92gyVaAtB3uW2vHwTl28KRzJYJnKv
	 ecsytWZXzIgzx36Wm5VoCT1edSpd6as6jKHZ1fVr5OZq0xoi1Jo+lVDd5q7TxNZhc0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GQTy9lFX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKDFsICd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C12560A2615
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C12560A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GQTy9lFX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKDFsICd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI72uw1862574
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EkKOk7oGiQq
	yMwGz5IkcO9uuHyQkVlpszxGw/CqPXwg=; b=GQTy9lFX6oVhwkkX1aWGq+wyn63
	5myIWkcOcHwY0H9q9NizzdNMzmHXTQWNF6Q5DBCAmkTGsdjo5+YPF0HAzQJw9CVT
	QlqisxZE1x7nIjJ3OZ/9U6OVZZ0+UrEOYRUC7j56lYg+6xx0y6hkNauQOXkdiSvA
	Jn97NeYceq3HBo6Q6b3sH+xRuKaXTvJ9MMXelX+8HF871dZm2+ptCPefG5Tu4k1m
	nQav7qLnOVA/eZGz1OG+M1BkZ3cGVvoCamtw3Exw9XBGKIr8upgZdgvRCZJXQpLs
	/n+F5eU6wR3s2NAOfuuwAlFlo5nfAef5WSFndyQl+nGCwnVcRvEWBniI1eg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0ghh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so159120a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529274; x=1793134074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EkKOk7oGiQqyMwGz5IkcO9uuHyQkVlpszxGw/CqPXwg=;
        b=IKDFsICds/Nvg9cMgzLQJ05Nv+7YA95Fxaq6MPfX3/fT/FL60LZjsaHrBY05JFZ5Wb
         qKrMD7k1fdxGPTvcYRA7xt5P7hzWbZUS7en8vpaCmRYbRojgXQpUdSLcrqZfEYxPQZkq
         E4wnQPNtZmIwAzmL6PIVzD12NhYBBhL528GXp99xgAYLMy1zN3z+pK3io0Mknb3LHml4
         A5EZL3fXy2e7BndAv6Y6OecVGrxB5J3DSd+ghXzw852AoMpv6rJEUcfNpmrOaXa8RyXk
         etvOtEt2wDF7IoZwGQVor8FWAza/VR3wabv6+sEShHwmtG4Yh6z18/H78hV9sREKiLOw
         ww+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529274; x=1793134074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EkKOk7oGiQqyMwGz5IkcO9uuHyQkVlpszxGw/CqPXwg=;
        b=vSH7dzwNua8ndEZVkIPnNIv783hu6BPDmwxBQHPG3zAYiNI0HjgUVU41jgk8z1WOcJ
         wZsyeskjgzboG+yA9TPOEBDPoUG1mUgBapo+ZLGPFsjbQJHmXckg4Vfv442YD89zLv08
         +7VLkb4f5fZOkAB2eeuHsriOM2adN9dHXQbDHEids7TsRyPhkSxSp9o/zOJGdj+6eWf8
         BuCH3j2LjeKGn+gVj7nVwI17DqXBjZ59Qf3yxUJK7ErhlIeXxq88jpT5lnjR2dLboKTH
         myLKVe0OV99+JApW9MrvEtJRweNTTTA0mleWnvfRXdlckjMh0AtAnNPVHLaROt8JQV8i
         BoBw==
X-Gm-Message-State: AFq9FYKdfqnzcob9FqrWbttt+dUfN/BrCIi5ytc9q5Y1wziWv55+vyaY
	ivG+N+Mw0j6JDeO0IwAGNnwDxQ8G8TEs7gF6M+SxAVnCt9dqrUmrZfFZfJAL54LnVpUWgdZ/r4/
	g6uWg564CHhI6fbpU+b3dsQhT2fetAYTyd9ZpLNFrGyOcKTyEDigxNTc21eidF4sSUrrUOrTD2G
	GO
X-Gm-Gg: AYBFou2n9J0YHxON9UYH/CgJbVOEKJDq/jb2XC4FNK4TtR5adnBxWbfNBf+cLcDpzje
	wUf79ZnWv9B0dCV9RsEMLtL6MmmpfW5lkiWFSpyPY45rRNDz7RZUWMX55iumcv0jwclpvNH96zi
	FncfZJz95lznbALBGzEbJyNT9EAb6AWLqdDoRp+IQcbqDFtIzF6IFZdJH/WLrNkn434gQSSn9Jo
	7pxxKG4yAFD7l2w+qts89vDguMbCqRiVVIlZ3AQlyW0UGZq7dq73qvz6ddsfgN2XCmOP/dVKem5
	jHhOGpErvvk1N1Pbi3Se7UyM/nHU+yJTrxWSrrSPpr0m6VwTAuaeh9T7Tii9EP9N+10G/hfIpJU
	wdgeQAX/FkjQM/yKQF344kKFfdOIO7mskvv+aJ6bvZOOqczIeyg==
X-Received: by 2002:a17:90b:4fc2:b0:3ad:183f:5e3a with SMTP id 98e67ed59e1d1-3ad86e5b150mr93734a91.4.1792529274055;
        Tue, 20 Oct 2026 13:47:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc2:b0:3ad:183f:5e3a with SMTP id 98e67ed59e1d1-3ad86e5b150mr93710a91.4.1792529273640;
        Tue, 20 Oct 2026 13:47:53 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8030226csm1079181a91.12.2026.10.20.13.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:53 -0700 (PDT)
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
Subject: [PATCH 05/12] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Tue, 20 Oct 2026 13:46:19 -0700
Message-ID: <20261020204728.28844-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX/PoeWrvZ212u
 FebopXlNYksHGToBLzouW7XqgD7kJX9vGjjsL8P2Gm47iCdYXflHHi4hUSKH4QEiZ5yczIXLm5q
 JTkqvTRWECQgNZlJaIJC+WlD8C6uwsBe30T5GYhrFP6bxqmraX0ozS3NY3crqOZF6eDngZ2m+W1
 BWmOlkaIXZajUD0P62ubaey6I/hiWNM6FrNbOggxMekk4o+HbABOjGO+TmHE7ZqDlyMvQa0gPi9
 cFtF557/Nu5IUAROUSOG+6uueys+VYKr5G8QyLOtEGZ6z3I6kWDvvvZEq/uUxDtfpF/9dyXbr3R
 qpqcJAJSN7ziE8LzJ6QMTp8G8ut6W+oVzotNqrMaMIc1tM6KsQKHYLcnG6KXOHHKD4H25TACT3s
 qTKzF/L4/DWNOxJaBc2HcoKUh4L3z8oJWMIDdP8C0hXsKFSD6uNMcbb2NxcJs6SMXGhd7FdDGcm
 Tv2kVckdayEIe5ckANQ==
X-Proofpoint-ORIG-GUID: EDK5EjLJvgJ9dItQvjnAFg_Jc2HfJ-tg
X-Proofpoint-GUID: EDK5EjLJvgJ9dItQvjnAFg_Jc2HfJ-tg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX39M2hA5u4j/l
 spuz4A8hgNScjJ/I/p2NhbTA5PzBeM9lLE7zenfHgHNMEvbwgFXTCFKBd9EDjBnJWeSaTROs246
 z4sEMGJfja1PmIuKim3o2g/oAc2J1PY=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad7d37a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=b4MSL0WmfgirtTH71F4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 3e22ef788f2d..6d7982a117f7 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -373,7 +373,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		  hbb_lo << 1 | ubwc_mode);
 }
 
-static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+static void a8xx_nonctxt_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
@@ -393,9 +393,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (!(BIT(pipe_id) & regs[i].pipe))
 				continue;
 
-			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
-				*gmem_protect = regs[i].value;
-
 			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
 				gmu_write(gmu, regs[i].offset, regs[i].value);
 			} else {
@@ -641,7 +638,6 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int pipe_id, i;
-	u32 gmem_protect = 0;
 	u64 gmem_range_min;
 	int ret;
 
@@ -722,7 +718,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
-	a8xx_nonctxt_config(gpu, &gmem_protect);
+	a8xx_nonctxt_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
@@ -841,8 +837,8 @@ static int hw_init(struct msm_gpu *gpu)
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

