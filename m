Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911284;
	b=4u4FlV6J/EV3Ix+ghA0JZu9HIkcZFOUbfJcruaecXOHMnuyFrnt6gXAw5crRWSR0l26j
	 nyAMnzTCEy6fZFFBoxQ/n1S/HiTNobzEiRp/y05a0nLHFD723KNRiM2Sz/FeY/fabKvhW
	 z/IVdP8VkNcammn2KAHiZs+5RTyqMXb363+ZGZKlfJIexBtLw/UAz0MMmByGHaeqOncsh
	 pqbpi7dRGk1ZBCGWVMSRvTTU5LpHkVD3LWeK7d8CqrEssuVun/vNA/mUgF2BvMc872aVr
	 0NChfJoZXGuRNclrznCIT3d1Oh2oC9M94LBKRa0VS2P2/5ARoRo1GEMtvi4cw1T8zBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
	b=0aDGzZrHRuCgmb0664cfEfYuFzw12bA8ezpKqPn1S+pr5Bfk5zgetH0dAsxLo6DSgKBI
	 qgAuGIgEEKX6Nu/Vx3gUiAObRrDb6DbNjWbUpANE5ZxYsNIb9WW95P9NcgWGtRiMjeu1t
	 c3+H5MB+z0gayoRutypPCAX8Yuf+G4F+yreRK4XbhcvT+0TbHZ4UmdQH7qNKnH2Vn5Dgm
	 MpNzpVSQV53gkJT7W2e+475dwVLTFsLX6yCF0mSMba/80EVbsh42crNbC6863yHTOUgUD
	 p21JNAwrHdLmY/Ekdr8dXywAbCijejPkYlai8/ugvk5CswQXYFu60kCkqdm/pcB3i1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeQAmDzh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HF3tFdSu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B21606EE87
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B21606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeQAmDzh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HF3tFdSu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeNOR1440048
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mVy1ahp/P6z
	Kdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=; b=MeQAmDzhhiBpFrF1d3IIivIjGWM
	cbCswf0+ZEI/c5HNtNi4WfHcnzwLM0jTEF6sVs/qHsN1vaiFxlyh8w3YAfJurhnP
	eTGHvAkq4YmXS5xss+cik/MgjV6xYsLT7Sy6v+peEylSpc+FLkwVq8tWk2wl+FYx
	4PWJuUMVpxLaTAiRVx/tD60MopK+tQCzn540UvylY4GKN/SjFNoKYupZX6NwtFX7
	HBFkrAHn5Eo4pu4vcerP+Cn3asS7qUIFXIByHOfFhnDVhyzJnj4rpQPFgSKrSzVK
	SeBw4rmG0O0dCEbU1QkVTu2a0FqNR+iK1mbacsJTqbVt0Di85I/eqlxxOXA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v3qj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:41:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1694784a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911282; x=1794516082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=HF3tFdSu1sFo3OmMzaEYdKV+BaRcmPe8/6tfKrgYIqYEcGsyjktWYJtZlO0gY/TUAb
         UZOvm0XBLWSzXzs4y/A7tfCQO1BAd4bMVA9RFrpcmqFwcpI6YDPJNNc1GoUW1uFgDm4b
         CfRgMDTgjlZNMCNDdgBjr3p4zjhoFJjcxRVUOadFTd3LJC3Af1No5ldDSEAyoQZFZi99
         K8aRtFRFqeMM7UbWnZzOK1V2kBrdtmwJLcwc2NJcLb5b+LNcYHMhNIKzRRtvU7BlpOmk
         1zwoSuGhkqETdeg9jomq7zP6YkAaqNUWmmftzCZ97lLJj7gCkzroO3qOkVgWHMjKAHLc
         dDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911282; x=1794516082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=A0DqRqe69SH6KTSvzKc0PLiURapf4kKBdJIroxOy4JiJomrOwt/N0nbamXsPc+boLp
         lNQWBK0nY3PQTcsfCLqERj7QRX/sXXljDU06fsQmhB0tQO42BG968oYWnr3u7QQg13AF
         2X96b7bujNXTr1cvM+j8TRcqvuH2RVuylpE852zgx+wOCdsx0Tf9Q9nPPP0jNO5aXwyl
         8fvRV7ntE86oqNhptiyeAcqjaDlfzftZLrUNWeEwHEbTdSpOTgWCx8wR3iIHaLlCBsWQ
         SNMoLcFaqQvZNMxy7zvCPUYs5sXWbzYPIRJLa2GMVC+rdvWf91S+Yy50/VU4IH9DVPw9
         uO3w==
