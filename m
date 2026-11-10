Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332037;
	b=BVgKVPzN5hVoAh1yA6LEaX3mfDwQjZfxxIPPZnKus/5Ab+yZyu5X1ZVDmo4jqU73sDuT
	 QYxV18pTUn3pU8COQc8OKekTzAd+yDRcaXbZ7GJtxq5Pe1rAiwcP35nozJfedvW6h++oO
	 fW/e0Mfv1axXTQpwVZK8DliR+Ds5/XtuSYdLvzXlWs9kkqi401ZPDnR/bcmiTKYAYNeVV
	 aA7bi7BQRNtE4Wcg03HSrBmAXTrVx38gBN6mjGWK8P29kGdMW+eiZmwU06KsKtFsviGDt
	 /ACYs0kzQRGcFushd1XG/VeqPjhEqZiO5bixEsE+izGm7DztR9O72kyZMjJq8qJWRMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9zqzYW4ru8OeiEnFYJDpvwtnOOYnHBlJKYXWpDNw1es=;
	b=M3AiTMvn9h8nw3tlEDRklt09t5W+LLU0kpyZTEKSP36iZHH0LACZAPG4j2i7cTq4KX4j
	 yeS3tqtZ/IbC+AGGVsceAw5VuQx7lkABxk0lcCH1d8KGP5LCG2iJLCDAjErlTW1p7Vdva
	 BTnNwtAGZuZDkb6ij8UmTXVj5B6OlGM7BBC6zsPVJ4OGXr6dsoBluRr9AKMiPniWh4I5c
	 5NkCf+PdGkBNdfUkg/k+nkTtylLSTdF0EUNP0TY8DImd3IgZ08Ftax7ytlKlBm4Hm9GUE
	 j+50YYyJv4TqpLHu05+0mR4zZODrjpSTRUmtxECJ4pBntoqq+z2wUZaMi9DRy4HhyqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyRphzfn;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1692606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 17:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1692606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyRphzfn
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5363c8de563so22973111cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332036; x=1794936836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9zqzYW4ru8OeiEnFYJDpvwtnOOYnHBlJKYXWpDNw1es=;
        b=eyRphzfngUXPZtGUh4ciZsqVuoJdIbbdOdc0R5SX4iJRArgXjvj7ITIGNm60b6Oyub
         1d0WvouKJHWbAXnc9UddDTEIQnpxJoWMEuZuw2oGyvmrpQBJdVVF/qVFsyz/bME9anR6
         OdZNGDp9nwjuMGwdY+YdfbeQU6V/KEGUg4KKdwMQpZwzQdAEMY/o1SRtzfxbSbMp4DSF
         1B6fC57Jg99jAvGZBDgxsx7IY5krV6bNBcK3owZKjk0rSnQcnDMzRs+XjJoxzwWGBMQG
         2hjuAIoMXqtnbo0kRBwkygFhlkFBkrZ+vTP/ijTQaIrfOrQySqzRLsVdoj9jbIKdX0WD
         OZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332036; x=1794936836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zqzYW4ru8OeiEnFYJDpvwtnOOYnHBlJKYXWpDNw1es=;
        b=oPU6BxjyzSFQV3/1v5cK6/me5MBrMrx51dwaWPuSRLJjLEPf0B1g2vWInUtvgNO1+f
         HBnLgDqTBaV/2PYTh6uN0mITsSmAaMcM6cg9tKau1WXdF3ea5jskBvyDr6r3MfZ25Vq4
         dJQCTPm55KjsxSzUTZzH/LgP5hFOsrovZTS5C0ccToZWRd0nBoHppk+/NoNwTPQUolVP
         vmVmteg1sGacrPxlVTjlYXRL+GznvJNHFh6GZoIXQAKoWkmc84Nu9wpair5smz410M9c
         5MtDNvRfry0k+keV0uwQ2/dv+viq4P4A3fLjDm18eGHx3xBd/NQ5RS+pO8jZACMUQ5Ns
         YClw==
X-Forwarded-Encrypted: i=1; AL+hErEIPUN9eBZorlUGYdmmM/cc6VNk1In3WPRr4Dxd5+5MNKihoYeDxit6PH/SX52wqsayW9nBZsNu+L/H90kW@vger.kernel.org
X-Gm-Message-State: APuU4Z9CaW71s86+DmdT6YWFWDMDDFwt2I91Rndvq3g0SNAI6muDvRJU
	QVwOi+kEqBKF0ea5QNWB87n+//8Zcbz31tb59YfB3bKyBMby/zOSAPvH
