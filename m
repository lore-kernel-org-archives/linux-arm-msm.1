Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305078;
	b=dDtYsZFVBpQTic1B91c/eMzwcB62TwERwut9IGrg1FQdx8vSXU5u5SWUPCut5dkgVI0/
	 b8xaj+DUXlBqHHeSzvf68eM3bMPmdhyAMKeYYwCdIawkbE6XyMDDyuDlst1y/wGTSAkhJ
	 W938fuFV5rFtsuMXPsV7qMrwaAzuFt5Et45S0g+54ZoQmsH1g2gf/ipruOmrxxDH10dvh
	 Gs14t2kqZhhEfG0ckAzvtfUTxIomj5eoCAmNK6mhBgDqubqu/JNr/wrchqTEefm9qQlGk
	 YKpHIogH6a6HMD2ADJXTWyMH9OuxkgHtVmHU1dgTS6/1R754iKrBtgCv7JWkl6WmMUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
	b=SSuNdRUdmXx0QGuo9MunUXsIBtUk7QtoLkYLFkw1tC8WCq9hTeIfFU/sL7tQN/0kPFxa
	 7xmwoUuxQqU5D45a28LaVXBRH35s2BNlwGbIJfB9d7u8ykCEU19MAkfyRQNNeBRKOUZo4
	 1s3u8zOW4eomWt18k4tFBktHKeqOJMu345tvURy66p1n7qSMjJH2XN29x+EF1NelZUgGY
	 GKQezpKpOkcbAdnoisVT6f+JnQDVU+zMgNXgH8TQVJtvVm8Ts0aR6UjUDjNxWkZkDHqBT
	 hwd8EekG+T625DBQEF3qI7AaFibYdW/HNrEbZk2Cs2S7u7Iqpoxe2KxfcjOOVNKHrHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NmmR/M/+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kDWdT5QF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7960A262C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A7960A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmmR/M/+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kDWdT5QF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJkCqs1708718
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jo2sX9VXnBm
	xIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=; b=NmmR/M/+w3RD5xPAX4n3dVPA9gt
	Oc/tgfh0e3BypCgwElLAhl8KFKdpwbxnHCykv15KBSdrnY5lIbiaooNzPzs+IW/D
	+nlq1Ho9xyO9bfSm0xPkzckpNH7d3MIYeNsiMWbkFFESpWjm4IHTb1rSnigeBPPM
	da/LSwjIdjCIncJnaLf8LMcaWPjb+GZEfucv/l6oK3l9jNqxXL42e/zc3O4Bxp7q
	dUlpK0llhhoGzu4pp8E07YZj0tXr72vp9ARndn/2m/B1In+0WJwD52v3OGa0FI78
	oHBRysCaUecyZY+D0kIO5DkFl9R0L6SMwNE/TrfJaNKk7jAMzuu1sg866bg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76ck4yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdacb64970bso1383032a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305075; x=1793909875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
        b=kDWdT5QFEKOru0MBHXQn0FqDrxL3hVKrWn12+37TISBaIazo/TxkNOCLRHUYI3KIRY
         zAi20cfCptbcxRgDGCdN7l83bCGql/1w0K6/XyiTQjALIEp4nKE89GIhrB+9XR73qHPO
         8C5BGoXRBVYmHSEKyKYCbZlzHFAwz1YV17V+k5PBlVm0hjlom0dHIjljlyS9JeluLbvh
         KHoPPb0LsbIWsIGBnb415h0tJfLqpZDv6J/8qh5w+qIkB8FJKgBGyHO6fVQdq8h1g0mI
         CF/v8SQ/5Wu2OJZU3VB4FqAdRnvypAWNaWi3z8SZUfHpsr8lf+WnKbb8Xl22F4Nvpc9q
         rYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305075; x=1793909875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
        b=chu23nUeKQz8zpL8SojTYSw+SQU3a8eFB8PIPOliCXN78GluTdpDUu/nOIC7LzpKB4
         UnlVF11U54s1g80DxXKZVpTY45lW2FSbYrYq1xwsPEeh0Uvws5Qnh6qGQewqXcnwTLsA
         UYIIIIJkDqEazmICCI2lEUR5yrAGkDx7BFKnKxpFP3IuByOdAYvEksJhES/194liiM0n
         /uX8WJqLNcHtYwn0dLJ4N/u5wy1Jk7hZ5U0je51TjXCB3DSPDocgqC1nkYNQoT8LeYeJ
         y/Zj8Jz+Q5M8m4TyXggDYrsZRXK0dw1+joz8XIbA3s0Cw0d1k2pXKUVPG1cHqEhiHohK
         4FYg==
