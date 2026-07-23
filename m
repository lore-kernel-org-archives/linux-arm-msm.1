Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3F243BDB9
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802859; cv=none; b=M8PXTmH1TOAR/sRFEYlTxccQzYVEgTE0XShqNupWjAhgMz7MxfQ9yQ02QOIonBevW2jtzXDXUkS3S17JJQ/6h1T40PvI1Va1RQfLx7VIozmYCQ745Kl4KQJEskP7ws1AGb5sIpwbA21N0qE7dwToz/TkuuGpzfvjxvLtDMqRVvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802859; c=relaxed/simple;
	bh=xLZ9TWW6MMQBSsF7j4wy/Z+2lMeLJqujJks5Zbt+zwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fSXP39t/71sq+T4kH362Jo0kSLk1X6TFHwANQqlolsE1gPyr7cdgCgI7vss7cNNTMfWDIhdftJq/jIVS/hD1SI0ADU+BeHwZWS1C9sYZ0ocaImNURmRlXboeJtLLVbBe/INwebPLPWDkFF6YOf2JALdDrryR3+GIlx23SCAq2ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNFLCanZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDMl7V7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNFLCanZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDMl7V7A"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8rC5K3790976
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LKMLi0nVB7czOTCiwIlLyjNOiVt8O5c+I2yt+KJqUeo=; b=MNFLCanZnuFagL8Y
	jjYm1LEjpIvDvkPIzUlhLPMzz2HF1mddn02TOSMLqISHUyD8NxP6S9RKNZi8Jdsd
	JsRoFRlQaDHrsz+jrk+rICf1Olc7VsDC4HCzvThc42YJs0xn/kySrIvQHxBvoFMq
	CGL1JqY6e5iYtEY2ncnazs9RnSda271ss72H8hOW9UlU8k6RrP6dGOCtA32UkXku
	W5tBNNest80/nggoxkDcZvK6M8gifSdZ1SgwaeMSSYPZcjHOo9VqK+YYreJDuGmF
	AQS10dftRc4lECDkq+N7TYvUEnGVo5Gm5bsTeFAgfAhf7Q4cS0tOxiMp2ptON1S1
	KTB8dw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52bq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:34:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso14875225ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802857; x=1785407657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKMLi0nVB7czOTCiwIlLyjNOiVt8O5c+I2yt+KJqUeo=;
        b=XDMl7V7AJ0aI7QTGG0oBzzDDnnM7KMgKoG06xgY40UZrvb9DC18+Ig3NHTt3dhS3rX
         XAZniOTDU5nSgFivJCMk2vn+QvgfV9DIGwgyWcEW0WRyBHXnOBHLXPKpLJLn9fTNXB6r
         FT5gGXWA1t8J3UqgkOlzBNpqkImZdhSKK4GjZ0biiz8JMDBE2Yid0itDPJvEMZKvk9RH
         xEsalnDVgciY2ALNaqyX69UzEHiE/LvmS0ICKfnm3+BzJEtLWGKf8d3LindIe5POCAR5
         Z/h7ifzMI5jbgvL4r58BYx02TfLeovGQLJZm9gxLjI55GjMs/wMpUlXwk47xsc1HpmgV
         FRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802857; x=1785407657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKMLi0nVB7czOTCiwIlLyjNOiVt8O5c+I2yt+KJqUeo=;
        b=mafvcmV3/ioe/iblpHSFP3pQW9hxkaziN3ffMUkKdzlnF2ScxszaUOJFuUTSruGm6H
         vHpc8syhndYRSlr6CbKgkaa98rOsCdfXOfFvk+b59E8C7FmJ7hzWk0tWb9o3cOTsVYpr
         olH3SzZtEpjpdihcgwApJZw/xCSpYg3CRn3f8/1cZWxaoGPrT3yuouhNpaGW7EurLS/U
         xp4+9bcvCnPg+B42x+M8+7M4NtVen6Yq7mmX5pn8clzmm5KDNEx8ujsc2zd0zCdOnDyJ
         RqysIQpz8wEsrGoY1JwI+xWa7V3MZLXnWvTJt5OCn/4WTidaxUjojMn7M/wp1GvHu47J
         xtLw==
X-Gm-Message-State: AOJu0Yx5s5Us+//DltoxNqF1jZK2/6FfGGLOMkkzX/kmilMqP+KAhT52
	uFZI5Sgnci/+Lid1NEcxw4fxOeLsbO6OL5PSeAldzshknhCEaWW84VTYUBAOmV0J7wcvaT2vbU9
	sNV0f2Xzp65G4gp/auvoIYE/NYiaw/hmYSZnorRfJp+0UNY+ZlalLRmfyUhnGQAYkSbgS
