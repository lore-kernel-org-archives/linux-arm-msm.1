Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D642A52E04A
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 23:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997712; cv=none; b=Lrc8w9gz0+5pN/uqOZLv3xRFDCViThLTp6kxoCa/AnCJydYopShSydr4AwpWDgxB0WDNviNKWlkQ7sk5/V2CceV8i2MjC5/VhOZvOVNOF85tRfQP4VXqIe6ktOsB1BJ0aipvtCKwmuU/jvc80Zhb0XtzbBIYdH9yDLi6rcdupDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997712; c=relaxed/simple;
	bh=fA3I9xtvhB2RFdS0+NqXtoI/Hzh/Ja6h6i48v0kI9+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gb3KUpsFYpGrHxnzjd6y7OBC6k94Qs8YJflCNdyqoQwyYcSsj1bzASAmdSt5hILmZqK53YqSlKqlBRBJ+YIVdrLOYzebyIZ/2Y0Y/xuzx5qHvYzsRF/wpKNAc4Hp+uKLjliTN3hn6bGi8wNmiVX/bqOBpSqjlcBqqyaYzikwz4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrFBY17f; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrFBY17f"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b89986bcecso664971e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 16:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997708; x=1789602508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oljMkHqtrrFXTraD37aMs/be+Y8zIyNb8eBw0a0WIP0=;
        b=GrFBY17fO4WpCgAhDbuX5h7lIK/3/vK719iYcHz7vcQFWio0rxuZB62sbKu57gOVsH
         +1LbfVqJb7ZtTMjzWIvqoNIb2ZRPLAcEwzM8Us6OMACX5Rz/a7XFOJeEvjdE0F358Euj
         UMVcsiqrTDtc+9NwMfoUqSjT44VSqPSUuDoWnDRBTPlFy0hcFia6S5MdnySFCIdF3tWd
         iTRZrbw/5J8phRedP4xmkxinzu/AaXNSPtDwZgXRvlXRlrlPzFu/JUtrAjDh7DBOddbR
         xGa0jDWn+lAC1ugAddHEEvSr+IhUwhuLrTAoimn+EIe8vEdqFZZqL0593DITcdMk7QEU
         8IzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997708; x=1789602508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oljMkHqtrrFXTraD37aMs/be+Y8zIyNb8eBw0a0WIP0=;
        b=pvOFRS7nEj7n6+375RFg8EdcElBX/ckT25urOE7sdQBX3L+oOFKxtgg7ceVwd8gEUb
         /ZjNunYRtFYJHNhArLoJlCYLKpvhUlPNsduQdAC5PqSfShLBiYN95lRwoZjcF1eZS1fI
         9k6ZUpiogyt8lwmFzWiH5qglICqH2ZpAJBlpwYDq/G0jgJ9LUI0UfW/4cVnnwibl5YXJ
         tvnB8wrfu/uHFO6eT+wqTjWQBNN58qNCfamO7pg26T/UyTRoJmiMzvVaKK8s7nRguGTE
         Gru9VJmhoULq8L1d54nZa05DW/kzf6Oyd5Wh+HnKq8xmvpYB0HBDlnevSXS4QkIFVFQR
         XQlw==
X-Forwarded-Encrypted: i=1; AKwUvBwwKiN0S/o/8xnIlwv2ryzB0qQ7mdXeUcdQNKu+A3nJDqPtCeqViSeJWB6/zAqQfLCJSJfwhvZa+HF15m33@vger.kernel.org
X-Gm-Message-State: AFuF++kRR8RXt48CmmzjLW5awH6+64aMbRdhJSIGIPk8AdKKi3eC/pBT
	3JluNGH/EQ1xheAeUSgmwEqEV6ILCoMn3DJusKEVXFQFxcTT44I8PKUp
X-Gm-Gg: AYBFou2LscksBotRXh2gYABslGPFWqVVZdp9nXmT5N1AcKF4fDZ/NniJn1T6Rtci5GV
	hfaJraaT6P+U8c7xt/YRYWYdoiy7ZFr3FI222//AUhn0ZnwO/HfLRaqIZqH0MhEy1q2gEGU7RES
	/6VKcz6Q7TykFgXs6zVJ57uhRcHMkWW8K+vocKLUpdwHhjHdBeT/QnKUej3eDD9gMKKC4MgDyT0
	hzwKXr9/BQA/mr/D5AIc1iYke/d7xMeGJZTQyg3J99UvAHrVwW5PVCGAAqjRkxZbAgH2Z7WSlYI
	OjKEbmON2pOp3rIoU8Ide3REzm6JqEniP0b23PgO52mWblV99U1ni1hIMcdewLbRbwoPALaf05G
	Sii+N0E7XSyybJ0To94Z9YecjfvRo3OfL9gl7C5OWfmMHbu05twrd0APwccdeoRpr5FG8XySu1j
	ns9KAH5yO4F8szARrZn+mywqtAuWmA2H3J9pEAxFtGi/MTjd0VQl8cecdSwj0zouFotovA3mPPd
	li+qBiSwGP3ha4hXlRQPlQhrDoJku/Mz+P1iD3H
