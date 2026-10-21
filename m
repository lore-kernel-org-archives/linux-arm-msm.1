Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561108;
	b=vzBKB/2jPP2SZBDiCzbt9RIlEFrKruzvP6uOVr27qsuCXVnt7noeepf9h0c4SI9LBdSX
	 Qw2QU/tEI2amx799bPSgcuFrIwG+L/NFe5d+/jT/19iO0e4Qqn2+eT2R8+mLJA1ET7jOV
	 ZeRjGnD7LCIbgbapY8SQecjGiqrmLtgps86T0ylLeH9vLKC5/AnzP8j1JkPY4iWQrtwOa
	 f3bRvN2gEGcodeBZmHPACAby86e7c+9GxCv4axAZpvpEPXnc3qXhYL1FbQrqpWKE7om1d
	 V1Ac1Aexij3o74fSJ9SmswmkRmfkxgj3QFErgjD8NC0WClPVrPPQRqflkLExy4Dbbtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EnEZFbptyf7UjxQ2XRHIENyNVr3NaUlUd7vT/Jo1tl8=;
	b=H25//ZmXR/9q1uAVXpc73GDzSOgL1KB9mU8kPdUkXnQWK+ldP3eKbdiKKst6hFwn0z4y
	 zH8llcwffOPvKtMFARBRpkdtm0QbSffa+QiPPbGiJB6dXeAhR3GNupB5SIaYU/jIQC/o7
	 FjmIIHLJjCH0CyCvuF9roKSJag6GvGwb/lItIcuwdOJc3uRSvyBbCaOEZTrC7FscyRgGp
	 CRj0vXt88qpOh9LWn8vIO1WDtqAEXGK0Prqrt/p7MsTHCH/urK3PtF6303EHq/sRKRPXy
	 KK8S/hmMI8sUswfeHqti53OamidGE8aCehwSZmxdFShxIKgCRIYJKce6aYOm/+PMG5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QHzDQCAg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCfTrg8T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6713606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6713606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QHzDQCAg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCfTrg8T
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FD4c2392487
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EnEZFbptyf7UjxQ2XRHIENyN
	Vr3NaUlUd7vT/Jo1tl8=; b=QHzDQCAgXqWT7ejg19CeX0Lc176N0Dz5qMy5ut1s
	Q1Z504jw7O8loCumWMAY9PGsgOdHUcBlvjOo0ALJEaBjb1xcLzGwbD2oAFZ+txTA
	CS42PRvAZDAym0/A/QIY4evjSqT2gS3tdjmBvbM9bHhduwmRtoQMjP2EdsZ3sSBj
	rqeH34XOTDCU9X5kdCB5TT2Q+OcBXJeYV30w1RN3MqQT9lugQKACmxnzWOIpaKox
	tvSOxwq3SJiVrSsHZ7GdVeDI5Ap/799JGWX1Khmf9bDRV0VG0gTR88gvrA5+1nzl
	TlVGSkb8uOmlLEzmJ7c8cc6ySDivdFyx24At65Xh0p0wgg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99xkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:38:26 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so568777c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 22:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561105; x=1793165905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EnEZFbptyf7UjxQ2XRHIENyNVr3NaUlUd7vT/Jo1tl8=;
        b=CCfTrg8THRoVUsMvE8MN6fcjYL+DPlFxhzGg5neaciuZgkIAAWO9o7ZISWqJjvb6K9
         Tgi99ZjsXgmvfHu6VDRlHGdq8eHh7roKtKjaQ3zMFSgDZbIw9Tc3PmnfGRGT/hxlIbxE
         W/z2+0h6e9T6Nph65yszlzVZj2YUXm+9+4Q9zgss2CAQJ6Y57Yuqv7rIynM0T153cAsj
         XTvYyRz5MPuFagIaq3BA7ZTMBmwSPtjRYWJxxytrIjCESJ4j/Z3DtcLc0fWgjsAzNd6K
         Q3CjnNJowzt05D/f5UBwy8AXYuU93mxbpW8ZKgoUTwn5ioouC564DMfwmAEhQXUvRQXL
         DCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561105; x=1793165905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnEZFbptyf7UjxQ2XRHIENyNVr3NaUlUd7vT/Jo1tl8=;
        b=RrtZDwimot0UN4VtOBs80QxQlvFFVHRe72Rw9Fwk0KhcuviqKtrCBT4O9EqqYyhS7I
         pcGW7aki8fK+jdFoyLMhYPBNJIL6ZXUWirexFv8GbWEz8dGE6+UJcsfXr9p7aWaSNmCO
         ItUFfRHe8DqMmBXg+s7hidjXsBKXd/ZnVDcEsjaBpBe/Ml2oawAicWmjq9maenJuyRAl
         pxa5q8mjDGp5eZJpekdyVV3twaOl2PuLZ+tnRCH88vQC58DnVfUPP1onV103+bClGscw
         rEJJZzpaFBBuSDLcx2ft7QmtWttz21l8FTTsQP3+wwIe0P8EFQu/zoeJN1La8yytK1xo
         IK0w==
