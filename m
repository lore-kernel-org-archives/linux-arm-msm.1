Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714129;
	b=GEPLXrRo87zNJpgkHis6db2kuUZsT21ukOraJt+1S3kiK5zmG5rqNkp1S6GL9v2t6JxL
	 Ia/Jg933Oe6Jt16Dln4gKLooPprln80fQplOflRMlEhmMg0xw4pc2mltTrwza5XToUP1i
	 VDCx/4N0OjY2QYzAF8C6JsXZMdDxIhVQp0Yw3FiL/IdZPPHNjTqurYzOO2H9FjxFcQ8Mv
	 WGpgD2OS2jV2biml3syHBHdUOV3S5ZNJhG+dLMMsrhCIywhy2KNEcFaZWFnZLxCMKurCA
	 L07EWawXiPhxuswV26EnoyCNrCKCPCJ3ZN2YIzwg2hDHLSJs6T//qCEK/KFcU3CIF2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714129;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RGGoVzwW2HDCBFK5VU/M78LyYufR0TxxxGZE9yW4Y+4=;
	b=A4vxOxfaM1148cv6jn2OGZRy2wqA1xbg9lnWdctmst2gKLyTG7lVUsTjMM46f7p42EVp
	 ot0QZHIYqEBlBuXFssEOeJOzQK73LTQuochA4+8D0/qln8JIgJMXrSb/YjmSl7VbU5X4o
	 BRJDrz4CjA1M7r89/I6QsFwNPP1ziHAyO5+zJmjz4rz4qqHu7jXnfmNR57yeCxniUK2WV
	 Lk9vBDD93WWayE9ZRCUkmai1rkMALX5jhFn/crCKFeMSgY0VMSLm1VfTfG//zY3Fn4tlo
	 VbkRWyi9oNgeloD0EkbbLrsTSSrGRfqKu9xSvMxi70p5qy1QAfl9x7VnakSQIgy2Pew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUyVn7yx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OalehvIf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56416606A33E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56416606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUyVn7yx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OalehvIf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZKmW3002417
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 13:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RGGoVzwW2HD
	CBFK5VU/M78LyYufR0TxxxGZE9yW4Y+4=; b=ZUyVn7yx1DGfe8xEYm54nuNmeO3
	MFJZ56jKEdaT56voVowdDVggi/TdxMyHa6ZKws21z+vasBBKIMp/OXs8b8Gfng3Y
	wSkhLXfEaj/52NAxU4UkzNQMKCQnAbU/nWpwWDmIN5hNae4TAVP46buxP+oYO8hk
	XtM5mGvJ89tQfRThyGOU4GXcxcJRYU/G+iMt1Fgm3d0xa4sZChMclkS85pAR86lE
	q4v0/FBGZZUsyi5FY6nxDeJeeHoDUOfzk6O9BAMX9hSs+RA/1RfKlZOi0SUj5ukL
	UozxWlTg2TcHEWGmlyvqHHhthfkTxcqRKWr/X3C/a/EUVYfv/riZhAM7mdQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq08740s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:55:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso9952920eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714126; x=1794318926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGGoVzwW2HDCBFK5VU/M78LyYufR0TxxxGZE9yW4Y+4=;
        b=OalehvIfTb0t6VH0bxbF9A1MkUdfbbsNSO/Gkhup9pHKCtSMXyqVOu+ajkx7FY69Pc
         kNBBQXIdjUtkizRodLXFO3z4ptJ1najvNWSD8+R/TbSPqvB7IQkRTBFrNXNDutC+Scxb
         KbHw/Go+tVA9Hoq3UvpLIKl2z9gias7Wtz7AcjhWA8dSqhT5THYahEAAQ92+qD8lOgto
         LhMzEVaKkImuYo9kpuV1hdJ/azGkLpDvZgx68QOPA2BdU42i4PYzyTLTcaYsFJoweqrM
         509J8pITrc+Cq1mWnKD3T148QcxriVuAc4B8dYvfboCTL8zWgABOOK0NLon9ohDyJBct
         lMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714126; x=1794318926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGGoVzwW2HDCBFK5VU/M78LyYufR0TxxxGZE9yW4Y+4=;
        b=IiOTMwaX1LCCTH2AM8DZbjKcifXcNudcNJv3Utp9RB5WHknWzoFd16jMb4VzkPzU4g
         JDoM0h1o9maJBXxjsE6u6cYi6nRJrNh3apMZ7e6YaNsHYz29pERrl9+lC1QlceuNy2bj
         26Y8TJO8Tjbq76WjWbzaUelRUVXb5No02UsbFyeC9eanYe5HDnlKDYNF8wy5nBzVePPK
         pDh/lku9e+y7SjJrO+e0UIkfd1FOJNyJfBUzYgvQeiP4FRmUyyDELRxpd/O9rRbe7E+J
         O80BO0che+BCzSjE2jUpXuprhZ4l5TJcVejbibxI10zG+ilpofl0JjEgpfJux6LlHgKl
         voYw==
