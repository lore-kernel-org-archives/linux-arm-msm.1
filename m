Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911241;
	b=IeIEgmtHktZzRHI5by7NQz75tzPbblVj8FnE1+l35koKqXifKx6omOoo3yngODD7bmLy
	 kMEaRT96t2gH/jqrJoXsRgpusTy6bn/YrPwIVaODhtaMCzyGrnNLcCJO6pOKn2t0J6uiL
	 9DrvqQjX/FBf4fst9YM1Fm/mp3uk2qcryJ8RP0gDNKfISc8jkTEYWC6i44R8Lpvd00urg
	 alej6gN9jKc/b1FdFOtxe4ISI08brI62JSdIGZSLqRSVsEldI2/rDODGz6qmvYWgi+D0j
	 JZwze2PLXUdHlbPyojTv2W4YubBhBdpXLA6kU4wZN2YZA92bya/3axl0tWvD7u6OPBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911241;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7RcgiEmf6cf8SNXnvgtdIUceJiAojVx8uS+VJgMrRdk=;
	b=T5466ZQVJNZTm+g6D4eAbTI7k+3hXZyD6n/b7phs/f88YiJzvRCS/2G0uWmslI1fjEDf
	 EYz1UjwcH+3WFKjNkAn/3Cnemub6d8z1EOqb174GBnI7A0YyVgJriiWYus2aaNyUjvJsC
	 LuER6SuUUSNS0za1Ugxx1Vjpk5+q2nQfQkDIGbsQMkOxRoR+h0/TIUWYnt+sCfe6CYf2u
	 kJxd/IKhnJcIowcFkN+IEyYR18FysTVXgYVf0nkhErmkFLyGOMQq6cloxntx2vi0DNqqh
	 NWCG+P86IFr1whQw2+ro7KtObi3EIStRwzRIHlbwsR3uqglDUwUmLQNFmJjtpf1lh6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYsWmakc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ErsiPv7G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FEC6082BCF
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FEC6082BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYsWmakc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ErsiPv7G
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JLtxd752808
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7RcgiEmf6cf
	8SNXnvgtdIUceJiAojVx8uS+VJgMrRdk=; b=SYsWmakcMBqJ2Yq6o2TkJobXwru
	cS6BQoDWyENFxrkTY6vaW32mosgwu7PPUXjV/FHgF4wCo4zN8zT/92KU5PcG689l
	JTs5EHo21iNu3P5EM/n5xE0M0kHTeI4S8Uh1ZzjbJ0J5KyJz7OH2N6vXPSREpx88
	DovaX1c5ILDoVoRThSFMe9bJSSP56VDS7owrWwzR+VC8CwZyQa+XOqAWHkf1tAAU
	BHWwjMqaixg6W1Zlx91XG1B1b+7ptj2WcgPmCsuSGt8SP8b5rXOkAFXppI8n1FDX
	1XIYx+8O1amZIAR+WBgjsmIoK8imzTOH6zhSfP2vRH5o0/GpEwl51XfMbCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvp8a8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:40:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaae62796dso23100375ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911239; x=1794516039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RcgiEmf6cf8SNXnvgtdIUceJiAojVx8uS+VJgMrRdk=;
        b=ErsiPv7GXoBHYjqEMcQ7d/3IkeehP8St/1RyJNZwtt13Dqkp3VoqEnXn90HmmhSYvY
         IbbFE8FCsmNyvlQj2GaYasGQGCrG+HATJSgogKvsXQlsQPGCbXQCFhh+VhjQ3tQV6ydm
         ffvOKoQUfxzB+uivo17aD/dpv3iUKXj0TkZq8SzWipuyE7Lvg4dkoR/EWwz2BKrEFH01
         AyoQEDxzLRS9my7apFXG5KXOJpmtQUpkuPvpCFSilw9pwOMPyHEMpuv1oV8Q5YbQ9Qmu
         Llm7ek5BAvazRd2C2K0EWcw6kH5oTbAOCZpKVdD+IY+6cxi/Aa+YwiAT46TvqFyDcWOg
         gixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911239; x=1794516039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RcgiEmf6cf8SNXnvgtdIUceJiAojVx8uS+VJgMrRdk=;
        b=S6c2NhMizaZBD6yYnlX4/n7ivzNeFEiZcrajMfOKvuC6vR8dVzbMMrxn9fNV9mRGPW
         vkaTw8e7cUFJ3OiF8UbueJCS3nMaBEBdvv1fcoz+esjb2mOiyuYIo7sHof9BMjiXguVQ
         s8UPJiEPuRQZyBM5toV8KW2Vn8Ughtfvciy/x66QlszAo5Zrfe/G3BK+KWCBSMVfEcTB
         tuE/1ri3zfAqJiwQ2gMaM/jh33XopaZI/Xy57NpXFr9VFGK0Jx956cBPgoRGTX0GVjaJ
         vPNIBXUcQiyojZSqvcQxuD8ZfcPgP0tqIKoZsVmdtyZwc5XtbRLDq0xbDLzyKxip04/d
         0vWQ==
