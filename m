Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8283A3D4127
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534675; cv=none; b=UDzXo/jnLKlFO4dCXy69sBtDdoXtwcCzxToMXBnXwO4vU+LaylwL30tRLkuG1e9X5xT0Lnu54aPMrS7o+V3gm8zzO3PO4pnw8mkzR6frb2/o2YkTKTA1uh5zwyG+jQYXEKq9SWhSWjdUCyweI8QZh3woscZmA1bKCeePJugKigE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534675; c=relaxed/simple;
	bh=aKn+BDqCAE7bj2HMXtEyzQOTzNrYINfaywFfnH4EjTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGvUnD73VOmHwWX+F60NO+1y06igpHNjWHxJA5gld09xaOD/z8Rfm2UvOPZV5BsWNGv61xJ367YG7PhcIHVWNYJEGdrTJMO/tRPB/VWZLOH8asNepG5cEFQO/e786sEuTcm43ieoTxwlWXlhk88Tc21cKz8HwnwSEJMS8gM3dAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INL42TvZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQLgqKrV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INL42TvZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQLgqKrV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K771ql1896192
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1p0kWGiPSRzk+9UIUD5rcX54pJsmPtFGx4DYvuUbpJA=; b=INL42TvZ4ByF1inS
	lv+kBeeFSQnhn5pcFZNmkypaiMO15lrp2Zje2RWjXwjQrJmt04zxAJIfnFyzbW75
	u7Q69HP1y6Z6E2hw6tYI1mSXXYaKt6B9+49onvqoNe1Fm7R/jxlpXRKepCtCltDz
	InJkwJwlImitSgfcYkso7vLS4QMTXaeMOJ5FlCF+mFl+RY62zEuPUAcpgMZPRELn
	lFGWnZrF6QLnCRsFgc4xvPKW1LHErkUZ9RGLKP5avRqmUoo/a9XKiahoOFXxFv7B
	IlfpzNVUp8sfB763Xri6ezOmVnWQederX4mcjRkyQvtGO7HL6mnWonHx8uQMcTyj
	CJ5Rjw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0kr74j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso82821331cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534672; x=1785139472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1p0kWGiPSRzk+9UIUD5rcX54pJsmPtFGx4DYvuUbpJA=;
        b=ZQLgqKrVDkfKjFXLzcAGMIOzN8h3/nGhzU5xgDrHHtWrazymYQ856n3bz4U9mY1xAV
         WvUuc2beuj8xrRl16f7+mCPozDpV+NlaMpxtt65j8I2DADynUVOQtEb1ft9I+P4lX01s
         LjtQWaVAtoSgNOWLFD0OzBQczUK+OQ/xa/XG0ZSqFCNjKW+kdjglavkt5FA0q87FIS5d
         exAZTSgQdbK6itig0hOuYViF8IW/oOPtSBTauMbYM2TNtkEA2mjhXcFiu+6UqJULn4uA
         edt+JxECXWwMWj1cD1Jg7AEN+AbBB6gYA3o5jt4gxhC93eXb3VgbbnUW45lg8lg6MDPf
         eR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534672; x=1785139472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1p0kWGiPSRzk+9UIUD5rcX54pJsmPtFGx4DYvuUbpJA=;
        b=KhbC9yrWqnxgA/iQSheONYrbiQO83SrnRKQabqSn0WStPIGQWUm6yvrMy5p9kG3pKl
         t2QAf7sZcUbBleYp552W0+RCvq8WkPTy/ykDr7QwU4ua2vE+2BYBGLeuPWfG2IlirMCO
         3tLB2+r6iAG6E5LskDDV6dnYH16Zt1ZrqL1wxCIlN8z0TVuk8kzO2yGwwlG2e132AK+d
         OCGj3/ej64X++eX415f89i8qObq9iNJhXzEnR3JmxSAUxpXCR5k8+X6Cx+w2hOnqrSCY
         SgQfDbFJwwnCQp4/EcbDdSiRP3GKiKzDea6zZtjDuWkHP6eFvMioZzBGQ0GHkpXWFu1z
         3iPg==
X-Forwarded-Encrypted: i=1; AHgh+RoeNyZytHo40rBhHzrJNCMCG64T0pYaATt3QEwxa9rSn7PIBd2NY25a7MUlu64iliRGX8Q8ClLcsBBAVW3K@vger.kernel.org
X-Gm-Message-State: AOJu0YzS/cRCzj70M/Yd616aOTnQEABZfmYfSpbNOBSrEq9TcB+6RsHD
	rt8OCpwFXU36/2PaqiVbKZd0kYmwsWg1REOlow2O3cTA+sJcFgGzh1CgzzHW4OOHeiwlyjC3YoO
	d272zOwpVncy+6iwxH/On/hYyqiMr5LtERJro4NnIWJ+CRrLp/fxsPuOZzzbzWSVLlk/Q
X-Gm-Gg: AfdE7cntGDqzSOhqCqrUAKgCc26R23vcDhAJiXIn+wX+97ptHQdOy94wtdiquUuuRI8
	t9LvhS28tItiSQV0uhLnhsVbxGPbV15258T7ElwgbuxkioDqyd0oHGyQDZjLoEF57DIaqk855CF
	iG01EIBKmyTzKfxr8GHOui0gCeaPv1VfcPNJQsWayTCcKLXoEbppkaGpoSE7kom8jIgpZ/HuYve
	ySc6NvvGYF7rxqg6f0gXDyk4JsMdMiWca5CgscvhPzaTxntXYpQhgYduiKJhjpZ6kGieHjidrO/
	7ssuGJ2ZObF2tRTNPmVBHk9KSwP8zQtwLL29WU7WAXTbWJxXBgxBOHrBxI7dK45Kf5P+HFArro6
	P2UzdJM0uWt3wwDDn12zfGKbnkXlyJWjq4SLsUs3OieCj3Uds4ZgBnRv1k0xLzTmGNvpXZRMcn3
	UAZ3a/stqTS89rqoNha4hvhUZ4Xyp1y+DwfUB7zjA8mGsjIN2/A70=
