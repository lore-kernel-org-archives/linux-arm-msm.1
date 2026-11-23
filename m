Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436941;
	b=5rCsHKefZvR4VmUi9RBldk6o0VwFt4tBXUwFnAFIZYAA2C70/OsVL0MmTrg7wkRWq2F0
	 tyoKAfAfxO2S/Rjanfx7eLdKthIIhA86fGcjuhRelD2Jbl9PGBp0HM7u8I+Oh4bSF+912
	 uVuhgxzkNZgXD25r5QmPIuqieUC3kN9VgZviyZ2FDOWTD4TJCJjsulHPA8EyOoyrwpSEa
	 1Aau+Y4nt88vHi9i4QSUDRr+Y2WlFp4tounzu+mYmI6XMRPPyJgfGAUhQZ7l0Yjc3Wspd
	 q1uBSZdfqbbtr0Intwz9FAST7WtI2MTJlS2nHrm5I1EmSHIDEYgsAKgdAg4RrflysAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BO3Yp9unh2V1wTLeFzft3ePYglqdWfjIv5tttgjyjiU=;
	b=YTP8aHXtRWHBByLEk4HRlcYBqDRDcDmVPZc+lyBFdXZ3ajEkNK1t0wW4Hh35m3MrISgM
	 thR+kl7OxAETwZ+2dfsYhO+mhYIG7THAUifeLeB9mi3UV8O3SfBi9GQQprblIA2TgPD9M
	 u/zQQy6nHq06uvW+/jGolB3vmwwUfog7+ZptMjhKGqOmFHXCU8oNIghT2FodPQNJZ331b
	 FlYTlQmh5c54VVvgPf7zSI7QEFZLC0jPaGe5YDuOR1TpF93Dz4XlDy9aLVQ6D8iIS4gMl
	 BCNsScAGi8f2QAz0YXVgqW5wEjh2NCI2iqeEnIpkIswP9cXu9SKQ4sx4l5CUT1fenSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DUTmj6nA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gi726EgE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3965A606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3965A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DUTmj6nA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gi726EgE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCG2cs1794931
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BO3Yp9unh2V1wTLeFzft3ePYglqdWfjIv5t
	ttgjyjiU=; b=DUTmj6nA5zutpO6ukbninK+Rq6kAscSnBFvCw5RAo/dSArsfWoq
	K7j2Fi4jYbWNhf0lAcy3kNbBRFksUroSEuv/HVqgVvl3Zl2lAjcvya/0Me47akUd
	UkRS2lqzG3HTP+BKf0ygCMIlQus69dHeN0oXsE/DI9yZJm2azQ+X3+0igxwfmkal
	cIWzbzEazgg8SRw/BEpEMp10hCSHBs9MF7Gtt2Liv2rRvT9Seq3OmEACyf2HhXAR
	35mBQMyQYZIVXvzYx+/IAYT7wY634vwIr8TVupx8LGcz4B78lSEPsGa1q2+gjGiP
	TAJq/YWno78goRXHl8hQURfHq4zJ4xdYehg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx1j98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:29:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869accaac2so1665638eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 04:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795436940; x=1796041740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BO3Yp9unh2V1wTLeFzft3ePYglqdWfjIv5tttgjyjiU=;
        b=gi726EgERCSZojQaqXBQ3MvTADSrPETLJ5o4Pii8s8u0aSE1dGxcORyPZAVpwAE/3d
         WZ+nALCve5fKx4QbIcZ1mstY+XJPk+AjzHW+xF/0FfUcFG61va2omnGFnV+sBnEgY4OZ
         oTb5gFr6fxqekui3MLwm57VYXYkJXF2QSO3s7SuU/SHgU7KEcvZ/c0NRrks+W8gnFv+Y
         hvkYHLH+LkG+bfe2M8+DYYoyqoY/T9fazDz6XpG3e03eLgp6UiJ9CQPnugGX3dpDciyC
         5+4kh9sq6GQu2OQ7V9CUNPcbsqfmfWRGoGl/LXUxqd1gqhgq2e5GQQ+3IDB73Pukgnzy
         BwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436940; x=1796041740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BO3Yp9unh2V1wTLeFzft3ePYglqdWfjIv5tttgjyjiU=;
        b=t8NPzheYC50EQkwrOQA7e4fstvcyUfr43UDIqxi2ZTJzJlKkACv4Sg0eDLJSZhAJn+
         GgdVhhSsM5RuY8b0vkQGtybK9JdZIZWtDrBXu+O87IRKgdcjYKpPjo3SmCXgXnwkMA8p
         cdDIyKqlGQQ8zUFn1iJjL/5v7K7k9mX0iUZBHxaFcw79n6bz2NVI+oTdx5Xk5iJGeibt
         p9/xmu9TVubf8Cy1Rbx0tbb53EkRojGDaXxJAfdnURadMG4xyXydV6/ITPwjJvf8NcbN
         sJdUwNETEUPfNO+/JXTgxwbR18RTDpCO8W+DpDfsc4VitGzzvhYue/kZULdM8O394n4f
         C96Q==
