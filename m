Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E064B7A26
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658735; cv=none; b=pVIseILdcT+RjQ97CjytjLgOmZCDJphXMA/ioJCALw3v8weTaSBWUhp3el8stIHWi/v7NJRpvvpmCNYfi1vuxjm35K5OClmbsqcQVPrsx6ewDwZXi+m7xBYZ8/3BITOL5ztEnBPxxUcKraA2W1X4Y+LjuUxJ6S8aTk7kxhr88ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658735; c=relaxed/simple;
	bh=cDzuifZ35uySk/UpiYP0iSj8OxDSP029LxC//N6wFuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cs85C6K+HYsLQQ6srU8/bckQZlpWW/lQ3JnbRZSH8fQJ9CVpPbJXtQQ1O4EqsmgP+y//tdBg8vGfivHkT5bypv5vcMo5fzLJCaYzky5/YIt3Hffci/Jg5aeMfAwD6/iltnx4Q6Yj8GCePTl9L4bQLy6M67RdTvkBdcBp7P8Uvlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtJ8ZDz6; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtJ8ZDz6"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2953a01240so169654466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789658716; x=1790263516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMwGESoTpoxCW93e8KzY70EiAiyUsNG/4JMq0LantCg=;
        b=TtJ8ZDz69SGBUUx3acUjEswfKRJKS1KsNVBlSV+VQ0n1Y/Iz9PKCeFh2zq5Xjaj9vF
         uqZxiulbtuis2jQKoq3X6ocqgPNMnkRKssEiRrp0sQ+1Lg4ZRUWct26O7TBS0aHEKwUR
         BeAql+KPKR7w/yfmhFwBtl7akDX+IwM5d+l1Bedv1GmgkGKyE5eIodx3oDCFaBticnlI
         1qQpZFLVF3ZM3zoGwyhBrIE08TLRZw5IFCIUtJ5gxoF+a6NAjFf+B1wwk7OgqU+9EsD4
         ifkTfz+V5FpSwx5rDX4QI2MFMDiu4XOTS/Kf2VXQo8e/ZAdELnwbB9Ku12Xyjknid21u
         nNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658716; x=1790263516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMwGESoTpoxCW93e8KzY70EiAiyUsNG/4JMq0LantCg=;
        b=ETho8QYaK5FeiHsl42nowwHa+hEmk0sLlYA1KpJ9nQ5gT51K7322O7QZzGxLWVJNMj
         NECNYylyWIf23glgqx4f9BVtyk/BX39nyGeMyErlNGDjuvZtePvOjy37+h+qUnKZYBGw
         blx2kxN6cCRyTBy3TYKPW36LhTHeYN1xlEPa7ZTS+n+VCEmzEzN425SRZ/RVwdSJ1oL5
         bNejBYAOIT/nHRq8tdGhCzXrUXFEC7P+tVuhjYleU14SQiEi4WLVvD54Jzy6eq4VqLgP
         /qF/A2kOKQy2yPCo2R8Zr74B5wPkA2kY2cGIJIUQ07Lv47bCidI2KLM35Zeg0R2oZBcI
         akXQ==
X-Gm-Message-State: AFuF++kwjbvf6UzEQplexFmYIevXC9yIMDba+zKaXQhZ2hBbVipIEAkn
	3YQSU5G6es4SduiQ7mckLnvxaRkdZV4/AP0UJayjHoEutvVKrVs+mxbF8HBKShUg0H0=
X-Gm-Gg: AYBFou3nATEhFZJuTm/rbXCKCapRr9fKnAwBBd9cfh2s+9QkmSkIPbZfETp7AuV41io
	zgUXh+nyz9sjAlDwjQYVSAAkjGpGpfwOCXjU0dGizcbEAlNHMQr/1iU87L1kbI2GRSgHpxACvrz
	GMn5uswj3VIThumf74luEjvE5Wn+epjbtxKvpzNKDvWj6pV0myOD+zPO3qw8Wn1lv0PHlUrIRcg
	1gNKs/9UwIblhv3poCkgLKUrGhk670iP/Y5xwC8pxUHUE1zCdvpygJY+daoNSJopXEZkgKjYQKN
	ZBwEtFTpUVH8e3ukHx/BO3/YpIJOFGmSTpcMMxXrXgP28y79fxNzvccCs0EmgScz5NVHsP1/Den
	B8XvCGjc7pjgLroRax9LtjdlwlKbTXwy2vryjewe2d7z3osonbX4DreH2BlQDtAh8D47TofpJBy
	Agawp+CUDQiIB0tdE2/IJyDnb44jJ52401w+cGa0pVjV2+eg3r1Z4nZInpnB+rP2dhA5sP9CCbq
	ZNKbTSPF0Nms+hu7FB4
