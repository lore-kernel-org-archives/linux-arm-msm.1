Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573235E95E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266333; cv=none; b=ZUDimI/bO/KZOYWRgGA+uXJigkhRkX4Z6upb6HhhXdSMRlrvX9MNzKN/71MM6qMWWFbHAI+CHE6m3ZsuyEtMAQoF0P3HL9pFwPY/XSKFxefEMc1sEDaZXZ7bgWaaXSADbI1m7l8x+GAnf9A4SVOaRo1Q+GGmvkLpm/Kyshs6k4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266333; c=relaxed/simple;
	bh=VLVtBrficZ53U+t7h3TLEukTjKWLwiagVpjB+rG9eno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6T3Yo6yOuELEiWMmfXiO7OMR7dZStOW2TZb4mdAOIefGvE6HxnUOOD69vac0Q0A0tkNStsJFQmzVlMLP1zOeKgJG02uggLj6VBP3ofC7AQoMFqhssE0qw/fexnvzdJ60dOTFGHVU8TZvQoqPv7ILy2f7sIda6FBw2lnxCT41GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9qYYKUc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSll/i77; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9qYYKUc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSll/i77"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H47K0F816723
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/QrLkJaxirI/poj4XlPdykCvQeAh1xu+XE/9olTUyc=; b=Z9qYYKUcEL9zoKdX
	nfhPMO6qhF4UNa5JGvPRvjPpP7ca4tVi6uVpbjs8Z/Urw30a013nSodNHzi5tIbg
	xRD0n82aem3bEGpqdOrTagh+vRNGkM8QJQZZTWOk3Q9LlDzORoC1Zs4wzUAdu4yM
	2Qbv3yQKmT2wsghZnpVBT8srtoxIVWL1jhkCDSuZmimwNsyh8qw5nMPiZ1sozO3k
	1wXe5OxqfuOWYbm7u1BgmdksDGxew77ofiG4F7V+kpJFFUNSctNmVCyk5WbyBaoH
	UKnEvUOcaoFoWB6/0tO/5O6i+17Gy966VSHEM6cnCQC6sIx7jj+mPT86Ppo5TEGU
	AaofVQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3ar86y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:32:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so10784542a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 22:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784266330; x=1784871130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/QrLkJaxirI/poj4XlPdykCvQeAh1xu+XE/9olTUyc=;
        b=gSll/i77SKP+V+Jtd4LWEZV49LDMbSF/h1exBCG1X1omTRyAYyFJUce42UwNyBxRwe
         7oGiJgMiI02qlQydjJ2pofjKk3voT10GWnNOoA/lN7YLlBiZUgScexsybjFo2F2OHTEv
         Vd052XqE94I9/5bWbd4kBcSROPXcW7pOwwmJ1kLgJ1qo2Y1x0vd7QLecQZX/dpnJtJjH
         LgqGblKn3vQx636houlEKUwl8DQz5tf0HvKq3uUZJS3dodafWgTpUBQbj3BaH0cjNS2/
         KsaFviEIf79PcpibDRez12DucT6+8+heT0SSjpghBFZ167IJnoQHe0gjPfsLnKbUpM8G
         os+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784266330; x=1784871130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/QrLkJaxirI/poj4XlPdykCvQeAh1xu+XE/9olTUyc=;
        b=XCg0I0eXjtkP1G95lplj1EyK/o+m6eH0a0LX9WGDqZ/WhOIO9SjAMB7IYAzJ8IFExA
         tY3KhLByOlOj30m6OhohzKV06xowrYIKJIg2KhqwxJqh+8aDLFsVXvu0N+jHT9mFKgF3
         AomKPSIilr0ThYQNOsQf1Ivdheo7us/LefMlE4yILqOWRB5EQaCtEiDck8LFeN0rCxm5
         JCCeL7SwDUb5EkoUwCim53yiGlNOJQ16Qa0y4H/RU0ylmelscNBB0YKC7JwZcZwdcZzh
         t4fyHMadCf11XoRipuPvygJgsdn9XRzCZm8jcRwkmmBRJjmUhv2r8CtQXGp15UAlNin9
         JDCg==
X-Gm-Message-State: AOJu0YwCUQZVAkSBT4gh2S/NFcCOeregFA8B4Rj6YclHxJKgIrdYFqIS
	VTh/GfS7xK/kFAMvdA2oolETn1Czm6AIUj2LH7ijPmJWE/zrCsCQM4/XQUosbY4qtraT5y/rSle
	fVCQ5p8ds6acW6qCtM5789GoQqiuy1bD+V8V83FUCJ4EHzs/HmDIME1We0tDLtIA0D1w=
X-Gm-Gg: AfdE7cnpDNkLy2EhZYFqHbKfru3jD2eZJXTqnLjEGvMZplgSG5YhCHvdwIpb0AzLwkp
	VRUb51o9kjlt8qd2FTB3xenNGgtVYlz+/Dwmk82qq7twrsfPaaVK6xsBIhTGmZtq3Z3jdKWxq6h
	tqe7cDWUQl22hElr0Z2l5c5VgU3I1npofa7MCcG3t3mx8jRHHbuISd6Y5jZ9+SjhBEbl9+Urq1A
	KDojNpEUMKeTsuBh4znnyRsadSAT3OYbmr06dTkiymvSSJCfXS8Y/vl96V4pDS95/ue9OuVnxFB
	XfYtzHXjz//yorU98YlQa5Gn4zPClZDG2M0KTC8bUFM5Ygfk0A5XsYakzY1CeJU8sD5y5hgTvBj
	jgKVsh9W9IbgircGln17cmUPfltt17w==
X-Received: by 2002:a17:903:41d0:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2cf34a4c2b5mr11630225ad.38.1784266330382;
        Thu, 16 Jul 2026 22:32:10 -0700 (PDT)
