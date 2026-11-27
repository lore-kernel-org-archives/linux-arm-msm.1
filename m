Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797302;
	b=Xhqnf0ODilFhT5cGbt5ROLsA0FdibX4+63hROC5dh0IIjL6+bKeSC9PRKvBWG3y3DewW
	 UogNesEpOE3J0cgew3S3bodCPxSs2xei4b3SrwD0llSZLxyjGy7cMoM4V6IBEFmyFv2Sw
	 Q9eFup86Hnx90eFWBu6IOtpCn/rpI5LeHFI1pRkOTi0qf4UAstzNwLdZ7S+YfFuiTRKHF
	 rA02/4t4ekeg07lgfU6uB7hZzA8qcKMjJw1J8RrY/BoVkMlq8agoZ2olzZGHHnzrYBBPP
	 T+/FBeycgNYub58BEh3RDhaxuwWzqEjMDo4nPtk5u9DMiSMXuKufRW0wbckAXUipKMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=08/+Tw1oVd8ocLS95JJDAmqhnR/TTdXdQcTFOlKFwGQ=;
	b=cQzexKJ2Z623oSR10CdAyHLya62nvN8ppMh4orMBLWjdAJS2Flk10aExX0u9i3hSTJWl
	 vbuP44CJoMKZ3KJQ6ZFgcpcJ87QftS7wHbWDfmSRubUFYD3rlKsPZK5/lZvDcF54PHcWA
	 hy9NcbajuhOw9gPcos8+ziOLeT+W6ZMpZVPfwiaAW5NnoWm9bBaE8PYiss+sHUE9Fz77U
	 3836Uz0ktRZRU2PL8VpqVr/RIywYY+e0xJr7z7jPG7nC0GbGQUUcvodhAdbhvHRHETb8w
	 1vdTcBCkTlNpqDktBBZueYR5unzxLcwCAzXPExy3awB7rXC18McJ10c3NgEtFfnJ3NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HZ/x4nYd";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F4D606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZ/x4nYd
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f07a960666so59057005ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797301; x=1796402101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=08/+Tw1oVd8ocLS95JJDAmqhnR/TTdXdQcTFOlKFwGQ=;
        b=HZ/x4nYdEFjLN0H/Y+nuL/VXorbJWVqyhL3/AaIpw0FNAqNJtW1POFVnP2dIpfIPHd
         9RddiArK4HpszxhjFlFHVN5yeim3bWwcMl6xYbTU++uhfWqmaHBgcv1QbPUU+RLp/pz4
         QkCp5Cn8IStarn3NL14VP+a7hj5Z62BucX9IXG93eGN8fBQltS/m2ixPEDXM7SDEOZsX
         /QeW1fc2SFRNihMJYkjEzWvWXsp1nyIdkJcFHTlc2R0cl5A/hCHzrNx5jvYEJQqEagjp
         9KBFSk4v8oTLlRP5FIgdGzEDca7+1Tf4mgYkK77ejnJlklIYhvsPScUR4kctdeeP9n8q
         myOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797301; x=1796402101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=08/+Tw1oVd8ocLS95JJDAmqhnR/TTdXdQcTFOlKFwGQ=;
        b=uN1HU/895iiAMUstXhcgjqJs3SiDxn3P+iqX/lsVVPqa7MrlTZcMKClP9BQhTEzaCs
         DNiz6E/ZLZPWYJ+unBIwfq+w1G99wk8gsQNBWGrDlFu+rDLcgDeWaq6ASJqjHTJUKDEJ
         YxLV/YZtJm528N+banpPo1dHtemftdkW5+73ec+0XBbwt0IUMvP/tlWKnnbPwIAwu/1Q
         10hR4ess8saRUokmHngI5MFH298O2JzwErPW/CFotg/PA9Kb61MgnfPS10/+9h40Y9wX
         8Z26la1jG+h68rWplwHrtgpST2VcGUOC1Uf+l6P7oZ+ON+AxqoKTUGb1SHUUX3TX4SxJ
         8nhA==
X-Forwarded-Encrypted: i=1; AL+hErHl5dRWUJYabD1CB8derIIZW8K5clqMJBPL5g0kkLXAGBCyfle3XhyRV3GPo5u7NR47Tkr+0vM5Hh3vQWbi@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZvXZXmW5yyiijWLR7odhIhtf52tfKZX0RT5sXq7Q1/I27DSdi
	GZgUMgy5NgPfwakzF7itCCnmje11yOfn6b+x2MoYvKtzur8WL0iMRX+w
