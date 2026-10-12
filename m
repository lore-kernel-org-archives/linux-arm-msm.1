Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CDD44A3FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787551; cv=none; b=eqny/3syu4d78ftBjHWrKHUme3IRgsJsYGfNa4q7pEUwlAz7b1yJlVV3cIWIjIcjuXup6smgYILvgShCzUyPx6qU9ColzuEKfhT/DnQrCseWcepOlT9dabbUEuG3rJRs3MIdvJA0FMjePRt82RUZV6PlWMr2dsavnFl1q7wgVdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787551; c=relaxed/simple;
	bh=pxHyg/jfZ7eJ6o8uVk7w4Q38gLsjYlwkLC67UQT1/wQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSXDyHkdPZA+V+5gFpO1zL222g52mWAgm3VJwAVMejJFRJ/5L8zRZY3i7W1GgH5+eE2leh5/pMAJAjVxzFqtccht/8EKqgLVBv7hk0rzCM8YNZh+pORbukn1205FNZe8s8baenvcFRDbVCnrbVfhR/Rjz+Kiearzg2GNefNXew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBqO2jl0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmdGgpj6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBqO2jl0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmdGgpj6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5Y7hv1216057
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=; b=TBqO2jl0Bu3/iorL
	kJGdWmwP+MKV+62hxRvZID2WbF+xQW33FDdajxpeCyQU2NHwyVfZiyGxy2gyo6ov
	faaYMyG/i/2EBUMeHZyXYF3M+CMmRt8wbQD6QkgWl5HL3MdyX324qRv6Q+W9X9B6
	0cE6EpXcrku4/74dmERS3PkHakPuNG9ZlK4fpihtkXM+0x9AfB6+hWZd7Tyl0MUQ
	/TZokay1LwNINxWwO909JXeqCJrTX54S5gCNSfovJ8COabIFy5haq3/dFpz4UNDQ
	XS3URa6Mt3HJYD7hllz/XO4BjW6rj6j0870XT2E/OfMKsgz4qvReWuiidNk1G5RP
	F1dVlw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu0acw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5f7fe8ef1so459872a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 23:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787543; x=1792392343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=;
        b=DmdGgpj6qHh51oHJLX/vb7OUAN11dyyrSYuj9hgR9Z7USmQ++SqrSQR7ij2iw+ZgId
         wH+ypQkvhsyxCPmtNBfNwiSDvh8LDkl16Xl5bQxZuYTeDnjiX5pPrEskaEz1npMMsG6X
         kt0/7PN8Fl3NmLJjCEjmvDnpGH44gQR0+3roduRK9ycJoDMrlqozamrRyz8i/gRe8o5r
         ByosXf5/lFkP5QUmqJbEjWPIpNOCcmBm+z54nFnwkIQ0LXQ04oYUzwP2gpdfYovE3+h4
         htJAckUOXjkFcxBTPJMGaFgTE4wyJ56TGIT7yUJGMenfnS2yRzczDWcNSfJH07mkdx0K
         Nj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787543; x=1792392343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=;
        b=D2J2lgk04zE1gCW+kp1e/pwl9ceZiMyNFwE9VtZZ2z4pF+RLVQ+jDP0YGCK9Tekkit
         Xy9rRBES+sJvEoPce9MbG6uO589f3C+FYjUEkCzOcYCPVqZAgBtNfBeAzkOqHHiuVxNe
         v1ooaTGy5MaHk9oAjtbmT8nWgnDJ2zm02BCPG0j7X7vi0zg3oo/gul0Z4dJaw8N+Vz2w
         1z1HJxVhS+LTFYmFVammyKdMW8UMrUIYY+RCA6n4kskV1xfudsdHL1N6nRaN7PIPIMuZ
         F0WUcladjSDZ6AtXbcG0eYjhB5WKlblfj9lnEkUYWW4IfGMu/t2OliZDcA/5dGzXO1rh
         7kaA==
