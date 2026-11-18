Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003645;
	b=Zcc7M4fgsqhc1BawC5wzmHBhV47i9Pbjnn1qOR23GSWZv6+HhYnepry+jSEE/hGdldQR
	 FajuzIG5IcsVIFmYcVOeB2RdhPYqwvUNllOoUYxoCC5XHNYcRQ3LKxIdEqmj6GVcJwcXs
	 Rzmm/FJ1Fi0qcsHjW+fouxUhQIVyZJcv5FhHE3/BqBXNXF1zR1eHfC6Qnd+89QrX7Pulm
	 mv2IiovL2ovC4DcBSoMZ3yR11L3vbux/TBJGcNIy87HZl/BGOppqVi6b2W5yavtRsCEeg
	 fR4Bf+rZRNbGL4w07kS8ZNxbPJX9tmEICiOUkoW9K0VvInMn3Uia9vDv92FQ2FPRD8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y92PsFPQNLfQa7UDE3X0vSYgt7cHL17UdfoYDBKMtBA=;
	b=G/NVTTqTp4/BGsoMhpbhg9xnVmKhjaQazfLc299eaW33YC9itLfuhZIRyr+uY/2JGFT9
	 asd2lwz89wwV7zialSB26o1g5YNoGjCLd2S4Gg2Kym/ClWBPyxoozWlUKFoB9fsQ3hvEr
	 8HvBtj7YnuU+XcceSyMc32P4fax/4jQFbd8Ul78EF0SF6Hi2vxWaXlZepxSNReEadzcOy
	 GxeV3cO3ye+6/YWLnyscmX1o5d58b5OZ9iB/NxQZKTOALdghJvrXDRTYvyf+b6ho5ms7J
	 g1uNqmN7YhQymLIHfvYq4oqQ3nuoI3Z9itdjokyBVoViGex8ufv0IJbkLtEv1F8Wtjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klhq+Kcz;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2DE60A383D
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB2DE60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klhq+Kcz
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492690dd5daso648245f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003643; x=1795608443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y92PsFPQNLfQa7UDE3X0vSYgt7cHL17UdfoYDBKMtBA=;
        b=klhq+KczTFnDBpjpk5F01J6ptZ/ONmvh/GfoOAFuLSAb9ByKgOOooFCNX6k8oIA/sa
         uvNwmcW/MTnBGvRExgOJ/iyb+zNZGlnNqVSflEkpFxB9IIWfspnACIqO3H1hVYAUh+/J
         0JaUPLSu35IS5y65jbiFyx5OVPSyWV+Q2JaE4Ni1K5+AHQVDdO3+1KA9CS329VOqR+BP
         OoIFt6VBZrPfmw6DP0f/YSWIuH+wliA3ei3T6E6plRZJ3Vsk5TUvst4i2ud8rOvgDeXQ
         gHjiN2q8kYEUwrkut3hYzpfObusEEz78rNYLN8fEwTKFbjS8DXCsgurqJpmEWx4nE4v7
         4kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003643; x=1795608443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y92PsFPQNLfQa7UDE3X0vSYgt7cHL17UdfoYDBKMtBA=;
        b=q7Bsjbc3/5YJUKe+edLMjfyFaH0XQr5OUAxjR25NPlbxPNV+cB/eS3xa1iqjpgwKo/
         jU4RJcG2XhuGHkSka/+30UXZGmnxxh9QMbZ7YvVbsNFA6Kac+K7ZcI0mzdnK1hueC6sv
         y0AICWOAJDDBxJ8Dl13ZoMRsI85N6zmy3utgBs8e68APi7nqwOVgzkEeWVG/2Q8uQILM
         0vS8ZCeoi+knSGsSM0C6kPhylLwF9pF0Dr7RhtcUzhyL0gwUwdj/6c3rfZLRYsFJg6Op
         Vfd12anXEbubFcnyGInqyca+pjjnVpwoQ1BUmJvDpucGssTQnEeXAhTqXg2T0AHAdWhY
         369Q==
