Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956441;
	b=Wjd9TY/dzPy8fl2mrXGWn7ODVnrahsLdecuL9DsNaiLe9bRCQP7xTwhkotMnQ3Yfz7R4
	 aNIX3d4ELkNvGhGIlr2lgLZreAQ0Nn7MULX/6MHgUKJtIwR9H+Xq0SzwUnqTx0ndsQLwG
	 xJQs0ukOngU2PNp9C+Ez+MdFCOQd2pKuchYasqx8zxkbekYPKVXx8Hh6tFn0GrRnn7jjs
	 ftZhdq6eMMVdPsC/7ILUuowwFcv527sqTDaCPSaXosmNidZO8Wny31GLDkVbq0LnX41TS
	 ky+F41soWKPaue+xMrDNWMTB/iDqIr6Sjd8nlZKycVC8li0a0EZ7TOwturyjxA3kkJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=;
	b=sZYNiHvcZJg7IG27GVOjboAMAt/NfKHIJBfT+XSP4LUBYQiz2435pjUQPUzuZeTzCnHl
	 JLvp6XfXYi3Zxa4I9UjL/01g1DdWESa/Y2nPW24hCNV1bzRPG7mMvkUYgUE1HGLIqxZPX
	 o5GAyhWYa9iFstxAnPvFpyARrHO7OIxvGpipFO8lFo5P5Dq9sLoEtFgv42+6dv8ciXwJ3
	 Y9sKShfV95xIxQJoXZjtbMUwVM1CLKA0+SoxB1RByInGHr0Eh600Ycx3+trxr1TnTPv7P
	 0KhjWEPCdixSy3exfwLNgD07e5MsfJoNdWrPSv0Q/aMJu2OI8D5Ff88OxPkUFqT4+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HXmjkkCX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8uhyioB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FF606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HXmjkkCX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8uhyioB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMeqMY1958033
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=; b=HXmjkkCXMmQ07/pQ
	dK5tApiuY6ApddYlMeBxpHYCJ/DEz+OHOuaPrSZrvGsA89m/mdBeD2jTh4wtGbr+
	IbkrH5YUH19dbAx2t/R/NIrNySHYr1zAomTssvUFwCVXLmeSizj7XtGULAc6nTpN
	Iix5wD9BGVcL5uoP7ZrujhV6xeM4x4kstm6VoxjPGkY4sQPDfpvQunyNkPsCFcsy
	5c1GcpOOkbTSWfE9fArk3GxXSR+p6gizcYRzXAEu4HqHy0l70gEqV1rN0cEtbjLn
	cthjbRGuZmBEDj7APlm0p7+hAfmy3gKh+IpxbGWCHSUnm372TW6ieBnCrh9Vz2bp
	6bYs9w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv982gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:40 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b238436265so328865c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956439; x=1795561239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=;
        b=Y8uhyioBgjamV1DI0NdYUsJHzFQvkYI+4QKtG8iwT6jXGibVvKS/9qNb141maEupGU
         ftzwNynjLZ/ffs3mwHcO8wijoDjp3jtjCm58xmODy27uA/MGSoB4pE/XwtdE/Z7oYdZI
         kJZTNHzZ3q4B1jSx8qZ3F+0Vucl7O5TOfLa33MYs1+LJP5VKGwgbR4dgQ5RxTmf5cYqJ
         dc6ZFWgJKectrFJa0un38hqpKFKb3TyME5eJ6HyVMkL6woyuBjrMeuZrDk6Zw+LHkW+4
         M6ix0M2R9aHvmSwtbb/M0AvZlA267OxpnicNKUUbFoA4vjl20jcv+2xhIaX3RzDoNjer
         VxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956439; x=1795561239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyYVsbnjSgxZrolaAwdyDnBFwjgdkdQVgoD2DRLJVBo=;
        b=sZWrZMuh10psamGPgXz11bjgObQc6CUhwvRlVmapTynPR9w9ZgjcTJBChi3XYiitTt
         52yF8TQvqDt5AIO5qXAot9QlVH9at7koBExb8LhBCEwZMLQv3RhnvDwScRuG1EuUcW6f
         3KL+mzuxe2aVh13XqNKvl2p47TM/8TT2dLxr4vGCZVw9NdwmxnCg7JR104xc+mulD13D
         7E0QTZ0lUyrm+1YlmiEwnMYiBGV3gW41A6zDgkstPKuFiHUlhE8H5oKdOApMYLbWzIDN
         kT8vVvkV72iRoktCmEhYDC552fFWQQzHO39RKiYMw2oMSqJ/RpRpaLXuGqqFJj20wpsy
         z1TA==
