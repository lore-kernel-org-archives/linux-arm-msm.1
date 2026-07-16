Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C9434DCF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232966; cv=none; b=QMxv9+/R9hI0odlQJoNdJeBc5fGu9WHvEvVmr/+DVR5u7MWY3YCvgqH0pF/Gmw29YkqfcBq9du/wlJyXD+6oYsO9q4ZRlIA9PFx0kFc/vr9EchQAgPvsxZzdkDCvLOha6AGBNyh+uoXaUe9XVG7/au9H4COcGB/WB6rGYIYRITQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232966; c=relaxed/simple;
	bh=e4d49gtt0VA6EJ79AsY3IVsSMq+vGF/Qot02h5uy8Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPQk7i7gfhJuQmVomCchBbawdIv+mkMkhng3jGUW7v4/0n7REbWsDWYasvNLjIkUCFMgohEWEcsAdaqIiGqroehP4kFqZuOdf19b1nfo448v/x3iFO09wOtf3KbQs/jf6mnVwwFfmup6q1sd4tSS2jID0U1V01OHCJykBBX4P+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUdnP2LP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gp1h347A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUdnP2LP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gp1h347A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJpDZu3453727
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+pCiq/Qy0Lo
	ydinUbSokabUuk5OYFJlIyBFzOoKUkG4=; b=jUdnP2LP1nJy0NY7V2mjhocw1N+
	IvWULgS3auzaJf7W3Jg6GH5SxYlMv4rN1YMapHvnbQYLtKhAMfr7T3govXuhoBu4
	fl0sBEl5bWHYkP//iiwsAUGlcgWcUIaBG6MQccx6ng06DLzK7BIX/B3aCXiyqh44
	k8RiGViI6QjYoQtJKmYlXZY653C/2BY61ega2lUzfuUcQztqXgBZUR5QDEyHQC3U
	DTj0AkyAQahs0ZYr2avxnKVyn3NBTsUGwkw5wjPj6r4yLNY+L6HLooXUDzyNIq7a
	GRRMrI5jGpIyLnyn6wi9yJQiPgj6tJ1mNa7pvL3UoKTxb5d9+vIXRSBWTXA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9h9qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso95875045ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 13:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232962; x=1784837762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+pCiq/Qy0LoydinUbSokabUuk5OYFJlIyBFzOoKUkG4=;
        b=Gp1h347AdlemURooLwC80OBRAKrZNsE4+NRzlg4rkqeEtj3QmlOz1APZQzbgPaVDYY
         Y/X+Gj27hgeFsEyZ+pTleUodunTgcneKNwdsRc/JUkL4+WxxaNKfWvLzWDDmtpxtKA0n
         QMPnWMMLqmIHXspjw1w/dzMqEA0OP9EyIcTPfgBdjM1oa/3XHRnihfMXdodJSP6JwGlc
         lM8K1ujP604cL+asVwSSzQEUwUw5nLpSlTY1OsoMJhnW69GdwyGV33YnlF7IeU/DOOq1
         UqFr4zbmd/unH3bCqfV8SshkyJQF1CvBYqrN4foPcA5umk6K3VZViDjUgXe8KPC1ZpIw
         DEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232962; x=1784837762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+pCiq/Qy0LoydinUbSokabUuk5OYFJlIyBFzOoKUkG4=;
        b=QD/4jNSdx/l592GdYzx1ntH2ol7nrost5JDbVZf35fE9RjKTgUjXtENpLNSIhAtz0o
         gjsjU65WnNkcNYSUssq6f5XaeyLkFBPBMB/3SSZbHVeWt5VPBZzDjYkqcmVWb+8VIfxg
         GAp8nK4lOj7DZ+dRf6wVPSBMoVcdV4zeNV9gLTikLnLtQblbJtxosOTGlvt61+fvMj1c
         vsl8o+YPmf/z6ILp7+mcnnl5oetnBgZZjUQxwXJWwzRjoisbkToSKjmr69CtZxzbshQL
         VEm34M4gWJigBaPS1N9KJ9ULO4wT/JKZwY9QnOpavYzMJe/+f3iDnIuULtMjs7AXt3Kr
         Vwlw==
