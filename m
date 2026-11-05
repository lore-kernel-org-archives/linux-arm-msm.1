Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911236;
	b=U70Kj80FBXC/DmCYf2nrUrLAlZNQbcdxm2xyk8dz19/ww9knbBfB5NE/psqLNN8VqEGu
	 ceSF0M2IYKu7eY7UM0pkWSyiNuvrNTrcp/HZvZOLwQcWdADNDZLLBPq+VkzoK1mP8tLSS
	 ABgKhH2QgYemlUpCxKJj6TbOpSS1xOKXVQSFQ+YhAjN1tD3l3J9n66x7Kyw/dSVawYFJa
	 GTpl9IDR/Rt6SgTQ/t1ekMjiCkESW8jhvFZhPVSA76adyYhmdq38SGE5bQJtXrFytqdH/
	 Sf9d/OKaDEhD8CNflBIZQ7cDV89fdgnIA2Qnr7KyeVHxq+aFNKaXRbwBaKn1+VLJopg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QFNvTKwj8PVEttRnGaTT/zX367b+0e2GeEloYfiwPaE=;
	b=NQDZTCBmDs2Z7/r9FVjtWFch1T7iOb7s3cS37Z5dIn87LoSk89sZynzIS85jS7ggZosj
	 RVn3LmRmBk2pBTegyr1TFXe/bVB4HWTNAVaOAFhjTvSyeJtox5ctdT+C0gT7PAhpnUui9
	 gwrK0aWqWd8wc3EpBoBqE+93Fu6yH5GKWvb7UCTalFCMZRJGlLKMBGPGBrIxkzmk+Ryud
	 lyNSAZ5mHyFvaorMkAsovOAyywFKGKteGyD6STXksqck62OgFDO+FT1s91y1uSK/V+qz7
	 tHHYjMl4A/2xRdu2F7aDAOvhW/TTc3FxqXRzG2LgNd3ZQfEvFBMjgclieA9I+KDadUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IfUFlIF0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e4NuOdT4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7A606EEB0
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B7A606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IfUFlIF0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e4NuOdT4
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeD5c1474580
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QFNvTKwj8PV
	EttRnGaTT/zX367b+0e2GeEloYfiwPaE=; b=IfUFlIF05D2STh+UTqAZIsMpUGw
	SraiPofKJppu9dZLWFeb6KFG8wNBdLH/6PyfxQHCk9TYYQHRRBKz38Dx0S2VYzyC
	kNI5yFv+mNeBAq/j+t3/j536cqZ1dNVE6Y6N5FCKvDgHs9fpC52wdE/VMFSCWohj
	Q7UjsBLcky8fSm50XCbXVY+s/4yhiJEPV/RXUksFP9BZTqqpPQTPlnMOfubKSVAz
	Bw/wwrLGVYWD3+xQBJ8h1cRYuoZR9ENXyLJ+lTK1EzufY/X2Ds7skwNjGUF4Dp23
	Pmy3mk7AEdRbrZwOChvNYP+Z/b5/ZFg43u1s25POyyJ+3kcKMucCQgEynAA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdbq5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:40:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdaf2a74482so1184700a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911233; x=1794516033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFNvTKwj8PVEttRnGaTT/zX367b+0e2GeEloYfiwPaE=;
        b=e4NuOdT4vAMjfXTUV5i2oL9/ArbHxcGutCLDKMupb/lm19jcc5ogYjMH51HQL8nS4H
         E/Su29t42QHrlT841w0IjVGE670XSTlbiOVoP9qHkADNDNu+h/CUgytS7WBbDYXHwpNa
         HHzXOH0y4KG1qE3ahUBUMQlGe6sE2HI+Dy126cPghdRFOpI5NRSaEGayvKx27C4eU7kE
         OBdRq3T9Ex+bcoQYzcM2tmeHpQ9fhI8yfnJZBZyDsWJyjEw+ojQScB95D6fiK4A8Y5z7
         hy6luuQ49Yx/TWjy2Tli08ADpuSaORb3N5pFnojZWCg+KQh2cx6xifrIaKOngba1xz9O
         2MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911233; x=1794516033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFNvTKwj8PVEttRnGaTT/zX367b+0e2GeEloYfiwPaE=;
        b=Gf6Y7Ikn4Ri1KUVPRpF7cX4TunmOqrxR1skIvDYcbIdaQiUcfp55XcpCYkwPC6yx0f
         08LuMRKq4cnD5Riq0ag70zn1b4txcaT9X3ItAd6tKWAPmohtW1RQbhH8HANP2py9Qax6
         PRzazQr362fxjmz4GJeLR7rHwqNR/8Sbl+QpyjIBOO8PU3JzUyjv5+ZPIVOZ6z8BwZo/
         D555c17YkKuEjGdtbbHvWHQPWzRcmpKbnu55EpjRhOvmMLCohd5Xa5F6f+j0WaELAnpo
         NPEtbjhQD/6AWoLtK92AmuJnUmdV2vN9CJXt4vcEy5A2GFiwsgfJMU9wW4OvpZ1W3XIh
         /nHg==
