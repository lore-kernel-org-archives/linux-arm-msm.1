Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540469;
	b=i+UmSj9fJCfLXbpCT37/ussoGOrkn0eZyHS5OI5GQKgRZCOa1ccDss11paYBoexe/y9e
	 2HNRfOkJiIboHbhlJ0YYlDS1YcYIoKk9Uo85Fr7jJiEHv32g15EMlsJvwLNzuoXL9SX2o
	 8FKg2y/oN98RDgOP3XbQrTRmBPV2tew5ukoTHdzPmGTJKHnd8KWC4MX8G6QX+u04CKXOG
	 cOzuG03wcSmOtq10+6dPaKs49XEM/EDAbQOVPhOgQAo8a+jH3OSxwed8jpe5d5EhdkLDt
	 ggrhTboAA+qR4mGSw03S8V+KknRE9j/zODZfj5g54rXTALm+sm4iEsouTx1W70D9BRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z2wCW2TznEr2hKQ6/D8LQzPudwB+Q3NlBOTdsjiFXJA=;
	b=H/lblp3U6TQFxEh52BUxcPSkjs8CBB5Mn0W/1zzz/3I8RlJoeaPn9WkR85aeCpjNCzio
	 36c9jLnIrEOfT6/BxnQLIJjGysxj6nSkTPlKir9/dE2iBX90YgpwGyg6uyVlxBvBCznOu
	 mLaJQ+HK7RqcfKB8KgftGibjACo/aP7i8fsuOhZYFWm7xHhCB1Hrizp/k70hUcYPVCgcv
	 Vhe8BfpztpVcxUmv2mR56fHwaFnLVi79WcBhnLv2EetsqhMIh292XPltJZJe36SrxOEtD
	 ben9TPSN27J15QGjZL06ab5tCDzYDa5lI7RS4MKHt32yNO7w9T0zimrb0eEqW8Rs36w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D00ym1I7;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6D7606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F6D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D00ym1I7
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so3413810f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795540467; x=1796145267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2wCW2TznEr2hKQ6/D8LQzPudwB+Q3NlBOTdsjiFXJA=;
        b=D00ym1I7Iw5XfnvfRQUKkpupVs8+8YMvhyMCTzyJV7NiRAWVFYMKK0JBKfQJaoe4di
         VZZ9KHoCv6a6i1AiEcnkxsrvUgL8JBGa63ig99AFzvREh+ohOxwg9aqUW7LHHKTJ45Ri
         ZnA9e9GatxLDOQilXj7aTUJZhRAYXXDfc2YQ42i0Kl3jFe9lvVL+x8XN88/UysKb/8+u
         9H6ECwmltpMgweeCiezCMnymMxEZPqsm4rgP4LgPtRv65JlTgeflaA078R2xx4b4dGjn
         I0WMkOkNOqbgrKf6NaMAKTOOJieSwpGQHYK45i0kqcHmxsZDdHtSSnAtyW7+G+kPtIiT
         1Npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540467; x=1796145267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2wCW2TznEr2hKQ6/D8LQzPudwB+Q3NlBOTdsjiFXJA=;
        b=0QHFU8lb5xKZODooHALS+lMaGYwoZ0Em66dzswyUpJ6hNBIoeTQokY+Jv+IManvZ+R
         mztRSIEG046lxN0K0A79dTCJQEWZVuy8vMw6clMcc1sjHdAAfDM3kvl+PoFY0uy0nGEO
         eCWT8L2Zf1Y6Z8QxkVYE5zbRU6wJG7nW2V0QoFa+j4APasj6iV9x5lMUIWo201TqJlll
         EpRP8FZVM/1MK1jSheRPtBZbQnPx3eyIK7c4Ks9pm+/dYqBuKop6COJWec/nHwp4vk5o
         S1rxK7edrOBbjDef7jXV8RC+dV0GTkRw50lh2CZqjPY2J7E863W+MrrfbJyEK6xIHtu8
         lH/w==
X-Forwarded-Encrypted: i=1; AL+hErGEYHX9kLZbMtVMmOaRvpZQU6WWmZDmQbwL809TGQxjUIHRHTrajNfse9Rs1vBS3GPVALyUpC7Sd485MYQq@vger.kernel.org
X-Gm-Message-State: APuU4Z/iqeKePTFrjgLYFUb0eIynNWKx0okfUVQbzk2IQJCak/Tt0rev
	glaw1Qt8ZFtJOMC71BjkiToXsKT9YNOuYUKUg0Hn0g6ysjX6PDtS2xHyHeP38iPUsEafEdGHH2t
	ccBK9578=
