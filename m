Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF17519920
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061581; cv=none; b=OFlztNpPK10iv5SsO3wEcVGi5cB/89Wuj4ER4LSIDK09wqKWByRSOmzV2Xf67PG6aP3zZ+Y9G1QY6lqIFWc4/iZTT0C5dRVNlRYhITF3p4NCpgurtuLw2AR/cc7s1nPQMQozxv9OxNMDf18bFavs6tFaOgorlK1zE7tsO58J8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061581; c=relaxed/simple;
	bh=VwGu5ZvOE+tkb1o3JLP1hcMC5C2pJPD8Wy8uCCU+jyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYece2vO+C+oQXZ0K5mepxxxxU5YlLlC8V/1VqLEo1dDjF+xfaTpigUYBTxNjgOgyMLdIJqmq/vwW/itDDA13Dxx0/c37buFlC5bpUt8h5aXR49xMKixiFzsoKTNIASNLWHJurBYthjpCEy6Mwxwd13goFlD9oV7IHmwnFWf+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/2QgHXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErUEtxhD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/2QgHXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErUEtxhD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOIW2114148
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wHbDTnWl6ps1qUikyAxfHXapCd0y+/cU+V3jGs/ms7k=; b=W/2QgHXGhs6St1wU
	i/Y2fJ/zPfrar8ziSE/xeASY57iInYnOMiPwhPS3HQfiS3/sr9dExcP4d0/jCW68
	BRos3AtY+3yYMAMn6MnPSOGwSjHA3LJtHcMvJfUhobqEw2tFDCQgjGKv5ZoPjnM8
	1/GuwAhbVuaCeQ0ImRpGBJ0JseA0nM5+4RzhZLhtwvlckw0w+Wf5+lgdm13rA2+Q
	8ElltxG9/D0fJOyUo+socE3cw9oOb4Zzyko85nAjnMjNVg0hHCPMw+SMsh2bruMj
	aXxAcgDD53t7+3nu0SdeeLQ01F/4WP4abiApQfBxwEE0IhusaatBhwfbxkqTceUL
	VYvbgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyanhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:52:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e60bb65626so55856845ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061574; x=1792666374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wHbDTnWl6ps1qUikyAxfHXapCd0y+/cU+V3jGs/ms7k=;
        b=ErUEtxhDVKfBYKijLmNKV7A8ouL5VDHWJLCRlcLi7kzHMH8mK1316xAoSW2S42G5ol
         Dam3px07J2+a94Jo51WIAYH+SE1RnIC6LpQl1r2qIki+kjlDwgkgu1lA5BU/eKjXIF6O
         DypYpR2kTWgqBD2HT49CboLejW8sAgpH6tsQeIgu3Jux0MsAYrdpXQy0zs2KRhK0STQB
         mWj6hnNlEVIW0BGEKjFbVeAOnf0pLIlYpYVIzXnPR9TF96E8U04BZfKtr12FQZkRRq6j
         omH7K/x2kxr4Q3TsCi6MLSaPUYTsYI33kOgOdMXA8kkFtZz3g8GW05bBwiI5k2rS1Md8
         cd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061574; x=1792666374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHbDTnWl6ps1qUikyAxfHXapCd0y+/cU+V3jGs/ms7k=;
        b=HOOTqeungYSLNE5JVDgDNgzR0qiMEiT/hqE/toOapx8FdFJTyEqBEnu6Qnnkl0cjM0
         2fZtPfa+C+kNIBoV1T6tL4p5aRfhudMpgB6k2pCbeVEDfVYGMcpKtAQ9Tu9TSNSzB3XM
         HJky1+h66gH4/dGeu49EwNLa0J5jnOqcR6hI6Vz6z21lScQHkLibcqrJXgDRUtvAqFVw
         QrvMvz3KY4aK5qo8REUO1eiQUks6lWhE0xvsbet4Uof0FHZVJkS7oiczJdhE5jV4ztNu
         yT1go9DauQDH/FdcoIL1KS1C6RFeLBuDRb0ErC5pXigyDNnsp0jpNpF8UI1T0KUVfRka
         v58A==
