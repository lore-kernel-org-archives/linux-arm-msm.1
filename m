Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456723;
	b=cLgzuEobH86JJnoRc9sGmUViW4WYx+KBWst7uPBsL4+hz6cD6NkWOw7uPR8k495qBeQi
	 AKjixMYPX00x+BE9XpKYexjXtXTaOfkZ8egMV3FttKYhJ1uobKwSL1F159Y4Rab+RG3ld
	 fIHCIoO/1RP44bxATYZOg7KVMvxRXYhqcGUbN7m+Lg+cuPvxGz+06hCIN1jByG1SDEsc+
	 42l6UgPf1YckLViCDTxOzXir2HXpiKv1QZummU3OIRQSIHClRrX05NF7tMXBk6aBELRil
	 txQS5N/NeK8tQenI/Qx7x+wex7gp24pBFSva9nBxueQKonOMyP0jw98Li1+Uvl9X4eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1uIfte2UHyzL3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=;
	b=XtgIla5mQfDN8a1G5VMWg+GOwy0OuakmutXfJ2t4DvFkyBNFSoJGX24BK0fYaW4TheQB
	 cj3cD9qnJ8RxANBsDha8I8j081hXghPPj+0F8sIeG74nrGL699v2JFENtc8/+yF+/WrgN
	 YSuRLS5zEeLZ9KzDTbYyn9wvR44+e1vR6JVVYKRU4NrmkmrCex3nl0xrqXczthvncPT+x
	 TRObqsFeT5oiHBNeyzLr44tee86+jiua8qBTyIJ9CsU+DBqeUh9YMZNVir9ggWv8fKhLu
	 jg7FPuuzMpGWkx3xk8VLCv1pqdLxfgew3aHswsuQAZZxnGWpyHjPeph4gKa6ksIX6MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTQI0OQO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsb+ONc0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E37B606A323
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E37B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTQI0OQO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsb+ONc0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxrYj2161136
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1uIfte2UHyz
	L3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=; b=NTQI0OQOlsqFt1vvRumZyTlDdB2
	iROByswjnbYdROK4c3v9MnOZsZ7d2jv9PII6Dr4OgNHvlaPDBNMuVmVBiRcmrXW0
	cKtV7S81lv3Hs4jnI2kJP4Dj0GE/s03rU4NiqHrCSGGVEzviRfACFBxXqvKbHB3C
	9r6sKRoqTZgsQZkLtbJZFCFlfslS9zGoxslW9UrQpOygy9EDheN+jaRILBQws8Xm
	XgPAwxA1zcIIE34+hkiqrkXqeU9ypVc6XwtovnKuEXCNdCxDqqU963Q0put6ud0J
	p6e+5wZromGudGN8ljm2v4Zcg6lojft0RGu7KLfNUuFxDRqDwvceHl34ohw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2sa87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3707834eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456722; x=1794061522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uIfte2UHyzL3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=;
        b=bsb+ONc0hutBwpLrIzH1YDT3QbRUd7COJ6TZ5rMf1RnOPtqj4FPsk5gVbjBUgzQXz8
         ye5BzK4MDorGYLUlu+ABJJnlKd5TI5exDNueCvE5+as8Ox9pGFNYEfrYP6+akTeo0bGh
         CKs8H7YXf0AXDd1x21aEIXpdxbbvAFcbW/2ia8Www03yohvqe6890BY7VPpJU9ZRQi3r
         4DZJZhvQKzvP/1H0lFJrITBk0/bcbviU8kjkvQU/jMuNlcaxD0Ntt5UoCZcSZ0x74qbV
         n3xDCZfRsM2FgeKR9GB02vFP0IM1I4yUZVT7NLrKscgHAbRh2167lYN7h1mEJq9A3KJb
         61RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456722; x=1794061522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1uIfte2UHyzL3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=;
        b=1tRFOxwYaVyyT+H/9Z6XvH9meLk6cUdEFzuaytDpVrRh6m41Ov1wHYVwsWNR5p34hO
         MbG/zinLBHsnANeRXVs4/HVMsRxG4EDNELqp0HzPEy7pr80Tk2CaWZVUC/jorpnB3lu4
         8b9gZTNsUaYJzw532+8VaNX2y/TQJvdMsod2RiFfQBGsMAGhgBEapAAOCkjWDFe5fbEz
         Gr+Wyt99hLItJSv0sWOXPHdQctNGrE/j9pdSfnJp78D+wx6NQzu6ETlHfl0BbatC+RM0
         bQcdQlmvlGm344EBJzsQEfS41PczFngOCOh17hdPrhBx6cfYmwwTKNdNx/Wbq2j4AvAR
         ePCw==
