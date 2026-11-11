Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383547;
	b=i3+mpWWEgRNouSMJHRdJottARBgBTm6+WxPXa7y56yFl8xZwlUtWyNx4oGub0lBerVcc
	 ugjeWor/cYVpFsSX65VhtpWXSQwpRYZ9Zbz7ZlNDPj9r7Lw2IXTMUQ1U3+Cr5FIHhDo+P
	 ojrp9kPSvapziymJSIokgPwd54sLxWOiuY5lFC7YVzoUJtxJwqubFTlbA4V3qxh9PZIEp
	 MiyAOqqYx/mWtW6BaNrWrk/ww0L8UHrQdEbQ0Brsxsy7Y060+evPOdpd5AzC+Av7U00vh
	 sNt1623ExfQB4NJKubfpenFtvbkvuIihxnWIxKmUAAbIqDEvKQGsv8j5ChIKGnvXlBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NiUenwkxDfPWvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=;
	b=ertrmIlaOn4nQnpq0duHybwl5qq8YWgt7o4EG9cq8qvHDVAHMHu74bzDPDY/PWo9NLkD
	 P+61JJ7QMHcMQv5MKQ31hzyVEit3ny7lLnhN7RTz/qREC5o67Ps/D69VfBhHUZNxc73MC
	 0En8RAZggVsgKQbqjlWJcb1rSbYrdC6ZCD++rEb4+ZSnUEgqdKWIeL20iyF34ePHAaIM4
	 zme+NzETZq3YzkVu1CuX1UsNvjHsBr6FUfEc5pk0/biGmb2HUu+/XENSNsGcsbGpL3WDL
	 Q97TLIKT6wb8FUSuwWvpZj7obIKb23kgyjZJqYhF1ayOqRuh6jecKYGFkQcfFzpQrVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0lOIfoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A6go7/dj";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD5606A338
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DD5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0lOIfoB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A6go7/dj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KIYG1386358
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NiUenwkxDfP
	WvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=; b=O0lOIfoBMLVHN11pfZZlIUhedkF
	y3F8rS0txSdOodupl77BBUsJSDPfcm+ZiT+kwTFn6Xk0SzV/9g9ZF/s21IpEw8Ud
	B5jMuvJbRiDva1jD9xOpK6cJTNqxBERxIWiWjGuV98W3w2QR8K8SXJDaVNflaEU+
	YZU8ih+eUkNQHSPQ25bbLAL4Z4QDN3WDd4grGe0P8H0zipaoYPOugXpgcZP/jmwB
	L4scgibmyFetg1WUs3q3UQnZF7Q41AphInwM5QTLtoGHaXxDw7IXD5i0yPeFfnTi
	x9eAKjjODMz5XFcuCJ2W+ZVFe4twlqjOjqHsv6c6R20G9l89WxvV8iZYArQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm9fuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1714440eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383545; x=1794988345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiUenwkxDfPWvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=;
        b=A6go7/dj8VTd3c6YY+RxF7DM+PjShjloyMIyrAv63LgeI6Ut3i4sQm+n2fe5od+gsF
         lKWHajl9yuLUBlRzqFWlkzDlEiSdSsIyWo9I8pgLWSv8e3csiLcSZtEB6Xg2usW3yTpm
         msjQZo3/MR7skNPb45mOd4ly9SibAYYwfnqkMthEenGevpHmYhC23Q+NdfM+rYK3E/lc
         wrl+aynC2S3dCZ47XradP+Lwvq1ZDKLdVztlgERhA0PNSnvPnI3/iZbNDEWEUPPTsxoD
         l6o93b7lkxUzLNX/LZSQgrubeKu61MSAzVvjcLM/13kXiRsNAzBR00mcVbdMZ5+2UH+I
         eSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383545; x=1794988345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiUenwkxDfPWvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=;
        b=dDXwIx5i3czmB9wdTH4PBt5kdLjqxrT8i2KY4+7pYwDpTU/6iPw4KWnk5pp0g26b+/
         sdqYcrZrx1kMmPy4mzJQHqg+asUzjf2CiAZvMO2jf70TGs8ECj+D9GjDFweEpqwcfemF
         UzqUlqo1W3ji1YHmzFCA/6M2FHs77oBeG2GNtFEUM1jpBt9imagd6KIzLZlqCVJ27au9
         FiifMeZj4V1wShJIEdP2yWwNbKhDtUtjaeGOGZHPmM4c4+E9/UFqoA+AiLKkNokOeC1b
         2Z18Bv1vflY1ep4wCrFugUSXXVB0iclxHmt25pL7+/A76opD+SolZeQ1tK8fUi+FAb6p
         d0mQ==
