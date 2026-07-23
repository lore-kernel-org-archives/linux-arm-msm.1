Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878894963CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810214; cv=none; b=IngpzIT9fvAv0Au+ruNsQoN6FHSGR96nmcchT2/K3CUDZHs3iJPLwW6JbMLq5oiAifJjd7sMA3MqoR1lINQtl4x7bF9deZWaSyntydEJI9zYGYn73sDJcmU7r4m2fzmrUzyMxI+n8Elye06+X+KBpgU4aFmQ8sTUrRGpZxCnFBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810214; c=relaxed/simple;
	bh=MIFQXUvAtwmgOUcunrJdpxB7lkEYC76HSseE80aRcPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FeTqnPyKQ0pIY4L2/FdJExUkfbT4tIDQFde5o/wfb9EHQHRD9wdw1MJ6W0Mv9uUo10w38LhsRBKBOjs0AU0/qXWdhgHAI0zNcSPPi/9HQcSaXhngwLcfAgd75mjA+EKUlQn4DNyq0dZMeX/nKI5l70YcG9RDj08LG7j/sIthS+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mpf8Q9UO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJ6vWQTk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mpf8Q9UO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJ6vWQTk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qfCi467824
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMEk/wsPN+7sowI+XK59uaUQPgLYiebmeLhtXo4zWew=; b=Mpf8Q9UOu02/TvTA
	AWRLlkqFSudBBk2Nl6O1C4l3GhL7Cd+ehLodGqyFZfO02uqkzAx2yS8JOMzuA3DV
	R3Jzo9iGG4D5+7oFeNxmosfhIFoaMaYwKxx9G3o0IMMzstu1bD8uEnqf4zsBAdwn
	KJ1mldvN1EHmy0hLd0u0OlzkvCoe8X9Zg9jBh3JiEBxtRu7GGMduQopIzEl2NfZv
	x7YFLlyE/yeZ6vPYq6Gssvlfy04VchAuSjENQHJTAuzNZBaFBLTMzxvah5CANBYR
	SnvBMDMA5AxpgRTZu7JSb7FGQ0UXjctWG/ffAsKW+HqeKhXWJFc5p7rEOW0AizHs
	Sky+Dw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xv30h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:36:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so8899655ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810211; x=1785415011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMEk/wsPN+7sowI+XK59uaUQPgLYiebmeLhtXo4zWew=;
        b=MJ6vWQTkhaZWHaB7hWY079Ke3+dh9IXsUXU+ch2hy9+NPBha3/b+uFqBOkj3grNcCf
         aq96z4Uwa0kXg3KTig1mK+zQLK5VdLj6vHBON+SYbqLbbVqqozlbMYhdLlzX1yoC2WJ+
         fCKAVS1EEQ+T1PKHVln3yRelx3nt3KQOM6lPHfbkK9eevY9/yaDSReGTEYScxCha5XRw
         2V+aS/X/mtKAXh8pcJ4S901AIC9l8YRvtVySVElF0Y+r/2jUTzRG+3MxB4PkQJQj6LXs
         biA5vIsoFtU8YJ3CGArvNYxIXcEppv+2LKtclQkdGhdKwURdJf7PvMCV+YUc3f9ZcoRa
         Wj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810211; x=1785415011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMEk/wsPN+7sowI+XK59uaUQPgLYiebmeLhtXo4zWew=;
        b=FubgC70Pt7/OHRyMJC887XgZGcqq1+l1JXS3a/VWUI79EqFC3/wLB6WSU74wQ30fNi
         9/rCR3h72NuUD67sKKvFd8Tk7lBtg58r5n8E8JRBkFjgMEgooKHei7whbobm6AGhTowX
         AXruLduoLy1OgRwZJCYtavgw2W5AhpWWklfyf5yKee0zdM08qC+uHJzF3OyahuEm1XQq
         9yB0mtio70G7NskKZPyEdG0q/BeXo5MN1083A+Je5jyfuyjVue2/chwB4f2y8k+tctR5
         r7YA+OPRMMqXQ9UKANZ6M7HPlin0XVgJkKYEYYk5ARVQGr7D0DfvOnqJfLvHwwcZU+8A
         r80A==
X-Forwarded-Encrypted: i=1; AHgh+RoNhhbDMsHM0BsC+vkeUefXk6AahCVZWheDTBkkHdpU29+cOvOu0ix2ys2JvrBDqlw/cAT821XjI0z11/K7@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnuKd++YtjfbD1vPeQxcE7+Yq1Gp2rjSdD3OiNt1MmWrzB7xl
	w2Q1PIQsuLM7+z+wJEJ+5SB2uwYKf1d4nFE8YDFsv87VdvxY+4xxKB8lp6U8M/V3y+F3QAomzC6
	xBmbhMrHA7RgB1DvjqYgO+4s3KoAFIZ5q5Ped1lH2dNThkQg6AM3LSdA2wfEHygR+BvPw
X-Gm-Gg: AR+sD13tUvkfWup0WIuExi3djpHznsi01D4OByERbIaieuEDf0Ptl4NOLYI+kv0B4A6
	VnmY/uIGLtDSkwH1wqaN6Q3zArQ22VSJa/1OwLcLyDDIt6S/TEFjDiMULpLFZAPzLaJRExB3BMw
	hT96KpXB9lv0zSyyB8jq/kLYpYVBtnpLZUeMRd8579GcWgeRwkw2jObD6GcJ1lpel50X5mV7sw3
	zNPnJd3VOJnwkf9HtMi/dqans+HEgcBbBFtegcpKqoI3dExO19iAycmf5pqxkCZbsaMFDnI9qeM
	sEIthc4YgNVvLyBZG7HYVwTZMX55bmGuVlSaZe6Qcp6CgXx1PIw93NPKdeGtjf6r5kLAn1aOB0n
	8P7a+XhTZy50Y/8fuGWkIKBJ+/CD+tQ==
