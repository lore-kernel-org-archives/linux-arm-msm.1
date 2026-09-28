Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C35C3AAF43
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575861; cv=none; b=oEEnrfhhrfwt2ucebPqhBVG1swqPqoha98CsXOUXLRECFtsK8UPswg+BziOmob4kr9eznxUZ5jOwKVYgIXDh7ZQl64q6gIOfNiKTjzvGza0stAEg9EYGLkHFW3fFuJEt0QEdgonrz4bELN2OFzCtHpf1UjTb8LamXASNkto54EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575861; c=relaxed/simple;
	bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UfV2LE+lFY+Xnx+LuHBZSzaqueLvA/PAz+UYLk3tws6kfHwbdjHkCmg5QuIFEAnNRHoT7tsCYq2HpQniQ0/DzS93QDnweFTuO9Ohu5yIki7nrZs0ZDt++Is4v5y6rU5Z9KXsmQRDjbUbCncHXJj6Jm3ERbXjr5KKudetECPuDhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhYBREwl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8sygW0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhYBREwl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8sygW0Q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S5OtnP673841
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=; b=hhYBREwloagq9SSi
	ckrfC4WjX+v88luweFvE//fkslVqCmhozicPepDxX3uxgLS5hRwHs6UtHpctnvai
	k4qy7E8wIxdPQ5SkTmwbWOcc4DknKhlO5PwfPItlaRwKWhA6LfPaIB7V4Btrv4ef
	EWe4EHcz3WSTOS1saqIKuMAu1Cq6cW+7u/GSmVdh5H9UtN830Ju8tWGD1g5cUals
	UyU4HnCTo2+/iwGTzC2dLVtr8UVMOYBOTbzBXpAIAYWRauFaxnCZi/LGGL1tGvo5
	ywyxI/mH1hkyBtwhUrHscjtccan8015nn940O5kh+DkKF3zpW0wTRpCiMbkfHOf9
	pQrRvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s04mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:10:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a470ead068so360025a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 23:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575858; x=1791180658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=c8sygW0QQm8iMs94H3GXOD0ylJlirW/04z8QMqjMZrTH+OpknfWucSPAZR0j5gF978
         6fUvphPV3VobRF70IAZqRewWzV1MezMMZUUcTBc6FsRDC/6T+292J0naH3grWrGGghu5
         +B/ys8QIBd2ybQDb5B/5QSL5IxqPzN2FNWZDqNUcoXJGitS/gYqG1VJPVuOj9wCcZ0K7
         /Y6hznt38a4+h8HtzQPsSe4FGWDMhQlLK/a6Sw5J8LriJrtLL8ub8FAyIeQGgV45Q4Ij
         2+He5dNGdAN2H2NRrSir9z4yFaveQVS1zjyRzh7blS5V3cHOikT00y/saVX5mCW91aAg
         WpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575858; x=1791180658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=bFSHth6p8f1QIQhpHNbKqDph7XPL2MQ9mC/5fb3GxOekRmveZiql2pfuBdar89eIkE
         AjmR1yvZkVv1GY3XPmG1DrWidTXAy+QzMgelQkFaY0AP5oz42ntaVjxnluQqh7yJNmLj
         fbzIaCvGpQBqLa/J3t3Uvb9Mr4FXnQJrB+2kTe6XHocBQX1ds4eLaQQvyW2+nFssfEaf
         Fq2P7+Pyw8EaGhOd/5Es2iGMZkAMW4MBp3Kippvsy8tVqWOBTsbiybMWKupZPP1CLa1r
         PjmDYXmnrfe8y+0lRtUri2hN2xzn112/VGqQWe3+fyCvS+ZwSCMoGTHlMlzExSmCc4xY
         JXjw==
X-Forwarded-Encrypted: i=1; AKwUvBw7GX2/6LyTdBos7eFUmLOQoc/N9TPAZZIY9NWwh7BlTg1EGJLqeQ7QZMWVJsaZqXfYJT6lvbBOO4I8a3vk@vger.kernel.org
X-Gm-Message-State: AFq9FYL14JXTP1M/ICkYZq7OhyOrg+XEVTZjmf0JG0FeOu7ZYWI+QXoT
	tfCjpvA9nVuhJpu0gkzrg/XP6ia0pdgOrnUQzLIiZ4BO9IjMLujxElMdDerEaIqBiWi2IozoelU
	OYjNbMT/IIPsNc1tuxWS3EOsObneyjfOWR0b2o4zQ7ing+2iPrLMR/Xzot/w1SEKyAqrG
