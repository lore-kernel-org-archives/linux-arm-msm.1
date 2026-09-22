Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BFF5226B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063521; cv=none; b=bWofKabKeJ08zK7BPibbrtmUS87qlb5raQJ27L5Pa7X7WAnAL5Yi1wX87hVdYhZSxOiIVT5QTG5SktjlPlyCeRbe0SIsyA1vqT4fG3UMCVD2WpaEUs7RHAiEYzr8Osi2BVjfjluuqxCP4BdwHehdFTywx30dKPSf9+6yQyrtq5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063521; c=relaxed/simple;
	bh=tUsGnjxAQluXhBWdn1FaaRX8piLBvySN6gQbGp5kPpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gq38zP0MTTXq9P80I4rhNvzBQVaQBFQOWzyuPk10Cyq8+XEnBiW/dI85yBYUfeghjXJg2QkLNcrh/SLNZs3P2kw2KwT1aiwzpLVPqCSzrjJOPcHVmNz+0b2hVj8qm4WHDmacgNJDCjCp40wF8Qn0mmHndUSAD3ckthvAiiMcp28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+OfKJCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NINsiYCI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+OfKJCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NINsiYCI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7K38V3840704
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LahEUqXBwn8jG0TicUBeV2md0fZYZ7bCFAy745Dvk4Q=; b=h+OfKJCMK/D8zCjj
	P4uR4AAFlMj0hMhan7iCN+tMmBMkt5AzxdpOaLyJNUX0M7tX684kjZx/lq2ro0O8
	B+N2mJIOKoSEl69ibk3WqQIpFalHNPTRQ8lTbIwbJ2wg6+Qk3jvN/Rv8pm9npwVl
	kJkyB5D+z4Ntg/d+zW37VofRiTw61Ca7QJb1rgN1JjQVKRFyY8ZJkh+yODQmxRsr
	oqZ5tL2ArDPAvCXchA172UJA44TUBog16iOCZj6SCamiSkwM6rA2KplA7fqBRqiC
	+7m729fMsgKAjp5lpiWTX7ETUByH9t70rLbbPBpCwYSlnzHo313n3M0QTJPwO5Ua
	j0XsEw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v52wfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso603474785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063498; x=1790668298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LahEUqXBwn8jG0TicUBeV2md0fZYZ7bCFAy745Dvk4Q=;
        b=NINsiYCIMmZUA1Kghm9NMaxwn4DDUK5tCrzvIH87RFVcHcY2PtRg+fpSV1cRyx1JHR
         yycfrVohBJAVE17J62+Nf1ddAnoB6Gzcw1nUJIoOy24cpakqv7Jau85UgsRPP7FzIPPQ
         PofDpie44oG5EBFFYIe/rEI4gugQZydPSNkC9cRuocJr49psfGg2Z4noFODucJ8axySP
         Kffds2jdzkgp8ayqraJiKwnvDT49z1Bsyjc3qNLA5VFrRwRstiepnNcyBM3K2zUt+kuu
         pa5NGfyO+E0nXV41b0zwL9XdE1mZ3Ss/hEnHTQfXF0pGAbedPmDwRJ02TeeHhOqM5PFi
         ZlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063498; x=1790668298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LahEUqXBwn8jG0TicUBeV2md0fZYZ7bCFAy745Dvk4Q=;
        b=E3txNBjxQ8q3gaSSFw+2GaHCo3y7yxYukCQwR3RQJbXvcr0rl4oPjTlXTOsb6YTkgA
         kXIKxuRtNr5YSeoScH4rNPGT+eZS9HCDBheyBfTNkkK6xXRB31mtl4ahVlPTUC8dNP4o
         H//DtnzIQPLzsOEX1nMu0Ph1UzbN3xlZEEZEHeWKNdhxv2cE7fx7J7GNj07/lCCL7RnU
         XdmJ2t6dvVeHpfsm0AjEar0IsP2e3B7LTfcwjEMrMKHqueSmja9zNuCHwsYfVCnk7xMD
         6h7oZB/UHA9sMd9U3roN6TyUkiZ7gWvpc43lEsyFDdb2zEgmINbGuQ+g22cA9XLBOb7g
         4pNA==
X-Gm-Message-State: AFuF++m/eSy66oAxx96Bqg0mt6NCUitvgKtgjWoQ9etzDLFEPO3gMmWK
	m9TxLPpZO1mhW2ZeVuUDKfx7lvyFERerCPYkgZvRKoWQDn1jrJl/ltU/mEZq1IsFiKLYihisYJl
	c6irBHvqvic5ewqailvw89PXhPO//pmQXvRIiVSSomzAFYXQ9vYKcWP4dvOaDLnmUk6Pn
