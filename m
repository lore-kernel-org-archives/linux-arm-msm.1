Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395186;
	b=QRBCujy50bEjkuPgt8/jKdqXI7QLnpNXO6INOA04/r+WAXNIjPZ8VmbEJizF7ogdkgL5
	 KPoXLnBozIM52aPMHLa1rZjQj3umUfhtmzVOpz2cTZzD8F7xXrZki5rpSwGGwBOmX8x9A
	 aZO0EjyZvmM/vI3jXHLPVp49/8qcT7NSl2DgyhjDDRrHGd60OHjghOm/yTVL7Yyj2PfVi
	 P4UOjirFckdDbZBSecB1ohH8gbbGGvY7KFfzqMmggo54eohAjKSkfK/xkmIkPAJ2yoEHV
	 aFlRbOLoWf5UFc15lkwAZZVh66kV1CyWvE7M/nYZb0Dy2o3NRTec3/Yh8hgA6a+XMyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cTppngQprFqmmQnXKt+iwIha+gqK+EmcdZMfKlGK1H8=;
	b=SgqWkfvlhHYVSEBGGgc9HEwem02n3qQepT8/AsT44Jzs+11vOiCx0rcpqbqDdYQj9t4b
	 nS1W7EpBlXkiH+w1urWNnq7eizwiVb8ADoH4eyj0NQdfpPwL79O8/B0rHCdclfCREvz0+
	 T2sfoZ8E6oU3k8oy5GLX/l4qMFe49UB/tDv7MbJTtmyarZQlYNHmPe0g5XmaCyoUjc8Pj
	 6o7FPHsflVaFq9vEBLrPi5kxLaDSG8za9RNWzYaim6nEUV2pY8N5wvggqu9byvpPB5Kx7
	 dykDrnUKKipuxdjPy8oPGBKnL1NRxbvk0DIUPc0VZFQMDz8TAaZuKrp2gVI+YJhwFEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FOnhlUmr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXsb2rJ0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CC9606A33A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97CC9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FOnhlUmr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WXsb2rJ0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAh4A823571
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cTppngQprFq
	mmQnXKt+iwIha+gqK+EmcdZMfKlGK1H8=; b=FOnhlUmr5+rfYj9MW7X8kj2n+jn
	UjGE67EHLNY3SPwAZbUqRy2+PonXYmP56OnSnn7zdYYVBHdqYwmQcmso/r2WGE2k
	Q/z7bJEW+3MBcEEoQpO3RYZ6ip3BGkBNdgGttFddWnMY0lP6c3sAiw5tLPsdH4by
	lgSvqBdzYRg7HGX5zVnBS22tqLOIv+Uy24yIr8TR4EkciiON41LT/3D4K3y9Vsdq
	GM3wR4aqAIRXeDWD0A2TDsJNt+h5L7+OFDaiw6WKB1jDlRHEJXB694plZSes8OXE
	La+o52APgWgPpqVowzHIRFhbXNV+va+7Ug0v3HfaEuiRrd5l8OmH3B+6YQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x081fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so795843a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395183; x=1793999983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTppngQprFqmmQnXKt+iwIha+gqK+EmcdZMfKlGK1H8=;
        b=WXsb2rJ0yBwBgob282VVmaPyAkYuM/3FWJd9EsSEtqwxCMJmKTV5kKxAKGETVrLm3d
         oUYUXlBktJg7ErrdbEzq3YGTKS4n+9FxKDKOxfOowfPk8kpla4CHXOSV9u0qKBhqG5If
         HfBWgsZFsgHbF51itQ4+zuqprQSiN6e5aHy/VYWZ6r8o0C5mOswpc1fAFCfY16+vZ+Cr
         hJvh9LfbUkhnfeoY+nHMfmtgIkTRRwrdnjnl6Xqtt4/yWKVAdmC3JtbNvpTGuFWCGy7o
         tIH+iRNEU5ooeNuMoaBauSaRTzNxO+fVz/6m8A+Iouf0vbopt308eeclD9S42IKkpkeR
         4zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395183; x=1793999983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTppngQprFqmmQnXKt+iwIha+gqK+EmcdZMfKlGK1H8=;
        b=2YzPAon3Ezh594BQteVwKRGe7ybBeQ5KSkDEdFouGbholDUft+GtwxWesuA0xEZgVs
         dvI9Pep/TlNDo5YoZoZwZ3jtQl7JeI0zBMdeuN/rv2T96YFIdxK3KjIqOPnDSHbp6zfm
         u0Eg8xwcm7u9C/Hm/Az+nAyG6ydrFx2zGKF/CefNyb5B6RJOFlO/wx/T2e1VsZR0CO4X
         VzNprvWWXqSiWZZLutge0ZZiihte9JtqtFNVkkzsbbx+6czjc+00q7zo1L+QOh25Pmdi
         E9oFOfpd/+ecaCjN5a1YWtOAqn9wOZPvF7MYlgkJrMuf5BBc14GZvzBWRXIRmFfczXr7
         LSsg==
