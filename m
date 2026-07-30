Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0263A544A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785386962; cv=none; b=LXxnRHVnitinC6f3GCtO1O8UaqiJOUXGm2pRXbSoGVWrJXtwMAnsJUUrjS2yeDcVggakX6uVcdu7ylPofpyGZa+3GeYihS7VNhZXlztdXu/drqEd8VJm9iuAOMiHBKhUKhCbSVXge5J6pelJHCVpRi6eBl+Gosi9QBGMrylc5bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785386962; c=relaxed/simple;
	bh=Tsc7wQDPxpMuA7PiwhLxACoaqtU/viagHz+PtFrel10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkxYdbisIBPM7XwBiQsdGibVH7MvOF32wkCKjgBdEku0lLdBzrQbDRia/GxYJ3rI3ZyNuE6Jlkdx0XH5i/JiD91AcoPfUnt1WEQ1O2V2oxBfy4RvrpQs9hOsiL93CRP6Ti0kE7LTqjVxuxjOXmCsPvmDWW388zm9PFO8Jw3BD5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNVBgVx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2OkKIOL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNVBgVx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2OkKIOL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U4Zjm03459306
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3jmAa6MnovSt1rWApG8LJQ3gczw+AVJrR78kg058v6E=; b=KNVBgVx7z1UgjZSJ
	MClQK2QkKxdqet6+TKK5F2ZyQ5m1aOe1sA3cvwSBzgUcTdfDoAIIHFe48HlitzAT
	n74uAYJ7YqUWnOhTazua+9+oR3rPX3s1Csme6FNASKiZhzW5hq+xIF0ScRMZzuPp
	5tAubRvvq+XefIbA+6AZ3U0lSDSkVeWb70FelOgavwG5UidnY5r2+xekcsMQ4ZqK
	baoHJdceW7BLvNLTv2NEvRyiq1Ml7EGwsOR+GaB6uKMw8eAXr6AF6SNipgRmKZjc
	fjIv6ZuDGBnRp437LAjfJ4dlcRYog8XRudznGsoQhVWFWFwXlWHTVQdM04KnQoza
	ZMJtqg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqyqn81jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:49:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso2648719a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785386959; x=1785991759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jmAa6MnovSt1rWApG8LJQ3gczw+AVJrR78kg058v6E=;
        b=Z2OkKIOLvj/muHaxNDuvvV4yT1uwY1R5s9IFnS8YAXQiTKCQApANOj+Jld8vI6QRi7
         pJtDYAbshQfdr4JbFCYIb96dkSILiCbNpYmCMrHyljQij5uFbczOmp1N1uxgDPqZ2qCq
         AtoAWBUVh6a0VlpxOOh3q0jMu3pwen2EEMXPucQnXQ0atWkj4aVf637INI51aMaYjJeL
         6GPclw/G0vdwsKb/b/vKBVd3HJMsPx1iR594PBbJD/ThdvcTJjDlJAYUdg+ur/3M+jdA
         KK15ElRfyVmhJUaw1Okp6Alzf0oGb3q95AHSuJ7cFd+vshyBx+E7V46+DTljd10uK4oo
         n2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785386959; x=1785991759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jmAa6MnovSt1rWApG8LJQ3gczw+AVJrR78kg058v6E=;
        b=l5p7ZVwrFjLw+vmfJkDSKh8bkB+Ejdo0A/EUdMCDms+CK/e4Ecj5u7nDM++iQhMXeq
         Fr5Nbr7+Vr2dF1b5nFiYWUZChkFaNYOUXJFrDVp7SdnR+s0/gssR5d8HMQ0ouo+RLuEd
         PW2N4UKQ15PkqsAqrXYxshldBjwl+aABokyfaguc9tAQizSo5McULxAD/6IKe1dEz/zD
         LSeQ7+dx15oBHwBRctHz87KVfJE8V29wtpJEqCR7bKtaAAeRzjaqAa0tuhST+t11RfiN
         1JmjiP+8Nx6TZoMVzzvi/VYWiNg8a/aL5d4Cih2YfoheTNrae1tlaJ10cb2gCiSsbMbV
         S4Dg==
X-Gm-Message-State: AOJu0Yw7iZcNZi2vS4ZgA5p+IvxQDlgBo/4RT6gJzuLxkQ6ZDDd3Wh8m
	kIxX4Q23RIBb7kmDUfLW3Eeh346fiZC3EV5slTBjpvCZ1971ofit/C9wMX/aqxnrxdU5yqd8rT5
	iAbJuhhl8tboAdJgdIWSYPAGdTIQ1hDG15jHHqlIKFRCGOHLhvbOIA1f6eqeFPbEfTByg