X-Forwarded-Encrypted: i=1; AKwUvBxQPPetFVP8wLjv6OySSZgfex9YqbebAbTQ3MT4S56fjJWVzaoPo4G3Q33oxWSyekPCSLGom005p1E7UyQS@vger.kernel.org
X-Gm-Message-State: AFq9FYIGK3HkHKaRvdCDfPjwss9D1dWlWq6vee68sZ1Fngmf3z4kAaNU
	Z+nx7pYDtSvJbshu39qv0tCgtjLdlWEPk0f1ep38mIxWLHM54YA+GprE60L1vhKwbk8hBmiqgyP
	IGousWdqc3gg6teV+MyXNrwMKeHW19OxIrNnPiFbptqXfM6fOD9bfND98yV4G/ObU4fQe
X-Gm-Gg: AYBFou1XgV6xjja7aB5+F3HtKqwrItBH3vIeIbPph9Yzdgiv0upRnWlQZI4bAMUMEZy
	Ej198J2B8JrkOKkL7DiSuftCa6pTYSiE1WNmqOdOCueh7ik38qw1Q8HFrtPljvT8SD2t+TkGd+5
	dAS+BQ4Q3VbzBotIWvEjJOtAq+Bl9205x1wk3f7V8RdjeYDQYkMUPoyLtmT2IBopo1HrpqxTs1J
	65tlxdFCytBZvlLRAVyRzUKbSpsest3GzXhV+ZL96YuQzgcUiTDOLqlf3swMHW5gjsgi7C0WmVw
	kCZLxHoWi67HdVXPIld/FrPMwtWsKiBovPJzkmhpzSD9+kT2sH65Rbl8j97Up76rc9bo1qQTl1s
	swpKmAOHcodYLoGgxK5Oi4jDiIBNZ+eiZtnLTnpZZqCsipbDwx48iiKWr7O9fYbvN2uuugPDeZg
	mE8Dij9pnCJqQX5h3xw7SQKRkf2Oo4LA==
X-Received: by 2002:a05:7022:6ba6:b0:16a:1fa:58cb with SMTP id a92af1059eb24-190a051e33emr1828680c88.1.1792561105184;
        Tue, 20 Oct 2026 22:38:25 -0700 (PDT)
X-Received: by 2002:a05:7022:6ba6:b0:16a:1fa:58cb with SMTP id a92af1059eb24-190a051e33emr1828623c88.1.1792561104341;
        Tue, 20 Oct 2026 22:38:24 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm3449053c88.17.2026.10.20.22.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:38:23 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:08:16 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP
 tables
Message-ID: <athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com>
References: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
 <20261017-calm-tangerine-marmot-2e8bfc@quoll>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0e04jeNFWWxIqaY/"
Content-Disposition: inline
In-Reply-To: <20261017-calm-tangerine-marmot-2e8bfc@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX4cuOH0Y4S+bv
 a0tG8vrDfskRw+BZcrEJvqBP4QHS6xY+pSRCAnIBKGylvpurk+QQrwKRNZvdjCZWVBZcM2lw/db
 Y8Jb1vs+rziadjqKfmxoeu4O8xbCKgo=
