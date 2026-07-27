Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552253D25AF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184878; cv=none; b=Z/ZdcrmnmAlhscni3qbLHSyfIDpK5qr+33sgpge5nbLUALb5g6XuWu9iiNSPAGlq7WJ9PUoBoJnGxHV4X5wJM72+oeOd443g6aPuuTtsTOER13uxMNdq7oWuSqSLm4xKujv/8mgSrKf49ajEzmaIsyO9KwWaF5YWF60uSy6VUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184878; c=relaxed/simple;
	bh=cWjP7LzlVqxQbyKR9XTomd8cu5XOyupmxbQxtPdo3aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nErPiuF3eHxEYx6+P/wU3hsAw9zVf1TDhv/CI08Vxw2JencA8ASqBTEbe+NAGwVmyZ8/ZKlBFCXJT51p/YmRfYxHls2BxNxhbsUjhFZlxo9bUstg8Y5mOmxCWnuPi47RoaIBRJa0WQoM29+UyhtQBTGWjxPFG60VCCcZuOCG30A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phGd7+kh; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phGd7+kh"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848d21bbaffso3241343b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184873; x=1785789673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7r5DtL0sBQKxu51vWXlifLkndvEzBXXj/6XC44jQqeo=;
        b=phGd7+khM+4p/6gWgYo1+kjMkPZ9yVuZqqQJjgpaNfC2ZTSYp/Ik29KL1TNgPVjzlf
         pLr9ELUzmP8fN+GAW927truFv0meoxxeZ1AflAcY8bZnfLRLMD2C/YsghCIGhy3OjqBh
         t8ZVn5k1V+kc4OUaCzEQT0ULdCAS62Vl+zD11pdXa+DBIPohqNd5GIrh08LcN5Vgi8+v
         1YHBhp1AoJscXKmCy7pmYvLhSDv0PnA3MSEe4mRNqp7jjGzt2e4tosZIs6OoweC0Lj0O
         gQVjrA8uqlFm2bGPF0+m0eg8JM5n+TsNiS3/Oh7ZRcrSTG6T+ym47o/U7nnQX+rJyd4C
         JGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184873; x=1785789673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7r5DtL0sBQKxu51vWXlifLkndvEzBXXj/6XC44jQqeo=;
        b=ITt4+zV+qlkam/tiIKMJGV9y+IU30GgCdVu2coPOVUgIXj6lk9rK53ejuPLLZUzB+S
         LzoBTVVw3rUAlFGRUzV4VDxE2JkmMCuDT4LNwHW79gI5+ngj1Bo3oEFZSnUzAkBxCxQV
         AgF69V4wGhGgvYyi0TaX3xZXDVHg9HkVOWLVVX0fMMI3kvZgXcwP7i/ombs7tFhvBVjJ
         acjU41OayP1gVobubJ0OJ4r2J75Nbw6couabso69ExtMF867bh0Wx4vzNcD0ntWPJecb
         qTeArQ8xxCGyi8fmBM0wOsaCocK/r/YF2gAlDSmAtvMwTKmNBWjp5rVzfQ0E7xzKKKEC
         KAkg==
X-Forwarded-Encrypted: i=1; AHgh+Rqz/aOX9Lr4k9wvSHlJ5TyDPPdNA3PvMNQfcSQGzBhJuZpU8FKZGOd3bs0OZmXM6H83+6fCfVByJpvZSxaR@vger.kernel.org
X-Gm-Message-State: AOJu0YwMq9cKeIsRsM7mdwYNHDXgRrMCqGuXJy1JfhefOYltiLd39KKx
	UB7b5UcZ3bIebC2JlXBrgVS8ND2xdeRfODr5ggYHUxb1ff2yiXqQvIHZ
X-Gm-Gg: AR+sD11PKYfErryWx34zxeM+XSSaQ4E3QMpk+NC+SmAQ9goQ3KzctkekrQc8WjUFPCo
	FwTTOBKUw/+a0KOKn9cJEI4JZnojZzTHiv9XvmbnDhkvgw58U7S9DD2oqvA1s+vXAKnvjt0AbM1
	pHfZQ+/TKSsnV4fBr7t+G4c7D5e3NAI7BAWscahl5/+og0433o6EKGTvoJq+3xptW1cK9JXASER
	acwEmUhCe4lHmjyDmshIH/HK08Od3oOp1om1iONafO7nxYyjQSoSTYJ/bW7r5gEnjR/mXmT7x6F
	2uyaSWYNwOJVQ96JookKuoIJepT6kanYrOMBrB/7kfw8QA5j0CarTlq1HYzwteRAFJqAKzNQJ/7
	aHJZigezBbu6B1L6Xlk1mnfdmnzKwHakXhbEgPx9E6DY2usYISKa31gJNwcQDHpKAtHXDlpScj6
	EwkJsgBduvHmJ0xlY=
X-Received: by 2002:a05:6a00:9a3:b0:84c:539e:a355 with SMTP id d2e1a72fcca58-84e8d12951dmr861522b3a.74.1785184873509;
        Mon, 27 Jul 2026 13:41:13 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:12 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 58/64] dmaengine: qcom-adm: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:20 -0700
Message-ID: <295b8a8c7e6a8e3da7a7eb1f632906569c5ab87a.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/qcom_adm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index 07fbe32d31fa..ea24e2de5154 100644
--- a/drivers/dma/qcom/qcom_adm.c
+++ b/drivers/dma/qcom/qcom_adm.c
@@ -918,8 +918,8 @@ static void adm_dma_remove(struct platform_device *pdev)
 		/* mask IRQs for this channel/EE pair */
 		writel(0, adev->regs + ADM_CH_RSLT_CONF(achan->id, adev->ee));
 
-		tasklet_kill(&adev->channels[i].vc.task);
-		adm_terminate_all(&adev->channels[i].vc.chan);
+		dma_chan_kill_bh(&achan->vc.chan);
+		adm_terminate_all(&achan->vc.chan);
 	}
 
 	devm_free_irq(adev->dev, adev->irq, adev);
-- 
2.43.0

