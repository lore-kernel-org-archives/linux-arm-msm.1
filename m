Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E92486B83
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159230; cv=none; b=OCYV8ow+K7dLInoFsIyQGnUE9xj0j41NyLJ4ItE8bgrbcPC24Pye2Bov8h7q0cLVTM7fliMEe8f0agpvhuAn5ZxNJ/2YoGHIMmz005gQ7GdCMxiX8p7/XhFPs3h2TocFATCnJZZaIro73SZ0Fu2TUbeJcWVdEWH9P65A89xhwPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159230; c=relaxed/simple;
	bh=kURPhCqwLXhWyHDPUC0FBQT0xU08pc7L+Itm6hSzjGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EbU9BHOZHEbbsxCVOOzGGUWUGESFstDG6tmYoLaGxBQR/uIcrmcgiRfXBFFakv0QUBFL5HmDYP/Y9MHgB4AjEhZKDbiDFUbHJ+EdxeUEUj2OoNkL4jvfEPddfYqmK8y8X1rYIJwIN8ZyvRSaBWXg93Po6sUvFp0u7VWBxLJbp9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RidMsegH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoB6wZGD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RidMsegH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoB6wZGD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA31P23936295
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hueBpJZSI73Jt1u8OsHLGqyaejzw3nzZoOfdwbdMyx4=; b=RidMsegHyDJOlqMk
	e0uVv769jwlF7ICnDIZcPtOmO7KGPS/L9wxSzxRh7lMkdqYpe4b03W7R/ZVTKUhE
	0i64msJMx1guvPdHfI8uuQ4qfvGGg41orKEwAQP2DtZegZkzY1IBjBwjZymv2+Rl
	BgH2L7l9sZOPCUVVpb5/z4xoQ7aTtVngE6Awzv9PjLFF0dAanahlLwuDvlsl13XP
	lHvFt6C+doVSEZ4BDCW3IGtWzbok8bJ1sNWwLoO3FqWqsqDZzpPhK3TvdrDYth7T
	/GlwpQSYFVJFyPcrIo+mn5C76/3BYQ7bEpVvKdyEfRjtVfNQyNv7UpDjvu55tLe0
	J2U/zA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428t83b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:50 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-144f706e063so543912c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159209; x=1790764009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hueBpJZSI73Jt1u8OsHLGqyaejzw3nzZoOfdwbdMyx4=;
        b=PoB6wZGD0ubfJtSY1TN+B2aToKfDZTLsJPM4EDuFA6w1mh4Cbj0rEG+XP8atBxfQrD
         JGSEnfE8rBSh1PP4pGTht5gEpn0eAAxege+y06a9KT1wOBUIFLleJoldhx6UTI3rPacL
         X5U+tvnw2WIlw/IYq3gETAY82UzRYnI/R+2Y+Hf4llzXvtqLndXs8ogMCYZfZB6zTiEv
         a+sCKeJzMCXEyP3pMy6JBrJP4fmJCxXIvyoem5s6icIv3frFui/Ys4iGuEdyjToVYSw4
         nfbhjAUxrEwdDNkQ5/ekr3T5lmZxCHPKn7Q53A2yzWsq1r9KH7d9oGa/RLeC3hZjcLZu
         u0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159209; x=1790764009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hueBpJZSI73Jt1u8OsHLGqyaejzw3nzZoOfdwbdMyx4=;
        b=UIZX5Ar4EmNDyRBOAo83hMH4HMhdqnUiyrfMe1B7/9IMG8yLUqlq9SsmHCx5WGz2zg
         0cawbTQhiH2u0eyF4Eq4Br9p8yAUPbGl+IlSTpidxz4nrBDensCS5XqHWL2fzHodbaLe
         vTGodQhycS/rWBiAbkXeU7TWReJ8sRmP6Vj+nNE2rV8GNY7YCIXco1a8HOE59VJl445Q
         J9AwQr+LMpjYO0y5YFO8t0iyp3HnNOfYzKB/8CQsS53c3cKFQfHDZA8cYCyMKIolpHb+
         SKzTQkqYEOWnrYlP3tF7hcJLcMMNvoDHUuF1xLMbC/BtMRuOL3cNpSOgdL2RNCe2nQig
         HL3w==
X-Forwarded-Encrypted: i=1; AKwUvBxo3UCPEjxTYoHAq7DbMBhsXUZ4IcEcy9vl+MuaGxwYew6whzEw1RRFbOOQ/rWtUfyxw0JNNfxxG14bc0Ui@vger.kernel.org
X-Gm-Message-State: AFuF++kdmsgvXuJnnu87Pv37PV2WryWhMAXwXe+A2+wkfdF955nLWmVV
	3rnuRzhDSB+r7O0MTBKMnUM9Nrxd0tMpEPHBWSqX8QDoGVLC619nig9KLORz21QbUISjz0s5FSC
	cv8AClV+0Jss+x44Vsyfn7Bf2K3+p6xh2yumFXBXgcQW12CdXtJvZfEEQezxscnj/D2hq
X-Gm-Gg: AYBFou2uOhSnqTo8bXrWFps1i5mnF1yhtpUxIzQixCIhKFXEnm9FG16MhdmOO54eKG3
	w6TWR9aiCk3zadsnhQynSBk0YolvrMGqd4vDTnVhFxBfkxRn32zqZcaedDV4OtM+A/LEbtU0Ztc
	YUpsdR6re6HLywUP0WOih+RTgFVTyOGHEuhjIMn1iOuUHDMaEbAPosSpJWYTqpMKOYWvS/k261J
	mrqMzMkTB0Nr+MX1JFzebG7fk1ejvtr4wUc0xcq8r0bQDQURaFzZpxxLwQU6kfPY/FiIZhgDOc2
	EsVvTukAkSlaN+VpVbqfQmN31A+dWkazR/3XNEuTy1X0BBM+vM8p1jy28iDEuKWqlpAilRaF6RX
	eNMxcsyHpxb6L/byPN+eqsv4=
