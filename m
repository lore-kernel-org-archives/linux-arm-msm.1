Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395225;
	b=Dzp6LDB8ozO9gVqv2QJNyN+Njj/SLuk0P5KVtvo6Tgz0CTuMc8vyDd19XOkGnIGNSXzY
	 cHMUB68lnUR9CUmhlYG5aWAJwnn+kdIozhlUycTZZJ3ZfZALbuXzoEDYpqbwul3eu3dJC
	 tFUlWwb2my2vwr8gJjB3Ob0PGa0USgC+2cyuUZipR7Aeqgtz54G1Bd0Q16Da8UN6k/zKW
	 qyO19SiaOkVEGX3s/Z3mNIAfS6X6lRKZ7XsUXhdHaYKsWB+FtN6MN9yLxvCol0eonOLxv
	 +tCLHcj343stccY+y34yUmdx6trnPViBQ1xh+AVBLPMsBXW1t2N+cCCmvHiQlO8bagw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395225;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9SOSpuyRfDJmYAf59ZWk5HR4noS5hxVrRszr7A88pRw=;
	b=H6DoK3EKspG54cR2Z0N6HedkXEukCBK/zsLzXbsiDbX+H49qrJjW8BCLxNwo+qtyMOrQ
	 yHdUsU2z+vea2zajpziQYl5UDIx5HS9MjcKNLKyZouHsttCsiP3RHw6iISOLfhWIfkseo
	 Ovb8W/UiEy7qX1K4E7OUIymTXfrjxHftUIJsI1x48jjO47TDJYOjWCXqjsT/y8rW6ekGY
	 rY275iil8tWkfsAI9M6o7QhgOwcAZdnqtdLnOPQMjeTjY85kyLHc6dNi609VljUP2E0F3
	 PneepGquQS2M/+gpSCI0kyhHkGQXj/yuITdton9GB62gGFserrIMKy3D5VPIdRBUBNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EtTazA1D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bhgmTfoN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E733606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E733606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EtTazA1D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bhgmTfoN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAYU52832274
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9SOSpuyRfDJ
	mYAf59ZWk5HR4noS5hxVrRszr7A88pRw=; b=EtTazA1Dlt333kQ33G9kYc4k1OY
	6jFrUKDmKzfsgUS0VG2bLe9mP+P1awt/E2fgSsi9OgDgc22zy7LuidtHm1Xg17Aw
	EVBQLQJxvBcH8HIgZB1R+3/mPOOt7hKOekxHCtGeuAPf8mtuMXlUgwPx3NwUsZbN
	iexXnpW8sK+XgpR93/5TDPVyKwaQUpCNozhMTOSzjiHymGRhQ6cy1McpUjt7+0lz
	iDXJA/Ma9c2miFHJYFpaPzrKJDVyHfqaN3TRmnOO9J8R73UFKlnXCXxtINkR/Sb1
	7cN+Fwq1IUDB7vFcNvH4BU/efOU8CBD+N+Z5Q5hYTrI1uVfx06Yk+XpsNug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x180s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:20:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93e2f72bfso18378065ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395223; x=1794000023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SOSpuyRfDJmYAf59ZWk5HR4noS5hxVrRszr7A88pRw=;
        b=bhgmTfoNleMwdZxA6OrIbdhjfJ0UUKfJ23o7CO7IsTjdkgI5EFc+pbPghycMENnCMx
         HLI5nmFR2wWOK5ckmSXjys0tw6qCvwYpcFZ0sh+0+0h5lUHaXtaoBUjT/Xm/cmA0lmy1
         E74PpjV7dxmH+hiEbQsKqW9OFo95dkyzGOgFDS/DiDAi4703bhsLSvXWO3Od+W4Wb2vI
         01cRFhhrwG98voW9rlEndly5NuYO8TDr5stv8S5D8VdyW4isG1WfGqbX2eXvZtzL7tZj
         MpRsnzJxqSBMFPYPRh18l0pCflU1B+t6/hOJdGVTcLuImkGqzixNPgz2HW8z5CQUY0EM
         d9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395223; x=1794000023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SOSpuyRfDJmYAf59ZWk5HR4noS5hxVrRszr7A88pRw=;
        b=H8BBWzuJ2v6+Od5c44oTj/ZwoHC0Q8J6HutGEIB1aRWHOHVw8ingpcW7aS3+JSPeED
         pOi2+Hk1q4/2Ni1TghN0w5eogIXnPS/0u2jqB9cLht2bGKsot7skZNN/6ucxMj0BAwUC
         OOiJx44tKbd+jhJa1G42trnLnqJUAno8brMwPFSD7aieFHurbbdzroWKfq0EK/Ev6iWw
         tCV34bkV1Vt+M3wNwzOjlhJKbFps5y2xzJ+cnlafav78UoYrKdpWb0n7kdKgf9hjpZuc
         B/5zZTPt+zPp86kHLoTYsXQ3EBj31cUqUkV3cFcfmQUpXF43OebufDq+YXlVLEZzzbus
         O/Pw==
