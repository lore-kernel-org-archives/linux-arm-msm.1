Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615968;
	b=x7oDCiL5xVwtlVvZV8CEFdOI3kuFXqdHs83OUJQTCZe6xuI0uQEoBhFCESsPahKIcFLX
	 6HGvDmo1WQVc3P3M1zlo5mnTWVrEgOXzd+e0BFEMnE6nf3zcEXEj5mC3IL35hBRyEmwVU
	 AxKEXZVaZRQtdRpU8W3E9IkmbDXw2/pApv1e8mMD4gTeSuhZW09BgCRGf9Z0432Gi24U0
	 5xKv7if4T9tT0UtgZhr98RQ75l0RclAAe3cibIW7J9RUZ80Y3c5ND1hdYQv2CLcApwniF
	 jGL3qB5oox5nULRsLtmnOhLuGrlOonrm52n6rixS+81bukzKRBU/vhZUy67/V24yDag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RbVliwpgUGUKqfTEQkEhVFK/hlI4aw9ogH4W5n+tkqs=;
	b=Ca4Tgj0N0kFgug7/ucE5ymXQ6Xxcw4KkUp2klKLUQ8pAbkGxudkb+fUfD5M1cjAUpBiE
	 G7kZlOun3VwtZ2nmqE8gINWgxYLNf3Hs/jlrbCxH4i0PUpn0gFfCGYSoRq6AAJsFA+g1O
	 w2pI9XYDfoCIGNqfmffNNbRXtzCl7MWVc3mzuoo/itMPvEKlGrVftjx6CQ3DUNee8D2TB
	 1cKaj3fUEBvW46EZzH1ST2IhpomyuwRSgfhyPIjyOuqgdivGiSSULwra8tosvUwvDCDzI
	 CNL2ovItCaiEmNfBZcrLWBbkxM6nzJEvedBZfAcV4Kq0/bdIRG4LSB2uJvknZHQ2Mgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHr21vnf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0t5cxAi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17013606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17013606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHr21vnf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0t5cxAi
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeKBE2160548
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RbVliwpgUGU
	KqfTEQkEhVFK/hlI4aw9ogH4W5n+tkqs=; b=jHr21vnfls6HnxHhomsDGQAfWvz
	MPSayghRdrQ+kCCgKAA+Eq2uBEIPLZlY62T60NyDlRlUPqWuZ3Zkz3CQchrx4Fh2
	2K0dqL+OQcMcdv6L0GaZiqIJESKymYSYLomcd61kU8D1/QuGvPegNic1bG/DGzIm
	FEi3bf3NgjME69crZ+7IJ18iX8AoDmVMpXKyc6/5TH4aU0zk3FGByxq3zoLwTAMS
	MAhBR+OtPwgXp3GaOMdH9rWl1rrnnGcNGXMhRKaUC+rE8ltXdQc15g2WI4WGZeIA
	EHZ+hT7rHZzaj0wRBv6pCXSVFJb7otUxogSs1s0PukqpnXQEnCzA4wnQ1lQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf1u3gpp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso631411a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615966; x=1793220766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbVliwpgUGUKqfTEQkEhVFK/hlI4aw9ogH4W5n+tkqs=;
        b=B0t5cxAi3AJ4+k5F55J9Qpn68rG0sfiUU6lB42ujllD7x11j+TxT8+ScM4ow31tjH3
         d//t80CHepBRKsziRv25LGlb5c4mXturFtozYy1Stjz8EbVViNjhtedyFWeo4kxA8ist
         waIYO4D/XypogwzDh9LoqoGf+/IrpyYdTOehe0T4c5VKL8FgmYjCKvyrQVE6O510Ybd5
         P5i3HbDjbJbBVy3nmpX5kbDmKs1a7wfmEJrnMExaIg955HevhPFMOCECT1eW1wca2OAT
         +gRWxfFiZkpVdt+HjYRY/kmyb8GxsAZBCk7XdpiRpDoFC/BgM/fChS3rj5t/KokMDhti
         +1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615966; x=1793220766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RbVliwpgUGUKqfTEQkEhVFK/hlI4aw9ogH4W5n+tkqs=;
        b=0SGJQ85va9/X+4PI/alpDAXHdNrhc2VY/nXBcbzQGLZ6gS/hYe9Lhyba5DALRUT4JU
         SkJBRyltw9ASqeGajGLK8kRRzm4oU59RDnXAg08Xkvm1wbMmL9x2S/Do6wvJBdZd82+8
         1/jkgRhEGdwHzkHQ44T/1Su2tEVNOhbv/ImnUu8U5GGND+GRGKTFwsEfaInrGGBzHdG8
         ZBto+BEGGfPTF0fefBM8d2zmvj2zaXPvADG+O6O1X8l94CCWb9LrewMRSfxBceHKjGdf
         sO1a/ojWNJn0s2vDQ3QSo8fLsEQgATBBYHHXq1eXq0ZUNWrkTyd3oGqERPlA7QmFPb9E
         xRTA==
