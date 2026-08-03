Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B8936E47A
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750369; cv=none; b=axhg5Mztwh8mCuqhp+tqehMVwEEuuuGLs1n6wHPQA1Mwa/LE1tBVUAy1o/OFbRqvxoTQqnC/X6b0Tl4gPCqtbklFeKhg6wddUVffH9wu2rGKbA7v4EaiDJVZjA1nkQVr9vqoAm65mn0/IXtSF1RLNbTA9HCj9/lxlQ/cYEH2NC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750369; c=relaxed/simple;
	bh=a4fxcZei+1h97cnUB4Koj6aUmwrxpdQsIsCANK7Zphs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USi2Mx8t3q/NPLBd8e82d76+6V+/kGDuWKptDKrTOIJkELViOZWjE8Lxc6KuicToLr/bQ8ANLbpBW2GXqbPCmheEymiC+51Ierd4Ztwy6UenemTQicCGxDjvO34dfSXw3PHk80MQcn0MKChG7/kEihuZWTo7sxJEG3EkNDyQ37M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a93+VRjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYS7ovgm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a93+VRjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYS7ovgm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bgDA3957457
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 09:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	miyN33yZIoWSSdkcC3toNxzlqXgaA/C5AXSlDcD42bA=; b=a93+VRjpDeAHhX87
	3lzQVhB0l2nMDdMKZfqsukZ2ADuleCH9oXvv4hc7jeo3QfbkmrkwoH58rGCYt0pk
	2xzWeP+aoKi1oCsjiHwrjfRx3wUigHt55EtszBCzOhEsURVYcPYvKajmJWcaTCrr
	CXsMxqWoV5a103PnVnIazeg5ssbYe4w5V7Pr8IGNR8G/G7lD9PUWxqhKH+vBA+Vg
	AFMCGqXnpXAtYMZJuS9om4czlVlRSpvpSgTBooF7ZqFy/MlvOkBq7KlYDcBFbfWV
	IckEDfEB5OT1BWI9hHeMkqfpOd+iK2GrTjhfaOZ5G9e7AVB+kDwiCx77AiHXpzMI
	V+iIJw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnguca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:46:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3063038a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750365; x=1786355165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miyN33yZIoWSSdkcC3toNxzlqXgaA/C5AXSlDcD42bA=;
        b=DYS7ovgma82sSaNv1udGP+aNo9QESD6efmRlO/0wDWs4BdDcf/vFxqxR1VRiXhlVM3
         CGXmtHkVOEfplqWoC9dvpvr6Y2xHF8FZ0uwgVBvPWfoO+3IUc0CpQWdPNPao1qaVtJtG
         IqEx/pad63T23smZisGTI6acoPXuNfLV3x58ftl/cxFEDua1mymp7RWfk3DBdxxqRBoM
         NOhK2zM0gUefrrkOiAlZ7NxyQQ/CINJLPD56PAq0R3AtXvn29r/vG7Dp7JptE+kfGhfm
         cbZNsbpE0HIccaiBW5uO34Fgfm0U15KS1FTPy0vJNAl00I8MvhIaeY7j9OcJFHPCOjd0
         XT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750365; x=1786355165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miyN33yZIoWSSdkcC3toNxzlqXgaA/C5AXSlDcD42bA=;
        b=GH3LuD0cl/1YZdpe8c1iUTm72wdq+Wgy4NZCjEidfBtwgXzcDiSqtxY/xagVdHLQQw
         4QT0gyIw6dAVMivW8zBccIX7a6R2z556X3VC/IKDa7D28I08a4oUiK8IqUA7pGTx+j91
         Ir/OgXyp8fYCVKZfP0X8CixlR9y9z5UlGANGzeulExX0ssJ4vcFZdMtPaL6i+757F4lW
         oTRrXmOTdRhhXKrGabV4Kc0vFcFWVjAi2AuSJ1mUy2xCAMryEgkJThxS5zoroC/OOG0m
         /hxVgFsPkA7ioCdGA8Su/MCLcyZzsDe3SO6IgzxfiStVuNoyhJfUO2ztOwR6lgt4yNIM
         e2BA==
X-Forwarded-Encrypted: i=1; AHgh+RoyeJyWfcEhbXQbLer/wtLPJMOrck0zXGZ/vjbpdjuYRdwRReTKE5wTrnkTwgORfOFRZwNt974jzDN4mVI9@vger.kernel.org
X-Gm-Message-State: AOJu0YwzdlEgezy8vH79EQi4NsP29bhyZjIaCmzTgON7PCcl6Gjco6lX
	tvgWBcl4/tCNFvaWXahb6nHa18l1BAcLxmBmXbsjg6qcmWy3ECU8yzqAU6ewORiqdklPzk/WMAO
	lMpxVh7vHtwEYQgNs6Zm9EUn0+sHZSzR4Yj1omgMb69iE4e/p8kOt0meuMrKPH+YMcGU5
