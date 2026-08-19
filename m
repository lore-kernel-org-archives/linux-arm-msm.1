Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22913A9D83
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147875; cv=none; b=YQw7EmQkvAv4ZGTPH0lPO0qDLJWtfEXo3xq8cZjcLfqiFKHTBVgYJ5HRWY5Plc83uxyI6YXRT3hWnBfkueP87XTSM9dILvFaxw2kxfWDL3EE6YlX2hsab9zlofUPuHLhinaMYgArM8MOZFGJ7j4D0gCkY2wZDLca5f8hRRTz1zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147875; c=relaxed/simple;
	bh=kSiftulibVL0HSnjjOpYMYmixsE+/nkUGXx6P1IyA8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GN9RzxFh6lugNhQopihMmas2IHTvbp64ZqRvLXb2zmqJcDGKC4kFgJEHYi7D9XWB+rie/XXnMtNu1p0qB6WyJOdPRUpb58zwF2Ga1IDR59Ar0qxlHBP1Kli/cpbEzugA6hwAnWPyTOKiK1YNhkhGWmbAeHMzYExRVFzWWD3sXg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtR77LVv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4bVFx2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtR77LVv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4bVFx2W"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0atK3600681
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rf5LDVyJLQFDuHVaje46GeTwqruso+eP5jYsoKj8CcY=; b=KtR77LVvy3dMb+3y
	8LJqrhcMajKEuoDNDnqIecA3t+TebNFIkNFs9b/WzBSGKRpyoBsWdVHONbvlR5nz
	L2GM/Dzc8nI6amcHICU/76PKx3allFOH/716FgaliI5vW+j9/tuTSmLtZu8SEQ2H
	zB+QlM3DuqSmro1wrtColgzN3x/xC7LgxMGst5b6VH9qigVcBC9IlZdLyHNibTR5
	kgDjjXje0i+Hs7ALAlwweHVG8TG6rWx0QKR+P46nWLHpCkgxP0Ec2CWOex18r4WF
	ap+WHSlwVs4G+WfYuE5kO+DCwj9/VP/EYENUNvi3d1QBusoPX9aQnxLANxciBvHY
	zfjNmA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3ht8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c888c687c21so118837a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787147872; x=1787752672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rf5LDVyJLQFDuHVaje46GeTwqruso+eP5jYsoKj8CcY=;
        b=V4bVFx2Wx7MOvp5sCW/CAfig/hCZIkX9eCKmXts/NdvQdy2jNSCeY+qUfGDqRla2Do
         raKHGtNCabEb/QizlgVsbAxPQB/ejAGubd05TyiBrpNowhS2GPdyZf3XRQ8A5nDkxNUG
         BftjeiTpVp2R5ZQFx0yANIwxCNqciQGw4Gh4SnYQ8s/mAH1b4QwA999mphSBYKEyQgi/
         ChQpbabEZGPjwMc0+75lLTPrT/hdqu4Ft2xHDSqJsNcKrfp7hVbbGhK5HKOA3+vad2Uj
         QZ4gesrFvLFBvkkW70HvBwcJumkRbSLW1ra29GeS2jjlPAPEBjd3DiWChZOXOgdnyYHO
         f8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147872; x=1787752672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rf5LDVyJLQFDuHVaje46GeTwqruso+eP5jYsoKj8CcY=;
        b=G+GGuSfb1M8ywpSqTtlA8HV8tqdL89ehpGgDpQpCM4BNKiXrKML3HC7ZuvzDyXPrTk
         JHELeOraefgfDgOZ4vbMVv+gzUOuJNoIbIwbFZO7UY1bKjl6EJ4mExKxYivqNzjqnw+5
         TcInn1WJvsLzbAeH+kBPA2up0/GMWegLOVtY1SmtbU1BZa9S37zzphqO1qxDLfoWFaPK
         ReZNl9t5QcmjQDfkPaOheSQW6wCs3H2g+72IPSTVm39drZF5dHgan0Z5ln5DJveoRjau
         0xdu7iCdyW2zenIqcPCacYmuUoJx31QaupTJ0vahNcWr0cwbB6YqC7MD8TY3AD5Yppi3
         Ow2w==
X-Forwarded-Encrypted: i=1; AHgh+Rp2xieEprWE+Yv63RJ4reBCMo58r/CrapTSOc/fheQ4d+IYbhqteeuZ4GCTEZXhL1Mbaq7LpuaFuwABplxO@vger.kernel.org
X-Gm-Message-State: AFuF++mBbjqJudw8lo75q7PH+2otsQT4FL19o+8kjhv1oGOCTbHMkidT
	9Rxk7ahFCccqBDj1nAs28DUrqjiOIP7WFhzTaIIZQUXK7DHOo0BwzF3AamFzYc762KKJeXprHS5
	Fh3u7qkN/i5svt+/sFgg4JsiWsbfsEHObvXRAlzE0Woyff6JG/+enuNrcGeV8ckadnSr1
