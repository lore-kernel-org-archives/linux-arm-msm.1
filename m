Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124D25678F3
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872886; cv=none; b=WY1Sj7qLYMKS5EWRZ/4tPVeNgEVzbkCOY0tq7WN7/g4nXlNcyjUovRYrpdIrH/EzlvrupxJo/UVRmd9KTk4nIuJLshKsSozNdxfu7UVMfFA1bPLC6E1Gy3AMiOYxglcxQV0bGCClCGnnhHDYfLZA02cgnwjX2j02Ctp2FO1scrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872886; c=relaxed/simple;
	bh=+OIWRe3YDSSSfno1aUGzUXI4pqYdomv36H08zvrEp/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRJmFLhZzKrQMjvULqxVw0oDU6trNSUoENPqSUIDI6hsWZOxLzv6Vz0kogx52TpC2NjbR8R5mUbnsERvGFG6A/ON6twq8maf1QYhVOH3qWvBv+ZswmVwESvCxTdTh+bXUG2cr++Fy9dQQCYWOKALEsbFFdepJoDgadjn18YJdEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OC87lQmX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OC87lQmX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so43659895e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872882; x=1789477682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RugyRWGWsjHVr0AiFzCDOt1qK0c+eaQP2Q1JnZpRYIo=;
        b=OC87lQmXh7w+yK8XuPde0PyMYCCjA20cG1IvIEvJLT2rPe0wWO8Nx7deSAnXX6LmCG
         OJaAYLb5eePj7yh/R1fNTaKnV0/kK2ZrH3mp6m1H9dxAgLMLmh4Ie96sT3dmtcpeTEZX
         ZzXH57ikqTwtAKYUPHcONPP6viWlpAPsxLSPbM4LkWXAQPiN6Ufxt3Ku+kbgLDfYhPB9
         TqKgKMX2UFYCTgKqbSS751CnS+S/czJj+BFfEtAtQ4cjbCpnz4JJHaWRBiGUQicIFzBe
         I0IQTDyet5evUFpFkGd/8r8TsEMNOHTZ1jxZlA+tafsUOXNmN2j/7MKavtLrpDsckAGP
         gzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872882; x=1789477682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RugyRWGWsjHVr0AiFzCDOt1qK0c+eaQP2Q1JnZpRYIo=;
        b=qvfa049GTlsnrlFqljfORPMZujPTEMwKzI+VldXIDXNZ6A1/f4Fa7t5QwrGUpjMNhl
         dvwjuMJjBykVTR756CNPg1S4DX1LbWN/UoCKR1EPRl3AQ1/xm4RvBs0+bTJ3SchYmC6o
         m75u8SruuFoRj+sAVKMs09/L52ELRT7dvPB1I4Ki1S/T+Xksuvx21b7/v62KC5V4qxxM
         snd2QcW7AEG3n+krCN5k+CPqy+h6Fgu8sxHpcZzjdeYsfiXmPsjphb3xETKVfwMGmMVb
         I7zEGOOy6BzQ6rugwAWIMtexhULn+9gonEmo6ywv7cggVJV+KKT+7g0AfF3Hr132Snxr
         zO7w==
X-Gm-Message-State: AFuF++mtMEPWrgoM7TT2lR0i543pri+okNCfexhLh2JS4wK+9mpxYoaU
	myHlvBKeoZQp6I71u8cpEH9iF+t731VHWAuqYGG2ggIy8TMzf+fXM0Li
X-Gm-Gg: AYBFou3xHvGfFZ1S8Pit5orTjVRsh1urE7dxz2tRlLDx8Hz3FyuTbyioLcYWk/tB1Yv
	KoeGhOdfxvwsOPnFmfjGgvrbEH3/C7WV4Ol2qnslFYjUTVHnMXU7zsYNzBZfYDhp2qZj9z0/a4q
	9PN8XNQi0xZGNYY3J09sRL9MKXTfE09yHaycIEP9I8ePb+nYqDUr8yqWE7rjLr88Z8jaeGnMgmq
	XLPXpGNeqE7qm3YOlxRopcUvI3QQrmw7SzaDhivcvs5fEQ/iVxZYL5BzFzMatXEfB3WDke9l/AP
	aj7+XglFkpWYIGWxaGQE0N/kjjzFOIE5iI9f5n/NkyBywO2KpeGaWMUDLP3KswP9ysvqFFvgz6w
	yXl0T4NffxXWujxpZsDCVqOpDb13wQYgyNQXHrW5iQUCw1p8YFxUR8P8AkYaMDfbeXvJUwLBlNK
	q0/LCMA8gw57KwxHR6+6sVi5+gttmbBsjODQBDoZ7teHpWHan7mvPYS0QrIC5IEYT65MileSQHs
	7c0A/azWEcx1mh+hZhYM5MRhoMvocWQ
X-Received: by 2002:a05:600c:c1c8:10b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-49cfa21e8f3mr187137995e9.31.1788872881636;
        Tue, 08 Sep 2026 06:08:01 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm28884165f8f.20.2026.09.08.06.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:08:01 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Tue,  8 Sep 2026 15:07:45 +0200
Message-ID: <20260908130745.2545-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908130745.2545-1-okerixx@gmail.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt is only needed for the temperature alarm and the two GPIOs.
Where the pin is not routed the regulators are still perfectly usable, but
probe fails: client->irq is 0 and request_threaded_irq() rejects it.

Skip the IRQ chip in that case and register the regulator cell alone. The
temperature alarm cannot be registered without a domain either, because
its IORESOURCE_IRQ would be handed to the platform device as a raw number
rather than being mapped, and the GPIO cell needs the domain for the same
reason.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/mfd/qcom-pm8008.c | 63 +++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..b51a9657ee56 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -183,6 +183,10 @@ static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-gpio"),
 };
 
+static const struct mfd_cell pm8008_regulator_cells[] = {
+	MFD_CELL_NAME("pm8008-regulator"),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -195,9 +199,12 @@ static int pm8008_probe(struct i2c_client *client)
 	struct regmap_irq_chip_data *irq_data;
 	struct device *dev = &client->dev;
 	struct regmap *regmap, *regmap2;
+	const struct mfd_cell *cells;
 	struct fwnode_handle *fwnode;
+	struct irq_domain *domain;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
+	int num_cells;
 	char *name;
 	int ret;
 
@@ -231,33 +238,43 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
-
-	name = strreplace(name, '/', ':');
-
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
-
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
-
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
+	if (client->irq > 0) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+		if (!name)
+			return -ENOMEM;
+
+		name = strreplace(name, '/', ':');
+
+		fwnode = irq_domain_alloc_named_fwnode(name);
+		if (!fwnode)
+			return -ENOMEM;
+
+		ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+		if (ret)
+			return ret;
+
+		ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap,
+						      client->irq, IRQF_SHARED, 0,
+						      &pm8008_irq_chip, &irq_data);
+		if (ret) {
+			dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+			return ret;
+		}
+
+		domain = regmap_irq_get_domain(irq_data);
+		cells = pm8008_cells;
+		num_cells = ARRAY_SIZE(pm8008_cells);
+	} else {
+		domain = NULL;
+		cells = pm8008_regulator_cells;
+		num_cells = ARRAY_SIZE(pm8008_regulator_cells);
 	}
 
 	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
+	dev_set_drvdata(dev, domain);
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
-				ARRAY_SIZE(pm8008_cells), NULL, 0,
-				regmap_irq_get_domain(irq_data));
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells,
+				num_cells, NULL, 0, domain);
 }
 
 static const struct of_device_id pm8008_match[] = {
-- 
2.55.0

