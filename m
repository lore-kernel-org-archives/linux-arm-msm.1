Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827258;
	b=VRcvoFuyhVkyoEFbFuwCBI2jqsi8n91ihOG59yzeQNH3O2Tu1T8Au3ra/JxDn+9eWHk2
	 GjJxEps97HsgW1i+ZoqqeDwLvnZmPNB/RSTciW7cMEXiByadT903Fm7wDn/7JV09rA4OL
	 rZVXcmQmf4i+It1hgh/ZUk+PYnE0uqwDGdFAjia5jdFVt3I9X7gquP9stoHHmQ0FaMsz6
	 5DJPzafVCnEN8tSUcbpjbN0ZbX/tA2JhWGougZP4n8ikqL6QmQTb23fR7QGD6Ja0rH/IO
	 AuGnLH6sTVlysln/1ecM1ZJByrYQ8keqZmipkM/z32g1fkblGR5536RH3pZFI5Lwb4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827258;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rPngJgcBG6DrOJRfy/JZMVXSOtKUd2/SKd+TwwXTsBA=;
	b=lYEOkhdILFi83L8DJjaTuVTKBiJOYkZZxe3Qyy6KtdAnLDhWq6zaDdgoZQPvfs0963Fn
	 zOIVuHrvx2FmptirgeLQ/KAmQpIJrlwTRY+PcU75rebZnxAzakvSsY1vETXqzlAQRxCsm
	 7isOUgLVpkaAsAEwf3Xd/8zfuEV+pImv0FJA396LyucgqFIbKjaip93muTjtExGKRIQHa
	 a1S+k85o2p1EOHBLmleyQc5Pz1tJ8c+MCqrB7JckRzefNzwwlJ7wL7dXptbeUS+UndXsF
	 i2hKvU9WhfV1u2Xl3a0c67WCrHz2bhRofjyYxT36OUaGviVgw1MXD7xxWrOGcaV5yew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZcViku7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+CKUxcF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2862606AC22
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 21:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2862606AC22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZcViku7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+CKUxcF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4IcagI2286023
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 21:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rPngJgcBG6DrOJRfy/JZMVXSOtKUd2/SKd+
	TwwXTsBA=; b=pZcViku7H4Fjlh21+DQI8d+N0Hb31e4A+kmcH+KR/ajU+Kxr70y
	6ube28YhNeyGFQMQ+rJtJMPogBDoTl6Pkj+Q7oA0EzDDuO5/x6lfiwpG5cqMCKs8
	oXwyOHcmVhwQ+CBw41KaYLfek8u9OAeIa9elERR32E64KRRFAtELj9pekYfC7Ofg
	uXnwSwW41FxzWPIWY/jlmw4PegSwmUKWeQh9RDdXoX94ABLvieiA5XTEEbWkeeDB
	FV5Dm6BI+LtYf0F/NiIdTUQYpG8MctSsTjIas7wMPItBYzaAqrs1OQkSQwrJOqEt
	rYJCiMUoAAiOgk5Kn8XxFOPHacrCaTE15pw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tgmhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 21:20:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1505912a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 13:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793827254; x=1794432054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rPngJgcBG6DrOJRfy/JZMVXSOtKUd2/SKd+TwwXTsBA=;
        b=d+CKUxcFbSpfNBPOOt3G52D4WwgZkesEx1FDbm3DjwgwD6ssa1Hb30FzfMozVJtppp
         6aFE53TmO85mHF8uKSXWXDs6zc1G+cGVwgjXGYVAJX9W2dTuBjaD04yQjEQ4U6E5HUl5
         BEFkrbbHUhYR/6uKUAxA5EiA413Gsr1P3KHckc+rZG1ci4+BmlT3oQVgNGZ/BByD9Yby
         m//Cl7riNeTnh6K+qy5bsYWAYq1V+ZSzuEuA9c1M0KfJuHU2ln4yDgHi9LReS3OvJac/
         n/iY5gIRK8Fsn3nCqsm+XHqFL7hbYFgdsk059gFcUGYQXEJ4LdztoViyO21FLAXo67un
         JW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827254; x=1794432054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPngJgcBG6DrOJRfy/JZMVXSOtKUd2/SKd+TwwXTsBA=;
        b=b7MGrljoXeok++9LAtXt8+ByU284g/jtXXsWHKwN2XN+rkzmgBcdTlBokChFSvSnev
         E9Viv3dylziGsTV736hi9+zeMmbiTEq2rz6yXO0al71O4mgypfO/O0QznrSvg1Rd3xRq
         6sylfbgHceM8G4IkTLF0vcdmk4PeNPJxwPfLhbXu95J9w2GtJD51mZVp09VuGXZRVUx6
         0YKiYLrtywO2EIsK8YXr2zU8f8+wySYgpgQVPtgag0db9YBMKewx8hiFquSVbUJTRFj4
         7OUEgvj7RTpbr2FSYu2+0QKgfud3s0IJpwe7Inaa1Iz6tqQlnbsVCqyBZcY4VNW3xyX2
         Ogpg==