X-Received: by 2002:a17:903:41d0:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2cf34a4c2b5mr11629855ad.38.1784266329787;
        Thu, 16 Jul 2026 22:32:09 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ef6asm4189885ad.9.2026.07.16.22.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:32:09 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:01:59 +0530
Subject: [PATCH 1/3] regulator: qcom_smd-regulator: fix PM2250 supply
 parent mappings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-pm2250-fix-supply-parent-v1-1-a6213a42a3b5@oss.qualcomm.com>
References: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
In-Reply-To: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784266321; l=5456;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=VLVtBrficZ53U+t7h3TLEukTjKWLwiagVpjB+rG9eno=;
 b=UX7CtAwqgS0D6eX1OtFPv20MdedWiC5oS1tYUt3XLftmZhIBIwKuK7c4tzxdj3CHBh83CbzyJ
 PZlF7y/yFcUAz40U4yzO8/FfxD8YjF8Rm4e7UgsdmLa3SCgUShG3YTG
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfXwXnguNjagz7K
 SHrLOcK3ZUD0rJ3Lczie7I+xoUbm0XTdXoaLIF0cD+TuOY7TU24Ko3OFqtomZpOfYhZEWCGV4MN
 hT6YBShCBjLibYI/0OXr0XxIhrjRRHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX930FeLshJaG9
 wtBSOba0bRKkzHZevV2mCQOtjb2Z+5fnqCsKRmbCGGJnH8pCDET+ZWYjByTdWfwCfxFRcrSMACJ
 W6mshnsq8DoyVANb1adNl/zTfeXM7GntShq+sD6N3/xUDtSnLh643nkLDRFC25Nk7T4xIFN+SnY
 F4d3u862eIQr2h6bOD3Fqx1XtekuXiP0n0cnvr+i6uUCslOvEaLbYrafEesq7JfWaXenehTtYSo
 sL3+OVfqPnUbvyVlEdFUgwdWCK6P1ULcRsTPaGa0C7JWhF7xA3PW12/0PR2KwyEu9zHTw3WxzRx
 TdK6LwxAy71J11ouWP8Vcc6RRrlcLsnAXrlI1l+1AIYMhJheONbdhfhtyVW6BEnw+xPem7clXGw
 lZcqa6m5s3uu3/FKyaTmEqAr9x5VALpTx1oSUyaCGXymU4uhS7b6uKjSxaWEKxOHZizgXZufFIU
 sYHDeRHAVAloUBf8CXA==
X-Proofpoint-GUID: bqi2rfWMpHmqZfdHiCubHMI7M4CJ6FYc
X-Proofpoint-ORIG-GUID: bqi2rfWMpHmqZfdHiCubHMI7M4CJ6FYc
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59be5b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2ye8FTLVYv3UXimjSTIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170051

The rpm_pm2250_regulators table hardcodes supply parent name strings
in the regulator descriptor, causing the Linux regulator framework to
look up and vote on parent supplies from APPS. This is both unnecessary
and incorrect for RPM-managed regulators.

On RPM-based platforms, the parent-child supply relationships are
managed entirely by the RPM firmware. The RPM ensures that parent
rails are maintained at the correct voltage with appropriate headroom,
based on all active child rail votes across all subsystems. No explicit
parent supply vote from APPS is required.

Furthermore, the supply rail connections to PMIC pins are fixed in
hardware. The previously hardcoded supply name strings were inaccurate
and did not reflect the actual physical pin connections on PM2250-based
platforms. The correct supply relationships are to be described in the
Device Tree, not hardcoded in the driver.

To avoid unnecessary APPS-side parent supply access while still
allowing correct hardware topology to be described in DT, set the
supply name field to NULL in the regulator descriptor.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/regulator/qcom_smd-regulator.c | 52 +++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 23ed594b574e..aed01f18af4a 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -800,32 +800,32 @@ static const struct rpm_regulator_data rpm_mp5496_regulators[] = {
 };
 
 static const struct rpm_regulator_data rpm_pm2250_regulators[] = {
-	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm2250_lvftsmps, "vdd_s1" },
-	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm2250_lvftsmps, "vdd_s2" },
-	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm2250_lvftsmps, "vdd_s3" },
-	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm2250_ftsmps, "vdd_s4" },
-	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
-	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
-	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
-	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
-	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
-	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l20", QCOM_SMD_RPM_LDOA, 20, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l21", QCOM_SMD_RPM_LDOA, 21, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
-	{ "l22", QCOM_SMD_RPM_LDOA, 22, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm2250_lvftsmps, NULL },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm2250_lvftsmps, NULL },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm2250_lvftsmps, NULL },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm2250_ftsmps, NULL },
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm660_nldo660, NULL },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm660_nldo660, NULL },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm660_nldo660, NULL },
+	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm660_pldo660, NULL },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm660_nldo660, NULL },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm660_nldo660, NULL },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm660_nldo660, NULL },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm660_nldo660, NULL },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm660_nldo660, NULL },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm660_nldo660, NULL },
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm660_nldo660, NULL },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm660_nldo660, NULL },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm660_ht_lvpldo, NULL },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm660_ht_lvpldo, NULL },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm660_ht_lvpldo, NULL },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm660_ht_lvpldo, NULL },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm660_pldo660, NULL },
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm660_pldo660, NULL },
+	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm660_pldo660, NULL },
+	{ "l20", QCOM_SMD_RPM_LDOA, 20, &pm660_pldo660, NULL },
+	{ "l21", QCOM_SMD_RPM_LDOA, 21, &pm660_pldo660, NULL },
+	{ "l22", QCOM_SMD_RPM_LDOA, 22, &pm660_pldo660, NULL },
 	{}
 };
 

-- 
2.34.1