X-Gm-Message-State: AFq9FYKMamtgOfGo5WmtWNqrN/1nM092Cut4xdQsbzs54I/Jy0TFyVVo
	v65lM0ZlczTITao7pERqGb+qNY1T33ZbK8sCAa1Kuzt5RTVC7HpNfLrLWwM5RzSChnltJJh6rlX
	ddoPBSwZ1RZemCptE122iqDanKrCTf4sLmpkfRol1QUf7CyLVmNiiSH6Nw09Y0+sS4niw
X-Gm-Gg: AYBFou1ELOO6oVee6IgJHnCmVvX1AyJOsQF0/vFplj+Re5UIuML0p1puj2fyvwU4t4S
	jw42i/PNG/vH3qYyeVb2wrNnE26ksLbiz9J2hFZ/DG2Y+oSKBlEp9wLBRjm0wSxVPlz0UCfJh9j
	nqAFLuiWZivGMS7hus3j2m1SV64inV/s1/gZfKdNcyH8OX1oNpvm//HMxjekKzqzBpD3j5AVqMi
	yyh3N4ZlJM5JlTR4/XQ3aZ66sQTFr2WxVOMY1E5HX89PBREwFf+F75GcIjE/SuGMjwdCG57Wy7f
	dBWUJX4DCS/59TVo52nGqs9+f7HLt5/ZWcm28VFPXD2MxOvTjd7JrO1UDyD2f7Z97bRGLHPS+FG
	L1v9CXvp9lDVWbG1BfSumwwxCqWGr+ct+cxO+1tjiSPZ7ygxX
X-Received: by 2002:a17:90b:4b0e:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ad86b0c3e1mr2570023a91.4.1792615966018;
        Wed, 21 Oct 2026 13:52:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0e:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ad86b0c3e1mr2570012a91.4.1792615965535;
        Wed, 21 Oct 2026 13:52:45 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4933d16sm962668a91.13.2026.10.21.13.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 06/14] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Wed, 21 Oct 2026 13:41:31 -0700
Message-ID: <20261021204244.67160-7-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S8ZMU4sP c=1 sm=1 tr=0 ts=6ad9261f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 9Bg69AMAfRiUv1Rfpk_JJuPpxVcGBDkr
X-Proofpoint-GUID: 9Bg69AMAfRiUv1Rfpk_JJuPpxVcGBDkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX6PuCQonEaE6p
 ju9F4TdUZPhhI6V8ehHgDkQcjxw+px1mpgcYynU+SPqIIjzEhrGB0HCRlaQlYYp9SJk+4BBahyF
 cV1AJbLfZrPED4SU87FkhEgkbjVHtl8QLQbOf5a6QuuM5jSNJ3y6Cdl4Ysom4P6JYKh9mLkRoz2
 Rcxwc4G4/PhLhw2YefbU+uIpRPSGAo/h5Eg1HkfkI0mnjIhK/o9IG5+/szDztrCc21NovRhTxVS
 H97dD8Vi2ozyUIJHOwem/cWlOcZrnWCUAOkRqpDHbie68wCdFNFDTSr3x74mEu2T8BXFVt/aBzg
 njwrQOdwNTfgHE+Fy5CZbS8QiXYQ9D5V2uJGcfx9rpYzQnmHoMI/XXFKNiM58i/pLQl+C3Fek4Z
 2ELvJu1BvuC34GyD71sOskA/2+x6Qplsgoi4sceiy6BiBnxPkZebpqpb8Saz5SXDj9Ojk+dDieL
 e97AGR8QAx1gG+r9lDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX/tNvz2CPIVdR
 eyUodGOegUEjWa1X3FBeJ66gSGiZXi4GiYG4rLbEiQfkd2svw7QjcxQNrbdcVQQiylMO0TixJ7p
 BrAm3xjfgKJRAeeoJjRsCxs+CPpyfFo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210083

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 8e91edf16ec2..795c16d88f45 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -370,6 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -389,7 +390,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
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

