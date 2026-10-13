Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2844F68AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895416; cv=none; b=lRqy44ZfLkgTVYQDA1wcve5jAVb4HMSOX6zj7c9KbEMaJa4hhslKCN25m1L0PnvL7q/LVndh1RB0PQnDngqdmNqWKvcwrKXkz6yDzIheFq2k2nxXI+3GJ7MmWUhhrwMkcuuu2ucWO2/XzrkvaCX0VAKqYAGVPBErhDZ9DzO9ktY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895416; c=relaxed/simple;
	bh=0NQ5w5tbcto66/4GcTTAPB4tFFMCRjM8/r2YcYTPB5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UQ+gBOSvgHG5n9oncPxYLIg+WH034kr4I6BtLyRqj/UEgUJyhbsHCI6AtNNOLKOjcIdgz8/THbiNG9NFY3dSlohZJzXoIBCQg/D5ldqy4fO7Qdi3sMA/C6h/o+WA3f+3m4JSKBQlPgn+jMvRy5uq9/qL59jiVuDKQLT28mmPmes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ei+zGzZm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ei+zGzZm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so1794361f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895413; x=1792500213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ld/rflLmJTpQA28xoZ6zpNKNM3ooqYaquEt3HBu6M58=;
        b=ei+zGzZmw/yYVihEsPN6QjKvXkRROYtRQ/zBsnpWEi/o3R6lhm5CvRHF5+bd+k/+OA
         v6vZNFGIWJ4tAvKDCer6jSNVJyQYRTAxsAmUnqCpRyNdsGogwfDTpO1fQMd3nwtqc+Ow
         kSFh2Dk3STZhN0iyUeAeuWRr8MDbKDruk8Mftw59dLQpIsaugWOw0tOmqKkhPjUn06Td
         drlOs5PWrwrfyKUiHrCepUbPEy8crgzehXdPR7hjcBaynjDgam7O4z9hx8pZIjOzf3ue
         nkxExy1SN8uikDxDEVYDNSH3z3vUHHR1eqq2wAobpSO+Btv9H29i8kTl2E0GVXjEcTvw
         VTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895413; x=1792500213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ld/rflLmJTpQA28xoZ6zpNKNM3ooqYaquEt3HBu6M58=;
        b=shH+GSoW/Dv8VT5qf3uF1uwfRe6Jp4dMogosNPnGJtZYsT9FLjeUBYPpC0mqj9L8Oc
         CPNPMD4qfAA/7qiJLEztgVyK0RS5GtapUQDIfT8a2lCcVO890rcA1xZRklIYrZ6wNyGp
         BlvUC9qz6lvEgXFzketkeqtNANG3dt3p0lQp0qjPXc6wOPcG3in5tite1XG5/SID+A7v
         KwuEkIqu52CooGtWKDE0OY2OJh9egXDwNCRnKEZ+KeYvPpOl0O8ZvlpAHSTtRc8XkKmz
         2D009GB49XBEP9k4LAYf5XJlQIwdgHhdeL/CcU31axYTK03Y0bxsnOsbt/0SUuh+HlzA
         33xQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2d9uFqEiP9FXOYDWCTAA1q7ulcmv5ilcr7uVPEB8DN98jRbz4XNNIoMwC7KjFkRLrptcpKze3TfZaBm0o@vger.kernel.org
X-Gm-Message-State: AFq9FYKzBSotMkqPEIID23HFi/YFWoHAJvdZA3WrPTcF5W5pAJDjJEEg
	U1O8Q/Ks/8oOD211kOoEN45+tsBSvVirt2RZbXl9wfHlEYWb5kKGLpCVXg7BgOjSZNmk2A==
X-Gm-Gg: AYBFou08le3a3chFf4olR2lmcLLNkTZu9OOlzYxitcLlOOyvw83QpsjhU5oQQ6j7Ka2
	/A/XcqoJFOfPMKLNBc0m457myekywJdTWzZqrPJug3iAOYc1wP17r9oaI7PZO9IFALT0i9p5AMA
	NHQfasKvnUotYnuxB1j42zqQZ8FFKaC/z7uAnRbJ51/WEGPZOpia/dpLKKWMthiMSlHhFPLDifg
	34/BkIg99bGtT2H/qyvSu+MkH/iA5GuemsRCYHSUU8Y7YgsdkExbuSSkAhfGlCsf3BhrTNEFKM+
	J7sopZR/EZL+ujKWLsOTF6OjWKZd9Ypw3BJZbY4GngXeM9HVadPFu6EjSwffG5YiGhv0Mx7JS5m
	TKnqfa9N+gP+w7GRpHBuyJTWiDcZ3SIMNkxj0r1c6K+6Gv+XPWcw4MxjcGw6WBdK6KdArAd+nmi
	1twf90IKJmKndKPBYkb5ZbOPbdUA8mkQjnJkhaxNB+OsIBAQ3EU6qgV4agtKbNaPbhxg0fUvvc1
	z0grlINX5153HU=
X-Received: by 2002:adf:e007:0:20b0:487:8ba:8aa4 with SMTP id ffacd0b85a97d-48dbace50e3mr17346014f8f.38.1791895412619;
        Tue, 13 Oct 2026 05:43:32 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:f28a:73a4:9323:621f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4053sm4493729f8f.21.2026.10.13.05.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:43:32 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Arun Kumar Neelakantam <quic_aneela@quicinc.com>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: glink: smem: preserve IRQ acquisition errors
Date: Tue, 13 Oct 2026 15:43:28 +0300
Message-ID: <20261013124328.1273340-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_glink_smem_register() passes the result of of_irq_get() directly
to devm_request_irq(). Negative errors are converted to unsigned IRQ
numbers, causing the IRQ request to return -EINVAL instead of the
original error.

Check the IRQ before requesting it. Preserve negative errors and
return -EINVAL if the IRQ mapping fails.

Fixes: caf989c350e8e ("rpmsg: glink: Introduce glink smem based transport")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
A dev_err_probe() diagnostic can be added for IRQ acquisition failures
if preferred.

 drivers/rpmsg/qcom_glink_smem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 35bb03e67ae8..010a7da64906 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -312,6 +312,11 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	}
 
 	smem->irq = of_irq_get(smem->dev.of_node, 0);
+	if (smem->irq <= 0) {
+		ret = smem->irq ?: -EINVAL;
+		goto err_put_dev;
+	}
+
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
 			       "glink-smem", smem);

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

