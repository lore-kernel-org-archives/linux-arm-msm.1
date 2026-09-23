Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A3B48641F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159191; cv=none; b=T3W5Wohdx7GRe7a0YBzUG339Fj+vrE5GEaKDYEmSUuKyC0r3R0bxixu21l9MZ6cI3Zs7eCn3s3XxMfkD3u8QaEKH6KSbNmLTXTRsyTSdJU0RmgJOCFKwxh+gWzbSGxBtOM6E2kxtBVNRxY5zr4njp64ZZfrlRmLlWKO1S2/F85s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159191; c=relaxed/simple;
	bh=V21+W5V5cnpKq7cOeRXGNYr9Gsz3y+i1HRNlljSDkDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNdVJX5n/E8cQgXmZuDqwwr5cJ859ft2UctkEKb4vGmOFyJkPd9l7zcAnACBWszqm4gCjD2vgN/1H7aqMhjBOIP+qpSx3kiZKdVNdvLQS+v9XDuyahnoB11xEH6iTD1b/XIap6bPVxwYoUQ0Bd6ood/M8fVhwmfWnA4ebR5oi7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WG42YElg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0cHz3HF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WG42YElg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0cHz3HF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2e5g2429394
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYyN1iY5KNMe5cTxnYzNiplNmyWD2u4FFVlpqGjODAo=; b=WG42YElgMQfoDgp1
	JMkrjIz/tw2k/5eaVT4LKhK5oL6BCgcsvgZ1nXqJ/X7y8LflcASiFMc5slM6F+WT
	PXiN36RcTDEKlPxs5EhwvBb93NyUy/PmI0gYNsi5STY3NdqgYVB4PgCwWj2VGB1G
	T2lwCsN8PzyzfGlxft+B9c+Ccyg4nTPFO+0t66MLq22dDMmxe8MWl2NtwQ/MEhbG
	W4jbnvtKUBz8SeM7jtdgnjYac5DYJLViYLM6kkwo9Sf6npk0eVz1DsD9ANcZceEe
	mhnKtssgPtyXKtH57/e+ULy1bSmPq4NskqynPOe4jx/8XM1SE5mBfKiXqdOKF4HS
	L6d4ZA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh20t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1450103c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159179; x=1790763979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYyN1iY5KNMe5cTxnYzNiplNmyWD2u4FFVlpqGjODAo=;
        b=I0cHz3HFHDgONf9MxsaoKAvm01Fg5l03QbzJwsviUu5TjgCMjDXqJnbyA2ZL/AdV2p
         uxnUIBrnAzEztXRUF0Jv0Pu+0SLukV/7BvHZPtrnMCcwKPrQFz4DUpT7ymyiai9xxMV/
         1IyNNLRfZRpbe3gtVw97lVUQp6GXK90W1srusk4O1Pb25HW7TsPLQU+nF/LWLAHn2iOQ
         k+2iZdnv8SiyxHe9nhtdZxUEbiWiMXnJoDhco3rS5d8RWuCZT5Fgt2aFPKnBAc/taJJZ
         oI+aHP9CYRLbRwMUZnQO3dF1QE1sl+/mVpKAk7OAoKvr/wO8Mt8CeCE6s60J2AgZe4zr
         m/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159179; x=1790763979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYyN1iY5KNMe5cTxnYzNiplNmyWD2u4FFVlpqGjODAo=;
        b=1jIQXEp0LMBBoYlrhTDOImRBkZhaXZfMdcO+EeVXBaBovo2Pl5PoKIXwCHpGcSK8+z
         k26aIdDA06UX9FrK0p9T8mnxHRb1pvFGaCN2MJvJl0RaqIRNQpVfK4kkSph42mekaToZ
         8DnFU8qSqz6QK+BrgDx4HG5k/8bFuQ9u5nokrl/w65P/7uC5l1A6Uz8GM4bIYj8DVsmj
         Sk9qWi+UnrqpkHTlgrsY+eAoDoyo1oGB+q4/YjsqZ2D/s1djqPh4gVN3pZlrV7qEcl/N
         LCEaYWgV80Ajo/fu0uXPZ5P+gLpmdn5ifHErWjPuD3HS64ZvlE5GLLHkJeSbpeKG+PjZ
         gbEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwE0BNZx2VnQP7BN/PIrwT9jdOdbXg2W2w+Vt6Ry59S+C6w6F1bU2QiblvtQTFqIGERjo1Iw+2FChtsh3SD@vger.kernel.org
X-Gm-Message-State: AFuF++m+dwqWpHowGcNooE5MBBfM9TGS8au02MPT4H/T11nKMxE0vo3p
	Ly5hx5LmpB5N/MjneihUDJBW0IsTxHwMvgb10t4I+sAieypnHDE9y7rk9WYIVCOOdZpVki0IzQ0
	7rBNs0V5g+i02SqhVUfMM0S6X2dWwuQvOVxLsZWakJkiAzNqdMIo+n5HUGWCK5+XHhUN7
