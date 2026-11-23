Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467379;
	b=2WDZtA9qpGhM24xmzJ/dIlg2525I/PnAuKaYspSb0GNvjmZikWAMVw9rxr9N9ydbhH5W
	 SEpYZsQQV2Ooen5GpFiDPbZo0yA0yYwgQi32har+ByH/Yw8Cd9R5inEwlKFKmNdAlIfQ0
	 LxpF4N0wAsZMp50kiEaaYy54/IGD3rMdh6QTnO4UrcVJffpGSdyxOzmYkLrtwZ0yMRrBa
	 ZwA5DFNjN1qap5OCm/BXJx81Q1mjUND4krC16kjIh2973/Njh0vqrxEfu9O94shyl8err
	 Rmz7AZDn2xPeWJbxgqzaKYvGNJ8YWNJL9igGcjSGyItDnLBe/Ilh75kobMyYsX90ZJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
	b=v3L1iqIG0YJ2T7340E7bDgzeeYZuM2m+6HUJKdwYAfWwpp9HA+0XE/V1T5wYp5wswFDK
	 JSupga1CZzVmYzJAHSjbKzDeq8aW4uS/7Bsmg/gEFrDDKthVRnKT2x1v1l4EAy4feSl6e
	 YN7Rx+ecw11JwE9x7cYxg9ZLAVnS55g5/7RMSvPOREt7SvJw1DDoNGr8RMigkFJpP287s
	 zO4lxOpWciBklRn1QodV1uLV3b1RNWMim1iyTM5aOqFBqC3/XS81S5Hd2U19pJ1MfLtYv
	 EbyBktAa+Wwde2yb1cXx4IWsYGILEKgVotofRC1ILad10YbfxPF8gkpETYScuIJtQng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoyNcrf1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjCaLaHr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2849606A334
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2849606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoyNcrf1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjCaLaHr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuiZU3962956
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=; b=PoyNcrf1UJTCCSFM
	OZDfLj0txBnlx9abpng0AGg36Y/GVefkTUoiVav6wUTNW1aGZR2rGgxRSibv+J51
	PaPNGSLvIBd/Ot/FVAAsaWDwEwtVcLRKbYQ+TaeMfe8zXXe1OCWia62s3Lv+LgYv
	u4Th0xLmdBysF6TaqA2P2PVadMhQxF+FJlGkkR2GMXx8LZGuTavH/aXTcEhqCjt8
	siGLyrTUDEYziF9SZdg4jmpWP/kk7AnsTs9qAoSMC7C/UgBCEIjCEiE8EIKDuRC7
	dzgah3U/3zNb2lig5lgCWOrKRvEDhy30ffBV5WnV6AHQm4Xv474uRh/zH5xYARrY
	DMY02A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7u375-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so2012838eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467377; x=1796072177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
        b=WjCaLaHrx+MIa971TDIrXmWt+lfhOR0F67xIaoDkw+8IN+GjN5wBl+kOJbqTYjZTA1
         Rj2b2t0nrYvkLJ/uteq6lMAd5HcGXFe81GBnv5yT47G2X4BsnuzeUnOhm+QesTkfHt9Q
         6/gpY78x9tcDY4UuGLY5HSVMzn85nhYLwUVwczluCg9bZHv9S06ASTWSKr7zaBCe+ehK
         zjpHk9TZycrxDOdklfhSp23dheLzvTVCcCx/Io0O2gIOmMN8G0hcJwtVphjGu7NbIIra
         yghUny9IvMd2F9kGbM/4gY5wniHI6MoQwZHrSjRCOU+ndivrHS7/umwxj4dEc5Pcn7vP
         IM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467377; x=1796072177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
        b=vASmmrvlhaAUwOkEsYV2WxzZ5hCZehKlz46VHu86St8VjYipqla2PdgtQK4xNJZoOu
         UVmGjMa66ICqHNalnugCsdMzFfjpC804tAMf4YV5schY8VT4dWZWnOyPhbpnrPv37nnj
         l/WZ+7+PG7qoVCMxJeCo/M0iaWMcFp08q/8aSWlS3C6dJMoADLUsEWBZnMInztMaKRh9
         UjM+dyX2qBQqT5LokxxRR4LuRTWBEWSnnck9EzPwtQKNzHoORTmr4waDQPIT6h6YAKJL
         5+stBPJUNj0oeKcj4PgfPi/u4tDT66GjSSK4MZOC4QmJhPGLUSDTYzmWXw5Zs/WnLJbq
         8brg==
