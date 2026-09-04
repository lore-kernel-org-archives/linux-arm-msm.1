Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30D03AA182
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 08:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509814; cv=none; b=vGQAIRRGRTNMLqMtcIDUg1sZQEedG+Hzc65GaGQwHb+0S7udmQGT6KQvX7yP6G6xgsPk8WfsZoF6y/z6EIV+XMf2Rq7xQYkS/l5VBo0JHEIYfVjiuXDQzK4srd76gl43PVwH2w23xd5vjlPWkNEJnBTzuFiAaj4BBSAaBOouek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509814; c=relaxed/simple;
	bh=yrsdg3XGE8YNqgGK9GBp1eF4EjaDG6zeXPjU/tgt9Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqOu4WHtJ54F9Mb7v28H2+Ap0nJpNbUNaMWKhc8anZ6UM8IH0lwL1Iav6QK/9a8lErp8FMcHQtZiXYPIgdmkpbRcBKdUY0sMpFyLHhflwOggNAv+s6fexpDprZ93t+yjmY5ra3/ETlSN5N4EAcx/zFG4E+Sb9tBpKrptwL0cWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pilt/M6X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJR1L9x8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pilt/M6X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJR1L9x8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847n5682976962
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 08:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8YBRwLvnHMf
	dCwZ25ECl4bK0hgHBskEkshgI3gq5z7c=; b=Pilt/M6XPfyy99VTjgn1GOXWc1E
	Xfx1jSEl4OfVFh4nl+4Sea058W4+guYZabRsCLv/mEB7sVzt8qmtXHcL7+0OgvuL
	xO4+BtBoG/THMe9/I4CF5NboOolOyvKB2m9DbGd6JFVBnjju5wCuFkoIPuldLEPh
	y7B+zTx0OVmtjjjHry4CdbGSxpKbT0EeiacMLDRF8LUrzoH8kRbUnPsc2wK82D/A
	9Gy/lKQMLXYhBHmfR8Jz9c5XYbv0K7pdGSFqnC+z110nrm5XiwnSJ0WOyrgO5CjY
	LxvYR25E0o3LILwOtXaRJZzIW4j9wAFO012D/Ops4w5BGhrylMn7BtfC+lA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxjpbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:16:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d94f086fedso11754115ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 01:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509810; x=1789114610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YBRwLvnHMfdCwZ25ECl4bK0hgHBskEkshgI3gq5z7c=;
        b=EJR1L9x8BBGeHrdYSHqrSkRiamXZeYHPaGWebGxlGD0OWAFWEIaofVZp4Matg38cUM
         2rD9NscyfFh4XRROp+42eOMYXKMcEmEp20YRYeYQsqtp2UbxFUbcS7MslWLx2xG3Ay21
         GFBXdSpKfcAFXfwlHs8vnmdZAy9wMMb5+OZpVw2spqqLmjAFIDFPwWBXO/VN51tdTXOn
         yHPFaMMD2/QnSZtk+CI7HSJ+Dl1VqUH9q+7w5khRi7u51YBGxI8oUOKcix1Ur7gWcWXh
         BZB1m8QmtKM9kWyM/178LuXg5IdZeDr/B2ieTN4uEL8PgiYSzdqUZs/GMnXt+LyhQz+p
         n3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509810; x=1789114610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YBRwLvnHMfdCwZ25ECl4bK0hgHBskEkshgI3gq5z7c=;
        b=qCP9iQXv9UlZ3Ue9yZ7rLcRR5NeV+DYmMfV+iCK6vYH9iWUV8alaEoZguDpDFC2Yur
         KUITR89oJidWVn4wFb6GauLpt6yNW+SdA1u9uD9Oh49i3cUR7rjYqMXXLeq78YFAbQME
         jISu3ToW0GlBlrp/4PyT1m9J49iWpnjMfKJWi+wMNJ2PedCJKTGEvMuRroJotXC/YGws
         9cob8RdXwrWS9GOLPLwx1lk2aUPV8LnZI6fRs4pmKPJSTj+xR+aXezETYwjeENgHrIxu
         s6AYLFFs8/Ci1L8jbu5NZTROj8SRriJA3x7Gk2Y85eheAEG8BH1Pw1nYSCdKCsSN81ju
         xCGg==