X-Gm-Gg: AYBFou0DJbjwwyhP/PPPNs+cROrlSKGqusM89bWI9UvXq+C55By0IcBTrdPXLuz6yzf
	aZhyw34uUuLC+MhO55DTtic7FHJzUX7+ZeT1dTY63Pi6Uqibf9TDYdgeuKcgqPcjBLGtwb8pZN1
	BxWLVrQzig9RmRSgGbShpzLxtcchE27XBxbD0uN+6yw935lFh1Tp7zsH6BBS51P1Q3l1qfWWF5M
	ioeevIiDHBiR3Esr1I4K1ITwkpz5oxtBTqZJEVZSJJkeiGuIvLG8GNXiY8MymNC8pXFYYqnpbc3
	bhTTT+jdn7vX7T0XMdX9uKvXe1eNO/PwNB/Ngu4cDg9a0OyYkmrNG1/+3vCuHHhAFaSsnWF7ZHd
	4vgYyRM+b
X-Received: by 2002:a05:620a:468e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93c15d9ca6cmr456935185a.20.1790063498347;
        Tue, 22 Sep 2026 00:51:38 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93c15d9ca6cmr456932485a.20.1790063497826;
        Tue, 22 Sep 2026 00:51:37 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:13 +0300
Subject: [PATCH v3 04/13] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark
 the EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-4-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=tUsGnjxAQluXhBWdn1FaaRX8piLBvySN6gQbGp5kPpY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN1kS+D2XRkQuCNZtJEwWCr3TKPNBIvEnXx9
 JD4KZbkJBiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzdQAKCRAbX0TJAJUV
 VlwED/9dxy1P+qFvBxdiqeGEeAcXMkBXz9jaHuo7Sf6nPZ97RSnyy6RkIXINh5+ZZdOQYTXaa7y
 V7l+6ATN+PgF5n7acDUJKPjvRbhybVGNb8ELTWk/vFD7zOVRd9947F3n5bRNShdwKZAwQGgM6UT
 e8lll47S4zZIwVWWMi4UQ9+4LO5vninutj3GniBlbcckKwoqhDZjd8Rfb0OlJ1/T1qatT9LpggI
 vBKNn78HutAFwirOkMJ8ppSUsSYqt7H5AxHEMBqaHSi8oOG+1Q1riyUJO+Lqd0Bqjv2wMy1vgHY
 eUy/EbWOIADEbPwxFWJCa4BXVU1vXhHh6ZNzhYuw4KJ48iFKI0ZUJz3FG61BJ4KzbHt46P0uJ6+
 J/+YVLweT1ggGGWrAz74j0+/7mg0PYfqmcmdGRYlsalolnkoZmjajbfYdhUqAIvsAUzttOfiuLH
 uggsnZuaOt1r/2rxYvUEBKbqCLe1pJ22Uc7iIuz3ARq3NesHLQIAPvbn8wupXqqCBJnsqNCG/1Q
 nSZsirvZOMaNrMcpseTz/1v5SdwoI6g0HnFXjGPYZw8AqG3OMb8kiTkJkyqRshi/gadoVBFZPeW
 YbpRTelfu1MUna3LNpuhoVsTj/3dEVu++UcGy40uuZ6RpY5myyS66zDSKCT6n8Gf4XURt71W1jW
 fx19mCpuIDqnNPw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: jT9kyaKlmZiWzIvN9c6Ia93gKC_sXFMa
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab2338b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX+cP8BSuOoVTV
 nxOH6MiAjNR8k6+MLYl4sKG5XDtL28BGzgfUiGVeofprhXZVQHv7h9LqvPFH7Mwp1XYJZR36l3a
 Y5oEw4+C6jbfvR/yFgxfeJlIFDvk6go=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX6sU2Tb5WdwYs
 oY3Yg0EfO/uSHYTeHXagcROpCTECr/hW8JMXTzqQ88ueIH5lpzNK7dXNeRoT/mcuoqe++JZtYTV
 bH74bvtK6rgn1ToSFK5OwXz7juhkkaDiAkXLhyHgaDJHbuWnNM7upFOD5U0AXwp//1Nu537rO8Y
 LS9e5QSiGHnTvczSZQZEgSsZEMdDT1LbfxCEgc2QwXnDqC4eKHlw7uwGDBiwOf9qmysYI4w8bxD
 wAUZcijhUOJ9QIwAAMtxdY3r3ovwNuAiMNJzUGqvxlPHCGwVXLgxSAcIaeYbWXGcGQZlhxhHfoE
 3FsWuigjA8rcJUYU2GUAzibBDgz87XqOSiDUWLpfFsKB1IDA3htQFvlVfKAwKS/RL/BEtEVLecO
 Vnd9TjtkaExXBu67WqWWNT397xZMZr5s6nG6id5RJw7tm6H1YdWyec09eHPufJfkMVsKiwgGvbL
 C7BU2GPtZjs3syw2edw==
X-Proofpoint-ORIG-GUID: jT9kyaKlmZiWzIvN9c6Ia93gKC_sXFMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ad62350ba670..f48e6bc35006 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1093,6 +1093,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	cam_indicator_en: cam-indicator-en-state {

-- 
2.54.0

