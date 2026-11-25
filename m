Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611289;
	b=v3YBGV3znYZHwv6eKsbNrBBZ1EsHz/9qHLex06hWeze2xqPLN7oxBMekCqMVMBrEeZsr
	 +aT1yVsfuw1ipwfCwf6s2qmeKsWLhTxuwjNqcxMrwMZ63OyKmyYAI2B4DKXkBXSDtNaVw
	 kyJFgt4c3h218yhcvQspz2blTkb3Xll6OU00gZm3SLfNXHNlIlZ2cm0lyM1yeScFZGVEi
	 8mK7bRL7WC2Pw6XcmL0JOyQE3vxkGogKXSVtHL63seoc/xacfwQ1oysBjDEzSB2RAeI1g
	 7knZH+t4kAgNMYWAlKN2g9YtVTGnVIjBa2b9h40tVw+vvV00OQNbX7LqB0d9iUiIUKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611289;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=;
	b=IdRGLMtVbaE52/zCulz36Vfh4Aa1NUrEJaVCrrZ5I8/Avb8jj7kjWNrD0kz1KodX9BJt
	 Madg+jQEGN9EOdtfJb4L7ZusKeV/BOpOK/pjFzUmxJUwYsX/tb7Ct9rlwfE8VmaOPEc1Z
	 8yCGL6WERapBZRnX/ps5VFkJAUxEOXi1f8pRaaFTBpJoOrgq+5ernbKDgTxqUlixQsrkR
	 6IyafC85ILxAZd1cBauBjsLorYLbwwRUb3LpIAj0pjfUilwSMGk7YnBUDyWh+heT39O6G
	 dc1EWMpDx6GdscuL03jdb57NgoeUunZYwBqAOPkXGTyi9q7oBqzyiUFlpezD6krLIUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esalqPlP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CuNDsYYL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576A606A69D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E576A606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esalqPlP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CuNDsYYL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlpC3611421
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=; b=esalqPlPWxzP/g0J
	k4HZQD5ZVf0eKZcbhHw1/oEYiVEXXVs7XWeTqOWRsacrAZTMtPa6J1RuOM5t8fJ2
	bV6dkjzARDZtDaZvEgHdTWspQJZrdS3w/7O4f2bfBcpXeRob4GR+aIKy2WruZnLs
	n0FNr1RWA6oiT4/yUq5bX7j14c91IgJAIri8set26o9uCZFCCPg3znFb40urcUDB
	A+BbTQDLIJo4oM9ee7XZQ1O3Ekov+qJcDFOkNwcH31BTWqv6xM2fnUYDlpny90h3
	LKo9X2GV0NK5Q0KF7cBjBtCxwNRXnf0BDtoD8pytwK/j/H7s3dncgD/HEVzyzSn9
	Y+D6ig==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbpxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f09775bd77so4296335ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611284; x=1796216084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=;
        b=CuNDsYYL5JaakHPVdIdlSLV9qncMIS7J9mQ/XqDKov6JDffHwdY6ipHTYFfW1FP7Dx
         XRxSLTNREks8sqRB00izrae+1p2i8IcrCe3R0ZAuCCnsgARxSfJOGYL8OgZBpH2LknKo
         0xgmrXdVcB5+P7DYBTEqAH9StamNK4D0pH1VNHcmy0xcnq+qCK8s/g9KYdydz2czAtQz
         GiyYCT7FZ+4c+ODHWFyUDIw9dE6cl/9bey0sLI0LbbmYZ9/H10/hw0SRxRHFyhmz07CK
         OZ3/Mx8rMkqKslElOo4ncsnWJuBMH4UXrNVHJ/8rM7G4Qo/bwWW5b9l86h4ywRpWCRJx
         9m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611284; x=1796216084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=;
        b=x+rAr0v+makcA+q4I+EQZUz4Sb7/KZlgyOWPr3kUwqNCnDueKHGgcPeIlPRnLnmK+b
         eyHhg12W3R/d0q8gnj4b8lQbizGK+8CzH8lNvzjbWwrutwk6wyoUiRqbPhm8xSE3cinh
         x9nO703v9RFUY9Vl9FmU5KajI+6pJ6Mr90ahamvnPOV+DCavi0xXPE7FnEQ/jV6D7eE7
         0l1r9dyzqDjdN0eY8GAfnNzqhO3Nuf+mGJVXSBt/1TEVCDpFYe5zZf6gXAcNgXVoCncM
         t4T7JiCNYOLmWfkPLalZE3tT2p9m+3f50ggiVDoYBLsWC/ou9/t9HGYBZSybRSBwI6bN
         AZJw==
X-Gm-Message-State: APuU4Z8PoTwzNBuSXpm0WPWcUc/VNGepEYKXrmGmRVLjHqnx6UnDxU+E
	I2tKqu66cBXZGUuh6ZUwTpYoGX2sR7knLjB2jGuAmT+LxNnnLSK6oonCiY4NEVnGBdj6iYGFEmj
	O9KGOky6n0JG5VGw08I0cVrHgQhKquggLE0zuCpW5MMQe6cY3sP3crZaB9xLChodDfgVp
