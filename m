Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB0D451995
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427271; cv=none; b=LO4kbfyQWNwghOi20IuFkgnq2yLD4sIfOhdXsIxcxzkKphfwxqQwrUVSH5mRYFYnxsqZz6PVuYqH43CG4wGR6LAi/vUWXWs9kdBu8Kabf1lRMyGI8WxowQf4VmQo9biHu/ebVL4E7MR8HBHAzjiAp2RpgnE9lXTwW9/DN2c3oso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427271; c=relaxed/simple;
	bh=WoEsQQXEHcp3Z4NugaMqCjtqYrDzpmWHIggHogkIi2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9BzOQorfWe4dDz++VPhYFDskS+iJnniyLKaGTNdETSUpMJ4g76lGqDn4UYK+zr13tFaHNfd0qXcGHI21uFIt8phv+RPQQmPdA3fufdl6mRE64fmVgYx623qUdpodt1f5/4EXjECliuRVtXVDmRWnBchMo6vaDxFMeiR/LtOb4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otwBB6sT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIlShTwK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otwBB6sT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIlShTwK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQmNY2401470
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=otwBB6sTYEC5Pwgk
	p/a56NEtduZLgnFOT+mUbwZmBYWofu/93DrVNEGesvn2u1NO1kpmMFM7Y/EP7vAQ
	AO13YWtHuG0oz/mSLBXD6mnMuDZhFC/5pqiqRnorHsmA68wDO/+wRCcq4UppCqev
	eT2yaes1u/23RpAQDNO1tmdcq1oYCaPSMEpD+D91MJQ+xu4fenU/TzQh73qK61Uq
	/TMmMHfwvxlyPIhE55OFFtX+GSYHkNr1kolzgGL3vrQdxzMPiTOEwTy9YG6N8coe
	3oW3PLoWqs2jRYri8450gqjUbt6X3pksaQFP7MsW5DgGcw87aHzTbVjCx0BCZt0R
	EdMuZA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8168n19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:01:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-977cc430c86so810323241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427267; x=1786032067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=XIlShTwKkzIdXOFPe4qBOVxOT70qKjLoLWam7/CFqhqSajQQC/2ziVqrEo4e8+YtdX
         R01D6MOKpV0ENW7GOFnOIMLJXcWn7kwO6Su1VLxgvpFKrbNOUS95xuBODdy/jJt7RJiY
         8zF9TISp37I+Ob7kmTkIwkdxYmmfQvX3dqMT5+DyUZjwo/dtlcYRYuO25uoNk52csb0h
         iTW+28YL3U0/U3eYspmDAtbZEFdkA6KpkrnxbZoQgl5+BNQne2AvnFQzGdtKIyVMHfeM
         s3Ma9eXf+JDkO5UPAHT0TsNp0c4wUnnQ7DaY7kXVY7X3V4FuldjGxah8FvlAA65sB+qp
         aojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427267; x=1786032067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=MJyxu1W5zhWH8Xc+IzWU+nrFH7/2u4rYbIysOeVtZ8FpCBxF7J6t0UazhjyOt4o66N
         gtcVsBt6b1PPQLdVMTxAetwxS647j5U5GGx9Gv18Yd7j9XNxpcGdHja8JjYZNkmE0A3C
         evdupEXtoEeOtjVKqaebHXhCOd6LXcmw8U7TynKZqkRuU5+dQkNtZbwNtlF/3uTb3TyN
         hmKZlO9ijFlPSgIlggQT0OuIDaS/Iq7n7JltGVFdCPGtR4mhTZUlEc4ASJw91Tq3Ky7G
         jJEfWgCv09yciAT6MbQn4qMJN+9r5er98Gkxpw7I+bB3S0xNbncgv80dA5dusGJUql1B
         u06w==
X-Forwarded-Encrypted: i=1; AHgh+RotfyCumpnxZyEROop5Lq5q8x0jYz+oQo9rc9Y9N6EKsMOC+tfVhpgNM594Ez979jeHoJ73P9Oj+pFypUVM@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsOLilC4smM/lwMznLy1oGjno7HJ8iajs8NuMfjm5/H+FMlIv
	vhPYY46iAObQzLjla5CcbMT/YJ/CRXODrAI3w3M7MbKXX00AFhpH1q+LXtjb4WnwfMchdJHxjMH
	F1DaLo+5mJH84FLwFyuvfZu9+rF8S49o7NRcslOCVUac7y3rZZ6yMNeaB172b6Hgtyr4Q
