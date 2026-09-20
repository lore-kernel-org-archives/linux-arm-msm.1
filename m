Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2245477E4B
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 19:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933135; cv=none; b=YuUEbbqN3rFQfwwIR7QBhaZRb5ZKtTQlh39aw2Uz4R0abRjF8kOm9FB6uJDDWMim+quki5Axg20jwPJ6XONKvwCM9ASGtvC5127lU+FennI/0aGaDxjeSAMDIjCENrgvxKScMyCVtkh5qRgH7A3wCHbVZZ2k/gG+jFFw39/eRK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933135; c=relaxed/simple;
	bh=19HvXXEGNkAEh7k742QsXcb6guSh20svj/hb0jKC2xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJgsGbJHy3Np5rF9RAsbAahx5IFYTBQ/ufLDaF/l2//yGuNGEO3H536JYns0MgSM+xHn9x6841ebg6TOyLDJODinHHzIhkbrgGC25jr8siOrSGrjhlDzEMvwEuyq2Z2mVOIGFHfOh4LuXijFdGV3VeW/Q1qoUgO6zzJXrWyvflY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc4f2a5c3c8so1697759a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 12:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933133; x=1790537933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7TXkf8HfG5PaX8N7Gibawm3cKOzVqiXxqGBVj7YLTM=;
        b=lnOs/Ivd0G0lDl3SZ5n/8rH9UTRkkniGOzwqDXNTPdetfk6aCh7GT3b41uiGfHGJNY
         S0HXGVdq+Blu++GxQtQAg6r7EstaMMzRSl6W1SBVcv806+fbduG5lIG/96o4rt9EjPZs
         9QNjUdcQ0OdELQa+zHLVxaKCCK4qSi+R98cBrtjeYwMo2f3keTF9F59JSBFEaQwhqHue
         YBJvT/3jysQ5fAzq68RFR2C2hxutriCXgbR8Pyi9XmE7uNYU2S4PvyU6lvkGYhWiLbVn
         4Fi5k3xzVrvTc100/DpUhhHKCJKskyhMzKv8b9r0vDSsdGKeec+pjGfg5HOkYDki+zzo
         8u0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNZ/yCaezHbn22lkY722t49tXsauMmDeRhZiE1ulnD030Guimyezds5JRGW2cwyrq7hcZIIX7rpA5DqYo0@vger.kernel.org
X-Gm-Message-State: AFuF++k0Ijz++4U963uIi0wrOFHQV/HOVAX2Te/n3Zv4guQmY6R90N0L
	00x37f+/VmFf744bT/kHphtLVN6sluJ8wQOK6IYom+bSTejeYNjpAUtQ
X-Gm-Gg: AYBFou23rxsAgW10RcPSp7UvTQ2uJBOuRiVA0ucs01XhwdDMuF4Kfv2BCx7ppSIueL6
	udOZC4vsJMfvRGym5Ln7toLN5TLRfCyw49bpQ/MmyMhVeEvuzHnioZXvkH7fTTtNLYBBOeyrjYv
	CFsISe66AJvES6PEsthTX1ezz6HW8xgvvUOVmBu5uS3diUUHdp9kkLXhWtthLK1cBMTSgBOTwZt
	UeKUaMuW66Hnk55VFlN/TOqd/zVCplxXMwwUBS4Qb6sTPlm7P/X0BKkwuFvespJtjpg+NX1E6Tp
	leDJR3Uyyz08WNBq+bpGvyutYT5aM8VGvxdMYAEoiBdiP/O/6bO6ZdJ35YQQnN5WPB1Gbts4Wfm
	9DePTFLq33XWt/gslcy0D1AOaVVPVfjUv5N+spZtCno/ZItFLbKcvYWXh9Ky9QJWeEOOkJF1Peu
	mOPkiWfyCJ5aEjtLgZxc1mhBZ2alLQgvIAfdsmLI6q51EPeF+73qXDDOfaKMmRjg==
X-Received: by 2002:a05:6a00:f86:b0:848:76c4:fba9 with SMTP id d2e1a72fcca58-874dbee3c12mr12028698b3a.7.1789933133005;
        Sun, 20 Sep 2026 12:38:53 -0700 (PDT)
Received: from navi ([61.185.198.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9b0c516sm2222132b3a.34.2026.09.20.12.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:38:52 -0700 (PDT)
From: Zimeng Li <me@lizi.moe>
To: srini@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org,
	Zimeng Li <me@lizi.moe>
Subject: [PATCH v2] ASoC: qcom: lpass-cpu: use DAI table index for playback constraints
Date: Mon, 21 Sep 2026 03:38:30 +0800
Message-ID: <20260920193830.53706-1-me@lizi.moe>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920145848.44521-1-me@lizi.moe>
References: <20260920145848.44521-1-me@lizi.moe>
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
DAI has ID 4 while it is the only entry in the DAI driver table. If
that DAI is configured for QUAD01 and probe reaches this branch, the
code writes beyond that single entry via dai_driver[4] instead of
updating the DAI being processed.

Use the loop index i when updating the current DAI's playback channel
constraints, while retaining dai_id for indexing the hardware-port
specific playback SD-line mode array.

This fixes the incorrect DAI table access for platforms where the DAI
ID does not match its position in the driver table.

Fixes: c223f41c1a52 ("ASoC: qcom: Add four speaker support on MI2S secondary")
Cc: stable@vger.kernel.org
Signed-off-by: Zimeng Li <me@lizi.moe>
Assisted-by: GPT-6 Astra
---
Changes in v2:
- Add stable to Cc.
- Identify the model in the Assisted-by trailer.
- Clarify that the IPQ806x out-of-bounds access requires QUAD01 mode
  and probe to reach the affected branch.

Compile-tested with LLVM for ARM using multi_v7_defconfig with
CONFIG_SND_SOC_STORM=m. The lpass-cpu.o, lpass-ipq806x.o and
lpass-platform.o targets built successfully. Not hardware-tested;
the IPQ806x example is based on static analysis, not a reproduced crash.
The code change is unchanged from v1.

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
