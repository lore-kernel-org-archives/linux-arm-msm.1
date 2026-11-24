Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542559;
	b=JTWZb8dzfusSrULgOz2ZGLbSeDXHJMhHIgAaMkG99Ij+hr4ELMbO7Qh3Eq4Z8xWjNNop
	 xu9dHAIGXLGDZwLfsRIYBZg46J0jZK4EvCPFhWPcYy427EiVUkuCS3gZ6ka7uLHVPK6I9
	 xpRLnyvRneRxEA1j0yjgO8jkrcpRDnoLi9HSqkXkRDeMjwQ/nZySXV77NP2lwa83mypaF
	 okVIIGUGEsmcgB8+4qHNEQbTXxg3kVS7M0sKVBz5dANWtJd1kcqB9bAah2dKAhDuBXv8a
	 g5z0GD9f90t+5cr12dZDFsIoyQ9rbLS5I0ZudJ5E3OE+HGLYU2TYJDYt5wevBKthwxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=;
	b=uDxMniU26HLi3cY9H4ojWduvdv1SA+egaSr60Alm3AcKIQPEIvdO58K2j4YgX5EpCwXU
	 lMK2qzxOtxAVdgCgLAMbWF+gKtWAYCNd5y7j6jj6tTA7AjxVxRxnFRu/zZkOWbJvEp8yo
	 lJvWAhTh2oubCNiDNNon+I2tzrpGJYr64rS3WOOt90v/0JAsH2QVZQcW0XuTV9Y7H3lda
	 5gh8MT+dGTcSNqNfqNQREyVhI0mJ3+RFCHnCp2/96pf9AROqPpBZst/tAPXv8xb3XCN4G
	 N0QrVI+hQ2183twbnhUHtpx8yCZM0TidPj7PIN+fom9CxcIa8NvnkzquCHFXnwxkvzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aBJSctzz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SdJARYbt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5828D606A33E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5828D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aBJSctzz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SdJARYbt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL9HF1184019
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=; b=aBJSctzzFJkx4XTq
	QVlCkgmgoNiS4ygeu58LQLgHbiKTABuGbpyTtkPOtJ3cKy0DpQ8dy9Hs3S9IEeWs
	V5zItmodZd1GAexTxjGoyCrY3190eNx8PTXG04hZiBglzo7oeLnzZ2Ma9BWk05yW
	c+3l5Vpp/vLdXqZYibG+US5IcrTdrxEsJhPt0caD2gnUmDQGFAFvk3VDExVl3MB9
	HJAK0Tk6VdKvl/3gvU+rEcJWFmceAa+IwbFvibLYeyFOwtqMFt5zjrwYalgjz9A9
	YCuQC4WTb0My3bkJKkwAO1GHOgpcXRq5GU0bsCGuLzDExeun5B4Ds5qHQ91rl0ra
	EBGWVQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky42ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:49:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92114c39cadso91267016d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542558; x=1796147358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=;
        b=SdJARYbtBtVmBOVpfGzktaBa0llQFCZNIRwUd+S4OkVUX5QPyCTdfKx8fAICWZ7MC0
         iNQeQ0sj4QzlRdM94rlpZ4Gukmzrz047NRA8TdBehkoEbCsD+L11hVFH2DQo52/nPeXW
         7Ajg3/wXwFaaqdbo1yo+XyTyLoOd/5ZVWNAHWa1KlsQ1sHYAyLCLJLeHLQLpgQlk4tyE
         7exITYWnSdS7/GuSI6RHsEHTn4JSXCzWtV6EVTjbSGkTCFqr4JqkUrQCb3mSFTAz9uqr
         bA86sNARS9WABYRZn3iu0Wz4Mc2VdvD12qCtpn0shqFyUvUGAnyy/gTLEhOn5uoYIx+O
         wMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542558; x=1796147358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=;
        b=p7iI/twBogBQbr4yror0XX5BLo9If3E9DMjqbibm3NDoniDyG5nSX31JDmchJ4alc/
         7OzgHfzJlmNkvljOavYKWGLD8GMSO2h4OEB/YewvMLL8KcrB3T6cBX5czmyVsQYIPnKo
         b/hjvi9pzGTngKRseyU+J1EAswxLOA4mtAVQVKM1KA5Bs7Nt7XsisJouzegUmRo7If/+
         9cpu1IbFw5MAfb4xooC104fgxKFRYosRZHNRn8yhdKsqGm/xDpoUGFw2wQ/TLOZXwy/m
         AuIyORpRIMkOgfHZ7Z3Rdcs68zMXnTaDUYsrzQ1mSb7PldZFWa2DX1WAHwOBohbRg45t
         o71Q==
