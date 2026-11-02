Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616166;
	b=VGMfKtjE/LXzLlqfVHRYoNpZIRKmMSjbJMf8YyNwIcCzKxwzQgEGI6n08AM/Xzs423Dp
	 ar0/OvLxHcCbFmCcB4o5Af4jMZsNrmc+Gs1NEc5DDVx50W7uusQrYBlM1unaePegFIpVq
	 gCzGF37iN311pk48ebBzj3X4qg1M/SDPrfdaBH+16IfU/6O/mdzdhlNN2AsFrJvmlTmGS
	 JUMbkRHvMvhr8N5LoRdTuycG1/d6D7IIEx0+FloBUFJNf+5kOYQ7DJJ1JhIh5G8ZkBR+C
	 u/Epf8ArAq9JazN3Q+PCYCGRhY3jXbShyaSJ+ZrnA8nhSEadx5uk+H1vB6tdK5dntpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616166;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=;
	b=zNQ9WrYt47AXv2Lehlc8IBZpBBYS9Ax8lmhvmKtEhfrOZ/qMVW8y88eIKJES39QJlOmH
	 8RzBpAgxi5BDIpmQ9197iqj8yT5FVjUPDY7UurpzbIG9yLJsjZvqI3ufC8fDs0GsVDSrv
	 CQ/fMGyuh8ubrqwRutYc3JkWvJp0gv3dx07frdPON3bePjqzgDizSFbVc613SBUgw1t7b
	 DVOY4yJmlBq7qa2MEvUc2de5/wZrzuUcfhnts1R2Hq33ZOygo/4LdEbLKX/SHvwBIwZth
	 PsJCL6B1eWDXtfwSE+9RKr4EISmvm5OFG/Styq3hs8ueJVuMQacNbUSmmWSWM61OiEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaFOtdmP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xf12DpO/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C37606F77D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C37606F77D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaFOtdmP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xf12DpO/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299xOq3402433
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=; b=kaFOtdmP024Jr7aS
	G0xi9hA4iBnG5ODY/1hcwxRRjEjhSiHO0bsK3NVaCCsdex7iBF1mHrlcigoQrt92
	QOjhU/HCfwYcJF1bMVd3Xi0TDNjyeYuLJ0wcKljPX5gUxTRunDkg7i7CehUNBI0s
	HLDJBsO2GL3YvBSXIXBnNCjup9J8UItVT8zUicXV2XPToO9wzxpYYMLFhEIWs1Ei
	XoDvCQKlsNsDUNRYaKKDri+yTHWPpncnZXQByHItDE/ojZjMVkCDPd3V/Aqq5qjl
	M98FebJsDaJrLjG1S1Y7OPWFP14URmD8KIZ/8wtPikyOu4OtH505Bv045+HqNc9q
	B9/eKw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8q25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:45 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso4705909b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616164; x=1794220964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=;
        b=Xf12DpO/kZnRBRN6AvepZsRZ1jR8MM1mU25GW4EmDi9jXmDRCIjQ9OUqewn+Ed9eLH
         AofgjgE6gaWzpmJgLYm+rJVZ91a9PkOXl1wCWzcLetcNKz8UvXAyM90yVpSkgV3IDx9k
         OFrNXVuJEIh8i16uJL9cUW2KxDlFWLR84fB2G8sEPD23vLsGUYa2+wC8XG+dNWCo9GQz
         DTJH1n04nk8bbnzn1kJ60xsESSSEXLN5dK88jb14XT/ljJdA7OkGhSy4+tmosEbdk3hT
         lKxExi1aWstqtPiK4Vfq1PEyPscj55yiEtE7y341dSZyOZUGWwnGV2k7WpDCRuK3znJy
         QO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616164; x=1794220964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=;
        b=ktlQ7Tgl2qyRWepbQcr68esjQIJCV1Kv4WbOj2MhMDWnC+bzbjuMP12PCfcPB7mbM4
         p049nzy2RyDbqy0ZhCw5kFd3t6vhoclz1nJ9gSOBP8bKkXw7uS1cEvpD7ywTqv165CVj
         U34rA3QanQl3RMnwYmTYrs2YNEPhSCAqdhxXSBNIogKkcELGen04leqrp4vnE4ijiTHw
         YTmyka6VJia4LoUhgLpGWz15p997nnCh5bnw5oOsmzrqTNDEJMTxnMTZO8YOH2LtP1Fk
         l//2bmLHMI/zFPUpdnTih3wPlTOQuqJ3hnb9Qs+hR/UKOeiCpPwAa+e5c+tp6y/BnAZw
         Yu3Q==
