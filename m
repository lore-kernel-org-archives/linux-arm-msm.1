Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC32483830
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398048; cv=none; b=CluT2wIkiuxV7lrvlLm731YjH1oDTcUT6Rer0XyZnpOnjAxbYGfkegkAMhkc5cRAilgxHMAYDEyCmk1D2n6vAwB9LoqM1viaJpBEYmzU2TAfWHdzDZjb9dZNhKkmNsW3mGjj7a8MO1Tb1FokWv+u73pKwzHPGei785eJQ14j0Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398048; c=relaxed/simple;
	bh=qOFvn7wgKOMIlixvdMXPEO8Y8u2ONv9k+Pz20i023QE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=afSbq4TQ2swbMlIau2DgRRy39KH5vzE3jsNP2Lm78VlNQOkauDNxUvH3uyj/re7mBT65FC+3Y9zaDAPfar7W4riWGx4Oof7WT7zReYDPLaVitEpcKAzQVOID1MG5Yx//acWkJ4jEjxdf4krU+TXj4gIUyJrXlkAzuVaKYTnvAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOk7EHTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFqm0KgO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOk7EHTb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFqm0KgO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0WLx1025791
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=; b=jOk7EHTbuz8pS8cH
	2Gb+jU3y1nBmkLekUDDyGZ/92x7TIofuECsKyDafT5bYNu0czoCcznXOSW5+1Z/a
	X/h5ePTTxWNH7ljipeU9G5D9PLnYNgZAIBLgJyzYH/L6MiBAzyq98oYxEqG1xMO7
	lmjkiwVkz+jKPjPmXBgm0rzsIlectJST8omgNd26cVJoCb5UXY8gCoASQ1k2Oljd
	rRoE8fCgiF4fAAG7LpaQQc5sXk3cGtoNDOkfHSHPf4rjw925n5Vb8VLtaRUnn7OL
	aAmZ/ZSzhgtmEtx9hKoSpg5SI6kMt7EpbBWRAS5T5AfINeBGcJTPRnXXEOvAkUtU
	TcLQcw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5sg0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:00:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd753a52bbso2260745ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398043; x=1790002843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=;
        b=PFqm0KgO52NDKfxAA2MPEykdjmAe4m2v/8dxiou2mqozkrPkSJd+phaljE6SB9nPAr
         5EfIn1UpTJlKZeCYdQjvjp9hWeJkaQ/bpIxDvmnHxl9RISjMeCVMUc59wXC6d17RmS5V
         sxw8tsViXZq7u2zl0dPViVAYC52rj+MmPTnVffeLG205u5tuzNMmX9qJLtYsTJpnhndB
         kS+gIS8FOrU9/LnrjyzFjrbp4dFjZV7MyOsSn0JCgrAV1cLKzqGGekP+yvUU/A2ZBg7m
         V6+oYcrg5+QT2YzcAYchpAbVqCm0g2lO5D7FGc3GQ5GXWTfT11aWJ+TVSvay4R8KITEJ
         wnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398043; x=1790002843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=;
        b=pbBjTidQOv9qcUwuV+bwuSs6kNA7KyFkWh0JbemZV3mPG7T97/Caz3PCDbLB41smSp
         HHWnhn3dKvT9oBsJZ7I2t8zF2hf/35CX2MBNsYVsk/ydoo3cNM1BHggezkEbrB0h4lA+
         TT9Yr1fhs6aPm9kWPQGDmcwPjmuqOrn2AuGo+vKmcywRa8wopWsODoRm3gywJkI5UDxd
         SGFyPuAwlMcgqT1sWpD2YaH3Mgnf5YpI2JhZN0Cic0SRw4mFRPGiS/auOSm3it3m5sS0
         zFJm8fgoHo2Vc87rk6IWSG1zDZre5TqGHOL8wQ+4jpqwGFL67x/ZvsN9/ia2RwUv20y+
         Oj2g==
