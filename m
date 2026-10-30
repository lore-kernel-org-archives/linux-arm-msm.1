Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353239;
	b=wX4ybMoLzBwKztuMEg4+3MJl14XseIuCbxY+MCmU9CmKczUutQF69OPuZmd84sBW4kZc
	 ioEXH7qXUVYHKW50WT45ETeSoEUyeI3oi1L/QYK1CuO2cka7fvXPS3ohPaF+GaQrBsOWv
	 A1vR1bfwMZvnyyR64knWjkeZx2Ib3YORkJ70cf3FXfJI328ALx3ANezdT6jTUi5gnR8N7
	 yy32QyuYgtFyWYe36kE5NdSk+S9c/DQfMlw+tOAVaUjfAuzV+lj41ay9w9oTEMz4aVXqt
	 wG8yD7BVZj3O5W0a2qBgbXlFYn9a9AEO/IIRLSsX1BQbxuKDubSfXypHFn8zRERY5Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
	b=Qsgnw+3YrooZDth3NjHxoB47rzUUp28baLQfKU7wZXQbuR7ektyhu757ROYYM5WHRvav
	 2si4HhUTuXSgcdaO1J4gBrCClorEalHecgWq+N5PySIS3GXmVEwz5/WWyGvkdip9a/nCB
	 gGjeBT/oGkQz88bvxQGiHHFqy80Ash3zpMvIDbw1/h/vHqj4b7M2p+bWHdaT5ADewUqOr
	 oINZ7VNnTESDWyyJn1ZBn24dP+XFw1JEI7Z3VZssVCJwCXABESKz9SoJugN/rnuYV0oF0
	 Y0toEHz7J6DhYD+3TiClRboPaj059xMl/7+5a/83zgSz6aoaVhAeJc7GBzJpT4bvb7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JgCi4c+l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMCl8I0m;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F052C606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F052C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JgCi4c+l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMCl8I0m
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8EuEi3737760
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=; b=JgCi4c+lCujG10/2
	/wblWEv7Hpb9yxZohCorfY68XaIr+Sj1bFbHb2tBFrY4LQSLN+DdSJO79aXubwTR
	GJGlCJvfTzhqLStBtGGUEZ2TXqzsKHV5LXqZDu8NSsoVY/Jai7w1v1IibTHPvrdD
	nYrQysBaPlyS5Ai26ggYqZzRn3nW44P2kMN40l7oS2VxuMJIGrRb7OmER09rVUzE
	uzLZFsNAIbFOlxvWqE2RvUYm/deAJ6/aWE/WrsfdI8WPiZ/DznwM+hP0QkUUpRHS
	w7UEcvkTOvWYVTaDcVX7dLwOt3wu22YBai4486FWa5LTGJOfHZR5HRpRKSWlpolo
	kWqAug==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75277r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so1774141c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353237; x=1793958037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=ZMCl8I0mp/JTrtZyAahbXt3jXjgHAodbpo3bBN1v51xERKgF2yx4xFLsY59caX2bvw
         yssLIuJOWHuIdaA4LcpgvDNZEdGKoWjYIy2GgmR7uZfh88gDh7UPixskxrPo4ZIUWbso
         lHNODDakEj/JR5T3H6w/VPNsFO17feLUrY0fNMdBvE2zbtsTrAwoAXVQ9yZKgHDLucBf
         nXg7OCH6SB+HldBLtvT6j1ShkwrQP/4cjVqw8YuOaFxZmMthCfrka4FDXPGfIRHELF7u
         qahWgnxLgWSYltKfDVJO/EjSTdnbdWL+Hy5Av/7pJArf33hnXGBxJoCClPwhIj4Q8rIr
         wquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353237; x=1793958037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=iqwaoIFuyIKSE7ZIKh/gE5F4xHg7lAeU1G3YfVXjfLJE9aI+Atb19ZkbkRN1if65ju
         oaNlsM+lCraFMBNF4CkhrG8lZbeDf0L8qn0XM6FMkgkZkN60XFgRg2h0EBlISNvtxX84
         VuuKmDp2achahaIhYz5qqgAp5gGKN3lsUAehsdSsdSSNK3Uq7kMQbB310rLwA+enJcIp
         ArIAkoaqj+MqixIvgse271oD9vFNnX6tmn59xLhjvU0tff8PT0nGXQ8oBYYdMcq3VMkf
         OHPfRWD8Kqf+zPorwtzsOYEPV5EEkaAwwtygUnvMu98D6NfAMu+KG/sDPWViMXHDq55F
         d0sQ==
