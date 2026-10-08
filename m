Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24AF3D7A0F
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443693; cv=none; b=uMNHd11z66N7TGR2UApUxJwJ1qhUujZNZMhkI4vAqkBQifeRW4zHONrHEhAfKuhqN5kzmDaMUbM00KnA03nvk85zMxweXq1/QbPDDSbMfZvi6Yzu/jmpb9chbg1RUE1eEYC7ylz4gMTG4wqtk3GCVcns4S5+4Hoa90S3cT5qREI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443693; c=relaxed/simple;
	bh=JZFxXZsrjM4DbU545aptMj12odYhiTP97780+XFXm5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f74yIkStyaD38Z4FsI4o6jDjuEacHz/nNJrR52gdtB0JyTipNVBPiQnCZh2CIiuZDFv3lbNiet6RN6yzr3iZPwHFL5NxVXvGzXGp0XOj5XhuC6zjsp/56pHn99UTmXAFEPEEx3v1S6D0sujXdiza6oFocifJUjP2SfFev/lhFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKgVb1j1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOEh3Xmg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKgVb1j1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOEh3Xmg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BTDC2895401
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 07:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRzWZ+suvLOKoJLeUzsdWe8l/S9zZeiASA+hJsV1sCU=; b=mKgVb1j1CL4rFTei
	mMNzYGecjT1e/nyiibpqd9UNF+gFzMFUc0rhqN3JUWtu/6yWi6BRcATT9rbJyxTR
	H5IqKUXLRyeJFJrKAe0N2Ug+NzcDioENUbhwxzfQJ84jwEPP4rERPpnv5Z0YS1tx
	TeHIvSBzqcobmvBBo6UaSKkOvNHbreG88l3SLHjsMoHxqM3PWQZ/a03d9s8B5g6Q
	oV3d+Lp5BPUoLKumzd5BV0WY4QgTFSFcPG/BsUk862638rNgdB1w0mnuP5jqvV57
	3bPALnL+z1CoNs7Z4GzsyAZdaS5W9OKbuGzuTc0y8C35RPix4gGRBUN36tRxWOsc
	93UunQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg97gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 07:14:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so6690854eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 00:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443689; x=1792048489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRzWZ+suvLOKoJLeUzsdWe8l/S9zZeiASA+hJsV1sCU=;
        b=BOEh3Xmg/55xqUDSwDtwWYG+9vO9kdxNNiMkxULDVEP8lC58fGALWqSPK1HSlAEUTu
         DTaVCYip3a08Km4helBpemtUm33NgNM9+FOyr98sBrsjXUqwZ7zQUT4ls0RgST5oQhj1
         DaHA48PpP0FGuVrGpFn9P6Ye5aKVlatVEiVK+5dfNr3/rOtA44vKy6Yc0NdsOmRIiM69
         vUaukWKv5WM7sfXW2xu57wDmZ6R3LiXz7faZR8NLhr0z80DLIzZ4ZzhC7hqeG5JqqI4K
         eiltdjyWk7Tb51QzrQWyVJQ/ntCPEViHZg7swpOXrrgYTIjR5eRUc3weefq8491dA1Xk
         JGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443689; x=1792048489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRzWZ+suvLOKoJLeUzsdWe8l/S9zZeiASA+hJsV1sCU=;
        b=YT38G1tDLfjfrXg0Fx00rBBBBYXhSnFhieOxQAgFk9CDcxY5iXbV9wlWDIrWe1AQzo
         6TV+tmR6K6eEknxqbs2NgpQf+6u77zCEEvm7zTg2UGIha2SnqyXlb3kQIZbpbA2C0DoK
         fJRK6UsV+4IRZbO3FX/UjGneSRlo+fZbglg8W8T/OBRdf6Tkyau7WRrXAoVOkQYvmMjB
         RYO6++IDhudA8xj5CwAfpOJoXQ3laI2S/dCQNhpnMWK2CosAoriTQ+9uXazw9v9K8lXg
         IcmoTpMGW8ecoZUrLYiZuJVL7XQCk4MJfdqnwIKQR65gz2mcznBA5VmJTCizHgYRxYgF
         uZFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/4AlIU9yRGvBpZCzCb9xfZSP8Z6cOjs7kMY+q8HgxLxQWOrBcZCgGr6NmrVX7aZ4iXvnwjlf8F5fMqIXp@vger.kernel.org
