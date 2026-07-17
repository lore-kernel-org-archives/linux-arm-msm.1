Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AEF38B122
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320922; cv=none; b=Kv3Ff2ZFo5ijClFBYIyVQjlmTDmZPLiCou302E08553vemYdky7H+lSGgHWLjMlvLcXzGRZjW7skhbzoojKOz7AMte+FB0Wgm0sI14fBkfRSs0xbh2cYvIuVi4CSkvlCvWpMaF484YJw9iFYAxdVHUmZEh7UpV7HCWxEC0uApz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320922; c=relaxed/simple;
	bh=9inCuGVgbyRRoULQ+mF7qHPLQIcozjf/f8dlewYf790=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nv2yluf/AFc4mbQtQmjRDZPgN64F+DJRfHAns4MRaI9pBsRSvNkNN9HYbCwDXHYhorNthuAhmL6Njf1H+gSB71IVFc1BuuidGpfefqlITjZ+8Rzx0gmIcdCSrFkotVkxnQTclD4DkCtr4Tt9pTeFMl0uC5UE13zRVrqiQ3vTDpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHl6nAEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmwmrwYI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHl6nAEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmwmrwYI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtg9q2751979
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hj9k/hn+4mYiUHK6HA/S0PAPXL5EHORkZMZGm7VAmsA=; b=ZHl6nAEWI3hupkUA
	RSklRR+dgpPQifepZ+uCiNbc/lwwhV9sXYZ2JsPr4nannzsEyudc3hLYcZ+dKuRI
	fsH7hrYvDaOmeHqRN1YgIx80p6Q1rdI9yjYvdZ7a2Caa4fh6CyjWvxPOeT5yDVUz
	o+sUhfF6o3IAP6Pvq5sd8se77yVU6+f6JMM6yQZFTJFbeCDZ+k2zsTVUg3HZ7YA9
	/PwO/Bm1jSfoKDJIZhaWnAQQaxb1nQgF4ZC56/+hAtxgr7QpR0nfmWdxqkUtSIfu
	pgcSIm/DOf1yW2S3XozgVCwOiUlQWF8VRSqIANpYJCMuvARJFOa0zxa3yQqytlRF
	GZzmvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffpug19v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:41:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38827cee19eso8782540a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320918; x=1784925718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hj9k/hn+4mYiUHK6HA/S0PAPXL5EHORkZMZGm7VAmsA=;
        b=CmwmrwYIG2weAV8YxRQo9VFAePGd0ybe0x8NzQnfhEChpD4XgF8S8m5z7pS2COxCCi
         pS6KLaqsY+OzJvheMeg6iEe24++fin1SLM8WmBFSI+jy93OvBcq+ybVfQzgxpaPmAo+M
         7zpJ5f7hEKmmRJt65SNyg1DFF3PzD5pD8HlgodVnvz73JejaDCg/JsdrvEQ+Fl2C16RM
         Xi8iAXchNhl+Y/MahMGYr2VreTuS2Z84iMj1mZAYdPKeK5VHTYU9fB8glu9vr1yN6o35
         7i8Dmd/N7whHgr12/FY1wkbyr16uNDzhmAoBedA1nmEW/anGODAqomTioLHmPZ8oHLP6
         nGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320918; x=1784925718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hj9k/hn+4mYiUHK6HA/S0PAPXL5EHORkZMZGm7VAmsA=;
        b=mtP6+NBrW9VVczfB8b5OUvx/G5iQVHzjMIn1eQcHOCS6TDANqCbQyqdUUBBtQGtKA6
         kvDtRgYZ+Dbx5ZDfx2L8CkyB90yZO5OKR0XDFL7gvG9FLDjob76h468ADUi1xu2ui+Pt
         CzvBUMYRnxM0qoyPUHpS4AElWpLrr9JjnYbheV+Zg9gqWXpOPtOmSaOOt1mvh/rXrSaK
         gH6mo+BbpMgD4BrWceO3Sooc7Q5aGGzVGDLPzaWxMbZqeXLCU+FVWNkHaCKXN133wVxx
         er8WLo95L2dgsA6hQ1SX7TH0dZpioufOMFA07Va2VOsAplMa2JAQgtIIxrRgelsvGcj2
         LzLg==
X-Forwarded-Encrypted: i=1; AHgh+Rrdn5BSHZtAgEwv0OAkxPiueky7R7NMmq/MGoPWLpebY/pV2w0xHBKHWhWsjmC2V7exhdHdN6eHNsBKu38k@vger.kernel.org
X-Gm-Message-State: AOJu0YwreU1A6hDoMoM7Er+j0VmQ1fiRsMUDlgE2PJDsaAgw8o3uiVdK
	QIRyUz5Tb6bYwZVGEI7J1Wx1wedY0DUGiiFBbJVlK7aA0VW3qBuYSXbMN8yr3gvEY6C5ISVNnoG
	vCOpjRJZG2qeuhUy/Fj3hZC9e1db+f+VXDRAB8sGSbzl/fn6XysX59p3mi4iroY3x14Jo