X-Gm-Message-State: AFq9FYJNXxfonLxThTrVlMWLtFoWpvB3ZacQYfUucnSd3BA0quLTxu/L
	2I0geGO5BwaXek9G5ZoJolbPf8I/SVwJAHaac5wO/PXlTsyKLecbf0YYsEQqpJ9hym7xIOYaOxA
	R09x9zvGhlm03b/6LETyfTYBsNkrRg18y5jJKVhGcO4qVGhssWNLTBW4Tm9oguHw9deFQ
X-Gm-Gg: AYBFou23tc6jJgyIIgPHBjk4C1wBqv1j0HfO0gUrKQUz79f6xnzxyA64UeuzScfNG6M
	3B+/HWFubAsK0avRaGHYzKv6uDrypl4ydqzMedOJ0iodBrfohVZrVNdAdy7HYQjFUFmmimfXO05
	3Iv2DY2d/L0HG6PXkH568N6u8Cgygv37Rmxpsm8nRmYGvO0BMDPzvYDlfChJnic1NKUzn0v4D0I
	r5eN56ITZHerz9SeSIhGs06hObv+jtCCmKy6hqBpayMn5w6L4XBoa6e2Gx/fkxe/cZQZduATEsl
	VbaqJr/P0HWjWLw9hsxbomJHIHwcaep+H0M6m3IaabsdUSqgZP+tTaUcfOQar4otOjGasSCHkMs
	dsSHjR/KVz0U9LIaCfGqE1grIYutmo/XSSHSN/beRugAWMo9TrUpdmDxjkf4vcIkWYWUkE2fl1Z
	/IY4oPBQ7k4o40fz2AvKSEtng=
X-Received: by 2002:a17:90b:440d:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ae897f8c6fmr2641563a91.30.1793395183466;
        Fri, 30 Oct 2026 14:19:43 -0700 (PDT)
X-Received: by 2002:a17:90b:440d:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ae897f8c6fmr2641552a91.30.1793395183026;
        Fri, 30 Oct 2026 14:19:43 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85d4eb25sm2244216a91.0.2026.10.30.14.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:42 -0700 (PDT)
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
Subject: [PATCH v4 04/19] drm/msm/a8xx: Export slice helper
Date: Fri, 30 Oct 2026 14:18:06 -0700
Message-ID: <20261030211928.45761-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: FB6kYC0TybNZtviidt1VnSaf_3ytKR_P
X-Authority-Analysis: v=2.4 cv=Z6N5j3RA c=1 sm=1 tr=0 ts=6ae509f0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=eauOX4bcPKZCCnkqRxoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX7KOUXJce3XHf
 CwdE740B2l+RPROaaKw8PAfFXyP9ZJ4xrrC7f30x/2iDnImUq/mZNrapeU4WA88G6Fk6BYnElSS
 lm8LDjr7vQtY0r4p4PJiYo7KdjkxVtZpEFDnbAudJnBYXoUgoiGEZ5DxehRdRNyteck9uMwQHa6
 HwSZ3j4/CgjD54iDZvRXkK00OiJ9ppceTMZSAtACcamyLq2GvDdNFBeoRjvLMVRIxycnqlEsaiX
 RtAnmWh2lo8o1rSGMMKKqHj5o1+cCLqqBFPCvwUbQG7dv3NdYWlC66elzquKE34+k/OnRLpLqUV
 2selg1BFxbu3VHEtkcvPI9xlAptRJ1XwVFTNtr+ePlx1oBeq0O5Eor3VB0COtBBkSGpY+vmIS9J
 TTkiX2SW7QWDAlQmW+fHvzQBW+aTZrg0D/HJgoBJWm+CctwjHxrtu1HmPR6kKHaA61l+xTPS5O8
 lVinMj6A2iNGpHHxGCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX+/eXewyJUTc3
 t7bLSWpXt3WM1gBpjK7yi5aOdRn6fUBTROSt7nw/17y7CGwRN29P3auvEdAqX687aC9oE6toB+c
 MN0YAd7gK8bF4Qesmx9MyBlIPGIo2e4=
X-Proofpoint-ORIG-GUID: FB6kYC0TybNZtviidt1VnSaf_3ytKR_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

Something we'll need from the gpu snapshot code.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
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