X-Gm-Message-State: APuU4Z+oGnUZhXkOcGFE3mxtLGTte0HElhNjktKjoVpyquzXufg7rSii
	1vf+9AxhgRtI106SHfjIYRM52wlUBF1G8NW13UoJDMpz51YPwtEEVJteKaSzW0/1RokqyWgYsdS
	nADIjtrf4/VgSknvGpW3694F+E8fkSy9UTaGYc7XO4JbQ/SO50hDmdmUvycyqj7MGuccC
X-Gm-Gg: AYBFou2eFzqs6xeFWOwsBZYhPo19l/SzFkrFJM1o8endZKC0yZ4EbN5GYEPLFEdb4Z8
	XbWLPrGLNrKEIWCyKCN7VAR1Fpzg7SXMBzEqiF7JfnMMg+FctPJHceiiuqww8Mwf9u62gaPQR/k
	I4NaEfikAL2Pe7H90Wa3czODM36JH0LXzQRZZMqESCRf+i2HdTgd/lcFRcWuyGrj0EJrQBN6uXp
	KfPA/q/ZwWHP4FWAxq1i8bG6el+MDPcDxzJeyBjn+lWhorW4pNfgg+nWkQu2Zw5tjJkGiew4Ip+
	u0WT2XSxXyYfVLKPU5N46YbVHEML/Ac6md2RzROLwtDfDOgNvAoILhR550CBp8NZsW00PBD9ZXW
	kfOM5POmL45x7n9pkFMv6JpZrGilRiEdEVO5S1T2cQzX7Up8mrRPD+tVfW/mMt5QlrJKtn2wIXg
	DUZBoYof5Ij5Brd5xes4FMsSRkmkdTKxFJp/zg2hBr57FVjS0VJPyUITlpjvqXeQ==
X-Received: by 2002:a17:90a:e703:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b0db6dfb59mr146678a91.13.1793911233138;
        Thu, 05 Nov 2026 12:40:33 -0800 (PST)
X-Received: by 2002:a17:90a:e703:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b0db6dfb59mr146658a91.13.1793911232686;
        Thu, 05 Nov 2026 12:40:32 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm5033443a91.8.2026.11.05.12.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:31 -0800 (PST)
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
Subject: [PATCH v6 06/15] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Thu,  5 Nov 2026 12:29:32 -0800
Message-ID: <20261105203057.66520-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aece9c2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: YM3t3nXnOqbM1bOxEKD1j9RFJesQboLq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX5PqeOlVpTjuA
 QMV/SN3GlrxPvIR9HpAA/qigoEkdfUYVFraILl3J6zkBKDulUKiQoiDrH1xA7ehBEizldvQcvwf
 WGNu71etCHcjUfUVf3OrVr5W94wBYyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXwFITDl3eXb0l
 ADWvjZEuQv+SCXbBUWBzZoW3GhuY0TEkKy/XN9jnOFcdSUxq+NdH0HQn6ZKIBomb0lQcgvTsUYb
 UGBu4n9t176X3hQTK0JOTU2Chxw8HpW1QL94m7p2C/QnZnOwp8MOsYnPsZRB8LXHtsEdYES0FCZ
 Mfczwr6MlDqab6kdXEP9emAGxFeT4rGo5pltBlR03Hzjdl4i+/kHbbsNEpjLHlvbhNX0LrqYCe9
 7yZsrts9aqIQDaNtqqJZGR64cTm9kyMBVIS+dh6+vfojscUGb+XEsH2itluQo6goUH3XzVyoWVj
 rxqX3XELbIq3B4OuVUWCA2cfGTPQkMxASea8ecdKEKMW7neqzxp4/ybEOnYMBMVrJHv8KDe5qGb
 yy0n2zjyxZFh+PhEKng5BqYKHn8gK0cMTrJZC7APZ4vBF8qF0wtsJ9K2XFFuLszCxcyWqJ27hVX
 WyiLV3PdQNcZCB3raBQ==
X-Proofpoint-ORIG-GUID: YM3t3nXnOqbM1bOxEKD1j9RFJesQboLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
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

