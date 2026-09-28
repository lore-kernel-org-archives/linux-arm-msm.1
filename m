Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0799412BFB
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575882; cv=none; b=Szh+91v8bKsl0orlk8EcQGRu08LEOkG4SUpteRlRZGzHyCMDphaN8LiQP1sjg3YVEiZpzpiVcpC21hPNVnhqA8su0N9askaBOwcHbD7axH0peN+4LXgPeH9hFOF/ceg02ycgfFZIQ3SNoWgfaR0yWb6U6fYMlflrCuEmFiiKw4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575882; c=relaxed/simple;
	bh=4fTpCSkuJ6PFbWarr8sThQ/LuS8y6G1v4667LcR6KHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnVr/Nzqwvh1BpZFY3VKVAYAG7lCOc2Vdh+qG/pVQlzCwhJJ8wVw76FgwnmKz+31Xbc+LNtOj/50qYukNNXzSiwHT/irvLcPZgzawRJRU0ruKu2m1Il54PF7NoGd4FtwgPhbWvv5hJkUybVSUs8xJdGFZtAKbpm97Z0i8ENkjgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOZ9ZjuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8P7nbum; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOZ9ZjuI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8P7nbum"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S0sTFD1478410
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=; b=EOZ9ZjuIE0dduKpo
	B6a2rcfZiNXle3ufVs7znH6/cZ6JJDFXCZP9DkslJe/QkLc+ymFVpZP+s4xD/ZbN
	h33Nt5onGkNeBDusGwEU1GVQw2mNpcow1gLibzZ3YeL+O+9zhV4CyZxUdsk1Me/T
	1RPhMa6CeK77aQoheDLOTGloArl/61SZHFTihiBbAdRQQySW/QhcvPUDJVNmK0ge
	uld8V+OzApogWvsR8NgT5ueCX5oyt/R/lncIq10YlIO5ByzuE2HfMDcyBmlRUPC7
	w4avWK2ZUl1REN+0KGSHOqdfHM6KziTUxsCvrolM+sZS+5005rpQeOZYe1PhyYA7
	cJWrFg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526mujs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:11:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so406766a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 23:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575879; x=1791180679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=;
        b=O8P7nbum2XEu12GmR96G/XitTqsa15OTs2whBbl01k0pbzrx+nQ4xJ2S0Re3EZ2uv5
         BW57nqGEqvkJFZt8+2TaMTsVL2cIIMS0bq01iZ05U9t5mDLZuf0vYVhpzdQzW+C0nMz4
         BzYlBRfo6sSl9vEmfZzYtnFkYCoyp4xIygxWPrZl17sR0J4kwcEUZPeRA4S07XxHpZJA
         /RgAuK11AIgZbi3kviiAvqy3wZgBBMZ5asx9sruhMWaso1Yliu4PyCOdEGsrP4R/JO6q
         K0lBXC1nZT3aJh/woohYrckJIZzX4LiJ6EO57TejBYkopVnFnsrsciwIntLyKAAf7ZxM
         3qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575879; x=1791180679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8QpsQNU1m4GxJroPAMjexZ1MBknKFRA0AkELRZtXV0=;
        b=WfAORWl+DjV68NJ/msa6s9U+J+MjtL2PxCJBa21BORsfPIbEjP/RCXIf/XFW41mo35
         H8y+chsXPn07pAhDoMnGos7U5sPtesXeVgljuOS9k5D7U3wlcYNZRNajaVSnl+IMqC+u
         Wzjxp9uxQdzC85raYy5ZUBjRmgdJ0L3kEKwCmSHVj9jogKrXhb1e49/m2aMtJmhBkcRv
         ymybRWjgVZTM386sIrM56Q2radp5KMlTBkP1Q6xqU32+YDeFKtztL9ndfCdeiXc2JlY1
         L5yx/5tVu8of0xqztcVA+EkVlQBNnV+GUKIF8UXQJKjzWheR5znmmkaNBHt12BftSbnp
         LMvQ==
