Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7614839E177
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161483; cv=none; b=hhTfUwOb9jiKfaHFAe5+iIYEeUTZDVXw9nzIUXfFVkCMmlX9jreifN5OhHuiKHuiuidtt3v9J5G/i0TsKfNAI7CUJOTxEHxn1UxnJEyQlCHUYwmrmPOtWmEk8wJ1xADAMTk3e8mraTA8njDCmBJOsaaz2Z3tVmYWzz+rV6AhIi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161483; c=relaxed/simple;
	bh=9M1nPTo1CIuFQ1/rdy0C4LqeSuxLcRZilyOPwnHrM6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xfv0WP4b1luKPWjJiHHM80qZikSpPC4xh58wxkzrskhZ2mqKllRyQbTOY8CFEIt704g7gLyI+oNpsphCL8pde9HmLtezVqzV+PYkVFRBJnCCyh8k0VeeAKUR9d6o9wwZLNa6vdXamyT6oMIf14/u1wBUaDJuPibypeKZyI13PjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhgMZnWf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SahbFupt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhgMZnWf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SahbFupt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2nfd3209005
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWIsVlhgYhz5NzYHzdTprwTk+dhscOHAulUPICmnuJE=; b=jhgMZnWfKdBgbuEa
	WiLefe4pJbuEcWeFpeqqbsJ1aKFbcbZCbF4ITbSnbyKI6qyE4HO6maTDe6fO6oMx
	bBaqcgMc8iJHzFFlQww5iVLuPX/fUgP+ismfA1/HjUhmIqZMgirbrTMtWI6+4yAl
	JxKELsduWnwYTGZpou3jrDNP8Rxu9qjU5KGSu48axOmwggvWuDy5/V6HLFjpEXvs
	wojAdgAjJh3XKMGXCZNegvWqNOqiqrjE4IT79+bM+SeXTu8nlGsHS0NivVMMQDy1
	Jr8E9LmG+bszbKJfxMeQ+U+uKchf9gsl/RuJJKfNQhhcAtMIMcazuOQHpi/DFvvu
	2DD5Rg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1muu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:04:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33310847fcaso1359780eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161473; x=1790766273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWIsVlhgYhz5NzYHzdTprwTk+dhscOHAulUPICmnuJE=;
        b=SahbFuptsImaRJHqGX5S2NT/oV2Sfmw8d83bLtdMSALo6uBLFqZ9KyT2yJ4hxi2aIk
         ANqzr6fOQ6l9JdQiwcfG6olQ7XCZ4d0JZ+JHpuL6LClkrzKIu3yg3HqjyTYFmZw/hwiq
         NB3Y5xeLUxjCXhEACrTP3+XA45GR7eEndbFpum29b4ixYA9SwAFa7qVVjEJcepcrAaaB
         +gzSL1UDQT7VPNdAeiCIAKkBK/zvf3VZVhO8cwqexbK4tc92U4ucR5QYO4UeXjfWa+E1
         0FCCifwcEZNjqMwoqtu2Bc1/NzVxbpqlejjX357UoeBjPM+JXEAdcNIuznlmnDnwzpRC
         OfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161473; x=1790766273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWIsVlhgYhz5NzYHzdTprwTk+dhscOHAulUPICmnuJE=;
        b=0NnCNCFtzSJaQDGaO8mBweD59doBiXO0WYGHFM6ffpbNzi2/JKrqav9q2iZtbbqRJt
         LrB8/AxHLP7umidlVauaDjYVa5Fn5Jzi2x7kGqW4QNodfNtSOTOmjiJTJsNGelcFR/qm
         sEXlPAiHsz7Q/fQHXEIBoID7TuS7e/tgUC4hVSjuy39zDqJu+RACoXt9/XBlt85DxYx9
         Asz/t0MvMl/xKzbUDUUiyshnM+/8HNk7Gk54VDgHoCtMond6t5l4Sr6rhQ71V5eHNMU/
         D9OYkXBbow8WRLDyu8eXBZMo7AGzzalBdiZAtUzqPxbb9UP0cyIugyrMppEy5BD8fDpd
         3tfw==
X-Gm-Message-State: AFuF++lcEZIaRDOttqFkSuyLlZPJtPTZjXmzzvbE5hKl6GOK+cjerk12
	egLU5wbwHevNaGG4qF0HOa8rq09gIarRzMB/VWx0Qai3Ln5E45WZQmVvOaUHObJasgeEwbm/oU6
	UkJy7VLfpduXsCwGl9WHGzQMxkqJG60Tb2uulC6vOocO2psb1UjuqO4pDGIGEeIjUWf5e