X-Gm-Message-State: AFq9FYILdv5sdwr84zh1FjOQyDlm7qU8KEvx22UuFtcepaqZmQnNRrRd
	nxZIUqUnpZ/tMemig2PL/SaFWZ+oUTRZRzfCa+YzJFdkd8jMjiLQUwXq33xCYiRDliPw0G8f/cV
	qzEOYlz8oayRNO2mdE18cehmCwdRNjGd1HpW9CEgSMb55cMMjXOAlwUhGvVooRQs0MmNB
X-Gm-Gg: AYBFou3vijRoH9kefDzPE6+avA2Pqahys/q2d7OTGz5r9JdfQj5ZXR4JgWZEdhMKkQZ
	uiLRRA45BgcI2fntplG9qVF+eYd5JXRmTUQVZH8qAVa7ADBcrfr3vuqz5O74u/9w5JhYJAs4BqF
	m/45GFewfC39903cxZuIu8kVxWMfLIs5iTF6uaoXu7vLNPLQO5KxXAqLx9K4WO3cSIegyuTHu3Z
	AyRAi/OLSIHbRkKqx2vQ9+PAt3R7By9uhFCQFKjRgwuavQt/kfDy+K0TNPuYZHMPiYeNnBhslhS
	GjINipdNCvxC0CVdDxrAP+4iHy6SU1IxhdhcRf3GPS1wL74q8DTEuESQDIy+WCMlqJC81UZugm9
	pTkeDOqHEfw2pnoC2dCV5aWKyqSeHYkcJ16d7H/Z+cA23QSM/7gWJawPhlkdPIZJ5pRZ/fJcS/B
	Fv3NHVp/QuKzX15cxuQwkMYA==
X-Received: by 2002:a17:90b:4ec5:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3ae897eb741mr3078143a91.11.1793395223301;
        Fri, 30 Oct 2026 14:20:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec5:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3ae897eb741mr3078124a91.11.1793395222885;
        Fri, 30 Oct 2026 14:20:22 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f37e7esm2711639a91.1.2026.10.30.14.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:20:22 -0700 (PDT)
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
Subject: [PATCH v4 17/19] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Fri, 30 Oct 2026 14:18:19 -0700
Message-ID: <20261030211928.45761-18-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: Oo7b3DnctpnWDr8OxJcdTZqtvpA0gD9W
X-Proofpoint-ORIG-GUID: Oo7b3DnctpnWDr8OxJcdTZqtvpA0gD9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX/Isu0Kc3rw71
 lcHvV5hQPEuG/SoTofbHl9H37b2s9D/wj/ORSVt2hAVR48BFiwmFyQ+x56/4aJQeGLQX8pVDEIj
 /nul8APeBVmKtFMcAz8umVeJER+I0ReMF0FC3w0w4pDwoxbvC7Rsm7TXjbFwF0yh1oG4WSfLBBa
 4K5izLvOqrriUtT2vQAYbrPgEtaF3bExjyPMaF1cGBZOnvIYhPYM5BOw9Yd8mnEF9WBvqCwZLUL
 WxfZK6vppUAQ4uGnIWa2Vw+WUdd4RinbhS3el0ybO2/AHf5KRRyEUQIsokBQTSz59hH3rxjH8P0
 2isr958qSZ3M//gYUiksoOjam+ssMzYy/eWgumQrtqBv47rhR3ejTK8eo1041YVWV1TuJiWDvvm
 zGmWuRI9NJXP5W82nFeNdnz7ZL7FCnDyQWNJ87VeADcjIhkxLwBMwp0E3ir0w+9BNZ99ltPmT42
 0gLHGhyz9r/id243vOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX6fX0Kg8jxK8m
 upZBlgg4E4u9XO6VuQIUNwkSkhmHj5f0RHqfQGbtSnmrdUwg7nw1ergut7L8NQIb4OlVxesENBq
 JWFprclYn0TYPAvO0Rwu4FU7/q6p1LM=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6ae50a17 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Dhg23qV5XRRJQlZlKu4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

If there are not enough global CP_PROTECT_GLOBAL regs, we can use
CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
them the same on all pipes.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

