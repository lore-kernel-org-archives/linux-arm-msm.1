Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353228;
	b=F5N4FlO8kHa6O8zykOgjupE7ydhhim8b6zbIGtSFDmNQ3AWcAIsLkSgmi7JFAVSSh0Pb
	 41WYkwJeaY3BVZmy3P96LgsrOPF9/FrzCNMscTZo5aQHJ8/E/YyEop0O3Y/5E2y6lfarn
	 dPX1gxVbQAxvKE7JhZqefxhli9k2r7yNzEV2bJoDvDCFEV/zVjh3WDN1qVZ/ePb2Tny2K
	 oEPzNbwIBGwxhRG4Vh+sCMInlFbmpJy18TVCIQJsWYkooAGUnBEHIooJnC73DWg/vOPHi
	 abCfGnkfZJWQI17daODBUVjleLeGu9cmJH/QJceD7SJIeHhAxRLON+lZgM1LhAy6RGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
	b=T62ENJYrHOpMldxi0vno8K32x97P7KJVfP/eRSGhvuAAY6MJRzCXwF5StTr7H3YM41SZ
	 ciuzJB2dD/CydyUeRYG4zMStlXdYMpivHsh1M63oHYYy48SCtghmJWTDXAwaqjnTJYuIF
	 CqavjhpXubmfOhhXcyoRZuRJ8hJQ0hSuB+p+1hb76FzUBtYatPbjIAsxt3Qbwz2M6x42O
	 OLxmUvWF6weup8b0pjcn6XlyTzLCk3M+UO41hlGG7sqIf6L6PQNLSGSuEZT9gZCaKnDmO
	 HjXtIe9JV1wt1F8bx69Y41Aej9GHPSei02Ma/89S98yqTMdjfDhkvbX4IMTSL98J4Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DfhG12Vg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g/j4nLmA";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCF606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCCF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DfhG12Vg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g/j4nLmA
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F6101762025
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=; b=DfhG12VgHhVEsYIJ
	41tDNrNdoiUIQxSLBIaz57GpLCfn0yPI2b8cMNSVC9Je5AmkJcnlV+ixwXBAzQql
	sUokMdjpSPOu/wZ1nUHXhiykoOItHkdKEnmePNcQdxlZmU9f1g1ZprUouPxBKutv
	eMgL5gTfVpn0SMkeFDgvC6BsTp96/4/HGticRqiLAuSCjPWpUmgL1xN+goYi6OZW
	MPL9z6ejlcA6I13oDJj/tH/dzfY1Djn+sw8R2tV99C/R75eRtfaylsQd4LLGGL3v
	JK19eyUcxgh4WqrM4Rm5k36qBFIQJTTVabM2kth9xDL0yOfeSCHoazhlnHTsAGqI
	0PJAfQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pa7yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1430405eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353226; x=1793958026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
        b=g/j4nLmAN2IqKlxYk5U1TIu5LnmA0ssOkOiH4/EajCOYIgO3k82oejqwrN8EOYZ3Ri
         vadVjQNQwrUP8lJjdSrJxVd8WxCFaqeYB9dwztUNTeZKNY5hat+zTVwygVz3vtcJMsz8
         24t9JjdahxMJFqKN1rhOx8HJaghEFTfFz0ixl/H5AL+aE7O9Dv4snCKzC1XfPpTO41+Y
         Nucs8CAkk+YSl3Onw8KVHks/al/OdmsqRtaO09UZtGOu59vjr/3nZ871cXwVc8W7VyVn
         X9bTBpmSi6vguugV+5P0vJf0agkktZNSWa/dOEOt68GkN2Hgq6RfAdBnd0LumMiz92YA
         k6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353226; x=1793958026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
        b=qmp+PBTqzGr16grpVuKoNh4Lv1JZClcAMq+p8Qq9+2WN48OChxkeCWkyRIZkd3JlOV
         pf2A6TQnqE8mW9bxYqpWPrLAQ9iheQlc/elY4FqS8xsA4jXUKe4IAqS9pjFgUVlVwyl3
         a79j09mNTjwKsDubZnkOHObCckAS8Q0g+nZjEH9LrT1ZQMWLpUYukaTxWuZ25VNePKce
         pT6jDPQhPeYD5M78ZQv9F96xPTZGNf6LzchcpTUiv6xaOmxTZaSmCg34aFtP1pPkUUKI
         0b9DraQ21QRRsKh6TEyD5TO8g6wJ09HTPdzIdvTtZGYNd+TRQzdEgDHiE4BoRIXuZUNY
         i0uw==
