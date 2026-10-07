Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90929397341
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401624; cv=none; b=uj/Wr4t20u8Jb5NYzzR/Wruu6wscQOOt7lcqHussB+oNk+V//YdaDyXway9sbt10Z0xL29kGEcUKSvJ4N0NjI73zhYXiBUH+hE71q9ZxA2LglzQyzoT8GG68cWzeuX4FVTPeLJx6eogfXW4P3hNgD9b96svzQBMMhWG/ihvcrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401624; c=relaxed/simple;
	bh=zvG0AcLHm3S6xLDDAlwG5qp12elfTSdVRrVLvyddeZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JQ/LblnVXa1EIC8Bly4YmWAfmttj4h5ORpWmzZlNkncQSLQAHhct7vuc8s+GBIGZsx7H6sK2AxPFv3a3AB/pDaXcDZCWTx6Xwp6AaLVWWI1EL+pTIg6L8ouv4H+mRtTa4gnGZn6habehIh57szL1AiBxUUzWmeoGdtZ/p+zHnZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRQ2o7PM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRQ2o7PM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so51324025e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791401622; x=1792006422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtWe9hd0RKevyGWq3yzE4CGMfhYNg0L6UN+xscZ5jJc=;
        b=pRQ2o7PMNDwfXd/Oqt4X4AJWOezA30hupSSavox9Bx/bGYLYljKj4rA37/G7z4iNZd
         qlcsMZkKEjt4VA71zEvPz+JVKe5xtNoiCBUVF5l/rfsmQL9SJwOn/KvwfYjY9ElHBqG5
         dvjK10SK6q0ks/XecgdmQfN2/JeXdx9V+PmFhTYzw/dBztO+917nN4wtEN7a/RdyXS1j
         AhmNFzOcYLFln+VYN2qeXxvngwh8dZTCxsGTFnfa6MjhO3Hml5Pf9lzgeFO0sCkcpbHu
         9zSLp8EhK2ION6WnrPFaxO/wdmoNQ5xZiA7VgSj13Tz1/2G7IU5gmlNVFu6+wq9lRqk6
         tdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791401622; x=1792006422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtWe9hd0RKevyGWq3yzE4CGMfhYNg0L6UN+xscZ5jJc=;
        b=iyK+WTPHzxgnTh6UzNwM7FZBb2z287CNEpjZMZGB7JhAcfskWIKlAcdMLFyUczWbry
         2LWdCl5tc0ntF4F13YysVIrHO6hZPXlo7tcdVunqmoG+RCHdNsCB++ZHaXYQUl4YmQE1
         DTbutgw7rn9YkgoOv4kVZuNwMBRv27jTRj7QYQ3+JyBuIB3TaA4/hVPsV5vZ95+GF5/R
         lqDT3TR3Hi+xxH7TacLURGWEUrmGRXpfiGTUcz3pS91GIe4PHpVVhp2Fqj80wFLBbtF+
         FdrZ2KxCwUfth6ern1nuR4iZEru+r/s5n1P0+wkI0Yz4usqWuRApuwsd4oGrmDMupE2Q
         E7Gg==
X-Forwarded-Encrypted: i=1; AKwUvBwT1kq6PznMBxp3yWW6SsMnK9H3rVCvaGTZqMVRlqBH+XA5r+u/d6A0HEV+xEfNXbSRkMm/H0y9Bh5A/v8r@vger.kernel.org
X-Gm-Message-State: AFuF++kL3l3m2ZOkwpQSKs7cMP8zKx9ngIDyo8E0YCD+2f0a/GFwKm+s
	GGrm/NpsRnNwmXeriF+wo6vP6yrEroGlxmogoVHvHH1ZMUN4ZgU8rgWP9l2frg==
X-Gm-Gg: AYBFou2cJGStvv4K3ydCr9YyhbZT7V6nO76pTaCSPI9VIWk8NyNE26cCeVfD7W5VJjD
	nbj/Kr/oy/qXCKR+p0fEPAtdaFatwm+ZOdvi99Zenk3Qec6DmRTa2Op/W6f70E4AKhjIy/Rowwi
	SR2/FeIBZ0zYZ/wCEcOh7os4/sfM/uXPLUlsEMQB6b+XB5UbQISeXam9HCDHNPLdXp8qEfYVx4L
	VZDhHG20q/6JmHk4kB4BWD/gdp2FsE3V7M11HpIx6qioHS18oQt+ql+biHh5bWAtQiZ5+gPS0V/
	XEWYHzDPXm+gxjUcih9DedjLglKwyESu0d9xeaTIXqlCylgIgsszjuO7QEfZg1c6Nm+3CQe7+Hy
	Mf8HCG8rcEuI1Tut4MvygzzLoqCwbX3aQCO+K3BjMnk7oswl8oYsYh344aoYRYYyPSRCNgkxh67
	r1/4DwSG8/n2wGYjQzK1OXtCUlyokbt365d0ksWsuU4fNNykJ7eV++ZtPcl+aN5hO6wtOuI/pdw
	JVNGI1iqBq+SxcDW5wO
X-Received: by 2002:a05:600c:154c:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a18043c080mr60892295e9.23.1791401621545;
        Wed, 07 Oct 2026 12:33:41 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.178])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843b5a2esm12427595e9.11.2026.10.07.12.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:33:41 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleg Keri <okerixx@gmail.com>
Subject: [PATCH] soundwire: qcom: wait for the interrupt thread before gating the clock
Date: Wed,  7 Oct 2026 21:33:32 +0200
Message-ID: <20261007193332.5270-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A broadcast write returns as soon as the interrupt thread signals
SPECIAL_CMD_ID_FINISHED, while the thread still has to clear and re-read
the interrupt status. swrm_runtime_suspend() gates hclk right after the
ClockStopNow broadcast, so those accesses race against the clock being
removed; on x1e80100 and glymur hclk is the SoundWire clock itself. The
next clock-stop exit then fails at random: bus clash, parity errors
reported by the peripherals or AUTO_ENUM_FAILED, each leaving one side of
the speakers detached until reboot.

Wait for the interrupt thread to finish before gating the clock.

Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/soundwire/qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6e0c5fb10efa..76f940f4eb31 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1887,6 +1887,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 		}
 	}
 
+	synchronize_irq(ctrl->irq);
 	clk_disable_unprepare(ctrl->hclk);
 
 	usleep_range(300, 305);
-- 
2.55.0