X-Gm-Gg: AR+sD13EEk+zFmnP+1EyRy+DqYl+HXUOzcon6R2oEBcS/hvPe6/iAdNqnWgEWYdkQmV
	3vPubgumf9UHd60r1CVlKORJpvasZxXTn9/1gmhkRdKEmhaKNrHw9NcT0F82vdHr2XdmDGWZIve
	LCtK+zuU0n4yT26Xq7vht59BT8Kf7f55DWC4626bJntTmfu7pCt8UTd39CE3juLH0mOTemgsOz/
	gDPFuayTCugkOsI3P59RkBJGKB5IZkd7Uk4h5hNPUsiIlC62cnmPXbCz3DZWzR7lM80nQpOYaR3
	yarmt0rzbZpo2DGkrTJ4i0i/YeEZBUByr3jcBsmLwy2M8uJl3aoo154KzBRxEEVtJ4w2b77tf6h
	/YMfsSt89ZwZ3yar3mqu7qPFB2r1f48S/r+hTy0xtrkGSlPKS1Qc=
X-Received: by 2002:a17:903:230b:b0:2d2:a952:2628 with SMTP id d9443c01a7336-2d5fd7197d9mr43660935ad.2.1787147872058;
        Wed, 19 Aug 2026 06:57:52 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2d2:a952:2628 with SMTP id d9443c01a7336-2d5fd7197d9mr43660275ad.2.1787147871452;
        Wed, 19 Aug 2026 06:57:51 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e550dbsm25318255ad.42.2026.08.19.06.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:57:51 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 19:27:34 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-b4-monaco-evk-m2-v1-v3-3-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: bFGQ-L5fvbkJE9g7hw76jg4i_Gpg6JYB
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a85b660 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rHbtwcfoZ064LjEFTuMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: bFGQ-L5fvbkJE9g7hw76jg4i_Gpg6JYB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX6ax8oD04gX8W
 qKNM/mBUws4lJ/HtAFP10dj95yqwOq0zo3H1DCD+YIazOH9O79JPdcx3H//ohrxITj9P5Gz3DcZ
 hEE7wTLMjGwXkuEE34gtDrY9hiTruo+Vi42GKjnp+3qDZKbblUteDH/f+WVAJJcjjxMuTasOqyh
 iUcfRFCaGaEy3zy4wWN+dGRpXpOza5fNRRo8De7GkgsjVv2eoiluYtLfRPk6H1bq+J0c2Nm+5hq
 A4IziKQ0k5s/2mh9bmQ3hCbwg8hl8jZ78fiPJNwTvrteRu+s9xci5TAOhXCRBdd7KETV7KIGVU+
 Elyo+g86vn2oYqBndamsyBwzTOuDCd6fnppRKr9tQ5DXJ+/+D1boxR/og4QInKsLmKOOgnEBJJB
 hLkRS9FTQsl6rLJiyfgMLzY3Eb7mMnM7FrZFqpm6fMGESVhvxoxrrVZg2O7qDSL6ejxliTB84t9
 vsdzoOz1MRCHtS/kFag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX+sS35XZQLZN6
 KRWWnPm/6MH9/dohgVgqke6tdbtKVQvojJPYK5Cbw1ZZUTNCCDM3YveV8dXGgS9KzS1xeAVOWT9
 eX/ciN+KK+Sspax/UeipvXt0ky8Z1rY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190109

The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART2 nodes through graph port/endpoint.

The connector's 3.3V supply is described as a fixed always-on regulator
(vreg_wcn_3p3), which is required by the pcie-m2-e-connector binding.

Also add the serial1 = &uart2 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART2 interface.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..5930ddb3b4b1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial1 = &uart2;
 		serial2 = &uart6;
 	};
 
@@ -47,6 +48,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
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
+					remote-endpoint = <&uart2_ep>;
+				};
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -91,6 +124,17 @@ usb2_vbus: regulator-usb2-vbus {
 		enable-active-high;
 	};
 
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "MONACO-EVK";
@@ -646,6 +690,10 @@ &pcieport0 {
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
 };
 
+&pcieport0_ep {
+	remote-endpoint = <&m2_e_pcie_ep>;
+};
+
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
@@ -923,3 +971,11 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&uart2 {
+	status = "okay";
+};
+
+&uart2_ep {
+	remote-endpoint = <&m2_e_uart_ep>;
+};

-- 
2.34.1