X-Gm-Gg: AYBFou0uUd/M0+jNTTxQh2kJ/ge5zKtMDMFoSPN+YqdLD2cxk4Bn3+IgCEmyn0Qt3Lu
	MsJBK+h2U+qjgga/7ErhaapoYDyAjggi56L5+OiGySdGdfMxvyGyMD8x7nICwPrSQqRB0Qo3qTr
	horjOsKfkerF0keJNypNAz1R5CSSmysQwvyvLVBd0fBfva6w8chQaKdVeW9OxKZVCW1f5kqhWdp
	8+WKo37UAa/74oL37UOjCQi0/LkZ3bfPf+IxSX2Y0npDidFq5j5Z0NoosdlKFMqb2p8+3ST8WBf
	e5ddSRDQ2ZUspfE0rhQO25Y8XafLKk9E6Sbfxpm929WM4IqbT6/Thh/Ik1xqbiW6fcneg9QGFjP
	D3rV1fM2isZqcVrses9jUxxZxqqjCjZQSyZ1i
X-Received: by 2002:a17:90b:35d0:b0:3a0:df61:3fe8 with SMTP id 98e67ed59e1d1-3a0df614b3emr3891075a91.13.1790575857134;
        Sun, 27 Sep 2026 23:10:57 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:3a0:df61:3fe8 with SMTP id 98e67ed59e1d1-3a0df614b3emr3891061a91.13.1790575856656;
        Sun, 27 Sep 2026 23:10:56 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:10:56 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:20 +0530
Subject: [PATCH v26 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-8-b24e2348e8e1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
 b=ISNKMf7RMjaU+bv5/aCDnX25z901Q9bqAKTDSWTlUTv61Ly921JCiACTAvjmSsgsSC7vVVaDn
 KfWEYUs+lA1AOkcX2OWs5xupnWc1Au1ilF9NORSNXjlWEltiZFYEAKp
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX6IBmNyDdNlaN
 wtx9vrn3qFU95q5eYNx98RWB5jW4ZgVlx9Oll/uWskk+4xetcCIG+wD2rHavw+sJTl2Be4NQ+HA
 O6bzOmybieDUS09d3uNbIthgkl2CChRjX1oC9WhaJk+VAVMzsu+rHo0EiP89nEtihkX6JmSYF7/
 ZuW9ozzrv6NqHdfCiLR9WMnANaqsayBzEZiJG5kFgFv5jgjBs4zUUETW0WQnEVGQy2Z3HwxJrDT
 EylCGndu1sRMZ876DArZ6IfQxumPTCDYCuHaAbTyecfPHksRaU/uIjOfnynJrw2QMhVbpeyfFmF
 mIrFBFD88L1/8ogoWDH8/hwxubjsKdf0RtjtsiWaI51+cqaoTsvRagbvwFTpE1NTgYLIMRG0qgw
 3d19SONifxhuiznQtHhWRJVFUEa+KL7AFvZYC9606MK5Idd85qmzyq1t5Ulya+LyL8cdEFcKKZt
 ZJhtDsjQSkZwxa6Indw==
X-Proofpoint-ORIG-GUID: TQN-_am9Wu63a3t0Nwj-cqlDjXF_S-kZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX5KON+8fj4yUt
 JpkSNksZJ6rnzCFBSDg7ZeNkYsF6amjSmSLLorgjhuRiZgtbgZfVXsTa56E+bTJbGXU+zR7CZIx
 m45CjyDnfXnJ2CcBjQfg8QmjhotL0ak=
X-Proofpoint-GUID: TQN-_am9Wu63a3t0Nwj-cqlDjXF_S-kZ
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba04f3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280024

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..87d01acc7b5a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -911,6 +911,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..0adf9f02c8cf 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..f0633b81a04d 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -550,7 +550,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

