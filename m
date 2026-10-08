Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C6C48593C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450918; cv=none; b=hWic6RR+7SddAVdNB/IrA7PoKDAfUZPalUVv2YhdY1V8TajhYQEcHxmulaMb6dOPVmKfThj5SPbvJr8EN1tHMaJ72qnyz1KZnn7xA3xwXMsNxM/qRIxF7IK7JjGcDttOseH7EfkcbvojKlEblEztxaVb58Rg6LSWDoDu0MnK84s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450918; c=relaxed/simple;
	bh=FkxXvNYxJ98mZBbmVM3KPngHjCom1UwkID4dXjt154s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bIfNiTqUGHrYmttMQ73OWpgKyI8zq8qwf2QbizMtAJH+9RKOA9WzJ/X3fEDIzwoHzU8wC2S8tPg4lm06dUqQMcxNspmNmLiS04ORzZ6TxBCfSDxl5OIu2XNdw7xGKGOtQnTVJYAGnRXhtt6qWueAKu9PiL4fqjDx0by33xVMz0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBHDZ6u4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/PCegGd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBHDZ6u4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/PCegGd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K9qo1574571
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TT3PGl8LvF2JG0CTWFDVOG/zN355029NlSHfnwXBt8k=; b=SBHDZ6u4eqTPWi3c
	QUX5Ehc8uQ+B04Z4dfAyPxlYq+3MKwNriUDJM0ocXKmV77JYH1GUI6wPX0I/SWtw
	p7YBK2LZcbvxpPHUemxXxRgdLFmS+ivT9GpONLXDRMzNFLCmc+eHo3OGdoRQ148P
	EBqYS0yHoZI+ww2l48KPl6wEp+MYVhPIM9JlfoMHFNFhF++qHYzMmKWzKwKpA5tx
	venzWXEXmmHn9t5X0uMqM0QNMSjJiFVCmxM2cCRRPGyHmTwBDGnvQSFHwQK+V/uk
	G5K40Tockl4uCNIVA1ayfLjtrd3OiU6c8Zjm/oMblLKOWdQawvRXsceuJyJoqW73
	3ufzSg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe524yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:15:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510562ef98so6871580eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450909; x=1792055709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT3PGl8LvF2JG0CTWFDVOG/zN355029NlSHfnwXBt8k=;
        b=X/PCegGdGKGA1qa0JWkAH+Qi3gytKiIidK9dzBdkqPCot2kjiM1DkF6GIwgznrcBDw
         t2LafwhWpQsHhsCqgUsaL/EWEeBO6ZKT9sLBf4n7rkb1nv2GBwlInbWKxClzrZQhFljy
         D0woJvkYABtr7fYCjRd1mP7Di97wzwLzblU83aN1n/mXk2w41f2EddkwMdFyMElr5UK5
         Y2cC69YxYTnWzho28AnVr+eRG6wuCOcozqODv6x/keDI1fPz5hxvP7A2Bh5wXtOnbqe7
         xJc7sLDnEvmVPsc0SFIH9CAfCfzY8LDmML8DogSC5gA50lPhiSulUv29fXAlBiFsK9wv
         xzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450909; x=1792055709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TT3PGl8LvF2JG0CTWFDVOG/zN355029NlSHfnwXBt8k=;
        b=T3jFWlXg3qPm62MTnyHJTECdk4KIB/7hbk/oBNklDHwQX4cdUCnt4MNcMd4sSAenjz
         7nKRdq82aP5ltr8k+nYenGqhXYR2LWi1NafpEkjAON1+Kpjnt1buETD5cdarPnKVpS+N
         DuJOyeCtvPhb2KovdrymHtkBncudG50x4FLeXbuNf2FJ2q/BX8WpIzVI2Dgjkoew+B1T
         zA72SImoWTOEujSUieWkZGweDi1wrjCPekv8DFXSlN5kxbt0u+0r0DTL4O8cKHjXjy4N
         FXMSJFhq1a+2zg+WRBTErPZA8Ed1NnJpRNA89geXcRwwlOW2MzE1HCx5JY1IjD7IU/gY
         m5Cw==
