Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009082;
	b=tCr01xGK/hv7Go+U7ew3bfoQl/5i7ZsM03wpOGESPieIz2u1MXhpH9qHitZCHIUGeTTa
	 T8H+J2L4Ti46LqBqFmWi/v/VglmfqEhSkO9IHbUT9TgPMhPK23UA0z3sTBcygG256t36h
	 OTdYGdAwVyXR+011o1tg9T1D744t+41H1KTQHcmcI3m8waF/JXvNBENcAlkZSiuvjhDGR
	 NZkxXhWhqrTcEeAdtB0NStOhndiGye2lyBwQUT9CPyah/aSdMYOXLIGy+ZRQZ2bUXjId/
	 4BG81rbQQLcukuDp5sI+UOlRZWDsf6lev2Jjwe0dy1xwpV5zyDzpQIvFZmfKZcSc33g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+pJUAQhkPRmzRygX+MTs82PgeId4074s5NzyBrzdQeg=;
	b=g0LWzSzGHt+ZgpfvaBCJwavljJDofx7BOAjyPXhuHiYDAMrW7baRdAJHKWK4gEj1AgPe
	 AQZ6tGdb8xKiX1DQZMoS7kDwPWN0pC85jB5jtme4Xm9Q0TNuKjQFu+t8HNAdoyaa/z3oI
	 a+cUEGKWYhDG0E6TfKKaoZZO0HX/mhwBiuV/Rz+lbYZsB3pBGDvQKFw6lIiIm0UHNhLSH
	 3/ANCrUBfErvvYfHCO6nb4fuiHOKs2PVfIeHmiuGEAPGfD27O1xYZuSRqOpunBaoOPUEl
	 TdZP8FZD4gjg3Y5VR0R6FvRq/zVy0Aq0zXyNJIL3lCJZ0y+kssTLyEtrxtKosGahU+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ove0LSi1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OWlEXgvw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF269606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF269606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ove0LSi1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OWlEXgvw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQBra3912231
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+pJUAQhkPRmzRygX+MTs82PgeId4074s5NzyBrzdQeg=; b=ove0LSi1/fHH5Uxb
	mmuxrKcc832X0fScAPleZYGJHzwsQbbno98vaimk4L9Bj4YBc3TI82R2m+NWeJO7
	o14HzG6U8AEA7qfGAfxuuvxNXhSxNMV7MyAfN+Nyk5DgL/bvOc3lIene26REsaDY
	P8JQlkdtDeP9/kXfPRYtTOfDmd2t2NbA8NEvdcYofu42Pyk7v9nztHi6I7BBis/g
	ClZrIJye489ma40ZHp5EewJn2MWaH9TiQas3Dh+sGP9suIqwzcr33FFKmWr3jDFt
	u8EvEZpBJc7/kMb5PLHSQgpe9yyI/9SBjDTWqldp0lKpYEpC8Ty3fjxpsKH3zoRS
	hf8iXw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9b6c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:38:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99e171e35d7so143693241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 05:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795009080; x=1795613880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+pJUAQhkPRmzRygX+MTs82PgeId4074s5NzyBrzdQeg=;
        b=OWlEXgvwMxEPRNs+dcndM0YcKmFuMjL2KOk5RtbTas8WhEKp3nehjgRAsb50QOj9qe
         85YnG2RHL2slF+Lm31xlexg+SBltAV6JtPcESlJiIu3r64TzS5fIB4Q0nGi5aXLFXfjN
         bQP5h2VsyA9+qI7V4MwAQj5ZNrPoQ7KBG9/T1xsl8P0GMAYXN90/K33HkH30+skCVs20
         q0LLsSzIonYPG1oW1WMOc3r4i+oe5P1zR2vrlWKwFBDB+sxcENjA5yPlriFwY54Ic1Kr
         90r8oYZNPrSwMj7ZBxwjGEWZRH1kEkUudP57mKnqfWOWCrYRhVyK91xROHTUOVZQBQEo
         wZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009080; x=1795613880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+pJUAQhkPRmzRygX+MTs82PgeId4074s5NzyBrzdQeg=;
        b=t8NJoe0OIkCRPy6Xsmhz0ZPRgZfIouZldhTGjeeJ0LrAPN0rfb6e4IVVHrSTSsEv2T
         wfossDTliR4jfHa6zpu5g69SXTPeWusjNQRu+kPP93Q80aOQgjca6nDKIf4RTS/m3KOM
         /Hr+C10aSF9GZEwu/57BOfqN75PGiiMzfYDNpHQw2Kcs8iuqYwZXbXn3vcTyKqug2Hvs
         L2uaLWqVMC0wbpxeeJiVJbPwNWDUYqKmDPCsFPSZghvq7mA7+Vv1osOdinxkvXfolt5v
         WirjXArzQTyUGTgjA5jo4a+88YpA1K0CjGCD5NkPWWtdA/vPH7YIp2dmhxDp4vKIdiDM
         vkcg==
