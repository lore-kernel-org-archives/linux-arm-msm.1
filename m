Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956896;
	b=lMsrbFBW7ONOJdQrOavNr7sG4V0kqQRV912u8KRwsSVZpMwpPDjTnDBgydECFbzxfFAT
	 rrHoIx6aey5wY+grpGsejTM4VMNrmEQCmg/BB5R0ZkC8+1lg9yhvg2rZrJl2eVK48Nfhc
	 QWFvjbrZpilqEf8XDfoQWzeeGf9h6wgI60qKbMvrOEFAPCUyrXJ7ZC/oAvURWMN0Y4Y2B
	 zYjEnW/AwWIfCs+lbFYqEbo4P2VBEOQxxMdyig5sRvQEZYFtO8wDrQtSinFSRf72Ee/tl
	 Svz2rWuvys1rVu8Amx61Xy9xmlXOCBvK9pWyYagm2cpYz+oZK86+b52/SonbnQVRBSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=;
	b=c0sj42U6l3S1WDz3RVWKdalV0SbSvNNUa5GD8hxVVuYP9VIIGyj5P5Fg2Mok3NrSF/45
	 KzD/q0oFgzL3HS3OEJU3r6M9HBZIrFYLdPya1K5Ooj2ea45R2uccCbhO3bcCygRKCm4kk
	 3jPh9KDiwS57I2Bq5d2g+5o1x2//bQKpf2f125M8G+IKdIKlf7ayQHLUFsZ6FUWv8qkDD
	 5mjqeoZIjn4dR0I3vO9/Hs4ydlLWwfxRB9h7HTv61m4BFh7QgefUGUxWImMtwTZx4MuND
	 C6wCUSGQU6MPo6qcZRcKpGAmCrQvqjqHxIH3iVeKfWBeMsreOnNMW16GngREi46xLFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4IlxSFI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dFU5DdQW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9119606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9119606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4IlxSFI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dFU5DdQW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R95m2333817
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=; b=Z4IlxSFIL+pobaJc
	0qjpSlK+alP4nHRIUxD/FVE00iaZ6Ods0VoXZuA3oh3ntw0HDMMNn+CixA+eilUn
	g46G/0iKOFXVOrDoHozqySbsK6KNx/pYhJ47kizVEdispKhyu8T27sMYUeKiVUNn
	K3HNHPPjHLpSvbzx/8rH4VtFT+XxNcLJcXhPHlK6OkOMTXBnCBj89+2OEZkvLSae
	Kb8BXL884j3HGPAsNfOFiAbllQ9MeG6W+8P8uGtVsJHQJa9p7sipABIvAO59iX2s
	efvLDQO/h4fxHVtYD3BMfBq75mBw35FxK4MTvMtqd1CF0tHUzO2ttNH+sZBkk8cg
	m+vZ0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9a5m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso549007eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956895; x=1794561695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=;
        b=dFU5DdQWbznxAPj+qG80P6QLJDPdchNlYDi8dQ4l6qgBZ7OfN9B+mDOLcdT2/AagTh
         URE7O8yl1EI42gPkyv+ItEJ3HTNbIkYxKPCMiYGM4x0hmgy5iW1GwJQVvr3NDSGf75sh
         D/58GWX2+w7NOQdDtOdIKEEDYLM3hbbBjPJklN3rJ2LZ0CsPnyta74fffbzFn40z8p0l
         1SjbW6b8D0Be3OHPC5LppCUmVaj0jpbdHL9PxGucb5waSZiuMEflZeikj1b58OMafkUu
         g6mZ4xaWq4NrAwWuq7ti5Np/2UpGxiq0eowvweDw1T+crmQUzX7rsDR9RqYaFD7bdJxG
         oczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956895; x=1794561695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=;
        b=IX9wrUIqymBMBtBiAhZUVmqGPmpxOyRENd7Pp3fL4uv5dCDJRGtYuQa3nfDJzZZLQC
         6S4AeYDznHml4Sp0Zug3M7TZYJZ0kO2gF33pfuWuPaMjKSerLjNQqnfXSh54+19htMHj
         DAlPhWhGalwtyNZtp2kFd0vwQYraphydRWWrVSDxwFaLxQqS1QVyg6mh1Fvih4+7q4HV
         gnPeHYzDtn2tmcO5W/vWAEm9monIWdGID+EGeraU2T+RIWNlqPu3KUn1lriFUz+0Sid3
         HYKYAiVfpTwXZobj/choBkuoSvnkY9dM18DiYR4DSk44XQLI1uhwdBjccirbPPEIxTAd
         ytVg==
