Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258F374A1B
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750399; cv=none; b=KGwTYqnlpyzE3uxifPx+rwQkyBcmK7E6SjUUN7o0p7YHa7qWplXthTG86j3koZIKbmgQrzig+xs0CqZ57ByqFKWABU6oAvrcdo2ZZ8JknltC2nzaqnvjjLAXph4DozA4kVcp4nMnm8bfEwKBg/diAtaRgExfcupEg/MNsMF4fy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750399; c=relaxed/simple;
	bh=O4Tzed7m01NrjoUwSpC2HzBAZQmMIMSt/VK8SDx89II=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJbDPcLAVSB2yF3D5QHDf3ysvQzCsd0AgNfyTqGJYDNt3ZS8ZqA2GaeIFDNy6F+028Ro0ydtDZOt6T4BAHDJyLTJ9cUSQrQb6+ZWTF5/Cvc0z7+/yuT+dmL05pP3C7zZuYoa7fTxWu86jwHvh6A3bza8P1STLzfN0yWvoYZfBS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7izVduf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjT9QzI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7izVduf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjT9QzI0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736Et7E005446
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 09:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ezThn65VJDM09Kdd3e/bqDNQx15D8XtlMr6yKq720FY=; b=M7izVdufe4+P8sb5
	LAcVwgnRudqXPYT2ajswUCwjO3LYTD+vzy3GVnFxt5ff8wmQDxA8q+foKI2liHWq
	p+F1m5WiMNS6WkzHO+GXj1KKHchgpQjqMJ0qYmfjvL91jpGju7uOEt4kNWP4pyjW
	i+RCKJUHKTMkq8w6QrX1gFj6X/6e/QDOm2DQPFCcCZFJ7LArZLz9QaWRojvsnxrd
	KA+qlGH6nCZQ2dWVbkihKQbcrJhli+WK6oEhf67u6xHrQzTxLhFX6gXb2bgyLzBH
	C4L5pGlbbRUCnoJjmCTj9kuERSyTnPOJzhD8zZrlXrUMQ+PTyiJZvryq/gWXlxkM
	4J2BDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj78w0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:46:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7621655eso5931439a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750395; x=1786355195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezThn65VJDM09Kdd3e/bqDNQx15D8XtlMr6yKq720FY=;
        b=BjT9QzI0M8n3S5viCJtU1PZaphSK7zNtAi+m5jTzo/RC+TzJdrmwPC+/StGY9jhERn
         sGUL15HBI2FBE3uhvZ+DcdeGStquliVHkA8afB9oCKjfcOpzAuLgV5u+MtnY6LAvI11S
         4b3GX4D++fxJ8y2jFpSrVXq0WLUVGa1+jR0IdpVuNfelb7umKg5qkOH2wtsSRaTmduul
         W4UukoTCn9uC4HpRCiNGBqJAQG7ciTtzw9yxJXuf7lpjXnZhmRwx2JXO3yJ2Pf2g+ZtJ
         f7p9IMy0lS2iV8wLUgYarh2R8cHrGFcctanazVgDHZNDuu5eFPdcRcWeJ/eQ9OLgquNu
         +fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750395; x=1786355195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezThn65VJDM09Kdd3e/bqDNQx15D8XtlMr6yKq720FY=;
        b=kqbv8YXmaOwMe/pQSrwhp6Wp8SmQfqDbHQvGtJ5t5nTddYz9ydANXyPHjxZC/eBHli
         JUvxKNcjFkRySZ0rQ0gOPt8wKYAwPWN2SZOi91VqGqzBDoO/zzNmvyYuewaFMCdLggPA
         tFqNbGVD92KJgkGnb9+wAp9YVwGx8zK6E5xrPwaKZXMNglH4wnLZA3onW5+Gwnvd2Tof
         F1ggqZqFYqqOLuSF4YBKfIIjeCaFs22dizChQRKZVSkgOpm3skUCKzmngXmGgUZq9cr3
         BWAFfRM0sw932lKT9kmcAp9yG/zYgcLS6pz9+dZHJ/nS3ygZ722d1cy58VUWt6JOzbAm
         vIbw==