X-Gm-Message-State: APuU4Z+dDQvMsm4OuBWQ4EGglpaA2HkjOXc8JzlB93BEqOjhszaYZ8CO
	Qps8O2U8Jhn8X2cbMNRZLXDBGD12OZKgYmVRhktkuXAb3Sy17ZNaA97TX45XVXDUrhLMrk3uZ5i
	NxJm5g2wAVES5OfG3+QuugXkmh1+2FwaKL70lOPW6nB3kdu8ieri2ZjmEKc8EsP5zQCzW
X-Gm-Gg: AYBFou3fcJuP15wCQRmL4W6jsfEQZOWrtvIAvWBKG5BY+B/aDftun/PG7X8lNteol46
	9xeX/Xb24jq0fLnXlm+2bhoGxabrqbMUfD3cfTZnuNT15pnDRoK+24GEJgXPcQjhCBMMjlFV/32
	9bKmyT8edJcF5c+1k0DvsUX6Xiex0qxOL3KUY93QosdpuoUfMBOeW+i8NGiA6Q+FQKXzjVE5xn6
	XsepgrpWZESs2/fTE1rVrAGCvLt3AQdg6GJy7rs6Q487qzgjg76KS5HvbJjSxikQNSaeuR4cKoy
	1d4+mjdJrtAXWtKkwt1kcl/meGVdp6OOO3L5OfxogCx4jr9y5cv9EWYulL6goqKnWkJ7XDCRHJC
	vxGUXlloOnoSsv+fj5O4jsLSzzLHBivBWCK6raPNMpCtecnvuYzYvOHRuMySZlo6xAizIY+Zt+L
	gjkme+gmx+e/2AhAathwu2O3ucXt25DOAwbdqL5XfPmLYvbepWeh4voZBA+05aXg==
X-Received: by 2002:a17:90b:4b0b:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3b0db6d7710mr164839a91.16.1793911282463;
        Thu, 05 Nov 2026 12:41:22 -0800 (PST)
X-Received: by 2002:a17:90b:4b0b:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3b0db6d7710mr164816a91.16.1793911281992;
        Thu, 05 Nov 2026 12:41:21 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944eb1d1sm5492749a91.0.2026.11.05.12.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:41:19 -0800 (PST)
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
Subject: [PATCH v6 13/15] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Thu,  5 Nov 2026 12:29:39 -0800
Message-ID: <20261105203057.66520-14-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX5zVDtMJOy0fg
 2+dQdgF4NsfVq9jF5pDMxVTIWQpAivSLCNDnXDQIPFeZB52lOEmOuc8uWImqFqHS0Bz2/qPTvkl
 EEPAu9FxesmS5BRKiWpZrSMkNZgb0s0=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aece9f3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UnxhJFuZtzOLgjs1IeAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX7KeG0ecMmsYI
 8xyACJhKBzbu88aauevRLtZ9Ag0DfsP89SM9Iit1lDMP6mwxbqc9TI3ziY9vl689H76wFDEq4KW
 E7RJS7VPdwiOK7xKrU6bshyMKhniMJfTlfZtv106mCR8NlyCeABvTQmygitdco+e0bP6tokuu/o
 VY+USJR8o+j0CNCXyC3MLCgKnKNPst9qVF6ch0oE9mMUvxifEUqsAFsjUbUwpdTL4EUmG21rKeM
 sZn0uSDrgK0iEU5gaSWno+4LJUYdhBijMCatrZz+x0xFYjvRZjVlacC217O7zbXFeHbVEe9HAgi
 apsPgO+hFNfp1O3onk6kcCNEP3NcZ5lEL5ngf7pa4PXI+tV+hEH20aIOzbCwYDDp94KBD3kWNAy
 9I/47OT44FSxbqOteFVyKtavXMTH/J4Ck9ExKP1pysDN0ju3jp+MkYuOe57nLRQkSwCsC2ZOeNm
 F1u2Ki46eXvJPnMalFg==
X-Proofpoint-GUID: pjf3ey75pcUoyaXAgnFmxwZkQBOGuNGi
X-Proofpoint-ORIG-GUID: pjf3ey75pcUoyaXAgnFmxwZkQBOGuNGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

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
index f65bf82e5c21..f6afa5b3b0bb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -261,12 +261,21 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 
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

