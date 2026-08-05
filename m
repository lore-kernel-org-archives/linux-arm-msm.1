Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA413E6DD0
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925871; cv=none; b=ik3WEATNQF4vvxIjvrOUjkZPohWw4uHJYHeD2E6PhXIHbG/vB/V/BlZ02QBTm8a6JHpAn+hDdT4yW6YX7k34cIkMrwlUMO/Ckol54Ek4//9MX/a95iC9IDohhKggwDKbCeACmiumNu86Hb3xbbD2CKKI47XJDCdc9PURDxq1vBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925871; c=relaxed/simple;
	bh=MvRgZKUxXRsDf4Mbc8Ovyhw3jpFTzaoTJuv23rjTqQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NkazV/xrEWR3WUAbn30YVOZ27/q0tVcP+9dat6c+/nJZvAs2068ip4dYsKJ1Y+t+I5VdusycbK/Tv7Di1V7yXGYl4L08PjxlydNh0gIo60yRXWXv21kb0hSkJkeSz2GDaGJGpAyBxMZGmV15M9Vpp+FI3v48MMYAQrUSxulod0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5nYUKBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCKpd243; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5nYUKBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCKpd243"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dGdD3540227
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 10:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P/2KY7RrGDKdg29EKD0DrKa2Lw0F2Jc2kOKg3e7hHa0=; b=o5nYUKBLDJJaE8+G
	9z29mQnE0rf9PX5jk7lj5DVt8ZtgsIVEd9m/UUws4Km7F8qaAL8Z7xQYpjAWLSuz
	D3ly3bpGmB5+ZTbO77jhH3VaG90u322J0bKmoBD8X+0TpgQiUWsXuiExV9BIj6aL
	iuShyQF4qispfWamHR15UlORJlaTgiyBzQKplM8uIA30nbOmvJdghUW8LaHbf9k8
	NudVFhwXn9gSz/9ilE/J64BXxVmXbhnSLl7nYUBOIDmpQWKQWt/EPzHnHH/5Os89
	3EAGh2Z8fL3r7tKtdXoFTg1DoQwed+EXtFDYIgJO8bZQ+phqCs4hLVvl0+sAzz9g
	M+2G1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3uj72p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 10:31:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so7839831cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785925868; x=1786530668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P/2KY7RrGDKdg29EKD0DrKa2Lw0F2Jc2kOKg3e7hHa0=;
        b=BCKpd243F+EJJpHOwQXsqpRlJEY9ksUJZ4MlXjBw2TcuDCGKIMm6X214xQiYpUx5Pc
         EJDSJs7JrwLg3vJDq19SlcBv+YlEZmKPji4Iw3Un1pzk0g/JQtUbXaoUZN9vwghEEnHs
         C5gLSdPEdhNbKKXBCrFPTQNWbJFkak5Dy/mPOjGKTjVLNCE7LG8H00VF21XAN0x+NQCq
         FvAHaLib3nahtM5Bi+PQuhEk1gWPvhVpeAYbZA2OmOeQimoghL5tpyQJL4EnUkX5cNyL
         DFDQwRwTIBbsbQNNT7Mf6Q7dESwIrCzgpkiaF65LyFfxvB2vR8Dm9LuWZM/LMuVciF/q
         gBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785925868; x=1786530668;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/2KY7RrGDKdg29EKD0DrKa2Lw0F2Jc2kOKg3e7hHa0=;
        b=AryS6Rbix8GFxImbyr6/ug9FjfnWetNkk6c1gH/uBzhs0ICr2nqFrYt4Iqg/Ft2d1H
         utGjIZ17Ei6B9WqKOTbz5ka8b/MMxNYH7R/U7lF9PNfFYZJsIrPpFVFBgTjKz3jF57VZ
         BPYPC49v0+hVdIsdoz1FZBhcd4lZej52mwcnx5NfUdesMYD0xxGxzZ7lJJgjTNAd95TM
         T1jKQ/AIoqqXuW5ccFNhQqpVD60VeGWXSrWc1i6D0eXOJoXg9I2LmX3YGH9DzRDiJZSK
         /1rGZ5Kv+BMGOTyPenam+mF5pifz6WQkqGz0J4q6HNuV6p5razRic69yhhWPHd2XsZhO
         X/wA==
X-Gm-Message-State: AOJu0Ywqm+ceaQmNUOYwFXKdAFLfOb6+WN7uY9UV8zYBBu+RuynJ+qXm
	6hAyu2Q3tz0JnVSbcHQyo6n/ttKqPR4v2S3bwKsngZavQANxSdLV3I2Be0RtdPW37SMLpRGn4jO
	+9y6B6I3LSdrLMHJXI5wHOsRwQvDpYnoOYgeQodfldlA6lN+97uW90Q2Fk+Z3OE3ReJcO
