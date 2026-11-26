Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693071;
	b=s7Ou3SIdqKngw5eda2sqY4psHtY/1nNtoCTThSKIcyCOg1AH1n1ACpWafQ+7ejvOUHNq
	 5B8PHXCrAVukGQ3kW8g5GSQK4R5O/34xxj1QEAIE/TORkN82TqR4CqrdRLF74T77RstxY
	 A9mbrr4Zc4gSgZvY1/COx6DBEHAcwwCJdpTMu5f6wsc4rh0p1f2U6a3U8kmVaY/Z6GS4Y
	 IaR9W9b/VsGjWENFtjztG4iHEV4TrJaXeg8PfINvF7tU8qKGSAh+sen7tZ+5nxnvupwJV
	 V/wp9PHKEM2semz/OU5Jk0qhuw/tLVJNqEiT0A4KyWUCDmD93S6HTQhMcnPeSkp+d9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=;
	b=haoSle372KUSe041v4hPEBQfKIEa+YR+bRcpqNS2MaYJG8iAa+Br9z7gM7OfzGd2fVmq
	 QRQPOd2Ff3szD1hvo8iAc5SFPcLJa9J9pJiP47PIf5ed/KKl21NWJYv5bFQmMLf0sYY2A
	 IFeZKaaWZ3tzVpghlhoqP5/VkfOax9EWwexFqcXPc9vzHyKNUEVn237fi5ngjp4qrd0W3
	 QCqiCLetDa84TM/+qF+AVnV1lsgk9qm15vym27HGiCJ4xhw2N9DTpTTdrIdmgbhyEib5/
	 1lDafl9JsrVg186PZP3EOT8m4TCkkRoGm3ditga6Wsbur3c/yg8JHNKrGI0nOWXfbCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFyF1npW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjpkUkGe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C8606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B87C8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFyF1npW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjpkUkGe
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVQSL2758191
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=; b=YFyF1npWBUPrpKGx
	03Idc/jl503Mh8IvsP5cFqI2ifkAzCGwGoT7W70dhyEwmZ6uCXi7aUUrsT+shyal
	M3E6Au5NGAqIzxvl5ZfaoUIONeJPIuyFFOZgTJ/sq0RWsmM1gd1Z3mlBowQGapet
	9LU13hvFbZne0zqgkPTN/8bbxOrnyE+PB/MtN884hr6SUyCT/N2AYAI+CmO6JJme
	p8nbl/7jqC3+le7yAfqkCDYNxd5CvZt6juOtwqAUIbJSxkoH0O30NLvGOSKsH2lQ
	vYe+pAk4Vcml/cv2nLJI1dgxBRtWafkOPuyIqODzaCznISGUI9fxBrBD8p+JTRsH
	AiADFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahv8av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94975041698so1642898385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693069; x=1796297869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=;
        b=OjpkUkGeF9F07UW+bXXzjvi9u6hM0DwRuYozxiUBsltmm7HiiBCuIHvmUmlTveQWkX
         koWfvHY5v6MuzwPCb/rzZXo82NrPwQHj0FZ6+kuS+BqBjxDmU4APxp1rBfvnhULuOkVW
         YJDFq4Mr+euX4O60VZmRZkrQxJRy+I0eNmC6/J4Xs4s3wxHBYUZPFgjdOYASFqEt4TfI
         tw6Gn6+HjssBMW8VyufojXOk1SZ0HeqHuhEbk9kGN2m4BKHa0tbh6KsJ0vSqoMqcjpM7
         gQEsuTNSNF/hKlpgxcbsb5YsD4x6QbrpGN3lMmNcnvc/kx61KZbVwnieEnlKyx0aLrRB
         Smwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693069; x=1796297869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+tjxpO4sHp7tznzT6/lD/BP+0/vLE5qhsY/Wm5Ckzs=;
        b=wi2Lu/8XQSvyIC7QK7P7jB0WlYSO53gwy2W5O4QglIo4uccpwtp5Iqj6hKlM1I+qQu
         2R73vd4ViBVKpE0ywYvDkPfJDtkcupBnGRxBpS4zuUBs57iRLFSQ4KPEjDcJ9x4FcCRj
         oUzWOv/8VxcnbtRXSciSGB/4ME67u46mlXtLwNGI3dooHMm79C+cDJqY546pIWZ6SfO0
         b0J0busSXpsFZYovKaA7WXxtTbaFhbwvCA3Y0rM/Kc4SpLSzMDmxFLI4ljBtOpLkUleF
         U9bGgaawbB7vEuRn2RgK24+qrwfSqQ0p5Tj2J8IQXbT/CQuSbyyjCzvE8LgXIv6TavTc
         /BrQ==
