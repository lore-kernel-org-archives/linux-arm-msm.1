Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A95F4968F6
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865860; cv=none; b=c1lpTZUqvfVSLN+mnAnRvZghc2IWbld05P41UjvF3OtGIc7pSuRpKkLhmwC6RBeqMRRAbuH7OUs86X0eGqCsPna0qjylr3e8OY4n3yad/3afVSUNeX34sdYT9TqRrj2Gksh1fGyZeNiixmnZubrdNDdjZqiCkigUzZbS0zlpYYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865860; c=relaxed/simple;
	bh=0rw08JsGiL/r7Q3WzWwCBrjpAsuVLUbBRgKV2TN/bck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zaqhvy1GqPTxeBJjJfridlgovdmJwugQmAyw/UxM65/5f+ToND6B4AnW1U22uYVRTiJD5EyJI7GkTnh+ikimzWLESEWGOUUZfAx4aWmLymS7PMS3Evdhbdm8zd1p4UQBABQhSQ7Qr1LNKDGcZ2cNIF9nSaqMUnvrmSFqoTqJyu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORWeJPoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IeBTV3Zn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORWeJPoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IeBTV3Zn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FffYV3643798
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 17:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/FB2kx9I7szAacRUGhC1WVT/Af65I0UeWspZWSP7bU=; b=ORWeJPoMLLMepr1s
	6QcDItsrz8IeEeiKKpbYuinRlbUWgarp5PqhYIEXVCdXs4ZL/AAK2zqrcqC0PlPy
	QalvuIo518qoK+vjrPAo7K95YAsTkV9JzGLvLl/EXCcD65DLwpe8yBwPeCbAVdDv
	TO7vD6KL7JuXxythsAfUdxZE4JyD1H1ncmwwQrfaDgkhqpBc6LZenRJMPbaxjyjT
	QPk2XGTV82DSy3bbxluKpLRvQIQeCo1DftwxphQj1Kiii/y6kxWWv2VkYr0Iag3q
	1/Tx8G/5cMZen5yU7oc5GuKK1zpRaThXyvh0cgAxQWYfLVH7ajW46LDR6GaYCmaI
	cAtKqQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud23jbpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 17:50:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb733fc5024so36792a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 10:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865853; x=1786470653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/FB2kx9I7szAacRUGhC1WVT/Af65I0UeWspZWSP7bU=;
        b=IeBTV3ZnsISLfXWNIfXIFuzpVp4yCJFAnkbaqnLADYZ2H+w8W9HLcCrC9Ir88cnRlT
         5Qtc33TeW9Vmw3zeolAYEPa1cGMvkMWRo5iD1UjObWFcFc8WPBL3vJRwCLypVbJEZEH5
         r5TpYAAoGdbRJSO1Qg9cZLh7BsGIJQ+GItc4hogR/C6Kj1a8abhKxvVK+sn/S6ElRSx9
         0b2b8YUbXfzey42x/bIL1/t2pzLgUKfT+xLkyGLzqqANUIagpSZbgc80nL/wr1pWViwU
         NrDScxHBOJM7qHa4zix2Ogsbcw8ryMJid0NDXdWS2PuvQ0BbikeQJAQugWmqCb77m7mn
         MnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865853; x=1786470653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/FB2kx9I7szAacRUGhC1WVT/Af65I0UeWspZWSP7bU=;
        b=lTM983zw5agLTc7p8EG7TR6ppg+ZRUAxg41+7Tam/NOjWJo//aLJ5xYFmYo6aCArUs
         OHlc6I07OM5JJdrwmgxi/CJ/+UFFoCIBgSOGFRDMLC6cXhtOv3DNkBU1IBya2ckDCvlE
         p4lbzCbta5YA1nuBSF+yaDqNmH0pLEShZPENpVNphK3iixJy6kzrQ7494LIW2qAS8Fah
         nCxt0Y7YwCDh1mBlDB5gSeJzGCLoCOO+TRWlhzmEmI/6iKXx+jUC1TxsNW7o/EpmhF0B
         hQe0RKf8UdvNEohyrfhHRfubyfoxmRmhD+jpONLyzRJeJoh+Q+w11650RTsvPcdY5u2f
         ezCg==
