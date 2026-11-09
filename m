Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259632;
	b=L8lUkzmDcNT2p+v7Ne+Cq/JGzCFG/4B7PhjPWulTNPJjEaNHCLIvCrNYVhc/eS3OfELd
	 FRx0dub+DWlN+GyQ/iOOuf26Mf9y14Ntd+s3C4bXUhRaewqTaPZEr/CjYsVOPVWjnAxGP
	 eu/7xRGqeL19qj9PCU+Uk46+P/rY2urdfBynywpBytaV0fhsnUErxS6p+nQf7F9lJpLXu
	 LTfCRwEX1FIudI/Efw9IiC5+XD7Cv13gVzNIFhbhvruYefGdGIi22z2eB8JYnFyTlY7us
	 sLW84iavMlUim+A9/Oj5F02Ac/5YOO/5RuDN2tODjSzRpW84eXJVrjTxfh3xV2uZSpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259632;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uebOLqWF5TVEFeXPGIaSWjA11KFO+oncQG7MZ5o0VBE=;
	b=pHYZujDx8mWC4igTFHjhN0zeQygalgrB5DNEdTVNrL8NQGpg2qAs4IKDM65EYIXbCL3r
	 +1QSKUZbWTXpxSHWAeHX4G2o2sSbIXg4gvdE7f5DX19kJ5ULamXN1rMf1ENaWcWOfqNGF
	 +lchknMQk804IfgbSFxw83VTLj9j1nShrPoP6xCNAsbkotPmbj8rwSLDkN5Ik0aSsRy3i
	 pPvOGGUL/V+8BWarjblbeUjydTqXFmuagOXrDF7/rzSyl/66Abpm6zg1tHLKSH+u7LvUe
	 2tP4EEPipYqXhLvA+OZqAVT7wEFUqzOH9fy3vOtMCUb1BgxGXzVXPGXZJVzKgxwtnCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fvGnsaZS;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KvCpz2cq;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E34606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 21:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E34606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fvGnsaZS;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KvCpz2cq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794259630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uebOLqWF5TVEFeXPGIaSWjA11KFO+oncQG7MZ5o0VBE=;
	b=fvGnsaZSdW5Oy5C+7qP37m0VHg1iYB5Dm51YU24h6fLpXgau/HT+aZqIR3D9zui+MiweJf
	J4zhgaOMn6ViJRq11Ep25w0uLiXE5r+YVpOGpdjSyZnN9+NLfzN+xs3KAAKXdjNMunf4dc
	9dlUoIhKQmAyaOPra/IIK6Z5M8PbaF0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-RIo2o791OV-pCySX2HoYdg-1; Mon, 09 Nov 2026 16:27:09 -0500
X-MC-Unique: RIo2o791OV-pCySX2HoYdg-1
X-Mimecast-MFC-AGG-ID: RIo2o791OV-pCySX2HoYdg_1794259629
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0d36c1db7so19838977b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794259629; x=1794864429; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uebOLqWF5TVEFeXPGIaSWjA11KFO+oncQG7MZ5o0VBE=;
        b=KvCpz2cqXhPkmrJ5exPlssi3MZJJQ/g01Uma9lU5gZKrOwH1Knfx/IZvlf1t9EgdaQ
         BcaHPx4shXBSKhU3dcnPd4su+FsqPh7SK+SWvUm6A4rXxhdxUAbGnfJbAPLPOyw9vw/X
         j2BbrZtSVXjf6C09efrjHl9JjMq8XGstmiA7a3LDoW86qv3awt76z/RmCoF/cmN4TbdL
         JUg6G/ss4SxZ+aHPIwLkPW12/r5PoupdvG3DyN1sIVUC7tcG9CTkZu73vhEy4AlmQ4PH
         3SPbOO1uV5qS3+BUJ8hSbQAn5KWkYLBzTxQX6PWWZiw/dvgPvdU1JuWQNJspXnMrJN1C
         jXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794259629; x=1794864429;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uebOLqWF5TVEFeXPGIaSWjA11KFO+oncQG7MZ5o0VBE=;
        b=0tzyLeBUEozG0zE9Xf8VBcdfIpg/xwAUql5tU1yHcyjlr26/W7wROn8+YL+BlsUv70
         IylPfQjebcBKWBOvXlGB7OB2TmLLFtFJ5GEvk5mWfL5Ud2YaQEiE2uOSob3kCGkXRxAz
         AWsQwtKXTxwvz3DCphlKpUR1Ztc0aH4i7EgcHa//Xi7hFzFh9DrqAP3G0rJpEweag+Pg
         xdWgXKX6nI6H1hqlx0ItIrYHafuwb/TNatKUwWy7Cq1MSbimUJmMxT8OLB6rgAj3kcm7
         lIwwK4GnKZ35+M86jaBYys2zUY5phar5FgKL3z7tYs6pXV2RTx6Ahvg+7YSMtQnavHYW
         zSLQ==
