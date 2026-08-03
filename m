Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB538F92F
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754029; cv=none; b=YaSGe3thTMYC/rLPzuhsF45uOgF6mgWjFKAEsu4NFL/qLnS6DSM4xHs/csULphafJdeyKlFdqXDvkPb0rNauEEsy/qvSv/rpJK+vf6P+JKkTzH+AvlvPqCxTYXKERJpMeeyMXHMiBUXvt7lgbXmh5C+MPvHzen0GhsN2K/IrccI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754029; c=relaxed/simple;
	bh=nsN0A4BkRTuXBqErp0cyVWbAemAMavp/V4BWlnV3i0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkG1WWO0oKyJUdiuFvYThOxsC1tel3RKpsgRPo5YYO3itBEqgrwj28KCWn/IGAhx6yH6lY7rrzZALs4WY8ul5tV7yF7fl9ND5d720/zsPyULZSloeW0lgZY5hFm3dI7J7XdtLFhqXu0JypY9ht0K09E9bWZ26+tl2vyaQdp+E3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4KbWRaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ig+3aiNm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4KbWRaQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ig+3aiNm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bUAu3957208
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McCX/X+z7Qhc9dxXfIEon2dVb4eSsULT2vub9hT2J74=; b=V4KbWRaQDrV+NVuZ
	mJUFdtnEiixzCqAaGEt1ODH+cwfPWtVNJWkeR8Ys+Eq/9IGvUoPEUq9+JHKDs5Vy
	6y9fLN+s/2KdPDSrwGOuIh97AC+X5qpqYJVxh8DMj5cjaSfx6xejsl35xXQyPAtb
	QeewC4otH4R49remLlUWQb2gLRjwew3JTx2Y087yhfmC/Sfx/qP2QDD1p9QqU5A4
	ucu1uEu3qj0amO+k4hZiBn6TMEgb14VVFbuyUfy5qIIfeHNKEYmIHmppjO2k1Rjw
	RjuyK1AZj2+3jIDSSLIcpj6lwoSDP9Q4GS9EiukLlj9KhWpORqhTYEaE0Km9BMTn
	dySh1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnh30k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:47:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so4500257a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754026; x=1786358826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=McCX/X+z7Qhc9dxXfIEon2dVb4eSsULT2vub9hT2J74=;
        b=Ig+3aiNmNI2iXdbBPS83KvJZpzCUjL8udxIpKqgWASi5sgGAPdzfg/SM2en0H+Vpe5
         H+zQ/D/MvzpDws/4mqTL44YY+rtjp5pGpBM+FH0ZLh2RtAKMp5l9siw8cY9w7G2cLdeV
         VmSjh/By7AunLjENq/+S9ye6ve2aJ2vu1ocO19GL4uKjfkmJsaBnhPX8tpZopueO0exO
         qlU/+PWCNqsLk521t1PVeu+u22TBHsrZsQyc1k5rXi1+wDqHFUeLV/YrpNOwOAso7JSz
         SQq+nCJ4oFqIWn6I/oJ7cBOuzJAInlONlVGnZ+/PRWWUyO4mCMCUVUAIndXucpnV/fhI
         Qk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754026; x=1786358826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McCX/X+z7Qhc9dxXfIEon2dVb4eSsULT2vub9hT2J74=;
        b=LYbAUL6XIQvRmTSyYSH/qt1f/u0nu8dOhleuop268V8oQ0VXLms1VJcKTi8mxnFszV
         j6oVRztfSTTo9Q+e6cgHCLNKnleWzNdxMwM3CVLoB++eslJ9TfBMJ/ALt6J8V5hVoN1G
         1Jgiy6X7b4XwKcUE2eRq5xU4bozOpnTiyRXWabGY2/3jfpT0K+HDS0ab616Im5sp5lMT
         Y+SUFig+/QRDATf5/xX/70GlnL9DuIdYdLop5Fo0gy7K8i+P2eCfofg7RpPeLFk55OxI
         ZVedJ9byZpY7owiGaj6vRMgMOBTvtoNqnxa2IQ+/aVw1gChmU7l3M82F5oRMkwgXOG6w
         OdhQ==