X-Received: by 2002:a17:903:ac6:b0:2cf:9f62:1dcd with SMTP id d9443c01a7336-2cfa6d83500mr39742065ad.32.1784810210901;
        Thu, 23 Jul 2026 05:36:50 -0700 (PDT)
X-Received: by 2002:a17:903:ac6:b0:2cf:9f62:1dcd with SMTP id d9443c01a7336-2cfa6d83500mr39741455ad.32.1784810210398;
        Thu, 23 Jul 2026 05:36:50 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76c4sm33851225ad.23.2026.07.23.05.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:36:50 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:01:09 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: rb3gen2: add Industrial BT UART
 overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rb3-industrial-bt-uart-v1-3-3c8e580c09d1@oss.qualcomm.com>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: ionIvAIFZDMjD0pW28Z5RBZZC1YqhLWb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX1M9rP2lYuT5G
 G/uGjfqTXFG2voKMQqN9v2KTztZWpUb6ySdLY6JOiV9WV7JxBPWlaUiUCeadmgSVwMdZOhmXOgz
 +m7DFkXYaDXyqBA+jRFgUWVKlNdZt9k=
X-Proofpoint-GUID: ionIvAIFZDMjD0pW28Z5RBZZC1YqhLWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfXzFO1oIntVcdl
 nEeL7HcQW+lR/d5KO954ZG7kZCWboVzXyyJMFJmre+pu3JpL7c1HMLEdBli+daQdKL/r0garash
 jfI9QX3THnc6PE5KTemrvZTV7Von7ttZr7l/f6b4d7aL+PGTFPbE9ms9MSCu1NXeZ5yB8lLs3ZX
 AUEexMw7Oi5Q0oySxfyVH0+37N/IqBGMLvBcoAbU+Hvk1oXm/MODj608ELK+LQDD0EMVYk56z6Q
 Z4OaSydrRd/W8h0T07qWA0bOuiI/sAo1WGRXP3os0hLmMHpXuxWOgmLj4+uuHM/ydsJ+cKIkxPP
 ghlHvlx1rR63/HXwx+aSKEgU1Pg0JualIwHKK0XNhsTlk6aruW8g/1qbcK2HO6QnBcJOEUxvFuJ
 svZAC0repoJybK5zmabsG9S709ecTZDscneIja0xa6AFJS0rL5+g0woYal0ABsTiZymhbBOoBsv
 ewCJTaudkm76UQCa2xQ==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a620ae3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WIP-PoRWG5U8A2xzRqUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230124

Add an overlay for the RB3 Gen 2 Industrial mezzanine variant that routes
QCC2072 Bluetooth over UART4 and models the M.2 E-key connector graph
endpoints for PCIe and UART.

The default Industrial mezzanine overlay describes the common mezzanine
hardware. Build this variant by applying the common Industrial mezzanine
overlay first, followed by the BT UART overlay, because the reworked board
keeps the common mezzanine description and only changes the Bluetooth
transport routing.

The overlay also disables the on-board WCN6750 PMU and UART7 path so the
M.2 QCC2072 Bluetooth controller can be used instead.

Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 ...s6490-rb3gen2-industrial-mezzanine-bt-uart.dtso | 133 +++++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..45786d3db14a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -179,8 +179,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 
 qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
+qcs6490-rb3gen2-industrial-mezzanine-bt-uart-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo qcs6490-rb3gen2-industrial-mezzanine-bt-uart.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-bt-uart.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-bt-uart.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-bt-uart.dtso
new file mode 100644
index 000000000000..06560df0a719
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-bt-uart.dtso
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-boot-on;
+	};
+
+	m2_e_connector: m2-e-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		m2_e_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie0_m2_e_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart4_m2_e_ep>;
+				};
+			};
+		};
+	};
+};
+
+&qup_uart4_cts {
+	bias-bus-hold;
+};
+
+&qup_uart4_rts {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart4_rx {
+	bias-pull-up;
+};
+
+&qup_uart4_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&tlmm {
+	qup_uart4_sleep_cts: qup-uart4-sleep-cts-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-bus-hold;
+	};
+
+	qup_uart4_sleep_rts: qup-uart4-sleep-rts-state {
+		pins = "gpio17";
+		function = "gpio";
+		bias-pull-down;
+	};
+
+	qup_uart4_sleep_tx: qup-uart4-sleep-tx-state {
+		pins = "gpio18";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	qup_uart4_sleep_rx: qup-uart4-sleep-rx-state {
+		pins = "gpio19";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&pcie0_port {
+	pcie@0,0 {
+		pcie@2,0 {
+			port {
+				pcie0_m2_e_ep: endpoint {
+					remote-endpoint = <&m2_e_pcie_ep>;
+				};
+			};
+		};
+	};
+};
+
+&uart4 {
+	status = "okay";
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-1 = <&qup_uart4_sleep_cts>, <&qup_uart4_sleep_rts>,
+		    <&qup_uart4_sleep_tx>, <&qup_uart4_sleep_rx>;
+
+	port {
+		uart4_m2_e_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&uart7 {
+	status = "disabled";
+};
+
+&{/wcn6750-pmu} {
+	status = "disabled";
+};

-- 
2.34.1

