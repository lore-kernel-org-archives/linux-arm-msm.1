Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F9335D5E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784794633; cv=none; b=VD3ZmavNXXJ5LhE0SImsM3jruMcvDav9Cd+B8Rxxdm1MIH72wwSyCcE3kpUY3iNG9ojZ+6oYN43I2kdAxCChYJXuLO+IzgrVxfkEHC6QDwnoUeAPcwD3Y9LZFwzqsbJwlG4Udo5awBHQfSHLaY4aEJuaXMe3hmLpDl71bTJwiJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784794633; c=relaxed/simple;
	bh=rgEgjbWtzkorQRGR9ZH7RCgfgeqlB9Z/p4J+v52oGSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GSn85G/BM6pe5ETsay0tSdZUWasL3SpYoxHKxOklU2fpw4zN7H6yKCj7/I2xC3qswc335h/hEpvDCCcbElDRhbEOn84J/xR72Vr/+SYHgvXiGjm3x9wJ3jSwVuGhNpHp6pUTuPncFT3+2t16bHoxKP5kn973XmcYLtjPzrFDg2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8LRQS0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZes5z7S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8LRQS0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZes5z7S"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BidP3410703
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f4hcFJZJieH1I6ZR89SVVS
	H43IwpTxrVx9EysI32FmU=; b=U8LRQS0s8lxa+odhgmPO6PzanIZstYEDjWUxKz
	zbMGmW37fZ+kM6kVevZgR+SX+fO3uIzpstGqOJTBupy3LvXpE6KfjN+wsOOHCpZN
	zm2iJL2d5TkebvGGzZiW8lYe10d5Au1LWGA06cVYiPsVnQ0rUnUfE78M/xzLc8gx
	sMnVFTB4sJ904T5VJDIsKcGllr8dcYGfCMKmnLo54y0uMYDGbeaX/SHYxZpKr7ok
	7jzEWMH4nYn7RldvNGtoOm+0YidWc91QzV1VAZTGzMZ7gDAE+6V8hohCPDut2CnQ
	ZQv+7H84RiNja+RrSzKBrIWNUw2lPLZst5ZsrKf8zMwpLiAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayh91k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:17:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so10888535ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784794630; x=1785399430; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f4hcFJZJieH1I6ZR89SVVSH43IwpTxrVx9EysI32FmU=;
        b=ZZes5z7SV6Zyww23hZ+29KadX6aHpM71WeO/8SJpd16PHFf0cnLsmHI5b+OyW7ChJQ
         tpEShUX8zc6wH51FKqsLOQWlFMTOcnOcKaqfHQW4zoGr777b+TqiObNJvrkpOzihusfx
         hBh6VlUMR/9vp1w3vDEWf1JS044It7gwHUnzTCiLMNCa6g45yFvC0PX5HHs/bjM49AwP
         bWzQXu8Ot6tT4MVNFtNARATmaiztHO280Kb8v4hsMyVfO+7hpCRF4QBqmAgm5zveQC0u
         6WM4G/6kwH/PDKzia1d1shDFp+dP6TW7vLgqZ5GGppl1f2K5fwZ5pT7Tzgkg1gNTjvOv
         CoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784794630; x=1785399430;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f4hcFJZJieH1I6ZR89SVVSH43IwpTxrVx9EysI32FmU=;
        b=c60y3wzAoQru6pH5smiiRfyUxkUY8ONnghJo6KlVXlwk0y3xj3Ci+H5vLl8ntMemho
         EmS8ObuO7/G+gDFljwZI9kXeFZdl0ZvPuBW4b8+BZoMH3D2jqYBGjsqNdyBKgKuy3rGu
         RbyQEyrvL68wccJAUUTGerLjaeJ0zIpCcVuhkrtPiHM1GTwhX9VTfcF5GF6lDW9LN/mw
         rWxwL9ROq2et0VSU7za7ebxWRhS8SGgqkuEzQZwvphs3yRILLa4YFylJXWPMLm4HJCeW
         YnUhrNzH31dLO89LoW15GkmngutikQX5VLPP/X8fNJsWnfVdFDUWHOJ6b77cYb+Aewcs
         NivQ==
X-Gm-Message-State: AOJu0YyonCpOmp02LC6+boTSuxmEMU6N1glIokYLJ7riLUtp2dPNWXqD
	lohO0UkpxPYJ2ryi1Aw6b3pGrT0tjMWf75xpbkP1JQnmIfOvWrbkl9F7nLjki7FHYQCBiqGPH9J
	YXH9OXxCT1dBsciqrnjcNG2/tDSk/ma7jenRgI6eWvIHIsuGnWNzBUFu9EhgjMFjJThfn
X-Gm-Gg: AR+sD1181i0xzV2Uug/XBLItFGV/SPJYoBldWO5LgNDNqZaVZEMifS2NA/eMIEYabAz
	kSVOuhphU4OHGP7jTo6mRQRaQUt/1pEHFuiYGSx9Ih50FXsqbm6/g2PnKit6pG60hRD7rz4Eoib
	xwWUuicALuydvt7+0ar3Rq3qsCSA+rG27/wkxjGPAu7ATNqGqDkFJYexhMvPUgTEqoXmIXAQQuy
	lo6zQq8mFT8biEVwngVF786xEuFltRBZLVMXLc1C61FGlgfTB5oSkbPklx0sd+UQW2/Ivw2E0m3
	IIUc9YRz04QWBBSM4UqL8eTfTC8B1vXgDSJJJ09HwUhr9vEJYBzo9kbLtsidxvJVQsQHDOt/DLZ
	eQ2n6xU5OhqvmX8fW+bY4PCPE7kiSEnV1/tb4DNbMVf6dFcshOOmh0lpnCXhpGBmzJb/g0A==