X-Received: by 2002:a05:622a:4d8c:b0:517:58f6:29c3 with SMTP id d75a77b69052e-5213ae554d3mr132426291cf.32.1784534671549;
        Mon, 20 Jul 2026 01:04:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8c:b0:517:58f6:29c3 with SMTP id d75a77b69052e-5213ae554d3mr132425861cf.32.1784534670986;
        Mon, 20 Jul 2026 01:04:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4256542a12.30.2026.07.20.01.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:04:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:04:13 +0200
Subject: [PATCH v5 11/11] arm64: dts: qcom: monaco-arduino-monza: Add
 QCA2066 M.2 WiFi/BT support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-monza-wireless-v5-11-69ec6743543c@oss.qualcomm.com>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
In-Reply-To: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: H_GbLG7hqQeqtLKI0pcgHo2qgWLXMZ2j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4NyBTYWx0ZWRfX9XFiqx3U+c1D
 zE7hMbEDDJQ4pYGAC1hsy0AAsAM/gYJuCmAePA5wSnCeX/6zEDSJdOJmaDYMJlXDGWjCovQrz/Q
 2uqyZsmA98N+TDEdnqyV16xs0isSqGs=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5dd690 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4NyBTYWx0ZWRfX6NM9L8TnqhHF
 mBg2GPvF7vSSQHL53gvb44qDqScpH2k6W7kBhD7Hs+VlOtwh4LVdo8F0K57TRkygp/FtwMtj/LM
 GSS9lRRzhI41iYq8gbyKev+7PDxkOXDiR/pdw6Q8qPr1jr1uchTJ3Gv0Pk7VDUw+rZmPQgERr7v
 tSj1WZ/sA7BCTpcUbcpTZAOwoN+nGg0MxFv4wmYOsx/WYDGMzk6FXmNZOg1DUh8BCnCTrArV4rH
 zdbN8pTp78I7XxWdjwsXcxwJDs8pZDwMUcyA5X1wtXsay5t8v0YpLxI86D/7PDdWcjd7ijpef2f
 hjkggTiVF5r119EjsTYsPg1iUAQ+uzTN8ABOkaDXcyCF8pw/yAPnm8capuT7hdC2GQJ9nq3Wp3+
 9H+xEgx9AetnO77F7Blybv/C0MZm1FsX92EdpqDhZUhpVm4/O2JSHd76M9au+ZVA0VKaS43V2UN
 4cErC3l5dhApU1xw8Bw==
X-Proofpoint-GUID: H_GbLG7hqQeqtLKI0pcgHo2qgWLXMZ2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200087

Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
Arduino VENTUNO Q board. The module is interfaced via LGA and is
compatible with the M.2 Key E.

Add wireless-lga-connector node using pcie-m2-e-connector binding,
connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
the Bluetooth interface.

Add pcie@1,0 downstream port node with pciclass,0604 compatible so
the pci-pwrctrl driver can acquire the power sequencer and enable
the M.2 slot before PCIe enumeration.

Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
(gpio56/gpio55) used by the power sequencer.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 64 +++++++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index f67a554adf956696aeac2348e478dbd0b74f0e62..5e41e637c1c705ce0f3847aa71b229261a1e3664 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -155,6 +155,40 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wireless-lga-connector {
+		compatible = "qcom,pcie-m2-1418-lga-connector",
+			     "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vdc_3v3>;
+		vpcie1v8-supply = <&vdc_1v8>;
+		w-disable1-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&nfa725b_default_state>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* WiFi/PCIe */
+			port@0 {
+				reg = <0>;
+
+				lga_pcie_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* Bluetooth/UART */
+			port@3 {
+				reg = <3>;
+
+				lga_uart_ep: endpoint {
+					remote-endpoint = <&uart10_ep>;
+				};
+			};
+		};
+	};
 };
 
 &cci1 {
@@ -409,6 +443,22 @@ pci@0,0 {
 		ranges;
 		reg = <0x010000 0x00 0x00 0x00 0x00>;
 
+		pcie@1,0 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			compatible = "pciclass,0604";
+			bus-range = <0x00 0xff>;
+			ranges;
+			reg = <0x020800 0x00 0x00 0x00 0x00>;
+
+			port {
+				pcie_ep: endpoint {
+					remote-endpoint = <&lga_pcie_ep>;
+				};
+			};
+		};
+
 		pci@2,0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -501,6 +551,12 @@ max98091_default: max98091-default-state {
 		bias-pull-up;
 	};
 
+	nfa725b_default_state: nfa725b-default-state {
+		pins = "gpio55", "gpio56";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		wake-pins {
 			pins = "gpio21";
@@ -544,10 +600,10 @@ &uart7 {
 &uart10 {
 	status = "okay";
 
-	bluetooth: bluetooth {
-		compatible = "qcom,qca2066-bt";
-		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
-		clocks = <&sleep_clk>;
+	port {
+		uart10_ep: endpoint {
+			remote-endpoint = <&lga_uart_ep>;
+		};
 	};
 };
 

-- 
2.34.1