X-Forwarded-Encrypted: i=1; AL+hErGBYWy58kvc+w/PzFwGDo8aUI52+Nrfnhgz3yahP802YFdH7L3+qozTbMyTdtakLzeVevfq8bSiqovLk12A@vger.kernel.org
X-Gm-Message-State: APuU4Z+1RDKgN11Gk3ws90Srjux7B735rd7typD0dgSBdye4lGv0Wgkk
	1Rsh24Ig0SspQlr5PqNBwIBqu3K3hV72iA+M3ey18WycHCffNfLgIe8PWDadFUdxDeI6W/16iWQ
	0RSM+jkvKAhWPhi7AkrLxyfphU+ImF37pp0xVCkaSj+FsQ/ARMq1xMv4q7pu+rbbZ3J28
X-Gm-Gg: AYBFou3M9Gtw5PpFy0FzEeWwM6t/SCnxVATSMS+L+XVFT/OgrOpDzWW7Nv5ydOa4pBw
	iUEHsnXUFu4C1LIF9/Pa9FKVnLbMLw5B1SiWJeR+JJp0fylDtf3X1SK2qulmwgA+XkYAzUW5j//
	zX1YV9yV4T8UsvZ2G6fgwbl1URtrHjxI8dewfGKzkX+XeACE2S8YzA0nn2jpJUiadnhes59Dotv
	z9lQqQ1eSvIFZCwVU5X/+NOEsQk/A2yhilJi5YaugJq59LX6ta3cq84Y9cGyKIHOopXrP0eZlXl
	UwvBnWuwAWzV4bvQMy2v6b7N3NFzsYBTgAGS+Ag+ne8h8tRKe7Jw2wr45jOoSFGyL/R92KdhDeY
	eEiTb1waxVrYsnXfbmfH4rbQmPMZA45VBvDJwugToXylMNxkOdGh2xQguM8NKtld8t7ucydKfqv
	NXywc=
X-Received: by 2002:a05:6102:50a3:b0:7c1:75c5:c4c with SMTP id ada2fe7eead31-7d6ba44f266mr709696137.25.1795009079892;
        Wed, 18 Nov 2026 05:37:59 -0800 (PST)
X-Received: by 2002:a05:6102:50a3:b0:7c1:75c5:c4c with SMTP id ada2fe7eead31-7d6ba44f266mr709678137.25.1795009079283;
        Wed, 18 Nov 2026 05:37:59 -0800 (PST)
Received: from hyd-e160-a52-3.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1b61eesm1809090241.3.2026.11.18.05.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:37:58 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:07:30 +0530
Subject: [PATCH v2 1/2] pinctrl: qcom: lpass-lpi: Move dev_pm_ops to the
 common driver
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
Message-Id: <20261118-lpass-lpi-system-sleep-v2-1-a6ec7f2ba424@oss.qualcomm.com>
References: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
In-Reply-To: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795009070; l=13998;
 i=gopi.kanala@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=jE15Q0P0dBodKbNo7JkIOCzUcqfeanI/3hLSz1WHMPk=;
 b=EoQ7V9LlTqrIBD439HNyXfUOcVRWs5AbQYAuMiJGL0jDnXQ1xUT1fhEefI/4qlPwrXgoYPI2t
 xl9HmBJ7TmDDaj/6M+1lZ5NZEJX1LQWahWL7oPimZp5xLVRUPnZFRPU
X-Developer-Key: i=gopi.kanala@oss.qualcomm.com; a=ed25519;
 pk=4bCmbkbT6dfZt13k29qAL6yx8zUQ6p+yOdkRBH8lzXQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX+u+5p+C83Cm2
 QZBz9mI0BrfLcUrP/mnjUvzYbil2kB5LQaOYAm+SYn7NEwcLcwHA2iCqPtkSxPK0yjrax/4YFpT
 dJdoPlht14QRakl28IYvVsp17Q1eI68=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afdaa38 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=69SmcKYM6GwwC-r1KZAA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfX0sqKY0pLSdaz
 y353XhHj0ShkOKk6vc/uP1qxOkak1PhSyPUXPA7P0+1bqsqmars9nRSWefsTmVWqzW2V5ope6IN
 zs4vrpNiMx12nq7auhqKLJl0JHZ1FnMS8PwIvs3s7wcaXtd+F4F8gO0exWjng2WEAhdl4Q9izjb
 JtJcF0XDGHh+9RztFAEgqiQkg2nmg4bv5/HwYHY4WNbwybDuQnRoHwNY3cj3612YWZAoKc9JZ70
 SdFH5rCGVs5CN2Gzm+Q3+0fBeWGYjKZQehYH7CZYohzyBK4mV4G9mW98/oL1IIwo2EBoW+Y9e57
 4DdN9Im2c0e5AT3W7xSuiI+MwHQgMATn6TYZxSGbj9nbVmPYCK9mWmXeYLDBLjXj2UmAkhq6WDp
 x1Fzd8S0Kj+BnXBOviTwQmTFd71TAUcBqPt1GSP0ssnTwNs+/uGp0tCDRNKvH13FQyZsVsiPiPE
 PRQAtdp0c6zG0c16G4A==