X-Received: by 2002:a05:6512:2511:b0:5b5:e0e8:534a with SMTP id 2adb3069b0e04-5b616ee98abmr6539579e87.1.1788997707687;
        Wed, 09 Sep 2026 16:48:27 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4cesm4153300e87.26.2026.09.09.16.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:48:26 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F . Davis" <afd@ti.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v3 2/3] power: supply: bq27xxx: autodetect bq27411 and bq27541
Date: Thu, 10 Sep 2026 02:47:43 +0300
Message-ID: <20260909234744.1177153-3-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
References: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
 <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some replaceable battery packs used by OnePlus 6 and OnePlus 6T
phones contain a bq27411, while others contain a bq27541. These
devices require different register maps.

Add support for the generic ti,bq27xxx compatible. At probe time,
issue the DeviceType control command and select the bq27411 or bq27541
register map from the returned value.

Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
---
 drivers/power/supply/bq27xxx_battery_i2c.c | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/power/supply/bq27xxx_battery_i2c.c b/drivers/power/supply/bq27xxx_battery_i2c.c
index 868e95f..718f8e8 100644
--- a/drivers/power/supply/bq27xxx_battery_i2c.c
+++ b/drivers/power/supply/bq27xxx_battery_i2c.c
@@ -16,6 +16,11 @@
 
 static DEFINE_IDA(battery_id);
 
+#define BQ27XXX_REG_CTRL		0x00
+#define BQ27XXX_DEVICE_TYPE		0x0001
+#define BQ27411_DEVICE_TYPE		0x0421
+#define BQ27541_DEVICE_TYPE		0x0541
+
 static irqreturn_t bq27xxx_battery_irq_handler_thread(int irq, void *data)
 {
 	struct bq27xxx_device_info *di = data;
@@ -153,6 +158,32 @@ static void bq27xxx_battery_i2c_devm_ida_free(void *data)
 	ida_free(&battery_id, num);
 }
 
+static int bq27xxx_battery_i2c_detect_chip(struct bq27xxx_device_info *di)
+{
+	int ret;
+
+	ret = di->bus.write(di, BQ27XXX_REG_CTRL, BQ27XXX_DEVICE_TYPE,
+			    false);
+	if (ret < 0)
+		return ret;
+
+	ret = di->bus.read(di, BQ27XXX_REG_CTRL, false);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
+	case BQ27411_DEVICE_TYPE:
+		di->chip = BQ27411;
+		return 0;
+	case BQ27541_DEVICE_TYPE:
+		di->chip = BQ27541;
+		return 0;
+	default:
+		dev_err(di->dev, "unsupported device type 0x%04x\n", ret);
+		return -ENODEV;
+	}
+}
+
 static int bq27xxx_battery_i2c_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -188,6 +219,12 @@ static int bq27xxx_battery_i2c_probe(struct i2c_client *client)
 	di->bus.read_bulk = bq27xxx_battery_i2c_bulk_read;
 	di->bus.write_bulk = bq27xxx_battery_i2c_bulk_write;
 
+	if (!di->chip) {
+		ret = bq27xxx_battery_i2c_detect_chip(di);
+		if (ret)
+			return ret;
+	}
+
 	ret = bq27xxx_battery_setup(di);
 	if (ret)
 		return ret;
@@ -225,6 +262,7 @@ static void bq27xxx_battery_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id bq27xxx_i2c_id_table[] = {
+	{ "bq27xxx", 0 },
 	{ "bq27200", BQ27000 },
 	{ "bq27210", BQ27010 },
 	{ "bq27500", BQ2750X },
@@ -262,6 +300,7 @@ MODULE_DEVICE_TABLE(i2c, bq27xxx_i2c_id_table);
 
 #ifdef CONFIG_OF
 static const struct of_device_id bq27xxx_battery_i2c_of_match_table[] = {
+	{ .compatible = "ti,bq27xxx" },
 	{ .compatible = "ti,bq27200" },
 	{ .compatible = "ti,bq27210" },
 	{ .compatible = "ti,bq27500" },
-- 
2.55.0