X-Gm-Message-State: AOJu0Yy3xOpb1XJXhmT1KIkGD00gTQZUZYxF12LTiMWRqbpIvm2tDhLF
	dOEuwRX+vByp8LsnivQQtbA7MuN4trx5ioeIaYbzFJbAnEoo8ydWdBEs/YZGDfsdLKJNfoCpCaG
	db3EEXJbnTKETSo586loUojjK2WcRxc3+h8ObkIwyPxmzePNSQdJnYsA9x7zDKTOiUnW/
X-Gm-Gg: AfdE7ckr4LadETrkGZmLHuZ7L46S3OhIizDhAPKBItHlCtw6UCzVrHIBjT/AkvlebAP
	SKymByzebRHO0qdU3dAyo6mxBK+oARmBkzLOBqy5L4ufalJrV/1VWwDeay/ne/vkf+AF8BFVIBS
	pcavI9TnLHlNiqNMkJm7UkZoMPeUBQ7z8G4myCwZv/eAn7o5TrQCE525ez1ouI6qRMYqH/YfZw/
	d3sGj0/1xknPWBthVv/dRkYpdgkU9dftnPqcqje+b65WOZ47rR6kLulpz7IhQKldC1bADO6IGWH
	Q7F9z1l3TDuOl+0ysIkHXQ808+EruXowdJogTivG1n+uEWrIm36/0QkJPxoXrQsd4dCfpu/ueIV
	KdVHBhLd25PqX4uulSFW96OUuI0AmdNmHcrE6oxKR4nKNUOg=
X-Received: by 2002:a17:903:2ec5:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2cf03cef19amr92452635ad.21.1784232962533;
        Thu, 16 Jul 2026 13:16:02 -0700 (PDT)
X-Received: by 2002:a17:903:2ec5:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2cf03cef19amr92452135ad.21.1784232961998;
        Thu, 16 Jul 2026 13:16:01 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105b244asm25206495ad.61.2026.07.16.13.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:16:01 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 09/10] drm/msm: Fix per-process-pgtables check
Date: Thu, 16 Jul 2026 13:15:32 -0700
Message-ID: <20260716201538.365824-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
References: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a593c03 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vtH2vi951kckHO5NeAIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX8B/ZbYb1MuJm
 W3oojpY2+11XByVhJ4lycAEn3/7I2SeB8Pu8YAL3KWX3QqqZ0PB0FoSoX9ngrIZhqnFuDJ4CI+o
 UUl7WvE+mpruDPPbnxHrRTN+4RLCyvzu6hP7CUUvQWwJUIct5rGCeMUTEaOpWKO/rDeRqlvFrr2
 InFxuQlZkmuJtqaJ5FoNW2R7GuyD/wQIN9yfs5UFAIkAXl8fE8YpZrdeGV3rUwRUATNc8z7IoO7
 rrG4k4JRgYxrMZldrL6LuiLIg25tJ9ajRT25K5bM+/ShlULWU8iqa370942iwFoVyDdQ1iTQ+vx
 8mTbk7e9L/8MKcfWvwWRCjArinZhlpX7a8FwsAK6uO/nL4j6oNcBuWBrtn2HDFMYu5vD1OnRjb3
 HXcDTibSjhCEQFIPM/p3BLCul00OrYo6e6N6GZKoKl4oPvqi7Cb6uWB/X56wLi8oODX71O/bRrq
 hWkK2S3qNuKW2/QmnKw==
X-Proofpoint-GUID: C4A3GKjAxDsW2O6zBY_f-18OaimWMfRw
X-Proofpoint-ORIG-GUID: C4A3GKjAxDsW2O6zBY_f-18OaimWMfRw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfXyIcupyMmH2Jj
 oQu78lEb8azeUnfUyuiL4fPpwN4YRQAhbB77RlU/GxpvwjbsDD+bSeerhcyqFnmVhELFkcDedR7
 tZdtH2MqeV6CaeeZHrmrI8NwIuyxrZo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160206

ctx->vm should not be inialized yet (or if it has, an error is returned
immediately following this check), so this isn't a valid way to check
for per-process-pgtable support.

Instead just check if create_private_vm() is supported.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: feb8ef4636a4 ("drm/msm: Add opt-in for VM_BIND")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 84101e534ebe..3370cd44382f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -513,7 +513,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		guard(rwsem_read)(&ctx->ctxlock);
 
 		/* We can only support VM_BIND with per-process pgtables: */
-		if (ctx->vm == gpu->vm)
+		if (!gpu->funcs->create_private_vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
 
 		/*
-- 
2.55.0

