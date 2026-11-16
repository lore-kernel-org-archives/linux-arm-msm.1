Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834335;
	b=TRFcRUNx/OkXCdiFaBaZpoKDGu290/t5YH8HO3pEX1Jg3m3ooD6Zmp985z4CB+784SzO
	 B/SoMnl4YoTbL5sToEL8+rJFAzCVP3nYmH+ucd/nhutjW7MpcX6/cmuAnaHWyhl+ywl6G
	 jHgDfPbMtXOyZbVmt8HDEc3zQbBbLsJJa6ga+c6SyCjSYT+dAjaRIFSYbSYKumDM8bf7C
	 ngpUuI7MzIy57qShat8nyaj6H9BdLqA63AcIb4IGmCJ5suoDXzUyAnLWnWVYaYTJdunf5
	 lAXIk9EacdnEoaLjGkUfecbPojIjULglwcdX/5V8rh9BGXfA0JTeg2ReY0vPHieQVpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
	b=B641XC1eqQvMTBS5NJaiDSoNwfU+EbQreul7zAWUU7WX9Z+6XiNK6Xjo4wjCgVyhm1Yx
	 FbOHY7ryD28yJmfiQ68cRSyXSPVvgoJM0kRGB2xDhnMrFblIiONNa3qq4M2Qz3y431OVN
	 qSw1AH+ylCKsg5m5VVw57/1E3IbyBkZAKAcW/IM9sNC7IvTpBzEZyWnvitrGc6kJMisFT
	 1kQvK8FFpsTfxgaxp3USjGN0lL1LwEEl7rWG2Nh2KlPVcEaJWD8wGyOJD8JItZIwBQjVf
	 scg6j/+uodrb4eap7H87x6D1Z+DIfZoG4cvo6l59JwBTkQYBLZExAPAHQ2p6waRhT9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3GmjFWl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdzejCUK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DFD606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40DFD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3GmjFWl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdzejCUK
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0uWf2472407
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zW2/gkGq4nm
	G+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=; b=L3GmjFWlrlFor7knkaJSvSL1Mgz
	wy9KTmcLH8qeGIj5pxlYkA7dhjUUOtg9XV5eohN858ApqQ/Dn8CFpCt45XBthQzO
	BuppHD0aBQHcn4Y0hs15MLcjq6B2EwqLS7G/Dm4vpCuH5Ce2DgNeOw6QA+205zZ6
	oxPWxjv7+8bGgpXfwW6c+LL0/GmLNxZQ3iu9U/ts5rKlI0XPF6Wi2bcGvgWWfvhT
	eMAkoVtMV7HSU08onQJ4F3utwbS6hgS3aIqjZajo3rIJzPUqdEVTlJn5wPYMu5AA
	oUKoVR5cTyIe/GoUk3Ml9CVjRbELPxNGggTzD0f8z7s0XVXILKZSxMLvJ5g==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdxg7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:05:33 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54dbbf252cdso4298011b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794834333; x=1795439133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=TdzejCUK3MCfv78SCA+5eJ/aR3WSQJXyk7HtL9jUXXr9Fz4QsvCfVzeS69QpSV8hR0
         wvpsZSU0VzqNuiFRrzCbgTRcoFCVgxsTdCBYhwhIsibmkGN28CaF7qb1+r9tTiGrSoAb
         tcfJTsG5zCAZ19DpYytZYxfAFjjg3cClsqQmhdXP1WiJSSr0H0AQpbDtKKzQmDvBGVmM
         zKtlRhrP2xyDrl88uMVT+NFmsA0khIaxZzNgGrm1pGCkHToOGhxsBkW1/Dc73cOw86tL
         mwIjVs4LQKAP1yu+2UKVqmepII7OB4TSWH4U+PsfCrJQ3IO9iroAtuE14GeVoJ4j3FeI
         LvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834333; x=1795439133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=C4MyhixukdknG1YGMIpSPA1Nh6jPSMMzsriczRXNKr8O7OrJeGp3oLxkiQ5S9kQWh1
         Loppqm/RUvf1DHRJaRE6MuWuV0x9garP/XitLsWkaNlxD5NlgX0r+1fnT4p48KixNU5I
         BFvPvEqpchBrYxjEJeG9SwwJ+eUkYLstyPHp85yIE//e+61pSAZY+0kU5ZCMfzSYVEh2
         5W6tB0PRS9nvFIAcOF8Yuv00+ppprBVCoxudj9OQkn4BfAPeBNRG4RhkbGpr6ZyNd8a4
         P4kwLoAHRC31dBy/sHJM7wLUlXEUjtuettp4/HsubK+hgrHOaztgCJlr5H0Kns5mOLev
         Vj2g==
