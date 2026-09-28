Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EF63B637F
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575850; cv=none; b=ciy5OQIIxjkzs0jBdvKhg58h7xQO/U2gppJ5GjjBvx0MBvAC+u+4tnwVZdr2ieLI9psN8QO4kJDi6va99504ZO94DfO329J7njsHZP0YkV54N00ECTDJdobWMcf2IbjauQ8sxCC4Uj9Gh4p7tHC30V5IM8sN5cM5hPYoQ35XH6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575850; c=relaxed/simple;
	bh=Pc+ikFCDBvxBSt1eTUgtUUWzverxRmRTMcb4LNEPMcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GY//BY1CaonXrlfI58c9o/4WgXxWpaXmW4G4IsFBhY+iYGFL8XwSLYoRM4CaUyqkNce8ea+IGfxlTG4ijiOJkyqWIH1Oh6GFttlrnxQvLYxy57AHWeyI8mXkU0GMd3JDrS9uE6IRtjiMbol94mB9NeEWudsaGCaU9XEhRSOj49w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFLmhLoq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gy5dVbMe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFLmhLoq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gy5dVbMe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1Yhrx4046226
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+QMOReJW++tScmV4/v9BZkk5QhhaL5ZwAY/yKj9k+4=; b=MFLmhLoqKeJw0Beb
	PMvzA51gfP43f8C1p9ecE+2l0+8xhIJ/26n913sU6Kbag/i5pwcexcfdXJ+2wEbJ
	JG0DW6LTHCq4rZ1h79IeeUPUi72tmb4YVe9qHlz4M45/LeBti6gLxxapUejtg84t
	3aBSlEPcLZexrvoVdWLogqIaaqnVtk5+D/krEtcbWezZard5DJi0QZl07aU379dF
	gQKfZKIgLt8cjGQM5YLSY1M7seuBXvCtBsjw24pwumGu07uQ3GxYaCBFxgLZjzag
	G548Iy6wXeeCjK4yCkXoB4zuzqdUmeRH7fPx+thFzPkokRilAWWcMQSTdbDcSMrm
	w7EP0Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jvmh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:10:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso2402408a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 23:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575847; x=1791180647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+QMOReJW++tScmV4/v9BZkk5QhhaL5ZwAY/yKj9k+4=;
        b=Gy5dVbMeNip/WfNmekp3RT2JYOKJMTQiRR9btWNMlxW+WIfXAs9nh4FL+GvuzwPmWp
         uE/SrLFRz1z+0bHHG/319EQScHPZedsO0QrckFlBJwwCK7GrGrHyUpdf6g7uCIjbAzum
         Wy36Pef/dC9jvtjPxQLSmM3b+Tvdhdyyse5jps8dSuiJv2pW/ijISlhCva2ACKOG+TRj
         vLPXtHweRKnOpYiFAqYz6SYGoA4/ASZ2pIjDRzUpjzdQJchU1DSqdDcXC6eC/gWIqqQa
         HvqsVNiDdA2EnBwvGAKZx2HBHt150uBO+yjVBeonG+T3W6uz1uZ5xdk9wtf7AcJyVOlc
         oa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575847; x=1791180647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+QMOReJW++tScmV4/v9BZkk5QhhaL5ZwAY/yKj9k+4=;
        b=Iy6nKPPG0Mp2X2cYRIGWJJL7wA89T0txDDztc3Zu9O2g7b3NnPXc/BhxKuM9nWo8QS
         p45lRPX5SoiLUJqpBk1RrA3MKNVGL8qAQfPfzFVbdRYFpLpt8Z0noVuQH+qF7UMZ0RGQ
         tjxYKvYHSGoV58GugIOYup3urHnUxhXkv03HSdVRTMLffkPIrHfXLec9FlebvKec3ZCU
         EhKMH6f2NjB8B702Gf61q/CS0B8dNuzfxHZ2cGV5gyA6Zl5hHp7UIRGMqra8qUtjThzr
         Bq5HjCgnR35CBXWtp06Ye+IjyI+GHgUENdXjDeXswcbhMIu7JlP4Dpm3VOPU/0Nc8rPl
         kX6g==
