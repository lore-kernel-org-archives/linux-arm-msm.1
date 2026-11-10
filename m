Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296705;
	b=yv0IpoBH8HmrbfYIW9F4nZs2Bn5ECVZX6f+Yf+z48tjb+n3h9Vy8sDQJMeRsZ6ZtgXE6
	 SMaLf4L2Dwmixt3UUkeOHWITFb8UsmjLxvrux3v6aZ/5SQiNZrd/4NAlHF//F1BMvUwrw
	 gF84d70x5F4qQ371H71y7p3yIrmZjUiBZuWeGykKHImTr9rQej7NB8e6a8fnwM0TqLf1C
	 l0TZvn1SyPOjx79NbgYPqvKkfxiheRLSCMGUUvg5ScCyF813wPX/XpjYvOOieQs1JNsFx
	 FJOCSOTagb/QJahVYsD9ry+35mXXwDws3/v34utVJ+1PpbFyfFkKsK/Ufu/CghgA0jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CjDWnM22Q/K7vI6+OfH7WDfHobDgdF+mnz7wU6JjdMs=;
	b=OwbnocYzeFOlPOKGtUP6Jo1tPbGhW/orsunz9RB+6jFOVmZJpGwQXns1NDMWrtZaxADt
	 LpnGF/UVss/dl3YTwrh1haoAQhbqFTbXvicIwXH2LUD6Ag3bzVUVhGbE3Nj2ozjhAp1Sw
	 3woHs3NjUIJqSnmAQOMD2vmkK07lnS031fbUO4jguowQalG49zrkBvMQ9Q9Lp0DhdSegR
	 UM1VzNXZTi1dti2Xe/8OwQmT56H0CPtbhomB7OwIIV/Qaphb9et6mHAOvmqcxM3qPrt+P
	 bAiO7AtU8TyoexwBV0e/0X/7Ss5AC8UT/H77moX5qhhY4cWyTmoeyCxDrrxIwEl0ynw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxsocedS;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2464B607020B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2464B607020B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxsocedS
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1393050b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 23:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296704; x=1794901504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjDWnM22Q/K7vI6+OfH7WDfHobDgdF+mnz7wU6JjdMs=;
        b=dxsocedS6Hh1lIn3sRv1fe4qhTmis9Lgzbdim4sr5SQeIGtY9pxxW8y7fzV21G9QCV
         0te7yiRXM3gKDycZlvZR3EdyImxNKRNBQCgLyZJAOxKsKdZqxm9d7al4mBhY/hQmukxC
         gLVyxKOTlFS2CYrRtN1RNUwn44YI4DMvLScxnnY4TzvnFNLwvjr5Lu8oODsAo3NS7A/D
         FP0XSHTQXMTD+gKsVbPgqm/TsCWMee0exBJV1/va+8af8+QMqJsfsaSKVJgYcJq+SqEl
         KOJoEYFSGgSIK9NDdq79D3Kz/xOHOlxoTo7Ym8qfopZhkgloMCF3xSHbdmCkGMxeAQIZ
         DGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296704; x=1794901504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjDWnM22Q/K7vI6+OfH7WDfHobDgdF+mnz7wU6JjdMs=;
        b=Pu78BVydgL4Jf+q8A7wEYINdqj9eLXWXCOWaskIvqyNZrn9aH/Ij1ImxhFfK6rQDJa
         lKVm7fuv0bhZvrMTQwmbsOcJ8rgWtG3AWHETnEDzQv+Uye3Qxke1sE8lIk62ZVab6aEj
         a7wSbl9pNtFNWde7m4Vtg7jrCX5aLclyEQ7ElJt6xVaHSjJZve5mkdYS/F68N6qR3UUw
         xsZT7gJ+iIkVfsdHpgaFzybSOAd2fQblXy1hctbNccCI6SAJ92Fjjw7d26Si7DmFY97q
         9VhiMx3/cfTyNAmvxWT/so/iGfzLp2+1yzRdmYx9gmhdWHh8k4nLpV+Sa7TpU0SMqxSc
         Qeog==
X-Forwarded-Encrypted: i=1; AL+hErFj1kHFn2uhvoe/JAS4JU4IYraq04V9+B1mGwSpGLYqvjiD6aaYch071TH9AWlYAUcaBhSI6uL9YLXquLm+@vger.kernel.org
X-Gm-Message-State: APuU4Z+aVRxmKZuza6q2OkGeGpRg6aNtA56RMuRdK5p4OhtgpIQusQUi
	xbzmLzqN4zbLKMwnQGOKf3tdLzIgPVsEW1qxV2aQFzMQFrHoYigntSsC