X-Gm-Gg: AZFdTZf5kwHWPN5R1asOjAbMy18tr+DB2990G9wtGjcsmmEOss1I6niWJ+wJxwSkn38
	lZYe5REPHx9AJ+FS4VZtjH1lXLNYdrtUxCx9XietCXFCmpLv+hAO6tBG1V8N16lTkiF/fdM3xMk
	xXzqgPBWZH9SdyiXU0RmkMsKcxtSRVF9phV11BcR5jEMP5D5klV4YffhQu3ISjaZ2W2lefn/LQX
	VySzz+jkQD9LdAIKdpakeAkE8fMMOtP8+t3y2ZpUF3dr3ly1PDttoJ6OzkJ9PbrhQipc3++Lld9
	ZlR4Nmiwlu7bm6kXjqrG6HjcxYULUOJFOcZhTpYOlY5jolsoIPMuHlaaH1PHcAnXPQ2YxZSg9Gi
	5DNlACWplF59XvY/GKCHQU2+XyXPO6tjJkE1MI1FoRuRmzukHX+B0kkX6TENiU5hvr8Iq6V4Rcz
	ZNEr7Bu3bUxWOkUIJu+jEmx3zLhMq5LBov6BW2y6Lg1u3y9RlMCUCCMmusBv2EAz4QgMHkTDMyY
	QQAnbjN9VZeEOgvpcOl0oIg7gCFB3wG98puCQY+qJSs+XK0ZtkWwwT4xnAIA6N6UVV1eHe58AUq
	rbreiSpcg+yrtp1iwHeRt8hX9v+DWuwDrZdM0OqFdnZqqfewhitb96w2w73mbP1zyEC7sGXfKuF
	NvUongaYhHskNc7Voo07Ns9/ubIruu8ooTzVRtsHqAZynXN1jDe2uDh9K6LAugg==
X-Received: by 2002:a17:902:e80b:b0:2ed:2b2f:8632 with SMTP id d9443c01a7336-2f03f11e582mr276703145ad.22.1795797301078;
        Fri, 27 Nov 2026 08:35:01 -0800 (PST)
Received: from localhost.localdomain (bb121-7-41-33.singnet.com.sg. [121.7.41.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f070a12491sm100482945ad.8.2026.11.27.08.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:35:00 -0800 (PST)
From: Suyuan Wang <shyckless@gmail.com>
To: ulfh@kernel.org,
	adrian.hunter@intel.com
Cc: konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mmc: sdhci-msm: Disable clocks when runtime resume fails
Date: Sat, 28 Nov 2026 00:34:47 +0800
Message-ID: <20261127163447.238-1-shyckless@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

From: Suyuan Wang <stevewong@hust.edu.cn>

sdhci_msm_runtime_resume() enables the bulk clocks first. If restoring
the SDR DLL config or resuming the ICE fails after the clocks have been
enabled, the callback returns the error without undoing the clock
enable. On the ICE error path the OPP performance vote also stays in
place.

The PM core then keeps the device in the suspended state, so
sdhci_msm_runtime_suspend() does not run and nothing drops the vote or
disables the clocks.

On both error paths, disable the clocks first and only then drop the
performance vote with dev_pm_opp_set_opp(dev, NULL), so the clocks are
never left running after the vote is gone. On the DLL error path the
vote has not been taken again yet; the OPP core returns early in that
case, so dropping it there is harmless.

Found with a static analysis tool and checked by hand.

Fixes: 21f1e2d457ce ("mmc: sdhci-msm: Re-initialize DLL if MCLK is gated dynamically")
Fixes: c93767cf64eb ("mmc: sdhci-msm: add Inline Crypto Engine support")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on arm64 (W=1, sparse). I don't have the hardware.

sdhci_msm_runtime_suspend() also drops the vote before disabling the
clocks. I left it alone to keep this fix small, and can send a separate
patch for it if you want.

Changes in v2:
- Disable the clocks before dropping the OPP vote, and drop it with
  dev_pm_opp_set_opp(dev, NULL). dev_pm_opp_set_rate(dev, 0) does not
  touch the clock, and calling it first left the clock running without
  the vote (Konrad)
- Link to v1: https://lore.kernel.org/r/20261124-sdhci-msm-v1-1-75c70ed6569f@gmail.com
---
 drivers/mmc/host/sdhci-msm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 32b1bcba4..967843a30 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2978,20 +2978,27 @@ static int sdhci_msm_runtime_resume(struct device *dev)
 	if (msm_host->restore_dll_config && msm_host->clk_rate) {
 		ret = sdhci_msm_restore_sdr_dll_config(host);
 		if (ret)
-			return ret;
+			goto err_disable_clks;
 	}
 
 	dev_pm_opp_set_rate(dev, msm_host->clk_rate);
 
 	ret = sdhci_msm_ice_resume(msm_host);
 	if (ret)
-		return ret;
+		goto err_disable_clks;
 
 	spin_lock_irqsave(&host->lock, flags);
 	host->runtime_suspended = false;
 	spin_unlock_irqrestore(&host->lock, flags);
 
 	return ret;
+
+err_disable_clks:
+	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
+				   msm_host->bulk_clks);
+	/* Only drop the performance vote once the clocks are off. */
+	dev_pm_opp_set_opp(dev, NULL);
+	return ret;
 }
 
 static int sdhci_msm_restore(struct device *dev)
-- 
2.43.0

