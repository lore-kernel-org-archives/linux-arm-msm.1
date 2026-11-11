Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383537;
	b=Q19mlffkqF44s6hyi/jhNN7aJ5eFBHdLEQyjRdQHzWXS++IopMCK1GEbVEVCbGsp0DbH
	 nM+cEPvnVWMh+RUQKLtfmBD5XQ+zJe1jfJFuRmj7Fpddiyx9WgNR9oXDgi5J8eTEeQkFh
	 //PjB8gDRjneuMSqY/Tec1oZ2hMuD0+dcA9pqfUqHPi0GFTF1/QJUm7CnNbY2GzBr1jBD
	 lFdGUKUXbE9W3c/1wdWnsCNeZfvNfdilNPw19Jgkgi2tQVO0ynJQrhQvTKbgyXCowUU+i
	 GwL1SpcK4MFliA8yWeqLklg7ZTrdKZHvSIu8T8llIoJuvpcrpKNdGeZ9p/EfpS+Zf0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QzPcCIEIvOS8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=;
	b=J6TiVgVWKdL52LAjOzeYCdi9EbEU28AARO+Ku5FzJfmTxoDQwzGmRmVxllcMGD8A39VD
	 zygeSK8FbqXpabw0K25QglPwe5W8q6nX9yGtEVaRBmy6Fu+PTBMZxbtcCvnDTifQvqhKY
	 oabs/2p+TWT0W2GzZ7Z8ZntNnc/VqIkoWW4szrY8z908Rn/bKdWrB1ZzT/F+UEIBQwwRA
	 xOMKM0tGFvS9xGRTNFJvl5I+WNgbhF52fyXn7HQAWMe2C0Vcu9GCvyECD8jBYQttMagUm
	 D24EWyWHY5zHa0MEvJNbh6Wcf9AfYB0fREh0sBGcF/vfqhkZORMK7hsYtLViDZQQlKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oxPVj4CA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MsWj7l1G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AD560A260A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69AD560A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oxPVj4CA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MsWj7l1G
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KEVc863494
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QzPcCIEIvOS
	8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=; b=oxPVj4CA7NK0DuzgQl6YYAVLxCt
	9PPv6pJW+pv2Fyu4SlGSJEuxDIYM/PbwDMhTJZYpvWo0kHnfqMT+6gZGZndd8Mf7
	4lAG/MzVa9F5F+BVtPXliX2Avw+ulLWyzUJ4KfxwSOIuC7Vp4myU+ZVjDNPkhWZC
	JP2nMEoH/vPYj9SxaGH6lAPPhUZXOWEIQH6S2xc7S+0fzLGwFG37bnzZjwWzuid7
	BQPX8VnxJrc/IrQ3cPWD1Ej/HaJOceUir6x9Bvh/KL4rgJFi0IO7kbhpkYuDzPkN
	d9lUSKox+iMdppFAOoTGs24Ju7t6u3mSJFx6pZYPVPzeeeLe7Lm8sXngs5Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawh44q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5820266eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383536; x=1794988336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzPcCIEIvOS8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=;
        b=MsWj7l1GbDfmmm4uSEmQvadA6enM38yOR9sGTdh95lPObu3GiXiA4jw50oqFPGDniy
         nK8fkP5bktyri0EKJeXbLHGQJiVryIg2JoO2vnjTL0i8vyStNM081r1pQR2jbLx11UV2
         b14AsmSnQO8xyKqW7fE5kcHwazpXWqFPmhPp5B9mUUUM4faIhNVhJC1RDvmo/hAE4HUE
         ZkAGQ5W3JOfliCSI6gIlDik4QmuqX6tdM+GpcEoKmBUzIm2qn9SmDCZ6CJs3Lnw2AnDr
         Mklzsj65ojT2IE/RcvBiEgI4VqTqJ1mMGRtp450K+33GKrM1+1ktAPZB3hVp20DVgq6h
         PCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383536; x=1794988336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzPcCIEIvOS8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=;
        b=UHR7xsAPAnVwsD2hCx3EM/VH5dBzbOUFE1Lqk6rFT1jJrTA8OAiIeZUlslEyCnJXwi
         /oJG1TMNeMEEd+nfQtV9//ypNWZqdDZd3RSdHfRkuMuyeqPK2yDPl4YHzCnhfW5sIL5Z
         PmJKWeW9afV6+KtsAR0Ukiq3U0sXYQezvM99VkGSkRTa9u1YzfEzjShfH/qGFjCBsXa7
         VDChn9j9fhNlZzry2vxdX0KZ/0BTqAQBRddfw7tbYpTSy7hF5zwjQe5xb+0alt8Elfnt
         Mreav+w9oSHGqHwAGze9dqpO/3drKGKTnzW4TSNVkhAR2pw5OBo4lNqqtH9tiF0J9PkS
         Uv2g==
