Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898266;
	b=q2J9ZxCjfScNGRU+4YpDTBfcgqF5RVvfUEq7EyFlIlqHbtBugNzc4gD61wpMDlNyg28X
	 0Ba+PgB8KvAH5C2dqN/SucWmwrB/Hqvn82s95uL5LDWtnehR5iN3cVH6FF69OnwA934NC
	 PMWDH2WAvMBRE+obgU3G8VdPfngVz0mIukuw14SkALrQKFGJ7SsTxZU5owINkuQW4O3DE
	 Xe2l8KBeqJYc6MPJNovGfwM0/aKCxauLSQhPTVgCs/L3BpOXTo2ILmjPfoRjr3gh9okJA
	 MvH+PovNi3xTeWTozzunr7MfKXDHIrZn59YuOefHKqox45go3tEQ7XW3JdqYU4vyc8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898266;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
	b=oebzd4rBI8vND+TFczQxkNFI9d1LHR6c71Yxl/T2jvWqZtGBrHCx/b+fEvRgwFv1IUAM
	 hSipG1j3OIbaHkcbjsBw6tk+SKXmwC4DunIFgYzLf9/Vz1uU4z2xua2mCX7djyGuaedrf
	 K/bclrgKBgbk5/jwdcUkkGNKk7pxFXuj0seIvMX70A+ZdxxZ1NbJSki5a+cA/fQ+s5YJj
	 T/MP38/V8IQphOX6a8sb7dj6yaleFbLhYnYZlsbz/QCPcWqJRgSKecU1QV8hd/ngHSOy5
	 Wuxhnf5ihaEUjBr5Qoy7ha5Uffg98da3fPzfJgcKPTnkpwTxUvCyGhAWMVCkzxs5fkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYyXW6bU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZ5MKTeg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E371F606B509
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E371F606B509
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYyXW6bU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZ5MKTeg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17ElC3666242
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=; b=QYyXW6bUTbcrcDDy
	7ohIzlCQ6Vsbe0dQN8fgBCEoiWRLCwoeNXH0awws9PjgHDTAO1kXxU1ThUeTiHur
	Kojc5pY2dxAtxrnu+yS1Z0t+G2YRgJFYKVWnTM7RmukUcmpG9y2Alnfsq2PKFImm
	LoSqFcG/+niGmH/BcStLHvKwaWwmfyVq6TpAOqwvr4d+9fFnWZhiFkXLaH9DpS6f
	7fbIDdF6+MzC5tyDjM7uHtacGohUCVg/x60aPhvzM1ijL63IJ9PStXV6Qnv76Jeq
	XpXepZ6s4hMWPBJ64+OIfDygBA5tY1Y1wTeT2uHG9HICZl1JEnRfk5LWoZ1mQy3I
	4QNrzg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xjcd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9408780eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898259; x=1793503059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
        b=bZ5MKTegq6nR69TiNuP8efnQ6by831nRuoWGBDinzj/w/7kNE+LhAVMWKQraJ3Cjgi
         6aUeF2gSWmkofC3mbwRcKmaVJOIOR5Fv2pLE/KdeGUQL8cmZE1vOzv89DoRejf8c3N14
         B2hzMruIt1kz7MMqWE+VpztgePE4sfok6nlmpOht8xvZ0CC9NhjNEWZR9gCqMXqbL96N
         TaHBl2k/wDupQcv71zD32JjMTh4STh/A0uM8c5+9oKCJDt18v5yc4fcwV3yESgabEinK
         57FXaUH9WH7NVlB29A7mv3Y6FdToWlZaws8sUhHwtITNM+DblVzMbYsN38K9EMD8xmwJ
         yUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898259; x=1793503059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
        b=QrZ87lglU5TFO+3cgjUHSKqcLO/Ujkoc3gDVfy9wilmNofP/A67JID1u0ZSSVkV01h
         qG2/IBAtJ6qc1VPeWJUiRvezRNV4HFwStSvpD/Lu6NdRb3o8nRgrOqyoDT4DY91VKtzv
         dLziMKIjhYsoowOEO4fH/ORuzqd+WyQ8Ta1wVtlUhiZOAYqMn/cMOg2zTuHlvuRd1ewx
         AE9uTzjgaP+MFtmzL4lsO7lFBKxOcZJPtn4uru5eJ1n2s/+9frXxx7PYWqXyfe2uQ+co
         +a2MoBzVUzOrk8Z3cLeEmWk+di74hO86q1Zw1fmTuru9rtJs4Qh6iYyO17xU7vWtSoLI
         r0+g==
