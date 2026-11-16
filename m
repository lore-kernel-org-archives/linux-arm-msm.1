Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829761;
	b=myw/X+9fOkhibqTge0wUaxjJXZGMV0zdA4STgYrl2kqq43xpPzxjehNMcofBe0zYRJsa
	 eDAedRgRDrreuHmyBvCkpNdYlPbrq9UO8Po5kRnJyqo03AP6AUQRm+RZvGmq0XzEur0mA
	 I8zSlLHRhFH571UlBudeALO75+bsymbVb12z6KzxqXDxymLOhmfo/h3S0xCfiuRKMJ6LY
	 aPVCy0t7kjfrpLsBI0FwjqbG82bkzCvGlZcS3hvNOAoD9Vc2qIAmx9uBqXVPzI3G+i146
	 TAwAusl+BoTRzw00lIDPY/kqYP3YM1aOXh15HfsWFbPSRSObOCpTwnzbIm2+gfJ+gvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
	b=e6Bhp1KHfBSFjGGbmJpnZlKTJTMz10SyPxK3Ak3KkW1AOLHmmHi31avvuWavurwqF9fn
	 gyTGKRqpLnv0YP8wyT15PVPqfdlXcmcc6xJ6pifv5AlUoQEVICGFB6O27nvBT+Vyjc6nV
	 /5ZQH7MRx5/B5pMPiajYdtKQhdgKz/TCCbg5T+6XX97jxba36+6uAAlHH6DqC3RotlEZX
	 yYb06OQXm6IEcf7fy4nOU5L/LGE5hdJpOiRDipP930s9TjiQrJdLFwtUNOm5WqfK02ePX
	 ijFgoIjA8M6C+XT+Z47E2hSF9bo0Nb5CfMO33xYhKkWmfJvqBbF6Mw8fw4sNKx7t0YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N1QV2qTI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJENTJoh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2DC606A33E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2DC606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N1QV2qTI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJENTJoh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLF3D1397180
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zW2/gkGq4nm
	G+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=; b=N1QV2qTIqyQv+2dSNgrsMQLmKNK
	86aBYtCM9XdS30mrFsdRKbSM+xG0j8XPaDl3sdbp7TBVp7whM/TCNDoSAkkp7Rou
	GfJMLCzdc9Q+2YRzqE35ssgdrjXWS6cyF2BERGxcy962WBssyw4AAUPUMrfWlZMH
	XFflyx2z7ULg2EraSS+H7FBmaVh+Yts2wrdF5yXDYQqSczFAwRjZcJnB2CYnT6Wp
	NdIY9MjWJHYqOS6BX3u0THOFEydkj8R7A5sPMDgyQ09iOQemfdTOxIR0Skjfju/E
	GgEIENYbMlzDKqGGnxp1TdgEWe4jp/yTFtyMN3insFN5cIScOUJ16oNwiMw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgbp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:49:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso2443809eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829759; x=1795434559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=VJENTJohLhf0Xp8n5t8Fk0cXqMqk8FPxsdtgNVyqMwieY3/6QwI1uL7QZWHU6GLl1f
         CIe1gHZqulNAXkwd51TR7M9pdELb3yTEVvsaaX1ZWwFBIddB6z2pfy/8QbGfhlhqaQEA
         7CY27j/SAMXrYCON4jBdNt6aUfjmw6OMoh86g6bOMhQl7M3R5sVLHs06RBoscR5jnwfQ
         tPqpzI41NK2nZ5LsxWm52UIDszX31dLQgKsOVXkA+Azzl+NX3tpxTXi9KQAT39ZD1wd6
         ZWF/5su9QQAEipOhV7yJqnkLebtoIMpPdemUmR1bIJHRNGEhaUc6vqZYAjjWg68j12Io
         1IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829759; x=1795434559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=i1D1W/wBQumZtS3zC6Om8wuQ9alOszy2RLvu27VmSXuOavun97kMJUQ5h6i6CZcmK3
         /mw7rZ0TEbkJ/kc8zZJTbhjjTg818J9N9Kjo1L1Q6nowrsEyP7aQriLZHI1ihBIhNCpM
         mM6JY1JNi8H1pCe36gcAMsxNYLfr6hXMv/sDr6zR8AWlZ40TNbCh1JreGL09sRRpSWCR
         qap1Cn8qrUTZLPLWPXzzw7ug2gEsl/arsc6dayVpxm/fUUmVpxzAB12ocx56R7jz24fb
         HFIgvxYs5sQS4Bvb5Lb0tTy9rsvNcsP44StYHWUOVQjHqgq4TIS55bTLuiN5KW1sRIq7
         TStA==