X-Gm-Message-State: APuU4Z8EFOzSGn/X5lnVPHGhIPmZfH0bul6MBIZOS4KA1jPLZEO7a+If
	T+Ytfj36inSbWT0k120LVzdS/YZMYGKJJ0cvvKeU+LP2Qt4QXVJf7EhaGPCdYBkd6F3hO9mtkTN
	BXpbqeDFkvJlwhPkvKtekVC7xW0y9UojoCA2uam/O0zeuT8GZZKOXvtJW5KodSxH6D47Q
X-Gm-Gg: AYBFou16qOXK9g3/ifDLkIjwb/NwzXCqpwNN2FTT55hCqKcUN7PgPm213p2ED2NpCMH
	cIdJd3tRENPekt0G2pSd15IfCyTzN9udCgln0pn0qPlpuR6B+w7rr1r8rMvQi/8fhLRNRgVj1JE
	kB2v6yg6DzT5rP7If8CjEY0VuKexQcZ5cmBvc/mjl+yl2BWp7Jg4YXJEnqgM7S5VZwu7W6FPf6+
	Td3zqQ7kk/dztX+iWyq967ntgjYwTo8UAfNq8IUQS1K38sfgyTpKoJGAFXTLQthKWbGd4g/ETkR
	nhxffR/ebe51imToorYy3SYgF0oy4WZbFbyW1pcPn+2RwoqqJNStHa7YPQHAFxHcKIykIvQf7WU
	SbUrcABHKPu+4NGW/G5aDHwDQeUOc7uF6v2721UBQXK0oGPXJ5zGu+KU7iAbakbILG8B/tUg2PC
	P93VJ/8SKUPd9C/QJUwwmgOKrtCS0FLxcXxA5w0vHqaDEztT77wQII5lDh6aA7
X-Received: by 2002:a17:90b:268d:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ae895a5bdemr13706655a91.8.1793827253813;
        Wed, 04 Nov 2026 13:20:53 -0800 (PST)
X-Received: by 2002:a17:90b:268d:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ae895a5bdemr13706633a91.8.1793827253328;
        Wed, 04 Nov 2026 13:20:53 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31601b7sm554517a91.5.2026.11.04.13.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:20:52 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Danylo Piliaiev <dpiliaiev@igalia.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a8xx: Fix 1/2b alpha filtering precision
Date: Wed,  4 Nov 2026 13:20:47 -0800
Message-ID: <20261104212048.21010-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4NSBTYWx0ZWRfXzwvM8njFcvMs
 J32OlOWFsFic4zP4hdlnfyr1MUJj4YehowlhmYrWch9ruMgzBT428nU5E5xVK+VAR1SNximOIk8
 GOYCqwVUJ4zk0jhTRYJ4wosGVFQ/2C8=
X-Proofpoint-ORIG-GUID: WBzHRFnxQpaOJRH5ZqNy9yhVZ_klqbzs
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aeba1b8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=V2sgnzSHAAAA:8
 a=EUspDBNiAAAA:8 a=4RKTuTdSK_1GKjLeyWkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: WBzHRFnxQpaOJRH5ZqNy9yhVZ_klqbzs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4NSBTYWx0ZWRfX/w13sVeOQ8TK
 kPxzRXUifempJsfEixxSRnnnhEgHRrhNkZyBb2Q5FZCMW3Df+NJvbqDPbAfPLwlBOOe3zhSIXOU
 6mS0PrygDe5bLRw2Js5+O3p0L7mAu+vGZt23WeKOqDbYmYUpGd9ylFXoGDbXsFhhXrwgb6Hz7lr
 FQiCGb1yZm1+jW3esC+z/UONcY3nZaoiDvqrVEp1QRUfU0AiLe1Z0NNLxKrp/iuTIZmjgX3orrT
 r5558FjrLQnEhXPQrG8wlSqnknimcQhr+ePkLMCoTdAdjTH5MtuvFKsfRveI8zq4hmWGqRXFDwB
 CDAPZhk+NthaAywmVUp+ZKFeT6pXKYqPhnxoFIYVGpp8CjTrxs6WcKL1X5gJGI7qvsvOX2ItiGj
 RV8Fs4s54aJUTviqd8VVbw29jTzWHBlefyccL70sptqL3d3+RuNsDU2YLSDa0OXvNjx/mkm/heu
 1d5TohE+OfYmXpKvsEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040085

Need to set b25 in TPL1_DBG_ECO_CNTL1 on all gen8.

Reported-by: Danylo Piliaiev <dpiliaiev@igalia.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index a7d9ccf26493..510c2f6017db 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -61,7 +61,7 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
 	/* Enable cubemap small miplevel optimization settings */
 	/* BIT(26): Disable final clamp for bicubic filtering */
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000724, BIT(PIPE_NONE) },
 	/* Disable tag bank id hashing */
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x00080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
@@ -297,7 +297,7 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
 	/* BIT(26): Disable final clamp for bicubic filtering */
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000720, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
@@ -397,7 +397,7 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
 	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
 	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000724, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
@@ -630,7 +630,7 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
 	/* BIT(26): Disable final clamp for bicubic filtering */
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000720, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
@@ -972,7 +972,7 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
 	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
 	{ REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x02000720, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
@@ -1030,7 +1030,7 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
 	{ REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x02000720, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
-- 
2.56.0