X-Forwarded-Encrypted: i=1; AKwUvBw7xrbQk+9afuKFmz3xetnnK1kM9DOY1K5Ux8ssJ/SfrHc7VBo/O/Xx9VBNFatm3NtusOy1tpD8Y+q6DswU@vger.kernel.org
X-Gm-Message-State: AFuF++nQCR3HtQDOQnqBDmx+O3BXpN0rLEWqhBXHAT8w444+0oiZZ920
	bq4IysE2+Ae4IJhtERTeVEOFmcsZnuIC7Z3bcuydnsx3g0O7GDFAuWZiY+zfdNSMNgvRfZuLRg+
	wmiy68tMwKD/9SHgbdkPofxOfvYB9RqqYs+YFMQ1q6Vjgp7oBPCXwj5RvLzGtaLVC+ORE
X-Gm-Gg: AYBFou1F+QX05ts5Kq4etPMDBqwgX8uzo4GpeD4uoiZ6ZrbE38Cuz95e2liIrfERFSO
	MZ10Fcwt4qhfCu68oo+5pOSZCuKj5BuK+QOLSQGdyVsXCiNYEsgbH6P5tyb3INo40h675igy6/Y
	pNk26L17n+rGH2t7YMi+7BxWamXVdZuZka25ijaqWqSo9tbb2u2ldVY6007s3M+/VebLQ9eQVA0
	WXn6BdWoTX3JOv5RNfSnI834NyXoqOgSjILDA4aLqL2cIHxJuSyas45M5Nqa/hQnvLUXycZlIMK
	ZLX7Udjsn6F5NtHrErxHqvMahJpxgxHiwnF6bzYEd3hE2AsuGPCoUvURAwpPOt6pQvtpzpt3pD1
	YW04lWnxqjIz16NvWm3A4Ud2+VGrE+XC+ZGJa
X-Received: by 2002:a17:902:c40d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd6c6fc4f3mr55281805ad.17.1789398040381;
        Mon, 14 Sep 2026 08:00:40 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd6c6fc4f3mr55278505ad.17.1789398038902;
        Mon, 14 Sep 2026 08:00:38 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:37 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:11 +0530
Subject: [PATCH v25 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-7-4aaf5c09b5c2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=qOFvn7wgKOMIlixvdMXPEO8Y8u2ONv9k+Pz20i023QE=;
 b=txsEWykMpTLSUOW6FXQVTJLBQQ1Nc4sqO3I+bYIXwGfuhPQ6gT4S9k1E4GUbqfnAs8R/0URP4
 /HrN6czalP9ApLSw6uR4PpjIRu9AyPfqqX0KmqYStyBUvqXmpeSjBoz
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX2UBus6oZCTyZ
 B9UAHPRoJZU7YHSlj5ly1P1vUWUakrLvAg2NZOigvXIAsLMNIHYnN3VZkl6ykq/sFBgfxn4EUqw
 BiboxJaFn8JXXXuhmhN27Z2PJrFkPJQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX7JY+xlvPJ+Qx
 RGs/JOnsoUr0e59QP2JkuovIIpTjNCafr/aTOSWMYWj50UCY2WgMnhEhpHRuh1ZzlW6n/8yNXyS
 tW9BfKVpO6+PuXQs+cX+MzHnq6nlOzSKIIQShgLDduukCT8WaGlUOOdck4RtuJD/m3FPU2uNPfs
 Wbh8QmVIzcBaVwx+KdZlDAN2ick/NzSXPUoTgN7HvGLIaaAqjGYEZX4e5fFeaOi8w3fLZI0Q/2k
 eVV4gmyVPdi4kvywinZ1tZu0nZj6yBVHeSVx9Njj5UvghdBAroA1IFQKBBm0TPZ6PKQOt/tTIqb
 YMCQ8HeKp35y1ITfxw60+7XtD5fmBgK5jZzt7+Lw5cXZhgfY+i1d/lPX1rExXm/F30+nQS3iebz
 C23RmkMrqc+C15+3AsxMWHAYQmmiW8ea9vTad/4F3uLPfxN+3MLLYIDS0x09hhweTmuknsUimMD
 HV1m3UGnjS7oYqvMXYg==
X-Proofpoint-GUID: VR0syc6-mUMkRYaP9wq-O3HdAGdLobUz
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa80c1c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: VR0syc6-mUMkRYaP9wq-O3HdAGdLobUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

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
index 3bb5fca8e2b1..a107abee10c3 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1097,6 +1097,13 @@ &pon_resin {
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

