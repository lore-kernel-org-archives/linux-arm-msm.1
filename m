Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4092E47F3C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251819; cv=none; b=DBVjGIMtb8NcNiIXZJ9bA9b+YyS5WIpMY2pnyykHmn4DlzsEJrZV40SHF7IedgIEu8x+FPGat1Os2l2LMGE+wHPYYt9HRFQbfFVfk4+uQLXnQVjD+/zmblB4ialBTP8JdeijVVV4uWEV/yejJvOKHgcq0siz7Zz+v7IT+UxTswE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251819; c=relaxed/simple;
	bh=dNOh8bc8fc6ZMaLV5Yr9NFd4dO6f2NVAqlNacCNOquQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d1G68WkbGd6lLFhA24oFUVHbOqwf+WgUSuD0e12dvRDgsykfq0Fltzcz7wHvLGWlX3U36I9UVirinGcONQ8NfFbbfyIAYo2xdbe9XrgTA0cvJCv0LYUz1IlioRxkjqdsBhg3A9fR0zPOHu1yXJsFIhCVwMltB4C7maLqglEuii4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7sky1eu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOCrIuQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7sky1eu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOCrIuQ2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4gV91437139
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Al8lqalBrkBFrvkJhCmNMA5cpnUQWQ20ztXrdUEccE4=; b=I7sky1eufqoU5hGe
	a5ft7OJt8eK52njqZj3CrJTpfeZ7Z4GnUclM8x4j6j8yamnt7SVuhfhePBZOb0DN
	1kHkvUgSPYFlrMA7/DVbI1Esaay3+4aXwOdG/BhxuO0Tff6E5u7JVs2ybm86Q1HW
	2GCczeqfy0S4xDp6a+BKFfrozmAkxnrxSbM+SRzT5BxjXlMwQLmlPQ1UALhIq7CP
	LJn40n0OIZHqCKy8QmvcesOK+Ex78dcpt60/WeS2NzTU9Jw1XkJRO1FUmLG0Vg74
	051r6vSN4PgsnRWK/JvvAIwA7/Iy3fsy5yeJFsZkwxn3RFEYnCtoCVjhyw3nl3rb
	qI37iA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7reut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:10:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78580a6b2fbso663000137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251816; x=1790856616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Al8lqalBrkBFrvkJhCmNMA5cpnUQWQ20ztXrdUEccE4=;
        b=eOCrIuQ2w9+by9RY3azZmkSwq1UCszg6uGUVNmNm2innW2n8CQcKETCm9bINFO7o76
         SA8eQCIblIR75r/CdEH4tBBHBhai1mH10J4zaILG5lyANEFOfHQUs/cEzkp0R9LdH3wV
         j5EfZo2LXiBOmgJS+QFCFGetsOhq6L65lvmIauGFTt07uo9CznoXcAgWbhV/r6g7TY6L
         D2XbtMO18Skl0xn1u5qk9aNNpaRheoB33eXZE/255eZlq1uNj9Fboaixi8Wyunmiq2Mm
         Ku/g7zMftWTqLntVQAA+/R2jvtuGeMzVnjzbFXNW1Bm/9jVXw7R1uopkUJVQDsYWcW0g
         225A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251816; x=1790856616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Al8lqalBrkBFrvkJhCmNMA5cpnUQWQ20ztXrdUEccE4=;
        b=Ak3UkhdPgEUWT/AsjAinY0OyaSJt6sIlpFFI/jJNBC5eFH567k0xRrf07IXy893E+m
         6/O9TJ3cQyDJuPqjoJ3A15TQYJntV1DhXqOlZAT5PPjmS01ux3jNVakg6uqYt/97torB
         7nFvQh8E2Mf05dIqQv4nwq77DeA+3/T/21gUzYopmojb4pLgA4ACf0eEb+Mc43wD0uYZ
         c2Rd809O2GvdHkjiU0Pwk8SuaEvbkNO7RYL5HL+anbMMiUWD9KJwUG6t9ajj/ftYoYJA
         FuGwYR5U206rRhpkmibvsWOEdx+Lps/lVYMaScuHVGMPsW/YpkGyGwJYOPlU0VvpVNoS
         T5bQ==
X-Gm-Message-State: AFuF++nCTJb5hIlfri3Myed9fBuNOqGLK9BONPfAYAGuK5hD0ngfmW6d
	CEPHcArsu21SN7aeDpA+XYhdxuvH2f69W0HkfAgW9xepoRL2bjKaiA1nn4Qj+eRQw/s3B9QdyZ6
	h+Oet7Ycitx9zW8ao9p61jhfwYdcaAWKhMcO4eiJfRztn6CHQbyJPAAALNKDFxbP1ZbdM
X-Gm-Gg: AYBFou1DUd+mrk1UDBAjPBAWxktTx1+K2ozo92X20O9DKFKprOGm4G74aoRksn1MVl+
	crRNUqg9ckMs7wmjK4Y6KJZKaRUlquh1A1Sclewes/RPxgzU1T/2De1Z5XxSNylaIbjJb4x/9vB
	XT73JO/x+ZBC/NRmfRxrb+Qubrr4NBtFgAkY3vM6YaxqQdPh8lcjYqXbeS+nphS0BNtI1DXLsRl
	Iz7f1fP5AF992OwG1VEUwLXMJiLeaPUSvx8IGDqdk1MXzBkWyg3iNg22r535kR8eddGoZnbJP/c
	b5wH4Bunas0n6tAvyiiqa2FpDRcpWOc8CntAdNsPMQ8waZ2mXh7h/TPmKENJaVj1W74R9ngfg8c
	zDt7OqT72dRziYuWYuSWl3nOj20Az