X-Gm-Message-State: APuU4Z9FW+AZp1L/R0yO6xnVfxGY28DSA2/wJs27ngz+oS00EPqyYI1W
	w3hPWtPacGtjtJaNo7q+ZNh5dXy2xEfVLIsmp5bSukB594NmJ+xj4dS67WHAKAzeu7GyqCdvUUC
	qMfX1Lu3m4/XXMC1WwGXaCvnVIINd5NA7Y98ktAmN46yOkcE25TbQhVLp6SpudsttV79/
X-Gm-Gg: AYBFou2W9VZ8crdXKdLpm+l+J8/N7D3hFPXI+A/4rkl4heiXWoieUP2nHwHyrzbx568
	0j0ltRyWRF/WM7ru3Q2gQv8MV5zCN8fAbIz8On042Zo0HTc40lOHaCo1A05nRrPZDsb17+BADIo
	69rgfkCWSOcL2llBJbouPo8mt7birmhZ4Ptid9kfQyCwgRACvfrezR0jYFXSwPV6E32fOp3p6D0
	2Db+Nwh7iko5pdrEDM3B4GSooOhb9u1kdvk18RCp7SlGW+H3vd9xJaPiKGiCvCVAlRWklPststg
	wL269Olaj9SgTndDkVUO3vc6+8VorZCAuBNo/1HS/mMTOEIzN8d0O9pDKKMGacbzArTwx1Oqqz+
	ew4IaBKtjr/4GtjrIRub7lnL0y7zpvYs0xFvO+F8IxjVXFdXNmRXVuLjBkck1+Kc1qfdnagWbb2
	JYTyGg7I8Y/MNNZndjXV3SPmARmdPBCqhbeSiIZxJenEEQRL7Eppzdcp+QtgNe1MUthVkRhByNK
	cBftA==
X-Received: by 2002:a05:7301:795:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36f76a18d9bmr2591662eec.33.1793956894445;
        Fri, 06 Nov 2026 01:21:34 -0800 (PST)
X-Received: by 2002:a05:7301:795:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36f76a18d9bmr2591639eec.33.1793956893978;
        Fri, 06 Nov 2026 01:21:33 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:33 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:55 +0530
Subject: [PATCH v8 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
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
Message-Id: <20261106-08-dts-v8-6-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: u1sQklHxTGTi1C53BGT-vIwvdJ1h7kr6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXzkgmGROEgrHN
 pWoonGSYZfjBGMdEUKnNw/0S5pqWNODHtdMXGziXOmIUT6lEbmrIKsQUuEA6Kn96SalSd2Y5fgg
 dIuEYsUWty37zX6K63s0aJX/63vgPl8SmN9gZ5orLHZ0pU+84Mcua1xVnTTFYbHmiHgcfLehz9x
 8VvPGMr+SwDSWEFIXSAnq4oMTlrr9MMfx+AwFBypojibIhGoefq3mBoJiD0g+12NxONStG/IVIh
 iyeBv5Bxh7rxr3fb8t/qYeszBXM93B/gOyk6ieWiTaSU9U8mrOwt6bznQyxDumjHL064rVdTxkt
 kk+nlzcb5BKx/fHpMic+9+hjZBwYcfYQVkKjsO2g9XWV8b2IM2eZvQrkBZi5x2VkCLLasZ17wdi
 2/J+rcPo0MNHaaDdFEyMHSxpTO/+yMT2I1rJaxDKTS0MO6DXkYrkH+EZfiDpIGeBImK5yPnQZFr
 IjwrjkDwgRdkXyza1SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX7UlU3YOMbHpn
 omOdjU8oKuSDQGDtCy7Uox5mNgS0eiapV+NG77WWTB5G3yB8vWv/9C13TwzPyjrBec4YCt4AoM2
 Jlce1YZxjI5Tg7Ix6WHuTWS4e62K2+E=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed9c1f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oTQqOnWIMzOobJ4mAXcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: u1sQklHxTGTi1C53BGT-vIwvdJ1h7kr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Describe the SDHCI ICE register region and clock, and enable CQE support
for the IPQ5210 SDHCI controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  4 ++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index e5f2f9217f3b..5715022db6c6 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -15,3 +15,7 @@ / {
 &sdhc {
 	status = "okay";
 };
+
+&sdhc_ice {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 6dfc89903d2f..705d7ed48713 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -151,6 +151,14 @@ opp-1416000000 {
 		};
 	};
 
+	sdhc_opp_table_300mhz: opp-table-300mhz {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -432,6 +440,21 @@ sdhc: mmc@7804000 {
 				      "core",
 				      "xo";
 			non-removable;
+			operating-points-v2 = <&sdhc_opp_table_300mhz>;
+			supports-cqe;
+
+			status = "disabled";
+		};
+
+		sdhc_ice: crypto@7808000 {
+			compatible = "qcom,ipq5210-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x07808000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
 
 			status = "disabled";
 		};

-- 
2.34.1