X-Forwarded-Encrypted: i=1; AHgh+RqJ6w1ohsW9MHvqjLxVRy35ioJdEalaqy6ZzBacqRaS5LinYLUjhxbC00AjdXIftByr4ynmqSFGdfrpGYTC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfy4prIxu4ZX4zF6tyr00qcU2x1Gg6jKEGuH22ZXwDxf8RZlPE
	bmAhdSZmXIYCQGxlHYSvjoxUPVQwyYcaQPrbHO7Wyo+Dl3ZPdltIKmUOqhgd57/Fw2SAf8eftVr
	70GISwz1KDSxbQrk6H3MxKSorZtOo449k9KS73Iw0unTc4aNDlsSRuIAB9+OUgFtR818d
X-Gm-Gg: AR+sD11Hdzn5NbP+5OxVUum/PKGXiWB1rLXs/2Hn9U0Thobt72ORrbOHuYy6laXfVrQ
	bqnjaZBPngakqXem/C/E3T6u4iGEO8hJkdBWPexmUCoUxpq9JwkBdmkkt03+LiGeLPOa5EYN+HT
	Unb5vV3Rtm0C8sNiDq/VQAc4QbKPkY4KcGKJVouuohJq6pWiU4LR//Uo2/uHC3hzuSl/v9rGU85
	lg0VbEbl9OQL4mzM8giMRJZVhL8DTL7mkZR9MibI1KM9Y7suufGfObvFpG6zbhsgzZ8/rX9QGqn
	VttZUqkmF4OYKTozKr6Qh/Xi6aZBrMv5zGnLXMQIbrnaDCPxb3nB3lFdVMPTofhTN+68egmDeel
	3msobo9ztAoU1Y3GyyO4jkLFXLRH84j1vb6cq
X-Received: by 2002:a17:90b:57cb:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38fbc4431dcmr9095179a91.14.1785750395456;
        Mon, 03 Aug 2026 02:46:35 -0700 (PDT)
X-Received: by 2002:a17:90b:57cb:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38fbc4431dcmr9095152a91.14.1785750395034;
        Mon, 03 Aug 2026 02:46:35 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:34 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:42 +0530
Subject: [PATCH v24 11/12] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-11-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=O4Tzed7m01NrjoUwSpC2HzBAZQmMIMSt/VK8SDx89II=;
 b=jIK9eRQowAumFQnJU8rgPJj3lU1UNl6daKuWFCJ3dV5jgI1ReAHdNEUECvVtm84xI7oCNMRfr
 Z24jbNqM8OnCRYo8+wOhwXz1fw6dU/k2BIKAA/ZnbfCF1H8PV6qp1J9
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 4stWCh-jr_Z-oK4jwLyZvam2xH6pOSA6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX3h1AaoHTxTxz
 JvX+lNKSsr4S9GziPuSrFWOXH9Kl3s5Lp8OCNAlJgdtEEri8IamEUajQPqudEmgUS6D30VC5l+N
 0g/m+UPLMWHbSthV99HHU3bhocId4PQNJkqbn8S8aH9BVXcCVs9cFzgBVoFFqe8lXgu0Z6Esug2
 8qHZ82vD6TJk7dmac09qZFPX7ildFoLw5bnatn5PkTpK6CrrMvd+UxsdMacxbq/VHmmCslBtPfa
 NTXKSlkyjo8T0IfOoyEses8jYXeOotSGcYyRjyq5KR4OuVFQnnges5mcB+g7eShQXKuwcP7Cbos
 MeqlaZreRzy9wgtsjaQG/sWKHgxhuT2M3Vj8DNcEEtTQvaErztbvSVc4wiwag54t+osXm46dGiU
 6JBG9Wseyt4w226314H2g9nuKxW8uSsdRzJ5/7bIilPQks5aPjGtA/xdbfEkUkQGXsV8G1nZkCp
 aabkrNerZsbtoDwXxPg==
X-Proofpoint-GUID: 4stWCh-jr_Z-oK4jwLyZvam2xH6pOSA6
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a70637c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX+Q3XDXWqKTRe
 nP7LCQKLziSzvSczHSjPhJbUn0L4qB0zVWc2o7v7oo1ZfGcvRBZgJu4jPMipI2fWzsc+fbXrds2
 amBB+u3pyAqSNU04COTosdVvWdCD4SY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030087

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..df668dbf2bc6 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 2c0af0326147..81cdc4ccf8c9 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -654,7 +654,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..aa95584b000d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
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

-- 
2.34.1

