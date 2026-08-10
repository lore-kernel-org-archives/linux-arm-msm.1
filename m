Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE80379EDA
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 05:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786338647; cv=none; b=DiABBu0p+6vLf27zqPQcRmvZM3gM5VxfK67rlnPvAKpPzeIvWRfxjBxy0enl1+G+LCZvmiWj5qYMRtwhoHCkxE67UCG3lNVjoCrrXj/jcWF2Ohm4nOVjIFkaCGCBJ1/yh3jaOHW+8xipma9Z0VAqsaDylXiE4VPYdHjzeGelqOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786338647; c=relaxed/simple;
	bh=upDYkCoH4EgxOA/F1Jdf/sElJE58ZY5TyG63EbOT9nM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ct2r1yHa44umIKwkV3Fxu4fO2JMD39kpdms12ynddojvWfzXrlHNBds1iLL3BPxCyMKTJFrCxqhZv8MA2URchK6K+p3qvjJT2a5Kdd+t8Hdrwl/fq7h/+nUVFbrelFbL5L8oh1k2xkNMewnxkrEDE1AnP9vudHS357R3YEbHOY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FoWjt5A5; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoWjt5A5"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381b831d535so1809769a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 22:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786338646; x=1786943446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XE+Pzg5seS6UV/P9Gxn+q/KoVkligOtLt3QCLirDNC4=;
        b=FoWjt5A5hfJ1CXjTZxeE/iOSQREBD/Q4gZ160uxPycvBILz+DgSZpQhW5OB6tkY3xm
         soS31MNYqR6wB06/ATPQqty6EyORtaWPRWmhAkwwEAdA3LlJE0L6zlU2KzImmkrt9294
         +zXe9CC5+L6Bq1fH8vGVzG+q4qS2rHsDo6sI+YwphJyOkehGz2zok0mIvTQlvNxkXnLK
         PutBHr81Vn58k3WuVSri93QbkQ12gurQT02ZElf5uBmde7Vu/hlaHGjrzZa9txjiK2xo
         XEOpZqBXAgvFl+8hGWYxXNtt+NcOnvkxcs8wTMJHce9mN86FAP7iCVIfzE2web4CCnLU
         WYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786338646; x=1786943446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XE+Pzg5seS6UV/P9Gxn+q/KoVkligOtLt3QCLirDNC4=;
        b=JS/bEjTT7byJox6BjvPyl44tG3KGxhTrqP0wWLxo/0DHEpLWH4udcbnAhY+1MczMAj
         SjC9qtxnGoXevvXreSlCeyEIDskyDhGOmTwwmeQ7xaiAJihbeagzLHIhoPqntCQzDTWR
         JYRds+x7eVoy/U3s49u48n/fG/tnIYZgIKc0XgM706pXB+gVH+f8/OdHEU0KHrzws3+P
         baxYaWsqBn5pONZ6wBIwaS+e8aBppSneAc1XZ5L+gwFQ401+a77iZMR6IS3n2rpcBBpW
         1ACpzi9721iZxunml+C+fXO8lWQTuydUgKxKnFOD2rCu2n/e7o8rciZ5d9hw5PIFpXVF
         n9bw==
X-Gm-Message-State: AOJu0Yx6+0iOnkUa39x/lcb4MneT1QIlTi+/EGQUcn7VCHWMaDNW1UPi
	r6nShWaOWDu3HYSf2vLcbTer4xl5+AlUyASDJyzKF8rgsX5Qf/o5r+Ir
X-Gm-Gg: AR+sD13WMFYumtFbiZTHpH0IvmDyJeJk+mnOTid8eQU8EOTfzuicZWxBa/WaKNdCntZ
	ghbqMtmfgJXlJ+TML2ts3l/pZLJmnrPqsChge8e6UXxvnoS2lfkEV0QK3x9JR1bTqtF87lMuVcg
	wkY2Y9dO1lghCD5d8ii6wlaPyZkwf7EtB2GrqOwCBVzSpt5Pp3i+EkvmePUMm5el9affcmpjdRf
	LDmaTcichgNAkuULibYrn1jPP95+rTGnglvgEF5SbCaG6EG3/Gy/Qi6zYz2OeaoVG2s+t9iufUz
	PY7sjD5tmyjvSwjeJy0LNQzd/hsW79ToDBn8xIj453evptkKn0fV8PXH9B4iT0265lvHwTyZEju
	/2q98yltz6xnG6dqui9TzUXJmcapFPB4dv8rPu1I1iP9LVrqNpPLU2/bCSnjdrM9rv7kE04VieQ
	eXe61emXlYE7vvBuihiHbDn2mM6DrunKjXgRBCu9fULKfcoPa4hChXmqlzrXRoVRhITsEVfHVYJ
	NT5Nnms6A2mMyMajRrsp8vBgOuHSODnF9t6sWIQuBY8+KFOS3LFginMFf9JdvSJQBwbWrl5XhB+
	6c4b
X-Received: by 2002:a17:90b:38d2:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-3926237cd78mr21465070a91.21.1786338645890;
        Sun, 09 Aug 2026 22:10:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2c714sm12930645a91.10.2026.08.09.22.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:10:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] soc: qcom: llcc-qcom: Handle errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:10:31 +0700
Message-ID: <20260810051031.26656-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() can return errors such as -EPROBE_DEFER,
but the driver currently stores the return value directly in
drv_data->ecc_irq and continues probing.

Propagate negative errors other than -ENXIO using dev_err_probe(), and
only assign the IRQ to drv_data->ecc_irq when a valid IRQ number is
returned.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/soc/qcom/llcc-qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 8948b5fd42d2..e42946810b50 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -5587,7 +5587,12 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 			goto err;
 	}
 
-	drv_data->ecc_irq = platform_get_irq_optional(pdev, 0);
+	ret = platform_get_irq_optional(pdev, 0);
+	if (ret < 0 && ret != -ENXIO)
+		return dev_err_probe(&pdev->dev, ret, "failed to get IRQ resource\n");
+	if (ret > 0)
+		drv_data->ecc_irq = ret;
+
 	drv_data->edac_reg_offset = cfg->edac_reg_offset;
 	drv_data->ecc_irq_configured = cfg->irq_configured;
 	drv_data->dev = dev;
-- 
2.43.0

