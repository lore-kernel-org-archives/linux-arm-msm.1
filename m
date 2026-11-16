Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829461;
	b=GWeSKCPeNIWijPm7FxE+78AS7dqLIUr9IYaOHjhJCP1N12Eg0OUGPZVq7pRFb44qvkpr
	 o8g/OCOkiku2v6MhG4htYJeCabfMFSCfJSHTZfLkOyRq3dNkNY7RNQ1wd5gcjXv3eIWPh
	 GFeCBO67R7X5Vr5mA/XbaqcpIR2mvLNa1h55YOoXLhbU+qNYC3sSsxGN3Cb3udJaSCCDo
	 oJ+jSuwmJuAxT2PvVs7SAxX0HW+hT1RK7SKSNsQig/RJ9NBQ4UXRHdJ0VxQHYde69hZ71
	 OIc36Xd8bGv910hobkM3J4BAqnCTb32y0/PBz7l0BbuGTk3w13OnThkbSuqreV1YiOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/W8WvJjKw=;
	b=I4XxhRfNWI23NtTIq9CJMIOhmO87s6UOqq/mtKIrNlh8ABcnz6Xf/NpDMK2Hwd6HUWRO
	 BlV2JKzUfekocZ1W5Ao1NxQ19tBGlOtoTBwxul9gKpR2XBr1yZQHO8RXR/y5C3s7KjMX7
	 OHhRI90Efe8aOfwOcG+N4lLql3N1geMsTGIlP8Usf4c7DzWIDMrDc7A9maXivodK8UjQ4
	 sfe36giBRpweodGmsc/dinspp9PB4cmy8DlkjXf+R13O8DRlKBGAqVknTwRN4loqXs9me
	 5OWve2cDIxjysJ1HYvITRFJUYJHIpGPkVnYTGHoNHLMJpRwO8Peu7x2O34QUfzHH50Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dol/fOlm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fEZFj6Vl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC59606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC59606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dol/fOlm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fEZFj6Vl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLU342127829
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/
	W8WvJjKw=; b=Dol/fOlmqtFTlwG38Eoj03cAsBANyF3zU5yerqX8RZU/ISPd2o9
	+eLzOTaY0AzeLgQ1vksuOPfpd5ac6ZFM8ffWXYeUVcd2/QIftE205P/Uz47z0jDD
	8hsGAn0NQEbPa0IW5q0fHsX6XQARAaqVlyEFfn9lxaPugACT3oVpYfBLRDte/ssF
	flfX4IvuEAmHhz4O0Ch6d+/LbylQTbkZ1Se1hLI410oqVopwwidguyKrStI4kBA4
	QVBfHv6MoOiVmzP28U8GtwhVAD+MuWmw2VXn89W2NqXJZSdaoKc0X6md2shkG7qc
	C+tGtDdMJcu9/Lim9K6TKaG6EY9OSEyVnuQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfg4a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:44:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4052886eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829459; x=1795434259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/W8WvJjKw=;
        b=fEZFj6VlLBDG3NefQ6ZJEC/X8f9ZlkmiknefqJn/39PVzu18+xAyPesTvneGbCsSuN
         ABJEf5ugs4MLj5UD5ps+axU/pJwaCw0hnfzuHLMxnZ45JaiAeX0D3m5bDGRPmhGYO1Pw
         npD9ztDSKZfFWKzN/UnfE8EtCpHGwZWJuoBBT28aNSTh0KHWmf3lOFGEbArJ5g/Y0xsD
         3nPSAGcF/OLRd09/wScbBVctsEdnDcS+/WjPiysgFkMBnHznjElmnaQnSRxJ4SYBXxZl
         N74q6RHTsMBNn7EcShDkK4cXMuNhqPRNhHZ7/JayFFmczrBJcs7RiqfpGq4PWkIeoJp2
         GeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829459; x=1795434259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/W8WvJjKw=;
        b=NJiuYK8HLRnaxi3TW4KMMrdwqnECOSnFDvWyBhSH2sO6lH8EcfonK2K+EoknkzcUFg
         4cV4qTES2DwEhQBoSHv+MG/nEx7Jja5OtvQ07KeYmEKa0Dt5o0CuIutnePWxf44NasKo
         A6qixJZN57MetvsaMyFma1MX6JMr8czeq5lGCG/TqxUN/3r3P0NqaU6fBCrGkgwPgJxh
         jaInVd7b35Z9p8P5zAe39KHKz9Au6L32mEp/4YUMgsS036307NFzVpf6+1ixARGYzu1c
         oYPXf9oUyrkLVfeVCG7T7esBedUfxh0fA1RSl/U+yfCiSDLati0fYvHLu5emn3TAYzXI
         bUiQ==
