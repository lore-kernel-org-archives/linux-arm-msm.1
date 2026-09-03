Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E937397AE4
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422037; cv=none; b=pVCD6zCvMIr0qx/wH5HkAbbzYg+AoYw6nj80KGgOPk70GF1zu9zifJC9liosWkbl33ARv6I6X3+z52gF3I1NIxlpCl8/GEYAINrQ1cDWbKF8kEYXuxpRkd4RVa7EF439x6cY+OIr88ftcw6mHJ/jQ9XjZ2okG2eUL/Ij0nGzM3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422037; c=relaxed/simple;
	bh=at32knaWNCI4MK+ZgXm4viSmUtWJZmXLxN5xEjZMDrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkVan01KzINpv1764fkhiKFNRGrHo14nS9bURtHx7+cf11a2eA1ot3/XFybwrMUXzXxV+oZgQtVWmjqzwyWtAOA4dUI8NaJUQk7bOO29v4/Gn0kppND53PqKV5SZJrv4TttHjWu+vkFWwM+z9vhS9o3trPjNtGsii+L2CHvQdZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAkQ9M/q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I34Lw9h3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAkQ9M/q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I34Lw9h3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lTYU3749489
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wibuWzN+1YhKv9Jd4E2FJsvoSQMxMG2ONq6pDF3AqKk=; b=RAkQ9M/qq2IXHG3+
	2KZzDBRG3DZkXBdKPgxqERg+lz12EkQewnCTwTCbRmezsMYATCNKELiM81WKCLvY
	jJ35JldVfdPpSEy1yXhsO4JPu3wfEiWY4h2JkQQMjFlpQ7FvSP9s4Riz9cJz8sLl
	33dwyRyzQwBXsKTOxRlKLISlE5+yoGLfckys5bCOG2kUREE2TZa7KMtkdeqwT4ic
	EP7zSCB3d+FOdXv1aL+5sjDEnva/SvXlJ+0l2l4vA2kVXCrf+riNKPvtsFMVLBWn
	tVIBxs6E+A/y9/t7vFKrQFxwsSRkANsit6ePbyIyHV5P767z5HDOP2p53jEk7JRq
	2y9Chg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5uhkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:53:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so149240885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422035; x=1789026835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wibuWzN+1YhKv9Jd4E2FJsvoSQMxMG2ONq6pDF3AqKk=;
        b=I34Lw9h3c3cnEEBa7c49HOL6LUIbVQ5X4Y3V6aLSuhHpPYMwVuaeVXZivhKotJcC/N
         s0Mp6TkQB60+R4cXRpEsdwJ5pFDdsFYVXOWgyrF/c/L/2Mfx2T2OkUnpxLevN01bS6+t
         hwqu1AK0RSzRA2OZCubh+fT/DVXGe4ZtbpwUC901LSxr+J285kHJ07sPVrwJnsMskLr/
         fSHfcIsMazHU3EHx4sRJR+M8yvDOm9sOW+WYo382n7ayIDqYeqAEYR0XZD8jwuA1cQGG
         nmpSdM8etEEEPet8TlLwTc+/cYCt5Uv5zJgrFfJG00Tn0YWSxSlQxRMOOga6CLgEYlBV
         SXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422035; x=1789026835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wibuWzN+1YhKv9Jd4E2FJsvoSQMxMG2ONq6pDF3AqKk=;
        b=hkghRemrGlRQG47CN8Keml5chFp3r+yrUVHHpBXX25KOO96xgi40TJvDu5C3umwBfw
         +WfkzAm83RnbGpZuDZr8W54s00Im7yRkHZEbp9+vK0PktaVRHVy+Ki+G9ZDfWu8ShU6t
         umitzC5tx8p6DJgMqr8tg6n/g8O3uGLfXorK/56penLKho3YbYROCHs9gKX1LXZNkxVb
         uYGKCUonaW4TH7Rd0fkdo5vFYnuVzV3g3l7ADJXpMkNYa4rrZ9b1nLALnuxHtLA1Kjhf
         8/O4q3WwUXua2fThotsE5+ukYWIC19eMXLVCtcrKwKhsUfTxD4fWUjfRx+1EWUA4Y+6D
         l5Ug==
