Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA25442FB7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805001; cv=none; b=Rf8K0URSFF02jTpq/AHxhU976OxYMe1pGnp2i3lUj4z5p87J+OuAyN+u4/4xT1jY41yAJRS3ZQOKq3a/CJN+M+2uAdE4aMwDuHlXY0eZiDFgNiRU/AbYJ28hBoX4GuSAixQ1P+coEioHqqeBcrtsDNaIl3KJozf+Qu8IVmCSgiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805001; c=relaxed/simple;
	bh=1wND9DuavkNBuhUpF/XBOklS8CyoeTzkKtHCifbRz4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLbdTqh4hx4UWW61Ly6B66w/Z8rWMYdXX/qmzaVG2618Rj7IZtv/MTDtqU0LGnKrMCBmzGKsP2nQOVX+Ly5htp2Bn33nMEFTI5PlBg0hY2A4UjacfbCk2McmSKFXADA5kikZ+qFHZ95bVcp2hQQGehIiZCLD4H1AJkHl/tpZ950=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afrOSGpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9WiM9xM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afrOSGpj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9WiM9xM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qnFS3388121
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OdCyyXdiqbE
	UUjsmTf4UxNPG1HSVtA1jGd/TwpCd+dU=; b=afrOSGpjhcfxU4VaiZzdjBgFKON
	9yGV4rr/sRc8EV0grFoL2FmPrHXctM2lWqac3QnmmrRuHvX5LuB9OngvRYNqOzw9
	3Aohfj3qXBp5SrknqP04fdD9FmduSlupaEkwJoT6VEEiZrBmdvvnDLm/aux0N9bn
	d6P7C0PuafWsuk4BIo8hBcoXC3v1aCtyCcsNZAoKpZbcMXHrFsGr4DShNIBno/ot
	Az8ammI9bZHSw6Ma72FGVlsyWrOBty1s6Pod1vUFrpmRA31VeKuVNHb/lmgIxew4
	TN+rl5+cGi243aXbBPRuOFCjFvyykPYT7SavkJEBPkPOtjM7JTOA41NGAFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275ks7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:09:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so8483131cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804998; x=1785409798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OdCyyXdiqbEUUjsmTf4UxNPG1HSVtA1jGd/TwpCd+dU=;
        b=I9WiM9xMLlF5rKaxde2bVWHcWQdBTwBpti9mZlVj+i2x/vCdLdvslBFFRPqR+a5TIb
         IAwPyUkOEzFuSvFCvKVRGgO8TlhV87Hz2xoduZgncTOg+GrpsRedf6CzN4wZy17y+cJ1
         i4wxzkItflDFW7fNaMqLJIhrX/wOms8UGysAVI5OlBdh5lgcQtWG6jzFkcBZapnTjuoh
         voN1ibru+QsJDvssQ2b6rpZwWJO+6giJNGIuyFYKPVBii42E8ugToB449Dyi9HwqGJR6
         MciaUM2253pnwd3yTdtSixWNIWqvCqREUpg6NGyf8AkUUaoO3bu8a11RHnOn0EqJAtPo
         IiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804998; x=1785409798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OdCyyXdiqbEUUjsmTf4UxNPG1HSVtA1jGd/TwpCd+dU=;
        b=Dfa5EYxQDTHx3730loNke2iEGkYr/O5a7mOSdlwA+w0rFvJcoNuJxejUXUwbvK0HDC
         mh09dnEbIRYpQVXeV8h6hMes0/02Iq0JcAZsBUfFtjfuXDC+bIKpdtFAUoTpDoKdDXfE
         LZdQqxXTFuRZ8XG3OeRAl8q9scPm34t6hS0f8aTfX5/wKOGV1aitppgMDB0vJoa6lFba
         0t3bvhyeLF3zTxQJFYj3xG5wSBhtbkeBIdQIPeUGYmf+L+2J/u5BkUh+vwMoPp8Cbb5s
         B5oc93S2rxmfe2xp0BURwBNYLE2G0+0DEdU8Lz7rBqaG9doxnpL3zxHWW2F4Sl7fGYpM
         qvXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIhwuNKFcrF0ZhOnV5ZXPdWIVdGbJne7TwvufhFOPOJF9lQScSJhn4dqPzHsNerBLw2oKKqHVGysdhzMWI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Q0uOOYN4CZFuNEKr50XQ1KmJM1PxSRDOg/UA02ARV+paFTrp
	bE949vQY1NSTOuR/GnUqL3Gzx8/aNgbEbzx7dzr1FAi14yVSi5sNwwEBRXGmbFNywhBK1J8JD/K
	l2LeAusHcbiTxOBkNdoSN1xJxCYYig/iQjlFec5Cu4fjJehHz2Cj0RP2aHK+MDS6AjxWh
X-Gm-Gg: AR+sD13A1FEWz1bP663zr27LzSx+vfMHhbkK1PRXL+u+DabRaewCyhw2NJQQav7FJ5B
	RQlD1FPqkoCHR7cB0fSycG8SJzRllEuPAVWnP110kKYJ/tFajvkmz6faENeimkOJJjpORlIi0X/
	K0EZ8gEGgHUejCAyrMe8wyeIXdczy4e0dQXCn8VkiwufSBMIlDUAnJs2cQK5Ukl9f5rSzl1pHvk
	iwtP92rlex8Oy8gx9n/CEJz8bqd8PmoZ8CVWtV2Lhy9gMImo5jCoPeeMjsjTNwZndmPRlHdAUmB
	5qS7nQWk6iwA+yixRK32s0TfC60wZgkLnwwP7KKpVzQqGWRsCm3jI8GDyQJLLRmXCSjaqY0u2EE
	PkBNq9fh9iDRKt71syptzQERkcTLc2ZKq78w2KKhH4d790ILyyoT6sgoV7jSaSai2MUVWfXnoL7
	hRU95PIhJhufsqZRk=
