Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44DC3E9F8D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883858; cv=none; b=VOwubv3LHanVZf5Es5Wwu9X6IwizuSIKADUP0+3DBNC+6yZI8rJ9ZDsOMsoOE8h2KwG79lkJ1IF+5S5y53nDusx7Bhc+a8gaL4KVDRJQnm8q/HtiEuuFHqp8lQd/ayGHErIpJrpMfKLfqHjThSuwCGJzWgdMClFFF024g1kQpow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883858; c=relaxed/simple;
	bh=hQqUrEC2ohspZ0Q9n+8GFiTuvpJJRj9wwBmEqNtW61Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ftANrG2dK4U580NWvzKuTa30OVwUjz4Cm2ghwletS3KHWaGfeyXiHxkv6gdmsB/LVWAo6uotX+wnqndz8vg9fyumtU8TROIVhpF8xcqNvMZ7FDACo+XF2FqnBHx1QrHfh4vRJT23KRj5atWVPvR94O0zXdgJBDHcuJTGqeMzGrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ihwT1U2v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ihwT1U2v"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49553515a8bso2482305e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883853; x=1785488653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQddTTwM0k9Vodyi3BYe9DGecCKk+Ahu8ONHXQFEWIk=;
        b=ihwT1U2vERNgmq8OkhP3r64gi/Wd15vCPEjbi4qwf+12jooaygoYB7cVbAnZDClZsb
         7YZNKYqRAVTVhBgfQGt9AZ0PuuJxRyeSkI7dOEHaVVnNOAUR34f1MOm9sA4ejxVYpn96
         fk5zYZ/2F8354gZlBud3fddgMySk2rKcw/XN2u9P4M+e26LhCcvBrzFvb1bFYEFNx2Ly
         fQF5P2SzSVGCpGg4vfww00WsjFOaQdgj7qmBdVejkgHl6A0vTdbKGhDtFKjnSuTggdGS
         bjETYC3BSrUesynngDcJTNs7ryso6d7Sa6gAJECnMbhzrvsSf9EDoBbG8SFCkod9i/UB
         2XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883853; x=1785488653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQddTTwM0k9Vodyi3BYe9DGecCKk+Ahu8ONHXQFEWIk=;
        b=s7efYS4B5RZlayPrqvtqBmVUnd2LlgBGIXDe69YLah98srLLDTAOlBer449eT6SM6D
         xCLKP3ml5Kia5nd2B3ZOGzLSxmQjuIRruse482XJwGV2bRyCg2dU/9CmwvIHSkTWqpMr
         b0dKqLnBVkM8FCw33O15iM6Nxa3pnHVMKG+JcPyJ/yw5k16yQTmwUDtsAl00Do3BR0zK
         7iOEYKcxCw4jscnKJ9gmcKn+3kBC/smchwdv5N3cqjgirawlqZlyQkgjywoz1Zo1SMSZ
         /6agxt/sGwmUEMeJvGuTwaImrieVRRutEny2FuJlyPkak9amNjuIvsjaRaUOLz1Qy95G
         hDQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rop7WpDVluvbdnpZYW29Zllgo4+XLCys6a22Q947/4V667PDl4eAjbWzMqXU74cUb4fFHrwVLqGmSv5fyA4@vger.kernel.org
X-Gm-Message-State: AOJu0YxYLKV0VU6KLkPbJTwVP79cC0DCrDZLC85WlqPg6BsW9UHD/YGR
	n5HxR7ayOhkR2lGqhwKeY1K8N4YpuGV2GkVuLEG5kP5Jl39cMorJmoOqju6mtUEM1Nc=