X-Gm-Message-State: APuU4Z+vF1zR9X8jqBoS8h3Yr5QxIFWq1Kqf48D5M5JxSr9PgKRnL8wo
	fS791xPk8Ujeuc5zBo+WykIDIrV82X5c7BhN84OxoPbdLJRqiVvnqrQG6OrGM05VtelE9dFjPad
	lMPjfiiAdR5e3bGrlFxQfflSWsMvKuWWGCo90ExizNFjW6EyihVjyHTM5P7xMCxZUp2P4
X-Gm-Gg: AZFdTZf0UGr77GR/CKvEcDGNNtLsM6M4KnNgE2q3jYd8cPqxmSHWDxiOGRy+m9ooMQ4
	4Diz+dcowRiebBJqUUA3gobTQOCZsquRnalDyv1V7Tti1x+xX/rZ+4AxvlpLu/WudDcHLP1DcXl
	jM9c91v1Qvk4XyUw/WlX7/cu+S90led2cDXXqvOmavqNl85op0FJmFHgdluBrSBBAEf0VKTsOqy
	6gzng3Ej+pnFuljrF0AVDutRKONkpvR2pHHOwLSdYFK0XNickG4YkIsCj9Ni237d5jOOzipepAe
	L6+DFZoyKSdKcmIiiDzkZ2DnQKJY6qfQ2s6I0vNxFprUVrQwT/mQw9LI+LGRyM+O8+neDYL8+1u
	lxMGVXwxTh4M/n1yDHafnPIwrnmv59ObRQSXDNw/m1i31Br5yfz2J92OwH/DyHZ/218YxXqBHCD
	51vMdnfVqSSu1/
X-Received: by 2002:a05:620a:40d:b0:949:f8bf:b6e9 with SMTP id af79cd13be357-949f8bfb90dmr1019348785a.25.1795693068825;
        Thu, 26 Nov 2026 03:37:48 -0800 (PST)
X-Received: by 2002:a05:620a:40d:b0:949:f8bf:b6e9 with SMTP id af79cd13be357-949f8bfb90dmr1019346385a.25.1795693068364;
        Thu, 26 Nov 2026 03:37:48 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:47 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:36:48 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: agatti: add an EL2 overlay
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
Message-Id: <20261126-agatti-el2-v1-2-4e25fd64f198@oss.qualcomm.com>
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 8OA055VT41QllI55BCAF_ckzeH1o7ZGJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX0iV0RPqKrYqA
 7xWMIitOSBPZtUbm6jBQ6MgXIW7D+r5rIt8BGeuWvjqDZmBGyFnlRkQGNunqadOT4faeJBDmfjL
 w3+PowPa+ijWevZCTsSw54IwUSyDKzY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX1XNFq4J+HZlx
 W62plaXKOc+yeV6BExp1CK+41VQ50CVVBTDUoZEk38Sohcjk4ouOCQxWfptWguHjXz2dLNECkxY
 9RL9xcidfyb5S+v8pPxCu5qx1ccoM6ass1NKR05CNrv/t/wnOXv5+Rt234DowBZyRLjxWj+97Gp
 5jI62K+ZWGl247NHx951REpMz2YBf37IGW5GvYRBOCCf8C6lJec2EqY0gRDyO+6XOgfPIF/i201
 v9amqx7abg5G4akY1yE7v4VNgii5qRnhHY1sF3xSdjoZ6GrelJhAckARHUlKqNgRhRnELRfIhI/
 tX/jXr70VVx3+ynUiHh1yqQ6S4joDmgO9gK6AMoyfh56l9DXdZNbF4MzQlCp3+8z5FVBBo3HRNC
 3M8VvglmM/aM67wb1YGaZ14YcZ6tLkcY0/Zq6LTySI2FeBFb9rxBDf9KvFLLjCpt2C2RO8io7a1
 9GzsdePz9lbm1vqL/ZQ==
X-Proofpoint-ORIG-GUID: 8OA055VT41QllI55BCAF_ckzeH1o7ZGJ
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b081a0d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RzYfMtsfNbY3csdru8QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

With a boot chain that has no hypervisor (TF-A and OP-TEE in place of
QTEE and Gunyah) Linux runs at EL2 and owns the APPS SMMU.

Add agatti-el2.dtso for that case, as the other SoCs have:

- disable the zap shader: at EL2 the GPU driver programs the CP secure
  registers itself;
- give the ADSP remoteproc its SMMU stream (0x1c0), so the PAS driver
  maps the firmware carveout and the resource-table windows for it.

Build it for the Arduino UNO Q as qrb2210-arduino-imola-el2.dtb.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..70e41313b4d9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -278,6 +278,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola.dtb
+
+qrb2210-arduino-imola-el2-dtbs	:= qrb2210-arduino-imola.dtb agatti-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 
 qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/agatti-el2.dtso b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
new file mode 100644
index 000000000000..60142be50417
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Agatti specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1c0 0x0>;
+};

-- 
2.53.0