X-Proofpoint-GUID: RtLYT0UWecDtVNRYtFnp3JIENA8AHxrA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX3g2/NCLLZKdu
 bQNT8ux+r7LzaZTPWmTTK8iP0C0MlC6wPDtkEFK5yefSFxXTYZl56IHt6h15NuKEn+2fTzrEupk
 slI07LfX+ByrtNZ/G9RA8iQXsSU0P//CUgX6JROtt4dYALVdnF8H9Ltk4rmXqlSFZPPLvEnJk5/
 SbEH/WsahcqaeTbvKQuXNdQTArBVhX0DNXiAm/I94ymHLMUKYtpMBeLCljnN99VMfcmU2e8b4Wy
 BlQbnvmad+Mn7fVd3zE1OmJDrS99ubusiT8z1mhDi9F/dK2kIMYLv84r5nZ1rhvvn8D21PfzHq7
 wdQciTDt0B6N4Z8ZSuTjjLS0qmBKo2tSh2ymLHnFLjaveeUr0eltrvx9Geckh+JeAe3QKkm0wKr
 SJiCow1b1/FY1AY2qvGgOGLO9vfDaod6JNaE56ENV7JIMZ39K41wybL/HcWaKNh/JhgdlPoriWh
 0d0X0ehLyDnv3EOqN+Q==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad84fd2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=01MFGdCsChwvBfu0fykA:9 a=CjuIK1q_8ugA:10 a=GVWKzDYot3hTMZ8E5o4A:9
 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: RtLYT0UWecDtVNRYtFnp3JIENA8AHxrA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210021


--0e04jeNFWWxIqaY/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 17, 2026 at 06:45:53PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2026 at 04:25:28PM +0530, Varadarajan Narayanan wrote:
> > The OPP table node-name pattern also matches peripheral OPP tables on
> > supported SoCs. However, it only handles Qualcomm CPU and level OPP
> > compatibles, causing unevaluatedProperties errors for generic
> > operating-points-v2 tables.
>
> But the select should not select them. How can I reproduce the issue?

Sorry for the delay, it was a long weekend here.

With the attached patch, I get the following error.

$ make LLVM=-18 ARCH=arm64 CHECK_DTBS=1 qcom/ipq5210-rdp504.dtb
[...]
  DTC [C] arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb
arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: / (qcom,ipq5210-rdp504): opp-table-qup32mhz: Unevaluated properties are not allowed ('compatible', 'opp-32000000' were unexpected)
        from schema $id: http://devicetree.org/schemas/cpufreq/qcom-cpufreq-nvmem.yaml

Thanks
Varada

--0e04jeNFWWxIqaY/
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-arm64-dts-qcom-ipq5210-Add-I2C-nodes.patch"

From d207f72fc23fb328aa2c3cbe1f98780667f7bf10 Mon Sep 17 00:00:00 2001
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:24:54 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5210: Add I2C nodes

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../boot/dts/qcom/ipq5210-rdp504-common.dtsi  | 16 +++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi         | 47 +++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index b32daa7c1559..8068dd0d2119 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -59,6 +59,13 @@ vreg_misc_0p925: regulator-usb-0p925 {
 	};
 };
 
+&i2c0 {
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -191,6 +198,15 @@ clock-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-default-state {
+		qup-i2c0-pins {
+			pins = "gpio20", "gpio21";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 6842ac21e05f..80050845f965 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -160,6 +160,14 @@ opp-300000000 {
 		};
 	};
 
+	i2c_opp_table_32mhz: opp-table-qup32mhz {
+		compatible = "operating-points-v2";
+
+		opp-32000000 {
+			opp-hz = /bits/ 64 <32000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -435,6 +443,45 @@ uart1: serial@1a84000 {
 
 				status = "disabled";
 			};
+
+			i2c0: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@1a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a94000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {
-- 
2.34.1


--0e04jeNFWWxIqaY/--