X-Gm-Gg: AfdE7clgJ0D49yWjxFbW5gQa7CYHiDiNkIp6oT0sOtOQg1aU7HuNWJyCxk2HT35TTI5
	rSOb72ByDX9XrFZJbmcEWDJ6r7Q6LaL3wjHRuqJyYFfzqtot5g102BuRABw5drqphQSeedlWC0M
	s+HxQPJ2fMScICvdp+/4YcwXlxKbekLIBNTiV/2yfS15NEGplyoGoId5NjO2r7pLM7VN2KBp8N2
	34N5T6XUiItUOZEktB9TdgR6AggEmybhLIyFq5hdpHwF+4wo30SJy6RFrszi/Vu9XCzmRiv7G3T
	AUiuLaB8SPZurqgSJ/qXSy3vcmaVR64sn6EYAPTJqdptk14nJD9p9JjY0dZekJ6AdS2w3xdXJ4A
	qux6z3gbHDQRn8fYtBxTJ8UGp
X-Received: by 2002:a17:90b:4c8e:b0:38d:a8be:a592 with SMTP id 98e67ed59e1d1-38e4b43cccamr3944735a91.19.1784320918483;
        Fri, 17 Jul 2026 13:41:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8e:b0:38d:a8be:a592 with SMTP id 98e67ed59e1d1-38e4b43cccamr3944683a91.19.1784320917831;
        Fri, 17 Jul 2026 13:41:57 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:41:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:26 +0530
Subject: [PATCH v2 1/9] drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in
 a730_hwcg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-1-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1299;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=7exucDpQz56UUOX/GS72C0Nnz1GCp2aiTngaIPcMmkY=;
 b=59JZ+AiPbO7Um2ErH7yj1zS6z8HAFQqgcXTIpwOre8CaO2cTECbjzx98rAS+Oug8orhhgR49a
 K3NAhQOAEYCBdkiHjRWR8HaW5ARAVWD3vALuGFL4Nw0BCXXBQAVBjGF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX8Pw6Q1K9fu8H
 GZG7kZIiN8RNWfBP/8FHaT0/8Ff3t+C3IP6ucj7DTi8gdKJNknIz1AQHB/PewjL3Vi3NFqAeUkR
 KPaNbS32E8tOPw9SCqG5P/JOnSrdDRcxmqAKHtxu4BEwBiFX6VwgaKX+4ldPyyoh1x2K5yy4QBo
 /3yOFnWV7/+BrrLE/v8SRtE9sHa8ZuW82Y17LlfR59WX5ej+JaCNbIO2lrfOzZT5hjgz0z5kfqM
 bTchhvSWxRUIJX/WZC8SNEG/FTTXGevKyT0zdrAnmlK/sWAEMOM44oLCrEVZM01Qz9o5WNOc1Gc
 9FvP4rHsubEsacmwmcXryoYuBisPN7APiLKk4DWvfL8f4n4PTcJQci9lw1pwXW6BJiJm0GZ8IFm
 JXXWRxcvErHGFlXrWjBQp4+lktAt1wTyqCmcA7hIe1tHSrlBcxAfFdjnjiDf9WvlFn5gIyGVjeB
 3FOFPPasdj9oMyvM3ew==
X-Proofpoint-GUID: WqPuVAdtOip0eu_O645eix6IR37k08x3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX1e5LaoEm7AET
 CA3qvBIpXIKwVsKzO/pEr2WotEfaFOoqsMxqJB7LmQAQG0xkr7X+qKs9PdmBI/Ydn9ns6vNhCAG
 d5HhutuobwWGKTdIYHc7lXcUjDjrc14=
X-Proofpoint-ORIG-GUID: WqPuVAdtOip0eu_O645eix6IR37k08x3
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a5a9397 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Vf0ozLlH3VOCCO7dkaEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170212

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

The RBBM_CLOCK_CNTL3_TP0 entry in a730_hwcg has bits[19:16] set to 2
(clock gating enabled for that TP0 stage). As per the latest
recommendation, clear this nibble to disable clock gating for this
particular stage.

Fixes: 9588d2f860a4 ("drm/msm/a6xx: Add A730 support")
Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..a98d550b72d0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1199,7 +1199,7 @@ static const struct adreno_reglist a730_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22220222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
 	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
 	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },

-- 
2.54.0

