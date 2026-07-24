Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B5C3EE1C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883866; cv=none; b=MV8SmqgqBm4LUPIDYYwk+cWECGdDDuCvRW5/v9MwY/gZkm9yOIiJfIWr07dI+2WTfZ+Bk5ZaO4ir73YR0bYpk+2LcXrcTR6X7zN6D4srNZiEICXjUgVzK83Rv1Yw9G6AI6gVVZRNs3K0YhjLb0nbq913XxpAMMIoCqiNMVyuTOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883866; c=relaxed/simple;
	bh=avXrZ+5B5tjwtUKvf/CVoHvEaPEqaWPpS7ZwUFxswLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7bbEL6EnEu82Ka1701ibk2ci/WLNlJQfPdvbdepTx6EZEhjROjeaFLogjBVlHJRDPXDp34nqXeSFtNLE7Yf9Z/V+WcrS+GxHzO9AYNAFw4cdI4rHbxZRJcICwK+jP9s+mbHN5498ZnDWxZJBJU7YLNYMhWtlmKq7AL+kL7xydM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PdbonZ0+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PdbonZ0+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49571fea44eso1295725e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883864; x=1785488664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQnvaHgupyGQPniAuZ9m3sJLh0U25N0HAPnxpHfI//A=;
        b=PdbonZ0+K8CvkHkhmfNPZRo2SIl1mZ2JZqCEwKmWZEW1/AXWUDKVls26FrII52X6D5
         Ye3CgwEzYbI4RlWOxvtjcZupLhHMz7mLbLAcXPx6bC9BcRRovILbcVRMxc9Z9IyzwTc1
         ymrwyR52g/fL5XL9Z7lg5C0wql1nlpdbubbUXmmHkmracWnCIvI7SwhBu9dKtnyBnu5q
         hipsLOiNpW1VVivIG0wg9Pidqvf6IHfADcVLu0J+4EMcoSQSBp+yC3rrJ4ool9yeJPDl
         VGAUZBYslSd5mRwZe9DSj82zHpltY8tKnvudE844gcdU3OOjwvsqJ1p64eTBayuJhHcl
         9mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883864; x=1785488664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQnvaHgupyGQPniAuZ9m3sJLh0U25N0HAPnxpHfI//A=;
        b=tBDOFCt7FnVbe+2v0ovMtyPGyCgphMVFIJ+L8Qmq17nNLt4N4Javok0mPbKCQZo1xh
         Q1G3vdQNJxWDSdVKdtB2e34u1b1NkrO9DPf6K9mfAhUTJm62qtjykMFxmFyw+QlZyYth
         5aUo5+FRuydaLSU8SKeiNj3ORLRDAcmKu3Fz+lVrMg4iL4BWAgm31IWuGLUxy4I4i603
         NaJupmH70KHsVO7HHrEjLt48snjz4eExDubLSiDKsd3kKlWDLVC5lIpfLDeX5GwzaFc5
         ALIGLUHGGSAh5cwVlxhncw/Y6mhlo669EJk2guVu7sVUQqtKvrsV57hPwYiJAbRhFWNU
         c6mQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUNEmFesWzfr16qAdXQuRW/ppI6lAZdIlXYcWNmFKoXpusR9CDkv1j8DWElVWj8mYcNEf1xXJu5eNn+rnD@vger.kernel.org
X-Gm-Message-State: AOJu0YzSP09MQ+nhLl0yfIk+Oj8ykwlWGEaGvY+0w7KptkfVPWEuyvWH
	vQI98ECGZ4q8G4tHYMGB3Q1uUoBYXoMkdzZ+vZEDgdPIEevbDJJzv39UlCXUdbBTOR0=
