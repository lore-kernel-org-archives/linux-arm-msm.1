Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529278;
	b=DnkJQXmNL/1c2GF6kCnexpjKB38HSYUgQisSM0tfhN6Uwz6FQiykFh8fJl/udBBx/if3
	 wftfgx4KbXU+OycYniOYjT+NV+yVenP8WltFFa3dM4iPUkcbwScj7YtOUQq1SF2sx/xtD
	 +f6CM7TwxKs/TVy42jOW116TD68vbSaWSGi09AsUpJ91auOT9UMHpjlbKs4t+rbGvZATH
	 oMtIrir9NkmyrBjMsBJCQ5ykaO4b0ahL2ZjaInQaSGhx6+1DvzhXVy8lhECQhcbL9Tu2c
	 21GSmcF5aer0gtcyHdBggKkttTKLMLIorspeZVg0lr30HtwHOncFwstW1CyjWLvtKXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
	b=XGnjhUrdPRgbvYMlvSTJaXfXg+nRIohKpggKdTvVlJpwkXCwjJc0jk/cpH1bsr30Bs0O
	 BW1x+YjjRWf7DoHR//oIlcwxpy4/8PgE78Rnvz5Lix9zUfX6F0X0UKxGvvhh59vpWHjda
	 bigw06Ttdcz5bJyF+3MQw6ePQmUAZB9ctRf+XZXZHnk4cLPVbYBa8UVews3awHexzz5Sf
	 y2bzIStvm0VDApwFilYLAgww+w52a/qlSmMNVIQveKqRfcLb7Ch+v5BcUBnKeEZj5p10v
	 BUKqgot2d+9PpsUjtXmcvgd6pLNGUEfv3ajqUO1g9pFR+arZex8poHz1I4iZH74k7FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNdeDNc8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XFIIhtS/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E8260A2637
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E8260A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNdeDNc8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XFIIhtS/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI71Cc1862524
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocDu9x7a94S
	WPcpzxK16LgiMD4smeVd0t/ViadjFsRc=; b=dNdeDNc8GXRM7M8sFkBYIMZEaA+
	r9lhCv6xgWQLw9rIHRTR7V/RRVgjKVpC+HhXGMGqrSnyZCmtEb97623n+0Aohq7y
	evjAB8HNFK546Owob+djgpxi8Gvdoxsg8doOQx5981p2FlxK+7PdJ5sSI5z57UR9
	C722fXjG75szQaAmfyWT7soGrkF5ry2v5lnk4teksl5yj+Kg+hxbkdJW5IuQgF2o
	h+6FesyC6gqE3FmX1IGFCo2K47yzecuPSIxs4XB2OsgMZGSk1yZoMBYjQsc8id3m
	EoK5yQqqXWKN+H2+Ej2KTg5ik7j/vaYatCNz++QSXZcTq0FLTF2tGgcgH9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0ghhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so140552a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529277; x=1793134077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=XFIIhtS/3UiFDdFwby9/OTZkfXe5WlmNI/LcsCDn8+FQK77MlVZv4wF1q8qDGLZYHx
         eKUiwD22B7yVQAFFiOda0t3hq7Xu2Nmy07+NDfmXlsHz+5yiUjaWQA7bcZG8pR+ZTRi6
         rm8UAVzXkLruhB6osv0E2CgVhlN35GoLDLLG/9bA8S8wWBrRL4m3NcgcnqFp+3w9MPfc
         ZPWq5PBVsnQesKh7zyEMwUWeDAiPwUAP+Q2aYpQH6UrAAgtNIWLV4tmK7HUeTH9yQ5FY
         0JFteSforDcToG5YI7zN9flXLUs+So0zSNrC58afPXViZK4BhEnw2IDHAFEU7N7bHpSb
         OsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529277; x=1793134077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=A+0JEjfsVZwgOyhN8YyGtTrS1HTZzp5r4LK9pckCjC4lKIejRdY9KoxFySaBEDjHzq
         kRxYelKGEpwpJQ8Py+P41P1sD5849jlzNWfHbfR9fAV5OyykKxFA4tj9pKcvrbCMtD6e
         NPYEFkEtOavQ12aVmF0+lyUPVxHwGixVnvDRJ6ooPrgqIBrnqy6FT2QhDgneqOlDFT/Z
         dBpN+sAKW9qNPlWKZshD6IVuw/yX6Cc0oFt2JkL6HwdveZ+Dx3M57UgeiRE9/d+NLm6P
         W1ckVt1mW9FiVxtO+M+jG0MVE80YxhSbtz214N19c3OmVur4jnXRY7n0S+SC5uMHnTPp
         5tYA==