X-Gm-Message-State: AFq9FYIIpHCliNgDNrCPUyTvC+tm912RtiMKAbWmenlyIh1Re2lliRum
	LjC8IPXRZcpyjqUhPqGdDMsXzYLttEy+QWU7cjUh38hHeMH97dJrcPQMTCspPlQ4i4YmX8WIxcX
	PPSkTJaZ3OuUAe3i4ntFz3pAYnWOhI2z9KVU8xCpXHglA1CMmXFbxkDlXDSJVyeybEVn2
X-Gm-Gg: AYBFou1dJ4uqN2Yt6JRIwDp+aT2ddHQLqmlo070F9X6o+JhIznDhTIvpr8JvRvS75J+
	JzdOAUtB1mkn6+CDgsW9yGbQRPJuU5z95UED6mVDab0hZpLdkD98AoUslohtBpjvMd/j4/wHSbT
	4trj4sez5fNOqMg7gBHQlRdmymsUkQ7dztkL8gRrG4s/Xzxnluu/mVQS5vtJaZiikTMrjMJeN2t
	9ue9Ty2WFT9U2VubzIP4USY7CIbvqFNv9N51p1Df/zRmS2s3vqPCBFzKASakG2P5MGmzCOlQY8m
	WYjNIetubXidaPESlBGk+bBrS8NXmuA1VEuDSePQgDwrc3PBvc2aH5tR18LqwdnWbzuJRKUcXLi
	T76Y94PtvNveUuxZXAkKQN97nrJnTigz0XpkTNT7gEIEK9S8neKxC6JvaDLDO2lrcQQuU8YmmhW
	U5SmlU
X-Received: by 2002:a05:7022:120c:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1ac609808c6mr2274863c88.47.1793353225873;
        Fri, 30 Oct 2026 02:40:25 -0700 (PDT)
X-Received: by 2002:a05:7022:120c:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1ac609808c6mr2274832c88.47.1793353225307;
        Fri, 30 Oct 2026 02:40:25 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:24 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:06 +0530
Subject: [PATCH v2 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
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
Message-Id: <20261030-lyra-display-upstream-post-v2-2-906302159392@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3295;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=SEdAsyTt418trjKLHtxucoXBRSy/JerrxkxW9XWhnj4=;
 b=IXaEY5OoYDtgULSmW+1nYXI6+wgFsyf/zw3WVKuG8m9x2DmbnTOJsZKR/yO8PR4kCVFGt35Gu
 ef1jZDhOuUGCdqDGb0F3iaKDwoxbKDI4yZvQnI9vEPN+wfEZ3kbKVl0
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXxuY8nRRvMKyZ
 k7wjFPlqHu2pMKBjrxgboqrtIopcIYNJ+Iiyc6f/ocxkGCnD2gHbZrKfwtahYbJ3XUusgA+x0rc
 3GmSbG7ZvFgwgOQYqlH0dyCE1Z1svQaIVyXEcOSu92/yEXnIvMRM4A2yzapS7QJskluoeLxSV6x
 j1Or/XF86H5uMqA7tOliQeFVlaTSiQKiG7z/+Zqsa7ceqpBRGOf0nhZt+bh7VZibcRSazLi5Tu1
 V1yuQ04yL7REN7lMvxyOHE48HC+uYKpAtdok7QgnTdrHWqCXs4+ikahaYeQBs2nkQnCKxReb9Zu
 QmfwaxUpAKTupuQlttHaAyn0u2Xvf+AvNsQhrvuqVnnNfV2u4UmQrQI604eRurOmyNJcrGYUK2q
 HZOorvVVSQvQPH4kSbIPWWqcbf7CWj6xnFNf3OU9c5ExZUVnRP5+dAuaeDtynfC32TtPFEaaHha
 OIhs7k4Idxiu5iGfoiw==
X-Proofpoint-GUID: w4eajRMgcNOiVNrJdvV2WXZlNGCe3HAh
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae4660a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mwcz9oGRgcW5ZIR5_CEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: w4eajRMgcNOiVNrJdvV2WXZlNGCe3HAh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX1uItv87G4NqB
 GM6cxEdV4d8TWRkK1yeAx/EHhD0n2qKqJIRaN2Zfwp5AOUFIclCg+GLYJ1bV5+Tm5b0CUvjAywr
 RqlODLEIoCKKCtbMJrGyvTtdlHug37w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay for Qualcomm Talos Lyra EVK, to enable DLC0697 panel
when DLC daughter card connected to DSI0_B2B on carrier card.

Configure DLC0697 reset GPIO, supplies, pinctrl states and GPIO
backlight controlled through TLMM GPIO 2.

Disable the default HDMI bridge and connector in favour of the DSI
panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      | 77 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 243231692866..709a96ece14e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -476,6 +476,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
 talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
+
+talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
new file mode 100644
index 000000000000..b79e54459725
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
@@ -0,0 +1,77 @@
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
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
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
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		vddi-supply = <&vreg_s4a>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
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
+
+&tlmm {
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio98";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.55.0