X-Forwarded-Encrypted: i=1; AKwUvBxro3vWa+JEPbypT7bjuB0fm/sl4WFz6psNwRMKnO+BkKHyOz4TrPbcq0DU+NjOyujgI3C3bIiIiysQRCZt@vger.kernel.org
X-Gm-Message-State: AFuF++nmkFllkKI3No4YfKOUsUB8UcWpQ/NGr5rflG2WSb4gUrgqmdJb
	vPbF0Fqndtlt4uQ6IXOOdI8A81tyaoUN74jbLEdv/vx6X2vePoUB4IHwsz9aXeTGETMnG3hrMsm
	Dcrnb3AInFGZXf/63F4UYE4wdHMGlzl828EDFfy1YyhtmgY9/wrKgyo+6zqQK30qWPT1N
X-Gm-Gg: AYBFou1dstpCxVDpu2k0p7F8tQnYZ9SWYBf1xnqETWoibdWGPgVtes1EAEG2L5ctwHx
	lnY9VQBG41oN11CewDkR/atwjFhDrWIXtOcoSY4BcK2KvRjOQwlhs8v7guKUv1UNDkbKeogsvLG
	Cox5vlc2EYOGR9uzXgTz0bvkB4w2hLibmwiPCfONllZocbOa/UJH0vqFYmfv5jspHpUHvZ4804F
	HGLP0+2P+0eM53vHw64A88KfLXdhF8as13pChZ19MJhkPqN+B3G3VT5oYtyQ8gZYrQgNQWzVuM2
	f6LDlNViqrK0xqMdkaSFcNbaQ3UtKjoff0Fyyk7NptylqwWeI2qribUVAQ0r90NhvPLStDNr1lo
	Wc994EC3NjbrVHg==
X-Received: by 2002:a05:620a:45:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93960f88048mr1029253985a.34.1788422029734;
        Thu, 03 Sep 2026 00:53:49 -0700 (PDT)
X-Received: by 2002:a05:620a:45:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93960f88048mr1029235785a.34.1788422024450;
        Thu, 03 Sep 2026 00:53:44 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80388sm13415622f8f.14.2026.09.03.00.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:53:43 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 09:53:01 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-pci-tc9563-aux-v2-5-34c625b542c1@oss.qualcomm.com>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
In-Reply-To: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a992793 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eJG0Ch9LUBsamovDncMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hw_TKE_OrlFBj-VrzTp-EQ39yh9LuuX7
X-Proofpoint-ORIG-GUID: hw_TKE_OrlFBj-VrzTp-EQ39yh9LuuX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX3AUjLIYH80pU
 SUC7wvXrK6JbNa85yHRACP5F4drXoOEsRhyPnyV6mI20zX7D8sFBrBqioCdLAg6GvR3mLQZ9/Rm
 +bbAIujNm9NoC001tu9138pCUdnfI2l1Ocs3l3TJMAceR6WVk/KZRxmKTOuZnhFlSDvGEL+TbbJ
 vffDgn2flV2uk9Z4vK4sowyyqoBbElsY5hWn6vsDk+CEps/+fqMsO5/5B8AtSXp5QvB6tehxMKS
 g7dcvdxNRYWZuycV2sR6alHK8SkI800kw9mktEXAQZ2Hl+BqvbtdVmHv08xvUvjnFL8HsoPRMzS
 0pghnuMdaid/dUkNis/DpuL+OhzbiUeet3rv7CWfrW2mN9DtrIo1OZpPUsfMq0ree0i/euATMOl
 BUcLX0DyemtB9v7xpo+CP+VeIcQexRfUNMH1JBrXcq8lUM2Yu6uQqXapc1twoKII3JhGWrl4NsF
 YE/1pvF/lg9sDgQPPCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX2EexK8TYGVgx
 FJb9H3SfCUoJidlU2PAL8galAs5oxJrLe8Ceo+cip6FFU0ZStPN2FnKBKtlks8iBqmtLjisKqwN
 4/21YiVqBAUVREX3OHdDBgxqmnlwZXM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069

The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines.
The controller is registered as an auxiliary device by the TC9563 power
controller and accessed through the same i2c device.
Describe the controller as a "gpio" child node of the switch and use it
to control the PERST# reset lines of the two external downstream ports
(pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
switching to the GPIO descriptor API for per-port resets.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..8670c4243b10 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -891,6 +891,11 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		tc9563_gpio0: gpio {
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -899,6 +904,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+			reset-gpios = <&tc9563_gpio0 2 GPIO_ACTIVE_LOW>;
 		};
 
 		pcie@2,0 {
@@ -909,6 +915,7 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+			reset-gpios = <&tc9563_gpio0 3 GPIO_ACTIVE_LOW>;
 
 			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
 			usb-controller@0,0 {

-- 
2.55.0