X-Received: by 2002:a17:906:7948:b0:c29:3838:dd5e with SMTP id a640c23a62f3a-c29e530a3femr490991866b.40.1789658716124;
        Thu, 17 Sep 2026 08:25:16 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48755asm310587366b.24.2026.09.17.08.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:25:15 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 16:25:08 +0100
Subject: [PATCH v19 3/5] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-3-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2761;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=cDzuifZ35uySk/UpiYP0iSj8OxDSP029LxC//N6wFuk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrAZU/wHfXG/AsAs5KrgH5lFusNCZNVd+gD81A
 7AhwLisQJiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqwGVAAKCRAicTuzoY3I
 Om1dD/43gYbDziRG/DuUzuN10axrWDggX4LKPE8in+SbMC1NywaNlOiv1v9HkNmMyUOu4oVYUSM
 2OCymKhNER21y5sVRJA2j5jBKIFmecAKnW52FHzSEkuoeFd15U3wwocAU6arz7MrEAD9bSVIvvX
 JL1dGNm5Ze/bGeiL/RAGDDPITyjnbVfCIrwwin8DfQw0zMXFyabDVPsysXNYSC/zZ5a6HxTrcqe
 hn5NBF+m08nF0ZDfbUEhUeKJGW3OsqgcThRINrR4ZRZFxHf6uYVfqdcLq+HTdtKtBdAnBvkHgOa
 SHVJQ79VuefwsnWvWsBrBEKnlja2iLBVo2q35FdTnd0ZqRI0QcXSuVcuBhua/zzQ1xCgC2/hi4/
 qX/Tts/1Fcj7r/h1w1RusuP3ySmiwo8ehmYuUKXFYBGFnEbKIepxYnloOZU8zgJtJU8A1qo/hb6
 lRc9sYBLwSuyh1UKQl5YcxF4hXi5wWrCY73MGp0Bz5m4UbYCt8dwbALJgAfvVeycpmMujRLKwEY
 P8EnYQtGfqvf8lBT1F6NzDMarmCp2lNsvV8Q/RwN5gSlJ8WxaYfGeP/EnoofIMJbdPyChKS/MNO
 7V5+mYWP2F/UQZJatdHn3i8aBXbWmnP1Nx7lKBniOh6LhbC0kN8H9Z3v42Bbee252sNk1YYBZFx
 I9n6sWr9c3Jm6gQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a devm variant of phy_get_by_of_node() to allow for the familiar
pattern of having devres automatically release resources on the driver's
exit path.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  7 +++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 4a8e1d3cdfe75..e24a38662b484 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1052,6 +1052,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 
+/**
+ * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
+ * @dev: device requesting the PHY
+ * @np: device_node of the PHY provider
+ *
+ * Returns phy associated with the device_node or ERR_PTR. devres manages
+ * releasing resources.
+ */
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
+{
+	struct phy **ptr, *phy;
+	struct device_link *link;
+
+	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	phy = phy_get_by_of_node(np);
+	if (IS_ERR(phy)) {
+		devres_free(ptr);
+		return phy;
+	}
+
+	*ptr = phy;
+	devres_add(dev, ptr);
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 71c2e16397130..14b924a88411f 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -285,6 +285,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
 struct phy *phy_get_by_of_node(struct device_node *np);
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -499,6 +500,12 @@ static inline struct phy *phy_get_by_of_node(struct device_node *np)
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *devm_phy_get_by_of_node(struct device *dev,
+						  struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.55.0