X-Gm-Gg: AYBFou1VSqYgWXmp5fPoUZDFhHTpLA1720mrQePR07yocRg/r53rNzgcmeYMfasLSWx
	1yb7hhq2ye7AG0GAHCs3r1C+wCKzgqjw4WV5zy39h8ItDlh8V7FLNGMKvtfIQpiWBFDigeYnDr9
	o/40MiEVyQr5XjfnZfJMhMpReX9+73i2OqR8wubd04vwNwhCz+unAjL/+bmEKco8I7cDTOhPI55
	KZaiipgJ/SyghWrRYrbSI5AA/LxiGtpNhK14Fgta2FOlVZDZZFon16VORy+H4zsFfBX7WGU4OAU
	2Fx1F7AOLShNsfGO/gKTeNcOFAa+rveCmM7W5sVEpDXgIXa7WC6gmfrmj28peIrWjm+OjdF2kF+
	lRCsj9RAOH9Rekno+UxFzbEQeP21jnA==
X-Received: by 2002:a05:7301:2501:b0:33b:c29a:713b with SMTP id 5a478bee46e88-33e8c72bfdcmr2190339eec.18.1790161473074;
        Wed, 23 Sep 2026 04:04:33 -0700 (PDT)
X-Received: by 2002:a05:7301:2501:b0:33b:c29a:713b with SMTP id 5a478bee46e88-33e8c72bfdcmr2190276eec.18.1790161471676;
        Wed, 23 Sep 2026 04:04:31 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:31 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:40 +0530
Subject: [PATCH RFC 09/15] arm64: dts: qcom: hawi: Add camera MCLK pinctrl
 for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-9-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=2026;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=xx492fU1yfGENWkKCTE6TQKz2zLJfMohArToVhMtg3M=;
 b=oJibmOSvDBR7RKqtqAsg/gVA06lp7FsF23AJ1+2gpdaj0hazu2yA+nnRCQNxN5e5TABgvFCjx
 SOzagjdVWK+DUkD7omJ+Cmcc6PHJy3b2qgfWdsxBDdPXrxafn3MhN9S
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX+r5dXSXXKVtl
 JpUIcBWJ03L9K01H6OJslUWFaO5r6brjMbKGfcq6LWCj0A/O3C7Bi7Ts/r12dmNMHec842xUPsh
 OKG9rhk2wkozytGUzViFWcBoWiYEUAY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX1RqwqCpxNy/2
 mZyYahXm+G50SR7xMZCVQUrMvtQ1ka1mDLG2SB6R6SF/Lqmxc5oglXmwDLw6QU09ikrz+42bfkr
 LxTgzfVrjPzxpJYNRzZKeWxAhxizajlL4L2c2Oqa6T77OxuUA4BhIN4kZBsVPtKk6HaxYF8J99R
 ELpJUxM+YyegNhdVjRT4AJwNave4b1Oj06x52SGPHwA02aYLb9sk1+ztCAafLhpYsyibJC2czZG
 GTbYLDAKLUKetxhdojSwFTEjMBk9/x6MEAhhhcO4llaOCR8I357bDfg99gtVPTverC5UfwwkmJG
 6PwTWfTDKPOxic31uwP8U/ocwI/4VqI8NGNc9VistStld3Axs662jB10Oo6E5r9c9TCS4Obp+sW
 tuTe15667zDJxWelutHbkzNnfRU/5ewUXoiey5ZhsdQRH2sa24TjWv7uLP78lR5YDwCzC4Jslvw
 +7aJm8k/FxoELtdwwAA==
X-Proofpoint-ORIG-GUID: STk5XF8qo0n5HkrcDBZWS3WVVRw4StOV
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3b242 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LoLYTzTP-NOuDkKnZLgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: STk5XF8qo0n5HkrcDBZWS3WVVRw4StOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Define pinctrl definitions to enable camera master clocks on Hawi.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index bc7adf10bd4653cf50527a1ebb38518c66dba900..85a9faad59fc0387ebf4d7565fd08dd7acce1f26 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -4712,6 +4712,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				pins = "gpio109", "gpio110";
 				function = "cci_i2c0";

-- 
2.34.1

