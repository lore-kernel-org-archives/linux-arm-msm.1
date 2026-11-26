Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691157;
	b=INYQ1m1F1HIpJLHDvS0PJLALO33SQfsB6Rax/a6HYYWW9q33p673hq9JQ7kR+zNxSvZk
	 6Cpy2m1HzTfMU4l75sMSZ7oMciSCfeQS9Q75mRwStxI7dypYAl75fuNsG7Wegbc4oSP3U
	 BUXg/RwqxQmhR6zvGwo8h+P5E3xKQbI7dGjZkTkdhG0zfnPkJK5uRIkT0+w2lLfFEXOf4
	 EtEqt4z9EyMLah4mcpU/DsT1O5VfHUoonO5lGj11e0UjWJBU9E2/KFDwi2eBX4UQdaCBa
	 RzBxi94+GdJddHXbW8866nngYzUpwXO0w8KMQu4ulj62wOXYGmFVJjZEs+JqwXDEqjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MaYKdfdsxCzGOlEyu6PwzaVrn/czpCrdjc/Q2aza4iE=;
	b=mjnztucaHQFo5Ro+fd7HV2qEJO8Kyg4qCDT9LJI07FspuntswZ7t9qyV2QInUg+Pyt1e
	 eAsGRHk3tbMBvaZkHULMHlsnf+F4apLGfHI1E14H1yMzQ0gd+pf+1xB/FM72DyPVRtYjt
	 QeG6y5+AJWd1GLaSuU4Xr2mon5VigEq+Vnp6A/29QpnAMXzEzVi7OeP6PeovuSCUgvB+D
	 j5Y0Z2Fk4V4ugQBqTUKdGU5TV5lL1NC+G/RxM0mcSAHRzLxqaLPENHcuKxWMfXy/hIAaA
	 80FIC2V9YE3XeaQJyBrsxy+zYb4orJX6Sb+BG87CMKzDxQJExug1L+qj0xpIzd6XKAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVQFuBpJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bloe09Mk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F02606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F02606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVQFuBpJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bloe09Mk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXKvd3150306
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MaYKdfdsxCzGOlEyu6Pwza
	Vrn/czpCrdjc/Q2aza4iE=; b=JVQFuBpJEAka3eDZtxIFMgv6Ha8CXLdbCo5mDw
	9OSBGBE2OSo/Yc1Vr4fIIClhpNQzingA5BGKV30YEC7o4ATxXhOSi+PKKIUR0YK3
	YedbHGcL25qkVrq3+51fskru3eSq8bIP2AObsVG3b+O2eUVQJVNPbe4vhbYt5N+i
	X/zn34mWeu3WCDAMbQm0pCivZxjvWEpfG6Rr17C+GqkWE74toZQ2IxDEJBcyqXT2
	uJWRc5w9VIHGQGjRyQjYpo5tg4UiFA8dfs57r33svDC6TMfPhvbHaXn90waOmt6B
	Cf3atwk9WM2BrVEjxyyMU71aYcXr4Zk5aHHct00N0vCZOwOw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g8mrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:05:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so5931191a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691154; x=1796295954; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MaYKdfdsxCzGOlEyu6PwzaVrn/czpCrdjc/Q2aza4iE=;
        b=bloe09Mk79icEfP9kw4kF+X7fEHneZsiQx3GuqVpaSGAwWK+hJTrUbOybr1d8P803n
         gfjbj13qajsM5L1i0QzfoG/qx8w0a8C+h7nvblkJ7K3n9tuThHyKhIZvPt1PRBJ1vuAk
         ZxxwjfTUlrg4D8GNMK1lvt0V0M4Ho5OENlZBHIbuLcXCTDp2Uu9fVIWrTJai6dvwoKQO
         tVtkmhHsMUUy7oKZaNhNeiVIUYohIJ16dDTCK8bj7CRDaTbZAtfb9dSbIPpxPQoSjrBZ
         bDyk/fOENxwp6rwnzm8BzKK8HmfFVs4yadc/O0S4t4CE/i6MRdXIpeDufANfkCYMmoE1
         yWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691154; x=1796295954;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MaYKdfdsxCzGOlEyu6PwzaVrn/czpCrdjc/Q2aza4iE=;
        b=BD3mrhUnENGMhnbja833Z/qWhMxHK4QBcMzEODPbJE5B1PRQa+/s7IekR9bm39TMAa
         fCQ2c4ck5a7t4z7ElaTN37bTpfj/sjW6TOV/yj+xHesYEg57fO1CBsTMvVwhHO1U670x
         tQ9C9NMA8HDc/TGpNNtI4QO4Qzk8/yO0T77Q0+BasCqwPwk9p3n5Ui0nqwdR9wh6qfM6
         mEaMWg4ERNnUDfbJBTQnrEQK+CnqZ+EIxhSd6S1XtnViAtrEIxfXJgkfw85TM0nOiIYC
         T3Yy2dUklgHx2Qml8lZcOtM5BQQHjH5/hE+gHbpNamVWPwjXXU9UG4z8WCeYecpdayCp
         NPnA==