X-Gm-Message-State: AOJu0YzSoqJc5ZhEdWvWfuirCGKgNb9zU2zuvCB5zCM14rcCMqICMdOc
	VV2WXY+S1WT7rQNCjFtw2t4V/Yu2ZmOR12PrOxxAZ9vlVNP4VO7iTSftT+dNpO37uV7EpGtBofj
	ljRlrkKgNtC75uLcj2H1XYqz2D/Uk4QQC2dvVFKQ2I2thpNz7nRNs5BdTdBYmXuyytkYj
X-Gm-Gg: AR+sD10DNMeWYC3eBJQ1V3oEQcKPtn4+lAqPN7Olz7RjP6ErdOOeFYqhNITTLyp8rQX
	c8vAcIDcn4xnYfAPJuuU1M0x8K3KeWPcKUw9yReH61XR4l3NzXBm4FzWDAp7SZuSi8E5npRdt02
	Kdsnyl1M/zlsH/cEehE36V83Uw6CVAUs3AI7lugAuRKQzaQKO3bdQ72YcRqLx2xdsn4t8oEt87G
	mNmOhLzsTzYGm6+XUCHwr4Zruig05IPoPhjEf+EvLm/XsAWBRfuVggypT2Z5vVlBUrMWGDIIdFk
	aP898kRJigWzr4pVoZtPXs3+xcvyrXZR6C9NsXLgXtD+BGoqY9IQepeL1Dq7p172QcGkS8rTz5O
	Mgc3WIDHaOFiKvYSaGonmdGQC1ysyVvCmuDXpx3UWf1sKtgwD5IHrP3Y2zfMK68YIodmxp8iMAA
	D0e6zwR1MfuDHbSDh8wnb7J1h22dMawQ==
X-Received: by 2002:a17:90b:1b01:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38fbc4cbaf7mr8455584a91.22.1785754026266;
        Mon, 03 Aug 2026 03:47:06 -0700 (PDT)
X-Received: by 2002:a17:90b:1b01:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38fbc4cbaf7mr8455555a91.22.1785754025855;
        Mon, 03 Aug 2026 03:47:05 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:47:05 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:14 +0530
Subject: [PATCH v14 8/9] arm64: dts: qcom: ipq5332: Enable q6v5_wcss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-8-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a7071ab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=16OTYffOprEdp6u1-3gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: RmnraDKtUH-L5Yh4iMf63YGI12eq6aOM
X-Proofpoint-ORIG-GUID: RmnraDKtUH-L5Yh4iMf63YGI12eq6aOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX7eQJtroOjG5r
 8TFgc+BOpArgtvy1NtN54wR+DXoXaFtV44SYQQwCrBGgEPyS5bdqKvxmx3LV7apGvEIIHkvvdc+
 egIPTZ0sJ2cti+1G3ks6H+k5DGvhVSJp55CACvTV5Co3Vh6goji7xUn4uTmb9jqp7Xza+E1jS/z
 Bi0idNds+c8RshLEgybKUtXmWvyFZacMPLqaVaI3pgjuonIpDhmjMeqeYtdqLdGBTX8HYW9f8g8
 busPa1eHj7BE7lHLH4TACI3mCQ57JJlLC8kvBNHEZvATy4KE1XsXMQunAMJHTyAh6/Dag+6Ahfn
 bMDNgJ5paVv/4s8Wr1Nj/rmF6I8htXKBK/yu5HOCMSvms5qQitrAFmNsOZlDKJv8A+GnC7wyJhO
 SA3zoeYrQ9AIxfusHu/zlT72KS9+dnts+y/sNZUyFJSPLNLaYakdS1NTk1PW5bJuRtEHXIIphTZ
 KEa8B0+GWAfZgy7kLrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX3p97/E86eKe8
 EYzqB2QCdokyfIwp2+dyHYSu18FszJi7d+/32/i7FQ2WJYuaGBVefPdGZBYGli9qj8GAYfVPJID
 qq3huU07/l3taxJJjvA+gr3dzF6+0io=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

Turn on the q6v5_wcss node.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index 3bbf748f2e5c..9e82afb354d4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -55,6 +55,10 @@ &blsp1_uart0 {
 	status = "okay";
 };
 
+&q6v5_wcss {
+	status = "okay";
+};
+
 /*
  * The bootstrap pins for the board select the XO clock frequency that
  * supports 48 MHZ or 96 MHZ. This setting automatically enables the

-- 
2.34.1