X-Gm-Gg: AR+sD12D8cISfyOpKhePJPyvQw4fF8q0NprEhUMezal3yvESejpv/HhO83W1BWuQ7GI
	ydVR/+pw5PnDSyX85upgyhxqkqjYenQq5ZvXlxpa7n+W2iLI/mS5rQ+6O0nuv9x1UEzoXVrhyBp
	MUuM7swXj7AbXVbF8PwLIeYMN0SrLji8kT1xdmNewf+OKe/tx3aLrmISIcHnZ5tq7mGFcDYy1vG
	vUUvLzgMTUdhGGVu0X4RX+BulCgibhgJ7Q1qQlO1IwUpJMWh6sZfFdhMB9FzfksUTELKPoVfJS4
	FNv9JuSw03rcfQHwqIlEAkNfTXtNwqrjvL/fkXUyH8U4j9MhrrQciZT69p0BqVnwjVATUUicW5P
	2Yqul/svPHAqeOURQwKbo7lEI+Egn125L87l4zxRnduHmoK3hDX4O4pTob8QbWHL3AzEdmeKQHd
	k5/HX2tB3rtZTcGxUSqhYFs+Gy9HqZw3WffbA+12+lEbbYe+7UZ0eE
X-Received: by 2002:a05:6102:c09:b0:74a:84ea:4f6c with SMTP id ada2fe7eead31-7574ff6c30amr1313378137.15.1785427267070;
        Thu, 30 Jul 2026 09:01:07 -0700 (PDT)
X-Received: by 2002:a05:6102:c09:b0:74a:84ea:4f6c with SMTP id ada2fe7eead31-7574ff6c30amr1313267137.15.1785427266454;
        Thu, 30 Jul 2026 09:01:06 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:01:05 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:40 +0200
Subject: [PATCH v9 10/10] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-10-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX/yQyqXSr9qF0
 i+Vg5VBCmv6jrl99AqMNGInGRiw45XIrgBHKxhU+YzaFpNpYYq+w8b551aAho4r0ccZdLrHX/89
 B3XOJ82UeM900HBXzzqd3JZkeWmXvIMp3mERLf93gScp9DYDaf7xRzeLHD4pIgjx4B0AR14cxbF
 IIYahxPm0/Pt4nHLMoH7yy8fAgKAyinugNHZaOkxh6KO7gpa4DgE2OBQUiMIuBUqSgpghiKn2sZ
 5ngOqSaEzUt15M+F+bR6DYABmZkaL0TUASqgjGqnCu3lt0ZEKizP5meN/mXMuV4oa5QKXGp+rgl
 wrdU7dd8nZ/49QgpXMZOiyEOmE7sgDockbwZ2B2HNtiiewmKUcNe6z9ZlkJ1PdbJTJD/gX97E2T
 yfeWaTwrDku9p/6/9zPYu0js+vrbG5lsXGLLaq/tVpbvYoouzmwxnveZn/FGGpxmiTRpvkNs1CX
 m7htdY2i6azqtC/ox2g==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b7544 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: h1gDKC1WSiwmqI9fpHzA5w6praTpmfym
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX6NAqcxLrvZL6
 ZCoHx9657yBJSITlat5eVugi65ZWmeZ21Z+uDb2gk+7hoe5PEzYNosytyorjSXqFf1C/peF+aZO
 AB5S3WGZ/taekaAHnYqJRW8pVaJlT1c=
X-Proofpoint-GUID: h1gDKC1WSiwmqI9fpHzA5w6praTpmfym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
with device-specific information such as the WiFi MAC address
and the Bluetooth BD address. This partition can serve as an
alternative to additional non-volatile memory, such as a
dedicated EEPROM.

The eMMC boot partitions are typically good candidates, as they
are relatively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and Bluetooth
addresses, and point the WiFi and Bluetooth nodes to the appropriate
NVMEM cells to retrieve them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..38839b8a361e76f6c1989924b16095b9d8815f66 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,33 @@ &sdhc_1 {
 	no-sdio;
 	no-sd;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	status = "okay";
+
+	card@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+
+		partitions-boot1 {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			wifi_mac_addr: mac-addr@4400 {
+				compatible = "mac-base";
+				reg = <0x4400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			bd_addr: bd-addr@5400 {
+				compatible = "mac-base";
+				reg = <0x5400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +538,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +586,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1