X-Gm-Message-State: AFq9FYLoHFAmUbx9G16TE7KN17t8IkNhT3NyZZgjYb4zG0rizmETsfGq
	aTtnhEIEVm3nLFfDGjyY45fmRonrViDmwYJ3akdx08Q3vDvbXhabjmTkleEegSwjoRPP5bS8t0+
	y7y5UZeK7vgGZgmcpD4oQNyhInuz0hjUttXfb8/HCiYHMDzky4G5IFvavyeN0LxofGUQ0
X-Gm-Gg: AYBFou3djiPzbEfv2XLoZGdNRIq6rlf6QLY9CF2+72HGIgJzpq5fA//WQTXZlg/5KP0
	S8Zu2OD4V+V87CRFACZ5VkiHMf3BHDAyFLgKgYx5Xn1dVaW3yfpY40isrOxMzG42PSnvDbs8FMO
	jKHbpycmBDK0ehzgKXcqEPV4nl7Vc1DDSboyjta+XT23IWOnSbs7nbBuja+KuIFx2eZPxy+s70z
	WYo9BUF0w208Dp/sfltlA/eTwzqWUe8fEQf3wk596kPgCocqR3KqJSrlCNasnou/kTzHGJW9T+8
	MhgO85uAref6OdUbP29Dw/0Yn/eYG+f8Cb23dlZXvsrYpd9jP2M8/1YBk97s36q0NMOq96mFILX
	ANeo/C5U1p0FKHHEwpuoaxkax+7SBLSnadDldv7hNhDOrIYeOUQkNu3mcdJGOg7YuF5Tnslq8No
	fwMy1obu+hma7V1pyQx8cMDg==
X-Received: by 2002:a17:90b:1e42:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3ae897ce417mr63814a91.32.1793305075423;
        Thu, 29 Oct 2026 13:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1e42:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3ae897ce417mr63800a91.32.1793305074970;
        Thu, 29 Oct 2026 13:17:54 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb1bfdsm339928a91.0.2026.10.29.13.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:54 -0700 (PDT)
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
Subject: [PATCH v3 05/16] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Thu, 29 Oct 2026 13:16:15 -0700
Message-ID: <20261029201730.151754-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 37jhMm32NLCBg94zwXAzHnGJ4JyapiF_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX5ND/ZPky5n7Q
 NBzPGapoKcQFPQoJAyx51zcQg2CACuDh6UXXcCcmSwbmZYwqpV4hX6pi7fLURhaBiPVatGraPOD
 s3zouVAUF+mVU6aBrJj1oOf8ujbo8nbC3FzgCeobk5haJWZXAQZfoIZX0MDXVLUOSv2yKK1Yx/d
 lFL7Y1RR7dJbGdvO3FOV6wAxVrNCaJGoGYC7/GJGcJ9iKE+u6MBZcbbeotTNwxT4c+2Jp1oA8u1
 l1PY+MjElZUwMecelr1bzfg8SfFa6di9PLqgVDTWPYYXRaED36CHtOLWvreMckN9S2CYUKEI1IJ
 r/NPKXegJzoJF7rG6TVSeulO5PQDw/U7V1QghIpGIdNwPRB9N3QDZ4tCKQ+fjDZe92oRCnVmgUX
 /u2n2MQ6xl2T8F2rWagpGZaBF7ydgrdn3gn8JexFmuzk4A975mThl9DzDTvsJVSBZh2o/JiXicz
 3Th9Sgbjun9CvR5igJg==
X-Proofpoint-GUID: 37jhMm32NLCBg94zwXAzHnGJ4JyapiF_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX8Y6jMSm4EVCD
 orYKwsW/BnFSK0X1nfIkV4meUd9IpMBQ0rKoLsSk0aP3ixU2ylhenr5quWze2SWulkYpvsdGpaQ
 gv5hLlL/AzgISabGphjd16h7C97Xwl4=
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae3a9f4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=h-8skOKhzxl6Lr9m04UA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

We want to save/restore all of the CP_PROTECT regs across IFPC.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 55a805ab438c..45cd986ad4b5 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
 	REG_A8XX_CP_PROTECT_GLOBAL(53),
 	REG_A8XX_CP_PROTECT_GLOBAL(54),
 	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
 	REG_A8XX_CP_PROTECT_GLOBAL(63),
 };
 DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
-- 
2.56.0