X-Gm-Gg: AZFdTZdyEDQtfWbr+S83v3h3EO3y5WNXmJeTnYyhjne7AkAycQq4NbFluJNTG0Ymehj
	yeMzailycxQKbsgsK5M3LlwL4vwWAG2UuJQohnim4VpOxtmKOGBIXLtKTyPuvCoC6LZWnwgUm1l
	yg57Y+jt/YP7TXmjFd2QfJPuQOmaHO7RWxciYnwy/sFlt4yFFpSALSmIgX2PLF9RqNfZjnEwDVu
	WGbp1m940JbF2aoy3p7Lr92JjhTVSW8OLngYC2AI9traCJqYo3+f9cVqnvK2ottucH/m7+0sg7+
	A2mBxkE6t4uBxWL1VDzKbRosU6exHodPUUsIkDo3/24ebTJfTu/00oJ2KUysA3hBk/5yF8xOiQK
	xJ+4n61IsVkhha2nmgxoGZHs+JavMohn0LuS5JohIqyZb5LHFJ+o8rl99cMBoaa/253Vcz/JIBS
	O9V760M/23sRluqpl17mB13jzNq2jnHd6nnOmnPNRFFHcDpKZJcwbZQOOlhB+OGzYb7TLbBK0RU
	9yUNuuBMDz5P9pG/kE27fFwuL2DBcROzbpXa3li4qRB8HCsDTJ681/JWp9J8l41cVKn1IlCEe+N
	bqAI9mM/K1bMhMhJ0Ykhjw+0GB4y1OgfPZe4EZhWx459EDBPsC4=
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb88812a84mr313362825e9.13.1795540466734;
        Tue, 24 Nov 2026 09:14:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm410592735e9.8.2026.11.24.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:14:23 +0100
Subject: [PATCH v2 2/2] pinctrl: qcom: lpass-lpi: attach all the power
 domains
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
Message-Id: <20261124-topic-sm8650-el2-pinctrl-v2-2-fd05c8378a08@linaro.org>
References: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zmp4vn3X04bE7pD2IGrBeIQaELOOnUf0zlQOX83mFQU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcXwjyCRaJ71OOMWY4Xx1GfsWkuRB7/GrEe7XVSM
 sJEaeuKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXF8AAKCRB33NvayMhJ0dvcD/
 9A1aQZD0JS763OWx3fJkPF8CIKL945NiiVR8LJHeEwlJqSzCTo2dECbH+UVpZFAv1CULWOJYPW9BmF
 /2qUz60Cdzd51XF/+gfsQYylToyLDQ0Vdf5Ydfyh9TOLF8TcBh7lWr2Gedat2xtQB+IpHWsNjOJesB
 bVxuyrkKs/5HAfoyfDi8gABtoMfxgI4SzpT6bFMbP+EzsWfyu3y44h9GSPLdc4I3cSlHVBeoMlu7OJ
 rH1mfyxR9uDOVysVK0B/nSKW7gs/jvbmv0XFqOJytZJ/qBbx6mnjFpqB/AI7Y1jfM2DtzRtrs7O46X
 HbKtt80de57a2mpYcjEoNSMeW31f5qYkBpWTYblgTgRXI3OrN5L6Nlc5r8VIWFk7zV8ent0szWx40w
 wy/SKlFLxPQDd56rqjnPhYy9JT0gB8/KvX32DClvrAsLRHzClp8huT7SSiWlrR5vKcPVLdYAaQQq5E
 C6r7rZgRFceGjVIYfboEG8ffMF1ZTCOoKE1KF/3Jhs2ku+vrvVT7+MsMINe4ASwqfmHK5ri4+Hv3Jy
 EEIv/pRQ8UhbVQy+s8B3OnIZf+qZPvcett6nXhN0Yp38eoPgiSiNXv3fi2S9EzNqArEvq1z56+vlok
 psIz91UGoOmzv44qDie603sPF8/TnXiYxwmJv3MU2n7q9KKLIPcHblb96XbA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When the LPASS is not handled by the ADSP firmware, the LPASS TLMM
block lies in the LPASS core and audio power domains, but the
driver core won't attach a device to multiple power domains.

Attach all the power domains with devm_pm_domain_attach_list() so
they get powered on when the TLMM registers are accessed.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 02f678fa75b1..1b1d0f4bddb5 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -17,6 +17,7 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pm_clock.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 
 #include "../pinctrl-utils.h"
@@ -37,6 +38,7 @@ struct lpi_pinctrl {
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
 	const struct lpi_pinctrl_variant_data *data;
+	struct dev_pm_domain_list *pd_list;
 };
 
 static void __iomem *lpi_gpio_reg(struct lpi_pinctrl *state,
@@ -543,6 +545,13 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 					     "Slew resource not provided\n");
 	}
 
+	/* Attach all the power domains when the LPASS is not handled by the ADSP */
+	if (!dev->pm_domain) {
+		ret = devm_pm_domain_attach_list(dev, NULL, &pctrl->pd_list);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "failed to attach power domains\n");
+	}
+
 	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;

-- 
2.34.1

