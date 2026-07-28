Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5DB41D21A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231350; cv=none; b=rbsInMSVc6KHMIEveAzJp/vbjRy8WV1f63bKICNsLpL6h+nGs92/6DHN8akxkXA4mga7nBLkLb0PGskcLusHrlY2RP+dY8r04OxB/3++nMpxXvW1N2xAub99TR5qsxQSHtM8t3h5w2hJgEBtnsZzU1z88H/luurjlGD0kzzG8Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231350; c=relaxed/simple;
	bh=P97ou6LhnmZop/zMaTggD9yyLW0fOXd44DlYlbhv9fM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mow6Zz3owEGsVIRgk/aop6tkbsms67HO200chcNAOwx/SSWzxHXXcDnuW9YaV8oTWk+0ZnAxi68/iQTAKjr4xxIBAOHT1v0vFkvfJW5ussO5TpwfS06lv7GHdDEinL389+axUZLVa9e8C1UvD8MRRW1WTsr+OjRyGUInQAQa31c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XeZDNA8Y; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XeZDNA8Y"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f97d310caso2517475f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231346; x=1785836146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KM9DJOnrmlW5Q6N+uSaGx7qHAnhN0rS4tyC6ETbAVY=;
        b=XeZDNA8YV5rdiiQ1bE4U7ssw/7MRWmRYYaYSwVi9oRZOfKMqyydnB1XIpfvnA99eJg
         nzVDoao83Bu6ivsjdj/8sKO9unvXB5IW8QRghHAtNLizYHI7grBbwzze3nviykT76Qo/
         WdhBNw5189WajmFmWwWMeGQIXNFi9yELp469sT4Bx2TGhN4xRy/K0kW3lFJo6kpUzuwd
         TcZXccdE7j6mzacB06xzz3e3ywInCNSYQF/lryzCCqbI+lVqQFt29lcfYNeKDMA/YzY0
         u7Xmt2p4UndPOrthR2oSnUG7l1fzY+MgqU/OL4fYacrEQtp98sMCqRo4p3hj74NhNQic
         A9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231346; x=1785836146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KM9DJOnrmlW5Q6N+uSaGx7qHAnhN0rS4tyC6ETbAVY=;
        b=qiEA0S+xtIYAP8YVax3/v1egOrdvFSyLXto7iWzQ0RloW3QwpTRJYAMtogJuqMVspU
         dEBieLbEjSEsLAdoKVTPojcDGLm6j8o6R2SGho4PZ0JyI9BU79LcLIJt5nkvbaxnciOz
         6EH9Dw/a2l9zG2sEyLvAUEz91FrXrx+J2Xeonqzop/zlh630U/7vx78qq4upzJBu9x5T
         rCr0Oy8kdLSmQp26cuWctIXeRLD7DkpeWF+g+uQtYZ1fVuFQKa1cWO5O+9pBAP5QdSV+
         N+pLupiVClBACMCvxmcMMTQFFDZsiPaPR8+8ACnLxyIEIShwr+tYugw5ybeiAc2Rw0Ka
         3gyg==
X-Gm-Message-State: AOJu0YyCU+JdjLf+AZrVyur8YRBMAU9aQMPheCSHizN3Outfofub3pPs
	shgZV8R7YegNdrpO99Z//jXdJIEsppzvW5Q8m8nDDKhN7uY3zxPUFcZkE1fRN63CCqc=
X-Gm-Gg: AR+sD126yjlV5dxXHXhFC52hdYVvErLAYabvhZmLd/gTWlfE91FvEd194KeKzw2Jy6J
	yQT0E4Ux9XCeDPmNsnOxNMIH59qmXGT0zIZHR6yRrUjqnJNUd1p6OFfj3IK5uAdNypseU2Kzyql
	oE104qxIqQ+O5gaA4AwDdfxFD0yXUc9Dj5HpzngJVEhKzKCLVgBWmErV0oGw3e1yPLxt5EZ1LMM
	0zqSez5LyRjmQkXOx/LfI40CpLolxGd9AVetbRWz0uQeY9hw/eT/2SvGuYuUemLLKsSOrdl2+EP
	mYNLBhapsl45DtQWE45YteEWJqTkh/cvN1vkwf7KPf+q4RahklPqP0F2uLRxlysqHizA/NYNLWO
	TV6NvfrQWFXY9QSRuRepXJ84mfduCkobkHTEg2nJyVckss+FOWj35YXGW6egD1emwoVwYlFsbE4
	tQ5FmeoOjUAzNC92FRkolqohs=
X-Received: by 2002:a05:600c:1391:b0:495:7888:281c with SMTP id 5b1f17b1804b1-496c60c1c42mr16278855e9.0.1785231345518;
        Tue, 28 Jul 2026 02:35:45 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm68190825e9.15.2026.07.28.02.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:35:45 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 28 Jul 2026 10:35:32 +0100