X-Forwarded-Encrypted: i=1; AL+hErGvy7/01b8n+VZqG79pewNtJcHYXge/+e6DocstTZ5YT/e93eAWnAQUilpounZcpfeeOMUsUFRPPrL/mi/H@vger.kernel.org
X-Gm-Message-State: APuU4Z+t16YB0CFaKrYSl4Kq1Ic/G4QFqK172saeBkStGeUE8/2pLG4B
	j3NdLD7YFM4vnlNevjC2h038ul9zSiTavD3OulZ9Ir/mkaFcfo1bcw3Kvs4PRGZbSwYdFQE06XN
	JyLwbIANpDjdCI8mcKLhpVXke9/4nvq4p15Ftr62DRY13s1UxEbBJRBaKsCCI5+XHZzWH
X-Gm-Gg: AZFdTZcH60ftYBfjEkfO8tm0YF5L8uRHuDYTw08+x3a6+Ev3wflcq9j9337HCIY8cf1
	Q1RsHzsXvXU6VFKMSas5oLFrCAkoagApKoWyO+cTfhsV6F2p2TBvJWkNjjJHEaizabX71MPH/RN
	Au21EQhmEhiLQ7w9VR3UmUt6gYMaTpTI0MJzizl3KcwPBD0ClrOoAkWUkw5kTrd4SoA/saG1Vuw
	+vO0TOX7Qkj0dtiVj3TafDp7YUB9uG0oswfrIJ3NurP6WdDp9NnbqRsu25UwGqBYPz4tLy0OB4F
	dSH9Q9qaT7yX4L/YwM827iwG1z6z1oHEoBmIamaXlrr/LDE4M7ejqNoNp3j9KHXqH3A9U34nokr
	c8jYoHp81MPHK/HHGdcO560jOyM1IJ9Pe50vkKRGNNMRaIF3uQx0SFPGL0BcPhHG/5dItbikzF/
	pzFA==
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr13809794eec.24.1795436939694;
        Mon, 23 Nov 2026 04:28:59 -0800 (PST)
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr13809758eec.24.1795436939099;
        Mon, 23 Nov 2026 04:28:59 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm41393571eec.26.2026.11.23.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:28:58 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support
Date: Mon, 23 Nov 2026 17:57:45 +0530
Message-ID: <20261123122857.2424213-1-akash.kumar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04318c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Qh-C87RQXQfsCYw_EDgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Ij1WZNPTlmsw_hfxxaok1djgW_yvo2qA
X-Proofpoint-GUID: Ij1WZNPTlmsw_hfxxaok1djgW_yvo2qA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0OSBTYWx0ZWRfXzNTGL+TnzDMj
 gAcdzGoUsU/jBxe85Et4EaX/rfkNp5QxVY2U+Ow6r1gBLWSfuXgWjJFmQ6g+8uLQXH9oGugXLuF
 QfzFfjdmRDRsQIqrZ/Ih+U+ZEkPNp3U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0OSBTYWx0ZWRfX1yhNhptGvhlf
 OSC+KRqEmqfwaHrr+onqcaLYFLWqVVhuTNYZ2OwwoEDMGK6TfIGnjQBCu/rj/ms9WnENDpuU0lK
 G84DlUok4KJ++gv7PvGMYZjl7iSYKw2Eqi4U6y28W4+0CwZF5/RAyf746Jc3vFix4rxKpac2wBj
 SRdj3LnODFKcVubeslqLxUuwVRmekRJUNqWH+YC8k0UaV/bpZNju9YhukeJ3Yin8DangghRU4FJ
 4NZoZGqvtiF6sMDk5W1nPz8BmV1vJTnglTqHJFGnu6wYKZMsctCfri53nf48P9apVAXzt71JBlL
 xGXmb4YZB1QzrF2P0WQisWoUBtep/cLS+H/i+OdixyypfiBiadvHEv3w0P4pgFd9ovuLH0zn3FV
 PRs7VH3ZE1aO2ppakUw0y50dYUtgYVZIp1W+TAw+mdmg8bA4YwYXWqe14soQol0d6VlA+byRw+1
 FaIs6GsLj6TTZ1qhPXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230049

