Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F3429005
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412857; cv=none; b=nZXpUttyJ6dwey3j6T8vzDwUt6tlVh/fyUI38T+4K4PqpV8IeJuzkU1zKF3peKN438AAijJHO7yfSz+kHt4BLY1eJjRUhn//VVkemPjpncGIPRcXhw4PSr4qsWlSMe2t+lVYsHLpdtE4cpNV3mqXGNXt4Fy+bZvmgkj6F0qmSn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412857; c=relaxed/simple;
	bh=Tsc7wQDPxpMuA7PiwhLxACoaqtU/viagHz+PtFrel10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXR/rJxted4N2BTHWTW7sU3cxDAVvHRqDDbbl7iYrBLWjbLWGbtIYmOBLc2VZuDRmLOl5bIZEQkfNdE2r3ab0aBFsosPm9D4zBxL7zNml1sQhAVFTrqtWLc2+pi3Uf3tCwTxCmYji17N/7dDiu2Ag+oIwOW8KAKmrpC0airc8zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/XO3Am7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3+Pbvap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/XO3Am7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3+Pbvap"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBDMrD655041
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3jmAa6MnovSt1rWApG8LJQ3gczw+AVJrR78kg058v6E=; b=S/XO3Am7LVMkTuTA
	oIpxssAzoaaFjObEOUPb4E90jk0XmEdg/PTM+NYuVjwpnX7WjHI5Ba533ZBJcnuQ
	TpiEJI3C1orjG3cSvBh8jcRt1UiluWM0T+gFkmMMzDs099/403PPG/fK/TVj4w6+
	zlIHzynj+uYOwKH3hXWbVusqd7Rqy7fMoAkivsw6aWPOtUga111wKCy+cZc7KxxF
	fE8Jt8DUsyzT88zaMfgcMfAIiXIxsqSOsinMg5slBxuvwQ3KrfkrckXUlp9uqAYk
	ToZRS1r0Xs/UjH3hr3TZcjQdwlB/b0mchd88aPBRL7pwpwQTSEdVZCGDJ40YN+3B
	m8Xjbw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5j38598-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:00:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso2109355a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785412854; x=1786017654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jmAa6MnovSt1rWApG8LJQ3gczw+AVJrR78kg058v6E=;
        b=U3+PbvapmhTDBcoX45OKjVxVwfbMq4RwJ5ls3av3kR2LYDDuRPpKkPfRiSXwGPQu/1
         ovtoPlKjawqVQFlGrLudGToonZ1wVFlWJnNEqXe+6B70kxcjJLmfLsDd1Z2XBitg6JDR
         7HcE/rWyW18bjprbs7CxFdvqWGYQrQzlXiZ7kAXISbF1pFDRj2xiDwrhsp41UD7ZrA/+
         2VAPNwvUV4daIADd48kYIcwfjhQjHdZ816R4oBsAc3uIjez9/Zy0xNW6Ex+M+pLkL2TZ
         56K6PyQPUpSbbcpv7qsiMJtOVLdkm1EB+Lo8UQcuBdmsqMfzB5N4QlxdAA++ZS0SyWuq
         LX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412854; x=1786017654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jmAa6MnovSt1rWApG8LJQ3gczw+AVJrR78kg058v6E=;
        b=Lxa/gkcd8nw60VK5SHybRc5J+qESowkQq3VVpEqjVQPHJpXpBlMT2HcornBjL59ohl
         oFxo4AboRjdLBRjkbc0pWCc4BjMfEmXLM1d9GZQtk9vOD2QFP1qDmV5poL6+C/BioBvF
         erKflCRQCED8dNblr8C5KVGw2Tlulu4P3V1DmpxStDEfr57JIuIJ0xi4FZPYA6ie/D14
         RiFvoqBX2SnnYdXPC46XPCJVNeHG5opjG4ghDM75ePJOahtNx8VkU1pgsX2zWp8rJcOC
         HYFAWo5mDsm21C9u+W6qTx1pnclugnV05DXdRUUkXXCoXRlRu3mkisvaPM2kJK6oZzfm
         JqDQ==
X-Gm-Message-State: AOJu0YyHS5caeK/8oNCEJYbY/VPyrJcu4yMXNFPiPLJGrO6QaBXPXo6v
	IMX1bBXYIUWahkW2+gkqPYME9S9N2IdW4qoLfkChh2MZ80eySz/sja7GvQMexZLc4ny+RXiMNsd
	hdj5bnelbR5iPZN30PW3KwK9s+HjQf+eGlHDQIGvvFFWjgxbW9/BZLLpdmFn6HCV8YKxi
X-Gm-Gg: AR+sD13J2EoG1BSk1NULOLOp8CP2gxmEKf4LjPbLB51hWKZl91MYvZUYzzjnAj9jr0U
	ie0Wp5xlqEn4G8SVEtbnV73YE3L/1R/+diVvRVqG2IsGrzoSMGCtnNcflaZkbSVxbccpiaYRd2k
	aGFqeb3Vv1SzYar/Jaekat2MvtgOKjh+DvnvMVfpbV3i1Rf4/YtqZcJAfSH0qf9ICEmz1fuYxim
	QGeAKP7oEsnrB3/7cq4WVHxNeE7L/Px+BSwfiAvVgHAKcwry/DU+4wyzvSrX0n72I8tkjMsRHBR
	+iwtSPbYcyriMT723f3HpqmLrZwpU7z60Q2wjD3mGENooTRiLlVRzaPmgk+SzoXCc/fvBTPJfvt
	p/7AnsO1V92q5ohHZ+CQyFYOvkcBUvBO9LjU=