X-Gm-Gg: AZFdTZfcmGi8fTSbn1pmaG1Tf2QmT52nOBlYku7hiG2uIkD7c1/8xH7zic+b4g3jZRR
	0BkRCf8Bpg8pbbzxzHUXOzDJCkpbxcYRbBXOLl106KGiriGjq7bO5V9g+PqoY0NwCbChYTZqmou
	SMo23SC3EOUs6Gy6K/Qvh1pXBCJ4HORjxiY1Ac737HhfNm8SwwPRc2Mh9HocwbJVZUj9VQOj0SJ
	3SbU/hNB6FDoPHKC4lYeXY4JFRl+L+0Y1Z8opb2bvCMta8KMTZJl53NlwUIjT7eaXT9g9F8vgcm
	/6ThjnfugZaciDswRvAbqAVBGXA1PbdFNNFNB0QCYS3WL49RU+5ltRf6TIBz74AEOsIbz2+/++z
	bMl4JS75kGF8tRDHD+IyhW7dU73dFwZGuIXGtyIZ3GgvrCDntJwGLanhBwCrDGAv4lkwbYmNXkn
	4dFI+6QVsMe4xutO5hnZQ5tJHrDVX6xPhJ4mTOibCgWrahe8GFcTGahvIXs1uyiEbWbLPhbGLxu
	JNx1Ig/UllsK0AaYkLhWJtUa0c3
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277094675ad.0.1795611284305;
        Wed, 25 Nov 2026 04:54:44 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277094355ad.0.1795611283782;
        Wed, 25 Nov 2026 04:54:43 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:43 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:25 +0530
Subject: [PATCH 1/5] arm64: dts: qcom: monaco-draco-evk: Enable DSI to HDMI
 output
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
Message-Id: <20261125-monaco_display_intf-v1-1-8a27d60b0d94@oss.qualcomm.com>
References: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
In-Reply-To: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=4094;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=wukGK8SFYBcyix28xgtPVXDGmh1LmddhG/WWF4guGB8=;
 b=IvIHPijtCs8lIqvB+7dTACq31qISg1IFESAERxJibCntNxbGAlDhqyzXs/QzmB2Ky2r+4jhPF
 eEbPILGueAvDidyx232V6Brpo9BmBZTFk/BXnLFHqbk2LhlCmB+CEpw
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: RrBOfYUAKOp3OToLSZ4fA0EoYtdaaWgY
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06da95 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=u4DayWPH-NzsctlWCTgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX2J8xBZk4J+cR
 p6s2Syq2DO7YG4qTqO/fAD7EQuObAfOqVPOmQ6N97LY28go3vL+BNh0esjmk+ygow4i7v9WAmtF
 ySEaHSCT431Rhordw08SfNv7aG1utJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX0HgTb6wBfu5V
 s9st0pCnskIcu7uW605PG/HoHWt9jw5muAxArSDodSDKiP/ppbJTg8DQOpxg6vTlt+U8tE2JBbB
 8mGtWa2HsaRbEK4ih1E9aeWBAxN7iegcxx0ygaEgrGUmd2LMPKM5axdJu8Fjq0KdV/3kEA77aKs
 Bs8WU4NkDqx7lHbzPuvlwt6ul24Xmby+MmgGTiS2ntsTwlgDIPt7IsKk/W7SRd8HSccqGn+F5Xu
 tcFz2uUbvDpClQdoZYFhpeYqA6pAKtM6Xo3rbrtXN/zKztNUghkm9YVesnT/Ox65hYY5gnLWReh
 qjHHMw8ey28hQIZmF3+gMKS6ixQNkyrBDrirwb13vyloefE6vic/KitAkBelNEZrTIMBcIoZms5
 x/kfh5ebxTbr97wkROgRO7bbDImt1C4XRs05cHjFSBtbRxI//xVym2klLlv5Lil5200/T4LyZC4
 x8wPxCx40fRrK0U06hg==
X-Proofpoint-ORIG-GUID: RrBOfYUAKOp3OToLSZ4fA0EoYtdaaWgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge on the base
board DT to provide HDMI output.

The LT9611UXD is connected to DSI0 and sits on channel 0 of the PCA9548
I2C mux on i2c8, with reset and interrupt on GPIO3 and GPIO76
respectively. It is powered by a 3.3V fixed regulator enabled by a GPIO
of the I/O expander on i2c14, and a 1.2V fixed regulator derived from it.

Also add aliases for i2c8 and i2c14 to keep the I2C bus numbering
stable. i2c8 is used by the HDMI bridge directly and i2c14 indirectly,
through the I/O expander that controls the bridge supply.

DIPSW2.4 needs to be ON on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts | 113 ++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
index ae34538e6fd3..3e1b18de8920 100644
--- a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
@@ -19,6 +19,8 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet0;
+		i2c8 = &i2c8;
+		i2c14 = &i2c14;
 		serial1 = &uart2;
 	};
 
@@ -69,6 +71,34 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_bridge_1p2: regulator-bridge-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vreg_bridge_3p3>;
+	};
+
+	vreg_bridge_3p3: regulator-bridge-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	wifi-bt-connector {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_keye_3p3>;
@@ -261,6 +291,57 @@ queue3 {
 	};
 };
 
+&i2c8 {
+	status = "okay";
+
+	i2c_mux: i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vdd-supply = <&vreg_s4a>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_bridge: hdmi-bridge@41 {
+				compatible = "lontium,lt9611uxd";
+				reg = <0x41>;
+
+				interrupts-extended = <&tlmm 76 IRQ_TYPE_EDGE_FALLING>;
+				reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+				vcc-supply = <&vreg_bridge_3p3>;
+				vdd-supply = <&vreg_bridge_1p2>;
+
+				pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+				pinctrl-names = "default";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						hdmi_bridge_in: endpoint {
+							remote-endpoint = <&mdss_dsi0_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+						hdmi_bridge_out: endpoint {
+							remote-endpoint = <&hdmi_connector_out>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2c12 {
 	status = "okay";
 
@@ -425,6 +506,23 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&hdmi_bridge_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -624,6 +722,21 @@ tpm@0 {
 };
 
 &tlmm {
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	int_codec: gpio-irq-state {
 		pins = "gpio51";
 		function = "gpio";

-- 
2.34.1