X-Gm-Message-State: AFuF++kDUj2MvLIQVrjH4b2LQxf1p3g08UU5VIMM0byNaJMGjebybVne
	THCDmvV8LUWdX+3jSD+0KpsjuY4/0h/JQ9esNsOLRtd2T5oKrSs/T+ME1LSmfuY9CcRtmj4gxKK
	MU71UU39P1aVuHVBVunn9k7saclDPYAkcvFvYGjYRL27u05uv+IviFL0xdptC38f5V3xI
X-Gm-Gg: AYBFou1O282R11PYZgrHDMpI01jXX2BWmrTb1YLTiYibF1ycxxhFVsgOD0J1YKXHPa8
	u883L57fnbTdsvEHN1FCxyBIkNik0yLz2fYTounGNhGgrTS+qn0eC56aqAkGlCYnaJICWOULCo9
	gYNFZqAs9bDsiopJ1NoMo0DnsvcsoTLzoG9UTOEZevodQ9ExJRBMlOMU1c28jPKF5N5XfUuBFs4
	cvfbqUF0uqMQvJFUCBp5JdIOQ7X2EX7WDTdeQn1fmTWiKnvQ05uW5Jj9Nkz6AVnmRTsnxnPofIZ
	HUvcwolaPcKLYtvgjP4oKkWKW7qZRsaCWXW/FK7MEs0FAl532hZb4r5J8/PHVWR1vrwzUsZnWm4
	W1rQLSoL2YTnCGGSP0OrwVPyev6tHmov/eTBvBrNP0v75G9bMsi07G1Vs+HPy7ClULRnMOM4COe
	srmzD5aFkZzA==
X-Received: by 2002:a05:7300:c38a:b0:351:591b:7684 with SMTP id 5a478bee46e88-3515de2e017mr5605143eec.33.1791443688328;
        Thu, 08 Oct 2026 00:14:48 -0700 (PDT)
X-Received: by 2002:a05:7300:c38a:b0:351:591b:7684 with SMTP id 5a478bee46e88-3515de2e017mr5605117eec.33.1791443687782;
        Thu, 08 Oct 2026 00:14:47 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:47 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:42 -0700
Subject: [PATCH v19 12/12] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-12-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: ZEjvtoyWh4Oi_1H2lByrFIkTqbKTQ8DV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfXxx8LNhMDfEMy
 L0nyWYPF9jVpzuyutdhE8/FQXg4o6GTI7fIaT9WvjPjWVU4dbgR8WMIf6XnBLk8wB+qIKlFE/4/
 gU0HbebI0jLRu54qVcIsaOEo80OT4UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX6QxdJzf3WED7
 fiv+mfUlC/ef3PYS8Z2rd2UGzzpcbYtTy5jfCFYNnRC8+TvlyirgfwTZBWZkQ7etubQov8Ankll
 xiDiphJRBg4D6a3uAQGVqPGKrSLLpb9OegahnZUTIwe4kN6GQAwwxecJwAfIWEPcSOjMSH4G/WX
 +s7CizXKF0SiYMC97D2Ak6OzoEOHiaE76qkMWRU5rRF0ws06eFKvGGp7tcQL/AetTrLghQNDBYS
 JNjYM9TquzVPXwf48acNsEI4IeUXUYKgP/0pIVcoDz5fcnwRzmHH8nHMhMKtXxw23U0/mnFYO8R
 beu+Y3KAYf5EBYkAowLtdYZhWwqeLDc9iApghDIdvgQbRS+sOkBCj3lj7c1g06VR0Y/janq4Hek
 paJLIT+HpDCbyZwACIkXNCIEqEj6cPve2/aiU4+Q8VOX5QyFa/ShSfUaUF3MSyFs/0Ho50deXdk
 cU8NB5YVqPbrGxxSqdg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac742e9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZEjvtoyWh4Oi_1H2lByrFIkTqbKTQ8DV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 710af0597aaa..f915a3d1530a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4570,6 +4570,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