X-Forwarded-Encrypted: i=1; AL+hErHmQzKq4e0yqzjuMekFuXr0Wxpa2dHCCWGy+MKBIsDsQ//Wir739LIsbYrCE3lsUf2HZNAWwBYyevTVmR51@vger.kernel.org
X-Gm-Message-State: APuU4Z8/ES1KKX+x+BpXl4Juu3DY6hK9y2gk2Tvd05uq3heGA4eGSGW6
	zvQYYmaB3O6Y6cfyPfnbhHkGRtokqKbsQ3P5gS+o4a+54vuZUPSrL/S4xKNy40dxkkkt6oftJ9K
	ZwkZ1ql0MjvwxQwC0Q7iPhg2ggcYthmb8DBdNhzgkhDRBaEc9qJ/DCZ18EnoM/zKGYn3/
X-Gm-Gg: AYBFou2/YE8aTg7gL9jLTR5R8eSEKp7nRl7Ecxl1WX9L4eIKQh/27O0tRhm/J1eFRoA
	77YVu1Y9RUuqrm0xSkpfuoN5HqQmyUhl26/oH/acG0heWer8PvmesMxZaKGR72t8OZ9Lfwi6pNe
	6W8GG7Mq6DJKz0Eq3qMA6A30peog0XerJkFr8y5nTRl8hF2fin504RBMpx0blosFXmwZyntxU/P
	hU8NI8eGduwmFsRNXQghidw4HkWmmV2jDjLkiLwK+CF9gaH05XZDT9KOB4MQaWl7d38ohl6+Vck
	ElZ4BpP9qNrFR5ejCcUF40sRxjkxDlsJYpQknU3huncBjG1/17ab223ejFj6xIP0FfoEshfBmLf
	65dghwHhCBepXETa9OyOKBk3QS3x10DMCzifadNMXIce1Nel00Wx3UucDPMwoGL8VxqTfl1gONI
	vt
X-Received: by 2002:a05:6808:3c48:b0:4fc:3dc7:66af with SMTP id 5614622812f47-56e63794f3bmr8293785b6e.10.1794834332438;
        Mon, 16 Nov 2026 05:05:32 -0800 (PST)
X-Received: by 2002:a05:6808:3c48:b0:4fc:3dc7:66af with SMTP id 5614622812f47-56e63794f3bmr8293762b6e.10.1794834332061;
        Mon, 16 Nov 2026 05:05:32 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3eaf6sm9895641b6e.5.2026.11.16.05.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:05:31 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 18:35:19 +0530
Message-ID: <20261116130520.1763088-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
References: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afaff9d cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=OnC3CdEk30aKpSFVcR8A:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfXx+pf8Pv5XP3T
 wsEl/wLbmcau/gFFBvsoUYhg+GiD8kDqo8FBSHyfEz/2Zdyzoa5b5XVZ8nfKlq1ZNWhWSR+xQ+s
 SjxrB9/Toy0snWSOf5joVKXTiROfl9k=
X-Proofpoint-ORIG-GUID: iRNAJp2CyVZu2mRrwTv3sqvONs9EVWc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX2tH+InMPNa7c
 hfOcEJ6m0wZBCzQSvegtrGhPyOIqPgBLq4CvFC1XM1pDhv0XfauK92otIZJ+iokWeARZJjgIvrx
 3V4KmPfO06kmY7rcvDMG5AAGBxb33cr32vIfr6NlAlTKUwQkQY+DCircOSrzm1GdqPjlrJnEFgG
 Fz5i4bzai314qifs5NTBqLJfwZii61ZFpcaRB9hpCXzEP2IJA/55kyj2LW3V92Q9Fv/cBmqgQh3
 PUxfijQ4OM4W8CLfzxwXctfoCKAeomQUPyg1pK51N5gQdLhSgIloHUuz7wrFw18WzgkxGhXUsuf
 sJ8jQo6aJ5dUn8U5G8Y0XVJ8jXbDpV8g1bJk1Rynqcu9pK6FZT8lSSg37KIS1iF7OH3IjjrjqGv
 I8w0J4bXM4YgR119LFv+RWMV4YvtqfcpWQtnCu9s/g5ZMjI8CcfFrZF14t6cEyyKtFd0B/AAcoD
 1gaPl0ZKkqDTHCzgAUg==
X-Proofpoint-GUID: iRNAJp2CyVZu2mRrwTv3sqvONs9EVWc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160051

From: Akash Kumar <akakum@qti.qualcomm.com>

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

