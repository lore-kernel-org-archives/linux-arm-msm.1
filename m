Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D803E486B86
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159230; cv=none; b=dQmK78cNkSB/C2YpJKAhV/gx50llsB5Ha8lGDykTqokS46533w1Hsfsq5nkr4gEuIJ9SwgXh6zo4H5blqfz60aoH56cJ25QXYmwTq1x2mwI5YnCxev4BOBl3kzw0HWi/KpC1fcrkJD8zVGNpXwkByXuub8LnMWv3hlnGDP4lG1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159230; c=relaxed/simple;
	bh=y6Olh75Fc5VCdWLQG6EWVT/Oxp2EPOrAyCE8KeR1J1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WP6AZyhhIc7u+DOSmFSTkZSR7jjtJboTrGYqmv/pHOrprFcr3UWCZ2gTWkK3qWgpWJuiVbUfFEXGR0ZDuk7qX5RX1NqtUWGxLtIemCuTw6oAJdgLdxMPdDYSpWCSSqKJ87QKTcOuELj308aGrCI7uPiLuYHoua6v+P3ni7jigzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqfEM/dP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJnE4rFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqfEM/dP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJnE4rFJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA305I4087736
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYtm1eJOTIqsmCeFZXGU6ez6pqCT+tJ1aFb8+8lzjGs=; b=SqfEM/dPwnhorwBi
	UxbPCSqj5ZYcaKZ2Ap9I1Ae9bmaYO0LTAlW/d7YEP561DNovMjZyeSrL/YkFI51K
	PV1/U8DIatH/RFkDXdR5gpha53dB9sYYQG/qFsIRRJwbyjWY4PtnZWCvPpcEq9MF
	3Y3YfzephMd2zQue0CNzj7u8YAwnEg1n2t+jEBRZgFebHIgxs3MLSSQezoJIa89+
	qhV4uqhjolV2UEOphs8bTmB1Hpd/cnXnkUj5hpnTijBfkD702oF5o3FaF+wiU1lD
	duX2zvqRILFd0l3BkQ1/vj3Aqe86lIVHJ8iMCrRcpvWfNGKEOVAp06Iik6x7+TT2
	Ec8SGA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3vgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33310847fcaso1306235eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159216; x=1790764016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYtm1eJOTIqsmCeFZXGU6ez6pqCT+tJ1aFb8+8lzjGs=;
        b=gJnE4rFJ6MBSht/uz4q0GS2+O4cMt0otzGxpPK/XJ9nkUeIaqoKmgbxE4o0lv477Xc
         FXUAPjEvTmIt8l/H4MEbHB4KnfB5THv4sd7ocks5ldnxwbr4C5ombDkXbKUJVCtBOJgf
         1VSPBUcEOMgNUqyeTcJmK6heMqoFeZbfrLjF+2LLTedVvZ9ew5XEVXL0Dd0wn77UuU6y
         WYXZY2ZcKKSNhVu2XFP0/TCy0EW7OEovBGu71eTE/9Ne2Z+0p+4ZbSYv1HIHyYwf0r5U
         0FhbNJABwbb+o/CHd31pQCp9Wl3pS/+5DU/We+N1L2ZV45WriPU4nyu8u8SlJaFCpWmF
         yavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159216; x=1790764016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYtm1eJOTIqsmCeFZXGU6ez6pqCT+tJ1aFb8+8lzjGs=;
        b=BdjWcPWodRZ1NnWaOAj6JBOHm7205EEEUocincCO9xfBaqck2fQZ8AJHeNS5KT21UD
         8SU60dHjvnPbGaI56TUhdc9pc4sy89zZWP0NLD1gh8jTs8AhEArpH5C0hkGXm9DbWL8X
         +X9gDMLcgd1RnZ0odql1QFzbugeiz18wpd6hQWh5Ia27IJCN5PwJnZYeJ86MDE5RdPHh
         ZYHi68TZJgvvieOpWs9kAE7c7CpkGDp6+H6hBVGlqByBEgIdwiokN5a9IuKiIK9/7KjJ
         nR6az+/gsuyHI6g4DFNsgzqrsEc1YFGWjvwMyGi73ifAL+nnithsvdCykToDM1rL7g5f
         mwJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj7c5dpDjO6XidwOsAYLDBJOhE5u1ZXSs+KitaR+iCKtTwccjrYrQxCSl7v8wWYV80gN8jtMqlNU6dImWt@vger.kernel.org