X-Forwarded-Encrypted: i=1; AKwUvBxi4ZTLqjHIHORlUHVj3PNj9UjYpfHwkNWw/Ix4AU9hGdA2GR/ZhfVv12t0QIYDCyzznSWlwmFA+dPwfD7p@vger.kernel.org
X-Gm-Message-State: APuU4Z/XckWjpGZltDEo3PvmdBDUgkvHFWiOmafNRcJzKbF99gtQbAan
	S5iK6OvV3AJIbj1xOLjYeg8CHk5qUSQVw+Mh29ZyCCsTbyoWJpNrUUi748cqtK+XyPWv2q+YgjV
	Ugdfyl+/jtezOQ/00qcivQ0MW1jNIy7pP5RJ4XIbce1o1h3W6zJ8NdO+/U5eLoB9VcYAq
X-Gm-Gg: AYBFou1dZz7oPkUsee3kX2tVbrVr/qW25DpJ0sQXDkR7469OlVLmavSl/cMactZgjYa
	Q8+c0OgR3A8VAUAu7oliWfVCVSAQO+ObBOAqvEGKZBV7sAvD8nYEdO0jqKMGc6knzUhzLJROpsa
	UOzK62NIfCaSXxU6Ha+ZpKLvCYEHaly4fkuQi8OIw4jC07idYgqKDRn53wIVf8CXNfqiXUehA0w
	lzIF+81HTH/j1hiFGQsNCyQ7CRsyblKtSj0Ik+Fy4bL3cKdo7RpSd/MLfXhzaqWdkpuZp5dm8eZ
	8MKD7HG+Zsp1tFex4B1ekks8vzKeVjEr2HM3+0f5MiwhxtHFyOstfWW98Fe4cMnqiZrJgEhVqIc
	loSd/r6DU9TFohoh3Wmz+P4P046qOVFJIyGJls6PHPacFnj6yYyl+9n64qcC4nCmwaM4mqfaKaG
	ZhyOhjQcnp9Fb8XHTamyP0pYBs3LEeVB64
X-Received: by 2002:a05:7022:eb42:20b0:190:3950:43e2 with SMTP id a92af1059eb24-1ac5a0b8867mr19874619c88.8.1793714125839;
        Tue, 03 Nov 2026 05:55:25 -0800 (PST)
X-Received: by 2002:a05:7022:eb42:20b0:190:3950:43e2 with SMTP id a92af1059eb24-1ac5a0b8867mr19874579c88.8.1793714125241;
        Tue, 03 Nov 2026 05:55:25 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm41634001c88.19.2026.11.03.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:55:24 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 1/2] arm64: dts: qcom: nord-ride-embedded: Add PMIC ADC thermistor channels
