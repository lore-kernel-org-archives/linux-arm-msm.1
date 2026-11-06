Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007360;
	b=Fe9yKYhyCykbNVCS7DNs9q8QOp1WDf+7yH7cfUdMxFzicWILkdZCK4SevRyffbpTiOTZ
	 iEqLn78aV1eMV899sLLImmYSql7LhR0lpoqQL6N87+LJpiIAY/s6iCcucVeoCjQZBnoWt
	 lE665hL8r40WdZMTdxyzNuw3XvwU0gageLQ/4GhXPOPY3QfnJ9TuzMv6QUIPgN1ZWtkGV
	 2V1BJy77Xhfy/CLWIqfodRRggq/EZ1NC+fbSQPyRjOs7RILiIBRjm0PirlfkBYPOstUK0
	 7tt9PqDMrJovvbbRqyx00bK0gfLSEfdWjI1ZuFZZovz69WdA1Fr6lQm24q5lgLIUY4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
	b=T51BMKNvfeQmPoTmsHN1QjmXYDkJpTMNYjy/cwfuXDXH0F41KMeO3+qLEWEh68bbLvzo
	 BbjgwKkKN0Qy004FY+fJafqX+fx3JuB45UIDC+se4eG6SpviLIq7REHqVnW7psr+/47vY
	 9+082shzq257TOkZfZKyGlBqtJfY9pgGjhrvfsJRiAsbNOKBe0V13mooWtiAQsfwLJQkc
	 JtcxxM2UthxdPpVBPhB7GFxn5L+DR5LkhPsckRuQ41unJ6U3TQVJVJEPddSXXZyPE/4xB
	 0NXqDDzUzTxlKycgMMGxdI+JC9Tvzidit5PCVMprGDPB8sqRcCA9a9D6g+0yPqSs0Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kn/P3fSp";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XSiDHMs4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D067606A32F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D067606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kn/P3fSp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XSiDHMs4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mnugh2083949
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UkojfpaA9Zy
	AFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=; b=kn/P3fSp3Iamg4K3HyuXzextN8o
	/dJGS5T8/tpgcme6ips0zNLLqDVK7dj2f0CE7r3FFN2o3yHgbGjpfFp+k8fcpQe+
	Idj+xlUbxpHKN+EqZk29eu9ApHbhYU/K4pNGiIG6mdGLG0AJ3TKLlpxeVeC6Li/s
	f30iap4dZ1VkccIGL/jX8tl3r2OfkDyklBZym1qLS89m0iCMczJMxLFKqqaDVTYe
	n4dJ++NLX0kotFiDonZYv87EdGTXcfROdya8wmzrctW9lRb8dBpudG88Dgu+JNyj
	BNp/7GiiHvZwGEBmlh02Nr9JSGM60NnNWCCdzAy34xI6+5VBnUGGs2zZ4Mg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsm6m8ykn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:22:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso1513946a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007359; x=1794612159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
        b=XSiDHMs48d7KsMZ4g+gxX/Lzf/EZEoVzR+DRSEi1O6t6lJ9irl74jzICFbWru5isrt
         UnG+nAWmf1+YOBqM4lFCkZlZxn9eyjmdhI9f/Ai8i2ywhGDmAfuQ8rKKGYuHBf1O3zEw
         ezFwI4AQubWa8U2yyIamhJvGH7e44U8uF+DTMHL1bDn/+Utru6xXwz2W8jS1EhhiTqYv
         xB+1Mvb0f/f0rM6Kxx1ALSNfXOnR5KX0RR9d4UojCXb582uKCpYcOTRfOGLNBBta9g6n
         ozPMsJ9RToCa2neYvnhY3ocooVEpdXzABfO6b0wU0K9MFRs0TrlS4W7poPViyK/zdpT7
         VeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007359; x=1794612159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
        b=riTtpW7bhySIpn9NOvkGyEk1SX0lv4NRGrg/+4MbX0zvP0MurdcxmoMwaxXDLnT1Gm
         FY2QGxtXzssEjBr8I9MaMXfgN4mTNjdrXKCMz8ZDxWqoj7Jg4MSAwVwrpGK+DU/0k8ez
         s5IZdB+s4ZTQDqoVmjowgnb8XdItQsuc9GSdSQL9/tCurCu4qmSqEfQjJ0l6tVP5roe+
         iHo1au7XwhgWGPVDgISypkRcW0BzQWigIT9KlnqnBfzneCWQ2TMbHFjfgY+ZqAt4mcLi
         kFl2CBOuo+/B7FosRpkdrpdV8e/xsvmp6YlpiWATYFUHzRVnqZ4OBLIl80ZlP5f+TP/L
         UKNg==