X-Forwarded-Encrypted: i=1; AL+hErGgi9KW1hCYKaOf3GbV1Kfe4vPomX4DVjdPVe6KI32H5u2GgYBAdeAUOmQh5xv4Phq1Wa/G1ONDw0B8o/C3@vger.kernel.org
X-Gm-Message-State: APuU4Z/6l+fdpHf59yefC68aWdrbxgudom97cK680ULYeSz+5bSt2wG8
	X1vobxNnkI6T5yDZW2ZqqoaZyeRN4XbEejPoEDtsdL1m2qm8hMB4yYBYzi2kKx/4XgsdenmS5c2
	o1O3/MnStRw7ukQkZus1lOm/lGvwlDzRESTn7GazoL+FLkb4KkDdbqjZEBqo0t00ToQ+IErO9ap
	Cz
X-Gm-Gg: AYBFou29lN/Uw0DoRXuCoYH7QEs+QdkO9KauvBr892FFE9e7Sm+TuINCH91QR0LAYd0
	3p+4sguL9Skzu66Zs5SFJqZbQIfHuFVklbZLdauJhqzvfmTUyxrM1xIifd1agS6IfFm3UDgT8B+
	HEPnoqyzff86/1bHKiew6gyWDLl7nm76F2EmvzU04SzJiFB5uWO5Ub3Ac33nvQr3feis1Zn7Wxa
	8nrZ9/mc0yzCJN1V3tXTaObQyUJUBiprqcDbGcRAwkdUsCwAV9QtYL+DTv1BY/UqaodLvM26EZu
	lWZnUDh12CkBjJMvrAoZ5gFOzZI/j92BNvlraAa5rYySEWjGY0CHyI7Bpa5Q/VcCQsWKJLP/yCt
	88b9Yx8ozFNNncxaVFcudPFrXttySX9oKzX9jBeFDsC0WXhYudP8q8bsT2xw50C9kzAgDRwCdnI
	+h
X-Received: by 2002:a05:7301:11b:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37967316395mr11944922eec.25.1794829759181;
        Mon, 16 Nov 2026 03:49:19 -0800 (PST)
X-Received: by 2002:a05:7301:11b:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37967316395mr11944896eec.25.1794829758554;
        Mon, 16 Nov 2026 03:49:18 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm33802844eec.10.2026.11.16.03.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:49:18 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 17:16:40 +0530
Message-ID: <20261116114908.1701258-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
References: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afaedbf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OnC3CdEk30aKpSFVcR8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Ehr5EcMSoyqZbOXAr4_Sk750TTJd_usJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX4/quxmrXYi+H
 h+5l4w8BuR+22LtE3uuCzuwER0zsI7YsNNhUJwax0xqxwrYl3bdUT9C4ZDDU/Zehh7ypNZZveXF
 q/3TkeZqBJTWB7V2IYvCaAGlKFSi2ReQn6WMEULUIE5SUyeETC+BAo6ZVwwOaC2RPSslj2q/1x5
 P1SOfL0a/92boaazIYoZS5wCZ+bnVFY6GXn/WK2o3eL/l1pZyaETowhHeqeB2p44osVTQ/aeLfk
 ZSmDasXb/tLTjeoCRiTIgwHa1/giJucpCdbZTYKjUN8cYQ/wspCPf9Gmb1NX1Xal12Q9iZUO/zj
 ES0ryWcBZn3BrGPrvBBaA/nRCtevt/OObRkNlFJN5BDjd99qA22lGqhbIxr9KtX+WLpTp9wHI2D
 n9C/kO3kge5jXM59jq2Kmk+7j9uJhFhWG7JX8wmFhzqU4qU6FG6NYR40OtL3Gepo3FsiSHLqC7W
 4ON2VuHZicno5WEamhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX5a2hulP9B3O5
 OhVQS/f26vD/wjuuNRp+0JfRnErFJIVviOpw35A6vyFJ+ub4BdzDCmeCMlkXvcKHYR2iUYa5IRS
 vITAoogel6cC7gVWvHNAsdDzMzQNRNY=
X-Proofpoint-GUID: Ehr5EcMSoyqZbOXAr4_Sk750TTJd_usJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160046

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