X-Gm-Gg: AR+sD11f6o9qOUnyW8WQYWc+RXTMTk2vXbLCJAgxY6+99HDqNrUbKREYmQZ8qHyPgSI
	Xzyn9UgpKHufSOIgW36Yv016w3A+5UDArE4PEJfWY/YpOtpWxJl2jNA/5zRoW5NzzxGOo2ioHMG
	Ez4Y9n/BU5pQTfrr1loS1pzKfVFqJBA1tnbyaqar9leqepnxPOjNzEAGmYl+Il7AKoSHunYfjHe
	sPJ3OsrEZxXpi5sm02RzKPsHV+fQTq9OWNa05PXMZ5nPyU4uzew+bSsw5PVSnrqGIbU3+Z9M/40
	sc+vFDDZ2jcn6xK7AJS6A2vqVlF7KzFwiV7giKncLh3/W0MPd71z35r0zmMAX4wQ4pOkwYfGBW3
	nA7iBIkN5XiYAK7ZMe5rE8ojA4kAor5ncxfqDL9dr7EWfcrDB8fBLlxvtr3Tti9fKvWjqeA==
X-Received: by 2002:a17:902:e786:b0:2ca:6d87:cda0 with SMTP id d9443c01a7336-2cfa71b75afmr31770105ad.6.1784802856796;
        Thu, 23 Jul 2026 03:34:16 -0700 (PDT)
X-Received: by 2002:a17:902:e786:b0:2ca:6d87:cda0 with SMTP id d9443c01a7336-2cfa71b75afmr31769845ad.6.1784802856371;
        Thu, 23 Jul 2026 03:34:16 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6203sm32416155ad.44.2026.07.23.03.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:34:15 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:03:54 +0530
Subject: [PATCH v5 4/4] arm64: dts: qcom: Enable USB controllers on Shikra
 IQS platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-usb-shikra-dt-v4-v5-4-5b69d9eb0888@oss.qualcomm.com>
References: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
In-Reply-To: <20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802836; l=1277;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=xLZ9TWW6MMQBSsF7j4wy/Z+2lMeLJqujJks5Zbt+zwI=;
 b=I+nbYfmWX0cW3C3m7QLURFbBBQhShby+ipagnBurq8zD3+n2smINF0NQ6YgYlWfA8UkZC//o7
 vvc1AOqOou2CuNaMB4x1TkNTfnDm6q+Urc9ggXo1KhmomlOqcEj9zWB
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX2BToWUd/ERND
 eT4SiblD1iJs3pNT0gZfVoAYyvffBLQMaSidDZdqccD9TIWCT+KGGUsXM4rRd1kwQql3R1Yv7cd
 lliaOF9qpUETilhBD5aZD2Qx5Acp+BY+8e8BqDiAoh6Bo3wW6DPH6Zh///4RbPt1FPIwZHkmxg2
 SkTANvbEWySdHC2djoUoG35Ns7wpL1U2yMW6CMMwuuKd4MwEjvNP0HmnpVN9kf+kX9TA42B/A6G
 Wu6pwvzaRSBvvagWvC29x4c3c7mmQocBsrcLOcXhdelwC2+0jBApcsjqvRHVTy1vv8aXyq/oJa0
 6gg9Myw8JiU/+Sqd3i3uROK0fVJx4jrgKS/FSMGRG6Tl2vv0QFnEyJ3az/XgjBL4stnf0wTxafe
 N8Jf/5tbVLMUzxnzLs6Dqbr0arzG28yt15C01Aw61TrspgkgCX5TQM4bTLMNJBenKUEXhj4X0Bk
 YnRktDZAg86pIhrgk4Q==
X-Proofpoint-GUID: 8SxPBAtKlqBXzLRbKhf1dO2HLodgKN8J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMyBTYWx0ZWRfX8Fe9WmTYd3gw
 +ZH6OxOWB/7Kv0EY4lDsX1aUos+4ONs7Er0xLRc55tsk0mbXsT86zlco7M9CRveaKVRDcazL5zG
 I9qJmpfFO3lVly7zEoLVPrjNs+9osVo=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61ee29 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bymAw6jGh9HDV1aGW0AA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 8SxPBAtKlqBXzLRbKhf1dO2HLodgKN8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230103

On Shikra IQS platform, usb-role-switch is handled by Cypress PD
controller CYPD6129 on both Type-C ports. Since those changes are not yet
present, enabling both USB controllers in device mode.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..2d4e34ec3b82 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -38,3 +38,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