X-Gm-Message-State: APuU4Z8LOqvz+cShga0A8YSmsND/CBzFCAyahTrJGD8OGBTaDeq8u9KU
	yl/gvvA1aPnxSoFWtN1WmNFiWSx6QQzsUK5PzhOZRiwaLhSTT54LTBbVjFLdEPdHXYLhjCAYCkC
	S7IKnXBnpOxzgOjMNGPg38SlSbDFReeG7D7aQCWslkdNPX3fipRyXE8qDrTreRlfMZidb
X-Gm-Gg: AYBFou3cNvRaNmtT8gjh0EHPZlHMD31pdSkJBaBrmINJSals51Xp6Tfwthy49wCy9Dw
	/PhDnibM8A9dvBKNCYmm+7+USLj6r7tRj5sRaZVXZUcSjjBaVxL67KxyUyDkETUq5mKGUwOShLh
	mTknNHMvxmf4msVM+7vH/NkbdrEY42FdCPZRuo6WtrpULuaBzFHDX6B2mqP/EDt3KuREsbZLpyk
	FKzYRU6iABI2S/e53JOo+m3IlovnrAmw8M404qpTEjjILwXXbcXTUCciIPaWC6MKXwp48I0sj7C
	oLchx7fbfMxRqZGwXUsP5F8jw7MjOFxHHbUIDIEtxSXTlRt5ynXtY10pmzC39Oo3bBIJxUxTuzn
	aSqCENl5sOHWoQad8eE37rYU3sas18tqBje0HODYUm61UjWJAZqD/sSDXUK2tTGFdBROUnODRc7
	lv/UmD0VANxzCMICTFFFlIw3j5A+pUsoeHcpjUZRo14lPJEUUoztiyPRZXpYQWUw==
X-Received: by 2002:a17:903:185:b0:2e9:8794:8ce7 with SMTP id d9443c01a7336-2ed40c5165bmr7832755ad.43.1793911238800;
        Thu, 05 Nov 2026 12:40:38 -0800 (PST)
X-Received: by 2002:a17:903:185:b0:2e9:8794:8ce7 with SMTP id d9443c01a7336-2ed40c5165bmr7832475ad.43.1793911238375;
        Thu, 05 Nov 2026 12:40:38 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0906c514sm21008975ad.29.2026.11.05.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:36 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 08/15] drm/msm/adreno: Fix PROTECT span length
Date: Thu,  5 Nov 2026 12:29:34 -0800
Message-ID: <20261105203057.66520-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ib4Symqa c=1 sm=1 tr=0 ts=6aece9c7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -fXEtbmmdt9KKad6ribVFk3Ko4XbdoD0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX4JSecVYXH6TY
 RDxVGy0ugW236XJwKEY9UNgiASc6yh1cluWX66r4m61sxdz8GDg9lr/PKpbxZvImLI2G2ZFR3MJ
 Tp3fz0W1YV6HRcDUL8mM4PzlL3kN1OYOB5dnActUuDO84uNT8Ftjf+1E78nvM2mWswn61kZutln
 Q84/w2Q0ePLH+B0TeMzN7z/zm27/tWf3d3DDTwf04kWGZHAvtR1yEt7+CcUL5MSctVQ3JKunEo/
 qzQ7xKBZklfd56oIZpTpCOSqjytdPXJcOa9njpne0SgjPvjpr5QnUr4z8df6Px6rJKwqS9AIPTx
 v6aJtGoBpjYOju5/eIStV/5XCDvfPCAM6KGhSC1IEhiGNUxBmD+FrjvDBrNhl1u1dEfwkV3Yb0T
 TJx2zOYVbuv4EbtZ+xPmjKrQIVaciBiPJxKwwjK31Dv+5dIYZBRrLCOnOnSvFI8l3618l3Rul05
 19Rp0ZJO3EXGyxFnECw==
X-Proofpoint-ORIG-GUID: -fXEtbmmdt9KKad6ribVFk3Ko4XbdoD0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX0F9Lt7t4teBZ
 taSjSsoUmLq8W+d0h6ODP4mIqWpKuYuHy6Ymej+Us/9sGNrGCYrYOJG0LeSrg+WeNBpGV7vHMxS
 tyRWqlg84M+Y9eTgZH0CpRonY2CHQKw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

Don't let the length bleed into b31.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4a3898e58aee..cfe7a3ed44c4 100644
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