X-Gm-Message-State: APuU4Z/P06Rt3oKwzYniS3+9fuy1rWsXX5tEt2dbr/RDeLIDeY8aaGjA
	wY9zp4F3Q74xFooCW2r83x8Kj9SHaYlaAFejs3qXCD6fzAv/QiOrcayG6VE1IJgX254b7DplRkJ
	ctZ11bP6TmaSBXWgfNWQrNiP3lfgK/0vhMsJsdgcJfRDrDEBKsy7MmgSYOXmWL2ksQqHA
X-Gm-Gg: AYBFou3RgO4wEjLLXccvBI82y3UgqNE6e/i8H6DDdk9dpw+pmU/Sv34QBV40/i5bQZF
	Jl8NdiREiNtP+Os34Upu3oWersw/eLIGZA2RircRzXvxoJM88jqb4Dp++LkXTnMQ91tPBbo3bME
	Znf8Uv4PegDr7u5SVJuNwWF8fXpRXdeN6EKfQXw21kuyHCG5FB9dDAs2dSYdDbmR/8CFx4oJI92
	em2PzJtM4x5UxTvjJWEkkoW94sewrS8UL2RJlcWcF7xWE5SS/K50dFy9DCZkv2HyDrfiXtz2Dn3
	FAb71os35oddPkRSdASIbcYrq54G7pngBfD3e3Odvjoeupaygs07G7b3547qO0NQr5Di3vEzBj0
	Poql6YTf/ZLyy7woi05FiC6I2/PzC/j02iuUeFpC5OQWymV5IeSOhXwLN7WPvRGaXPm2wYPyvKw
	==
X-Received: by 2002:a05:701a:cc82:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b543cb3e8fmr889024c88.16.1794956439032;
        Tue, 17 Nov 2026 15:00:39 -0800 (PST)
X-Received: by 2002:a05:701a:cc82:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b543cb3e8fmr888979c88.16.1794956438333;
        Tue, 17 Nov 2026 15:00:38 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:37 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:04 +0530
Subject: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=5375;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XPMx9YeTMn3NW5my/QSibulL4PbEkf63zt5e+XGribE=;
 b=iQMioyMW+Gvwiy55j00nRWZ/pCqgAtJMxr8lzXpjw5zjYAooUHT6Dqslag4VAiHXESG2z8yWL
 1tgkT/OatFMCZ8oeyQfQI9bi+jZcFuHBIs8pCcOtktDzRS2DaS0MSEJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX8anQ9kobkk2a
 ZwEQrwsQnbWIBGzh6qqXZmtqVuM8HV9WQTh1VB9KiEGI18TLVZyutDdttJSB1/XyDpIBaOtM5Lr
 4zfV+zKVDb/hp2oSI/1i7ncOJTKqdlA=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afcdc98 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hH_-AztgxIDa4u2WOLkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfXzb2KZvlWxfO+
 v2gXPNaCUQtB0vSaXJwBk1digR+5emPaYAMu64oE25msWNtmWi8adxYWS+JvkNCA5HpS8BmMnAq
 W9qsrXUqWt6KT0IjXfX04snv0+5RD+o3q5vgwrOjMZ4506XEWuuNzHqHLIM3P4EzfxITQ0sBr+a
 lVTNe5jSR2Y3qjoYJ/LXAVJbLia1bfxNeglfkWoRlIXAKIP9cZRDvTnbfen6WmmRsT+245PL5aA
 kv7E0ohQFE2J0paKvy/DWlmFgl1cWrjeW+5uIsaedHHyz7cQpalY6NHJuYVh/6aVukIR2b2tjk5
 u5enIX51kR6ir9NTy6EPOZ3iSQDH4NfzmyCXCAMnO9V/lDeNlNrV69ATfTjr5ocX+KVE3YsTByu
 oMZXoZkd5Hc6+v07bdxKscrlyoC1SBmadoDKH8lVte5C0Fvj/IsNbBsW7dyTUSf1UNHY+muUjs+
 ZQqaoIclznnW7tR3F+w==