X-Gm-Message-State: APuU4Z/TkxTDzUXsme+ywvQfb81gmnmdsnzaV/1CUq/G2htVwgNh8jAV
	1wMdp+ufXhENt/FvS11XMJEvuVJI/O/uqwlYmxPXaR6E0j9Jx/2BOKZ0g8oVavFTX8Z//ItAB3I
	vo/Q9H1HaZmf7ol1zKPxUKBcEHYGDaFICMp4K0q40FwhvUlslxfaeSIfGjV6i52KYJzU=
X-Gm-Gg: AYBFou2uoOsgELm5ZbJKHr1jQd/1Lk9OGbjnmvVQtHY4VNK87t3AY1B3UKu7nhCU6KN
	ZL2UiB5w/PnkRJiVRfaqi+TXUVAnXyIh0uFSdwuIuuYjaTWhL4dT+zpfnMizJwRe8L1b/zE3YXP
	dhT2+3A04lF2JOBNBdhWxebycH3lEaFLoFjz16T8LqfwvtpizY7SNWhOf/x5wvWg0ao+iTrZ2dq
	X7sDR6k/QDEp6pHmw5/N5I7RUOwI5nON7OFac+TsmaGL+2O2FEDEpTDC3EdIO/m3hMw1rb7ZwQ8
	3/mkHUnUzLJa9xIuGFSeJLKchos7H0wLXlqrnBaQMMcWYy9D9K6O2C770mogShSGNDYU9YRwyv8
	PkjsGFcfPCxxEsB4a8RI6pnUJzXwz+eoGRBaM9fFdtdamNW0csXKdz+NwlISkC1I5r0YeYP6+2p
	hJ7B45Y2mmIrHYH0Jn5A==
X-Received: by 2002:a05:690c:7013:b0:8b3:2250:aee4 with SMTP id 00721157ae682-8b39298ec79mr5543797b3.13.1794259628671;
        Mon, 09 Nov 2026 13:27:08 -0800 (PST)