X-Gm-Message-State: AFq9FYIecJGCot3RriXHhCMpdyzpOH86+zXfpdiSbXNwmNiU8PpG66ZE
	bnZ4qV5fZJto1BwB7DgHaAvYe4zjpta8Yige1lpRP2RSegtn3rtSZVnUb46TwVPCNmGqRkZzVy7
	3OshIL7/PKC+IVVaz3ajIHw/OLNcmJ+Wk5Khzs/5qd2AHC4UVn8Sqw80TockibpUA6tTN
X-Gm-Gg: AYBFou0BwS0D8qY1+E8pWMc55TwlPRYwg0+O4v069aIlufAhhGhx00KiF2iyOvTnPQg
	6PV32tOfLHOmkxn4YBiJ/vTO6h/NCg0CEZ4NSrtNXEXDmsLR3JyI5Fus+LUGVlM3l8glqytSfEU
	CkA9vqS15tmW9Mh26uwR+8TfKfouJdDrvHcEqFTPW4kZEdQYViS318opMEI2biFYVjq59HAyf2p
	NYzocOTo/BuFyXzVdK+zF+g5GLtqDON1lB7K1vfTi8iAVXffxhY3tpxi2fngcVFigTc0yer4X8t
	1dd7fFiJh05rA7Q24KaqiOC/z9M6OQJuxds4giwNyV7tt9aNopkCAwNG1W1Gx2y6n/iLyBvokCQ
	wmwUYNJign1SrU2k+yixX9S+9CWSdN3xMLVW4GGLTI16fpd+DFtiucb0WDGeNYweK1xsg36uawc
	MCBANs
X-Received: by 2002:a05:7022:1181:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1ac5bbb4870mr2248822c88.8.1793353236497;
        Fri, 30 Oct 2026 02:40:36 -0700 (PDT)
X-Received: by 2002:a05:7022:1181:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1ac5bbb4870mr2248785c88.8.1793353235780;
        Fri, 30 Oct 2026 02:40:35 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:35 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:08 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
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
Message-Id: <20261030-lyra-display-upstream-post-v2-4-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3607;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ep0DWydVmKj6o+MB54eb4vl9AakC4YjRhLn758mEY0w=;
 b=wYTMEsgUVYO0whhO2gojRLKPeuIrfFxFXHSVh20w30m9pH52rzlRdjc7korVVTHAdaNMpAonk
 55mKCoygj7CDuxvIdmAw7kxTfwVShzIEMmwQG0AKVnURR9zzKoNQrWE
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: S9wvhtctzKQYu-59kDyZTk6wOVtWaq6J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXwsHJ6PJJboSY
 jjcZ3cO15fU9b6JhBLT5CSUpwJwczcHgwjt645S6CK+qYBVY8kjgc1pFv3rbnX5ROlIBSussQGO
 W47oEJoJmMZQHYcxlIEBH7VtuUHwq7qtXm+0BUrYu4dknrCmgMSJVV22p7YLvUagZXNuuX5lIP3
 x+M6XYJICrolGzbQrl6mDLJHg/vNfMGY+taSobp3S5UHxe/lbFpW64/tEE/UneTijivL3GRk1Hf
 bjhldqCZFE6s4X9DWRc57Ci67sr/BQ+Rhi0i2HQHx+M0u7y5JDqYC8nyaN8pH8DfgQk/fPSfVX9
 gn4xFgcI4u5qwTYhA4MDPynb03MhN5uhB+HKw9tsQAIz9Xe9OIKi8nBbFHMpy1AUkKb0lEg4sNA
 tegN0LGsGsFhvuUA94xYFM/qVY3ThXXDXblthHUd5KW9+ybLw8r/W154Q5GXkL1TJeTDdHcgpmX
 RamP03JrKiQvMhHltHQ==
X-Proofpoint-ORIG-GUID: S9wvhtctzKQYu-59kDyZTk6wOVtWaq6J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX21LcGKfYDyB/
 B/D23J0O3Srg6sIVdyaHiCCEh5UQgmL8apf3IDdZa59fTNwXalUR44Ii7GERPPuXUSdNjt04rCP
 CTb3iYwwKqSaRNzTPkTeLcH/n3jQxjA=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae46615 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON, for enabling this 22pin connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   | 75 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 298054f47046..b6a61339914d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -485,6 +485,11 @@ talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
         talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+
+talos-lyra-evk-waveshare-dsi-8inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..e9a8fdf0c179
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+};

-- 
2.55.0

