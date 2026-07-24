Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10013EDAC1
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883864; cv=none; b=DeRw3W5AXF4Nesem6mSvjS2dIo+j/3J7yQB2x5VP/9tzSRVLQ0fi8qf6dnLpw1rLGjp2mL6be1aV1GdEEP7TfLqk5AFshjWiBwV26eS8+EUzBOqhNCt9rk9hdkt4Ou9/ueDOWHExSZAYC8Zba5RDuG7bOysLGOsL7BgzqRdbQ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883864; c=relaxed/simple;
	bh=c/HyNkuMW4z6Zoljb6+iJsr+eONkoiQ7+lwzLTi5cS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZPadYSFDgrOdrwqTCcnkj6PUjAO11KjtLpfApaNam2YxY0zGJVjM7tWlIr1fB88AxUHzoEvNQPyZDvavfrM5BvyHd/UCNX/4TdhqKCmlvBlBav0kJIr0KjEE+7ieaP++p5whVsDnoFoUlAXpgrhCo33Qfu4r6crYHtNTdttcWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KnpPI6ay; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KnpPI6ay"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so170727f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883859; x=1785488659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vmy1hUJRw3q7Ic7Vi7VoynD2pQqL5T8Kb7uNyjYlj78=;
        b=KnpPI6ayep6sTgfKaukD7VxQ4Nla21VYH8uCz7uebb0QbWpmf0FqyV2l09TZH0EufD
         76Og+0fDWs3tOxpN+quZknMXYnJnseZiQGB/zyTe2MYBuXRWv+KBGHezflrMSby42ixh
         93gYxX8PP2bBBTFv+qPXLo6PCL7CuNVZZO4+ofezFboyPwYITAle89Zz22rH118r8uNe
         /FsQqS0NonR8fI3+jWJQ/V6ONJK3fPRT2Phmfg3SasgPnv+yB1KmvKukpL6tS39mCLDD
         2uN91zDPInYPf7C0GIUDBiB18XgboelhzdB8C6tDtueWeSSGtYvn+BpU7scI6fiu2vdK
         3qLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883859; x=1785488659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vmy1hUJRw3q7Ic7Vi7VoynD2pQqL5T8Kb7uNyjYlj78=;
        b=gxF+boZZIpyG5LXWp3HrznIldz32GLdGBOmOrjhMGY9pM9wueaVhMjWgEpYTFMqaET
         H409rGbXeXlcwaB4lgKXM8dQbcIzrs6Vcs/ImlIeoH9udLsA7n7BRTeJXvTZVBeg3mjv
         qlIxR3nttvZy6EeCtsQh/Vmh86k8j2uVKGOdgP/LY6IY3mW158xR08VRftcMGSs4AkDh
         6y1CDfyLTw8PI54haxCzw91m5Xrjle2KdZsPVSjYKYeRZsGD+Zd0gCJhHcximbc+pT1F
         3fcpsSjZIK6b7jLfscY8+u4zMH4yDZ6tKy49cFm15uXLETSWEiaD4ltYfFSoXHUBf70/
         4x2w==
X-Forwarded-Encrypted: i=1; AHgh+Rqc2UeJ8QpFSgybR1P9CVZA6nz08Mzsoww4+VzTMT6TYZdyOGl8P5x+K/JeGi71eAdtw4lcEzxduuEmOkT9@vger.kernel.org
X-Gm-Message-State: AOJu0YxBErCvuxeAXigETPImoCsXLBxGnvu6hysZDOb4cei/S3GGOxQr
	78PbR7l9cjOVDRMXRvqZGofrv4xLZ5Tm1uc9HDuRBY33AWaUEoTJtyu4e83jPMZJ0WE=
X-Gm-Gg: AR+sD12MAm2EIeq0DoKtE/YjlojIspZHhOXSeTItpgVa6v+hTr+gNDD/BWX4DKQQ1cy
	WuUyS4iS25yh9kGt6TEEUK9NDQJ/EioDPPrrE2UZPykgAvwF261IyuaJ3f5G2JbJy8x4Ztq4ke6
	yTLRCcuxP7SpsJLRlw7SalI3N6aczWrYFrlrlT4GORpYmSgAPEsXQJfzh9YVBdYyDEtay1+BOx5
	tPUc9bceUrV9fztoBStEGu0+byDIANcSs2eR6EyFFOqsYbvYOXu1w1nTO35O/N13gxgd1aNmhUD
	6xgh/riWlDQL1pWahxbV4H3iuIPOtF4vLKduLwbQ2YStQhUe2gsbDS3sy6fCH8Rq35xB6/dr3AM
	Om8zH+qhqIpotcsfem8tWRFaz2t3nszSeiQoVpDpQOd44TYrRnOXlpWiRVaDn+gn0UU3cCOTGi/
	vh
X-Received: by 2002:a05:6000:230e:b0:47f:7b85:b883 with SMTP id ffacd0b85a97d-47f8d761973mr8352142f8f.47.1784883858984;
        Fri, 24 Jul 2026 02:04:18 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c66cebsm21940318f8f.30.2026.07.24.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:55 +0200