X-Received: by 2002:a05:690c:7013:b0:8b3:2250:aee4 with SMTP id 00721157ae682-8b39298ec79mr5543617b3.13.1794259628225;
        Mon, 09 Nov 2026 13:27:08 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([2600:381:e227:64a:814:7bae:8aaa:cea9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393409120sm3925597b3.27.2026.11.09.13.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:27:07 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Nov 2026 16:26:45 -0500
Subject: [PATCH v2] regulator: convert to subsys_platform_driver()
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
Message-Id: <20261109-regulator-subsys-v2-1-370edc01ee9c@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNL3aLU9NKcxJL8It3i0qTiymLdtCRTM3NjE4tkw5RkJaC2gqLUtMw
 KsJHRsRA+UGVWanIJyByl2loAdZd7QHQAAAA=
X-Change-ID: 20261109-regulator-subsys-fb567348c1dc
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=3710; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=teKEL7bax+5z/cEyOQh21vI+pyEiIYSwDoVrgfmwFp4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLI+WS362bI/W98/Wd/x7L0Le66pZHhvfuW7QuTO/oIDS
 xU73G/u7ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAi224w/E+e+nVSQpxqeUzH
 NuMb8Y4/+XcdNGtsiJn76VLKveq6N6oMPxknK5cZLNt8+MnsBfU27fo89bwiuyQr41meVxuziM/
 yZgYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Drop changes to drivers that Peng Fan already submitted.
- Link to v1: https://lore.kernel.org/all/20261106-regulator-subsys-v1-1-1f91f4204bf5@redhat.com/
---
 drivers/regulator/qcom_rpm-regulator.c | 12 +-----------
 drivers/regulator/qcom_smd-regulator.c | 12 +-----------
 drivers/regulator/twl-regulator.c      | 12 +-----------
 drivers/regulator/twl6030-regulator.c  | 12 +-----------
 4 files changed, 4 insertions(+), 44 deletions(-)

diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index 2d5fec1457d1..6a15dcc4fe4f 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -994,17 +994,7 @@ static struct platform_driver rpm_reg_driver = {
 	},
 };
 
-static int __init rpm_reg_init(void)
-{
-	return platform_driver_register(&rpm_reg_driver);
-}
-subsys_initcall(rpm_reg_init);
-
-static void __exit rpm_reg_exit(void)
-{
-	platform_driver_unregister(&rpm_reg_driver);
-}
-module_exit(rpm_reg_exit)
+subsys_platform_driver(rpm_reg_driver);
 
 MODULE_DESCRIPTION("Qualcomm RPM regulator driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 6292a1643fb5..90ecd423a5a3 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -1532,17 +1532,7 @@ static struct platform_driver rpm_reg_driver = {
 	},
 };
 
-static int __init rpm_reg_init(void)
-{
-	return platform_driver_register(&rpm_reg_driver);
-}
-subsys_initcall(rpm_reg_init);
-
-static void __exit rpm_reg_exit(void)
-{
-	platform_driver_unregister(&rpm_reg_driver);
-}
-module_exit(rpm_reg_exit)
+subsys_platform_driver(rpm_reg_driver);
 
 MODULE_DESCRIPTION("Qualcomm RPM regulator driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/regulator/twl-regulator.c b/drivers/regulator/twl-regulator.c
index 5bacfcebf59a..05579f2ee0e2 100644
--- a/drivers/regulator/twl-regulator.c
+++ b/drivers/regulator/twl-regulator.c
@@ -660,17 +660,7 @@ static struct platform_driver twlreg_driver = {
 	},
 };
 
-static int __init twlreg_init(void)
-{
-	return platform_driver_register(&twlreg_driver);
-}
-subsys_initcall(twlreg_init);
-
-static void __exit twlreg_exit(void)
-{
-	platform_driver_unregister(&twlreg_driver);
-}
-module_exit(twlreg_exit)
+subsys_platform_driver(twlreg_driver);
 
 MODULE_DESCRIPTION("TWL4030 regulator driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/regulator/twl6030-regulator.c b/drivers/regulator/twl6030-regulator.c
index 6eed0f6e0adb..5a7c6e2a5e0b 100644
--- a/drivers/regulator/twl6030-regulator.c
+++ b/drivers/regulator/twl6030-regulator.c
@@ -769,17 +769,7 @@ static struct platform_driver twlreg_driver = {
 	},
 };
 
-static int __init twlreg_init(void)
-{
-	return platform_driver_register(&twlreg_driver);
-}
-subsys_initcall(twlreg_init);
-
-static void __exit twlreg_exit(void)
-{
-	platform_driver_unregister(&twlreg_driver);
-}
-module_exit(twlreg_exit)
+subsys_platform_driver(twlreg_driver);
 
 MODULE_DESCRIPTION("TWL6030 regulator driver");
 MODULE_LICENSE("GPL");

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261109-regulator-subsys-fb567348c1dc

Best regards,
--  
Brian Masney <bmasney@redhat.com>

