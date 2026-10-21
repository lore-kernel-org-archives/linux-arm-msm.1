Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595884;
	b=mPhYIyotpT9NcjQ+5ie3nFqr5prXQbKjZrQ09J9RTOvdLHxp+L20GGvWvSkI27dmkFC2
	 Jfn7MVdozYGZQwk/JABl6gNVptd38aOf3DzmRUFYG0xtmWItjda48lxi0OQ137G7x4Yqz
	 KVjZHV8cuRWsbBjrGUTE/vU4Yng2QBsOIwAQOjy3K0UsO3BeCf2FZK5U1B2ry/eURxhpg
	 TScaJB3TMdzibN1d1PhuY+wnFAaSZIdSY5zTDVXBxbJRuqFHZ/+yhWHr5FvlF+p+QpOU4
	 Dpm+6pUcM8wzEzT8aC/dGvf7DYYLfvoPUtILRifHGS8Je4SAhNv24FuObhlVnzg3xFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
	b=Wf/AoCsEkSsviE7x6o29kE1OrBYAX498fl5JtmVj+plUb+7OmPFx/ES9diXQ3YlDGzay
	 x8rG4G+iWceWhlV/JgvrkfW8YgLn65Zw2QhVPYw/WZey+Ahs+b/fQulDzPS6eu4YJDHXR
	 ngSbB2DJe1x7cPDgVhncKJX4qVvintumDmZPoA7Pqx3M1nVdNsobZv/DM8YSFxWjOASrW
	 z6Ibmd0xWM85kFrPVRVz5hHtJJNwrlUANpbhUDauw27t34hFioswbjFZpCFb0USbYEjUl
	 lNqAPJhLe0Cq7XfRi7zrC6yynkIILKyfTcCu7pjLuPQR8Ta7ZLNj3iWxtc6WkezyqGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O/M3bgE4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CVq3rnNM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B0B60A2611
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B0B60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O/M3bgE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CVq3rnNM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFDuG1313695
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=; b=O/M3bgE47wpEgGvI
	b0k8gpmn4QLzEYy6YxCiUpGQz1ISMbSDy4sDGC9LWywIOHbvqSXqjw7N0XiobhTg
	P8zT1eb40VB6q0EJdjoVbRhQA0LC6WSlBzoNVb0b2pQienaNB+p9lNl++7I/i+9P
	62b5/vrS6SBGJybeyZ1P0+LGqxfzOrGsorpIP9lfZs0S1+z8+PIOcasEJVY6OT22
	F0WhUcMQEble0QQKA7u5pmvmVhn2vDzS/1Seg2C/+1gLe9DXGFV96a4NlKVQNxPr
	YxIqhddav16qZhXleYBjClaQ8S8zz+Ezgm4IZhBVKlUjCXzVClEa4j/g4l3HwlS5
	OJD/RQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03vn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:18:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso2332704eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595879; x=1793200679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
        b=CVq3rnNMzNMVFYcN5zsqfNr885urTnbBxL2sTvfyYTa5X5vmv6YPLUUYuwuTBF8nme
         zOuvlhTUmyfaK4aKS3S89xeUDVgcGgvBcB9wzf18+Ng4vR6aMehoVfSNpzhOHBjPyCCR
         wy60RE+QfPVMjqY5fHJbsu4IJJTe0dmU5qZKd1CPdRsxwCH52akVwfL+O5KGs1kY6R+Y
         L5xK72obvxHdfy6/rUzj0jpq8oPf/rS0QPnlH6FfLsIZqn2kGOIEg/fidgsxmtvPB2Ti
         IeNQsbwFlBA+ZaID/FcJrh+4+n6h0YpnVF81i4vhlYu60J7p0d9+NyaXQ59uTHVgJK/E
         qxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595879; x=1793200679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iN0RbpfLopjjwmy4y53t40HHiRST5oNV3u0vMBP1TbM=;
        b=1fBS20bgJzMedjB7HMgVBi4SJPPaPfDGa6th4Z0FlmlRzBnClRjoJq3yz5PZbqnqdz
         MNARL/5OVnxLFI1+JAiUtXDS9BhBCzZGUi7sdnuxX3DDQZ9Qb489IF8lpgV9d1sv4Q/T
         cUbKEMU53JCIXAcuBcL4ksagqlnS7jbOacdl/sPsDt10AUfjlXFeaAZH/H7pp5GICy5t
         k26dDfkT3ZLYGFidLaRPBpC9S+1IBm+QsTAAPMUu6nnC62rpSVfMMsxUjEia6h1jMWSa
         U2kCN/lMuHEkidu272WpHquynkr9fNFq9Q1Cu3nnhWRhVN5nVpaBbGA7/bfs4uTotVGU
         xZDA==