X-Gm-Gg: AR+sD13YPOkDZwz43S1XSB4nh7QWTn+/CRPjW86w6kkwwBBu8HQybaMej9L92wlkZxe
	pFDg1MkCj9rs9Q7nA7Q7kht8Huvhe1AKHEvUCdg/XYc+MsIB5KerV43aSY/INJUwtC08FDjNU8Z
	HFBoRaGz/LQg2GZ4K2YsEcI6GeGKe8RvHo1gTKf0OnHYTll7A7Do9iQnoVNT4nttbwSXuuGEi1e
	vPnvKgdgFoCZ1biYTL5y4o/RXWiVl/SF/CNu9tzQ6uQE1ZabI6u5iNIS2Q3j+2WRSWqthDtAkq1
	koyG8IimVDZJG1+GpPjFXjVgcOcWDm1EM625ChtxKmWKfTeFojFBP0Nc0Hcl6HJ+Yf4jTtGxral
	W85mEJwn2Zgp/Fg/X2KxoGTOJ/tK0iW7O6p7DBaODkJlJd5njBHxkf+ZVax4=
X-Received: by 2002:a05:622a:994:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52ce61015cemr53754681cf.20.1785925868414;
        Wed, 05 Aug 2026 03:31:08 -0700 (PDT)
X-Received: by 2002:a05:622a:994:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52ce61015cemr53752681cf.20.1785925866644;
        Wed, 05 Aug 2026 03:31:06 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d814sm22259706d6.10.2026.08.05.03.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:31:05 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v3 2/4] arm64: dts: qcom: fix PURWA/HAMOA IOT SOM compatibles
Date: Wed,  5 Aug 2026 18:30:01 +0800
Message-ID: <20260805-hamoa-come-v3-v3-2-20463c43eae1@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX9iZVL8ObY7lZ
 rMS3Vd0VNE1dwoE5csWTiZh5FGzJpsjfcHGkXY7vt1mm5MfYW0qmv/CZd068uXRR76cEEeHlnLp
 2xzthOivPrfurBkvGB1ZCbhIRynTz+I=
X-Proofpoint-GUID: ZvgdlADaXWDvKpanRo7QlmST2fFZMg2o
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a7310ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CGs7eBeCNeLIcw_ASWkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ZvgdlADaXWDvKpanRo7QlmST2fFZMg2o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX5OcZBPDRqGqi
 lBYvPqvvvW114wKWqDO8vr7yVTAECfPwpispeO+Ju2z1Ff5JPEkFNAOcLCozc2Aefs2OTGXsLas
 5mdgECmjfN848OEuLCZSwAolRYg1TuE4nkxDykp1xNMrI3IrfgDa5NWPQW05ll8iJGR6FoeBRkr
 6ZIfy6oKOGYJxoMf2yKNWxVgHKOYATQ9j7L1HaPfL4hSjznEUf0939c+gcAXMX4pCoLEX24wu1k
 ZnMDI0dKvwTGvxn5cjDDUSERy9Dzt+7OHOX2Qa1KLAp8gihN6d7tI/FWreATiRfz6Ph8vRvGXPB
 +5U/qKFaEG7WRfj31NN4gI+axbsqfLlMXL9OeQixDWFgAmfv9cE44IEDXLruPToAg7HYuAVyAmj
 Ns+afVNejUOaZMNUC11Av3R3mvCYrzOXvaF/C2MQzNfWG+NxkLO1B1hUUFvTQi2s/pqzrvCigbY
 2BBO6BPwEmC4FQ2OWig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050083

The compatible strings used for the Hamoa and Purwa IoT SOMs do not
match the naming used in the corresponding hardware documentation.

The SOMs are documented using their IQ product names and there are no
products identified as hamoa-iot-som or purwa-iot-som. Update the SOM
compatible strings to use the documented hardware names instead.

This keeps the DTS compatible strings aligned with the official
Qualcomm hardware documentation.

Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts                            | 4 ++--
 .../arm64/boot/dts/qcom/{purwa-iot-som.dtsi => iq-x5121-evk-som.dtsi} | 0
 .../arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => iq-x7181-evk-som.dtsi} | 0
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts                            | 4 ++--
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..b807079a5ee2 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -6,12 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
-#include "hamoa-iot-som.dtsi"
+#include "iq-x7181-evk-som.dtsi"
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
-	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
+	compatible = "qcom,hamoa-iot-evk", "qcom,iq-x7181-evk-som", "qcom,x1e80100";
 	chassis-type = "embedded";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/iq-x5121-evk-som.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
rename to arch/arm64/boot/dts/qcom/iq-x5121-evk-som.dtsi
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/iq-x7181-evk-som.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
rename to arch/arm64/boot/dts/qcom/iq-x7181-evk-som.dtsi
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..d2963af1d762 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -6,12 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
-#include "purwa-iot-som.dtsi"
+#include "iq-x5121-evk-som.dtsi"
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Purwa IoT EVK";
-	compatible = "qcom,purwa-iot-evk", "qcom,purwa-iot-som", "qcom,x1p42100";
+	compatible = "qcom,purwa-iot-evk", "qcom,iq-x5121-evk-som", "qcom,x1p42100";
 	chassis-type = "embedded";
 
 	aliases {

-- 
2.43.0
