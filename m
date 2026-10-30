Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397932;
	b=l+Zo/TM4W8puQIy05y5SFevbK59s/5EC0cqhRVDAZHvxYUn1azZLyeh7baf81xgsTwl3
	 5yy68Gs7ocHIEuRSXIWYT2Tn3aKMvzArIAFsTZouiusn6M9BOG/bjWMm03W6GQ+UM6Dai
	 bFfM3pheD1xSBqqGgkd+zeiKHZ5UAXaw3TJ6ZsWwy2me8JU5cbe13sRuzQlRQO6dTyp7I
	 74dvB3sE6yBjEvStYtgKySv6rJOzFIF95c2UCz2a7/IlW7MgD8uLqKv1vQFskFXc7dAyX
	 xyX74LRRki6/cl5fouhIHkI6UdrAeUVCHYir4oSpXOL1EkzLYIwBJ3mmPHdCknvAwvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=;
	b=0rchkJTtbgmQGSkTC/M3cUn8u1klu9h3tXdY6vID9OauJ3LZssqNrf64tt4ANFqqRupT
	 dwANH6iOQYhsrIO2WTR8gO/fziMuf4elDjRNgtswpcI695do6Mc7y+L7zrmouUzCWsnfG
	 tsSmcrExxjCKLnLmjFrzkUuvUCCNMX7jcN/9s9yN9VujWyVkvjSVGyfwvjJHNKoosrx/8
	 iYem94P7ufVXHSv6mde0JNHbk7QVMwVotAgUaulLYo3zU1LetvtKrUjnqXlJn+1stNZCZ
	 Ar+sxFRP0xQRfCLzrfs1r/K0CSnlHbzZ6fHOvWPfY258BOgGa39pk8v49jgX73ok94w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HnQz40G3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X7RHpIX6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA5760A260A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA5760A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HnQz40G3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X7RHpIX6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtcJm336825
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=; b=HnQz40G3QjylPR5R
	yig72MUD6M490+bCaOkbfMQyo2euaiC6V9IBBLWMSQjVqN00Jk9LFZneG2rtog9U
	QKSLhqoJ+6f3nVhKorUsrVWT7npCkjxmnP/l+wiYxOTu95C0Rxb0RdF0/QxdN3au
	xRXLJpm8hWEJtZ6hRy6Xfn6wZkDQH/kcXuruMnsDDTmMnDVJt7k65vmISDCpkvnI
	5aniU08RbgmWIwA2kDu2uAxANg1M+Nx25OgBko7hsOkggb5cQqkwx5Zl0nydM7Fx
	GOoZoXI6Gj10IFxKHEuVLUbV3n4Hmap2Zh0YTqYriUyRCj0yYQzpfZdlEhFYYtgg
	hlDW3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x007ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so111178385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397926; x=1794002726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=;
        b=X7RHpIX6YnSXHtXrGojuHdlrDkbWT3VxLGuXe+NpzMHw7BIqt7cwHuwZIMG6DcaRqk
         jFzJNmxXRt9dTcbxxfEKtSdB2Q0Xr+JBCI28c5OBUhZ5tVZm9YKdAayGKeQ8fcAxI+Ey
         KiWskYmAV28+2KTUfVP59saVNkUirOpOZlbK6AWVRq98b1LKyuWxssLy9/gEP443e/Mo
         NQxGB6lOwHozZ+kJzt3WXsUhRHZS36maexbHvI5kFchStRHzutWV1i/+f0WJeJZDPUV+
         F3LBvCGNHFZwSUH1i72XzwccNP6S6KAN8S/A4HktwWc4mEv/SlOX96q/6ohXsTVS0Gz6
         bxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397926; x=1794002726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBQYFH9qY/8wfFZRkj4H/m6BfoRm9sVnmTawEHfr+ek=;
        b=yRNsvoaAzrJSCtXZzU7x9mjDMS2RmM2XddWIi90MEd1HWEBn/Z0VmbfjDD4KmBVdt9
         3dhmktQafMJs8s9n/V2vktZEQer+Cj2wIGFPiBt3W9CHHj77oihrTxA0H+/GKoyjyCYt
         r1r3367jOFq+I1nCGtEzsXr7ln9CXRvQeniDsVGbtiXou123V5SXn/C3Ca09S5BX5hAz
         leC28nfvP/iEn+3uM+OQZcvyhmJjWfSYcRHFltlAz1ogeYna7KnJr00xAP5r1+pHwOeA
         w0GI+D+44SZKAyVpz1Dk8MwG+kxFrnVJAFXada3kQtWDeH25MlqEnDet0su9vOsEhNog
         aDUw==
X-Forwarded-Encrypted: i=1; AKwUvBwIR9nt67XGuK0EYfSzszhLF1Q/Jd5g3OsiZfp9PNCKwmTyyCR7bgIbUQRdxG7u/QBU/vWsK5BHt8b42biK@vger.kernel.org
X-Gm-Message-State: AFq9FYJ06mQDTdRY73aMIxYD+JY/z93ilCberfZ6v5KcuvW13R/Jhq0R
	0nBx5sJ8T8xmLEbdsCWnk1sa4UVM4BNyIu+pHT1VKF2htAkE85o19nPQLpH+VpzMW5874m+v6vt
	3Ih2lHYCLC/pWlpYxB7Xt6G/WgWSeV5eZjuC1BaSMEH8j4v8c7xb11Iuc5v8Un1JbVmBq