X-Gm-Message-State: APuU4Z8ZV4i1CeFELZjlhYXZ+9N4/vD/HXrG1wXHeHhT7TcXVRrEC4no
	POxQw6ZpFfAAipSgiFKtE1jDfhPypTJchR0dEmd7dT9YTb8tTkmWUvaqV4VRwioEbs06flrx
X-Gm-Gg: AZFdTZc/st1mvYP8nCKYM7OI7IQsT3Z82UbsAbtK/IS//niCPvxix4Gq26mrhft6gYP
	j278h6Q61PcgHYT2gmDSV+lBqYOvMsTTl972sTgIleL4hy+hMNuqsfG38W5banKIlO7od6DXjH0
	EWE7VhemIaNTHC7DUv24Xd0xXnylztttO4n7O3r93WNK9wD8tXHO0nLbo6paNoRT0dcmM4h2E24
	sOR5ore/rbB9kM7qRW6jkifxNEbkEeIq1gQm3/y7rKF6eCClEt+IYNpSuGPTD97hmJfhPOxylI9
	zAAYEQeJPIxgh5Bdmc+olcqcrrlUX5NlRsBRVJpMMg4DCCr1Ca0u0QwJlX3XbD3bT47M1lFX2JN
	QY7cHDzKt8GPrr3GRDt8FlE0tFe2r3KWbcMocsJS5A8DB4nJK4swpmC0jyzAuaZCeKLvfYv/At5
	i5617OolMR8Trw0SxqljqH/1v16mW52xctc4baGLJmiNv1RLcmnpDAj4I9kRmUKZihUFKh+DcyT
	u1l7aFKs4R4hLRkUR3XSnEJv/tURGmRPo6JhD1Rjy1yA0Ht1KNja1/wmk3fQBmbF/Cq8Dg0HTZz
	RXrOvUle+Zp1WUKkchnKu/N1EYJ1yykNHfIhQj1E0U+pkqRPzXWV/Sd39i/uI5h6N8dK7/IIJ7A
	=
X-Received: by 2002:a05:6000:161f:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-4a6334a7710mr3688999f8f.5.1795003643037;
        Wed, 18 Nov 2026 04:07:23 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:22 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 06/10] Input: touchscreen: add Silicon Works SW42902 support
Date: Wed, 18 Nov 2026 13:07:10 +0100
Message-Id: <20261118120714.31505-7-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic multitouch support for the SW42902 controller. Implement the
power and reset sequence using regulator supplies and use the firmware
already present in controller flash; no firmware update is performed.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 MAINTAINERS                         |   1 +
 drivers/input/touchscreen/Kconfig   |  13 +
 drivers/input/touchscreen/Makefile  |   1 +
 drivers/input/touchscreen/sw42902.c | 355 ++++++++++++++++++++++++++++
 4 files changed, 370 insertions(+)
 create mode 100644 drivers/input/touchscreen/sw42902.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a29019d984393..7a1904f6d0fad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25840,6 +25840,7 @@ M:	Abdur Rofik <rofikcoga@gmail.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+F:	drivers/input/touchscreen/sw42902.c
 
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 9b9ae8ac3f7fd..14c6cd999ec92 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1299,6 +1299,19 @@ config TOUCHSCREEN_SURFACE3_SPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called surface3_spi.
 
+config TOUCHSCREEN_SW42902
+	tristate "Silicon Works SW42902 touchscreen"
+	depends on I2C
+	depends on GPIOLIB
+	help
+	  Say Y here if you have a Silicon Works SW42902 touchscreen
+	  connected to your system (e.g. LG V60).
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called sw42902.
+
 config TOUCHSCREEN_SX8654
 	tristate "Semtech SX8654 touchscreen"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index bfd9de83389d8..1ee2590014535 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_TOUCHSCREEN_STMPE)		+= stmpe-ts.o
 obj-$(CONFIG_TOUCHSCREEN_SUN4I)		+= sun4i-ts.o
 obj-$(CONFIG_TOUCHSCREEN_SUR40)		+= sur40.o
 obj-$(CONFIG_TOUCHSCREEN_SURFACE3_SPI)	+= surface3_spi.o