X-Forwarded-Encrypted: i=1; AL+hErFEHGJUNMeza8QF9HYoDNa/MRCOukOxeiK7cmQKmPxneBWsTkk3pqLiBQtgVeMw6yOUzUnO5uh6d9UjJUje@vger.kernel.org
X-Gm-Message-State: APuU4Z/uADacAkobvkM86boxRmwo56fsq2DqVc7DUpXBAP3YMMMvRBPv
	qgINqFeCqufjtrozbcZ3S7yNTeQut0W7KWkwhHuGJmlkZH0bCHMe64YVbkJ4PaXliEdFO/XIH56
	323RuJidk5agOL4/u9QlL3UhpxPgPXKXarTLpNyrj38vnsVwDrRiF+wdLc5p4ZSVhaRFR
X-Gm-Gg: AYBFou0XbXqAXeG1vgpC0IQHH6wRj/IzIH8zHPzD0c+dTR9zI17UpvoDYa+l4+q+1Ic
	Q81ay5nVEu8jz/Vn1Yl6+LAaU18oT7SuFN8nrtsX8lGxAhbMb6HxLWHLPEWYU+C4HN4qWljc+ms
	F//Vr5C4aAtAn+vXN6MbV/LRAUAegUtXIND9dHNjBSiRjk+p3Bnir6OgR7YoZ42ILuKR5gNky3K
	XpV7GYkxIAbw1iV+++oXBLaZi0QHUF98gVHFZLykTy/M4MLUbYLYJRHT8kKXgt5QUoMGvhR8aeq
	FOkih+oT0k4ZCpswJckUdnfPOC82rmRdEnCSU0zOKBUyhx64zw6rfm9Lb1RqI9UQ5Bg1QxAAYXD
	bmZaZjMJpWS9d6l8z6e47rCoUy/j3JwMU3UHPX3GqyQrrEEoI5QWvATA5FK1UrfP23bbHcq73Bm
	La5ifU1T+XltjjpGmf86Uktl/mtWNawEIj
X-Received: by 2002:a05:693c:2291:b0:36c:9af3:22eb with SMTP id 5a478bee46e88-37686e2ef3cmr2164434eec.34.1794383544391;
        Tue, 10 Nov 2026 23:52:24 -0800 (PST)
X-Received: by 2002:a05:693c:2291:b0:36c:9af3:22eb with SMTP id 5a478bee46e88-37686e2ef3cmr2164398eec.34.1794383543873;
        Tue, 10 Nov 2026 23:52:23 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:23 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 6/7] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Wed, 11 Nov 2026 15:51:40 +0800
Message-ID: <20261111075141.3710366-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Qcy2GK4wfFoZkuiqmx0lleSpJeI0OiNG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfXxblQD7BN0C20
 zZGcn5Um7qOcTx1xYtnKXz/hmh0/kcFtSJgVCdTf8xqxcmutUmVwt3+eeED5a/aBamVkUERhnhW
 SQ3AdftQ1dH4eybpydwEako233M6PCA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX3MS8TOzK+eZa
 ZqlSEzDYsQDvpwB+ddBagrgdOhlWdnQ91MmCMQmWdxy/J/YQVbeJcp534MuSKaGzXSUE9LpViy+
 up8MkzAufJvKAI3N93J2jEmfDrXWQoN4UegUzr9x2uvNgvO+Gplg5gBDEo2yJocoAHIV08quYdu
 bbQw7I4VwvZjvCOXoEfJglm783I8vfHCTg0ER+YtoIH7VRNyKHYsw8kI3/mAcNC5v7D4gJuLH2J
 AqUtEwrj/ICn07kjUoZhNyMAmTiTsp1HpG82+SoCDwXKPn6AslNhDbYvfdeXR9mLn2ZbtC9Ueyf
 nzcMFQcQVJ5JtLuspeDNKcu/Znm01Hchrqy2gz+wFalf045IM0ocfX6+/dIHkIFBAf387PlAENq
 Sh0Fry+QqaSqG6ESJ19mc0Hi6eEySVkpx0bE2YPUxPMgqiaWNr4PKT0/156cC4vXsBhYDB0t+OX
 spbydXpUx3FxDRbDHZw==
X-Proofpoint-GUID: Qcy2GK4wfFoZkuiqmx0lleSpJeI0OiNG
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af41eb9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fkhy3qLzDainn0cAaKQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