Subject: [PATCH v2 4/7] clk: rockchip: clean-up simple provider misuse of
 the consumer API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-4-56f306156d25@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4291; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=c/HyNkuMW4z6Zoljb6+iJsr+eONkoiQ7+lwzLTi5cS0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqBk+IBpzMF96bigh65kKM8JR3kcYzjychCK
 YLz8MopaNCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqgQAKCRDm/A8cN/La
 hTcYEACzcSp51w21pbh6PuxyNr24pZ3Nv0ktAmcU30YtrNSoWzIKyhG/R/BUjOJjBIIM5fEjFsc
 I9Ff5FAQ47iojQ4xWTuMQEcie071jy0QoM8sZvfgO3exSwBl/WWTEC9l516DlVG6FykYt/yiYG0
 fESTr3eLuPkGhtarCnMF59QHA1lB+1HVNk40mVHJ5dz+EME59MdLhbrnh435AVGYxb21++PrMvf
 fXl8QabMo7nUrBlCln+T+1yUy0aHgunlcb9vIs5Td97hFAR0L2q6tIwjv3K9bYWeYcSYrlSV9Wc
 gt5WNE/fchVqJZI0ZPhOtLKzad6Cu6aXOLhv69hNyKT+9GIwIwyK+4mw+ISAGRd8zb3vPCllp4U
 /pQ4MOOYcf6oi+Fv0/Yn3ZOckXomugCwNDcfDb/TnWO5TiUXdvF4oYQZe0C7lXTJIhFJX1zuX+9
 WoWxbbbYLUVtPOzsJhyfWuvhiMv1GGbXU7b2HIhPdIfKSWDWfQv6VnD2+xoIlyX132umga2yB2Q
 v9w5RJfsUI8Vc6vB8NBLI6MioQO8IyScg1hUX4E1jxa4XOV45O+oij5ex2/lBBPbc9Px4hdWu9j
 28R5oywcHI6hLv1xI5uaq5AXKff7NgVRPDts1XPF9B1jzy6mEX3cCtFYAE7+KpznmpEfEWXEK8b
 5KcVQbKkgbR7zJQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/rockchip/clk-pll.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..89a783204f0e 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -259,13 +259,13 @@ static int rockchip_rk3036_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	const struct rockchip_pll_rate_table *rate;
 
 	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
+		 __func__, clk_hw_get_name(hw), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
 	if (!rate) {
 		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
+			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
@@ -319,7 +319,7 @@ static int rockchip_rk3036_pll_init(struct clk_hw *hw)
 
 	rockchip_rk3036_pll_get_params(pll, &cur);
 
-	pr_debug("%s: pll %s@%lu: Hz\n", __func__, __clk_get_name(hw->clk),
+	pr_debug("%s: pll %s@%lu: Hz\n", __func__, clk_hw_get_name(hw),
 		 drate);
 	pr_debug("old - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
 		 cur.fbdiv, cur.postdiv1, cur.refdiv, cur.postdiv2,
@@ -336,12 +336,12 @@ static int rockchip_rk3036_pll_init(struct clk_hw *hw)
 
 		if (!parent) {
 			pr_warn("%s: parent of %s not available\n",
-				__func__, __clk_get_name(hw->clk));
+				__func__, clk_hw_get_name(hw));
 			return 0;
 		}
 
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
-			 __func__, __clk_get_name(hw->clk));
+			 __func__, clk_hw_get_name(hw));
 		rockchip_rk3036_pll_set_params(pll, rate);
 	}
 
@@ -743,13 +743,13 @@ static int rockchip_rk3399_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	const struct rockchip_pll_rate_table *rate;
 
 	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
+		 __func__, clk_hw_get_name(hw), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
 	if (!rate) {
 		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
+			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
@@ -803,7 +803,7 @@ static int rockchip_rk3399_pll_init(struct clk_hw *hw)
 
 	rockchip_rk3399_pll_get_params(pll, &cur);
 
-	pr_debug("%s: pll %s@%lu: Hz\n", __func__, __clk_get_name(hw->clk),
+	pr_debug("%s: pll %s@%lu: Hz\n", __func__, clk_hw_get_name(hw),
 		 drate);
 	pr_debug("old - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
 		 cur.fbdiv, cur.postdiv1, cur.refdiv, cur.postdiv2,
@@ -820,12 +820,12 @@ static int rockchip_rk3399_pll_init(struct clk_hw *hw)
 
 		if (!parent) {
 			pr_warn("%s: parent of %s not available\n",
-				__func__, __clk_get_name(hw->clk));
+				__func__, clk_hw_get_name(hw));
 			return 0;
 		}
 
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
-			 __func__, __clk_get_name(hw->clk));
+			 __func__, clk_hw_get_name(hw));
 		rockchip_rk3399_pll_set_params(pll, rate);
 	}
 
@@ -992,13 +992,13 @@ static int rockchip_rk3588_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	const struct rockchip_pll_rate_table *rate;
 
 	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
+		 __func__, clk_hw_get_name(hw), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
 	if (!rate) {
 		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
+			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 

-- 
2.47.3