X-Gm-Message-State: APuU4Z9rzEtrlmwPA8vAtsP1vG5sfdLnrmP4I+4msRVdcUDvfhy05LrQ
	5nQ5MVr761q3NKECFUh83XBGUxxo/G645Zs0Psq7cGARBFJ9UJK2uW37pTWx0jtecZ6I6VJwtps
	NpOvkL9JELfPafJ0s8wQXwxRLmN2y6eQT9JAsn04ytNPqkr9VNETZY8t51LfSljeJkU69vGUD02
	kJ
X-Gm-Gg: AZFdTZet4rnXRwaapPMcZ0s25vmmCgu+PmdD9IzlVo436Y8VZCJfmufTEL6P02IFRs2
	1InJz4OXvwoxP73wlg33Pc95Axhj6qyoydjbTsygv4jebwNRb+tbOTYy5EtgLjXaF3j+FSy60kj
	ETBQo9uOYaONCVeMAS3j9Btpiv+lSC05ETt8t4pR9hnuYXrsyEWI84ZyNa18dpgUta68w8JSsqQ
	UdKsWhoVlIocaWoeC9YxDCrCV81+Qut99FLhLMiJsn5Vuo9jzR4m6qK0B32Dcn/uemBh6/SflFy
	KWZWDbJhuX81y+Q127CgtmoIDm+ah2DPBOwd6re9DghBdB28MTyDOjXd2VpuPZTfIrw8KtBztOA
	homuyFnbnXGf+DlSzWbukiJaGGzlQdLsEzcOA99vczkELjpVFFxXAh/bN3+MyT8EI//JS/08tiS
	g=
X-Received: by 2002:a17:90b:4c4e:b0:3b4:d22:85fa with SMTP id 98e67ed59e1d1-3b41c98a150mr19711244a91.14.1795691154272;
        Thu, 26 Nov 2026 03:05:54 -0800 (PST)
X-Received: by 2002:a17:90b:4c4e:b0:3b4:d22:85fa with SMTP id 98e67ed59e1d1-3b41c98a150mr19711212a91.14.1795691153803;
        Thu, 26 Nov 2026 03:05:53 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm35522909a91.2.2026.11.26.03.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:05:53 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:35:47 +0530
Subject: [PATCH] arm64: dts: qcom: Add PM4125 charger node and shikra HS
 phy bridge
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
Message-Id: <20261126-smblite-dt-v1-1-0f4f4401db3b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIoSCGsC/yWNywrCMBBFf6XM2kCaVx+/Il1kmokO2FaTKELpv
 xvs8hy45+6QKTFlGJsdEn0487ZWaC8NzHe/3khwqAxKKte2yoi84IMLiVAEBozoAlLvEOrgmSj
 y9x+7Ticner1rs5wS0GcS87YsXMZmMLqTxg1Wo4qoMVqL2tleGSvJ178uxF75Dqbj+AGbnZ0Aq
 AAAAA==
X-Change-ID: 20261124-smblite-dt-bdbfb6dbe86b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795691150; l=5593;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=CWIhwRJKjxCTg/qyIa0SdjTfpOVxU35BqlbkyxiiRVM=;
 b=5cx+sZwVh6geE7aQgIsrmeUB/hcAQivieQ1iOLFec7IhzC79ZoS41+vlKifaMRJ3D90N45HKQ
 xu0ulAxrk22DlUfXaf+VzqTKvM3l0RZhU64ODPaY6SK6OcAbLrec9+C
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-ORIG-GUID: R_UNDNu5FXnZja3uIt5-HSeNLJszrgKf
X-Proofpoint-GUID: R_UNDNu5FXnZja3uIt5-HSeNLJszrgKf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX5Cao0vmvPyxR
 kdWQx2c9gEkmMUasMBg5iqiuja5ldAiAq3XX8I3PAeks0cI+FAp3tQPhR9stYLSNR7QjMffeb3+
 42qPWtCLyC6GS9VdxrQGhd3rJ8dZVK5DbC7dt2YTzsxn3dQLPUt66J5bJxaZ+i3cO/Zidj+n7XQ
 96svPX6UskgXGeuTNBL9ct7Nmr7iZy90z4S3UQO/gZ1Q4zAu9HIc2+MjrVp8eoCn4RAT1Py1T2I
 JSbOerF5UJVKH/NTMB01i/1n7Fi8myL0o53KCWz35ZNUq5uMRhgK7GdDUfjAgg0xXBmV589gsWJ
 Z/4x1ezG+nofgPEfTszb59xkGd3Pryvuwntz0XPgL/CSHSDpNDauIMIk4PtV9I/HK3ON7fwI//H
 H3B3Fseu/Cl9BdzZpHkB1hw2b0lDsp7t7bEcQvFFWfBgSOzbtMSUFCf/G5dzvbgUK5WcZCxVEJq
 sJv8JBE6arWTWMOrGGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfXy7mdb35RY3ph
 B/Tpw5eod/a+/S8QMs3tqu3Ve5Mlp+9JlB0KMzj5DyV8HjujRdKxkGdc+BwH0r6pxQzNeNFhHRA
 wZzicNRFwDLQI7y8rtRenRWoP9HQ7fo=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b081293 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tcFNqxxWQAkJszAi3tMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042

