Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604666;
	b=NaSZcuykJnb8dygIz3u636EhNVYumG7p/vUCEPind0tr9m1KeYbacO++T2XkZnzu+82S
	 gpfKaKYfEbnSI+5ru9ciYpzMlA8p8TgwnINNNgH6dK+RgiBMnGYl9L7CcHJnoxTEez3bF
	 DX7rTyCLAosXUq/Ty35SFU/PU6Q5Xe2iL1VHlYA0E45EWApwqR9KAJn5xHltERi2WCysN
	 WIlpKaKtunGr59ICPmPsq8nzq17vPlPmWm/PsEII18lfFPBAWvnk7sveR3Zml8ZwGhr/b
	 rX7kqkG7L25xWNCMG10Pe/E2a3bJesMmNSkHuRB10QTaEfZO3tIkpwhsQH+C6EpAfKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Zp2LzpohEOD48++2oGdRAJVm2T9583KxpsiScxEm4KA=;
	b=QPi6TjCiV/SZD/Kh5HaH0WnfQUoWTrC0DYroZM6uUNdc6EEuLnYDshZ8duyVzjxoztOa
	 9Gq+XJo0Hm6z7D99j2ZzSEbfNAAdnXRayFHdtDoEIDA/Do+SK2UltZs1TPT+Um+/ZOZYa
	 ttsYlFsSUumqCkRoPcUdJY1oazqqr59hygkSIqOLzPeI2OlNEB0LfWVAFn9c/B/z5MhpR
	 9SypH8fx/1eYUM1KTV1gho+4l4bky1ToIdAHXON4B473IQx6b4hyXYEtXMbTu2GqEiIOC
	 vVKydbkiJH8nX5fCJluVkNlrRSOq7aZbkpj4jnVXdsdE8lTwUwrqsWWC9hOLSsSuAUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y98FmQkg;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22ED606A68C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22ED606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y98FmQkg
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so3855333f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604664; x=1796209464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zp2LzpohEOD48++2oGdRAJVm2T9583KxpsiScxEm4KA=;
        b=y98FmQkgO18sYEhZk+KoODWr2WqFfOtujhyQDpw5d2nouq3viQVQksWktOrBV/bV71
         HsXxZ7/XtiuJcSSq+Ka7Vef3nw88PCFgqA0gzIY1Dqs7vhyTDvW6SUclMR0l/M8YIaJh
         8SeP/s+jOJnEuEZaBmbmnFlpCXN3CBdd9+mu7S0pLDHgF2XSRiUJA+MkIJl6zk21tRTB
         evK8aK7phg+OlnPvVtWBOBj8iOt5EYGC7WLWKqZnfXC8GZwhs0f/Ko4eo1YgTo5DJuWB
         mVYb4+mfq9wGHtctKSpvoS0YIJM637QnowqrhgWh8XZlWl7oamZjd/cL+AFbE9IVBIO5
         iWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604664; x=1796209464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zp2LzpohEOD48++2oGdRAJVm2T9583KxpsiScxEm4KA=;
        b=1fYoDIy7k3KG0xBA/3PgMJ9/kfyEV4kSmaLrC+A207eWGSgRJOYcvoVyvcwClQwm4d
         zyn4dGm8sb7u3w+6u/snVzGtRZ9pPg7jAkacVBbwDz5TXlTdeQj+Sxo2gCT/Pc/P7hoc
         5lVxfpBtYvziF5DHva6I4CCaRnr5PEeSXZnzriuXzDmK2LyEez9n/1ZZM1puL4xtyvvZ
         7hhxwhvmoLZ5MHhFpt94e9L2+6T0D7FJQwEBdR7LPes2F2SUceO0Hs+EHEKjbP7dZcFs
         3j+WB8Iup/6JJ2P63U0wsW48BAfzPpBLSn2EXaZY2ZjXDmetle5rWdHPjSw3F+VJD+qM
         /otQ==
X-Gm-Message-State: APuU4Z9koP5UGhkPV9R0eY+mBIoP+dlH+eJCxqW3UgyyU4smizABywya
	tl9rEyEXRvWN1FyRZrCHDH2cyt8ZA+gGVDPc9qTp0SArs0LsdlUEFdXci772ioepA8s=