X-Gm-Message-State: AFq9FYIW+XCdt6PhEkkzvkrBpReTFnx0zmbGvO7Mk7yfhoKacEq8zKHt
	xt2Brp/CmYBrEPJ4CoeeL+LGwfWc3bGUr6yMr3FNk3knyR1ZU+aRvJWfALzFxPEI8gF2cj7YULw
	tLAepk2I8khcsB1FBlK1mPM5+yPKT1Cn77dO/dlqDzIgEiNvxB0NXEi8hObjhbxs+CuEE
X-Gm-Gg: AYBFou1G5RGlkknntqCijQ++KNLeiYHGzgDrhRyHJ3s+Dj6xGJZsXqdn+pPdZ6UF/oV
	MvZKrRJKrDtOVFPSiXVpR0GDK1su9q/LLdWSApKPmr4+MYHLNWpfXRt+gQaEuTfBZ8/DXUmwkow
	hfnaBn5ugYPOJa9mR7fsbZA3YgLKDLG5/JnEDgK0U7fK8C+H3DvCbu8/l3nT+eVNPAz9fbVexSF
	3UTDIb9+uqHSpZfXYRDVZuL8d8DvkT38/z+o9z5nTSTv9PNzZendr4WFTEvHo5P3xlw/2sGglVt
	TSCngOtClLdlJ8WQB94fQTJrtGmORzqlsq2alCz5ifgDhfhQ6kWqg4TrJ/X6TruuRINneTy/qz6
	Aw+1zTBOenAhp6Xs=
X-Received: by 2002:a17:90b:2250:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3ad86cf2bf0mr99488a91.26.1792529276794;
        Tue, 20 Oct 2026 13:47:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2250:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3ad86cf2bf0mr99461a91.26.1792529276327;
        Tue, 20 Oct 2026 13:47:56 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80303567sm1036388a91.14.2026.10.20.13.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:55 -0700 (PDT)
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
Subject: [PATCH 07/12] drm/msm/adreno: add temporary __maybe_unused
Date: Tue, 20 Oct 2026 13:46:21 -0700
Message-ID: <20261020204728.28844-8-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX6vB0UTOCJJN3
 bPwB3ROvQL7lh1iF7g8g224xxmnkq7VUbpCUd+bBPKVoQqXxDWj5iFiySNXrDV+nHzgkSdxm7u9
 Tx/nZ2L1hg9Z9ncwrWyyDL8CQa3zRQOK+A9e1QERJTPNrfkzRAaCjV7XLD/imjccfoqU6OMThzn
 gAUXnqj0suEJYRegMO3wh45lx9oQS6C9GPdbqNDcxs0Vxj3EUb35KBwfgBrK3SVg+/4498OklOj
 csXWy8Y5yfGH07zZA6aQ8bu2Orl9jqyU+l++OcOKj8IHaStYA9FYb6BYDVLIA77v66Bp0t1IRL2
 OOMhoskzWYB41X894ac1dQd50FLHtLFtEHPgIICD3SFIQoQZWEaaA3bDT/Iu1tmVT72EDoOSnO8
 fxDcxRYUwh/m7KIQCsSb/FqvEO4dUtjrsH16+e66wF42xAm1qWP5lqHo1ti6GkT+wUHLxcaP43K
 L2Yl3/NlunUeDRFX8Ig==
X-Proofpoint-ORIG-GUID: bGKq1s_rMtvgIabX0HT4eefFxiOWybEU
X-Proofpoint-GUID: bGKq1s_rMtvgIabX0HT4eefFxiOWybEU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXwLkGBK/59cMu
 pjUW6ock6Eo/7yZ9nK8m/S4lfrvJj7Whm+pTYD7/gqyYGGWTKP42AUrhzcXuRs2bCCBTc2VH0H+
 80n/GKH6rlXH+KIz7D5uw7313rDz6DI=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad7d37d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..c43efb85fde7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