X-Gm-Gg: AR+sD13ysKzzCrWN6ht9MI05XNb3eWHUc/j5QGH6TeVQjBWUt8wqVohqlDdJAepmu5/
	bsDujrMKeITSTUHIssvcLvRUF0SrX9YSKJHhWzuH2nhNMQ7pEcuogw9me80cgzX3Rzumr//3eB/
	R4UIzDh84zvWrDn+h+GvmJH80F4XgmnCPzV/j54M/OA4ZjHJwvD8j+l52MQxlSw8CzKlwihaL2u
	cd8Tk0uJAk5Ea7AKJXVMaX02VsNsfnVi0Hq1572Dnaa4Iv1tZKCLGhE819VVQArXX+eQWUvjir7
	KaSGvilPO+MEjbyG/98Mk60cMZwoi2EW3hOP35A1f0yFrXnYiN/cF51BR2EuxB4cEHgia7wllcE
	bEZWbWdwZ765Ir0GP0BeulmI28rOwmvzfuX5oq6efNEPoba2g0RLA4Criua4JiLIYj85ecOPLDv
	Af
X-Received: by 2002:a05:600c:e549:20b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-49573cd3b43mr48859445e9.15.1784883852904;
        Fri, 24 Jul 2026 02:04:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957bfe07e1sm35606965e9.3.2026.07.24.02.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:52 +0200
Subject: [PATCH v2 1/7] clk: mvebu: clean-up simple provider misuse of the
 consumer API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-1-56f306156d25@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hQqUrEC2ohspZ0Q9n+8GFiTuvpJJRj9wwBmEqNtW61Y=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyp+rKhEixzWUn4GUS3MJXwAOFpteD1zvevAe
 vX+e+PbuPOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqfgAKCRDm/A8cN/La
 haeCD/0dnjAZeXY2CBNgE4BaUBWX5Y85pENGGuWJTOPLlhZwKkcYkteVXrm5WQpjWWk2HLratFs
 N/arQoP5iOIbdrCL5vpNiL0tKLKbZg6NceVOx6srjc60YNG4QAdLsmMg79jtvQKSecZ9158QZxC
 fr8w+NEDgmnPFMCMgbVj2SvzOyZ1Cb40NKO6vxdwjIrp38SyhPTZ7+ADTI2igbjGF+W4wCNvxUW
 gO0zR3raB3g3p2hn0vnBPkP4QNE0TCARKcdoIm3IBfaPKubO5D8gdpYgh2P4A7wJBeFcnI41jbN
 rWUfUcRonDj6ae0rBIbKn0c13thuoE9DS5Sgdt1FCJ19LHFfYfYwAqBpZ3d7dOytru1/VmOWXj3
 sibrRsKv5DG1OEavYxvU9198kc2EbOyPd8dxBbuO5iTxuS28A/+CHc3xb30thhMowe0FeCB3f3s
 lDTgGxrXx5MrvCwOQL468XgKyTtifJ0vDuB4HyXkW2kQZYxSLf+m51vvKKEHnu+ObnjX5K0ZB/X
 NhFwei8QjV715D5MQjr0e+zn/WDksHg9wWQh0CNelYdqpxeAcML14ERh1MLxnokOvweTmnivysM
 5pLs7XFWLWGCvva7QHRFdHuLxdWFHhtFZ/a5aEy6XHta5USqzKuuwlOLm/aMUbAnsq0gENcoqVx
 8Mzt8HjQPHjqRCw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/mvebu/clk-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
index 26d52ecaac50..24196e288fe2 100644
--- a/drivers/clk/mvebu/clk-cpu.c
+++ b/drivers/clk/mvebu/clk-cpu.c
@@ -153,7 +153,7 @@ static int clk_cpu_on_set_rate(struct clk_hw *hwclk, unsigned long rate,
 static int clk_cpu_set_rate(struct clk_hw *hwclk, unsigned long rate,
 			    unsigned long parent_rate)
 {
-	if (__clk_is_enabled(hwclk->clk))
+	if (clk_hw_is_enabled(hwclk))
 		return clk_cpu_on_set_rate(hwclk, rate, parent_rate);
 	else
 		return clk_cpu_off_set_rate(hwclk, rate, parent_rate);

-- 
2.47.3

