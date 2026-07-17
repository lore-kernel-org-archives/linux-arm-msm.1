Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7783A6B70
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321360; cv=none; b=DXVGP+0wfBH5L+lYKc6YDFDwpeiPCf5lbLYEzeD36JcK9s2KexR9ND8dTwfBuM9gT/Rc6qPploe/mjRDT5oEFa8dgjYs4Z/BwpfCxiNB3C7gpx9zQiH37WpwOmdvN02dDKzt7SJ0dpS+m3uv013RV9EWIfLXA6YC6StrnFuXJkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321360; c=relaxed/simple;
	bh=E9lhuuPceEzcrtwxHEW7FLrBs+KDkPNfNChM1KDD/e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MB0I6yprQGTNdLDUWDSxLwhEsKOAMo/83kJVjQC9KN3Ip0BRafKq7FieOaGB52YhQWPrXJkx4ITugQ//lqnLafE5wGhH3ioMOsadCSP6FsNK4TatHr3Ti8x+QZx21v9d++JnFF8GsOel87QdV7X8qHIHzLsWRayfZp1+4swPEjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLzJcICi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zkz4dhsb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLzJcICi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zkz4dhsb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtOvo2751689
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ILFLFLBAWhy
	u3kdv15Hw22354Io0JE1gAt8uUSQ6n/Q=; b=ZLzJcICivawMYSWzPeMSvxIDZDx
	EiebTpbRrJdFU1JjhPHKqErJJCj+hIor1/yp+/hGxSZWbGxabRE79RI0kWYEccJD
	J0+2mm+hxlT53HhadW8P8nIMBkpFasbdzRuIWLEvWjWDGgZSjmQE/9JrU+yqwdlM
	ndaETGhw3bDT6VuPkezp858BdDjUWmqGN826rabwQoyNZLZPMRUcahGwBxVjvmHo
	PdQqbIAee1tFvsPVoloAnpEnRE9+WwD0YdBE9aN5yVtIhsOkoVHMglivelo6cMkQ
	+VmLujvFyZMbmo5qEHsmO/xxNVw/7g5Wvw7DjpEBLhYPoBLuf2eowHxdACw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffpug1axv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84865f326efso8566060b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321353; x=1784926153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILFLFLBAWhyu3kdv15Hw22354Io0JE1gAt8uUSQ6n/Q=;
        b=Zkz4dhsbiE2PFNKv5xHlwsUXpVimAwvuNGrMMaX6AAf3SHcKR+oLWx+0k18d19Piud
         lZFub+yPcXjpWdwdbk5awla6U9jIM4yl/tQV14NpDu2Qw6wmE6ovA3JWFI1TeoVYdZYG
         xTTW5QZ8Vh6r+8uB7kAV/3t1faNMaoIBLs4DwPzEUBsQ/CvNW9Vq9CJJM+Q8wjpCTI1+
         HWy42XC+tJqy+OOi01al+W0gWkLVr+9cp76Wz9+n4JKHD9x4v4bxmBpxh/tVbDIWWdG/
         jfJNLz15mxngTGDnI8+IzF8uqzrrgS+8SE7sc/WcU9OQ16PnOh9oaqlZnEPVZjxe9S9/
         hynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321353; x=1784926153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILFLFLBAWhyu3kdv15Hw22354Io0JE1gAt8uUSQ6n/Q=;
        b=IjQLzgFex7XtjAcXSZEgvdTJRHzBoB9SPkjM5OqHvxrlMMg1976pBZ2ZIEhcIB15MH
         5OGzaeGsci2OgC4mZwrRXKuTSNiPUxxg6ViK5IEPs3OkjaIWRh4rHJQUaspRiEeDfDp8
         I66WwkE6kOa5ySJUmM+bfOayPSBEw0is4nxk6XXySKposCdZq4obmelDej2d3u6K3pRD
         /xvZsq+U4Aj7Cnl+9SXnFuO8poBYvuYM05riXn7QxKXVvZShu+xcxQM9JcAktSdR2PXl
         zyWhhrs1BcqdiS/8yRcYNZgEeGA4RcZDyZ5gxuxO4rPI/B8zZ6+T7nvzGOxaQTuvTw7S
         +zvw==