X-Forwarded-Encrypted: i=1; AL+hErGuKqIERw7HBc/eDZZCEByXW23asYxJMd3HIfI+LlXvx47MjwPAOmNTW/no7P9LXdpdYdOjfbsZzC61+D4O@vger.kernel.org
X-Gm-Message-State: APuU4Z8EGh+0YsEfGV1SWP95OsMJjczD17EJfqsjEGTRjiKv7ty9PDv/
	kQV+rBPKW2U1tqab4hdJHt+bkW000LG+AKGJGZ6/Ta1ZRj1XwlmLzqjFDMcxeHn/4d26T4dlZll
	iYw0osSfEIReQB8AeZ/tAsrTIbS3PAvsKooaw42H/25N+enf8cX7sBMcTVGVUmFrQqI9x
X-Gm-Gg: AYBFou20i6MsptlRhDqAwDWTi5UfZ84Lm3MQrvf2ruZyOsrL/9jA+AtmiRM6tr6U9Qs
	RUMRy+scmUt/KUw9hBnG+4fPlO7q/FKxEhu2oQxkdrvV9FnjmCu/zfxx+w2qRfl7T0SpXDsj/BI
	ap5Ogb1eDwWMNQ53rog1aHvxhiT7kumjAr8VWpniPm1zvJBc7i/CUkTCDGhUw041A2IVafSiSZE
	s5HmL9XtNRm7/MI+08MfKchXW38y5rAlS/590lxucK6kFjiFs8rhWr9Kk0yKdJeh+5F2jpeJnWK
	tETI1sA6tUMyjGzQhxu5EMoyOrhN+02YQvgeVg6LtH41D7VGrhCXq5PTaxWeg/r8QS7TmA1pWRF
	L+ltUuiL0mFI2VnaEHyEWgWCb+iwFWaN3viJoXbbScBVxn8GA6s4K967Jhg2MQ/tJQ79Qb8veHi
	zOadJgXnn+i72MtlucxGGtnirD0/U5T1q3
X-Received: by 2002:a05:693c:41da:10b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37685d700d2mr2304680eec.22.1794383535753;
        Tue, 10 Nov 2026 23:52:15 -0800 (PST)
X-Received: by 2002:a05:693c:41da:10b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37685d700d2mr2304645eec.22.1794383535028;
        Tue, 10 Nov 2026 23:52:15 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:14 -0800 (PST)
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 4/7] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
Date: Wed, 11 Nov 2026 15:51:38 +0800
Message-ID: <20261111075141.3710366-5-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX161cWz2m+edo
 01tLjBGrFwbrFbKfJqj76DvTIgF/9JkQRqyCjzsAXQMXyASDbzc7M1DXMQ4+vKQd0o29sBrc8pW
 y87u3CF7CLkIcLfzaz4QbJhhdjYHmCE=
X-Proofpoint-ORIG-GUID: aAPElUg228_laQs34HqUCfgux3MWLlI6
X-Proofpoint-GUID: aAPElUg228_laQs34HqUCfgux3MWLlI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX01h0tdnzqqSX
 w8U1QKo/F8gcfxX+WGebH+I6/B7uI0KXpQ149Sdcqu7MFCi3nLRnnxP6uh0t5NGg3w3s773aALP
 OdCAhU21og8cQf6AXn7m3fwNfVFQYVAbRlUrIkxt6NC5hgNfydJw3A6qYBBaxkHOOahCK8aSXAN
 WXZgo5facAfo/KGSVQS6jqkl2FjsrrJTcozYZrM132y78jmUPPr4yUGekZwFfhRjizjmHRFkBFL
 5/FanqKM6BYm/7OxXlg1cyTyLEa0CmoX/y9pBcwiQY1G0SvLJU+ZpBzxYHT3SG0ZqNWFahDa6eP
 DZXA2SsoBvClpNMvkSdORQBF3Q0JHoL7IVBRwLOrHkyB6mvArZwcfmIwuqkRjtplNiqsZqmwkeQ
 qjJUyL7obHf4Br4yoWQ8fLEXfDt7zSM3aUTWPcc6boX9Fp2aSip5mMSd0Gmdq/QL3/QbDE0FARv
 6qAv8PDceg92OS2u9rA==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af41eb0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=fkhy3qLzDainn0cAaKQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index cf760ec41727..a9adbbd75878 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
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
@@ -404,6 +500,21 @@ &pcie2 {
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