X-Forwarded-Encrypted: i=1; AKwUvByPq1XOY3TGnBMaWqOR4mE4foqW8W98jShlg/0MmVsbh0zLO8qKPnju9X2YuS+XuDSOyNgcKh2XZyIAqwvq@vger.kernel.org
X-Gm-Message-State: AFq9FYIH9sYj5TTuiH5hhplRsAMHOrCxMdoZwE/A8CNIvUFIVCURDscd
	NT0tWbrA4thw1rDV9KllkXbQQTuolnfIVclcN0vVmuYs4kae8X1QKkSkxXNXmJGrK90iz/AsQmX
	uAy+dNuQaBF/sdeAnA0mBMMeZ8NxVJg3GvZ17DjK9Iah+LeSQZIWqlzfAScO5CVULqOMe
X-Gm-Gg: AYBFou3SyZAkcSzDa+Wx3zWppaaqSon3U9x12w7HGLJSt1g+N38bzHVRGuGwYqeXZTI
	UH8yTme0Dmfb9h2fdQ6moOKDgsJMt+X5iHLCJfbilDYv0RndN14reWIPzF3PSLbp/OliTTQ9NpR
	mXvZEJh53vXAKNwY6u6r6YdybKZioSRcdbrlNBjLAYapGV1yUHQ/fYAkjhe1tbj5g8k11ifMHBK
	jr0CUeH6tp0BXEkCAm6IoopgIlbdTpuZVPu0lcuf7upYOOhRSfEVdXlsyQdMyMjWEyMBXrSwGrc
	wK386mCWTbUhef/NiHcRUEVRdjbnqFAOmVgC8KF9+KCJFw7hvHrHCnp/QlAGQ+XRQ3l3iChjm9w
	yq6aPBbSB3IcrlEInTwYgP84RTQ+Gl2D6vOmgl3/5MF/GmCmGnF20VYEdSZduay3rA8R0JTYbe9
	wzvek8vqmCtOo+NWeB9+9A/jd8hv4TWsXS
X-Received: by 2002:a05:7301:1a15:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-36a42493bc4mr6951869eec.37.1793456721976;
        Sat, 31 Oct 2026 07:25:21 -0700 (PDT)
X-Received: by 2002:a05:7301:1a15:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-36a42493bc4mr6951838eec.37.1793456721306;
        Sat, 31 Oct 2026 07:25:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 6/7] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Sat, 31 Oct 2026 22:24:32 +0800
Message-ID: <20261031142433.1212809-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: Xj9e_NjenRT-kihKQXIk405Wuq8wDKue
X-Proofpoint-ORIG-GUID: Xj9e_NjenRT-kihKQXIk405Wuq8wDKue
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae5fa52 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fkhy3qLzDainn0cAaKQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfXx8GO9BwQ7DpT
 /VstsCJ+aS6w0ihpUfaTCJpO54sN6Qd9K2Ng4N1KYtYjRDofz4ctHEAtBWWPVvQBFTGP3n4vZlB
 3ARcddqYVT8p/cwxBXXnTdY4LMlqxKw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX2zRv4Hrs1leV
 asENxx/kiJjlzn+6NsHvM91iaM++9bz0fMr/XxDMFXrfTsZ+1re7ZDFKF8+WwCfZ3/tkmfc6K/8
 xREWyEtfMxTLSpN/QvfRv4FA3uBCbqEw33nNVvtT7zx7TMX21iI25ecFnMpl1prM6J/eAbR5ICo
 0ywSB+oW08KDywQGiV4mTho/oNvrhabRU499PhVI4tzg98sLVmiKltyRWkqReC5SnBi3KW/Zshm
 lBbSFUV5/F5gnqzmYSeLL0xGz4SW3PEYDp0LXWmitDjyzUT4wCiUyr72UpN3dSA9ZXVbM/XYGw5
 LxTCRDvgAl8BptlN0qNiUUwKAxMCTyUIkJHnyoWieX62f1JzGDpZHIEY6goIPAQjm+7F8x+S0Cr
 mc2SQCq7NLe961WUbhVGmjCv1C6ChypqXVUs4lrHTCXCnjxDBuwsaPP3ezr8Six6Fzk+5OsJhWq
 OJul/BnxU/+Zn7tuzQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord RRD carries a QCA6797AQ (WCN7850) LGA module on a
connectivity adapter card hanging off PCIe2.  Three PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH,
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail,
and PWR_CTRL2 (pmau0102_e GPIO7) enables the 1.9 V rail.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 111 ++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 98dab85de64d..b23c1a81a376 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,102 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_1p9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+		gpio = <&pmau0102_e_gpios 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vl_0p95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vm_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vh_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_wcn_3p3>;
+		vddio-supply = <&vreg_s3a_1p8>;
+		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
+		vdddig-supply = <&vreg_wcn_1p9>;
+		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
+		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -415,6 +511,21 @@ &pcie2 {
 &pcie2_port0 {
 	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie3 {
-- 
2.43.0