X-Gm-Message-State: AFuF++l0+k8ySE4/tvVczPjoqRebIj1jAW/5Cp+jDJd6UDSA+R0bEl2K
	J9aXyTN8BjlvnJNEluNmag546fVDYEwRYTCrLI4ijr3pmM/ZlbZY8JKbrgdhZz3U5i4c7SDfp1o
	KOq+W+pG2uq57sX6l+lnlbA8HxwDRJGRDaI3D4qtOyIfKNxwuYM0Ab0vbB/o4ISAIWrXO
X-Gm-Gg: AYBFou0iSEyHsWDBBS52jeiMexrMGjS8ujWbIEzAOy7l/K3+Ae3sN1ZsU3VsXqzrm3g
	AqCMGViE6JvfXmi/I7DPjBgLv/ondvcvZWT+mCrQGjw1qu4sFwkPVyLx3FJwH5PqVJiaCFmPv4D
	R0PFChzHf9HQqDBSx+Nd29bfFlB59tEPWIdR6AvEvDM2mBWQZSAeB+98xHCa2PTk/IcVd7clFKb
	vgFtV7YksKy1F+uo6cnlRGDVtLGEForTGpMcl7sUP+Gj+NI/yDOgetzkYiN4ZIzW2tCeODTHk7G
	FbbfBNBECis7qJ5MD67zofCWx5wdP+8Qg9UXyNxrjISXoQhKnfudLuykRf1nAd+1Wx4r4qjB+U2
	rjdwI3Xh3ubV8HLfe5eQdHrs=
X-Received: by 2002:a05:7022:3c07:b0:144:f8a3:2eb8 with SMTP id a92af1059eb24-144f9086e0cmr2388175c88.9.1790159216320;
        Wed, 23 Sep 2026 03:26:56 -0700 (PDT)
X-Received: by 2002:a05:7022:3c07:b0:144:f8a3:2eb8 with SMTP id a92af1059eb24-144f9086e0cmr2388140c88.9.1790159215758;
        Wed, 23 Sep 2026 03:26:55 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:55 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:46 +0530
Subject: [PATCH 06/15] drm/msm/a6xx: Clamp MX dependency vote
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-6-0c3c79a1a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1006;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=y6Olh75Fc5VCdWLQG6EWVT/Oxp2EPOrAyCE8KeR1J1E=;
 b=EsDOz8yeV+c3gpSP6baw1ovG28clMjsYZni4lG6rN/FJULX99TZzacIk8ZsJLWufpEOi+PvmV
 2Cw4rPd8btuCPeWaGinzZWxb2wY+olFO74PiH2SuMrA5mubIRElH2Vh
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX637ct7axfiDT
 FR+6/p8AOYtCqUN4R02226RTUxy3R3BT6GfLdDQT/OW2T3LkWaSTzt2TejGYOhANDVYRmFcEWG5
 Ijgzceh72llxMaR1CHOOhuWvtVL3ZLLc1HQ2deEqmeY9fSBXRybvyazxzSWFIjwqxmITKuGU0/1
 oId6ebVCAc+AMJdtu2d7WzKcwR+HZhDmXqAdQTLAP4xQC94KMOPbbvsj6GP4OXItC3NRx4tPxOY
 lD4EoDKrKYoqjyHrfykdKfMcqC/5cFxX6b3STTfcxiku4Qzc7mM1ul20ZHbxhBwn3Pp+SaJJh3t
 J8yrLThI5Q6vqA0npkTLxAvhXzZsA3/jm+cSOuS/zuLJYMme/y5JKDuWxRfHOl5nnDzXx5vpyno
 n4nlI1CKUgBz+jJrzheYHmDLwvmyFxZiWKEpNcloVB36SjVVE0dv3WhE2qX7LWsSmiY8bISrKIi
 qUe3QSYr7E20PeGsz2Q==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3a971 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MBm1Spx5gLoAAc79GfsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 8IKoYdZE5WHfyIP9ZRDq2wE68XVxp5og
X-Proofpoint-GUID: 8IKoYdZE5WHfyIP9ZRDq2wE68XVxp5og
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX6O++9bfdxxhu
 c2KJ27UVqydwQJcWh4ooaoUz+72dM8DghBno4QVnSx03oMQzV00EBe4DZfTy5K6kgIr0tgceqlw
 YW7VK+1XxVnHS4KuS+m+HHdJGVm2c84=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

In some chipsets like Hawi, the GPU arc level can exceed the highest
available MX corner. In that case, use the highest non-zero MX vote instead
of failing GMU initialization.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2b66d6c7fd19..14d422d7ab95 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1833,7 +1833,7 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 	/* Construct a vote for rest of the corners */
 	for (int i = 1; i < freqs_count; i++) {
 		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
-		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, false);
+		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, true);
 		int bx;
 
 		if (index < 0)

-- 
2.55.0