X-Gm-Message-State: APuU4Z8mC7nBBzD0i59E7OjIVkQLCjeoQAAcZ7JJkWoZxm6flr+/nRhp
	URjGXqVRvP6urXJAvpF9Pg2hN78arNLyuE/cl3PwboOddobJF3WhIno8Gh/EIK+9D0B6l4pqBAv
	8AnPNJm24K6mvxe5wib0zNtUl60sk41KEcXtWI51PR4XUw/hhz7h7vhTofERfVpLrdxW2
X-Gm-Gg: AZFdTZfo98vZTzRT91NOJGPUvYK7tw12st+xcC0vLNCkiOrYcQ8jd4yCEifO7f/fGrg
	xRlD9mlkNhGMBxl7oRSizmqjZBLXjBBLUJw7FRmTI14JYTF0Nmue7nlQJeh6I4d2zzN3GjhBfcl
	zo1MbQD8C3PZlvh6OUaun33w6TvubLMxg8dplkRS/9+WisV9s3MjWfZBQ4U5qmqwog/d6qBuSkC
	R7WFgW1K3xzppvRKDxTpjV0m4SXt/9NUeo/dcnXRBYIpgglcsoYvExtXmaoGU51W+CKGeS4MAfO
	VndQ8qWZA0/LTV89zbnEKfCrW2Vvrc0DSlp0sN6adbjO0w7grawB8Z7KeBOqrp4h0ogdPgPCENw
	nHvMyJNVnraEJdLwVp6jLq0NuER3SkohXnM8Jn44jox1/F7VzGEgSrum/dC5IUniB5mC283E6zg
	A0u2gVNvmAyMOl
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr2688327385a.81.1795542557762;
        Tue, 24 Nov 2026 09:49:17 -0800 (PST)
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr2688284585a.81.1795542552469;
        Tue, 24 Nov 2026 09:49:12 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm6899678a12.14.2026.11.24.09.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:49:11 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:48:52 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
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
Message-Id: <20261124-qcm2290-eud-dts-v3-2-b3e5af3701e7@oss.qualcomm.com>
References: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05ce1e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FHn9pCZiDirsiwHFROYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: PLMP8xCb1W4nEBRG4Gyf7fg9AfzCDK5G
X-Proofpoint-ORIG-GUID: PLMP8xCb1W4nEBRG4Gyf7fg9AfzCDK5G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX03JzQYbHZHPh
 eCFA2rpRbNrzsIyCSrSXNSEnFS/sPPiaOw91XsD0y0v3oWoPJAVYyavTNr6j97HydPzCSjKa5uM
 O6gsV+SfAo44bmX/uJCeyCThc0Snl1s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX+mQdcFphXykC
 +vPVWQDi9hs/aaxG9ST4WmyOnsc0kq9b926WhIwLfsuyuh0bTz21ByubZmtHdMFPbcJ6/0XAzuh
 O5DfzcgfXpNhF49i0/zN8f3zvkCIpaqF21ksfda0uCYUIKAqnYWSutvJ2uWmkJ6NGJIAx+zSUXa
 Ysw0epbeezZSC1CZWbciqv5QJ6r4bjNWjvQtev1KSgOGDKh1OWgseL4PtsvMqF/0v4Di7ku8XNX
 6ow2lj930lZO+YgPA7QPhzH4Jh7m8EOGIvGXkkNqlQ4jNuR//AOGBtGL5/p2uUq3NjlYDagPVew
 ahyde/wmIetR7Cxye5QjQX9Nr6vuSRXsHqBEyaWpIiN0ZYMH1NzJp+EhM/U57+Df2NZkhmfRWLR
 b/d0E02djen3CN5sXOGHbEod/DHFa7ZDEnVMedkO/FlsgYW2p6lvpezBtDCF3E/Xv6Df+n7dgnc
 xDRDj5f9SL/AAowifow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069

Describe the EUD:

- its CSRs at 0x1610000 and the mode manager register at 0x1612000;
- TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
  syscon;
- its interrupt (eud_int[1], GIC SPI 189).

Hook its port to a second endpoint of the dwc3 high-speed port so the
driver finds the role switch, while the board keeps the first endpoint
for its connector.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index ea9b39b1ed43..ac7a653a6f03 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -826,6 +826,30 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,qcm2290-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+
+			qcom,tcsr-reg = <&tcsr_regs 0x25018>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					eud_ep: endpoint {
+						remote-endpoint = <&usb_dwc3_hs_eud>;
+					};
+				};
+			};
+		};
+
 		usb_hsphy: phy@1613000 {
 			compatible = "qcom,qcm2290-qusb2-phy";
 			reg = <0x0 0x01613000 0x0 0x180>;
@@ -1680,8 +1704,16 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 
-					usb_dwc3_hs: endpoint {
+					usb_dwc3_hs: endpoint@0 {
+						reg = <0>;
+					};
+
+					usb_dwc3_hs_eud: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&eud_ep>;
 					};
 				};
 

-- 
2.53.0