X-Received: by 2002:a05:622a:112:b0:51c:7b12:1213 with SMTP id d75a77b69052e-5283e029606mr22298511cf.81.1784804998163;
        Thu, 23 Jul 2026 04:09:58 -0700 (PDT)
X-Received: by 2002:a05:622a:112:b0:51c:7b12:1213 with SMTP id d75a77b69052e-5283e029606mr22298181cf.81.1784804997423;
        Thu, 23 Jul 2026 04:09:57 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f11af2sm214176466b.57.2026.07.23.04.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:09:56 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/3] media: qcom: camss: Drop csiphy_res_8300 phy resource table
Date: Thu, 23 Jul 2026 13:09:52 +0200
Message-ID: <20260723110952.55597-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
References: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61f687 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=SmqKm4ufXN4HyjwWdg0A:9 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfX8Eaezh5nW0HR
 KYtiyXE3eMv0HBlICj/IbleR2ZElJEQjl5IvWnjNIW9L4gFuTXCZjVPWKAxByCTtnX4jtaRMOT6
 3cVpZgNDZ4JO1kabaZJYWVb09XdzXNw=
X-Proofpoint-GUID: EVllgpzyM8vbDOpdDvrJ04dpFXOxD8-2
X-Proofpoint-ORIG-GUID: EVllgpzyM8vbDOpdDvrJ04dpFXOxD8-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfX44b02G5mAoQH
 qkW7Gpqewxouvg6rdlqjYZErQBFSk0q0u6FQC99N0pwtvouLsSgv+dYJm0Gu/GegIuhMvfUbHqD
 PMFYCmyxNhI5kMd4t+IMMAEgj3tma9iKvBeoTi8ga9GVDRfd+rM/3TyBbpL9v8oIe2/SnEdJOIn
 mthQg39D0jMc47PxNmxpV9gHckHPl82zXSccLTMenFPY/GKu7u8CJb4vK5Em2Hp3i9tzKWSQbNX
 NdwYTwlcwneESoN9Xtnu4vPYOl73Jdy4OUjYTt3hKLGinzVCVNsMldEj8SEircO/Hm188rWf3pI
 wjv3T4rjIPMQ0K96MKWM6zn77zesOgwkinv1dDRJmD40JEePNdqNrMmlGaHF3/Zycv8lC0vcbeB
 26HKa9odO6rV2bxH8A6Yjudg9SEZEhUR7kJWfoISctM+bX5viO9yUUbuJqYEvx0HzydL0IgA4xJ
 fHYk42c5wSN/Jil4k8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230109

The qcs8300 phys are identical to the sa8775p's phys drop the duplicate
info and use csiphy_res_8775p[] for the qcs8300_resources.

The only difference is that the qcs8300 has 3 phys vs 4 phys for
the sa8775p, so explicitly set csiphy_num to 3 rather then using
ARRAY_SIZE().

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 70 +----------------------
 1 file changed, 2 insertions(+), 68 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0f68199adbf0..6dc102bba904 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3657,72 +3657,6 @@ static const struct resources_icc icc_res_sm8650[] = {
 	},
 };
 
-static const struct camss_subdev_resources csiphy_res_8300[] = {
-	/* CSIPHY0 */
-	{
-		.regulators = {
-			{ .supply = "vdda-phy", .init_load_uA = 15900 },
-			{ .supply = "vdda-pll", .init_load_uA = 8900 }
-		},
-
-		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
-		.clock_rate = {
-			{ 400000000 },
-			{ 0 },
-			{ 400000000 },
-		},
-		.reg = { "csiphy0" },
-		.interrupt = { "csiphy0" },
-		.csiphy = {
-			.id = 0,
-			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sdm845,
-		}
-	},
-	/* CSIPHY1 */
-	{
-		.regulators = {
-			{ .supply = "vdda-phy", .init_load_uA = 15900 },
-			{ .supply = "vdda-pll", .init_load_uA = 8900 }
-		},
-
-		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
-		.clock_rate = {
-			{ 400000000 },
-			{ 0 },
-			{ 400000000 },
-		},
-		.reg = { "csiphy1" },
-		.interrupt = { "csiphy1" },
-		.csiphy = {
-			.id = 1,
-			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sdm845,
-		}
-	},
-	/* CSIPHY2 */
-	{
-		.regulators = {
-			{ .supply = "vdda-phy", .init_load_uA = 15900 },
-			{ .supply = "vdda-pll", .init_load_uA = 8900 }
-		},
-
-		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
-		.clock_rate = {
-			{ 400000000 },
-			{ 0 },
-			{ 400000000 },
-		},
-		.reg = { "csiphy2" },
-		.interrupt = { "csiphy2" },
-		.csiphy = {
-			.id = 2,
-			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sdm845,
-		}
-	},
-};
-
 static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	/* CSIPHY0 */
 	{
@@ -5560,13 +5494,13 @@ static const struct camss_resources qcm2290_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
-	.csiphy_res = csiphy_res_8300,
+	.csiphy_res = csiphy_res_8775p,
 	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
-	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.csiphy_num = 3, /* qcs8300 only has 3 phys vs 4 phys for the sa8775p */
 	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
-- 
2.55.0

