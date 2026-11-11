Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398017;
	b=mUQ4bbRD888bTek2/7uRI8XN2JLk6PyDWM5Olr4bRWXyl5Xj7t6Ty/fzLrwKMn/RJjK/
	 yI8a0aJIIcb7/D9qUjGoqPcoo7ECEYV2zD+ILTLrzlSbuzmfs7r+KnW/7hkEIOJqG553D
	 Txi3Yu5K6GEqdNQOUQpqJ6R2pW7lv8X/i2antmaRiqG7A+4NLs4wO5/3iwmBN24WvKTjq
	 Xv8+dYBIDffS7Vgni1rI3WsrZcOjIVRIXJM0HBuZsIRX7qDXw75vjkMeHr9e2UUfy/IKM
	 LRT5hELKnBguBojGKPzlLoM++HElCxbJjb9YMcnqIe6OnI6FqdfcQfDeFMG0WBiE6+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=fycGytev8DUZq55l3Le/OWa258btyHNUHhMF9gTnXX8=;
	b=q6rkB5V2ngMTlLkKgJhKT0BdiCmnBOPQvVcpzfjuFlzzhglK0B0zJnDh2H4EUYHKO4bV
	 hQHCDyY8wTarqptTpxEOG25pgVBrniCr8gjntqemvtsALUnQE7Ygtno4LzihZvOrrRCjl
	 HRW8PYFsYdESRuJjx2HM0LkHBkVtV8fclGDf9u5TsmNUYZNIkWDsRDUBWWY1ZOqKQBpiF
	 E7ZeKQS3XdCY7Sv229RuuevM5YChnRWebLrwRsLnUZz/WA0ksfuURqRxq0cjaXeXqnf7v
	 D9vGAeaFMx54Us4Xhs0C4o43Pu6KztJJOsHsJcqGa7vJTXDSFUFNXWEa5nF5W0SjTxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G+ty+RUM;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DB5606A33E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 11:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44DB5606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G+ty+RUM
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so32257365e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398016; x=1795002816; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fycGytev8DUZq55l3Le/OWa258btyHNUHhMF9gTnXX8=;
        b=G+ty+RUM/3X7I1rJPs6JCUuXbJkfRj1DFQC7QVQgMH7M1a/nNP2+JU40e6jtvlaIG7
         gdMBPZ8dJ35sjkzdeak7VavAbbCHh5rzT4sRVLK70J+aU8KAZJ1bRr28kFxD1/OYJSDs
         GTXyO2O2dSajjZup7hjovSlySxptfTMSfklPKHN8wKDrPvoCXw7vgeNLS+VH+w4HBmHa
         7Ha+P+f0uPLQu9DH+PIkZtz5mHEIfeaEFh6k5UEYzMPwfcLgEF1sAYvxD4zuROP4b5Qg
         uiUUy6oV/B/kGcs6OYf4QYC00dCrieI5C/kzjrwFwDLANrIIgf95MOqk5FBAmHHlWNH6
         jSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398016; x=1795002816;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fycGytev8DUZq55l3Le/OWa258btyHNUHhMF9gTnXX8=;
        b=XDc+0GLvFRnCsxWc1QPYZit/0dcrVMRwOvCVHkclzVep9h5CI4qMax5e1ibhKgLX9r
         /kQbdhn3KWtTLK7IhNCjwF1CDcw6i5g9B55u8saqjsN/CSJXLC0fPQRijzygOl2rESLV
         T++UtdO1i4sQAHUa4lxTfh6J1nTABf+ydUWA8wI6+0+nGVzhxmHIMzBOq7eQgoXpzcOi
         oW08g+P3w2LhPSe/TmoOy92+z22+UUDZfGXatCtZrkXr2i3Xj8Pqp/7dmT3w1vFHdYwU
         oP4vH4y+x9Il9KrZ142TttxTt641suzSEVKhsAIHP13bc6D8qQXbzpS5s7/S8DeedaGI
         9aSA==
X-Forwarded-Encrypted: i=1; AL+hErGcoK+0ijPuTDzYkJsMv78bvbE4IVVgYn+kdcpFoKhVjwmni9O3fzUZQTmDeenvn1wwA59G5NeaVW2xmGP2@vger.kernel.org
X-Gm-Message-State: APuU4Z+X9KL19jYvyNnfFJeXXQTKprPvvFx+kLhG9/ebk6ibvpD6dZ+m
	vwZo0g0dG+JI6J0LZi2F2jpL1NU1oZyIn/6vzd28RTlYl8GIp4zSreVlAtdgY7bfYuK/Ry/YWg=
	=