X-Received: by 2002:a05:701b:4291:20b0:141:9d33:f1b8 with SMTP id a92af1059eb24-144ef0eca37mr2418627c88.12.1790159209287;
        Wed, 23 Sep 2026 03:26:49 -0700 (PDT)
X-Received: by 2002:a05:701b:4291:20b0:141:9d33:f1b8 with SMTP id a92af1059eb24-144ef0eca37mr2418598c88.12.1790159208743;
        Wed, 23 Sep 2026 03:26:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:45 +0530
Subject: [PATCH 05/15] drm/msm/a6xx: Add BX rail support to GMU dependency
 votes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-5-0c3c79a1a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=2678;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=kURPhCqwLXhWyHDPUC0FBQT0xU08pc7L+Itm6hSzjGI=;
 b=NWMeHEh6JevxUszMhW2aEo9xuwPWpJ003QMf9bmjaSM7H2sFolE7OUzs3B5B7nYc1829Pvnxt
 hBq+lahzKu8CD86SybRsANUAVOYQXh0bSvQkzX1i/KG8rgr7cH+8kxm
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3a96a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=55tSWijHQoufD_vR7dwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 1frQVXN6HU3L_UucMxWAQ40FmnqbuhV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX3S7UE+JQWqEa
 ie142C5tr5kTFOfi2/E83weT8CohTt88QOu+Dy/FTouBl/XOllEaO+gUv0Hz25KYylpX3alVDUx
 8kej4sPTonnXekaxti1ZRRLWTorijyEF9zXtwjtPnCcBH5gxqk3ol3FUDl0cx9+jkpRlhfKPeBb
 KOPHOVat2N//7t3j1Gp4Js+qCvuBU0B3mVPGEOXnoRq0pJTfv18CogruIMpTGCuqHJIMMyyyVGN
 8VS9hLAJ8M/Ci6+Efl90AIdWS/vririP2jeDSNGQA4L8x6WYJE3CMAvkB8kODvAGKV8u18wE3F0
 CsjkvDCngp+XDYAhPFzP55mxmam/bO8kXYU/BzZbQePj/X4t0s7YeJtygpG2kYBVQbrDzMIU30v
 R53/FFrQrEETf2PxCinhK0N2kXZCQpXz5FbSNqv4gmOnNLcrW6XO5t8y6Jlb0FXuO1Y4a67pCHb
 N4U6bjOHO3g37xpvSgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX5QxH4ceCfn9W
 pn2e6V1qlW4cFKPnK/XUdM4F7SvnaNvFM5ByYEoogiAQwce/GlXUvM+6raNp8LR3JkS4D2O8LnZ
 wxfDAbIZws8u6jLZq+fmVmXy0SWCad4=
X-Proofpoint-GUID: 1frQVXN6HU3L_UucMxWAQ40FmnqbuhV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230041

Some A8x targets have a third memory rail (BX) in addition to GX and MX.
On these targets the GMU dependency vote carries a per-corner BX vote in
bits 25:20, which otherwise default to all-ones (no BX constraint).
Prepare BX vote field to pass this new voltage recommendation to GMU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 37 +++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0ed01ce1c5c5..2b66d6c7fd19 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1799,16 +1799,34 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	return 0;
 }
 
+#define GMU_BX_MASK	GENMASK(25, 20)
+
 static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 		unsigned long *freqs, int freqs_count)
 {
-	const u16 *mx;
-	size_t count;
+	const u16 *mx, *gx = NULL, *gbx;
+	size_t count, gx_count = 0, gbx_count = 0;
 
 	mx = a6xx_gmu_rpmh_read_arc("mx.lvl", &count);
 	if (IS_ERR(mx))
 		return PTR_ERR(mx);
 
+	/*
+	 * Targets with a third memory rail (BX), in addition to GX and MX,
+	 * expect a per-corner BX vote packed into the dependency vote. Detect
+	 * such targets by the presence of the "gbx.lvl" RPMh resource. The BX
+	 * corner is matched against the Gx rail level, so the "gfx.lvl" corners
+	 * are needed as well.
+	 */
+	gbx = a6xx_gmu_rpmh_read_arc("gbx.lvl", &gbx_count);
+	if (IS_ERR(gbx)) {
+		gbx = NULL;
+	} else {
+		gx = a6xx_gmu_rpmh_read_arc("gfx.lvl", &gx_count);
+		if (IS_ERR(gx))
+			return PTR_ERR(gx);
+	}
+
 	/* Fix the vote for zero frequency */
 	votes[0] = 0xffffffff;
 
@@ -1816,12 +1834,27 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 	for (int i = 1; i < freqs_count; i++) {
 		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
 		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, false);
+		int bx;
 
 		if (index < 0)
 			return index;
 
 		/* Construct the vote */
 		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);
+
+		if (!gbx)
+			continue;
+
+		index = a6xx_gmu_rpmh_arc_index(dev, gx, gx_count, level, false);
+		if (index < 0)
+			return index;
+
+		/*
+		 * Find the BX corner that satisfies that Gx level, falling
+		 * back to the highest BX corner if none is high enough.
+		 */
+		bx = a6xx_gmu_rpmh_arc_index(dev, gbx, gbx_count, gx[index], true);
+		FIELD_MODIFY(GMU_BX_MASK, &votes[i], bx);
 	}
 
 	return 0;

-- 
2.55.0

