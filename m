Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08140285060
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138602; cv=none; b=JpuaZgwG1xwa+KMfglDMqFPu0zoVhNUsHT9/OC9SUn2e/V0ef3bt7A0ANYHs3SQRqHp3SBehGJabHIKFDetspxPxVmBG0ygcUynkNl/3/8CbwKaJeUjV5IwDKHeOlQ1jjQlr0r/XM7C+xtenR+drOUo70hbAsBWeOTdEnh2gm3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138602; c=relaxed/simple;
	bh=FtDAmcO0ZVXIA7oxCRX7CLMaibYbkqrp9Htli2LNiN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UcV816UkW4M7Wz4ckag2Gp3Lz6Abjyxwj+JIQeC3kxONUOGh3WWE6/R3fu9NgsrDbUMMsP1EzUQeRTfJGhPrZbGas0WTjlfg4G9K6mZm36yRQ87nmyTDXwwgSn7HlvAhXVo+llqYqm9iE7R2+riXN/DPHxeyiopaysj21pRCOrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbIvobZu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pm/2tn+H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbIvobZu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pm/2tn+H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7aTa3660873
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ai2mpfKZ9Q64U9EcSWq6/G
	Qloh8B5BqPlmOsyedNzvY=; b=VbIvobZuwNYcoLbHhm9rnfvSLkWJsJpoW6sKo7
	UZQP1vQ6GLBdsQHCuLebNZXGJKZ1yDx4ij4oJFykAzctgDVvFfV7kCaoJyQcn0GP
	sSF8IzzFk42PHui9QrSCnwbCGPF4RHpDvUuPqQfdujDfDJCOCAMjq7w6GfzbLSbS
	/cgJGIduusx6VxB4yhsl7vHQ46aojTD5kY8ZmVjs33IAQbn5S2odh69eQ5J8Y/hV
	XOuqooPyQ2vK+7EIXSpAYaMrZJU+aD80GK53onFsdIR8rNB/sXZWnDc4gnqQLaAz
	WqQyWOQshT0DXMGA5RsvR6grZJ+JA+OPAsGOGeNNSR3IyB9A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkjy91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:23:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2488181a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 04:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787138599; x=1787743399; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ai2mpfKZ9Q64U9EcSWq6/GQloh8B5BqPlmOsyedNzvY=;
        b=Pm/2tn+HIg+Vd6oV5T0D8g5zd9l6z52NSPHPr4doarE7YgNbEAaT6Ylf2vYb8ssflj
         zbS+Am0I2KA089cUDV5nX2XRI7HrpRRUtGACAc98DLtpJ1Mqzhsx18HZZtMHT+6B4kpj
         svRjxWMJgTj853mITf5hDQLiADhTmE1FFg+tvOe4ZdfMSnlhZfoMXrPGxxWDwzjAsbH3
         X2asrN7ck+WuSlIe3D+sNRtKi8OE8VxtBoYcCBiJjPtBED5f0uUp7XrSBeDrl7AjYkss
         0gHnSF9RlnG52AAMKSyf8mmPemgnx5/qziJM4OWKf7aRDkEsqf5/S/51Hw97qX6LIH0k
         TtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138599; x=1787743399;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ai2mpfKZ9Q64U9EcSWq6/GQloh8B5BqPlmOsyedNzvY=;
        b=bqPin7yaOswbgzRCO3iaT2NE78oAMKNSFGBQAwi5qqTlZ21enlmTIyDNbzQ1JOfbVH
         9jlgQdc3MgdyWNa2+LOqQTx52ZVHhkccWL7kPZnFz9ZAzjkUsL/HObMhOi3E8XQWivfx
         Hl9JyCs694IdAJVrmGv9RoDLY6yiVE9JoiJtDna8NfMaB+xdCCIRtzaSUF/BZ5QdnTao
         izmTyRHKpIMGahtmUbhSk2YQLvpglFaXaojzeC7m/lFYugStvYl7M+XXsDWg6zernuml
         kWhDN4MmyeANEMsP/yPbzkOyoEGujk5dKNtBKEXR5zqmb1ugB9XHM3L7+WXnNk1DeonQ
         kedw==
X-Gm-Message-State: AFuF++msUYRrfYHIohMeoLZdZdgZR6+nxdBys3U73D5WoyQFPVUQNkzQ
	J6iloonCxzuEbGE5ClFAzGCKkJhj2cGB72HlA3wCaiYpwkNpAMtcU1CCbOXCzjna2w99wKzgExc
	7vcqTOfT4ve+TovUYWm5T+qGBJ43cx6sa/Orsjykjvx7ejB/TDtxx4PEdyD6jLEpXr0CJ
X-Gm-Gg: AR+sD10hd50schmjX9H9SwjsTNB6OrCGdQOJ1j+GVX5DMzYrQkL2rn6nvB2YPRFzUFa
	Hnn6ckHGux5s7egcAEg18P5fcfpAFz91EYxPHOkmrgh+8dJSz5UPQRI23z4RjI/bysMwWaaqGHd
	9PhKs2dFletokiDIUHgLq1TJUtYOER4KpwoQHNjc9udEke7Fn3vvVezsyd5B32CASEdauC4qlEp
	xXo0zAnUTxk3YMvqcX1gwwglyejp6oY9cm32FGovh03keBFsmXLv+5hoCvUMDYFAWJuSp6zDZlm
	kHOKpdJgGELbBAL0o1DdkCCG6VEmLqrs5/DoTpzOR7NTe+ncfeA7ntb10PbTeZ4qBaK1zfHSXnE
	dTsMJw1wd70vNfXlaAdthS/5t7VU=
