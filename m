Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837839;
	b=rwcoU+9mIcCMtzTA7tMc/V0KFQQjf9X5D0uT3WfYt0O7ST/pb/yYaiDAkTNUoNExBIg6
	 fbmv6//xBX9niT2wjW8AXeNLBsGphGPWVVTBvKn6gWr+7siLQLK59ZoTU99sbxr2DQQ91
	 NvGAcHsXl4oproX8F0RIdNjy74RZWLXuKKMrVeijcN4MH8q0vqS3Jll0dXV/qZYnR9Gdx
	 Kan/LsfcqFMZ9AljyKseAOLlxmQILW7v3YUCwsDNfWp6tfAlkGZWv42FlVfAp+qEqTpQS
	 kGt7M6dgSaNSot6KuJgDSWGpObClt9s1UltGB27m8MzRwenAubOoIZ6fJrhlEfGaezA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V5NtsJrgMbZa3kkzwniyhCS3GJ4Nc1QusU2jPyKMY3Y=;
	b=tJpopMD/2p5Njh/MtPMP+WgOSRndFLj0j6DtLQ4hJMESWOhtHrm2KFNTmX55KGx6L+JC
	 X5XPXYncnnXId1iY0epAoSkt/HOUG9Y3LvMllctL9r9SXgrTkgx9bbWEld0eHgFvqnWBP
	 jAgUuk684CteIlTe2nvLlQqbfSd9UkMeBvkXBYETE1/srDZhhMWgjrFxzqdV/d/JJcqt4
	 UXA9GzRGT3RR5tko9Ofe5EOhdwYqnyjDbeRK7fyCfe6vtW6R+xCCvbltRCOGhWDq9UdL9
	 QxJDWSnJJSXwYo7E63eAtjLCcTFp+SXyBMNGX9Pd0kP2fdLLhXUniXs4/4zQ+hJP3nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQ2tZ4Gd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNIP3InJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75B6606A320
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A75B6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQ2tZ4Gd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNIP3InJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8oCiO3828105
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5NtsJrgMbZa3kkzwniyhCS3GJ4Nc1QusU2jPyKMY3Y=; b=UQ2tZ4GdoWKQKtiT
	q+FZTNWFJNKLrrMOpwfg+zqTxl5U5pp107+K7cMGpZX8tnoz7m7YLu1flC5Gy/7c
	CP7YFWUmn4B/LFS1f7xo5wyECNEjQAjcm+NQz2Q2ZtR0hM3Gz3dKS82uahOA2aja
	KLPPObQYxkPKQKqfFX24DjEMwP2QR6tsE4HCYZCt7xW0k0q/aS1UJFcWQFt48gF6
	S1Ndk8KM0655S538UgpfnuQzJDsw0gpFG0jJNIeHBSKhxlvh95khEPk/A7nSuXdP
	U+RAA9f2iP/rqtnukJTSQvoJqBfmFwaPYk5JJY8LVefkBAB9t24G5K3DTcjH22kG
	J2AjsQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuk8kdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-193b5eb133eso2207819c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837837; x=1793442637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5NtsJrgMbZa3kkzwniyhCS3GJ4Nc1QusU2jPyKMY3Y=;
        b=DNIP3InJdbU56PhpOpXEe19XyjPrZKBqGoD6PA2bzYvCiFGlhEby1qLF5X3ydoz7BT
         ZBDqVlsU5BTcmdXzon3dSPJmIAEwNs8bupiLDvhSUnfJIY2qN+OVeWcQSDKiAEVKf3eS
         bSJvlh9QcMbskm/4Fq7OA80v0/hbmFHS+SDePBleS4Rp1FpS01ThxeXn5DcUBdd7JH25
         8WQmh8tkCTGhkUayXaTACNDeJSx7r7Jzhp80ZxPH8//fOyi5dKwlzShpyJqR3U+VuOVw
         7Yea+6lqj6p1ITuUtI1oKM2S6CtBPMeg9fU4in8HgD/tIzxw5Cxg2n58A/cWipMs7vyy
         B7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837837; x=1793442637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5NtsJrgMbZa3kkzwniyhCS3GJ4Nc1QusU2jPyKMY3Y=;
        b=KY1ivkyP6psQb6Jng5iCiYKCTOr8sDgsTYWEAxAbtfYhHRQX37X2Rx/a77VSrE6Sqa
         E+BXEd2GLD45sbQZlmEbNH0C8kBBMwxVhoX43NbtgeEVa4W0sviHYNMoxq1u6kX/prdn
         mALAAETLA/4b8s2+DAnFZV7Dh6Jo/YDHmdRg/I+VAbKm3CzFPUcpHUxGWnPIdyNdT1lM
         EYtwPuT0FvqfAu8NQADXaGxTFxKLpqSD/cxpL6OL92DEEtEg+Bf+4alLxEcTAn/UK8vC
         Ydh+AQes2hN5OJyujlX5t+Wf+go4LjE4AyEDiN/cUpmHBF3VqrIhRfDxuWRNTEzCE89w
         enAA==
X-Gm-Message-State: AFq9FYLfUJaojalmYapJK+STAscaPyfKPtzTccNrUkLr+N7saBHM0WRb
	o3RsbubZQrWNUxZeQL9Ur7I2RvkSPWM9GkvDnPdqXC+/3Gic6qQzJ8KLxH/FVi/odJYriA3fRXS
	W2xBKZrpkIF7GeQFI7Tu6ZAaj/yQsQQ5QLrsoszp5EmmCMsDREFRvoZ2PFNo+T/0Hy5JI