X-Gm-Gg: AZFdTZc61b3Kp/DMrKMoVXhP70SkTx3Eruxe9HFDLDhIocGY2hiMq/TUKggjjD9eAAk
	0XWYgrD/ZIifPN8IKwCchuXWGgbrggyutJzPZbe5VPvMKVS9j5TWStdU8mFyvjuPb6nBDEdX5jk
	qG4zqkgxzLTMrDflI0LwYJjKQng9GGGIhgldAvMuIO+xOI0mFli4nB6FJXVFad7DRcAS+lIUbUX
	3TNniJ3cbmPPSnZB/D1NorDEggFd3t6hzQVzaa/Maq2abhlccmVTf3FpwUihH44raIwvwWknoOs
	ny7/qA9ZdSU99qUe08ysIxz3HUrsm5rijO+uQLHg98BXBhqcUBxsrTcnAOnBqgVdB3r+YErnVde
	lhUxAO7/w7QQhNR4BcmEPjwiWlDL2cUvRJU+RKs+58HbB6I1w0gCzyx2oaJue73n3UCaf5U30lP
	Fm5/v9QIWQxYCzf9HA/iQ3cYmKTiLYDPVgewxbK/wjDLUgEKi3c8ujmP2oVUH3NyvlgDjyqOzVB
	1AOHOxQYL2osUg7i5o+uPr1WNOi2MZor4c1JYyRBrMgjWOu8l5VZ8A4nz1FKcMSk2IGmlEDO2Tr
	s/D5TaAdj/g2p9dTT4yHEl58A6zX7CNxZUjpciXtjJ+cM2i1AQ==
X-Received: by 2002:a05:6000:454b:b0:4af:e519:cce5 with SMTP id ffacd0b85a97d-4afe519ceb3mr17529108f8f.3.1795604663945;
        Wed, 25 Nov 2026 03:04:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm34532250f8f.2.2026.11.25.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:04:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 12:04:20 +0100
Subject: [PATCH v2 4/4] usb: typec: qcom-pmic-typec: detach the port on
 probe
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
Message-Id: <20261125-topic-tcpm-qcom-fixes-v2-4-6fede9a69f6f@linaro.org>
References: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
In-Reply-To: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1f45czPDt1u3bzLaNHt1eXuz+5iiaq/zjhQkgwg7qdw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsC04VV31DPVVFP+uaecUxzqYyftNPG+glysULiJ
 Fas9HG+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbAtAAKCRB33NvayMhJ0dliEA
 CuofRdGhxfaUrmIHtp2q+EsJOIwXNTsxH5bartyRkddMCPtU3HAf28o43pLNaPVg1n8Ju5fidr9Z8X
 5HfT8oNHeH7B6FeR1y9im5P0a9OKy3mj+4g0JS5A6QWpgcfexiETgAmZdG03EKzeIVUhLj5HO+SW1p
 wm9k+Yrt0hjP975aJAOhZW/N1AKi/OuUY0JnvmNlzuHEKpGPvjOCYeS2wmRuZXykKtFZ3MU5vrte80
 aL+KI997a7qaoPGrx356S/3LzSHZxcqoFQRh9pIYRif+KBCbCHqNSaf9xFZOOd1qhsbO5r/s71DDXh
 b77IkiQJMdg7P5lo8svpqJCJJ7pqI4Z7/zhYrh4jcuxkFhQqmWQzN+x4tnknS+RfRKxkGgMcqR5PeL
 jP8VcKKPuClT1dYmt2P+B6tQZiBGK+u+axS31bDKh/wokN/Isi+IC7hXv8SOOJcuDVJ89F6G9iiIHi
 GaSlsiPZcukIvh5eO/yGmCJrlx34qyVRzx7QZshYAvELFx0Rq0tkBS/QP4V9KV7g7/dCabfqeoHbYU
 q6UNYJ1uEluBDIsZ4MgN+o/Zg9Lxmj/uXWx3t2AjJs/IfQBxJ9DYRrlSoPklGLxIk1bTneL3KRPGlK
 uGIV8QUsFVn5tnF3KIxW9U6EpU1fD2H149Rf0sITjfJUt7klZDCbM0p5WDJQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Type-C block may have been left attached by the bootloader, force a
detach longer than tPDDebounce so the partner and TCPM start from a known
state.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index f125ac722e8b..a33903fedfb7 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -803,6 +803,17 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	tcpm->port_stop = qcom_pmic_typec_port_stop;
 	tcpm->port_disable = qcom_pmic_typec_port_disable;
 
+	/*
+	 * The Type-C block may have been left attached by the bootloader,
+	 * force a detach longer than tPDDebounce so the partner and TCPM
+	 * start from a known state.
+	 */
+	regmap_write(pmic_typec_port->regmap,
+		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,
+		     TYPEC_DISABLE_CMD);
+
+	msleep(200);
+
 	return 0;
 }
 

-- 
2.34.1

