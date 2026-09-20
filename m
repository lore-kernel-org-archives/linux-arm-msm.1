Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939C33E5ED1
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916352; cv=none; b=CGUueP2bFDGGBNBu2cfHgts2+vJu7ffhk66Kf9uT72tjW7RJt9ThAFo+Zchawf754o63RoVoyE+K7b+fhE9FdgTtXzrc9zQqWxLyiobD7l3XkS3E2ZNl4zeyZiq/YMNP4XadgUvlT5m8k/RrzcswIMOmBfEKLY/zt9SN4w/tcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916352; c=relaxed/simple;
	bh=LAP0ULfKTLnnxxk5jRZJCl2ZnuH1NUTTmEXPrY2FeQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=homx1eCVyBgc8gQFVayWmgUp7l6OXD8qDLS9llXSH910865XwBKOi8LAAnDECRo9UzCen11BXzvRvGdjtAM9X5GCOXLsbD4CktooBOvCyMR/uLvgwjRgTYkQ0Ag6llNcW3UgGMX3z6+fs5CCDWbsFYzx8bBCeP9n9pDyrtDb6vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38de693676dso1674594a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916351; x=1790521151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIs0KTLRxVWlJFqStqgAEVISAmza/SPNHCWEVPHnIDM=;
        b=h+FaxjYEWgMkKyE6Rrbv5aClZxSYpNALUaEPoF436oliFYx6rsY7wHP1MDTjKd4IBI
         1yErgEhHMqGbx9abWnRNeT82kYb9Hz+STcySJEFgt6yuyp76zCmjMYQarfSx4ZPvyAZa
         xmO1cjxEWKaFzQQSUhd8dIHmEEE6PGgMXLPO2wg2dZxmoTrAD3tZMvKN+rty+WGmKgxj
         arGWkAmPD/mOPpkKXe/w1kZ+mMzWJIop3xA9b1OzpKicl5ghSWWnngqQvxAp82No/C69
         GOOjnR8K15mr8cSQAbU3Zrcet+HZontq9LQsOb5LJ7cy+1ttEH1z2d8jof3/KeRMQFT5
         cRhg==
X-Forwarded-Encrypted: i=1; AKwUvBz0JloNIYF6osmeV+ijEkH6tP+AGQDR28sIBrRTdAqJOqKqHhMNux8asT7tnyjCaUpVk39EFT8MP/WVqPP1@vger.kernel.org
X-Gm-Message-State: AFuF++ni86IZkmBAhAWNe9LpBt/hZuXlyPtm/Vuu24RNkdcXfKwpDs6C
	VgWdopaA3x5SjJhx9UvRpG40eue0Szrk+lRaKyiVb+bx4t3pTlVACdE+
X-Gm-Gg: AYBFou2ljvFmdUqwUMmoQbMRZsw42p7hzSLB5YHPWSLWyOC93U4NEuYJ8tzJNDzGTBl
	w+jU/Sby4BoBjtVkeACgtAqREI15pMZEvsZ7pJRJPHAEurXfCX9JqoGhBSohNcV5RXu5+QTGX9u
	9C+GI816inA/9+k5YPqtjMJOJ84MbWcxQiFkBryONv+oCZW9pJveYNo0CNzo9gUokdc612VuRD/
	8BqgVf2DiJAZKvm5MRebEBuXrqbfY4ByEfBHQIxlySsF1CMdhRTsTh+3QM5b7DA1UbZHbtnz8xE
	Q0eJZzxljdsDUyBjzUwqPib4RzjyfBctJwz6eF5R29D3KTG9CZpT96+/2tfK1I4omYPiD2316Dg
	BOiVE9D+kClYsogMfCEEGIyMD4tx1YKxeXJ7/55xGoDaFMH4+E1CarOcC36MLpMTlLxLkvxmDY2
	VUeGeY8L3RQ0tUUrF1LQA8yOXZiOUr7nYH69BNXjnLeaDgKtGk3ZA=
X-Received: by 2002:a17:90b:4c50:b0:39e:4c7e:f03f with SMTP id 98e67ed59e1d1-39e54f6a423mr13496217a91.28.1789916350819;
        Sun, 20 Sep 2026 07:59:10 -0700 (PDT)
Received: from navi ([61.185.198.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a04546edbfsm585831a91.2.2026.09.20.07.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:59:09 -0700 (PDT)
From: Zimeng Li <me@lizi.moe>
To: srini@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Zimeng Li <me@lizi.moe>
Subject: [PATCH] ASoC: qcom: lpass-cpu: use DAI table index for playback constraints
Date: Sun, 20 Sep 2026 22:58:48 +0800
Message-ID: <20260920145848.44521-1-me@lizi.moe>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAI ID is a hardware port ID and is not necessarily the index of
the corresponding entry in variant->dai_driver.

When configuring a DAI with LPAIF_I2SCTL_MODE_QUAD01, the probe code
currently uses dai_id to index variant->dai_driver. This is incorrect
for platforms where DAI IDs are sparse. For example, the IPQ806x MI2S
DAI has ID 4 while it is the only entry in the DAI driver table, so
the current code accesses dai_driver[4] instead of the DAI being
processed.

Use the loop index i when updating the current DAI's playback channel
constraints, while retaining dai_id for indexing the hardware-port
specific playback SD-line mode array.

This fixes the incorrect DAI table access for platforms where the DAI
ID does not match its position in the driver table.

Fixes: c223f41c1a52 ("ASoC: qcom: Add four speaker support on MI2S secondary")
Signed-off-by: Zimeng Li <me@lizi.moe>
Assisted-by: LLM
---
Compile-tested with LLVM for ARM using multi_v7_defconfig with
CONFIG_SND_SOC_STORM=m. The lpass-cpu.o, lpass-ipq806x.o and
lpass-platform.o targets built successfully. Not hardware-tested;
the IPQ806x example is based on static analysis, not a reproduced crash.

 sound/soc/qcom/lpass-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da..079177a6d 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1234,8 +1234,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		}
 		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
 			LPAIF_I2SCTL_MODE_QUAD01) {
-			variant->dai_driver[dai_id].playback.channels_min = 4;
-			variant->dai_driver[dai_id].playback.channels_max = 4;
+			variant->dai_driver[i].playback.channels_min = 4;
+			variant->dai_driver[i].playback.channels_max = 4;
 		}
 	}
 

base-commit: 0ed6f7f62318a581fe9698f8a4e98c7ca01160e4
-- 
2.55.0