X-Gm-Gg: AYBFou1d/jAu0yc9NPc64puvjM3dOwAHsj93wMFiqEmTBuXBRbnQQYgkMj1sB3T39Ia
	ijTYXd9vV2ObTRSTyalQUEzWqJNs0ZmSkbPET48azLyoOVPc+uqA296t5GkfFu7GIiEu8ZiMhRA
	wb6N9ynxIkahT5eXFgth5X7NTU2UEh9x1x1e6HTv3nXKhr/Alwz67MZ1+kkZTnLsfB7CD3xLLZb
	VEGGJky8BuqPjBgOvUckFt2h50qF2WetNTqIdIiEstg1k0DeiN89KOS5YE/8Xjy4LOTJP2HWHRa
	6m9r5lmjDxHuOAo2dYdnsJSoRm0S3AOjONkKs6C/B46VlW+OKHJsn5qnEDtfVFzYq7WzkJR/gFM
	lMk6RyA8X09+RSjugSjFi4+ajrunXpH0yA0DJACHByRrIeTbp3VItscLBRkntwChkeA5eePdxrF
	rR/7qlyIv6ibNl1oR3mRNjxGWRUDQgV4/S297zv3cUk46mydkA8Yd2Si0pbrHA2g==
X-Received: by 2002:a05:620a:6cc4:b0:93f:34c9:9259 with SMTP id af79cd13be357-94421739a72mr652258485a.50.1793397926185;
        Fri, 30 Oct 2026 15:05:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc4:b0:93f:34c9:9259 with SMTP id af79cd13be357-94421739a72mr652253385a.50.1793397925571;
        Fri, 30 Oct 2026 15:05:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 00:04:59 +0200
Subject: [PATCH 3/3] iommu/arm-smmu-qcom: Use identity default domains for
 MDP5
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
Message-Id: <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lLouI/bTmjXpgte/SazsuwobLVMNh7dfXWGAG7Gi6io=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSazf2fJ+5mBp4xuH6MvlX8NsIWizZkVogDf
 HSlZFoW9geJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUmgAKCRCLPIo+Aiko
 1SSoB/wIW+hEwcrwG5R4YcMUL1kBGVFaXiqV5T01kWY39CxgAlb17URcSVuExa5xChycU9gLYNZ
 bc5wDh9hG0nd5BOnfNuyflAbWRpYX77ysC5FN7YmLxrLir1sb4tnk1bESZBJHeSdU5pKV6NcnnV
 IixfdDOsfEhc424rQeuMmHrNaTINCAvuz6P68LFcU1IvyLWZpnuOsqvA5xW/hBJ+tqYcMl5Hd4G
 2nT1aWAVW2bn9PBrz0z/n/UU92wibmG1jUvCFRNXE+rsI7Gg9tYInEYd8OMKhWYHDyaiuY6lEVu
 6H6TNxngELa9cIj3bCS8y/R8ZIZLZaDlU0c/2u9RZMZ4fi/Z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX3Sk9xxBZMDGr
 f0JVlI45SsSL5HrhK6jmU3CLcIoBLWpKUZyV8xAFOnUAc2ssmjO7eLF4VdecWFi3xpDTkJnOx8V
 2NCsVUcZIqEFYx9Np6ID6Y+0y3ciQMIh5zTBn/F9zFjK5L3dHPZK+M82OqqYBx/YiMaNzS/6Z9t
 Txos/9bAiKWM11kjsNnHWrNTo6OLKhh9om8nLAZrNOJP1OTGmL4iYN36F0lJaLNnFcEDZjlmaPU
 7LIqw5vvLySQ/GVOq6fkyBYpIE6OX6o55FIIzMU2bOVFkGZ1dcEsAve3p83/D2+xHSrv6CQNWYp
 jYl6OGOpLJRfirhMt1h+6AOZz+Nn8NgMnzWELq2SVXbEINNss3jcaXC4KbG6hnpBBrIQQqif/It
 1EwZ3Jfb6dxvXURepp1aXcAvsvDBYsmnvMC34b3EQ0IHMHoWsFijCu6y5Qy0OccCMft96V4K46X
 5leUZWcpJA6t294Bb7g==
X-Proofpoint-GUID: RLvkVClB6RtiuSKGhhVO-KcNpFWGPetK
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae514a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rLj9A8cDlUUE0Zp7hZ8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RLvkVClB6RtiuSKGhhVO-KcNpFWGPetK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfXw55y+x0AsErO
 5vwZx+SL/wiyeesUf4USnZAiIqUALTT3VFpewggwBXgPjtWHcVA9EGqKzmg5BBT2WSQr3aYqeWw
 kbA2pBmop16XrIPN3GGtaU5zrAIVVvc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300088

drm/msm writes the addresses dma_map_sgtable() returns for the DRM
device into its own page tables, so they have to be physical addresses,
i.e. the device must not use iommu-dma. On MDP5 platforms the DRM
device is the "qcom,mdp5" node, which is missing from the client list,
and the msm8996 MMSS SMMUs have no qcom impl at all, so the device gets
iommu-dma. On db820c the SoC then resets as soon as the GPU starts.

Add "qcom,mdp5" to the list, which also covers sdm630/660, and give
msm8996 an impl with just def_domain_type, keeping the bypass emulation
out of it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..addba9074217 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -408,6 +408,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },
+	{ .compatible = "qcom,mdp5" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
 	{ .compatible = "qcom,sar2130p-mdss" },
@@ -642,6 +643,10 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
 #endif
 };
 
+static const struct arm_smmu_impl msm8996_smmu_impl = {
+	.def_domain_type = qcom_smmu_def_domain_type,
+};
+
 static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
 	.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
@@ -711,7 +716,7 @@ static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
  * there are not enough context banks.
  */
 static const struct qcom_smmu_match_data msm8996_smmu_data = {
-	.impl = NULL,
+	.impl = &msm8996_smmu_impl,
 	.adreno_impl = &qcom_adreno_smmu_v2_impl,
 };
 

-- 
2.47.3