X-Proofpoint-ORIG-GUID: eREUeV1m6Vm01qeL-wmfFCynihmpCQc3
X-Proofpoint-GUID: eREUeV1m6Vm01qeL-wmfFCynihmpCQc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
the A7xx Gen3 family. It is derived from A750 and shares the same
IP-level configuration: protected registers, pwrup/IFPC register lists,
GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
record size. The differences visible to the KMD are the chip id
(0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
firmware.

The Nord primary GPU is the same as A750 but has a different chip id,
so it needs its own catalog entry. Add a new catalog entry for this
GPU and an adreno_is_a753() helper. HW clock gating is not working at
the moment, so it is kept disabled for now.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  6 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  5 ++++-
 drivers/gpu/drm/msm/adreno/a7xx_catalog.c | 35 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
 4 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index a1561ca41a5b..0fa2d2091f3e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1051,7 +1051,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
 		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
 
-	if (adreno_is_a8xx(adreno_gpu)) {
+	if (adreno_is_a8xx(adreno_gpu) || adreno_is_a753(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_CX_CONFIG, 0x20023000);
 		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
 	} else if (adreno_is_a722(adreno_gpu))
@@ -1227,7 +1227,9 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
 	if (test_bit(GMU_STATUS_SECURE_INIT, &gmu->status))
 		return 0;
 
-	if (adreno_is_a750(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
+	if (adreno_is_a750(adreno_gpu) ||
+	    adreno_is_a753(adreno_gpu) ||
+	    adreno_is_a8xx(adreno_gpu)) {
 		/*
 		 * Assume that if qcom scm isn't available, that whatever
 		 * replacement allows writing the fuse register ourselves.
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3e4afaa5345f..ee885c663ac1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
 		return;
 
+	if (adreno_is_a753(adreno_gpu))
+		state = false;
+
 	if (adreno_is_a630(adreno_gpu))
 		clock_cntl_on = 0x8aa8aa02;
 	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
@@ -1421,7 +1424,7 @@ static int hw_init(struct msm_gpu *gpu)
 				  BIT(6) | BIT(5) | BIT(3) | BIT(2) | BIT(1));
 	}
 
-	if (adreno_is_a750(adreno_gpu)) {
+	if (adreno_is_a750(adreno_gpu) || adreno_is_a753(adreno_gpu)) {
 		/* Disable ubwc merged UFC request feature */
 		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
 
diff --git a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
index 6f704898cea6..9465ffa3dd12 100644
--- a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
@@ -451,6 +451,41 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43051701), /* "C523v2" */
+		.family = ADRENO_7XX_GEN3,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71300_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71300_gmu.bin",
+		},
+		.gmem = 3 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_IFPC,
+		.funcs = &a7xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.dyn_pwrup_reglist = &a7xx_dyn_pwrup_reglist,
+			.ifpc_reglist = &a750_ifpc_reglist,
+			.gbif_cx = a640_gbif,
+			.gmu_chipid = 0x70d0000,
+			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 3572 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
 		.family = ADRENO_7XX_GEN2,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4b2156825bdf..2911d440ab17 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -559,6 +559,11 @@ static inline int adreno_is_a750(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x43051401;
 }
 
+static inline int adreno_is_a753(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x43051701;
+}
+
 static inline int adreno_is_x185(struct adreno_gpu *gpu)
 {
 	return gpu->info->chip_ids[0] == 0x43050c01;

-- 
2.55.0

