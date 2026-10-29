Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264547;
	b=0wJGKCMVR9xJyu0pqSdWMPVzo/80JppthpJCcgK5uZziyNI6xox/UqRgBNk5Hgq03CYx
	 O4C5gyHl9d01iIH8tn22LYil9NOBzZt6a7EXr703b/Zkw1jBO7DISXB2UFUlYShBXcEfP
	 cVfTITADhTkL9AT4KsyATJ/Kw3bKYwI4R1WuapyTEqlqtJmC36seo4SzYdwHpTNhnfpNx
	 54nNvyEEVvBuBxvI9oiOj/Z7pkz4AZbybBpo7CdAcM/rP/JOLHEDQFbh52b88qz1IV9yQ
	 pwR5YBO2uVXBDONv2aF2x5iGEwp6Q4DfqpY4QOcyZ5AjF40h+iZxUkY0UmL1nhOVdCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=;
	b=YiFeeO7A9zQLoceB0No/qsgO4aiZ9M8myvG5BuoHwK6Rf0xt76ZF6Z4XIHBXZbvMbLRC
	 Pwz5mXmIHGP8Mw/qE1HjQfX4jexXGYy1SN67vbjqoEg9a8YUbTd4KdeUNwQcNr4ZNPAfs
	 DulxtAokqxem3x0opd98GMnZ+GDpfYFGjxYLmjz/s1tHD9fVSpPOULRsba2pPSI+1vNGL
	 gMbNv5BVBxl3mUDcY701xPfA3rFznG3+LRsKqskUVXRex6afqns6XOX5oSL9f+JOGRwfS
	 SFzY1yezbjGGwmLJTMBWBARqATIRfjFRRafLsKMessRoyV9F7Zv5Tvt4IK/v/xiRwKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C26XEd2C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGaftdv2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101DF606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C26XEd2C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGaftdv2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8v9hQ659652
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=; b=C26XEd2CcgRn4dkf
	3jQTT571CluA7sV2xEQK1/gtOdQEam4dkB41lT12hh33q1U3qncelaTHCd3WVUyO
	qPDjyOemwsMNbxO9U25lPqA74Ssgyg2BX6mkpIzWsLjj97Fc+PUGkFso6uhof+p+
	XnqOWgf2yYrnJbiGUedWjExUuntQP8XGdixAdf9eaDYt6r+VtlvJLP61glqTloq9
	uYKU3Sq0dO3wovB0LYQiyVFfmjwXktGpC6eGAB4F2VDCQk4psbSnibpHnPJ8aund
	n6iZP0saS3vAO4pz/naU157nua9o3V0Z3X/rw/w98R2WS4pqUUHFfI+ElbrYxjy9
	+SIRTw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehut96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:02:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso1708834a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264546; x=1793869346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=;
        b=gGaftdv2Wf9RwbhsKxc9U5IBHqEcCRQvNh2YeYmkyB9HGEWXv5lXr6IpYTJbzI4iyQ
         9xn/soXibhIGApJMQqiCDzAS1pVgQEfUoXkPgzH+at1AH0eTOShMUD5QW+caL4x9owei
         CcA15pgzc+sFJZrPbsZLA0B/JiQsyAugZ96rI1e8XelYS/uXPo+RXkfdDQukFp0XxeT8
         5C/JIFm2r+gDJgqao8JD8PWLGth6UsP8Uf5XLH24muYCx8vFcnIVeaPsV+XOtzlWQHQi
         DTI5X5VduPNiXB7ZCKQxvENwGY8Wm1zua5M/mrpfilblZIvsELZ2lr2OuNS/0PoR94U6
         40lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264546; x=1793869346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=;
        b=ZaYG67nDli+wNywp/llxUToFm5fzb84iJYoGZuRzZCDsNCCHH1TubrMnTXV/OwK2Aj
         ow3sSvmxCroUwb9AgbqvtSxKMim8LVG5mog6/UxZdG2n/sqzOptIho/Vbhdr4l3wYcaL
         TLfV7ozXwUU8Q0w/sSWVMDauLMTZ9WTfEFp2HH95qZ18Z1r3yHcpIh0Q0gAPn4l4o8x6
         DQmEmKkupE1yW4oXe5BhWZif3DZJpqvGyo5xwfDQKvh8CVQIFydAgUFveFxmreO/3EwO
         xudDmVb1L/a75/UOvZu1IUx2twOHmWp8e+4jvH5VMN02/VTUODGWp8FyHtZpjLu4eyVJ
         Y+aw==