X-Received: from wrvq9.prod.google.com ([2002:a5d:61c9:0:b0:493:1d71:a33b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b34:b0:4ba:e7:ef3d
 with SMTP id 5b1f17b1804b1-4ba09321cbemr38474725e9.1.1794398015487; Wed, 11
 Nov 2026 03:53:35 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:11 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=7732; i=ardb@kernel.org;
 h=from:subject; bh=vEifE26AS3zu1sQi6+/6WGu/UJ+KC2fGJ9uVGFo84ZI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuKbCb+Urpn0qaffu+mosOnJklqrE90sHzud855rQd
 7WYuzmno5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEyEu4mRYVV5XEhBl1JpvUX9
 jfC7k31OLly60+uwvz4fw619f2N/7GL4ZxXcFiI6V9Xkb5QQX8DNLUrX1c0TA5q+L+2887f91Le T/AA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-16-ardb+git@google.com>
Subject: [PATCH 7/7] platform: arm64: lenovo-yoga-c630: Expose the keyboard
 backlight as an LED
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The EC turns the keyboard backlight on and off as Fn+Space is pressed,
cycling through two brightness levels, which the EC registers do not
seem to reflect. However, bit 0 of EC register 0x03 reflects whether
the backlight is on, and setting or clearing it, using the EC's register
write command (0xb1, as used by the DSDT's ECNW method), turns the
backlight on at the selected brightness level, or off.

Expose this as a platform::kbd_backlight LED with a maximum brightness
of 1, so that userspace can turn off the keyboard backlight, e.g., when
the system is idle. Whenever the EC raises an event, check whether the
backlight was turned on or off, and report any such change through
brightness_hw_changed, in case the EC raises an event when Fn+Space is
pressed.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/platform/arm64/Kconfig            |   4 +-
 drivers/platform/arm64/lenovo-yoga-c630.c | 121 +++++++++++++++++++-
 2 files changed, 120 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 2a84775a13a9..44d5a749f764 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -75,10 +75,12 @@ config EC_LENOVO_YOGA_C630
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on I2C
 	select AUXILIARY_BUS
+	select LEDS_CLASS
+	select NEW_LEDS
 	help
 	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
 	  Lenovo Yoga C630, which provides battery and power adapter
-	  information.
+	  information, and access to the keyboard backlight.
 
 	  This driver provides battery and AC status support for the mentioned
 	  laptop where this information is not properly exposed via the
diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 2776063bfb58..7f49067ec6b7 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -6,12 +6,14 @@
  *    Dmitry Baryshkov
  */
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/leds.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -27,14 +29,20 @@
 #define LENOVO_EC_UCSI_READ		0x21
 
 #define LENOVO_EC_READ_REG		0xb0
+#define LENOVO_EC_WRITE_REG		0xb1
 #define LENOVO_EC_REQUEST_NEXT_EVENT	0x84
 
 #define LENOVO_EC_UCSI_VERSION		0x20
 
+#define LENOVO_EC_KBD_BACKLIGHT_REG	0x03
+#define LENOVO_EC_KBD_BACKLIGHT_ON	BIT(0)
+
 struct yoga_c630_ec {
 	struct i2c_client *client;
 	struct mutex lock;
 	struct blocking_notifier_head notifier_list;
+	struct led_classdev kbd_backlight;
+	enum led_brightness kbd_backlight_brightness;
 };
 
 static int yoga_c630_ec_request(struct yoga_c630_ec *ec, u8 *req, size_t req_len,
@@ -53,21 +61,27 @@ static int yoga_c630_ec_request(struct yoga_c630_ec *ec, u8 *req, size_t req_len
 					     resp_len, resp);
 }
 
-int yoga_c630_ec_read8(struct yoga_c630_ec *ec, u8 addr)
+static int __yoga_c630_ec_read8(struct yoga_c630_ec *ec, u8 addr)
 {
-	u8 req[2] = { LENOVO_EC_READ_REG, };
+	u8 req[2] = { LENOVO_EC_READ_REG, addr };
 	int ret;
 	u8 val;
 
-	guard(mutex)(&ec->lock);
+	lockdep_assert_held(&ec->lock);
 
-	req[1] = addr;
 	ret = yoga_c630_ec_request(ec, req, sizeof(req), &val, 1);
 	if (ret < 0)
 		return ret;
 
 	return val;
 }
+
+int yoga_c630_ec_read8(struct yoga_c630_ec *ec, u8 addr)
+{
+	guard(mutex)(&ec->lock);
+
+	return __yoga_c630_ec_read8(ec, addr);
+}
 EXPORT_SYMBOL_GPL(yoga_c630_ec_read8);
 
 int yoga_c630_ec_read16(struct yoga_c630_ec *ec, u8 addr)
@@ -97,6 +111,31 @@ int yoga_c630_ec_read16(struct yoga_c630_ec *ec, u8 addr)
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_read16);
 
+/*
+ * Update the bits in @mask of EC register @addr to those in @val. Return the
+ * previous value of the register, or a negative error code.
+ */
+static int yoga_c630_ec_update_bits(struct yoga_c630_ec *ec, u8 addr, u8 mask,
+				    u8 val)
+{
+	u8 req[3] = { LENOVO_EC_WRITE_REG, addr, };
+	int old, ret;
+
+	guard(mutex)(&ec->lock);
+
+	old = __yoga_c630_ec_read8(ec, addr);
+	if (old < 0 || (old & mask) == (val & mask))
+		return old;
+
+	req[2] = (old & ~mask) | (val & mask);
+	ret = i2c_smbus_write_i2c_block_data(ec->client, LENOVO_EC_REQUEST_REG,
+					     sizeof(req), req);
+	if (ret < 0)
+		return ret;
+
+	return old;
+}
+
 u16 yoga_c630_ec_ucsi_get_version(struct yoga_c630_ec *ec)
 {
 	u8 req[3] = { 0xb3, 0xf2, };
@@ -148,6 +187,73 @@ int yoga_c630_ec_ucsi_read(struct yoga_c630_ec *ec,
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_read);
 
+static enum led_brightness
+yoga_c630_ec_kbd_backlight_get(struct led_classdev *led_cdev)
+{
+	struct yoga_c630_ec *ec = container_of(led_cdev, struct yoga_c630_ec,
+					       kbd_backlight);
+	int val;
+
+	val = yoga_c630_ec_read8(ec, LENOVO_EC_KBD_BACKLIGHT_REG);
+	if (val < 0)
+		return val;
+
+	return val & LENOVO_EC_KBD_BACKLIGHT_ON ? LED_ON : LED_OFF;
+}
+
+static int yoga_c630_ec_kbd_backlight_set(struct led_classdev *led_cdev,
+					  enum led_brightness brightness)
+{
+	struct yoga_c630_ec *ec = container_of(led_cdev, struct yoga_c630_ec,
+					       kbd_backlight);
+	int old;
+
+	old = yoga_c630_ec_update_bits(ec, LENOVO_EC_KBD_BACKLIGHT_REG,
+				       LENOVO_EC_KBD_BACKLIGHT_ON,
+				       brightness ? LENOVO_EC_KBD_BACKLIGHT_ON : 0);
+	if (old < 0)
+		return old;
+
+	WRITE_ONCE(ec->kbd_backlight_brightness, brightness ? LED_ON : LED_OFF);
+
+	return 0;
+}
+
+/* Report changes made by the EC itself, i.e., when Fn+Space is pressed */
+static void yoga_c630_ec_kbd_backlight_update(struct yoga_c630_ec *ec)
+{
+	int brightness;
+
+	brightness = yoga_c630_ec_kbd_backlight_get(&ec->kbd_backlight);
+	if (brightness < 0 ||
+	    brightness == READ_ONCE(ec->kbd_backlight_brightness))
+		return;
+
+	WRITE_ONCE(ec->kbd_backlight_brightness, brightness);
+	led_classdev_notify_brightness_hw_changed(&ec->kbd_backlight,
+						  brightness);
+}
+
+static int yoga_c630_ec_kbd_backlight_init(struct yoga_c630_ec *ec)
+{
+	struct led_classdev *led_cdev = &ec->kbd_backlight;
+	int brightness;
+
+	brightness = yoga_c630_ec_kbd_backlight_get(led_cdev);
+	if (brightness < 0)
+		return brightness;
+
+	ec->kbd_backlight_brightness = brightness;
+
+	led_cdev->name = "platform::kbd_backlight";
+	led_cdev->flags = LED_BRIGHT_HW_CHANGED;
+	led_cdev->max_brightness = LED_ON;
+	led_cdev->brightness_get = yoga_c630_ec_kbd_backlight_get;
+	led_cdev->brightness_set_blocking = yoga_c630_ec_kbd_backlight_set;
+
+	return devm_led_classdev_register(&ec->client->dev, led_cdev);
+}
+
 static irqreturn_t yoga_c630_ec_thread_intr(int irq, void *data)
 {
 	u8 req[] = { LENOVO_EC_REQUEST_NEXT_EVENT };
@@ -163,6 +269,8 @@ static irqreturn_t yoga_c630_ec_thread_intr(int irq, void *data)
 
 	blocking_notifier_call_chain(&ec->notifier_list, event, ec);
 
+	yoga_c630_ec_kbd_backlight_update(ec);
+
 	return IRQ_HANDLED;
 }
 
@@ -220,6 +328,11 @@ static int yoga_c630_ec_probe(struct i2c_client *client)
 	BLOCKING_INIT_NOTIFIER_HEAD(&ec->notifier_list);
 	i2c_set_clientdata(client, ec);
 
+	ret = yoga_c630_ec_kbd_backlight_init(ec);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register keyboard backlight\n");
+
 	ret = devm_request_threaded_irq(dev, client->irq,
 					NULL, yoga_c630_ec_thread_intr,
 					IRQF_ONESHOT, "yoga_c630_ec", ec);
-- 
2.56.0.611.g1030f0b940-goog