X-Forwarded-Encrypted: i=1; AKwUvBybrvL36YqBYG1FayBgHPRk+9ztgVsiDA1qvEcxJSJZWwGWmkeWvltFS8eUhMqjpyG5iWfGedJnjhztfwOE@vger.kernel.org
X-Gm-Message-State: AFq9FYInnP8LEgAqGuW8ROhMCZ0vTLfgalv7Y6nuxWyPzUdIgGDyVJO3
	Sm15zf8Pn9hjpkQ7jjPdwCyfoWUwgcmvu+6netm59O6JE9c/c03XZSvYuRDCgq8hfhsctaQnGw+
	cUU271gp1ieY7tLHHib4I/PMdDo89KowxbAH2igzodc/iNsYSAO0iIsmsQfHTLV764SCF
X-Gm-Gg: AYBFou2Q9TpjZrlKBRyT6tnWBa2s9m1YjT7Wrdl2Hf1OrYWTpJo0R8ncUAqCAYD9hOq
	k6sQ4sGt2bSE/vtXROpfsoCJusU94FKmV58br8/QAG3i2df5sOB0xuV7bZuX9iBiH7SiHTpdtqR
	K+tPqrIh6O5iNwgHfO6Nzlsk58VZkEfy1qVYPqigN5kQ87sKAuOKg87X2EL1Ab0qZOtPTahW148
	6Wz5mT8zA5jLttBmd8m9Sf5ImhUjtsNRWQ0/HmxrFauLU0PrnrX5vvhtZT6jsic2BWsGWvNbXRC
	w1CRyH9SATeATJ1/TE0p66bAl1ek3gqKE7aT2DkFbtncgP6H5mw7wBQTX9GUHiaJ5D3p1RpK/Gk
	LvAVI4+0p5b/1f6yiiVSHu0YoReU7JEj6QacyoQx9nK7OcujKGSszR0wZu9HCOZ3PXoJwEGhTh/
	hD75G60Rx/ag==
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7537510eec.6.1792898258948;
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7537473eec.6.1792898258482;
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:32 -0700
Subject: [PATCH v22 13/14] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
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
Message-Id: <20261024-kaanapali-camss-v22-13-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: kG7u_fvsqKkUDcUnpnCqRdHiITfv2NRo
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6add74d3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX5KXrFbpd0har
 XEHzAmZPEx8G67yR+ke5lbIyf4CC5dZXypfOrDJCEV6Q445CGC1brIT1UrjPo06ko1Zqpmh9THu
 DSwBE/DC2rg08nvPZ+inqA2b7/7CaXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX1x8/SD0yNUDo
 l0ZDC5tsk/53qTc5ZPnUpM1BQhv/JTo8OVhIs6mnEX7zzjVLWTn+RiWhOsT/u4+m0PTq7Gun21J
 liFQq0CvyTCgtcJ02Qz94dqHFvJXXklQDP4GaZbRSll85qfEm5Xi39aeGQZV5X2oYizu4Grs/tq
 Q+gJbEg+LVCZNoq3ezmLh5sXMKMRmZDV8iU70+fMFrxRJ+bYm40ZQclTGM+NBUjnwKVIGvAQGug
 ln4xbwwj/koB7K9hdPNTr8Ws4n81L997mBGT5f/tp6hdtHtPXl2mFE/+JlhF/IAsQRRqXLhCM7u
 uuQi/UCcUFhoQGLSpsHu06kFsdtaCVgHrDFof09fDeWARsseDxDBoMDk07vWBSjnSyPGuKDdHhV
 f2wmSsnqZdeACb1Xx3IQbD+rxl/fYvqHbYGWZyFrHBjD9kZl/nyEc12Uaw0TqAUgS0X0+/5g/bU
 c4pHqEWM9i2gefZUlqw==
X-Proofpoint-ORIG-GUID: kG7u_fvsqKkUDcUnpnCqRdHiITfv2NRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 86dc1400a25e..e94fa2ba3dad 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4645,6 +4645,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