X-Gm-Gg: AR+sD13bUciqLhm6Q0SAAhQk/LdAfcnV/GpujlMEUGUGJHacYTqWc35Ea7+sg8S2svd
	efOXNlersnFGD/cJ5bVL3lv2kbLNAFa2KD+lUMvxJ+OWqjxfHFV9KwITVsEFq8XbRf0wDJ4G4VX
	tsBwPItKmQn9bDkB8WrGPc5A1YLQXkAIJK4j1RcERYG1SOvltZA7bYMFF8egR/MlA5ED5JypKEJ
	dnlxviLVXATJPj62aDcCL3b4dFqcHTWy2gUHLip814cTZvPcneYYaenf/1i5smEPkN0FprjsNLy
	jIhi20N1VMMGDigeO21gRuPExVI5xIh6ZAcZnERP79IHwKRNwRFS+7gyHndfip00bvfnew/vr1D
	bBDz2MFOxn5AxnCP+OExuClJ7H0qEvz360Md+5mtqxv9q8Au4ysocBlbRZeobfm3Ma8ova4Ls+J
	WJXdGU3WVo+EA=
X-Received: by 2002:a05:600c:1f92:b0:495:4c62:9d43 with SMTP id 5b1f17b1804b1-49573d1ff7bmr72020495e9.34.1784883863694;
        Fri, 24 Jul 2026 02:04:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957af6b049sm62081735e9.6.2026.07.24.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:57 +0200
Subject: [PATCH v2 6/7] clk: tegra: clean-up simple provider misuse of the
 consumer API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-6-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=avXrZ+5B5tjwtUKvf/CVoHvEaPEqaWPpS7ZwUFxswLY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqC3CQlE9ZZIVg5FO31DSHE8VYccHPXetZHC
 CBbG7T1HaCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqggAKCRDm/A8cN/La
 hdLjEACXqz7q4lL8DurbW6pS/HNGz1tLg+/2ZSOd2a7o3s1z2YOBOJHX5vpJFLW/nIYJQw5So1e
 bjWoWmm6BY5JCwtK8uqJ2bemWRXcpKLvIlUZY0FVmgQESFPtFI6OdwKwVPkWbdp0eS6LCSh/q6G
 JuMStoA3PBKgBu53Ve6ciKUHdiiBoMmgvHq0BSCaqIGndaJkgfdg4XuoiI/jJm6AzgtMB/1nUqs
 jbtnez8Ei4l7beEGIPt0nkoY3Nkfb+0yB+/jwtJ6N0qPr6whsRWIHOAdwMqA8Iq1+REmschxKZG
 rXPy0b12PE93ipjZMtunqFaT6XGz/iBiZRfZ1C5sGRIKSwh58YEZyIJDtz4lXRKejKn9ziciY/R
 JzXZTezQ7P2U3Wzw8rE957D+tus8PvY0lrAY8jzO6MQ6Xm9T7WbR6OP7GtkdQMOKn0NLEShvhbe
 oVzeAVhbWJXuikQDeKeq6wN+DATSFxT/BCw9z1g0PPQ4DuJoYiOXw0DbuoIL/1ar9IvnWpzAWzv
 +YYi227ullORrzbQ225A5CHiau0GS0MokdcCulaJSeznIQwGVMkbJy6v0tlxRii8q2Qtb9CCoQI
 rqGyS2+E25eCLne9dNnKOrjnKPB1NUFEawcRFsnJ1o1K+N0G+eiJ5YPh5DcnSVvF1h1Kl0VzA/E
 k1+4dgdZ/1iNGHQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/tegra/clk-tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 0c86cff719e3..df1d7b471745 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1460,7 +1460,7 @@ static int tegra210_pllx_dyn_ramp(struct tegra_clk_pll *pllx,
 	udelay(1);
 
 	pr_debug("%s: dynamic ramp to m = %u n = %u p = %u, Fout = %lu kHz\n",
-		 __clk_get_name(pllx->hw.clk), cfg->m, cfg->n, cfg->p,
+		 clk_hw_get_name(&pllx->hw), cfg->m, cfg->n, cfg->p,
 		 cfg->input_rate / cfg->m * cfg->n /
 		 pllx->params->pdiv_tohw[cfg->p].pdiv / 1000);
 

-- 
2.47.3