X-Gm-Message-State: APuU4Z9xZoKyLsUQ0FfBaoIzMV/OooKZsEmE76IEiIZhlicmjBXSwKiC
	6qurotx+A4YyIq2lM/BffFGvRmpz7d0aaZ/RN0/mIm2nooRONsxcnP0JtvADx0Lb0OXo//46jhc
	1dJdGvY0+a50mDTZadcOm0PJJ7he4mu3lfGZe8qY9u13RRExzKv8cc8S5/ak0Udj2DRaH
X-Gm-Gg: AYBFou0A9A9H4cLwa3WMaqjQPyKQ5kzXXxm9RetAzKFEVkZnRgWz0Adw+GbE+83rT2i
	uYCVRHYXhbWEx3/cONStGH41cf9XGZOvXwaBCuPxOyppGjaK4ctBFGGMdJlBn4J4UzMSvt/Zy2Y
	EQFH1wRiHXCDPddj0+n0iaTk3Xse7d8K35ss9ShGWi+FrLd4gocaCgBJzwx1izLYEnX6LD/doyr
	u9wJAx6GnO5ZqIsX/xvpGFO7UpL+pUznnOqnF1AZidDDQsiZb1zIZZs2mTouHbALY/SCw9ArO56
	pfbzOfrPRQoJNJWcoWttxtYOWapG9JPq1lhsW627nXIt/mtDEVExpdAcLg/fJppUW0qjris0Hal
	f8U2mJgkVXXzc45E3Hl/UMBkh+1Y+bYISsb9X3CMCwnj222yvs3VJN4WKbCjxPt0RJTg7Yi1pAx
	2digWAahwco8a2cC506J8WiQ+h+WBs5ryygEgfiTf59uomnfZnhKbCiF4aUwBNoQ==
X-Received: by 2002:a17:90b:33d2:b0:3ab:884b:65a9 with SMTP id 98e67ed59e1d1-3b0db6c0f4bmr4053104a91.25.1794007358773;
        Fri, 06 Nov 2026 15:22:38 -0800 (PST)
X-Received: by 2002:a17:90b:33d2:b0:3ab:884b:65a9 with SMTP id 98e67ed59e1d1-3b0db6c0f4bmr4053083a91.25.1794007358330;
        Fri, 06 Nov 2026 15:22:38 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058a7e3dsm715121a91.11.2026.11.06.15.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:37 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 02/15] drm/msm/a8xx: Export aperture helpers
Date: Fri,  6 Nov 2026 15:20:54 -0800
Message-ID: <20261106232220.47602-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX2+0k7aUYB1O9
 UfIcBNMILiQqoIpl8mh9BjYdrikYpwQypz1Ng2cLtuLtxagf3yW9o84n/p2ITeDQJljh58JOnhx
 fQnDXCptguXPvOO5iyQiG1IC8lLwguI=
X-Proofpoint-GUID: 4tahAPi2Dw17pGkoXdHjqEou-boPjAVF
X-Authority-Analysis: v=2.4 cv=S7NMU4sP c=1 sm=1 tr=0 ts=6aee613f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX6I4tHY0fmbkK
 OpzC0b12I/RMA+fBGGonjH9BX93WX0IJUS0J+mKSFfW9G/xINWC7PILBIMgFhPVVJv3Z1xQa+ph
 OHaqjGfiWeiLSCn3l9sErrk1QdrgCBNtO//xaSiqrLawgmqlzwRjNhLsXZCs9N4yWRCXryHjvho
 jkemWrnqJZerl2Po6ignWC7kbTRGJ1y8tVbTb4M+g35cQx556Ae4qR02mcMiDBZheuMej2373a3
 7BrSTke2zBWFefZZA5puLwIYtx2r1DE04h1MS2drScM/fHmZ1K5F6V/CRwAAgI8qqOibfWAReRI
 Fp7l/SiTUDsYnbdLm1F1X/CWGDoi9Sk3tPV3e7o4BgbE4JyaU3Q7Zy58pfEFlGdy3XJGqRPkuxn
 xVLr1TvWTPVNvCfnb8T+BFiThbVrz/uZw4c8ELQVNdqTuEUnyYtTKCoFZHyC3oXOPlzaiSoBGdC
 5AaZmtNnP8QC6mkZoYg==
X-Proofpoint-ORIG-GUID: 4tahAPi2Dw17pGkoXdHjqEou-boPjAVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

We'll need these from gen8 gpu state snapshot code as well.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index ab4cb43e4a54..c58a2665e9ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -346,6 +346,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
+void a8xx_aperture_clear(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 25ee3ac16ed6..82cddaa7278f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -32,7 +32,7 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -42,7 +42,7 @@ static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, un
 	a8xx_aperture_slice_set(gpu, pipe, 0);
 }
 
-static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -50,7 +50,7 @@ static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 }
 
-static void a8xx_aperture_clear(struct msm_gpu *gpu)
+void a8xx_aperture_clear(struct msm_gpu *gpu)
 {
 	unsigned long flags;
 
-- 
2.56.0