X-Gm-Message-State: AFq9FYJ8DFlohbw8keoQ4XSnZNJrdg0e82BXgb+S7m/AgvOLxmYmccPx
	No1WK4N8TPgpDehIEdki0hIrLh44m2PtXTk4BFvnNP0a/ESO8kfUtaU46647lKMz3vFeT2sD5Ot
	M2uzgaAGRx9WhRDCVojTutMPrk917Hpxc4jU19hR79kK0jlgdt26jIFocHpqh7yvvvXMM
X-Gm-Gg: AYBFou2LSQkmgL5PVELoIhnoaQJ31oAE52/l3Ls0TUiG/tEtRFmR2aplqwdeiYceYl7
	IKEBvdEuuGGFGBx7zHJpsjuSutLx8VsWxF6sY47jmpa83OiCco2Qz6PlhG+D8hEBfXNcKpG9Fer
	aOiXcw9b00gxM7IHocNgdd6YFvmvrX4fwnCdM5s03M3xOuK/R9pW95CYjtwbhVVFxbNINXsxcip
	saG8xx7jhMEs12fOyrGhrRSdXuBgb0frTDVSqxzIb1Lql0X+TwNWmkZESYnlaCpMPFLQidLqr3U
	OGUqqf/perOAPG3WP8sLWowbLnhOtxqdkYKl6Ja1b3unF50WxhCecljsNxlvPinaEug1TxnSchn
	zgGNRgTh//ofnAtU8+DkzACagg2y1OQ==
X-Received: by 2002:a17:903:3246:b0:2e8:81e2:1d42 with SMTP id d9443c01a7336-2e881e220a7mr97847275ad.39.1792061574059;
        Thu, 15 Oct 2026 03:52:54 -0700 (PDT)
X-Received: by 2002:a17:903:3246:b0:2e8:81e2:1d42 with SMTP id d9443c01a7336-2e881e220a7mr97847145ad.39.1792061573574;
        Thu, 15 Oct 2026 03:52:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:28 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061550; l=1609;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=VwGu5ZvOE+tkb1o3JLP1hcMC5C2pJPD8Wy8uCCU+jyM=;
 b=ssNeWwp+Z6JPGn+9KZS3XrKGp9rToWKGr3QX+4qGvgYlS5VrXm62oQeZU+alq25Xe+uqY3a62
 +65h9wZATt9CIONXxO5+VzFIc8vzuwWJeEC/f4slfwgQIyaxXowCWZ4
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: GbzEsHGsCVL1yhsqyxOWMHPPxjctVeCY
X-Proofpoint-ORIG-GUID: GbzEsHGsCVL1yhsqyxOWMHPPxjctVeCY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXzDAZp6WmZi75
 o23XDvXnJxhmiZfP1DsngULBY86O73rxVu6VLRsEw3PbV2fR2r107lUWg+QOJ/5/mhASCgNDwS2
 vZ0oDz36HRBovJflZTe3/Fk4cgdhz8Y=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0b086 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XLrFv9MQ_WwsiHGvDjkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXzSYwapvPlKGJ
 qsVrsYdN6h+dapGLzMEUgCrn3Vvxm4MYQMJz9uUOe9XpTZhCTyU48J71Z3GST+RoUy28WcFejvb
 gKAwCnLcZLXAnwJ6cj52t2WjNsv9kKDoU7FCEScaJfGoMrGqU8vU3XOz7AD7bd4cZ1LSaheYdNK
 b4iv4VoZatB3PLJiY15veQKF2KzMfmXOBrUGyEdIYTJxCjL47eiRCpFArOn1fEx5Dm2CmEJPqzN
 tid0XKZv1w3V0UNQvQlWSR8Da6QlYnqzo+nyvlDapcN3iL+kDti6lCvN+ue+opJh8JoZI1z1FlT
 KvEcOeL7KUrHsYrKGROjox6QsxYp3PGACulN4dYuUvTH0ALiq9ngBbk7gegQ23zpjpaW7z/A2bH
 YQda7zPzT9WZPht/iOf8cFgJ4HFOrMNLwq4mdEqLkeu0NClbeN9bLS8KpFRXINvMeZWGM59N0/L
 gVR9JP9EoMEvT1ZL2xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Add pinctrl definitions for camera master clock pins on Glymur.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index fce3651c47f403e01ffc2a44d6d04a4abba1f310..e38a3cf5c9ea27e34f1ce312800965fac640b57c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -7148,6 +7148,41 @@ rx-pins {
 				};
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio97";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio99";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio100";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio101";

-- 
2.34.1

