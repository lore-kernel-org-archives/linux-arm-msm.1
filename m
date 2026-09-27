Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2A1F192E
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 01:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471422; cv=none; b=towAKB8rAp8by0sjLEvWpFA0zqX61owbrnaDx47S5I8bXNY4duhI4W91P5O6yWoYth7hCqejVlItXqFLVIVpgCo56aSQGXAxrOMtvRHP1wE5DAun0AnXLN9GJxe2IGX6kDF4ieAQlMqroEZxP6qyN2L0erNzehN/J3fqpN+0NQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471422; c=relaxed/simple;
	bh=GNR4fpZUGJ21uZ1t/ZUAIEe6gTLZnkX4Ug2geMzO4fo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CMPy09CVop1pOWvOUOog3k5ifXbfa78KGkTo/jfkfR3tkRCcmfG+Qu3ETolA37UIQ/8m1eP++pNz2lTa2w/u3H70hHfn31pE8XSCV+9sXv0moLU6zXrOZqbGnxxopmrlLvXF57mIpNDU6BArIuESUfuQqev/g1Nmwy1tnKWgkm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df9754484aso7980075ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471420; x=1791076220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHub96pVZHtUuiGqtZ06K3QF0eNyRXbrpGkCUdoQKHg=;
        b=OXCFON39cB349C7vzudvsS1TW8I6tr9PpkTlb+uM/1NbMO7pcTmhaUQhDzrD4fYITr
         b38cMo9L1aK+zXMIKG7G8kjpcpzBG7/uDAIAbIeuHjkoyqMASa3jHbE0v1mOdgeKf3bh
         J/10E0YGetr2qGPj/ExpmhPsR//GkIX8IGDJYohu39Yfi50euij+EwjmYNPG69sPCzsj
         73bmJucBiNCh9k2PGZWL5i+fmhiKjD67uyEDs6CBeS1/wq9dC4k4IOUzRDKDIjHirGYZ
         8IXU0f/poFXgwqrn1dBgttNnChMXnSP5GPiJ1uGt9QKOinBA7fBEAS+3XIlJhz6lCKP1
         U3bw==
X-Forwarded-Encrypted: i=1; AKwUvBzF0RHWzQHPbjYiepWlJKxK97VEnIyq9fZb1A6iILfcMGkwwKwCUh7ks7jDxqBYngWYIqbrtILQunZYApRR@vger.kernel.org
X-Gm-Message-State: AFuF++ky7JYmFKPfhnVDjezFj8Xmf75ocmRoWkARCC5jZbAeWkpEuc4C
	wDnlpM5+WeriJLVWMscPvDycNA7jJtxtoU1Tj/PuCM6Q5ZlN44FG8ngd
X-Gm-Gg: AYBFou1TbS5/ENm9bDcy2PCpKRU9EXlDCRs7vUcD9QAZBLpbjAIWci7yfzNcxlm52E0
	oShxAK70Z4WCv8k9ni0ZAf94FbonOn8n5hCId6DsBrT4SC6uS1tqTnt6pg1WeQm5KCswDYvgdKF
	TrljoU4jY+JvmW2uA/TBO1GptPluB9Oo5zNHWP5R77giAXq9ox+t85uAY4SC/UkRW0sBtkLiyuQ
	2Unl2nlK/cHWqx3A1PSDFYv/g6tMT+aXacVQmUQHej+L5QnHceYXH6n5wkgYUbT01fX8IkvHGZo
	dleV949iwZ3Og9I/aJCu9/IouiwvUtKmkgYweFVCXlKMIPXgXCPTuE1f9cPsWtFa37zWgVffqK7
	g2Jih+JEHd+Kf0mI9f6dF34VnRBBD1zgR/d6yQZR2eJB7dZaJpiqWUl8s3N+2ua/c/XWOD+EdF4
	tO4Cko9tkewwyxb4lIy5Mcab7nUYqr/2kav2OvC+/o/NQbrAyHFVcaN8Ikg1sBDUJlwt5rGw9UX
	4WPBt4IKqK9hmUquo2A
X-Received: by 2002:a05:6300:6cc5:10b0:3de:489a:7530 with SMTP id adf61e73a8af0-3de489a77c8mr1267646637.72.1790471419502;
        Sat, 26 Sep 2026 18:10:19 -0700 (PDT)
Received: from navi ([113.140.3.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feaf89651sm2514829b3a.41.2026.09.26.18.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:10:18 -0700 (PDT)
From: Zimeng Li <me@lizi.moe>
To: srini@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org,
	Zimeng Li <me@lizi.moe>
Subject: [PATCH v3] ASoC: qcom: lpass-cpu: use DAI table index for playback constraints
Date: Sun, 27 Sep 2026 09:09:11 +0800
Message-ID: <20260927010911.51980-1-me@lizi.moe>
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
Assisted-by: LLM-assisted source analysis
---
Changes in v3:
- Describe the assistance in Assisted-by, no longer name the model.

Changes in v2:
- Add stable to Cc.
- Identify the model in the Assisted-by trailer (superseded in v3).
- Clarify the conditions for the IPQ806x out-of-bounds access.

The code change is unchanged from v1 and v2.
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