X-Gm-Gg: AYBFou2MYiCcwBQNn0gMhneyIG1Oqx+nKPjlJKVNmFRxu46MVRm22d3+F0e8FaQsWOj
	9WpMGO5P/bsi1vz/lGyz55xiArKbtkQxsXxKc5VnaYRNFaxuU/A7lDF0SjUx28GNox0uyvj1ddX
	4KHFvdYY8mei0t42EH8zOTNySpnKXiRc1erIr0c2k/hf7d1w/zfihi73/cdnx2zbzQCMOudcv70
	pI/estm9dbzsxh2FnbjjTRnljLMratc4ABSefKN27lHC7Fc9SS1RLE/upskgS+T1XTvI9SC4z+V
	uwIr0/rioCMK50NJboBfoCWcOYQsNPc6XwLOgCgJ74trgCRYn1NTpTkl0/n80RPmDxfplgr9mmL
	8PoGDDRhqgSYO28lSycZ/gymGzWHPcXk+Qohz+Xx7pPcbogvVZbmBNsxR2uOrlKm/cyzudv01h6
	gNx2DiTfUnY0iNLcUvHumdEnfT2aG4/T/V5DByfFNcZNoOeVL/lYnF6Cc41cSK94eLvIAKwLPhQ
	/JgB/Rq5qDyb7VDwWc+AYsc100eaLCp22SCCN1U1tW5ecZi1x76GC4tf9Ks7tfJpZRxGM5hTSJW
	SpWFIUO11fP3mSfqtdz1EEtgwGq7iHnNsY6pYZZGlxtnCe3w3+Mgj/cGWWUqNgF6wwHsFx+Hiy5
	QWZZIhyL+NCSQALULStvEPB4LHMpREan/Al11adEZM13qJ0Je7/3+xqVaZqw56NmCqjsS9Kc/90
	fGlRoJcX/NIaqTtOlSG6aJA14f0LF7mGv4HHq0tlfMW/A5SSJJDFS9syAI0H5bnW8clpJk+guMJ
	EQ9/lUoGZ9RZUby/V9TFbKJjO2SMEeyZGw2SL6/tCEKuQ==
X-Received: by 2002:a05:622a:1ba5:b0:535:1b50:48a6 with SMTP id d75a77b69052e-55525fa6c73mr51407731cf.6.1794332035626;
        Tue, 10 Nov 2026 09:33:55 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555065e4ad7sm29130471cf.0.2026.11.10.09.33.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 09:33:55 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Herman van Hazendonk <github.com@herrie.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gdsc: unwind power domains when registration fails
Date: Tue, 10 Nov 2026 12:33:54 -0500
Message-ID: <20261110173354.41274-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gdsc_register() leaves the power domains it has already initialized
registered with genpd when a later gdsc_init() or
of_genpd_add_provider_onecell() call fails. Callers only install their
gdsc_unregister() devm action after gdsc_register() returns success, so
nothing removes those domains, and a later probe attempt initializes
the same static struct generic_pm_domain objects again while they are
still on the genpd list.

Commit 86b23609d5e1 ("clk: qcom: gdsc: tear down per-domain genpds in
gdsc_unregister()") made the unregister path remove the domains, and
commit 16ba98dace9e ("clk: qcom: gdsc: Fix error path on registration
of multiple pm subdomains") fixed the subdomain part of the
registration error path. Make the rest of that error path match
gdsc_unregister(): when the provider cannot be added, remove all
subdomains and domains, and when gdsc_init() fails, remove the domains
initialized before it.

Fixes: 45dd0e55317c ("clk: qcom: Add support for GDSCs")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
Tested in QEMU on a 7.3-rc5 tree, running the real gdsc.c and genpd
with a synthetic DT and fake registers, with failures injected at the
first, middle and last gdsc_init(), in subdomain registration and in
provider registration, plus sparse arrays, explicit parents, a device
parent and a pd_list (52 cases). 36 of the 52 cases failed the
cleanup checks before this patch; all 52 pass with it.

Registering the same objects again after a failed attempt still
reports an existing kobject (-EEXIST), with or without this patch;
that looks like a separate genpd lifecycle issue.

 drivers/clk/qcom/gdsc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index be9c14e..8739293 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -647,7 +647,7 @@ int gdsc_register(struct gdsc_desc *desc,
 		scs[i]->rcdev = rcdev;
 		ret = gdsc_init(scs[i]);
 		if (ret)
-			return ret;
+			goto err_pm_domain_remove;
 		data->domains[i] = &scs[i]->pd;
 	}
 
@@ -666,10 +666,21 @@ int gdsc_register(struct gdsc_desc *desc,
 			goto err_pm_subdomain_remove;
 	}
 
-	return of_genpd_add_provider_onecell(dev->of_node, data);
+	ret = of_genpd_add_provider_onecell(dev->of_node, data);
+	if (ret)
+		goto err_pm_subdomain_remove;
+
+	return 0;
 
 err_pm_subdomain_remove:
 	gdsc_pm_subdomain_remove(desc, i);
+	i = num;
+
+err_pm_domain_remove:
+	while (i--) {
+		if (scs[i])
+			pm_genpd_remove(&scs[i]->pd);
+	}
 
 	return ret;
 }
-- 
2.56.0