Date: Tue,  3 Nov 2026 21:54:44 +0800
Message-ID: <20261103135445.2049110-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
References: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXzgQFFS14HaJ3
 ID0PAd6U2eEj3w6EHkd3k2+BJVcIVvtV5s851KTmu2/xeVVovTk4xJTa5/BE3nXOo6kC/aLdFEu
 SOnr4P2z6CXNFSeTUpcYGJmh4kAMhKc=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9e7cf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=TEmDzvwZ9EAiO1TzxhoA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX2jn9q/YVGoWK
 6QZU6MJy6VEpHRr4BrOE5XpFrL6xXURftkSnvQXfJfOMrrFWNWC2pvGVdgZPPikRPQmV67OAf8F
 P7lz7vXQZ62BKTp5HW8VPt6nbKtYdrwanFHmci4IQPIBkuN1CzaG1Kb0eLvsaCWvDFogNTfHLBn
 Ipl86iWxBt2dOt/9F/3i69FN5r1TZg7gZG2G2gv8Oq0cIoh9p3hZ7kwSQDmfQTb/6jRjDMWrWd9
 zLfWfMJNrNptgCY4uG8d/9mTjxkwneg03JXenhjalcA+horGHWXpcoYrnRTxcU7hLSTj/5eMb+O
 nIW/SrjQ6MiSbvCIr9bOAzfqFJUZyvRrUqXF9b2G6kzgsdFSRylS5BFRUCqf+cbbc0ABrdIrwl3
 9xbtTSXTLMQatn3oA8vqpAI0O7YOaKGUD0UamWU57XJ3LRbHMiX1698QE9GnjT3D3cUf85rMmjV
 V2t3pAw0ck/czio65ng==
X-Proofpoint-ORIG-GUID: zFZRS29chgehKC2TUMRtEcAnFYVoRa-F
X-Proofpoint-GUID: zFZRS29chgehKC2TUMRtEcAnFYVoRa-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030055

From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>

The PMAU0102 (Kai_MV) ADC5 Gen3 controllers only expose the
REF_GND/1P25VREF/DIE_TEMP calibration channels, so no board thermistor
feeds the thermal framework.

On Nord Ride, three Kai AMUX pins are wired to thermistors: Kai
instance E's AMUX1 (SDRAM3 THERM) and Kai instance I's AMUX1/AMUX2
(SDRAM1 THERM, UFS THERM). The remaining Kai AMUX pins monitor voltage
rails.

Mark all Kai ADCs as thermal sensor providers in the PMIC dtsi, as it
is a PMIC capability, and describe the thermistor channels with
qcom,adc-tm and their thermal zones in the board DT, since the wiring
is board specific.

Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   |  8 ++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..550cd7fe0ac1 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,62 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	thermal-zones {
+		sdram3_thermal: sdram3-thermal {
+			thermal-sensors = <&pmau0102_e_adc ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sdram1_thermal: sdram1-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		ufs_thermal: ufs-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +422,34 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pmau0102_e_adc {
+	channel@444 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+		label = "pmau0102_e_sdram3_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
+&pmau0102_i_adc {
+	channel@844 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+		label = "pmau0102_i_sdram1_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+
+	channel@845 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+		label = "pmau0102_i_ufs_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
diff --git a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
index 47ea145f4abb..26c4d126a23b 100644
--- a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
@@ -31,6 +31,7 @@ pmau0102_e_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x4 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@400 {
 				reg = <ADC5_GEN3_REF_GND(4)>;
@@ -84,6 +85,7 @@ pmau0102_f_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x5 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@500 {
 				reg = <ADC5_GEN3_REF_GND(5)>;
@@ -137,6 +139,7 @@ pmau0102_g_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x6 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@600 {
 				reg = <ADC5_GEN3_REF_GND(6)>;
@@ -190,6 +193,7 @@ pmau0102_h_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x7 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@700 {
 				reg = <ADC5_GEN3_REF_GND(7)>;
@@ -243,6 +247,7 @@ pmau0102_i_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x8 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@800 {
 				reg = <ADC5_GEN3_REF_GND(8)>;
@@ -296,6 +301,7 @@ pmau0102_j_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x9 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@900 {
 				reg = <ADC5_GEN3_REF_GND(9)>;
@@ -349,6 +355,7 @@ pmau0102_k_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0xa 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@a00 {
 				reg = <ADC5_GEN3_REF_GND(0xa)>;
@@ -402,6 +409,7 @@ pmau0102_l_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0xb 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@b00 {
 				reg = <ADC5_GEN3_REF_GND(0xb)>;
-- 
2.43.0