X-Gm-Gg: AYBFou0ZJuscl4pFwaM+fbzF27I978Rif0nZwgvEHUycSKa/XY8Fk6jRMufRgH+AsRU
	YJAvTcvhEHD/ZFlMq1cJ243Ti74k5FB7q3mAm43oFa2g/hucOjEAJD0fxrsIqgAHJryhB7NsSPi
	a86v+0hQ07M60Ls3TQTHfGnVkUqIjVjX5LXbBDhMe0Otdz+rSxKwe8kbSmf1ateDDE2vakUVmWJ
	EEFKJjX3eFGb+kE2LwpnVbiM8Uxa+9x6xy89oVbKQTOJm+l376pmBicbAifnRAV9e6YITMqXKNT
	HuBnALtEMigr3UUMt0wIDl8DO4/HSdWiWeaufigSCSAWoR+oT46pov3cETOGj3ELz+zEyQH6KlR
	C3fcTIHz0fwZ1xcF0508ool7vMPesaxIRk+ooyrYX5XYSjzTC45NVDRA1/x6U1aW+RFceCxBCqT
	POHyyf3bmUeC+/DUAxaO1mwlt1gOIBBnFh2n41mHfCHSOycP9abg3jUdtB3Vv8AVtCSO/V0isWe
	VZUj4no/GiQKPVlW1qs6/6TiJVbBXeX6iqEUU6o2NLdFVCwB4fCm11m7UBaZmNndarH3mKsD9s0
	IpVm47RRqwhRmqbuZ9Qq1EDv8qctI26gA++rx6zIiL5QhHZKoBhCjC1KynFOBxXtICNISfZ+dEY
	yrozKdzAhl39asROzAI8s31i6A++nY/8dFJaeTzNkJKc2DAR1sYYGQAHZ43JQ4bc1UL+F6+27+W
	bZ334EJ7QbA8pwN80Yt9qofInh+yeC8XAOTsc2npQD7h53tN3hkwg=
X-Received: by 2002:a05:6808:4fcd:b0:4b8:46e3:e221 with SMTP id 5614622812f47-5687288b6ccmr1019708b6e.13.1794296704117;
        Mon, 09 Nov 2026 23:45:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:42 -0700
Subject: [PATCH v2 39/58] mtd: rawnand: qcom: retain open-handle state on
 removal
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-39-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Install lifetime ownership after scanning each chip and before any MTD
device is published. On a partial probe failure, unregister only the
published chips, then disconnect and release every initialized chip.

Cc: linux-arm-msm@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 46 +++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 978fa84f051d..2e8fc574f718 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1903,7 +1903,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(&nandc->controller);
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
@@ -2010,6 +2009,11 @@ static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nan
 	return 0;
 }
 
+static void qcom_nand_host_release(struct nand_chip *chip)
+{
+	kfree(to_qcom_nand_host(chip));
+}
+
 static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			       struct qcom_nand_host *host,
 			       struct device_node *dn)
@@ -2022,13 +2026,16 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
 		dev_err(dev, "can't get chip-select\n");
-		return -ENXIO;
+		ret = -ENXIO;
+		goto free_host;
 	}
 
 	nand_set_flash_node(chip, dn);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "qcom_nand.%d", host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
@@ -2053,7 +2060,7 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
@@ -2061,10 +2068,15 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
+	ret = nand_set_release(chip, qcom_nand_host_release);
+	if (ret)
+		goto err;
 	return 0;
 
 err:
 	nand_cleanup(chip);
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -2076,15 +2088,13 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	int ret = -ENODEV;
 
 	for_each_available_child_of_node_scoped(dn, child) {
-		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+		host = kzalloc_obj(*host);
 		if (!host)
 			return -ENOMEM;
 
 		ret = qcom_nand_host_init(nandc, host, child);
-		if (ret) {
-			devm_kfree(dev, host);
+		if (ret)
 			return ret;
-		}
 
 		list_add_tail(&host->node, &nandc->host_list);
 	}
@@ -2106,12 +2116,16 @@ static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
 	int ret;
 
 	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
 		if (host->registered) {
-			ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+			ret = mtd_device_unregister(mtd);
 			WARN_ON(ret);
 		}
-		nand_cleanup(&host->chip);
+		nand_disconnect(chip);
 		list_del(&host->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -2141,6 +2155,11 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
 	return 0;
 }
 
+static void qcom_nandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct qcom_nand_controller, controller));
+}
+
 static int qcom_nandc_probe(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc;
@@ -2149,9 +2168,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
+	nandc = kzalloc_obj(*nandc);
 	if (!nandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nandc->controller, qcom_nandc_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;

-- 
2.53.0

