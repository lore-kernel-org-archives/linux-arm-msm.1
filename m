Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842F34A2622
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376071; cv=none; b=Hlstnr5DqFS5tfseRzF5kCffbxTMnt6dnBYDj5FtUB/C9XqBdxR7G3CN8Uf8T/20yddavN7vJ0QYHjrfDsptI0bnKjFOmYb5hhl5B9lHGdiYoFxqnoWHz5/sfqxxduc90ZcX//mfPgP7wRfP4Cl7Dojw1bEbBMMifcfw1uuhpso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376071; c=relaxed/simple;
	bh=mrYDL8Jc5kHOxo/uk1bef7rw5P9jwUrrYQcpUUCM5R8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uIoghEuJYQDVhunnBQX8sgY1zJncQuri+yN3TRUlDgAZR0umIzoHE+y9N9B/4b/drP9gkTw/3Qw4yrii21hJHJc0zm6oWaIe5Q/d5RmGoyNDEW5gl771FdrGuaSm6CYoV5Kv6nIHpenQQ9Jt6W8WbEJGAHe0Ggb3munqVW3KYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP0pbMui; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP0pbMui"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1950111a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376062; x=1791980862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhdLoXtc9kkNzHYF4QrrqBcMnO9w0fLSquEWS/rnbxY=;
        b=BP0pbMui3jhElTXQYCUBTYnSKzfUDgvophxTlHJaVR8OoxUZmgv9iRGW65Z5YmaR8V
         CBitjewxxi9zRnXJ6vjMo6wlBleCVDJA4XBb8jiUyImVGj720iHtox3vYGufseei35xe
         S04u/TNrLygaad0S2y93/kMiTmdjr1BEnvf3WMG+gLSJfnd4rKXksmedeONwHDF4Ypsh
         6yCu1KKM8RuRwN09P2e1Rvmy2wDgXGEFkRopDR9QsYAdjjrI0k72w40aItEtNKfKgpnS
         8JQHYGXlcBDtaexYdjRvZACQhgDxbLMFN9rHmNDnIdqFuzQ061AOJRhn0DpURJEjAdzC
         q1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376062; x=1791980862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhdLoXtc9kkNzHYF4QrrqBcMnO9w0fLSquEWS/rnbxY=;
        b=GP6hAeduQILR0Na5LT4gRz0tCvktM3AQKBz4gjYXOt/DkXV7hOqRB0ld7OzMiqz5gY
         nLxZI4NY0ERb4yWuUEgYBYJk0qskyECGCmZPfPpkKo3FXQAyJSwyM6LWyv5b4XILirP4
         oGhZp2ZjXHicayeN7GMoriGC7geovAWRdIrVzxy8ZLn6Yxc9PbbovTbHW7GTnrkthRRV
         4eVMkDnmXBRAVUCPuk/T1MErAIi7W0yL8Tzj0NNgTIpbmKzYB/+C8WYY9i9X+TEAaeFh
         i1NDQ6VJp8i8eArhmfUZq8W9wTKWZlJLMMMtuMY8Hs/Vfd0jkdG57N7QmqNCUtKj/jNi
         oHMg==
X-Forwarded-Encrypted: i=1; AKwUvBzi4NNMjRwnExn4iw3GDUYvrBj2p0t1zMJCcoHkBJO5Aj2RFeSXehlJkiepUZBsr5B4a3pmMf6hQpz6X/M6@vger.kernel.org
X-Gm-Message-State: AFq9FYL1Eu2RfFwsiKsEiLOROHLRM5veqh5JD+hefmCbNL21b5ztR6s/
	N+RV5EYmT6QWEn0dOrBpji0y8yO42qgO2GguF0lTJ+2QtWAtCr8e5Lpg
X-Gm-Gg: AYBFou0RWxODqjjjk48tzuwBPAjb73iwLOaSk9YLtXZziMJpa3zXcagjbxDZN36Oa58
	N8Rk8mqnVYxLSn906tU2VzqAVC0zmfH7Q8ebYLWLVaX6RxiCkoXl0OvH8hKWbcJuQP+f0paWSmP
	6WdIkrm/oZlb1W6EXxg3uUu9zzsgsqehtAVbYu5OGiFOjwiA87IdBrbngq5wOoCn6w+pWLhk+pH
	1+ddNBmA8UTSp10drcNmSgWP1o2kr09PJ1oyqd5RtAJZbIVRKEim0OliAigPdf+1L2AqiJO5cLW
	ewHl0wG25MQrSZo459FuPABgwOKPL/but9St5eT/gds+KhL1KvG4a+9ffUjQ1YJB2lngNhSDgw4
	xLc5IyMel0+YBU9/H2joSQkr97ZSC5l5VImfBGaFcQHDJ3ANlYkBi/SIrJ1n5GohUBPpnZ7wZb8
	JfC6QmOCotwWuoAv+aFjzPZazgA/Ou7BcRA2elAWw0qdufTsI9q2rIKOU=
X-Received: by 2002:a17:90b:2884:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a8a0cd1a2dmr1992504a91.31.1791376061688;
        Wed, 07 Oct 2026 05:27:41 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a88eff2146sm6384956a91.10.2026.10.07.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:27:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Wed,  7 Oct 2026 20:25:34 +0800
Message-ID: <20261007122534.194286-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_mgmt_probe() calls pm_runtime_use_autosuspend() during probe, but
the probe failure path does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before pm_runtime_disable() so that the autosuspend
setting is properly undone during cleanup.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - Add the missing changelog.

v2:
  - Keep pm_runtime_enable() and explicitly add the missing
    pm_runtime_dont_use_autosuspend() call in the probe failure path
    instead of switching to devm_pm_runtime_enable().
  - Update the commit message to match the actual change.

 drivers/dma/qcom/hidma_mgmt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..d8c56af5882d 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -310,6 +310,7 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	return 0;
 out:
 	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
-- 
2.43.0