X-Forwarded-Encrypted: i=1; AL+hErGXZ9YGecKh/jL87TEKmdXO5raHM27OpnXKP+Zw2VDIzFoYh/m6rWpkelZU/+bwJ6NwJvnqYYpj+az+3XfJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q1glkHs9xFQlTo4n08IW1WKBo7jNe4RsUo5aJpcihSuYzMIRj
	jdntWQ6KWg/M+QEOlLcQlxeMK5/1ZoUe2Vt8A1b1WV5WVnm6UP9qla6nujLzm8kAOhpcxjz0EQQ
	AhK5wVNXyN07L3Z53htLD2mFJoK6h26wlRza0SDA060KqxiNUAYcX7o1YTol175XCRx3ZQd2TzX
	tP
X-Gm-Gg: AYBFou0HCC6c+642lofKnsjIU5GxanalStRJEuuylSc3d5+KyojungM8Ue6ewTeHGmp
	9ZDtVqgDksf7IcGEFsdZbeHzZk0AZ6ao5BKJe01IOMnHICHIJF58rOE3/lrNl1NR/5jSlcDCOhI
	9fcQPCZd1dLW1vSh27zNB7lmatkp+nKOoHcABlFStTvqvTTonBbrJwRdYPyaDRm7XmPreKLI0Ig
	DMN9X+oGdyT+O6eiDXOD7F5pIahz4mV3AjGm/s2J1VgNAsU2c58EwriF2kh2DCwavYGTN4q7Smk
	iR9NK4KzE0nEo1EjeGMaiHycStnL6NVkTaNHyQoPbHnhZVI2jhZ7VplGpJwbFq/9o/QVXw3eto0
	psXvMcy+LMkxMvWzDdTRHr5V8UWwtSvy+De+/Ads3n9yYrC0WvCM1wSpqQeA/HXbm0y8BQRcFqM
	Hi4w==
X-Received: by 2002:a05:693c:8806:10b0:370:121a:b2f with SMTP id 5a478bee46e88-37965f9dce1mr10323745eec.11.1794829458514;
        Mon, 16 Nov 2026 03:44:18 -0800 (PST)
X-Received: by 2002:a05:693c:8806:10b0:370:121a:b2f with SMTP id 5a478bee46e88-37965f9dce1mr10323717eec.11.1794829457576;
        Mon, 16 Nov 2026 03:44:17 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm45612670eec.19.2026.11.16.03.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:44:17 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 17:13:09 +0530
Message-ID: <20261116114411.1700153-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afaec93 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=DSWJuU78OHK9oOt2xpEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX3J1RmqJ0YnE0
 Eca8DHoanM9eKD/PSopJnECHIb4vXMORIfAbKbncWPx9drRrdmKK2wCJNS50h7xhMoJXWiFcDzS
 1r+zAmxRDgzgEd+7v1Zd5nMRz/Zl51Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfXzKM6F1T1EXo2
 TH6rTnn9QnL0jF2d6q+o4IdIr9nzcZ0Xa1qsCIaKZD4bucBvrH3BL/pKN9FtVralGuOZeVKMAwW
 EwTu8iTz7a7Sur3iz1mLQ6M+Y8CcQO/t3diHAOnooVwMQkc58RYdA1dWE6PBqZE1IRuAuo+BIbt
 ZbY1DclYOt0gq/P25o94cz4MyU1Lwhcgh8t3bZoJ4Nr1sCWo/as565d1iVDpBz38UOA/sTVagxA
 gQ6CCBR+6Xkjz0uF7cfzTR1tiYrKc/t+08jYQYEbqzgszXgZdVK8LjocOMKUII4tHGaEfLDsR4P
 vMFQ5Xil2cHuHUsHeEl/odJs7o82Es0mqPOLuz4Q7J2rlBRXpfO3icvovv3grto/9ELiCULfQDb
 ICAV1JqM1jWWpFfCP8yHb9qV1l6uB7Nu+tobE9Sg5EwbGkXofaOwtW5S+uiQSy2zxztIprhdVNH
 Ck72HJDQMyTPSFmMnpw==
X-Proofpoint-ORIG-GUID: WWEMhLboNelDGSHWcjazJ0b3Z7QSyaki
X-Proofpoint-GUID: WWEMhLboNelDGSHWcjazJ0b3Z7QSyaki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160046

Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
the PHY. These placeholders let board files wire up a USB-C PD
controller's HS/SS endpoints directly via
&label { remote-endpoint = <...>; }; instead of redeclaring the
port/ports structure on the shared nodes.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..04636fd88807 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
 
 			#phy-cells = <0>;
 
+			orientation-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_qmpphy_2: phy@88e8000 {
@@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a800000 {
@@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tsens0: thermal-sensor@c263000 {
-- 
2.43.0

