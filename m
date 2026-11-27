Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789708;
	b=JwCViSNh3neye3v1B8tc1sA7nGPi1OegWLPz/7O+Gt508YH2JyrysALQqk0PtMBgJZaR
	 rRUPRBQLhoI7/ok2CBpzTDWZ1mF/xZrjSF9ROaxzSqu5sFNR61HDh0v1Uz6TF9QpuL5Pl
	 plLkhHfkrkEBcHgZ8rxOnOR0AD52bWyxaFSXNdwuZ0bupdHEGks9BCbM84tcIAapWOFGZ
	 tt7wAD5DrTK/OG2DJDn9mz0/6nFqYpj/z7uiKfgZNojYRlBm79AXlULvas5QY/oLs1wzE
	 YdqZZC2plq1VOgrtQhQI+EoSMXWspgrb6vtYeEf6NRPs+Q4PenwkMA3ERQgIQ/HsRDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
	b=dEPR77jFpvBDI+qAOYld4CPdYDWHjyW9Dqi9uDVR2A6OgF8YsomZ92dXPvMP9u1Z1fJC
	 IFQwLxhFHRh06oOCPkMy+ti35ma1Hj6xrEDDMjsm8Fh0TUdHnfhsB0rxU8rpRgK+Xde+z
	 lL+9Wku+OEap37NKWeG0Lwu6IWVLzYZJBjpGTlIZ1R5WhgEBwrrEpGFbYzMQN7htcwjh2
	 HoCwm+jGjKGBNhFWEEs/I8mwKyXasyHAd7+qQRnLeieZWMTzG8FpDHlTnQRCQoSiu2iTQ
	 vkILbuBIVFiB+A/PeEixgZCpTtbtq/MpTkWAmkLjB6tLPFo58ha9CXIzoJ5TbWDBXiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPBsS79E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qg2qjCSm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE6D606A6BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE6D606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPBsS79E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qg2qjCSm
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Kw11462572
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=; b=bPBsS79EvMz4ITgt
	ZIE9FSOFkFramLP0e2R0p2Nzd8F8UO2hZjbGFGgTr1PNVQKEZeJVZEUyVgqssqB2
	kvwbvJhN4IzWO+rF0VZTPPUUjwVmkv6oFAbNJZXEoS5BqTQseEqiRum6Uc9YvFIJ
	asWiZKJGLGkumLuTcUUS8qIafHn/sGvCZOm7+IxgHk59rd4ehGDLqE7Yf34j2IwC
	7iKN4boWKj855Whq/gkD4wxbvXMrHU60QCkhXmqx6MyB+uXgi79wIMBo8YQOZr7L
	loi56rLpUeOYoFI7vNYAL7bKS5uZMkAxFDDerHuHAUlJk/NhV2lo0WMkNIGUJkD5
	eZurVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqmc62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:28:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f08196b148so53846835ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789706; x=1796394506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
        b=Qg2qjCSmpdyWkeasQGxhK7wFbvsdElEv8MHT7JUOxPcFyy0CAe+f0YcBcl1c8wqEr4
         t8QGMj4ZLIAKIQ5EahByd6sINERp1FhS/m/eGcGFVoc5kPtp5wHUnXXyQcK50hNSbrPY
         1v2IPEQyxR4IkhnV33mXaUg4J+yMP23vrPALQlV+pK0+eqcTgNI5JmAk0+HGkEnaUB1U
         TKpRSahA0on2YpeUI9bECv2iWidWwNDigBYPwO4zU2D2HIrUnM6zUmCNguM9G6dysiq/
         NoQVAHBkEsGh01z8Myxsp+uo89acEKub0bTDarq2pOlFxK3dkNpkx1a+5MsGczPQS1YL
         Gm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789706; x=1796394506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
        b=ZOfRxsht+MCWJeroe5UI24lHKSYbqd9z1JcwgCvlVsoydleKnYn4uvrjq9j2yMbq+m
         Ln7aHJEVMjKms1vs/gxlKi7XLcTUnk1JGURGfQoQKBzYKzOntI5q73dUo9G1kYgKFZrQ
         xBw4GxWU6wmb1mn4dUWIf7wg+GsfZx3qePhIcxqwycEDPvpo6k4iL6DBnQISKESMPwSJ
         TyVhObYAz83gj2GMLp7Z70GrPW405rKXf0QqbJ8yViu3wz20a8viiUBJecfGIl0uOOMC
         VjxYjyTc8YPw58OtIMjQ9Y4siJ/T/k3n7zp5nUbXBn1uJqSmg0D/LjfCAKRGmGkpktJb
         SteQ==
