Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05A848E0F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398058; cv=none; b=TaSNxPj5uOm9UiOpkKBL+Z7VerUeuHA5Nf9JSF6a0QEyFdES2f+BwTTgdoorOsku/6AZecByje7Faaaf+mXe5qjT0AMqmZsWCxJ0Smqta4KhuyWJ8V8M+Dy+Z+qSaimgC2/qK7Yrq+tfFpIupwhxsIyB5f6jfhw71AVoPU18tLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398058; c=relaxed/simple;
	bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mywGLtdX96YNOHCsJviOGQlECCKjD5yS2D5QvR12Uhiu7I5s4CrbiBoz36pu/qPQWXj5Pa+gqAXWyMhbM3TwMUYrXS3SV184gZ2Z5wr26yUIj+0IgrpJ3BXh+3ggWEYboFW3emu991GU3ReiMTcaJg2F72naI+cHKaZFR0x7HuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/cew2hH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TgVHHTwo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/cew2hH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TgVHHTwo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0X3D1025811
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=; b=P/cew2hHZQT7dWMP
	dOgrhAfwUUqvNmkCA61QHC65RV6hkeEWLtXjiK10IczKYcqiVrxE1fQ/eN8P5k5b
	XCuTKUUb+qdOBOjbq5Rq9FckjgM8HQ4fapdpZW5haLnLuhOVFVCHD3pUfwztoax+
	OFSSn0tuK5dnngeoCKoj/oK06I/TdacobsbGxubKDSarCSDv1jGJcSizQWZu84bO
	auQT7FsR9NAhILViOX7aAvsHF1Q30+jUjTASqp3jwQUSTPWrt3Kv3gvkX3ppMS3i
	lqiAUoiHK9p7CPRd3weaNxFQGD1a9ATE+BWezwvVJu7RrU2Mq3NphWA76GXh5ePf
	Amv9aQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5sg26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f80c76e6so62194105ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398053; x=1790002853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=TgVHHTwoSHOgl/kWyQTiKbR9TlW2pFx8hgPSjqFDKKiTopm79KAgEgyjbu0q3SowVF
         ZVQ6l6Zq8s72Aw0CcjhwN7GwyoYYSjDVRya0h2zSIIk7M3ctgcv0KKD/avlYO3tlbUUp
         TiEti+yGs3LZCbdmlqU4+wgGorppKyNKKoVr5MWissvpeYHa95f5kJ6V6L9/+C9oSx88
         4RF+o0dw0nvguWdqjkIeTnNL4DTsWEBe9Lf18yIRM62K7zTozLpp+VGlZEXj1k/XM4Z1
         W2UQ6G7JEqEgSl0FI42phX3VSvnx23wRH2Ly75icHAO8wDzN1HLpstPRXfiH1v8fK3qN
         E/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398053; x=1790002853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=eOw7MvrORdTLxy5009sgzCXmSjiakj1q26A2Lx8OnnIDsBmlgi1uSK59yqVdTOiese
         dKDUydv/J6yJd16PHCLIt8BQ+uWkNn/wfOubkLfmWEYj9PeCeIByYActp4P+Xf3jWW0J
         ORxQGwriQTPkI7EdyljTVQFxBGHdHfY3bj36Sx0OUGAtt3qAlhWAg7HaEfJNrgESY/kz
         vmCe5VlpOA7tirVWKQP4p307IeakGUiG9fjGRnekJsqW1zXuPE4bA4GNw9rPKe9C3L3e
         njvHFi7sKCcttlvJCVz6RavaOFBlS5GhH1g5cPfIkPSvcQf5xXJdiw9uZn2sY/5954sZ
         qOvw==