+obj-$(CONFIG_TOUCHSCREEN_SW42902)	+= sw42902.o
 obj-$(CONFIG_TOUCHSCREEN_TI_AM335X_TSC)	+= ti_am335x_tsc.o
 obj-$(CONFIG_TOUCHSCREEN_TOUCHIT213)	+= touchit213.o
 obj-$(CONFIG_TOUCHSCREEN_TOUCHRIGHT)	+= touchright.o
diff --git a/drivers/input/touchscreen/sw42902.c b/drivers/input/touchscreen/sw42902.c
new file mode 100644
index 0000000000000..a68bd850bf2e2
--- /dev/null
+++ b/drivers/input/touchscreen/sw42902.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Abdur Rofik <rofikcoga@gmail.com>
+ * Silicon Works SW42902 touchscreen, as used by LG V60 (timelm).
+ * Register protocol and report layout derived from the LGE vendor driver
+ * (Copyright (C) 2015 LGE, author hoyeon.jang@lge.com).
+ * This driver uses the controller's existing flash firmware.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+
+#define SW42902_MAX_CONTACTS	10
+#define SW42902_REPORT_SIZE	(12 + 24 + 12 * SW42902_MAX_CONTACTS)
+#define SW42902_IC_STATUS	0x600
+#define SW42902_VERSION		0x642
+#define SW42902_DEVICE_CTL	0xc00
+#define SW42902_INTERRUPT_CTL	0xc01
+#define SW42902_DRIVING_CTL	0xc03
+#define SW42902_SERIAL_SPI_EN	0xfe4
+#define SW42902_DRIVING_STOP	0x04
+#define SW42902_DRIVING_U3	0x8303
+
+static const char * const sw42902_supplies[] = {
+	"vcl",
+	"vdd",
+};
+
+struct sw42902 {
+	struct i2c_client *client;
+	struct input_dev *input;
+	struct touchscreen_properties prop;
+	struct gpio_desc *reset;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(sw42902_supplies)];
+	bool suspended;
+	u8 report[SW42902_REPORT_SIZE];
+};
+
+static int sw42902_read(struct sw42902 *ts, u16 reg, void *data, u16 len)
+{
+	u8 command[] = { (reg >> 8) | (len > 4 ? 0x20 : 0), reg & 0xff };
+	struct i2c_msg msgs[] = {
+		{ .addr = ts->client->addr, .len = sizeof(command),
+		  .buf = command },
+		{ .addr = ts->client->addr, .flags = I2C_M_RD,
+		  .len = len, .buf = data },
+	};
+	int error;
+
+	error = i2c_transfer(ts->client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (error < 0)
+		return error;
+	return error == ARRAY_SIZE(msgs) ? 0 : -EIO;
+}
+
+static int sw42902_write(struct sw42902 *ts, u16 reg, u32 value)
+{
+	u8 command[6] = { 0x40 | (reg >> 8), reg & 0xff };
+	int error;
+
+	put_unaligned_le32(value, command + 2);
+	error = i2c_master_send(ts->client, command, sizeof(command));
+	if (error < 0)
+		return error;
+	return error == sizeof(command) ? 0 : -EIO;
+}
+
+static void sw42902_release_contacts(struct sw42902 *ts)
+{
+	int i;
+
+	for (i = 0; i < SW42902_MAX_CONTACTS; i++) {
+		input_mt_slot(ts->input, i);
+		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
+	}
+	input_mt_sync_frame(ts->input);
+	input_sync(ts->input);
+}
+
+static irqreturn_t sw42902_irq(int irq, void *data)
+{
+	struct sw42902 *ts = data;
+	struct input_dev *input = ts->input;
+	u32 status, header;
+	unsigned int count, i;
+	int error;
+
+	error = sw42902_read(ts, SW42902_IC_STATUS, ts->report,
+			     sizeof(ts->report));
+	if (error) {
+		dev_err_ratelimited(&ts->client->dev, "report read failed: %d\n", error);
+		sw42902_release_contacts(ts);
+		return IRQ_HANDLED;
+	}
+
+	status = get_unaligned_le32(ts->report + 4);
+	header = get_unaligned_le32(ts->report + 8);
+	/* Only normal absolute-touch reports; ignore pen/gesture/debug IRQs. */
+	if (((status >> 16) & 0xf) != 5 || (header & 0xff))
+		return IRQ_HANDLED;
+
+	count = (header >> 8) & 0x1f;
+	if (count > SW42902_MAX_CONTACTS) {
+		dev_warn_ratelimited(&ts->client->dev, "invalid contact count: %u\n", count);
+		sw42902_release_contacts(ts);
+		return IRQ_HANDLED;
+	}
+
+	/* A palm report cancels all active fingers. */
+	if (header & BIT(31)) {
+		sw42902_release_contacts(ts);
+		return IRQ_HANDLED;
+	}
+
+	/* Pre-scan for palm report to avoid queueing partial touch events */
+	for (i = 0; i < count; i++) {
+		const u8 *contact = ts->report + 36 + 12 * i;
+		u32 a = get_unaligned_le32(contact);
+
+		if ((a & 0x1f) == 15) {
+			sw42902_release_contacts(ts);
+			return IRQ_HANDLED;
+		}
+	}
+
+	for (i = 0; i < count; i++) {
+		const u8 *contact = ts->report + 36 + 12 * i;
+		u32 a = get_unaligned_le32(contact);
+		u32 b = get_unaligned_le32(contact + 4);
+		u32 c = get_unaligned_le32(contact + 8);
+		unsigned int id = a & 0x1f;
+		unsigned int event = (a >> 16) & 3;
+
+		if (id >= SW42902_MAX_CONTACTS || (event != 1 && event != 2))
+			continue;
+
+		input_mt_slot(input, id);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
+		touchscreen_report_pos(input, &ts->prop, a >> 18, b & 0x3fff, true);
+		input_report_abs(input, ABS_MT_PRESSURE, (b >> 14) & 0xff);
+		input_report_abs(input, ABS_MT_TOUCH_MAJOR, (c >> 4) & 0x3fff);
+		input_report_abs(input, ABS_MT_TOUCH_MINOR, c >> 18);
+	}
+
+	input_mt_sync_frame(input);
+	input_sync(input);
+	return IRQ_HANDLED;
+}
+
+static void sw42902_power_off(void *data)
+{
+	struct sw42902 *ts = data;
+
+	gpiod_set_value_cansleep(ts->reset, 1);
+	usleep_range(1000, 2000);
+	regulator_bulk_disable(ARRAY_SIZE(ts->supplies), ts->supplies);
+}
+
+static int sw42902_power_on(struct sw42902 *ts)
+{
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(ts->supplies), ts->supplies);
+	if (error)
+		return error;
+
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ts->reset, 0);
+	/* Docomo downstream DT specifies a 90 ms hardware reset delay. */
+	msleep(90);
+
+	return 0;
+}
+
+static int sw42902_start(struct sw42902 *ts)
+{
+	u8 version[4];
+	int error;
+
+	error = sw42902_read(ts, SW42902_VERSION, version, sizeof(version));
+	if (error)
+		return error;
+	if (version[2] != 10 || (version[3] & 0xf) != 4) {
+		dev_err(&ts->client->dev, "unexpected chip/protocol: %u/%u\n",
+			version[2], version[3] & 0xf);
+		return -ENODEV;
+	}
+
+	error = sw42902_write(ts, SW42902_SERIAL_SPI_EN, 0);
+	if (error)
+		return error;
+	error = sw42902_write(ts, SW42902_DEVICE_CTL, 1);
+	if (error)
+		return error;
+	error = sw42902_write(ts, SW42902_INTERRUPT_CTL, 1);
+	if (error)
+		return error;
+	error = sw42902_write(ts, SW42902_DRIVING_CTL, SW42902_DRIVING_STOP);
+	if (error)
+		return error;
+	msleep(30);
+	error = sw42902_write(ts, SW42902_DRIVING_CTL, SW42902_DRIVING_U3);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static int sw42902_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct sw42902 *ts;
+	struct input_dev *input;
+	int error, i;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -EOPNOTSUPP;
+	if (client->irq <= 0)
+		return dev_err_probe(dev, -EINVAL, "missing interrupt\n");
+
+	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+	ts->client = client;
+	i2c_set_clientdata(client, ts);
+
+	ts->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ts->reset))
+		return dev_err_probe(dev, PTR_ERR(ts->reset), "reset GPIO\n");
+
+	for (i = 0; i < ARRAY_SIZE(sw42902_supplies); i++)
+		ts->supplies[i].supply = sw42902_supplies[i];
+
+	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->supplies), ts->supplies);
+	if (error)
+		return dev_err_probe(dev, error, "failed to get regulators\n");
+
+	error = devm_add_action_or_reset(dev, sw42902_power_off, ts);
+	if (error)
+		return error;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return -ENOMEM;
+	ts->input = input;
+	input->name = "Silicon Works SW42902";
+	input->id.bustype = BUS_I2C;
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 1079, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 2459, 0, 0);
+	input_set_abs_params(input, ABS_MT_PRESSURE, 0, 255, 0, 0);
+	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0, 16383, 0, 0);
+	input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0, 16383, 0, 0);
+	touchscreen_parse_properties(input, true, &ts->prop);
+	error = input_mt_init_slots(input, SW42902_MAX_CONTACTS,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error)
+		return error;
+	error = devm_request_threaded_irq(dev, client->irq, NULL, sw42902_irq,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					  dev_name(dev), ts);
+	if (error)
+		return error;
+
+	error = sw42902_power_on(ts);
+	if (error)
+		return error;
+
+	error = sw42902_start(ts);
+	if (error)
+		return dev_err_probe(dev, error, "controller initialization failed\n");
+	error = input_register_device(input);
+	if (error)
+		return error;
+	enable_irq(client->irq);
+	dev_info(dev, "SW42902 initialized using existing flash firmware\n");
+	return 0;
+}
+
+static int sw42902_suspend(struct device *dev)
+{
+	struct sw42902 *ts = i2c_get_clientdata(to_i2c_client(dev));
+
+	if (ts->suspended)
+		return 0;
+
+	disable_irq(ts->client->irq);
+	sw42902_release_contacts(ts);
+	sw42902_write(ts, SW42902_DRIVING_CTL, SW42902_DRIVING_STOP);
+	sw42902_power_off(ts);
+	ts->suspended = true;
+
+	return 0;
+}
+
+static int sw42902_resume(struct device *dev)
+{
+	struct sw42902 *ts = i2c_get_clientdata(to_i2c_client(dev));
+	int error;
+
+	if (!ts->suspended)
+		return 0;
+
+	error = sw42902_power_on(ts);
+	if (error)
+		return error;
+
+	error = sw42902_start(ts);
+	if (error) {
+		sw42902_power_off(ts);
+		return error;
+	}
+	enable_irq(ts->client->irq);
+	ts->suspended = false;
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(sw42902_pm_ops, sw42902_suspend, sw42902_resume);
+
+static const struct of_device_id sw42902_of_match[] = {
+	{ .compatible = "lg,sw42902" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sw42902_of_match);
+
+static const struct i2c_device_id sw42902_ids[] = {
+	{ .name = "sw42902" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, sw42902_ids);
+
+static struct i2c_driver sw42902_driver = {
+	.driver = {
+		.name = "sw42902",
+		.of_match_table = sw42902_of_match,
+		.pm = pm_sleep_ptr(&sw42902_pm_ops),
+	},
+	.probe = sw42902_probe,
+	.id_table = sw42902_ids,
+};
+module_i2c_driver(sw42902_driver);
+
+MODULE_AUTHOR("Abdur Rofik <rofikcoga@gmail.com>");
+MODULE_DESCRIPTION("Silicon Works SW42902 touchscreen driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5

