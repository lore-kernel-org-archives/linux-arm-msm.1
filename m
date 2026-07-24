Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453AA3ACEE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880986; cv=none; b=YvRZncV78+maOBUpQRCn5ZJfOEI0Wi1pCKo63SxpxB7yRFeliO2X5l7umqm1PNjB+wZenGyL0T1Ulq2dUArlxzMyii053X6yFi4zL0KQk2TvnREfHb+FaOtWeN14OXZwfUmipAknfaUq5V1CX4b3VHuipT2+1QpBKH/fbOlqa1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880986; c=relaxed/simple;
	bh=q+e76o01AE2ElZ7QyaOg2YKqkDt5bYWXXYMGTCvUWqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V5vV41wxz7s5NTWuqzgyTRM5/JGPNIpAXu26nPNfy+wcdBPNpWvS7orPoxxKg0v9w5rncG41OxaP3gffS1Wq+GuYwAmA9cL7F14IwaVuisGUOcbUBLRsA3ejK2pqAJTaEve2+izeCSgiri7JMTaCaWk3p+8N5igCbHqHtTbrxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lmn9cknH; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lmn9cknH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784880962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VlrNlXLOdZeEezxbt+EtAbDHkQiiEwhfGxCf1fhl1LI=;
	b=lmn9cknHrvyzmkXRpUPkP4p2Bu/zNXwMv5vN6TtZVXKmaDaKDBw1gvcFyMd2VUUyCz+Mby
	gOT8169eITSokw5oEY7wJh2tR3S5yA7Dzk4yOiQ44d4oX//KUJQiaPCbwj3PP3Q6ysbED+
	k42gLoIwj2gLRqVhR9ByMqR60tMgHwk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: qce - fix error path in devm_qce_register_algs
Date: Fri, 24 Jul 2026 10:15:38 +0200
Message-ID: <20260724081537.191992-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=thorsten.blum@linux.dev; h=from:subject; bh=q+e76o01AE2ElZ7QyaOg2YKqkDt5bYWXXYMGTCvUWqA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnJ8pp7Nh18/FXI+/5mrvMPDi67dTnEbJY+U7xJSXrsj t6L2n9EOkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAiUTsZ/pk18nUcdlxlf9ba tO09Q/pyRxVZs6aph2JmCGUFLZh2V4WRYY3oXou2z4wGHZfnHNHPvhrirG7uaSN3TOVl09v76ge mcwEA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

If ops->register_algs() fails, the error path repeatedly calls the same
ops->unregister_algs() from the failed registration. Use the loop index
to unregister the previously registered algorithms instead.

Fixes: e80cf84b6087 ("crypto: qce - unregister previously registered algos in error path")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/qce/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ac74f69914d6..ea5b9689ce68 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -58,7 +58,7 @@ static int devm_qce_register_algs(struct qce_device *qce)
 		ret = ops->register_algs(qce);
 		if (ret) {
 			for (j = i - 1; j >= 0; j--)
-				ops->unregister_algs(qce);
+				qce_ops[j]->unregister_algs(qce);
 			return ret;
 		}
 	}
