Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305081;
	b=Hk60lUaSnUUU0Fyq+rLV+0d12gZY1YL9CKkKaNl/oeQSDsWGSBGEw0t140toz3TyWylR
	 hhLx/7yp7Tp8mVu+7VDShfqNb4BENY3KD8dpuvXhS47+GPOEKZiYVvImmahk81ZrzQDdL
	 roobrAi934tiNraTgu26bVlA0t6WPc+mPAncL+fCtAzZR9jnDsVdRHs0SjRdT/IJIYten
	 4q5Gwfe/tjdwfy+rTkrOgazAlXnSBIY1qK9SiTJ3ajA8mwGSlEfq7iXXG9i9ebyjTAuNV
	 DbZn3otiQrdQjJuZ4pZENflGEqTquUiTGnzFuKmmlO1t5jKfX3pM1SXJqXhhinIfqfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
	b=pmIy+dfg6zFuVF1ceN8lnBvW/K2lO1ripOnXDyTAnPrtAh0gAjQfPwZ2qkCovVP369dn
	 B1z1nLUfgo8f320xnZBAAlud6YjSdI6ZwzauZ0J3/9rJ2DnhH7zXoWOz+M18GRtcPEWYx
	 S2Soi/E0YBi+R/ujqBGlEinNNARljfbE0Yi7ksAvDctd+D2vli6KWFApeX/mg/3gz9SMs
	 h2UJpZadTyPOejAagM3eMySmE2Hn5ybIbOBkPsRs03+dFIOsN6xrETXlnB7Oiot7RZSUc
	 qYwcZtUu9svvxZzWvaJQUk/USyKeE7OzOibbHXJg7pOQ5Yh9Dlba5Ib6sv4adywK/IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TL7vWpdB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YhVx2avP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F42760A3807
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F42760A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TL7vWpdB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YhVx2avP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjSTa163777
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KmJhK2itx3o
	q5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=; b=TL7vWpdB2TWnYmwes9aee7MBOeS
	XHISkyAon+eugc9Kq/+ZEHvu72csguQwJHCRI6PJdxFSc5pz9GynFjV2vdPHW1c/
	C2CRd1FrJli6JfBNCa/wR/C/RKa7GE8IJ6gbO5IcwIzXehkpxnpe87dE7XwVdN2z
	tG9NkcFYXhCsjpX4m9ornha1cn41EGKeo1qySI8uvy5j4lUoxCw7VgZvLY5S3efr
	lTQ4rUuXLqJupcz4jgORAm4NPuq+lyZxbRjSLryvqEbZcQ/vh9AQ1kqjJ0c5AxHA
	scbQifhaVfhmmi2qHhU4JyTuNyqfDBVbU0wFF9l1BUrQN7p2hSsOwrVdmNA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm7621xwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so6431a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305080; x=1793909880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
        b=YhVx2avP20/kvW5wxG1ewDF9WvpAyHGrs+iJmNPWnksxXrmdxAXfPkzTWX4Li1WhA4
         6beKUh+1x7+Nx6+FkPVrdA247oezwV/TnYIKFBbyFqcdnm2Lh8u/nSIzRzcpcUe09Ddi
         D86WPGnqyB3u0KUek5NiiPc6nD/b21MwmYgJOJ+a5U5XySQz8vWG/Q3MtLZ5N3q4CZ7X
         rofyqFBencHnH/0RTvI7M5BmY9AZgAksJ9CGatRowjEK7IcK4Q3VCs154djq2ijrBDuw
         8R7UZWaiuxw4BcVGCs7wfr1Nye92zEdwaN24YPeirlqv52HFi4qHk+azO7Tn3z+JQVDf
         O5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305080; x=1793909880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
        b=LcHDNbwEjLrTlGEnZBYZ6dK1Oqhd7d+Mg43P3cBO66RSPaRQGdAl+1xfRNd7XY2Im8
         G8Fcz0pNHFu5WtqUmij+q5H8NjmYbjc+Yga/5+n7w7pg1u88tvPqWVjgOCcCRkEgy3GI
         uZo1faY8uaXthqA3k7i42/tuoCNv6ACBa+3Ywu/L9K0yaevzuTzf1RCV5842g15CaYeW
         vgxLPdwDFoqx1Z6snk2ZIPmyH+48qJoiRTg+bE501BmBcK28V4kEDB/2LEV3VKgPXKOi
         WE8doTUgHDUzxYNiFhfCySvyIaGa2lUARzvS2WCVa6P3GNcDL4lw8ZLfZXU7nH9HlaDZ
         MZYQ==