X-Forwarded-Encrypted: i=1; AKwUvBzhyDa4wrW1mOHAYxcZzHQ9nmsHX88pHaNEKmRp5uz3XEr8uknIvbwU3zIZD6gOH+kA8d921ADMLhfy37oZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIbewuJiw9AWQrysGklsHYpMBsx4O6HNjJ5LKTM0RfTaqR3oyzz
	4KY51896Lz639P6wKP7XFmZKNx9VfMYEyf19g3GyxEc8KYbhtG5ik/U8fzsgIXbdgakhDajaEO5
	ttD2grB99GQGUucMp8NtSKIw7a1lGJQE7ZSTEIXzGX+L6HePdl3awZlRE9VRgK+kXMfbv
X-Gm-Gg: AYBFou3OUnG9ydz2GXmwWwowdyFgVsgK8GZJDKJLPDpAaUi1CD3+5IHE6kt9uNcHNh2
	0AwV78K7K8E4IrSLLN7e++Kjn/k2mF6tXiJMil4KSQFoDe04xC47TgDN+zUNDZxym9usLCKMFvA
	Nrp3VjCPyywpEKhUxmy+V4ObYpKz4KkQUHBpF69PBOcLCizVWwtyReLV5xjWlfQqo3vVL+xQEZq
	7plefRTtHi4/XCfZArV+i2n5/bilmhrQqaHtfuyF6B5Gww2Efxz8YClWRCO46IkGzFS73zVcxQw
	Sbgt/8wuWX/5AH7KPs/xawKMyYR3msarBM8ey/4agM+oX4ADxp+DdKCUpQg2ypvJS43qiDl7lzG
	f+48Rmqmeq/UAf5Z/99qsDuyNFSAENgGswVu/Jkyajfs9vDvOZidYm4Oat+kk2ZmLBRrmwuw2Fu
	hv4aoLdOmsWA==
X-Received: by 2002:a05:6a21:3292:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3e16ba9ff90mr7154947637.2.1791787543323;
        Sun, 11 Oct 2026 23:45:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:3292:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3e16ba9ff90mr7154921637.2.1791787542836;
        Sun, 11 Oct 2026 23:45:42 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:42 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:15 -0700
Subject: [PATCH v21 13/14] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-13-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acc8218 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX4+TRM0rAn8dO
 6vp/qQNCNyUD3UWZAl1/rREIY48Lz9ScxDvZUqCfkihVX2Kyzspe+NXI1ygN+nLSllREtQRAzKI
 gBqw2WOOcllxg45TBJFEoN50sidUGey1WrBQ471f2OGxcZBVNYJJSEACCW6RehKygg/FxZ6x0yf
 NPjiCfXCHsi9l+DV9y8ubiF1CFF1+Mot+x2wBc/2uJP1ecVeATUjJ+7dLaWaR1uV6Lzvuw/skhq
 Ty3YMlWqeTunws67rj4ddjtvaRNcdOSa+1QAWeWFKbolBNI71InOhm6ACCzKwlMSDGNGqv1bmFs
 PRtutkouxEA9MdbaLvXsH7i+NCNLPS+kPMCnxLOU6F/5Np/xdZLIBY/dZlqW5OkL4JVM5mfVRS/
 0K71114U0wMJFEN8/jKm9sK9In1It0C1+Lp9mL4yalG32t+ixDUX0+wBIHtl/gxq1NlLSXQXFMm
 6XMNSUKTyAgvUiUUuFw==
X-Proofpoint-ORIG-GUID: uZy06_9V8CbIdRyC28W0aiTWxa2apOLH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX1Yih9HzukY7I
 0luYO/cznCte0eKmN4dZyHJXotFaXosv2ObisjmGPhe52HsLqpzwzjwTBCTKqzeBph4HTCNq9AJ
 esi04ksUHhjxp6dXyXOx/WCEK1L7YGo=
X-Proofpoint-GUID: uZy06_9V8CbIdRyC28W0aiTWxa2apOLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120026

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 62f02bff0227..63fae1bbfe66 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4648,6 +4648,62 @@ tlmm: pinctrl@f100000 {
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