X-Forwarded-Encrypted: i=1; AKwUvBwAnrjS2UvAL2+VCWCmoRq2I6tb7G92eZtFBYfRoMNsP825mvAEnlDMT7JpG9rLhf9cCpLT7U9P0pCuuMpc@vger.kernel.org
X-Gm-Message-State: AFq9FYLIr581wywpwF5B4dqnGJI1mIYJiWWdvsAE1qH4dDFpfFYQqzrp
	LC48NEsZc/DzaCeRFMunxvHsWUXduo7uE6xirxz0J8+SV6jceOBopnZzOmu9Vlka+cAoJgUgi4m
	AKkqyvHEs6avyjiCMNEhT3gSUNS7Kb/9R+YOLNBeahnOJrA0by1ao3WptvIsljYOubFVx
X-Gm-Gg: AYBFou2RTwlYZ0tVxR0vF5zcET/ANQW8xASzKRa/Cmc1cAcvsz3mAXCmOAnn3unNiav
	j/rwr5AFI2qjpRWOJtDZ4iNGg2dGGhMzT8Ttl2C6gECispBvtIPyUPhALFN/+GfLTnLDG6URfkh
	lWDO6cHk6DxGHchBHmDUw7Z3YqoyztnmXqFBjYp2LYqCb0IgFRNibrNkHHPNhr4hpdt3paQdXLt
	djypjlONI6ngComlLZJWrZTcx6ifGUMGlNvkXXtCfNmxdZpdOIDJqe3c35DszGkppSooH2xlGKC
	UGxubrtlpy3pvGgnnwKeigbZXTF6709raD9mTgDCiFC8M7JoWIZwMxPNmSlEuVhz6R30Mmf7q9l
	aizmrkmBpNKHIxPsUQgwfDVNJ9rDnMdOgVhjM
X-Received: by 2002:a17:90b:2790:b0:3a0:d265:3647 with SMTP id 98e67ed59e1d1-3a0d265389fmr4181614a91.8.1790575846598;
        Sun, 27 Sep 2026 23:10:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2790:b0:3a0:d265:3647 with SMTP id 98e67ed59e1d1-3a0d265389fmr4181598a91.8.1790575846112;
        Sun, 27 Sep 2026 23:10:46 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:10:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:19 +0530
Subject: [PATCH v26 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-7-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Pc+ikFCDBvxBSt1eTUgtUUWzverxRmRTMcb4LNEPMcg=;
 b=0pnzFtnpSSGd6K/ogS70pPcICal9QhK0HOM606A0GQXA2GVuZ73fXvD4bQl3mspOIjHAaNbO2
 T+hmTqYkGURA0r246+yqn1A8hmx6589xHrz8CqG0yxko+qSqJ5eRXgn
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX4odmW7Wd6aV1
 o3IsrTzHPI5jGaCOvUCdTTY1xq+rZCTOhQissns0RAyHIeuvK1+Qiwn4IJLJLMArBWRD2qt0r6x
 WGNLiqjiNa1hNpoOGdE4eipx4SOHSw8=
X-Proofpoint-GUID: 87g5y04dRWkrv4xicasO_wt9jndqXt32
X-Proofpoint-ORIG-GUID: 87g5y04dRWkrv4xicasO_wt9jndqXt32
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6aba04e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX8lEx8dX9UQvC
 2U3kdP2BoIpMznpPYntJ5CkaAPxW59cSQI24F1preVKBzmlcA38Z2cEHV1+H5GsFOmwOudQ7e8U
 i79N9LmFu4Qh2rHBUEfHsdZfKVKTqWhyLXzSV+HmODeGYBXTydykAlq3uB4YTzbAr8ctNCHCJcj
 eZ1U3adOvcyODG9jD03zHCXUOce3A2m9zho0tTBflVUG5u2KOKGP0eow+w1fQGv+thVE4qoisxJ
 EFut7IX6PyRX/2i7fGCHJixEJIq8k8jLGwvkDdajU0FpylGwkiNrhTVCuWolZymvXpFLbx6Xin6
 Da/xWNDdSsebN+ogIkjOz3IhXTpX33xFQhMSb8luIpQtRySZSYXji4dHxKV/qXq/QusWYm2pEWD
 lDMAQB3bO3HDp5Qw8cKlfHafXP0bLxIb5Y/lrmoxl+hZFV+v8F4ia0LR7s1efjlJztzNhZg5ynw
 KuKTMe+oa1IYmJmNxcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280024

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..307fc45af37a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -867,7 +867,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 58cce89a0c1c..c9c1b0c48550 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
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
index 477d671bcce4..a2ccacdc9ca1 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1102,6 +1102,13 @@ &pon_resin {
 	status = "okay";
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