Add the Cypress CYPD6129/CYPD6229 Type-C PD controllers used on the
Shikra CQM, CQS and IQS platforms, and wire up their connectors to
the corresponding USB controllers.

CQM and CQS each expose a single USB-C port driven by a CYPD6129 on
I2C3, connected to the HS-only usb_2 controller. IQS exposes two
USB-C ports driven by a CYPD6229 (CYPD6129-compatible) on I2C3: the
first port is HS-only and connects to usb_2, while the second port
carries both the HS and SuperSpeed lanes and connects to usb_1 and
its QMP SS PHY.

Both affected USB controllers are switched from the board-default
peripheral-only mode to OTG, so that the role-switch framework can
move them between host and device roles based on the data role the
PD controller negotiates.

The PD controller's interrupt line is routed through a TLMM pin and
marked as a wakeup source, since Type-C attach/detach and role
events need to wake the SoC. On IQS, the 5V VBUS boost supply is
driven by a GPIO rather than a PMIC rail, so it is modeled as a
regulator-fixed node, matching the existing boost-supply pattern
used elsewhere on Shikra/Purwa, and wired to both connectors via
vbus-supply, giving the regulator and connector frameworks control
over it instead of unconditionally latching it on with a GPIO hog.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 108 ++++++++++++++++++++
 3 files changed, 218 insertions(+)

Link to v3: https://lore.kernel.org/all/20261012094835.647882-1-akash.kumar@oss.qualcomm.com/
Link to v2: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/
Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Link to Driver and DT-binding change:
https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726

Changes in v4:
- Rewrote the commit message: this is a single patch, not a series;
  clarified that usb_2 is HS-only and usb_1 carries HS+SS.
- Dropped the unused ccg_typec_con0/ccg_typec_con1 connector labels.
- Replaced the re-declared `port { usb_2_dwc3_hs: endpoint {...} }`
  overrides with direct &usb_2_dwc3_hs overrides, since that label
  already exists (empty) in shikra.dtsi.
- IQS: converted the vbus_boost_5v GPIO hog into a regulator-fixed
  node and wired it to both connectors via vbus-supply.
- Kept `dr_mode = "otg"` on &usb_2 (and, for IQS, &usb_1): a separate
  commit (9b8dc188ffa6) already sets dr_mode = "peripheral" on these
  nodes generically for all EVK boards, so dropping it here would
  silently leave the ports in peripheral-only mode and break Type-C
  role switching. Happy to discuss further if I'm missing context.
---
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index bde3b7d81ace..46835a44cfbb 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -15,6 +15,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
@@ -29,6 +30,43 @@ &audiocorecc {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -79,6 +117,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &usb_1 {
 	dr_mode = "otg";
 };
@@ -106,6 +153,14 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&usb_2 {
+	dr_mode = "otg";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 2ded25c4304e..de058d2978a9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -15,6 +15,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
@@ -25,6 +26,43 @@ chosen {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -75,6 +113,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &usb_1 {
 	dr_mode = "otg";
 };
@@ -102,6 +149,14 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&usb_2 {
+	dr_mode = "otg";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 5df30ad8211f..4fde2ddb5393 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -15,6 +15,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
@@ -23,6 +24,84 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vbus_boost_5v: regulator-vbus-boost-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_boost_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 79 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6229", "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 50 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB2-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+			vbus-supply = <&vbus_boost_5v>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB3-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+			vbus-supply = <&vbus_boost_5v>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ccg_port_1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &remoteproc_cdsp {
@@ -67,6 +146,23 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio50";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
@@ -82,6 +178,18 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&ucsi_ccg_port_1_ss>;
+};
+
+&usb_2 {
+	dr_mode = "otg";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port0_hs>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
-- 
2.43.0