X-Received: by 2002:a17:90a:dfcf:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-38f9bda5a9cmr1929396a91.7.1785412852677;
        Thu, 30 Jul 2026 05:00:52 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcf:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-38f9bda5a9cmr1929360a91.7.1785412852085;
        Thu, 30 Jul 2026 05:00:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13f9a041e36sm7822776c88.7.2026.07.30.05.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 05:00:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 17:30:17 +0530
Subject: [PATCH v7 2/3] arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E
 key connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-eliza_evk-v7-2-7ac7b66a3e6d@oss.qualcomm.com>
References: <20260730-eliza_evk-v7-0-7ac7b66a3e6d@oss.qualcomm.com>
In-Reply-To: <20260730-eliza_evk-v7-0-7ac7b66a3e6d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785412836; l=3456;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Tsc7wQDPxpMuA7PiwhLxACoaqtU/viagHz+PtFrel10=;
 b=q+5IE4q9UIMGP4y4lcHq3YE0+Be6IHm6AS6m7QLqFaNalNkrmN1QZMULGAKD7fwv1A+shi+bG
 fBH5DHaBbuzDDqfB+a40PMrl7GqvXSKGUQZe7Ne2DskxPdFKTIzPnC8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: RO5FjJfmMTwY-4lg_E-qHOP-f4APx6hy
X-Authority-Analysis: v=2.4 cv=JeWMa0KV c=1 sm=1 tr=0 ts=6a6b3cf6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: RO5FjJfmMTwY-4lg_E-qHOP-f4APx6hy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX0+Z6O/LQMSMQ
 fdiWxih72uUki5qZsKyy/jhSr6/bIhCwMtZlu2/syiChUFKAuMbesdkS9v1Pd7zuV/uM5iTha0Q
 IDb+um8sTVITYHHzxaESYtCaHIEH25k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX/KFLwqSBLzl7
 dJPbx83Zap8t09h4GOVkvl1iNzXyhj//MmLIZY2fUl708pd3ZEMqQPD30sbdNqG6/Sz7x6Nobnm
 joP4XZCt2Gfqvy7khdAEoWzF2gwC3Ew8K/avnjRm2dC6BNKQ1gopASEym477hzyXy0aUNx+uPXo
 u64LVcqp0IQfMl3nXMgRUnGlEQSy2lRhkOe19DYM4oB5T35XWlenPPL0en0a4o5vIbh5l8J9GeF
 ko1dgxDDFKvMg+YoBakKaAELwEdxvnsrALFMll3J9m33hMj2kvoDlF5CKCPX5s5RrxrVAIx77+q
 F+Rque+rGfhgr9FvtvtvI4MoqS4pgaHtOjvCAcRsiYVpSgCJd+yYjQEqZXKLfqbRW4ezGqj0HbL
 XOkxu4FIhtjcOZ6j7fYia3xi5fw6cacNo0ywnGfPx+chpQZvYV6b4+ldTUj1OT3WDetTd9NTXdi
 b78peNumGd4FrmDOJgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300090

The Eliza EVK board features an M.2 E key connector connected to PCIe0.
Enable the PCIe0 root port and its QMP PHY with the necessary RPMH
regulator supplies. The M.2 slot's 3.3V supply rail is GPIO-controlled
via a TCA9538 I/O expander on I2C4.

The M.2 E key slot hosts a WLAN card connected over PCIe and a Bluetooth
device connected over UART. Model the connector using the
pcie-m2-e-connector binding, wiring the PCIe root port and UART5 for
the respective interfaces.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 116 ++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index e47b24f8b827..b35fffb50976 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -11,6 +11,92 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vreg_pcie_m_3p3: regulator-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio_expander1 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	connector-0 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
+		w-disable1-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pm8550vs_g_gpios 4 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&m2_w_disable1>, <&m2_w_disable2>;
+		pinctrl-names = "default";
+
+		ports {
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
+					remote-endpoint = <&pcieport0_ep>;
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
+					remote-endpoint = <&uart5_ep>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	pinctrl-0 = <&qup_i2c4_data_clk>;
+	pinctrl-names = "default";
+
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	gpio_expander1: gpio@3c {
+		compatible = "ti,tca9538";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x3c>;
+	};
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1k>;
+	vdda-pll-supply = <&vreg_l3k>;
+
+	status = "okay";
+};
+
+&pcie0_port0 {
+	wake-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &uart13 {
@@ -18,3 +104,33 @@ &uart13 {
 
 	status = "okay";
 };
+
+&uart5 {
+	status = "okay";
+
+	port {
+		uart5_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&pm8550vs_g_gpios {
+	m2_w_disable2: m2-w-disable2-state {
+		pins = "gpio4";
+		function = "normal";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <2>;
+	};
+};
+
+&tlmm {
+	m2_w_disable1: m2-w-disable1-state {
+		pins = "gpio35";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};

-- 
2.34.1