X-Gm-Message-State: AFq9FYJeurLrYedW5WSlJMzN4jssF+8IyUSpU1JUIGNS2FPgwq3X24T2
	5dvkh4c4J1JwIfj80Zoho74RinDZUcTrZchjf3WLPRd3pet1MrD++h6QLzpTWTEVVbYhgZdcyBu
	quyOlCe/Af8Ci63OJceP9UydapAKVRyRMbTTUaQvWz5Iq51aLYmErjNINgWFAZVt0b8Po
X-Gm-Gg: AYBFou3vesgYY9wCiT8ICg2O+kzyumpBP4B1+chxbiBn4GRVUKQhykbN1/E8MGRr39u
	y1iK+Y2VQYSr5Zxa2J5TX5MwejUAxiMcnOjOOLXwjDgMBeBo4JS8mNXDJy4cSQ9LQi82Dej21KY
	gr/nhYiCNNvYSd28brPbDQY2YCKOVujyLzSW3JEZq0ZXkFpkX6FIS77Sj8EAm7dWE2jILSlXv+g
	ajpQuCunBhRiQqb6raoYTGvfAfz1ZlStQGVvrWBEU+hq0CwR4uxopRv/E5UBCJh+nVqqTWSW5py
	XhEihoAyGmzJCcYVMPy0joZ0SDJhtcpYGiamAvfCXqMxMHN1XEN4nXMJPVQMWYR1wjT9ZGXOm5G
	Q0TKfa8duV/Kw7k6l3QSgPggbUaV9gtnz
X-Received: by 2002:a05:7300:2552:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-3674f215a14mr3926435eec.23.1792595879191;
        Wed, 21 Oct 2026 08:17:59 -0700 (PDT)
X-Received: by 2002:a05:7300:2552:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-3674f215a14mr3926392eec.23.1792595878378;
        Wed, 21 Oct 2026 08:17:58 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:58 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:28 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch
 DSI panel overlay
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
Message-Id: <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
        venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3546;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=Uyeo1BIG7EK9froOsnvpJ61uq9tkb4cEvrpBTfRl3vg=;
 b=ltnv/UqKW7UUOPAU4GsTjxkHxne/i9paXx5gRdSfiIe92c3PzYA3HytEtQwgiY/dUBC8it1SN
 I+mzUGh+3+tCDraiCHf1epXL2mLfZOMmi4kbMHFL2cXGgWEdf9b67qy
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8d7aa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX3hae5uPIlGDt
 HrZvFyzq0yuxAwjq9WGVHV16pdyWJ+o5NWSrSdupSb3WcI8aI4qAf5zA8AzJKjdYlCKUVBdo3Wi
 wxy2UlxrFd0kUmWzOcT18B4vlauxw3GBxsEXVS9exBoQvHSXyUVghboOazSKFWFyVH158dwlIfB
 5/ChQEj+srNzfVRiTzCcQWIIyuNDwFEe6bXmIyu9k8nN9+iSOKuudo5RjMXt6PoqpQwZgGVdux7
 PhCQpiohHubfKWSqGt4HFNrzzlicKDch46LnhE6TawcCk337B+IgiUuWYAM0UorJltapFFWmKhN
 jLLPtCCF4Dulp48lbtdSlJzB2xMunosViPcplU8ZHrI6u7ThAUNF4m/jPm0gwcR8xSmkP6rsJfn
 PmQ4U4ER3fIHh+EJ8Aul9QJl7OxcHgXEM4AMnhNjo5WoR/rurXZu5YdwavFoxu/a5cUJH+ACTcX
 DJTM2DT9Exueav0zodg==
X-Proofpoint-ORIG-GUID: b7hB6TunCtxK6p5ceFN6m7_aw0MROmyH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXy/xCW+TWICHY
 hrlJyuse+bkWQ3srzfREApG/cF718UUjM9deIJnc2WzXSMH8b4tWBO7xydZC9wiho6qLEHSezl3
 3bg9aL7fQywuQEai2Cf0PfgwdJ9fkag=
X-Proofpoint-GUID: b7hB6TunCtxK6p5ceFN6m7_aw0MROmyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

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
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   | 75 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a2a2ffbbce3a..614152913cbb 100644
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