X-Forwarded-Encrypted: i=1; AKwUvBw1bBm1S6sVIf/tJ8HVxN7PU13rJ1iJRsMlwptLhCahYDLUO8pUeg8mB15gOJXV7tlRxV1DwZ+1W4mWY++U@vger.kernel.org
X-Gm-Message-State: AFq9FYK25aMCki4W8r85+UXh/LXiYWRwa65ZJcvMjUsshH/n908seZsb
	ziEBdLVlaroQbmXUnrUuy259COdkZ2tk1fo9JYHAJor8NZ2ao3gcV87BDzMqw0Yyi4M/+3fyIsy
	UKhioSrjvCITsKIp0JDYdsgO6XeRwrJ633/SGt+tAjpRNy+h5otLz4cINBiUSv3PUpwYb
X-Gm-Gg: AYBFou0fnwBBHyokGi8cbb6XeRfHmGWktL7mi9pP64hiethzQN8HG6UUxaH8AkHtGEx
	TAFpbY4ohUMDrdJ8JIeR4m7QN0Fqb2uLec6Gr/tffWiHBxTMj1RXz4A2n1MrHZI+aw7YdEX38ws
	rb72cOODMjtiBnMOFdMklkIpqMEILbNX/uv2iDPkeXltkAotF1fg9rIkQikfVCeGi48Gm6NmNce
	SCYJUOC9JJPRPfFkrPLuK0kHPFbPlvaLfwHfmr6FDl5PJOne526tHT+cud/lTEiO8p3cIwqrC19
	mzlb+vbOSS7wIBALfdn4gYm9Z7khfrAHxs2+kGIJdbpsqNF4NQw0rtHyahK5OHJ+bQ5vTwXOenC
	Em2cHX82W0ih/RjHuesjIYfH6yVtxnfkp/+O5tyssRGUAkEMJ59LIVTjlNg0JYwhkOzoYfAxVli
	gVHasASSqb
X-Received: by 2002:a17:90b:274c:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3ae580df4edmr3665039a91.47.1793264545650;
        Thu, 29 Oct 2026 02:02:25 -0700 (PDT)
X-Received: by 2002:a17:90b:274c:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3ae580df4edmr3664973a91.47.1793264545125;
        Thu, 29 Oct 2026 02:02:25 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:01 +0530
Subject: [PATCH v27 07/10] arm64: dts: qcom: Add psci reboot-modes for
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=2150;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=mPj+QLGPnZnwXZyxbErfY3pN7hCQJuFpiu9YM0YUfhE=;
 b=Cqq6XXf1kv0NCylp7UGDtgQOM3peyD1cGQ4s9I1D7xhKF1GuKsTELxbtOUUYyagw5Rm4ch3ET
 Q6YJVJBmFmwDzewQbD9obZSG2A/e9W0Kn6Mp68NJkE+vEHkybMmG+5H
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-ORIG-GUID: PGyN3XjCw7YFUILbl96tAUPLVmvbDWyc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX5J46NFpCEokP
 qogSYSnqCXQOX+Z3pf5gqE/FOmukAN9CrJV+kDYEU5dD6c4+lBNGXpHBfxnqVDWOSSETnFpvpBE
 rjcbOK0n2stmngAsEzviLSqWZv/7uzpSxDX7Of3n501u5Erbq5Qe6cp+mxMc3ZQy6slvZfvpvQv
 bXGV3zNEV92xOUDOoJS3rduNHD1Y2KF1MwSDYwiM8KHZ3Hwr1xLSI3KdIk9vE3j2iFPN7NyqIiY
 4W31TOkAy6EzAM9T70aiBj1FpXr/nfpWo0MJmJTXLMv0ZEweiPVo0UBQLou6ORVX9niw7Tm2asM
 JDPnFr9YV5X38mkRWu2oM2+vADEGVumpME6CKoaWcgFiQTO3xYIeAVWmNx2FdyXjBGs3Z0y35O7
 kYd/UHuH8d+lDkXuzBjwHm33p3ziC4pDP2p4HIB+euN4eK1lbIKg73gl1lgTrD+D5JhVBqsKYAT
 F+NTT1TavNQ4QOpw5/w==
X-Proofpoint-GUID: PGyN3XjCw7YFUILbl96tAUPLVmvbDWyc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX9PdPoGSHtWpC
 wDutMGuPU9OLYyaQtj83VheEY/obJO50tzzjPk448Vi6e68+2dO+cn9UuaFYd7Yxgib5Jg1LbpO
 EcCbaARg11ssrwvQ2GQGrpkZaG7wIaM=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae30ba2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

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
index 8c7523602d27..d1b5eb9e86dd 100644
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
index af7821e02fdb..3001ec050a5e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -792,6 +792,13 @@ &qup_uart7_tx {
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
index 909039816a21..82788a1516d5 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1107,6 +1107,13 @@ &qup_spi3_data_clk {
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