X-Forwarded-Encrypted: i=1; AKwUvByXnJETURXN2oXFNw3TabYtLVGYw210wks5BM3mgcKyZRytT63OSy8pD9uG83tgm41Fh1nqrZWhRc8xNut5@vger.kernel.org
X-Gm-Message-State: AFq9FYLk3QGB+4sIJaZ1X6qW9K6gTrE7CrsxWmv9AXwVgacL373LkfE5
	wurPm4AdYg741v1B4BwmTva5DtSS1oo0fVmo4ImJ2lIm//R11w0AecgWGuSKYGMQqLiYhgD0tPg
	gAOlfpTU0YB4AGdpWAAhYF3CYqvPbnFr9pUpGVM2XUgMPJbNBCyB5GDYK4MDj/PGCrRtU
X-Gm-Gg: AYBFou1K00hbmX04w3dRcy3ncp4vmU3jUH3wxa1yyoysagvUO5QFavPmX2O8FGBEzo5
	7bENLjcbHRQTWZfQCKSKyujPumgYP/YSK9Ik3JL2kBnMyKFUeG9H8idy0Q14dgkZCMA4MfphFwz
	4UYTuhl0bk38K9uB4mboBFsSAziL2rX9WADGH4BXl2N9ieRSaI85C6O1ZwWPRGw6JT7LuOylT9z
	kicpJjxGU2W+0OTHywgbJ7qSVpjEAAIZZgeDAtUerd03O5eflG8YHMsHZl6k6K1mjl9IsGohgfE
	INnyJlXODHpoF0MT1gTsvvCoTI1SyM3/Jmvt2mNauEMmzNCTX8sLYOcCQoR3Xb3/F8qLqK1MXBp
	1q13uBLV/tsjum1zZAUxdTJDmA3E6R7A5qGBZ
X-Received: by 2002:a17:90a:e184:b0:3a0:dec0:c0cd with SMTP id 98e67ed59e1d1-3a0dec0d419mr3306183a91.28.1790575878524;
        Sun, 27 Sep 2026 23:11:18 -0700 (PDT)
X-Received: by 2002:a17:90a:e184:b0:3a0:dec0:c0cd with SMTP id 98e67ed59e1d1-3a0dec0d419mr3306155a91.28.1790575878091;
        Sun, 27 Sep 2026 23:11:18 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:11:17 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:22 +0530
Subject: [PATCH v26 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-10-b24e2348e8e1@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=4fTpCSkuJ6PFbWarr8sThQ/LuS8y6G1v4667LcR6KHQ=;
 b=AMvkpSWzxwQY0CuENEaT8ITCw/S6jnAL+oA3VU3+sR8bNDE0XnmTyr0/xXJtY9qk0oE8mfl7T
 unyxriQsCX6DQU4c60nqAj+Rn637XuMoZInvm/6h76J6yvlr0MHSgoE
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6aba0507 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kNzm6856GWk3MszJ3ySY9ay0LO9OkRDE
X-Proofpoint-ORIG-GUID: kNzm6856GWk3MszJ3ySY9ay0LO9OkRDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfXz4iVOkbaOxiF
 7VGD5Q4eXiAc/AIoEtLXwi/drXmotbZKlnKBQeyZb4dq06o16DUWPp6VogxKJTJweZN2Vntqd9h
 OYhEytZvG2DIlKiTBuueBejtEan2sBAduX7zlOV5U1N3DSvZaeQfgMNJzn08dwSUhsGO/r3j2Ah
 TFWt86B/Mu600xsGtikGNHajQBlh4OIE9nYuItHRz5GYCEQJSDfb+zVT/FjZBvnCCwGay06kAl8
 p1OTbRnSxh2rNKVih3Nv74fDXgZTwGzisaPo6XDhlwUedM7OCxMekCHjBb7Vr9lcIxxwCr7r62M
 +a/QeNpzuZNi81odYOwjK44TGoFuYGHMEj++JTiVzEi3eAsyjWoBXTfvIYh5dodYM61zpQ1lhBJ
 pa7AOSmCuihAFj4gtuzGtm8dkIG+JaNAxPvoI50HcPaIZ7ZbgWJEivYnqSFDyCXzybUO8bgi4zR
 2Omh0Va1OX4A2RbalsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX9mJJrrr5sNgX
 BaFRU1BFE3RGgQGkyfBN8qVt77XtxrCvYQQhRRPlcUOH67PDdn5UXV8xo0kSnOrb7hHui+/0IIj
 yOu2DQeoKKfQ8qJ7Hiw4RrRtic5mntU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280024

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

  Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 047b4efb04b9..48d3519f50ff 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -498,6 +498,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 531cf41b94dc..a2197dec430a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -581,7 +581,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