X-Received: by 2002:a17:902:f549:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2cfb23a41a3mr1806585ad.40.1784794629927;
        Thu, 23 Jul 2026 01:17:09 -0700 (PDT)
X-Received: by 2002:a17:902:f549:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2cfb23a41a3mr1806205ad.40.1784794629454;
        Thu, 23 Jul 2026 01:17:09 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd828asm29144215ad.19.2026.07.23.01.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 01:17:09 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:47:04 +0530
Subject: [PATCH] arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb
 controller nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcs404_dtbs_fix-v1-1-c9ca0dd69f23@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP/NYWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNj3cLkYhMDk/iUkqTi+LTMCt1kQ5PEVNNEg0QjC0MloK6ColSgMNj
 E6FgIv7g0KSs1uQRkjFJtLQDNpCu7cwAAAA==
X-Change-ID: 20260723-qcs404_dtbs_fix-c14ae5a0a281
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784794626; l=2678;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=rgEgjbWtzkorQRGR9ZH7RCgfgeqlB9Z/p4J+v52oGSU=;
 b=c7bdHvmB/UOJ7OwY5ZF5/FnmRQIeRK9WmTtoRcO38IGQPSpDu5h5R5O1A21QC/3Ceq9TbJcIr
 PTEKJgO6T9VBDl9hBycb97azHFZ/5KQjNfkCIgatyvV6b1XBB3seBBG
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a61ce07 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=yvoFKJ9MTi5RKS5TNiEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: mKFYV9hhmf5kcWoR6tlMXtBTWQ7g4QaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4MiBTYWx0ZWRfXzwbD8A54rEjn
 g+zw+tZgCOc4Q2gLLgMi1HdxxTsIoVb0pxYc5a62drUnYN06LIqM0oKHGmlgwzGKkIokh41CvdR
 +hQ59VDJuqgdYGq3CaKRitkciPxGmOxq7jdkgzpYaahmxgq8svkqzFQMb2S21cGOkFi2KRC1B/f
 9uh7UXyupe7MvyAUvhDh5xV8CXQWghECXL+yOe+MErqU2xGGULyHfG2rUlGtQ0bN3/1WaiyQ3Ff
 cjiYWwVmT/EwTCW9QK1TGd0DpJfT41MZisFHa+pisoXZDDGMckFACRfbFxSTkOxTC44bnsbs6bv
 +/geAWmOin/Vf0JqdNyRiiUxATzO4O5VFk+Qgpgvu7gfeG95TzEr2tT3VfV6vvGwIDtHJANjtMX
 Ix3q7vGMkTR4O0TmqJAoS3tXEfdYNS6SXUcw1rnFUd/QadZEO5W/SycIgQRivdgOZ5NR+JzMkUh
 xrL0TtZAYJJrWw+8hrw==
X-Proofpoint-GUID: mKFYV9hhmf5kcWoR6tlMXtBTWQ7g4QaD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4MiBTYWx0ZWRfXyEsVFZBFDEne
 E/Tj7m7vGhrpS3y5toOg+uVmNJypZ0PQO7ZpO5ybLATUAdgPmJGNPv2lwwMQ4H3OvMPcz6U1OW4
 S1m+IeUe+1Q8YuZmmfgHECqPtT3O5R8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230082

The following errors pop up when DTBS check is done for qcs404 based
platforms:

arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
dwc3): interrupt-names:1: 'qusb2_phy' was expected
from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml

arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@79b8800 (qcom,qcs404-
dwc3): interrupt-names:2: 'hs_phy_irq' was expected
from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml

arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800 (qcom,qcs404-
dwc3): interrupt-names:2: 'hs_phy_irq' was expected
from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml

arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb: usb@7678800 (qcom,qcs404-
dwc3): interrupt-names:1: 'qusb2_phy' was expected
from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml

Modify ordering of hs_phy and qusb2_phy interrupts to fix the errors.

Fixes: 927173bf8a0e ("arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332")
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
This series has been only compile tested as there is no functional change.
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 4328c1dda898..736accfc34f9 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -677,11 +677,11 @@ usb3: usb@7678800 {
 			assigned-clock-rates = <19200000>, <200000000>;
 
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "pwr_event",
-					  "hs_phy_irq",
-					  "qusb2_phy";
+					  "qusb2_phy",
+					  "hs_phy_irq";
 
 			status = "disabled";
 
@@ -716,11 +716,11 @@ usb2: usb@79b8800 {
 			assigned-clock-rates = <19200000>, <133333333>;
 
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "pwr_event",
-					  "hs_phy_irq",
-					  "qusb2_phy";
+					  "qusb2_phy",
+					  "hs_phy_irq";
 
 			status = "disabled";
 

---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260723-qcs404_dtbs_fix-c14ae5a0a281

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

