Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305081;
	b=sI+h/TZ0NheHAqWMlHKvJ0EfKsJeIv1gPQK5TnxiNpN0UjI1t3EjpkqgNbxTMLJHfLoc
	 y4Nd3KroP/O4Wa0lpwnyatm98bQ+Jy0hpDQgsW+QpZhTnoST/4t1KumEEsA5uGuE70EIq
	 KxBvcHOKrjYp5oXPcyav7/IMUntX1wJgF9lMlWUgoY0hvEVhNip69HpVZt3D+0DbBqMcL
	 ngJmg+Rs7daXYRrgUSxNEhGhBJCjH99zmmJs3+rZdSyaRX+uv3ngwaLLUEYdiPAzbktXx
	 2kzeQaB5NhmQPdX1US0toNc9vF669j2gW0XZePurpvWUIt+nDcrdzvQcd0f7Aqw1S8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
	b=4Wqy4PUkF+XvTS08RsW394BcLmnw/n+vIeUMoj0m4uvvSMzXv/Y37mM4KYocWKIBQLVl
	 HCFciYmaxZCGxubiyxy68RMYtoSpIwq6CUzQeXWHEqOSBAmoArR/m4k8VyGLERhUy/ebj
	 Si90uWap/KtwZkI1w7C8+E4LFE8uxKBx2KLyf0Y/32pdDcbTRMSsw8rw0eycPWp83YMTu
	 3gtItXmNqonaX37PszlrIQ5x7eH5WTcheSQeZnV/ZsN/Ht7RN4+OvPJrDFn3YkHnhtTPx
	 p+svwzxh8XN63UZAiuqcLJI1+tjN4JovnYYrPFErzauD+4XDEMW8GDJM3RmhookXGXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RUJb+C1u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="G/oC/OeK";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B560A2609
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 949B560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RUJb+C1u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G/oC/OeK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjbsx1133728
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0EyBq73M3y6
	JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=; b=RUJb+C1uIXul3rvMM8q4C1F/pTw
	EcDYyvLPztQ+MGVPjVr37Pmw0wKk14hbKkIFGQbQZ5YcIApI1KGYS1dWQ0mEDqKC
	LXebNeBDrKFLuyqz/tiYZCS8irilnPkV2BWE9uXJ9unSsTg6ssJ31FTO9nw+pQuW
	sGRluaZm5qcnTMZ/qF8QAEqoZOHaVTwVRWJF9n1vC9EHHaQSv6JYf1VIdj4y2ai0
	QZyToY0lS1uMYiVjufvxf3clqaZUiKlj/Vr3ptEDu5zpSy/JEBqCLPUTBsxZVo0T
	niN5xF50JvKa7YPw2iQW+psHapqANuHmgdtKXl6UTZO2iX5pzqmrDz/NwHQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmbeas207-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:17:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso1747106a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305074; x=1793909874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
        b=G/oC/OeKUZwzk6KkRQWsuyDba9sXjQyT5E9IfWn4gwt4Utr171UBDjU3zUbHoLqEd6
         Oz/LSV/A/soEgwJhsycJFoJUjLv3TbIq9o/nDuCMrsiJnWaPvCvWME0PxDqwoz3wB41y
         ChZxBGSGbnXYptA11OS7VcqtONyjGpgc2QutpROvusAfsV7oY6+NuWDO1zvPVZLCMUio
         WdbvLMeMZmu2SKIOZ6gG1iQRylJXanXARKW1JNmzwp/PZKW+c1owxp2VFzbsUBFl8Q/G
         fZWa2yt4mWJ7QAmJPdWmiirS+hT7ZHWC7bNWWUk+fBZSii74huGOUIYII/OLc90noqii
         65pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305074; x=1793909874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0EyBq73M3y6JMi1MhPVn67wbOnPe2w7nthY8a8enDx8=;
        b=kXZp0mZGQp3W2obXARNTTRwq1U7dJBop8P51dCNgOdKEEe9hZxRGThIk3zotgfg2S7
         l6oEh2sro9pr4q8Bv/et3M+XsfZKSf+HQVBBoFC8cVG5SYEXXQ0umESRM+8DMhhKe2Dr
         q6qqcAb942uT22TiUkazI+LGN3kiCeEqYxeXXlts9a760yCun2yRJ8r9PFBcglb0TK2Z
         sFbRbU+/dx1AI2GzpmNRDwzrR5zSouzo/NPohyS6VsOIgGwE/3SKzH+8gnEM4gBgVIQx
         r7pqCrHY3zipw1c+1ZgqNchn4byGNHz9fNZ+vL8Tyh5so/iHg4l0ikJAaTAKi4tnG3QM
         MXyg==