X-Forwarded-Encrypted: i=1; AKwUvByo+ZkWeGPoyV821ZNpW20Ozre+1QNVERP56sp9A6DaWmbPThEBLq/j0FoycQ4UPtKErVALEHpWMbifl+O0@vger.kernel.org
X-Gm-Message-State: AFq9FYKTxWyenYVnAkiqzbB3R349zhWOCAu+ZKhj1lNPUQ8VZl0ayiPB
	W/hfu+myA8ZjPrAQEJILnOV80BYh7mN0whMfHOPEJBVS1J5kq+qzUHNxQu1j5Y4Q82pmHOcUzdb
	C2oN7d+QGvwRXy7/hKcUI9QAMhzva+6Qitj1551ghoIBfFcioyPMSB8y4xyagbr7X6RIAWuA7O7
	KKXJ4=
X-Gm-Gg: AYBFou2CP3gzGJEIJ5gOLE0dW+r978JtYpW8msvM7mTt/E42dt1S7ZNaw1e8JJukRQD
	uAKOAkF8OLv/rnEJ6LAmtJWTxk1sEPMfzMqCnv6tOZ88TTIAo6Xqw3kogUtV3zDOruathjZ5cFs
	avgYj7aiQ30FUfHJgoyJEFVxbu3lJZ1GWKeC48f/ZkqtynPoOZZj5mBzXB1uH+hQJe6O6vHv1Zd
	pgqI5BvGcE4cjjm9OeqaOD6JPK3pQSIZMU+magj/EvhKwgflFo0UPCBXgF7fUvCqwfMmfIwT76S
	PKIK+ztR78dChx8PT+japH5emPi8VXcV+ZkIoPlHS1aCLPH6fU8thf/oWCPOQUNKOldUvtRQKwv
	hww5z5XQRw8W6AfJ+QyUqCahVo6rQ627Idf040D2qvHYVJ+TBThq9pkMKUvXR6F4Zj+/FJFFMF9
	fz3KCwejPtSWUN2088UKJnlffbpbsFEIPqOzojZIrP7PIB1g8aKcmqW+WhIvs=
X-Received: by 2002:a05:6808:bc1:b0:53c:156b:a16d with SMTP id 5614622812f47-5640de7bd03mr6296068b6e.56.1793616163690;
        Mon, 02 Nov 2026 02:42:43 -0800 (PST)
X-Received: by 2002:a05:6808:bc1:b0:53c:156b:a16d with SMTP id 5614622812f47-5640de7bd03mr6296049b6e.56.1793616163284;
        Mon, 02 Nov 2026 02:42:43 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:42 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:22 -0800
Subject: [PATCH v24 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-kaanapali-camss-v24-14-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae86925 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/JYO+RHYXQt6
 r1XRCSiyOGTdTCa6UUQhVX1PHExj8urQt4Pl8CrohrkVMcIKT00gi2+tpJESQ/eFHgpS77GCkjP
 buuyfIKMKTL3J4cumticdid5WBKIX2v9QZCXmYxevpR1yw3tHdBZQnPulSLIA2ec2lXoqU5VUVU
 Z9zJ5FO0x6MFcDDsrCSDF5YVuCmd9P47/JS0YRTFa1Djo3kNychrNuF6OT3ZprtHTDi6exJXzEP
 /SWfMKdDL7yoFXUvGcCu6Xqbvm5aeQS+nGv7x9wZXz2dQms9ugw+RdlGVM8WvfzXMCsvz4HVXIV
 ml/5Ru4VF8j/Ii7TbVkAK+aSQ/4B3kEH7/1cjOqhKYN1PKGE/9nXux2S0KuFuh+v2uKU7+nCfav
 X52327zq2MyMNDQ85KuVL8TTuhlVrzI5wKShhpsmG9AEkGXsuu5aU/j07BCfqQDfIDXZvXydZvz
 2y2ncOO75dTQTlx3iXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXwxGgCZZoMqE1
 mlF4SE3kXsRyN7hwYr/SXsnl/rFatk5ijuthbrfwD02jm3xTaM1lAAPFQJtdnTpm33pL5EsHWeG
 5CyOYj63cs5w49ZPugI4P8NfykM5qe0=
X-Proofpoint-ORIG-GUID: D-d3dfPbKFLiN4ziADpF1C0ptdDGgaCo
X-Proofpoint-GUID: D-d3dfPbKFLiN4ziADpF1C0ptdDGgaCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index fbd65c2ad95e..cf43cb8351ed 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4645,6 +4645,62 @@ tlmm: pinctrl@f100000 {
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