X-Gm-Gg: AR+sD10m77NmUMJirT7VPyy6YV/P0YVM+Ch4oZkd6cLmCMLHcsdJ787GcTVyj8Wo7Ba
	Q80/YrdSAsxXQ9i3kB0toXrKoHbdVzP66eOTRu8yTKtFsDy7yl9wX4T4IZgcQnOPRdzfESED/kV
	jsY9QdiLd1Uu4u1LQ51nuiCWrl6FIrf5I0oGo2BO6q15qSXMelkhH9ZofUmy93uxhAmJtWhfw0G
	vRAqXHXI9fez/XLpVUgmib5kydRm71Y2tiwxl5ax0QRMyO6/DlBo5XJGzfhJH/5qeTTiM8NrClv
	54C4Yb3T5yy7MJMGitFPw4gzmbWkapM4LkWzwJzRDFN3oRujBFpTYXdqSnVxQxPWuSYivvskrAN
	VSB6/9aa1rAM80e5AnavvN/wnNgxx/jilXWk=
X-Received: by 2002:a05:6a20:a11b:b0:3c0:f772:8128 with SMTP id adf61e73a8af0-3c90068c738mr889632637.54.1785386959334;
        Wed, 29 Jul 2026 21:49:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11b:b0:3c0:f772:8128 with SMTP id adf61e73a8af0-3c90068c738mr889602637.54.1785386958856;
        Wed, 29 Jul 2026 21:49:18 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm17740241eec.14.2026.07.29.21.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 21:49:18 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 10:18:54 +0530
Subject: [PATCH v6 2/3] arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E
 key connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-eliza_evk-v6-2-40ece2d33114@oss.qualcomm.com>
References: <20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com>
In-Reply-To: <20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785386943; l=3456;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Tsc7wQDPxpMuA7PiwhLxACoaqtU/viagHz+PtFrel10=;
 b=zKAohWugXtLyKvrdvfCZt4x0BXQ3kZH8+OMti2Z41DiBhwtj76yj/RSLw7a4DqJr+R3cy/K3N
 3T/ed99+tTxC1jKFVfoQ/U7WxzsvmM+Gc08feH0NQpZuQ8TZb0zBwLk
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAyOSBTYWx0ZWRfX6/JSY1JiQW3e
 C2+2cTUorqN6wReBJyYi4ur9J8UB4XQ2lEnvNFjDfhiUaWwRhTZV8zfP+9ob/t5Trmcv3lAAGAY
 Qvnvyz8S+GNZ6oIgcVE/1lRYostoUzs=
X-Proofpoint-ORIG-GUID: gOgT7uXcJJUAX-5U6_2Ki-UdsYw1bPpo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAyOSBTYWx0ZWRfXy/33QWb8erHS
 gtKxXWE3GISq3KowrdJ26GWF2Kr/9H8TyWZEpOiWVqFoBpCCzloa8i8y2o8IJYUM2N0RLhr0Y71
 mU+HDNJ+PNwNagbn/25GJNoZPg0LLo3XNQYZJ4mWfY6vF042bqb7EJB+zOLVZ20q8LC22iEde7d
 j26vHxNKJ32T+X2RXPGP7TsJVoLotk/8HT1mmKTJ3HTluC6ReaLUq62BJzW+cFKC7E1eQFNGVMB
 SKw4nTmgmemnKxlc846uWnqf5HrurcAYdf3fOy6gi33NjGM67c8s9e0x9Ug9CQXcP9/RQ2N0CF7
 J+xiQsdj1Mr1B3oZRywNfPW4Q7Rmf20u1jbkntVwpLQEHl1o3QKuZ94CXCUazvw4NvhBsNSTFRW
 vNmZHwq85k33n1y6ykUGP7fAztQblH4aYl6ewvkojkzXWaHSNzOCoBdNCutnlEVZfn/76SDvH9p
 uUuXCMYFiHwmnT4j/Bg==
X-Proofpoint-GUID: gOgT7uXcJJUAX-5U6_2Ki-UdsYw1bPpo
X-Authority-Analysis: v=2.4 cv=QdRWeMbv c=1 sm=1 tr=0 ts=6a6ad7d0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300029

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

