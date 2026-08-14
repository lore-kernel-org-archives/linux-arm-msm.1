Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245E13CF962
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701126; cv=none; b=cQLS9jUMx7blz1jkgDNZgZweutNp2XEznDECEmHIJALLvqey8gBkiNI5g7hY0wLe7ZXpQT/kvC+VD8qjVwN28HC+tOoE+h16Nt7B5EmXvWrej8BeCiULY5YhyKbc29C5CHdVzFGCYQiGuDXyq+64k7xz81/4/40GjEAEGJrEd8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701126; c=relaxed/simple;
	bh=/B2YYQuefrnTgw0/uDtoG2BxFeVrQrRwYWlI7RGt+lY=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=XQlwp5zoP9utpeVgE6q+RVoZ2UWype0yw7fQdxI7xcO6St+VeT7O3ipE/OYv4pWUQW1csJXALOLic2rN36hK8II3m+FNB9ydKL/caD1xMpdsb1lIYFXKU2Q6b7VzkzV+dfcDGXEZrftQz9FpeoeQ5yIWUa9AzPW8w48aUAW3iuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDtJKweF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1RaIQiu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDtJKweF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1RaIQiu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7gIZ64047369
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 09:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0lI/8500tqPbnOPsVS8DIg
	C8w71welYBBdCtfUH/UmU=; b=WDtJKweFq5dWvF9oRsFuUzuQG0TG+EBqSRVQAl
	ULlnRlW0pJUBf7IEerEyTTdcGJvTItiln4R54EvfuVoYymCi+YdLQGK/FOXVVkhP
	o2/5YSC7wmlOQKPdEUatqqIOap+xAj7imiEUz3cnK17d8kWCehOIxCqNdNfWpdNL
	A5Pamg+VK3hb2KmRmkDH7CLkrR3Jaw933tkMuZfB2LknIWhP4W3ynPN6a725sHMd
	Ww2feLWo/IWbWgpwNepJQrtBXc+9ep1x59k5DABxx439ZGmsD3wPaC6W6CCa5Fou
	IuLidwfeqRKkmCvH52gUpPBQVljL8+hj/eEG0OFny67PmhAg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy3ntw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 09:52:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1078212a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 02:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786701119; x=1787305919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version:subject
         :date:from:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lI/8500tqPbnOPsVS8DIgC8w71welYBBdCtfUH/UmU=;
        b=a1RaIQiuThpJ97rKScFvY7rlP6okfLem5R7TXgCJW1pwX5FVSMonfrrL89OvENPjGK
         YrnpGC80vsrU6ARU86HGB12UOr3LTKmR871UG69uJmPC2cOM5W05mz3yl5UDPrEnRUmY
         arGUbkTezd8QWBWa/ZxyAbm87sRpr0CCFGPm6Igpy7184CcFh6+VMRID+j7fKVkQVYP5
         LaNgzeslBnGaDDgB08yjKA5/izzUFnZ9ENAcu9KKR8UMuExR6ULPxL/FJNYqXOJ+FOCV
         1Nl//gezLZmQSKH+D6lbwgWflOJEkZu3i+4CULc4sJVYqtnk0+H/Lp/CcQXQf9wzHuWF
         XB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701119; x=1787305919;
        h=cc:to:content-transfer-encoding:content-type:mime-version:subject
         :date:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lI/8500tqPbnOPsVS8DIgC8w71welYBBdCtfUH/UmU=;
        b=LVYRNNPYDTRaJkzZmqzWeGH9TUri+4syCm5bgJbkX9WKfP9qeyc0qJb9NE/3dAn48S
         f7ZfcK+QaX38OOI3/hoJPb9h8saWylXse/3GK/aUaxBXS6Y9PV9LT51xnRoZA2URnsoq
         RvlzJN7SPSwq1L/XVcCAtjOH2r0zbzSTpEgnDRH+Jk1VS4NQ7Mxf0nFF9JxnWN5rWHjm
         IpKPAvYpBzdW5oUXZIISooH697TxwcWxDn+KOG3d2LaiZXWUSYNPdLKnOiS0ogCIRgTc
         g24AyXyrisTXwakfNhVEs8Q+zYGINY8pfYkbhZeY82bvEC/QA5EhJaMYmSpc+/Gr9Nrn
         KxRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbpNjwI4YCUPKHyXRS8x2uE0EsWYSoKihbSwiSDbQXnkBJdAm/9dsmkYA9H9bCbACOqMzs18C9m59iGgSg@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXYSSpEQWud/6pxg0rwjXSm8B2P7uttl1p1z5U2nx6HtQzFCs
	PEG5GXQQm/WAOM2zRQndD2aQeTl3XRiwAfpOJpLaUYxe0dYx/VWpSaEbG3FhdDRej8We8jhu+AB
	L6ToClKAP6wVdqLzcqx5bbNUL/G+v93sdDJLKRxwSXI999kJCVzjXOZVOVa8OFBmmzpPe