Subject: [PATCH v13 1/5] phy: core: Add phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-1-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5579;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=P97ou6LhnmZop/zMaTggD9yyLW0fOXd44DlYlbhv9fM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqaHfsntFYW3ldHrzV1oCeA5iGKzUBhevD6ZJ1J
 VHNcQBiOB+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCamh37AAKCRAicTuzoY3I
 OnMIEACqh/dOFGxCyT373Qqzk5Uf+OwaihSIZllxMugWHSDrAJR3GlHPB8qRs5PNeiADQy3aYvT
 +6bLY7XmhrfykBrdlN+cDVTft6VS4Nsh5ZAiSX2DL20SFJnaOmhDc6bYYkQzK/VT62sss/nOPhm
 wYJ1+y4GuoO86lz7AJWm9Do39zLrYG23lSU2IlIGoHxoCqqSPgCJD+uRC6FUECQRxP8xJPhVNQF
 2PwgO5tZcSsbX93uYq2tidHjVfzv76yQWX4+Q+geGkVPQohnbWiAd8aDJcH9ekq93NwXs3Q9pyg
 uFPlHtcws3v4ECseM4GAs0MIQfiv0qDwbCJLW+v7auqkV/ArbcCS3ugso0K0VPxaqjrF1ENpYj7
 R+5GgYCCZqtgZW9ShEu6jcUbDzsPpmamyK4YuKi0ApXM0NmIjWwjrUzABeDKjCZtFIjvqCr9cBM
 g4kINvpASyJuRemnJbKW4s50qBevFYqyjCYiL8f0kN8vpFA8J3Tz7tTCgeD0K5yPH9SngEd4RWY
 +Ch3sF5aXpA2HfBmEELdUfQV0uD+qcoZYiThwrvxjDNRQby8Ke9KbNcPrEXdLtGmHLIKnpfd5wa
 jWzBSvVw2/QgThxuX/WXGrNzw5agYV1wvCHuj6FrW5KIvVOcZeMI3PspD6rwOr9wug+Ns2tORFo
 l99zBEDct5hGYlQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 95 +++++++++++++++++++++++++++++++++++--------------
 include/linux/phy/phy.h |  6 ++++
 2 files changed, 75 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53e..ebfad5325072e 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -607,54 +607,69 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 EXPORT_SYMBOL_GPL(phy_validate);
 
 /**
- * _of_phy_get() - lookup and obtain a reference to a phy by phandle
- * @np: device_node for which to get the phy
- * @index: the index of the phy
+ * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
+ * @args: of_phandle_args to the phy
  *
- * Returns the phy associated with the given phandle value,
- * after getting a refcount to it or -ENODEV if there is no such phy or
- * -EPROBE_DEFER if there is a phandle to the phy, but the device is
- * not yet loaded. This function uses of_xlate call back function provided
- * while registering the phy_provider to find the phy instance.
+ * Returns the phy from the provider's of_xlate, -ENODEV if disabled,
+ * -EPROBE_DEFER if the provider is not yet registered.
  */
-static struct phy *_of_phy_get(struct device_node *np, int index)
+static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
 {
-	int ret;
+	struct phy *phy;
 	struct phy_provider *phy_provider;
-	struct phy *phy = NULL;
-	struct of_phandle_args args;
-
-	ret = of_parse_phandle_with_args(np, "phys", "#phy-cells",
-		index, &args);
-	if (ret)
-		return ERR_PTR(-ENODEV);
-
-	/* This phy type handled by the usb-phy subsystem for now */
-	if (of_device_is_compatible(args.np, "usb-nop-xceiv")) {
-		phy = ERR_PTR(-ENODEV);
-		goto out_put_node;
-	}
 
 	mutex_lock(&phy_provider_mutex);
-	phy_provider = of_phy_provider_lookup(args.np);
+	phy_provider = of_phy_provider_lookup(args->np);
 	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
 		phy = ERR_PTR(-EPROBE_DEFER);
 		goto out_unlock;
 	}
 
-	if (!of_device_is_available(args.np)) {
+	if (!of_device_is_available(args->np)) {
 		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
 		phy = ERR_PTR(-ENODEV);
 		goto out_put_module;
 	}
 
-	phy = phy_provider->of_xlate(phy_provider->dev, &args);
+	phy = phy_provider->of_xlate(phy_provider->dev, args);
 
 out_put_module:
 	module_put(phy_provider->owner);
 
 out_unlock:
 	mutex_unlock(&phy_provider_mutex);
+
+	return phy;
+}
+
+/**
+ * _of_phy_get() - lookup and obtain a reference to a phy by phandle
+ * @np: device_node for which to get the phy
+ * @index: the index of the phy
+ *
+ * Returns the phy associated with the given phandle value after getting
+ * a refcount to it; -ENODEV if there is no such phy or the phy is
+ * disabled; -EPROBE_DEFER if the phy provider is not yet available.
+ */
+static struct phy *_of_phy_get(struct device_node *np, int index)
+{
+	int ret;
+	struct phy *phy;
+	struct of_phandle_args args;
+
+	ret = of_parse_phandle_with_args(np, "phys", "#phy-cells",
+		index, &args);
+	if (ret)
+		return ERR_PTR(-ENODEV);
+
+	/* This phy type handled by the usb-phy subsystem for now */
+	if (of_device_is_compatible(args.np, "usb-nop-xceiv")) {
+		phy = ERR_PTR(-ENODEV);
+		goto out_put_node;
+	}
+
+	phy = _of_phy_get_with_args(&args);
+
 out_put_node:
 	of_node_put(args.np);
 
@@ -986,6 +1001,34 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
 
+/**
+ * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
+ * @np: node containing the phy
+ *
+ * Returns the phy associated with the device node or ERR_PTR.
+ */
+struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	struct of_phandle_args args = { .np = np, .args_count = 0 };
+	struct phy *phy;
+
+	if (!np)
+		return ERR_PTR(-EINVAL);
+
+	phy = _of_phy_get_with_args(&args);
+
+	if (IS_ERR(phy))
+		return phy;
+
+	if (!try_module_get(phy->ops->owner))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	get_device(&phy->dev);
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288ae..71c2e16397130 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -284,6 +284,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 				     const char *con_id);
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
+struct phy *phy_get_by_of_node(struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -493,6 +494,11 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.54.0