X-Proofpoint-ORIG-GUID: Qd6i8wyjezxnDqkilaQRQFjRYKRloJKJ
X-Proofpoint-GUID: Qd6i8wyjezxnDqkilaQRQFjRYKRloJKJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180054

All the SoC-specific LPASS LPI drivers probe through the common
lpi_pinctrl_probe(), which sets up pm_clk and runtime PM, and each of
them defines the same dev_pm_ops with only the pm_clk runtime callbacks.

Define the dev_pm_ops once in the common driver, next to the code that
sets up pm_clk and runtime PM, and export it for the SoC-specific
drivers, so the PM callbacks only need to be changed in one place. Drop
the pm_clock.h and pm_runtime.h includes from the SoC-specific drivers,
as nothing there uses them anymore.

No functional change.

Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c     | 6 ------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c          | 4 ++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h          | 3 +++
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 6 ------
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 6 ------
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 6 ------
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 6 ------
 15 files changed, 7 insertions(+), 78 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
index 7036bf4c6692..de7f28129012 100644
--- a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
@@ -6,8 +6,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -225,10 +223,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-hawi-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 02f678fa75b1..1f1635ec53d7 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -611,5 +611,9 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(lpi_pinctrl_remove);
 
+EXPORT_GPL_DEV_PM_OPS(lpi_pinctrl_pm_ops) = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 MODULE_DESCRIPTION("QTI LPI GPIO pin control driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index 056c4a774389..fc6aa5f552e6 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -11,6 +11,7 @@
 
 #include "../core.h"
 
+struct dev_pm_ops;
 struct platform_device;
 
 struct pinctrl_pin_desc;
@@ -145,4 +146,6 @@ struct lpi_pinctrl_variant_data {
 int lpi_pinctrl_probe(struct platform_device *pdev);
 void lpi_pinctrl_remove(struct platform_device *pdev);
 
+extern const struct dev_pm_ops lpi_pinctrl_pm_ops;
+
 #endif /*__PINCTRL_LPASS_LPI_H__*/
diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
index cb4934cd6f75..2a9f8d1c6cf3 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -7,8 +7,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -245,10 +243,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-milos-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index a61df10d46cb..fd448b6dbb6d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -7,8 +7,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -141,10 +139,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sc7280-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
index 27c47710365e..cd350a1cde2f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
@@ -6,8 +6,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -175,10 +173,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sc8280xp-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
index 7b5aacaae7d7..9742bb5bb39a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
@@ -10,8 +10,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-lpass-lpi.h"
@@ -147,10 +145,6 @@ static const struct of_device_id sdm660_lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdm660_lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver sdm660_lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sdm660-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
index 0a31f7ad2e0d..20277990c2cc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
@@ -7,8 +7,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-lpass-lpi.h"
@@ -153,10 +151,6 @@ static const struct of_device_id sdm670_lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdm670_lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver sdm670_lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sdm670-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
index 75bafa62426a..3d71aa65e22a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
@@ -7,8 +7,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -223,10 +221,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm4250-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
index 05435ea6e17a..d092bd838c3d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
@@ -7,8 +7,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -143,10 +141,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm6115-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
index 946b23084304..1d009aac892e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
@@ -6,8 +6,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -137,10 +135,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		   .name = "qcom-sm6350-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index 454de788be21..26fb78e493ca 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -7,8 +7,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -136,10 +134,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm8250-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index 834eee8dcce9..76bff5854f03 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -6,8 +6,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -204,10 +202,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm8450-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
index 875e04e5d2b9..7a36370238a4 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
@@ -6,8 +6,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -212,10 +210,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm8550-lpass-lpi-pinctrl",
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index bc7889c993d0..c98d6748560d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -6,8 +6,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -219,10 +217,6 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
-static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
-	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm8650-lpass-lpi-pinctrl",

-- 
2.43.0