X-Gm-Gg: AR+sD10zO9ii1u8KwEWY49kZqSODec+dFLWqPrUucSFz1WVDyiF92iemZ5LxXCeWZCh
	5Lf+ZMD9w+aB5fUuh/NN/RP/0kg1H/cjChBVjcl/yAdYLneM0Z1pIFZ+2OGe2KAkMl9tc++3ST4
	QAI/fVqX41BpAixV58MGB9gLmjIDeET86MxTAKI3vMGDxUJXApyxZG9LgCfpRuT7IEz+FDkhReC
	SmyDC7jL6zZht25EvB/ddokF2w7lWobXjKwwSm2MMtsR8ybONrLaoIoluqRlD995V3LxdwGi+FI
	oe1MCtBdDSeyeWBwhLVM9DmLWZ7vkIAFiaKfhuUn8Y7to2H4sF/npe9tSeD05S1zT83jRCC9Ple
	26EtS1peRC23OirHR/E5Hz0VxamdYRnU5
X-Received: by 2002:a17:90b:1b47:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-3933e63167amr4547269a91.16.1786701119162;
        Fri, 14 Aug 2026 02:51:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1b47:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-3933e63167amr4547223a91.16.1786701118712;
        Fri, 14 Aug 2026 02:51:58 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea995222sm2073160a91.6.2026.08.14.02.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:51:57 -0700 (PDT)
Message-ID: <6a7ee53d.797536ea.65c65.2a09@mx.google.com>
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 15:21:26 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: monaco-pmics: Enable PMIC MBG
 thermal monitor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA3NSBTYWx0ZWRfXwszFTiz2uqFL
 keQwOgVjW00lCHWsaHVgAGJcsCwl3tC10WQy5d8lkmFnIMzP9gcpdmhYwSZxsQTo1NN3etlsr7J
 2xjmYLKrmyxwh7YZ6fPvLQnZ6AuVtxmXEHS+agowOoXjm2uka5PCOxk+2cbAeDNq9p546mKG0cJ
 kTjMKF4cD0sfXiw7VP8dFfu416paru2Q4vN3N5CzS8VMFzfhjDcMp3KaX+7erFrByLSsCj7scBA
 +z4nulpPrRkTfbQl0ynf3DXgvVstsQm0YsZWmMZ3TU2VJvRLHR4sZos8jBjQBrHzEQk2R//yPBj
 fvmW/BLZtrTB31OHcBcX2eet9cw+S2MkicC3jge3Nux/m8Ku+wrXv2DySOpUlq9vXG0mbdS9wKe
 mmU1LcCKB4TK30ptsbiggt1B620jgnCSRoWEQoPcMPjSPqv+qKau16BVMufFzUtEPC7+FhG6ZPw
 OBqwMnojytqYzzNuYFg==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7ee540 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w0oc3zvpXKfngUIgkp8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: TQseCKNHjwyLxWox1HLOU1DqSfNDx6eN
X-Proofpoint-GUID: TQseCKNHjwyLxWox1HLOU1DqSfNDx6eN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA3NSBTYWx0ZWRfX3nXyMNLURn82
 dkUrEgUL6FSgfKngZ5oesbxyA9kPSSPx5yaLwUyvqlkRAuyQmxem5d0jSsObDA39RzD/3pgRn0/
 fba3fG+nm60cjNvHqRqSV0FQo3JpMhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140075

Monaco boards use PM8620AU PMIC instances that expose MBG thermal monitor
blocks handled by the existing qcom-spmi-mbg-tm driver.

Add MBG temperature-sensor nodes for the PMIC instances and wire them into
dedicated thermal zones with passive trips, so PMIC die temperature
monitoring is available through the thermal framework.

Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 62 ++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index 6e096b9b7546..361f5163b6d9 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -7,6 +7,36 @@
 #include <dt-bindings/spmi/spmi.h>
 #include "qcom-adc5-gen3.h"
 
+/ {
+	thermal-zones {
+		pm8775-mbg0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmm8620au_0_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pm8775-mbg1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmm8620au_1_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmm8620au_0: pmic@0 {
 		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
@@ -53,6 +83,22 @@ pmm8620au_0_gpios: gpio@8800 {
 		};
 	};
 
+	pmm8620au_sail_0: pmic@1 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm8620au_0_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			io-channels = <&pmm8620au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
+			io-channel-names = "thermal";
+			interrupts-extended = <&spmi_bus 0x1 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
 	pmm8650au_1: pmic@2 {
 		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
 		reg = <0x2 SPMI_USID>;
@@ -90,4 +136,20 @@ pmm8650au_1_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	pmm8620au_sail_1: pmic@3 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm8620au_1_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			io-channels = <&pmm8650au_1_adc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
+			interrupts-extended = <&spmi_bus 0x3 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
 };

-- 
2.34.1