X-Gm-Message-State: AOJu0YxUH9qy4+jKf34YqnHhOP6NLAkdYbkCBsj8OLyT6UGOoMrllLem
	pl3I//HVnrL2F8ob+q7eR9IDPUFDX2ByLGL9RDF8qaC3DrNejvcfzROQsALT6NjZypRPl/SVl+i
	CSggWqhIu6BRJOeuVRT4W3PP2CrHXE/E/hj9F9Uzp05jY/WjGWuBCySapVoet7Je92TE6
X-Gm-Gg: AfdE7cksxNDhW+9kWjfPnr/aYoyb2RW3pA7GiFYzfx1znnBzzF0EFMsnhgxphNT/HYt
	urcbPoELl9pbRmBNcmK+op5xQOlSOM2frTVEAJ3d8Zk84LG8bK4xPnn7imo4B7m2NAB6zy104Xi
	BZvCUL9jIj6eAndcoGJ8ylrPEqK5ktxS5AYNVkVGDCuRMSnH1V7Ufn6jT0Z2sxRmpQNszVzy4Vy
	iy7np1fH1m5l3CZEr1aXNMuLvJB7REW9ZODU3L8cJMKmpoEKuX8U98lvRMn5/mdj0CowHQ8rHaB
	QQQj9D3OWjG8vyVkte7DZwSxN7IOivJkDFJYpcICsDx0Cn+ZOdXN0mDCa9QTkUuZbwFvn8yE00k
	iOHgON/r7vJKeBTaHeTa/r+C67bgkJufsP+GgWl1mR8lCAYQ=
X-Received: by 2002:a05:6a00:1f0b:b0:848:700d:c950 with SMTP id d2e1a72fcca58-84c29505e3emr4501501b3a.37.1784321353251;
        Fri, 17 Jul 2026 13:49:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f0b:b0:848:700d:c950 with SMTP id d2e1a72fcca58-84c29505e3emr4501472b3a.37.1784321352818;
        Fri, 17 Jul 2026 13:49:12 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2e68e7b8sm1473968b3a.35.2026.07.17.13.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:49:12 -0700 (PDT)
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
Subject: [PATCH v6 15/16] drm/msm: Fix per-process-pgtables check
Date: Fri, 17 Jul 2026 13:48:31 -0700
Message-ID: <20260717204841.26120-16-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfXzIBh6PK1kgzJ
 zahcrptg1Cb43ArG6ux1wDlRTmEbpg2ogNCn0v0pDZU+0W6LmxkTsuNR78PERBjr5WptObW2+98
 g2S0oIUc8Rel9UUTL31LW/Rfi1s6/rXVc/biKE2APpGaSRMcXBlGUu6pUq3JOPhARsuBZWHvkyX
 TGyz17R0Duo4TDCpsaqQqguLqPIUsTlrzVgXTVy80HxZ2+SOzB8+na4WpiOGbU8Y3fX/rzPZ4j+
 nCAbBs0xyUYA0HHJ5I5eXvryglULIv6F5jD5oQ+Zi8crNJcw7Gos4jGXzmTczI9VvOXnIm9u9Mo
 S9GdKPQlquPTuNibK/sQ8VFMaSUIvrupEyHg4mySXM5pRZlteNpHATm2HD8iK8GIl4916RFHRFI
 zW54mPICcqLySp+YT8ca+5DCYsybr5fndmjrwJx6XwBolfy9KUK1jso2pHfvwtIU7dNpAnl2Jy/
 7ryWDfhwQCNbobwq+TA==
X-Proofpoint-GUID: xhSYCcDHmbjSNJ3Eqexpu_UVPHN9hhu_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX1bwQbW1dSp6B
 OGoY8jAGESFBOBLxIxIbd7s1u7BytRMh1yIWahNU+0qL4sDJRTA87VGpVhdNoDAPewwEHSVkKMy
 m9hUI1cHmN3xxW5lK9P5mKzVrSOUP/s=
X-Proofpoint-ORIG-GUID: xhSYCcDHmbjSNJ3Eqexpu_UVPHN9hhu_
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a5a954a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_1v2yp3k2DT7xr2y9HAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170214

ctx->vm should not be inialized yet (or if it has, an error is returned
immediately following this check), so this isn't a valid way to check
for per-process-pgtable support.

Instead just check if create_private_vm() is supported.

Reported-by: Sashiko <sashiko-bot@kernel.org>
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