X-Gm-Message-State: AFq9FYLnSyP2akyies3ji9CYD3VuFjCA+8hPZ7CSjfaoFsHAIeu7dFcl
	ygOT32aVIjPQIcH44PP94PaPIGX9H3HT7sobWAtSCL+ehcQx4zluE0hR9fus2mk3Nc1JsYnKN9K
	4PJjZbkz/C4e+aFiey1fWaIGCyPuI8PwWRwNqJEYE4V5pwE9yHFxu+7vPhyVLAcajKXjF
X-Gm-Gg: AYBFou2gY+2cXAmiCRqvfVm11Z4zYzZd/AJTtm4MR8H0i6vvTeyDucaVWvthLDsmMWS
	kZiFWX7BQ+Brqc112euX9FXqHfH6CCRhE9FK0cjAUnQAks7y8jSuCMOWG5N3S9WCLccKIhej7tq
	Ui9Q43PrVD4WbR/iLBRjvUPYea8lKDtKCG/4R9o2dGW8VYtzxYKTwSlS6jTGVetpq4Q46QOsScc
	8J83p3sdYhhGQKOhtcJ0iG+MiPBlJc1DmjXEdUXxzgINs1OiNUsMI6yzagJXGMYRr0rll42ejHD
	JV4k7YDjz65ruJCrZmLuWYrViJqmd+ssEPm3Gb/2rOpXw2ixDkEUbU7VnXYXjQuXtsHIkmK55ed
	3IjrabRWuXfUFRiT3jps/u4sX/cJTSfqSR2oYMR3u5g3jX6XFQB7iWlry4WsvY74AMdBdRbDDzx
	r1BQsJzdZXpq7N9FiUtEjp6Q==
X-Received: by 2002:a17:90b:1b08:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3ae89857dadmr58251a91.55.1793305074207;
        Thu, 29 Oct 2026 13:17:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1b08:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3ae89857dadmr58235a91.55.1793305073770;
        Thu, 29 Oct 2026 13:17:53 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f99899sm102052a91.2.2026.10.29.13.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:53 -0700 (PDT)
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
Subject: [PATCH v3 04/16] drm/msm/a8xx: Export slice helper
Date: Thu, 29 Oct 2026 13:16:14 -0700
Message-ID: <20261029201730.151754-5-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UejE26SN c=1 sm=1 tr=0 ts=6ae3a9f3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=HwyinNJ2ww52bJxqQkAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: aWDX06seiAfBiIx1VAH0-OgvkJ6518PD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX0O1s6cR375fG
 Zm/1MK4klbA3TKVSEZWiDNGikbIxQlE+FpTzHYI67qmypzLdiB0IHypdl+qai6CaxL0dx1/0xQl
 /H4aKc2R3KRXnkxYDGFnfi4CyyON/V6s3hTko3tVw8C4P6KnTAdT/IDP9viwSePxKEnbVFDzPA1
 UUjUiykfa1/MPrVA/GkIemCaN4OC8+GVjTz5MOph/ZRs98CSISzk/4uah4+yy4W57kqfa+nbmHG
 lwRHJDkwyIOuCcLC0msC9Z5Uj+g7RqB3I5seiLV3cIJqygBOVNNFur60L4BKXrietm2smVSUqYg
 0evS9M9B8rjrXeDFLs/hRJZIKh0AjeIbse9ankcAiD9q+C4htLeytBG/cdVRkppYQqM1KTGKEp4
 gWMADxdI9bG3TVJadBDpZ3Xxf5HMgpIbMTRgvQL6vCfuF16GHW60RMM/s2fO8qVszdcTPi1s7v6
 L7M8F/K1jE2S8KJATmw==
X-Proofpoint-ORIG-GUID: aWDX06seiAfBiIx1VAH0-OgvkJ6518PD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX/6o0Ffp9736C
 OIJCiGTVhYCPVJ1mh3GNarDrTCoC0IpXUyar6iHtiLP7XS4RemK3G25F7cS0gkmswSi4i8qqLh3
 9wTCfebEpoYMvWLVGqQNdxYOnf22Sbc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

Something we'll need from the gpu snapshot code.

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