X-Gm-Message-State: AFq9FYJcvsT1EgRDh8MyA/tfKtzSNheaDNO6TcVKtTABMHQlPRm4x0Xg
	UvTe6vIgBHQJbFWY3jjlyN12JFMKUTWh+PSXmca8SfCzmQKDFh1lBzv+zZZPGisiFcvXWxi3UId
	42+JZbpNi9R/rDCLdOCZu0C1Q6GF1W//GbwGC/ITZe+UBbAkV2OZ+XoZ8thHTfk8q7igU
X-Gm-Gg: AYBFou1eCdBiDAKFKeF2l9oj1fEc4KMJy/9a+9KV9+745SaIHM9Y2Q8/8C+0zMdthje
	IOSmD2sRA99dD4l3lMBTCQeW2BLJln8f/QiuZV+YXAjo5NnEq/inpcLRgqj8wUuh4TtYRDaRBAD
	aau7qHWT/iOA/eybsr7JFDSztQu1xE6qQa4WmuuAGwztXlzS36xNIP9CdYo0G2HUYJYTTtQRWiv
	lZSHsMBeCCzHW8vpQDcLraK0aYaWYPxS6qdvYzAAvv8CFyA1QEanEyY3dinPdQVPSm4n5O6t96H
	HzVvEGeV8IH5+ZyFIFAdP0a5MXlcpcVlTWtEls8XRJ6iDQGAtqOTah/nv//sq+f/HgcKgVOzMR9
	+eLo7HYHIY5eMFh7j3yzfbXqAHwr9KXOjNhT7NTsY+BbW4aMj1GUrKc2YmbRoxG+CJH2UKIarKO
	bzNaxmR2RmDzmwWjCBNxazHig=
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr60528a91.40.1793305079798;
        Thu, 29 Oct 2026 13:17:59 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr60516a91.40.1793305079365;
        Thu, 29 Oct 2026 13:17:59 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8805ebc8sm104727a91.3.2026.10.29.13.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:58 -0700 (PDT)
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
Subject: [PATCH v3 08/16] drm/msm/adreno: Fix PROTECT span length
Date: Thu, 29 Oct 2026 13:16:18 -0700
Message-ID: <20261029201730.151754-9-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Yl3KrQvmNsE0RAN5REv5Z-XtDgYfklu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX+5nz+sQ4Td/P
 M3x+v2JG5ciUhe9qBdWc4cbyLNPV0XES1Et1cF2yn+F5OGUCrlqOQq+wHMXE3ZU5eLW4XCvONlf
 ntyiRYqYxYV+Z0jGM4WjU9FlF6086puqTVGaUZROCDID4eHtetCvFfr51CXnzAnHm2bMxUQdqj7
 c9CwZXzqCkUqRdTjEpVQPI19Kse/zsCDPpa6HiI9jWdo2syxcFSaBVPwC/Xt2q53Fgq9KVoDFQP
 sALhmw7j3yTZLucOlMPo0/Us4tR962mlNtK1sQq0ivKmQK6YaI1MOPs60W0NZ9AatEecL3p8yrb
 9mJnSUXmfLfzJKYflZgYlerS3S0AjspdXkp9Y7y9fgUAVGKAO0wLclLoqSGs7R2ZJwTUW8QpYxt
 xfD3topjESjNabo8qtq29oJIogz7RL/nOmeOhvzSMaJJTsQ33XvorkN2yvhLCtXYe7UPs5xOSxr
 oyvkY41Kve0MU7l3ebw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXx+kDFC1qBPUp
 w52qemJJ4ebkucZxAwsP/i84qH9ewVzOyc7o4aM9dtBpBg48P+Pj7URxl40FDRphJxlIEGP1grY
 Ov0ovvuVVELrHmn0xRr74/I/XKZhSUE=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae3a9f8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Yl3KrQvmNsE0RAN5REv5Z-XtDgYfklu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

Don't let the length bleed into b31.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6b23d301c144..c49301be504b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 /*
  * Same as above, but allow reads over the range. For areas of mixed use (such
@@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
  * single register
  */
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
-	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
-- 
2.56.0