X-Gm-Gg: AYBFou0vRfBY77ZryChe6Iyhjx2vng5ywklvJSa1XsxfOCEJvpmeq0bz6KL7CuuP89K
	T6i2rsYeHK4HVKfoxOblJY9wdJPWGC27hrtQX/r4Lh66vGL9yOWJcCh/zqRtmGwkFlPAUlVmsUW
	mj4bgzdbJ1DNJnqwphumxtcMHDr9molcw5WdvaD2aNyldJSzSzY7KU3bB3cihNb1cci0CTvMmJt
	CR02vLDSKBKE6+XdWa9tEMqbyAEMF5pJUBnD252Ges6PlwFuWJCqVouta9vQ24WvC+gNDa0b/+O
	tz+Hpg/20z1g5NGA/EsMWja90CYLJjpSDgLN5n7PvOQ5QoCmUTjk0to9jf4QGTqbBuGCG6z5fyf
	tA+LfDEpmEp8ofIly5YfEhTg=
X-Received: by 2002:a05:701a:c96c:b0:13b:38fa:2dd with SMTP id a92af1059eb24-144f915501bmr2194613c88.23.1790159179104;
        Wed, 23 Sep 2026 03:26:19 -0700 (PDT)
X-Received: by 2002:a05:701a:c96c:b0:13b:38fa:2dd with SMTP id a92af1059eb24-144f915501bmr2194590c88.23.1790159178553;
        Wed, 23 Sep 2026 03:26:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:41 +0530
Subject: [PATCH 01/15] drm/msm/a6xx: Honor perfmode_bw threshold on A8x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1864;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=V21+W5V5cnpKq7cOeRXGNYr9Gsz3y+i1HRNlljSDkDQ=;
 b=gz27hGiIuj7IwDt3Zs0yojZ6ao33Idt442AqRxr7xS8f590tFgvvo0/KU6rsToa1fVC+5Pwr/
 GbXZl65xVv9CMvyQhgUFyagbyOlCz6K2SCKJdOQMo8EHar1jR6v6++h
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: AKAxptLkA6BCdvOsN6rNwQdYAJXXMLTn
X-Proofpoint-ORIG-GUID: AKAxptLkA6BCdvOsN6rNwQdYAJXXMLTn
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3a94b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RtdH9gem4_UyrOKn0ZQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX3dPveqArHeGZ
 Xi1xmWYeFSDCU/cV3V0vLHCqneGucerTL6iEudrVWLUg2PjtmykANl+FeiZp+ibulWmY3s0UfAt
 NKAkCMfTIDORgNVPk612/0lJboN3WUM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX5MWQVM/lfGaX
 FL7wmJx+9qIFcUo60TdrwTHN45wxV2kkK4eXlGR/8JJ3HITBW5QNVp438cobHBHaDmnzC4FUx5V
 REh0ApUiWy5rOSFjq9EuZMVQ5yhRxoWUOKQSQ+lu/RJreYY/iWO6Kehs50N8u5Nxwh7XSeKSXHK
 wJ4H8LZAnzVPgr6n9CiN+tlt25v5Xq7JhXx6N5pCjxHCfjKN99lMI+/prBvfXnmwD9o6TC1fVzU
 Y4al/wk1k2lOxlstTiy9gIEcBgC7O8Kv2xXknO4jLnCAcXV6VzuHfvN7ZWKHAeYmvASP11UHUD3
 blNHiCxLaKiEb/71zrXI3S20wwvJF1wvwJXmimKl2LVynlFReRB9wc4UPJQSgFvkTQ2ramObTOn
 1OoafLdRhu0vdX+J3D4yhXN56mUFhwS38fGI2I5J/itBKpBHDJEU1We9qvj3s5Khm3kRapHeSI/
 XfcjxPGgbl6trAhzy6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Instead of voting ACV for all bw corners for A8x GPU, restrict it to BW
votes above the perfmode_bw threshold, similar to the A7x GPUs.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 8 ++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6d49c51df1a2..baf77a620572 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1656,8 +1656,12 @@ static int a6xx_gmu_rpmh_bw_votes_init(struct adreno_gpu *adreno_gpu,
 			if (bcm->fixed) {
 				u32 perfmode = 0;
 
-				/* GMU on A6xx votes perfmode on all valid bandwidth */
-				if (!adreno_is_a7xx(adreno_gpu) ||
+				/*
+				 * GMU on A6xx votes perfmode on all valid
+				 * bandwidth. A7xx and A8xx only vote perfmode
+				 * above the perfmode_bw threshold.
+				 */
+				if (adreno_is_a6xx(adreno_gpu) ||
 				    (bcm->perfmode_bw && bw >= bcm->perfmode_bw))
 					perfmode = bcm->perfmode;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 114a40f79ef3..bd5c440f1753 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -580,6 +580,11 @@ static inline int adreno_is_a750_family(struct adreno_gpu *gpu)
 	return gpu->info->family == ADRENO_7XX_GEN3;
 }
 
+static inline int adreno_is_a6xx(struct adreno_gpu *gpu)
+{
+	return (gpu->info->family >= ADRENO_6XX_GEN1) && (gpu->info->family < ADRENO_7XX_GEN1);
+}
+
 static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 {
 	/* Update with non-fake (i.e. non-A702) Gen 7 GPUs */

-- 
2.55.0