X-Forwarded-Encrypted: i=1; AL+hErGklPNjMbNtTvGwlvenQniN3iOBLN1KVyfdIEumF4kH4X42IneCyDma2b1Qkq4gdSqG+TTXPB07KxHOE2mV@vger.kernel.org
X-Gm-Message-State: APuU4Z+9Ogvvwu9KwLaBlHRAguajqfAnaQn6lhMacwNpfQ2P4nVV41fb
	RMz1tDtUU/DDXgmo2lEU0HXxcftl7NM4PLR08ubGG60MjKO++MrsGwv7AUWKb+3KZZ6xqcx6TR5
	MFp4+cym0ly/ptsaBHxYl0o+AOhvnfR2e40t7nJLEQt9zDlBuQViF0y0EF0Ku+mqFrQFr
X-Gm-Gg: AZFdTZcY0ms3QDu8i8VbruZmRey8T2PX1tXpoY2JvolbNi3YB1wCgTs53rWgIQ5oEpr
	xBw+NTAWejXZPWCiDenX+XiZqAD4TPFnhr57FVI2Hzs7znIwXfMIUi7orzCmf0OtrS7ln1gAKbv
	aA7BpsLcdCoUFq7drmuuS6PMjGMATQj2VyvApHWbzIF4/n2CDCSbsuT11IQ228iIEmhc81K+pCx
	2d4iZROHniltcqGUTQWZfBZKN+dSOygYZKSJwekypJFnZBwnYGM6fQ3hAlCXCgkrf3YGy6cR7/C
	m0krjl0y6TGPJdaUDtNlw1J2LYJAUbg8lM9JIQ4fyOt+V9XE9SdbJ7B63rdDAe44sWw0VpubIZ3
	yPiC6WOZwuxpC+XLWq7GL8JsU+cOoV4ygkBjOxSlscTk1wsYkybAFs19rTQ9C/j/a/XLl9zar/c
	CHCp995byl
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11275523eec.18.1795467376905;
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11275508eec.18.1795467376284;
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:51 +0530
Subject: [PATCH v5 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-11-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1270;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=47aN023hxv9OOnDCfygfziDOOhs2YVDNkTzqFv8vus8=;
 b=hM3yim468dCAZZp+27L7bqnFCF4BVqSMAsVAklDuWBZmBDI1auh+1HvrljOPuRq2pQrG5Fws4
 nZOhGgmi+RwDP0siclczf/aKCddVq5f5v0VoeRTAGrBt4uZK5IGGnhf
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04a871 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX+2w/xatdO91t
 9IzY9oLF5e5X4y8oXFwBJdLDhi5Ewr3U9AASkol5i9KdLyHPqxx/0BnehOTPLowp84t/I+KNASW
 eYfmtBJxh0IsXxfwBPucbc9gW17fwzJsnTdlySa/ItMzHuheJZxwZ5YqXzGD/QW7FLPqnoke8oq
 dF4ikw9iiwrwKF1oVrM8kd7zS98VNS6bb1RQbUAGddl5AjVCnX9ycXEHDBjI/FL2lliAvND4iKH
 YG7d09lsJWsekUaMnMTaTwkvS0HN6zthpK8szsHIXRGUnhYcU55TUAkUzrk8GIidYzqHxClO7tQ
 uLhAoD58Zevnc+Cu8LhC1d7bZivk6ATrfMU3r/XZAVvT4Lpl5JwwjWwzDKgS/XuEgog4sLdBNdl
 TBu6g/n27gdHPnsfQYc44mcqkid0zt6bvImPoNuHe3qU9stV+o1mbbRwRPxzc8QQk424YnT4ZIS
 WYQpPyGJfk0xE7GMefw==
X-Proofpoint-GUID: HAkLzr1CJeGU7iWJbKedmQQWWwstoa10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX+nvn6+NF2KEn
 6XvgD6B5pjLO8DxAxW1J5WS5yDBMjKLlaGlloLiHhUx1RNCPIK1i4yjazhOwZ7OSwkIn0wtvAyF
 RqixU/xmGXodfACi2VV8k4r49mn5eBo=
X-Proofpoint-ORIG-GUID: HAkLzr1CJeGU7iWJbKedmQQWWwstoa10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