X-Received: by 2002:a05:6102:8098:b0:7a6:a661:efe8 with SMTP id ada2fe7eead31-7af1e4f74a0mr875640137.22.1790251816150;
        Thu, 24 Sep 2026 05:10:16 -0700 (PDT)
X-Received: by 2002:a05:6102:8098:b0:7a6:a661:efe8 with SMTP id ada2fe7eead31-7af1e4f74a0mr875629137.22.1790251815675;
        Thu, 24 Sep 2026 05:10:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7d0e:af24:d3c0:9a86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2a5sm15227876f8f.26.2026.09.24.05.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:10:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:10:03 +0200
Subject: [PATCH v3 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
In-Reply-To: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3802;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dNOh8bc8fc6ZMaLV5Yr9NFd4dO6f2NVAqlNacCNOquQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtRMhT475/yI/K+QTSgZm7EU7IEIP9dgRvSrwK
 8QAj0+7Y+KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarUTIQAKCRAFnS7L/zaE
 wxWhD/48koO129HAyybBKBJgdJvjS88HiXNlkR+3QlTLR0NuHLMMBCog9ufiuaaKiLGa18M1veS
 28vCoPNWJHMCnmrUws8xLnh83SYzGd8m6umH5F+1oTzVc3NrEXjYExGaX7r8F7xFEd6BWs3G+hA
 zzg/vqWmssCwKM0/Fn/HjVYMlS7OH3tpt0pjmRJ73xndIfx52gk29RowKnjvFpZBy0g37mWySED
 VvwDw9pjAKGFyx6Cf72XbBU9uDjLau6VMEgqJ+5bvDC1D4ObmKrdWaQpM22MqdgaKbwZeJqJWok
 xcW7vopbqwv6BNoRuOzwwB/xvdPxUF1P8YVWCFxkp5AEgbb8azYCw0RMfnxV4vqXn0w1m7aJvnE
 JHpQLtWMlSc10CWZgfuYZE+KJcBbkpe/QlhMmdq/DRkLRvpXFYM5GW0atPgxIaHzvt4OUay75pl
 qfuKqRfIKA+AwerD7eKRpK/dYFXbVdaZ+jNgSqe3VAtlEjVQVU+4ug+0ZLS++5pz7uzE94aPr/F
 900c2VC1rMBgvaxX4xWcJILsmf17+Cr5agZ+A6iNiws9hwm+Z3/8bGFrucoRdHBgQMQnIYhZ2Y4
 vKEg2uVaEXiXMDXpiMj6Q8VhS5IuQ/2xD01UdVHnIcUsS5QjVWkEGDb99LnK1DmTrIPkS64sBka
 ZMyyYfO4bp4dQ0w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0T0WQFeWtAKPGXBWkYWi5FlbNooukfsm
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab51328 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5TetioHNO0Q85TPnjQEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/jOeQDymtoHH
 clhOqfuCduk+0+HeSUF41/jzBsafsZU62FpioVBDwj4p4frn8qeQq2f6y4NE+FBU1umg2MeUnvD
 JCBRYWGeXD/avMGtP5PtCIjnXoqsE3qvECW+eIOO0qnL371dYNXJnLafHF0+jRz2JFEF4UXWad5
 t7JneKwROkYWx+Y8CoiuhFbYDuJRTwpGNF2OaViKtoXfH6pfMYl1zqYlKlAWXTdCCrpCC2Y9/pX
 l4eS06LK66krqgg76efzUilyOJSyZJQYH7Oxrstd21xevZnuXxV46apF9KmnLFrlktuUAh3q9yF
 qV+y9gQI6Zqx0ylGhH0OP0eZ8qoYddy0A4CizsY/9it0XUWsHkz+YwyFmDSjiqO38f18nVAU3fz
 3GTA/W6RPWI87hdZxelR26/5IzSPkPm2EFffuXTj1SjKATqmh4EgKF1jQU7GD+BereYKaw830LA
 uW0nQ6G/U3OL+zawUTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/CpLUCNa7pQD
 On94yZCqMhh0alTYDAPxYsxUc97dU4Khk48RfOvVHVRsJ/+0t1hbXGwO11x04Ul9r8Vj6TiiV8B
 dDr2Nqk1QgIwNprnw3gb5kKsoyDP8p0=
X-Proofpoint-ORIG-GUID: 0T0WQFeWtAKPGXBWkYWi5FlbNooukfsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Add GPI DMA controller nodes for all three QUPv3 engines.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c3087a168416ac56c60655bd13b124b..bc48238050ecc6efa342f68a568447be6f9068c0 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -909,6 +910,27 @@ soc: soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		gpi_dma2: dma-controller@800000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00800000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_0 0x15b6 0x0>;
+		};
+
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x2000>;
@@ -1107,6 +1129,27 @@ uart20: serial@898000 {
 			};
 		};
 
+		gpi_dma0: dma-controller@900000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00900000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_2 0x1016 0x0>;
+		};
+
 		qupv3_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x009c0000 0x0 0x2000>;
@@ -1278,6 +1321,27 @@ uart5: serial@994000 {
 			};
 		};
 
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00a00000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_2 0x1056 0x0>;
+		};
+
 		qupv3_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x00ac0000 0x0 0x2000>;

-- 
2.47.3