X-Forwarded-Encrypted: i=1; AHgh+RpFzkUmdzlCvxgXgT4+P0jrM7FMzjShIHr7h+s1PA1PiM90ernS3H4+O7ukN/jNmH18QqIj90UxBkO8knIA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5xyTCArdN5zpOhZ+4VoMr3Iwpbra8ZP/k3QwaZ9NKwchEGw+J
	WWjQ8Avp0ymS3MZHXbEMs2KEefn/4bRSY854TVtm1PCzIPUX/iicLrUNxvGmn8b+CfOX9aWri3f
	afeycMfw0IRYXOGza9UUr+sb0Bd0XpybF1i5Z+tK2k1/m1gqy7UpMyBW1tNJA27/3dHoC
X-Gm-Gg: AR+sD1372gqorzhbJh8YiLKhkNTYN4GW0kULY8nXz7bc+o8maCDy+QO+RQL0X/Dp7C8
	nQkZri6OZH+ZiJvsDHkmAf5Z7DQw20JZ9EykOG/3xQ47j0DVTX9TLNDY7VFuCz1GDP59xFI1Y4T
	+Htx3T6PnM1cubuxywjz5ObxbUmwUM0Pb42afsr0MEUGtdk7+XVxBWNFoIPUOgHK19tRhYjI3gJ
	yM5x2L6dXKRL93FLz6zic2jDUPlGbMYXimnubExIuuo/oMILWnEoqiolylBLW5Q+AsJIQT4NHFP
	T1LKJh3DB59vHqnVIX7p64tXq6/3rUQ1edo/7/dTXmlbl6gLyMHZNqRqikfZKxmNXUSJz9qGHd5
	fvskVoDWsMVO81RwO34mAQxPU
X-Received: by 2002:a05:6a21:a517:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3cb85fbda24mr449922637.44.1785865852796;
        Tue, 04 Aug 2026 10:50:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:a517:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3cb85fbda24mr449891637.44.1785865852402;
        Tue, 04 Aug 2026 10:50:52 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:16 +0530
Subject: [PATCH v9 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-3-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: KUrNbhW-IcmKU5rsrTTiTS8XkrfedHso
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX25IJg4L9Dkh7
 wU3uWqBxsgfj1CmQ6ThTX6oicG1sllclFy56ozLfDTshMmoiR+p30Y9akKU0+WqtbStMIl6QdxH
 tcjZOXSQiYO4v3QoPTDxI+qj4X8iI8I=
X-Authority-Analysis: v=2.4 cv=XIkAjwhE c=1 sm=1 tr=0 ts=6a72267d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: KUrNbhW-IcmKU5rsrTTiTS8XkrfedHso
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX/MuzB39Bxm4r
 TGh6iLtOsFZ0HeFySEEGbc0sc0AwrILkeFcUrZW22rAvKy8qvC5lnXYb+9aUFzTkxwmYHLuk4f6
 j7XIfbuGm4jzQlm4ZAmNMKkiwnh6LewcnQUpsPFnINxH9Qxug/I7OYI2rAzMvU9d9mWC9DAk6Se
 5m+Wielj7hZ1p6if3vyNXEcumbmukSo5g7DPItXdzqbEdfrXuQtbCRgJfH4mP6VY/u52IFaZgyy
 S1JYk7sSegkBLMdnGDrBCDE5DP5LSWIdaDmaMSTcuU+L6TPDeEfaT1L9Jnw2UR1PKWB7ywn7scU
 JMStepEWyiG7UJkATZGEZqFD9g4QXKalziFe63W9ecY3l+T8jEYIRT/KZTSS6qCobxCJY/hMKdC
 2P1PFXSt1/B3UtXg2Y7DQCGbCwUdYHPHs8zhTr+29RYHKteD8EL7/T5LUGxT7V+zHSBgUxrrMPb
 UOOtODYmtlhCYYAKauA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf6789162f5dcabbb7d4a8efe180f86d4b46..f3af1d759e09837de457522af47c74431e8d3fdc 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1949,6 +1949,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -2031,6 +2036,11 @@ camcc: clock-controller@adb0000 {
 			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
 					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