X-Gm-Gg: AR+sD10zKvxdMfClSHecE0e6NpznB21DOI3hI4biZy4ubiBbJbQzzYBXmPfL5Pma3hy
	XP/z3aOYbPVCtTSEWYrnlqbX0dB4oq5SFlC6IQz78UG7QCHKBkvmlEHVBA/Z8lzoNHO/komOzQ5
	GDeeedaF5qk6eYn3FJcthxJm82g2eFx3FG70mnAEiunQiVrAE4L09yYWoO2hEF/CB9rUPKFsNbO
	YPMqYaEvS2X7qiBqjBabhdAKmosbOYX4D98x9+2BoS438++TEjf4zCmZKpacny0C92CxaIYXvMH
	EfnFTAa8d9vq4kiJjltFZOxmTBbP+D+IaZTvkhzeKIqaNAwkmilrIWXFjjTLDejHLulH8Z9126i
	K+kxVn5dE1BLsfLFJS61Hw+PTvAX+XiHYsSoY
X-Received: by 2002:a17:90b:1dc3:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-38fbc554637mr8271602a91.40.1785750365002;
        Mon, 03 Aug 2026 02:46:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc3:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-38fbc554637mr8271557a91.40.1785750364566;
        Mon, 03 Aug 2026 02:46:04 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:04 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:39 +0530
Subject: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=2310;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=a4fxcZei+1h97cnUB4Koj6aUmwrxpdQsIsCANK7Zphs=;
 b=6PUWyqdZoXA1QuaysA36vs/XHvAO2olSJrRMhPgZHp0LLLjlf15a6Ar5oPcErXR2QVPoPKJKw
 fm10+Fms55SCR80ZbNJ6JxxIvTiBOyaIWQ6cBXZoRzudw1S6emdYjg+
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a70635e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qQQu7YRYY0fa_xNKXW0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Zh-Lv3mKQOtlwl0t29L3qbYz4oFcW3OG
X-Proofpoint-ORIG-GUID: Zh-Lv3mKQOtlwl0t29L3qbYz4oFcW3OG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX8cT9itileYdT
 l9pTYnNhOCvqCTt2EXQGNzc0FuvbEKJPzfolJY2GfANjKMBNnAlpQBWNeHNimNOR1oM7qvKylDm
 j3DHvLJr1cKUcETZqNOtTIxYbffieBVxdTPSCuAL+Y8QsARscHEYlZdR0mWpcuYjaJHqvY1l92H
 5beQ15ybSnRp4j6G/9WILg6S30YsRjeIUyNfOgu7Fj6j6dR5q/yaX2FRrxA61trMZMduBwpSx1P
 XdIPLq3ioX6NseZi5gGIh806HDz6o8t+Jy4s4+lQjfUs/EAcBJxPpkzs2jV0nQLOxNL9jZjhS9c
 kJKwk1eF+pOMnNJVpLLgzo0ze25uj9dNnOBESeYb0CBMLB8k/rrH/xr6d8Jqk2guWpRFxy2SNnI
 /3xX7rPj5WrxQ2ZOLTQPT8lrEHBUxySeYmdmBN6HP2AR3bLEyxHcqyqpzyuOMc8wXUOS8k02Z81
 SvOKa084dS7g/amYsJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfXwsgmINTd5wFn
 uRM0aUhSuGrBXA7bEPy3T3dEIab0Cl6d3TUNhQ38gSwgF7L1fz6Gh2jsUo6vdN94bQZo5R1tO3/
 URmY0DK6uzSV0zlzuIJ8438Rc1BQXZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086

The PSCI "reboot-mode" node does not define a compatible because it is a
configuration of boot-states provided by the underlying firmware. With
the new firmware-node based cells in mfd-core, this node can now be
exposed as a proper child cell.

Add the psci-reboot-mode child cell to the psci-mfd driver with a
named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
reboot-mode failures.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/psci-mfd.c      | 27 ++++++++++++++++++++++++++-
 drivers/power/reset/Kconfig |  2 +-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
index 7affd6bb09dd..7befc4fa86f5 100644
--- a/drivers/mfd/psci-mfd.c
+++ b/drivers/mfd/psci-mfd.c
@@ -14,10 +14,35 @@ static const struct mfd_cell psci_cells[] = {
 	},
 };
 
+static const struct mfd_cell psci_reboot_mode_cell[] = {
+	{
+		.name = "psci-reboot-mode",
+		.named_fwnode = "reboot-mode",
+	},
+};
+
 static int psci_mfd_probe(struct platform_device *pdev)
 {
-	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
+	int ret;
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
 				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+	if (ret)
+		goto out;
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				   psci_reboot_mode_cell,
+				   ARRAY_SIZE(psci_reboot_mode_cell),
+				   NULL, 0, NULL);
+	if (ret) {
+		if (ret == -ENOMEM)
+			goto out;
+		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
+		ret = 0;
+	}
+
+out:
+	return ret;
 }
 
 static const struct of_device_id psci_mfd_of_match[] = {
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 143f3260f04a..1810482d52e6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -362,7 +362,7 @@ config NVMEM_REBOOT_MODE
 
 config PSCI_REBOOT_MODE
 	bool "PSCI reboot mode driver"
-	depends on ARM_PSCI_FW || COMPILE_TEST
+	depends on (ARM_PSCI_FW && MFD_PSCI) || COMPILE_TEST
 	select REBOOT_MODE
 	help
 	  Say y here will enable PSCI reboot mode driver. This gets

-- 
2.34.1