PM4125 integrates an SMBLite switch-mode battery charger. Add its
charger node to the PM4125 device tree and enable it on the Shikra
CQM SOM.

Shikra's primary HS phy endpoint was wired directly to the dwc3
controller, leaving no place to switch the USB role at runtime.
Route it through an intermediate connector/controller port pair and
mark the phy usb-role-switch capable, needed by the upcoming QUSB2
charger-detection work.

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
This DT patch require driver and binding changes for SMBLite extension
and charger type detection to work which are already posted.
- Depends-on:
  https://lore.kernel.org/all/20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com/
- Depends-on:
  https://lore.kernel.org/all/20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi         | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 12 +++++++-----
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 10 ++++++----
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 21 +++++++++++++++++++++
 5 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index e5797aa5a538..3512f84b2feb 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -65,6 +65,26 @@ pm4125_resin: resin {
 			};
 		};
 
+		pm4125_charger: charger@1000 {
+			compatible = "qcom,pm4125-charger";
+			reg = <0x1000>;
+
+			interrupts = <0x0 0x13 0x0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x12 0x3 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-plugin",
+					  "bat-ov",
+					  "wdog-bark",
+					  "usbin-icl-change";
+			io-channels = <&pm4125_adc ADC5_USB_IN_V_16>;
+			io-channel-names = "usbin_v";
+			qcom,jeita-soft-thresholds = <0x5314 0x25e3>; /* COOL, WARM */
+			qcom,jeita-hard-thresholds = <0x58cd 0x20b8>; /* COLD, HOT */
+
+			status = "disabled";
+		};
+
 		pm4125_vbus: usb-vbus-regulator@1100 {
 			compatible = "qcom,pm4125-vbus-reg";
 			reg = <0x1100>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index bde3b7d81ace..22a8edb5438a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -30,7 +30,7 @@ &audiocorecc {
 };
 
 &pm4125_hs_in {
-	remote-endpoint = <&usb_1_dwc3_hs>;
+	remote-endpoint = <&usb_1_hsphy_connector>;
 };
 
 &pm4125_ss_in {
@@ -83,15 +83,13 @@ &usb_1 {
 	dr_mode = "otg";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pm4125_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
 	vdda-phy-dpdm-supply = <&pm4125_l21>;
 
+	usb-role-switch;
+
 	status = "okay";
 };
 
@@ -102,6 +100,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_1_hsphy_connector {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..4feabdc34c3c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -177,6 +177,10 @@ channel@55 {
 	};
 };
 
+&pm4125_charger {
+	status = "okay";
+};
+
 &pm4125_gpios {
 	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
 		pins = "gpio5";
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 2ded25c4304e..808f07218841 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -26,7 +26,7 @@ chosen {
 };
 
 &pm4125_hs_in {
-	remote-endpoint = <&usb_1_dwc3_hs>;
+	remote-endpoint = <&usb_1_hsphy_connector>;
 };
 
 &pm4125_ss_in {
@@ -77,10 +77,8 @@ &sdhc_2 {
 
 &usb_1 {
 	dr_mode = "otg";
-};
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pm4125_hs_in>;
+	status = "okay";
 };
 
 &usb_1_hsphy {
@@ -98,6 +96,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_1_hsphy_connector {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..d533eb6e774d 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1083,6 +1083,26 @@ usb_1_hsphy: phy@1613000 {
 			#phy-cells = <0>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_hsphy_connector: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_hsphy_controller: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+			};
 		};
 
 		usb_qmpphy: phy@1615000 {
@@ -2596,6 +2616,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&usb_1_hsphy_controller>;
 					};
 				};
 

---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261124-smblite-dt-bdbfb6dbe86b

Best regards,
-- 
Raj Aryan <raj.aryan@oss.qualcomm.com>