X-Gm-Gg: AYBFou0H5WXeIQlNNDxZplqFMH/wYQvyma3UtPM/cJm+lu/TIqQCr9sXjZ8BEusDnec
	yvJ45FuAkLanQcdkBzbNx5sQcQZcAjxW7j8g/4ai3B9vM8JLcbGDTc06kKGT1pzXGyz8rQZX30z
	j6RcfmcMURbtQpJtIui51KRhKIqLXIRwMIw9Z6W8Oyo6F6y9KWVMC1F58HAl6CoH2IKg7dv/Mcz
	FV2sX/AhtOrJmUFD3O/59W6fTypPynPSnaF7cOSrh7Bm4r/g9oDNrNYnsECYVlSuG4G38tsNOd3
	vCNYapu3vIifk21k+V2RFrgmgO0sSOvjq2jLf+0Wgu44NKtbo3GSrHS3pYM/HoSb1Y+bK+nvvCg
	6elaTiI0IojaDegbEN6hQjl4=
X-Received: by 2002:a05:7022:5f0c:b0:13d:19da:9370 with SMTP id a92af1059eb24-19935437c7amr1906327c88.17.1792837837157;
        Sat, 24 Oct 2026 03:30:37 -0700 (PDT)
X-Received: by 2002:a05:7022:5f0c:b0:13d:19da:9370 with SMTP id a92af1059eb24-19935437c7amr1906294c88.17.1792837836569;
        Sat, 24 Oct 2026 03:30:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:30:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:08 +0530
Subject: [PATCH 2/8] drm/msm/a6xx: Fix GMU shutdown idle check
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
Message-Id: <20261024-assorted-fixes-oct-v1-2-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=2051;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Ow0o4P+y/rXq/ok/jal9ZHL3oAONSo1ouiNN7Pv7Xiw=;
 b=juC5HV09ueBy7MXDLOeymT2cZOTCtGhYie/nkZhJXoUX2FN0NqE+U875EE+/PI+VSWr+VgsGM
 81kh3FlHmyIAM1CL2QC2acFv0jT+TZEM8mvP1lwKI2yVxveA0Vn4kaT
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6adc88cd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=l4a7mcJWk0S3Zsek6REA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: zsMAJobZP1s0tBtVhfoSFacBgBfW85rE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXzeeXInv85S8a
 0blaHTVk+xbkcb6u298lo6wH+bHxuqUbwfe2UVRNn3hg5FBK7CH/9+zkYGL+EdNwAI7d5VHJcXv
 zHrU9wSSjhejuWeKeBRcPemiR4GiSktXklkyvaEzZ5Dh0TU0yLYaW5ANpip3A2rPYroe8LQs5Xc
 H+84r+AOF2vFpHA4G2LU2ywmkAxu36ckY6jnkYkyO/dM66TZMEt9x3ttEPv1CqNoBoYf8047zcw
 H3dYcUVFIldME3vAPcX8RIFHLeuPQzriSNXtJu6u62kXKV+terICF7O8OI3kh8mSJG4Akm5Bkxk
 XCfaYjPGVmBgwNExj9zFnz/DX68jmIEAgb+Tnje2RDJLCHh8c1o00AcNTQvlUN6jJWsYploeg/N
 q/zZVJhNhczgkrbJDLI/mIX2MqLxv/1n4FZl0chDbIZgw+3FGyz/MVlJDWbpTAXOx/0OiNZG6q2
 4DyYsvVg5gd0BKaZD3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX6jwohNLBgqxG
 MYDGqFY3Fcobf2StjlLakofL2+5kCId9u/jT/GXGABa0hUJue+gEJBZxd1vRyQQZ4ApfM+ocnSW
 yMwJOc9Ehe0SVpQnX2Q4roPstujBETA=
X-Proofpoint-GUID: zsMAJobZP1s0tBtVhfoSFacBgBfW85rE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240041

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

GPUBUSYIGNAHB only indicates GPU hardware busy status and does not cover
the whole GPU subsystem. Use CXGXCPUBUSYIGNAHB instead so GMU shutdown
waits until CX/GX/CPU busy activity is cleared.

Also, increase the timeout to 100ms to match the downstream driver.

Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Cc: stable@vger.kernel.org
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 4 ++--
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9e02d6f939af..7e80670736a6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1461,8 +1461,8 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 
 	ret = gmu_poll_timeout(gmu,
 		REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS, val,
-		!(val & A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS_GPUBUSYIGNAHB),
-		100, 10000);
+		!(val & A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS_CXGXCPUBUSYIGNAHB),
+		100, 100000);
 
 	/*
 	 * Let the user know we failed to slumber but don't worry too
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index b3082738c99d..786fd7d2f674 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -224,6 +224,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x23b0b" name="GPU_GMU_AO_GMU_CGC_HYST_CNTL"/>
 	<reg32 offset="0x23b0c" name="GPU_GMU_AO_GPU_CX_BUSY_STATUS">
 		<bitfield name = "GPUBUSYIGNAHB" pos="23" type="boolean"/>
+		<bitfield name = "CXGXCPUBUSYIGNAHB" pos="30" type="boolean"/>
 	</reg32>
 	<reg32 offset="0x23b0d" name="GPU_GMU_AO_GPU_CX_BUSY_STATUS2"/>
 	<reg32 offset="0x23b0e" name="GPU_GMU_AO_GPU_CX_BUSY_MASK"/>

-- 
2.55.0