X-Forwarded-Encrypted: i=1; AL+hErEN1WlcFhmQlWMyMbl43WAdpLYhdR6BS+4ZglJkoztzeiXEb1YHVwf5Y4qiV98IXLiX4n4hu3MTsLAmwL39@vger.kernel.org
X-Gm-Message-State: APuU4Z+BMzGqmCRwIkXBNk3VYmQoHmpoNl4XrfNgKmb1Q0XRU3lIBORI
	BwY2dHuBCk/sY4FkWDWKC4fIbDHOdY+D31hAnpUtYaiNrc3C2OtKg3bTAUmZmwKxPZWFEoJ/D1A
	pa0uzoUipgRCbAMynldOtRDYxhgA/9dDKeTf0sl9xOoNxMuIiGpPpJh8tob3BW3RdFLZB
X-Gm-Gg: AZFdTZeGZtKOUrIqS1ItJIdV2Ih1b5SXGlzdrZ/MXS8kNHFNiLMx2lPRfqfJjQa/3lD
	txCjP6WmYfkR/DEUvEMB3s4nladECYlOePQWP9J5tWzE+zekcy7kivEZHmyAWj7JTGhTi6fovZ0
	5AhNHwRqjyIG8MJsv72zxioB6DGX59P9OMOuYqn1p1ZFnZvFl/ThxAGqXWW/kbEECyeLE7GXq3j
	SERFc8mb/WV037dqdhM6aG2vHp9daFC90RSch1KFDwXEMdzdMl8Uu3kLcX9CXHzosKZwyz14nEY
	4yX+nLQVrhJgVgA3D1eCEknIKtAWsnfQalTp+mvCV/Lk3iX99Ioez8nFY+FGufDGXYSU52buktO
	hbJ3ZQJ9sDw8gL7t8iv2KbJVlPpzcMRGzcfoR6INrg6kcTB/u74E2BTXn0dZfgFwlNFehv/DmoF
	jCqAG31o75XQ==
X-Received: by 2002:a17:903:1ac8:b0:2f0:a586:81d9 with SMTP id d9443c01a7336-2f0a58682a8mr170116255ad.50.1795789706132;
        Fri, 27 Nov 2026 06:28:26 -0800 (PST)
X-Received: by 2002:a17:903:1ac8:b0:2f0:a586:81d9 with SMTP id d9443c01a7336-2f0a58682a8mr170115435ad.50.1795789705484;
        Fri, 27 Nov 2026 06:28:25 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:25 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:00 +0530
Subject: [PATCH v28 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-7-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=2209;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0YQGDiz1F/FLEBDHTFy0NPa6QbvpSRgMVp0jR7EbIWg=;
 b=hH1f/4RdTgXXzUD3HLooxCXl7oj1YeLziyFQ1gZrW49x1biAd1StmoVIoK3SxAEPlFz4X4Fht
 FHtkMV+tGSPBpLein2a+YAXPEHX4HXgHfK3UpVGEududkLK7ut2VfC7
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: LLJ0gf6FxPd_eR5S0twEXzeApncfpCkw
X-Proofpoint-ORIG-GUID: LLJ0gf6FxPd_eR5S0twEXzeApncfpCkw
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09938a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXzXwVhPyUdBC0
 jT6ZDQJUzKfctl0vERqpddyOTnKZHZ3Vw70Mmn5NXXQ2vA8kvjWOZ/wYN6pZT3aYL5Zvxwoc1Yc
 NWNqnnU2QPIltafpIPa38W3iR1hws3Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX280ZB/dOrEM6
 H+fDifTprBYdGqNRGie3/a07yzaDW5sAjRiAKhwCF1FyA5KIiuHxqL/NRw+sVITJ0MPa3JV3Vul
 gFrUAl5TfN5m0xuwy74iAYZ2aWx4LAU2U1UOdGiKBOJCyWJtc1n7gGYS3+SCuufrUNNou0RFxOK
 P5I+cs+87h1p8SvNBM+NY/PGgfBiJ1hTbfKH4GF4v5udvXwCAbUPY9W3JU/NSG9IiS4YfNY4z9f
 FeaZ1Kc+0nztzeKUvpIioJcpUbWo17Z7D93ZhSw+hNVWAg736o1JoDHYalDm/nZX3X0ymMkcbo5
 BgvmAUnEqKWCP8M0aAJcTSfZuRGTzyRGuKWHgE+rcblJAxsNmBH6HZ00aY2JhFn5L7l3wQQ41wA
 ELrQUW+dYiPaclQKwgbbgK/HKg9REIK0fYWcSPRJQ+lgQHwrrFOA3bNJM2Cnd8FPjMlD3Cq/7ZV
 DqefPDoklw3dDsMAsvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60..f1c27f9769fba 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -876,7 +876,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index cb90a83351c30..501e3c0d14028 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -791,6 +791,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 682bcbc0b466b..3c05ead3a7ebb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1136,6 +1136,13 @@ &qup_spi3_data_clk {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1