X-Gm-Message-State: AFuF++mlzl3NSaHteYzitS6EEWuClB9EM5FJnKh279vC43J/tyDlvW2D
	OxGKMrfv8n7ba5WHeUrCPG4P/6TPMzb7h3ArFKiMN9Ss2Jrn5pQQNPtbjts9Tkge0jWl4iWn2Bt
	XUtNl8sGvEB8OETZ+yVezXKLAu/ByO5ZK1E3Ku+dCHKKESFAr6v1sJRWDs1vr2zGdfB/e
X-Gm-Gg: AYBFou2JWAYLV7lBYMCz9cXGiMsWgXNcB3z5mH0HCuRkACFjpEDwhHv4hZVp4Lyr3Gm
	G1thIe5FWOAIftNvhpNo04o9ul35malE8TBc/n6MYj//GOv0ezMj/bu9whnd269BsEZpFoIdsFN
	XyXLWZOeYzo8d1QPlzrzkVd04lHLeoXMkwpmgFbszH92gvUiztccXUbNtSTOWk0aJ3dw0705kM1
	9LmpdPu2CrjL9NU5sZfOe7i9d0D3Bfw9aCCYMb+3s7VAKEJTWiGF2q7iRLbm/GBjDngy+s58ESW
	6xorpWtmB0CQI497JgTr/137/be4nslpeiQQHCQ/SNjHXDfqXoM9WaQuG11hFuIyN/bNez2A79o
	FjsY80S8QShloSKgovcO/gMx2r0yjJiVQUF3sSEkh/r9bQlTxXS8c7N0QbeXecK6eMtvZ1WQPBw
	tXbXGbDjJE5NCAR28gYrKit7dr2cQz
X-Received: by 2002:a05:7022:296:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-16208248873mr5423239c88.41.1791450909027;
        Thu, 08 Oct 2026 02:15:09 -0700 (PDT)
X-Received: by 2002:a05:7022:296:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-16208248873mr5423181c88.41.1791450908234;
        Thu, 08 Oct 2026 02:15:08 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:29 +0530
Subject: [PATCH v6 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-9-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 3H9Z-8MgzDXZsCcrIcCeBoMokKtZS1hm
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac75f1d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GftUwNuSPIKaBOPN2qUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX6+jUoFamMEGZ
 WquEoi6mkG9Q7zQTJ46Kg8reiI013sVMmbQ1nHI/1myci1I3E4FdYNisJdyM9qVsIDEPOvxNg4n
 4AyJM25TZhaecRZzKKV52FOS8Cwc8hk=
X-Proofpoint-GUID: 3H9Z-8MgzDXZsCcrIcCeBoMokKtZS1hm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX++sdyoUm/+rk
 hnfXWLAsJ3jtyiDZzOmkVTil7deC0p0x5nRtzu3wDQQrHtSDB4o8kSwoSJh2UNUfkeqCsjpf2CU
 cb5H+2s/v3WvBKlPAmIvEkjDmoJijzM0sJe3uhw8bxlnSouNJMNe+65CrUwtQxnxSAkO1cNb5KX
 36MHyNNsM/e5eqKZe9FfH/Y6YHKEnQfOg/rMaKZuvGDtTC060oHYwinEjVugL4Am8uCH23QJTya
 3h+cNobM8ABmPdTTlXSUTEWx8a1iD4rnJsYuRCNgEfeh9P5Q1/NOl77taGod7rEz986eY79zngS
 WqPTXKXcvQ3duEVEO5JDooxeOs0HwI4by/U3ZB3H8vVqyGFJBEfvFwvU4IcHz3eVyhD1jf5LRB4
 EOs+AHeIqMSoskdWZP/NWzrPA7Xac3ZBC/PNPVWAxJLwxjoZBgTcsgRqcuLE0j5n903RdoneKU1
 3n0d7bp/qVGx8vvehtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 23 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 42 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index eceb6e0ca6fe..40926d1598e0 100644
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
@@ -195,6 +202,22 @@ clock-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-default-state {
+		qup-i2c0-scl-pins {
+			pins = "gpio20";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		qup-i2c0-sda-pins {
+			pins = "gpio21";
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
index 6440853da8c3..50ce79219fe2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -427,6 +427,48 @@ uart1: serial@1a84000 {
 
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
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				assigned-clock-rates = <32000000>;
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
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				assigned-clock-rates = <32000000>;
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
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				assigned-clock-rates = <32000000>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {

-- 
2.34.1