X-Forwarded-Encrypted: i=1; AKwUvBzD7bhDOOCIT5t8C8kDwfeZXo/UIeuBr9a5rowkHv31k8tzruGp2IGeD8L3bzTJAD36/MUNZrCNlEvgy0Ld@vger.kernel.org
X-Gm-Message-State: AFuF++lvj78Q66RMzornAwkxmmS9ZAiYM0lH57Q9B1WkIIEnYQXP/Kmr
	oPF1k/yCva/5fGmq3rBz7orXMMVSMbhIoDf7qSQB9GBrOcjNgTeILmytmy0q3U0LpAt6FsAd7v/
	T1++PjFcFrzpFUG0b8f4ZcyeRtYnC3QYs87ELwHpgr1G3O2QpGInq9xsllhsr90Lx3Vyh
X-Gm-Gg: AYBFou3/Bb/vIg7srsL53agf/H053wk0RLpJr6I/s5pKsm2l6FpBrzM/MOO2kq4a3Cp
	gOXfdUm3CQdsVBvgbZJmjZMX72BZbQ4bDs1FmcngofQ9cj18ePcFj397pSJHTpctVneRdt/LsOe
	x+DViXJZlYuizozCGUPMzK4jsqUzirQesAW3Ei5EE/iCWchRczykEywamxECpof7t9xweBFTqf7
	gbJAHhBGRrJa+VTyCluvlFTvcJv10QOU4fWX1UWpPVf0s96PyVPleVWdRxF8sxRsxSK3PKaJ8ww
	xKKSiLwvzUNCMACBjVypDdPN4GHUDFOZL151j0n7dcxxbgQoVV2CG6QAW7uKs0fUotB2oyMy9lb
	5G/ny/EwqKXYckKuPFVdOepa1VsNiCh+HLE4ydyvYQSwNenQaeLjcV6K922Mq
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr6050027a91.17.1788509810225;
        Fri, 04 Sep 2026 01:16:50 -0700 (PDT)
X-Received: by 2002:a17:90b:1b05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39b262a89d4mr6049983a91.17.1788509809802;
        Fri, 04 Sep 2026 01:16:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:16:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Fri,  4 Sep 2026 16:16:16 +0800
Message-ID: <20260904081619.593602-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6DWmslMq-d8sCWbBixHntfIQNhF968Fj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX6vbg/knHH4B3
 R2ISl8vk8uDr6iFZbdr7y0OyKNE1AHoceu/Pi3V2FTUXFu9Sk4FgfmGXwQWlRq4wqLznosDvPoD
 y1luuB3uL+hD8WFUOa5TwNDmuyjTY4Y=
X-Proofpoint-GUID: 6DWmslMq-d8sCWbBixHntfIQNhF968Fj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfXxuwNpCyW5JIc
 XX/JjvP1VYNM75H/2zOh/XKFAiq68nQ8PRb7+Q0hOBJk9OzRy3m91FOFXiYWP2W4L5Y0o47HGn8
 opTsHq71YckNHitUIrch7oNQIqVQX1KoQA9xlLKhdWM/LaMS9T1ckIEiQViO5wwrzT74ZW5a3Mb
 H/zjKWhLiwI6aH5TTCabmVY297jPoNIE6c/o6NbEqAcQAjDMRLqDLiH9fMfeGHUrvQQ7KlqNGTB
 1szGguMzoKec7vFBrP9QTGfhX4kUd+jsSzxvkSx1O9R5qJ7Ed/cgcDQ/fRqj4EOCohT4qE6lvtB
 fKzifdp7HecBegLy+5GVaXYSOzpcnkSsXpI6FK4pTqq0NLVFaqbZXLXhqpw7IhtBv1WvsseY9m4
 w/RwhwxAbKgaF2EFnlk9rci9EYWmut+8Y9c3LuxkTIaArGU/W5qeCeHlGWVliM1GYUtqAW+WJxz
 v1HX+fhkggtKkMESuDA==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a7e72 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=eAws4zb0lv8ujySLY5IA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040075

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 03703324f487..83760341456b 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1865,6 +1865,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