X-Forwarded-Encrypted: i=1; AKwUvByaqwrs7dkW8E7wPGP4VD2erW3kAklFmbW4uykGO0AqHBgsRjej6o75vnzeDFZ7n0ChLI3MLJxXdDx7+xJ/@vger.kernel.org
X-Gm-Message-State: AFuF++k0JjY9Ae7irt+KTyGWi7f3Kzef3hT2M0V0wjp3gWxqiIjmNqxW
	SSGD9aZYTNQt/I80qQEVvjYazOMzXKRn5VaAgqRpBkZc0Bjw/L2eWL7M4ASOvUVh7ddPt9J7B8i
	z0Zd+vSIk2cantxe6M7MUxJ8Cm9tivqbtJcnrvuQ6v1J6cr7HxksdEr/n4kKONwHhXULB
X-Gm-Gg: AYBFou3E4XOMe7FXd0sZcmyRu7QtWoXJj3WNm6qQrizy1FbkC8q3dlFXQEOUDqMxsv7
	yc7F3WKmcMeBb/ync0kg3Ktl6uI5B5BqDcbrROHIv0c8IrVgRiviudodnUMa6KJJ65Y2iyb0jLX
	S7VCyBMK2NhdRnk3wSD/I7YhUfDgZeUnThqdCZwR6nsPgJQZmLKX3RamkgyhlzmkRUHVwCnkVQt
	2rlBbu/WI1KH4369zMAKBZy/Um03+kr+ykLZAuwxQrr3Qmr+LmG9MvIqq1ybAMHx/RprSoBXaEZ
	2ECE8V2SLPMh7x9ARa6ekm6dWKa6RP3nvxvgI3kL9obuxG+Fjp3RMuokMLEgZSBR5oNYoL/LMFP
	P94AgrVq4gvnka68OIc5cDvFP0cAesVtQJfKi
X-Received: by 2002:a17:902:ecc9:b0:2db:539c:b7c7 with SMTP id d9443c01a7336-2dd6c75a41emr62772085ad.20.1789398052510;
        Mon, 14 Sep 2026 08:00:52 -0700 (PDT)
X-Received: by 2002:a17:902:ecc9:b0:2db:539c:b7c7 with SMTP id d9443c01a7336-2dd6c75a41emr62768505ad.20.1789398050872;
        Mon, 14 Sep 2026 08:00:50 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:49 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:12 +0530
Subject: [PATCH v25 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-8-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
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
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
 b=fNw+c8n6DonkQZy6Ryg4I7jQGU3AwDIZpv1saXTAQP0uoDA44F09SQVdEZYzRHbUuA5FolYsW
 532efuuiRUfByHxOdaaphUQmNsImBGJ54C2AfORsbVFpdPXiRM8pMD9
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX8s5/CeKb9G5P
 COuzqGyNspw9vKejvyQSTHDZ8EYp9Ksxv4lHi7N4bfEIjUkjKhPumE0JnTH1aTZ3/kMNjvBrLzo
 j11bbsyYYCH3HYzzMZPaC2zuWoHf+lg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX6rNa/it9grhS
 366r+oFGn3d8agGtH0IGu/Bp7EyMxXQ77XOMe4uqds0TZe5xKDzDedeDhi9gJH8Ya5wmJycoP/N
 tLYZ/G5TC+OsPFU+uYYQJSZu2eb6GCePaTcfXhjqYFjKvuRMg8PXQid5w77EOX0HiA5kvq43uLe
 9eURXcXHt7+TAbUrXvOxXwfQzm9tICXOPWZdh53llS7mQyecfand+sx7K20yO+PI3i6KPeqHN1l
 I+6oMWRe9joxzhqWAvTcfHbZZwbl96AFKzUdyaQDXAvR53wkzLElur2qcmYAU0pT53iqWsOAkcu
 mzt4FhUsK/EhqlYTs3jAiwWR+ut2ww8mfPzk7VX2sJU4oxKjPkwctN/vSj3dRDNF5r0MbzKrXt5
 s2/1G1Gg/gUx4wgyM+mmqnB3he511oBKO4WH1HqFSR0A0x6E+fWbBEoaAI02JHEI/KOQAhNa4ql
 FC+YyytnJjFk5y6RXgw==
X-Proofpoint-GUID: shm9rfbFUIhaWIchlZbzYSpFcGxQicNE
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa80c25 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: shm9rfbFUIhaWIchlZbzYSpFcGxQicNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

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