X-Received: by 2002:a17:90a:e7cb:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39580aa5106mr7138533a91.5.1787138599206;
        Wed, 19 Aug 2026 04:23:19 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cb:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39580aa5106mr7138100a91.5.1787138596850;
        Wed, 19 Aug 2026 04:23:16 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f8b9b55sm763987a91.4.2026.08.19.04.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:23:16 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:53:03 +0530
Subject: [PATCH] drm/msm/dpu: advertise linear-only modifiers on platforms
 without UBWC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-remove_ubwc-v1-1-5357d5cc517f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABaShWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0NL3aLU3Pyy1PjSpPJkXQNDC4OUtCQjSwOLZCWgjoKi1LTMCrBp0bG
 1tQALDeADXQAAAA==
X-Change-ID: 20260819-remove_ubwc-0180dfb2908c
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787138591; l=2024;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=FtDAmcO0ZVXIA7oxCRX7CLMaibYbkqrp9Htli2LNiN8=;
 b=/2ovlJGUfIk/2/+YH19t36lJKeI7tHFz+uS5EjANvNqYXoR3zYgKg1O4xfiItCC8j7Ajk1aag
 IuTlF7xfbDhA0LlZA4PpgtHXFsN1P/tiUTKHln30FGpOVfoHLSbdIuH
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a859228 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DbAw4J9xf9Z7qnqxU7YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: yBwTrJldILt6JqSrlzr6B_dEWj7MJobm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4OCBTYWx0ZWRfX5iyoHfnCC/VB
 u3DSiW3E1AHesZgIfpgKsR3Fy080/OkCCM5gHrSdqamLnXmVQqwnUGSbRPQUHntGq0w/DTI1fAi
 8I2FUdu+YxRPS1bHMXxUPDskK63Z060=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4OCBTYWx0ZWRfX4a/1WG6m9Vh1
 1nKjxFCI4dqUGebLV3k2LVEH1YMY5klPSjKXAGlqXSmM8CgPZpSeV5NqbqvaqCFKZyQUw8GebEx
 fMncvpl2C1AyT/S8ywTUBKTYqZDtGBXC3Gu2qQtPo/T5W9ujJWqgTm1jphY8QuMKoJnMwBiRI1P
 RKH/G6hp8mbHrD3Q5CYI6tScPC23jcpce5Oubt5ZehNuIqkC9ikgXg9gQPIDfAKnEESWLlc6QU1
 XVvSObeMvucbSZE5OB6DZzDqLrNv5oQEZgZqwSfJd8bg1tSsnT/QAZdUzX6azA7BbB2PSYHebOH
 StY1TJqbUIAZiGcpTpzv/Mj2TbQTziq1jhKUgrDyzyMIRSy5cEkfRq9ELNHfAR79tRU/EZz3RV2
 wVFrtws8Vl1JWKcp6MTsHy8Dzd24uB/DUhTvKELakidxpitqnzHPaIF2pU4CV3RoP3hn8Q1PUED
 AgOKMde+Y6e96F5YXvQ==
X-Proofpoint-GUID: yBwTrJldILt6JqSrlzr6B_dEWj7MJobm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190088

Certain Qualcomm targets like QCM2290 and Shikra do not have UBWC
support. On such targets, advertising DRM_FORMAT_MOD_QCOM_COMPRESSED
in the supported modifier list causes userspace to attempt UBWC
allocations that the kernel rejects:

  msm_dpu: [drm] *ERROR* unsupported format modifier 500000000000003
  msm_dpu: [drm] *ERROR* unsupported pixel format: AR24 little-endian

On platforms without UBWC, only advertise DRM_FORMAT_MOD_LINEAR to
avoid exposing formats that the hardware cannot handle.

Fixes: 71c5c23be874 ("drm/msm/dpu: check ubwc support before adding compressed formats")
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7b92082d35a6..c8bd034690cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -94,6 +94,11 @@ static const uint64_t supported_format_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static const uint64_t supported_format_modifiers_no_ubwc[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 #define to_dpu_plane(x) container_of(x, struct dpu_plane, base)
 
 static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
@@ -1836,7 +1841,10 @@ static struct drm_plane *dpu_plane_init_common(struct drm_device *dev,
 	pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
 				0xff, &dpu_plane_funcs,
 				format_list, num_formats,
-				supported_format_modifiers, type, NULL);
+				(kms->mdss->ubwc_enc_version == 0) ?
+					supported_format_modifiers_no_ubwc :
+					supported_format_modifiers,
+				type, NULL);
 	if (IS_ERR(pdpu))
 		return ERR_CAST(pdpu);
 

---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260819-remove_ubwc-0180dfb2908c

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

