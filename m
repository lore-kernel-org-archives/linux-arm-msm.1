Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173110;
	b=wilSS/OB+/fGE4yCVUJFdK77z+esjiXRUgadSwDPbkRlYrdtekJAnn09lztUvDWWV9Cr
	 U/XcxYFWBJtDieR/LyGiYcrpZE7n2ZMgPNkpqgeGctKReOJ9Jhj5TZ+TM+T19QFslvbKP
	 BEk7kj0wqXxlUrzNk//Pq6jDtKbXWAwKPTW/4lbjF2ug6qFiZXkM1TCuD1ZJfvPaVGMnw
	 bJ4QJsb+QULJvCO71FhsnIFaUzNHbUa8wa2yzJjp7Zlzk7UvcXmWUBJwf+nDLvPaA6CN+
	 VMXbchfeUkPpK3c1hI93d0ENt+a6eZlgNwPAh7AsQ7PrPQRuZqWi/QfEpordxSb5peg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=QLWkNiy3nGWHUjhF+lKT3m6fXbXug21HuCcoF8psO5Y=;
	b=UmCHekO5jlrn+QZdAtC+EIrxP+BeRxvqPRLMmrP7Po1sTLiLZXHczfB3zH/dKNkqrvD/
	 Ia/FmAr49wBJCYTWomN9cDb/49nrKNMrdQIxYxXRo7z6btGfSOAT10Zc9MfQVQEz0fMXV
	 b1wk7Ng34tmZrvtKbgTcs8FYuv8NShHgvcY2r6hU9xG5nst5K/vPukIb46AGvLd30j0M/
	 apQ9Dd3BbXSaee7e0Wy77PFreqRXbqdYxMGKrVWB6huQuDDiwcAKBabJhdZLjLH9i9b87
	 gsY6XwTpwl1Yu63UBH03lzcG1cem4wAn3QWbc2hykAHpJtA9GLTKaNta8FWdAFu00eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Z/+yz/TJ";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C78160A6F56
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C78160A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Z/+yz/TJ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso5292495e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173106; x=1795777906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QLWkNiy3nGWHUjhF+lKT3m6fXbXug21HuCcoF8psO5Y=;
        b=Z/+yz/TJ5gx/uHkjvZJLarmDD8W0E/mAgswzMMnNQ3pwYvTSZSz7Wn6bpzfoDZEuxy
         QVfmltBcAIY7NCURjeQRLiUVhXT7FgOtDElyVn16ILko8YhTFGsMsyF2FGMOotjjXwAj
         xMYE0664AWZNF16A+lyWbSsyQJ+4vb02tL4htVqOq0kuN3ci7WXxPIcZAIJwaTtsnqzJ
         sJ+EehAJV//OfqAXjhTSK456H1CMeEyNTxrBEI37erZAEWq5j+kiOzFEkC5AMjvLBUPD
         YI9fSdWcGmzHXIAaHYbZhnO0/0bZZMY/lAWCVq5U81qVE/wqTpGLCKw5VEcA30mAkGwv
         p0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173106; x=1795777906;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLWkNiy3nGWHUjhF+lKT3m6fXbXug21HuCcoF8psO5Y=;
        b=J+hZFvf+jpdiSTF6UehL6rkgQshifkcG7cv7jCYIu6PEFjeF89HVyIAOzaOmhl8IrB
         iJD11MFc7sQ2mxTOEvFuzfEPoKgNuEr7DvavAHROjc1CoTuH5Bc2HYhIgy21IhxYo685
         SmbjwDu8CPjqjRa4Ndk8foiULzTghYL2Dh9A+lSffAuaNQ+z2ObEr1dbz8nz9/2NXQ8b
         2LpFNpDAj/3GytEVewba9dYl7AigLjVpxjpFe438cQp7LhW1An/6yHOXBjDWySU96jiJ
         oZQdQJ7tgIosrl7HAdDo6r5lLFpvJ8TDfRJMqgmXOBcHKl17McCbTBPcmURT7SLjEh05
         nGyQ==
X-Gm-Message-State: APuU4Z8BpakEgJlZ8lIrEX8XS/C3lvoio0h+AQUe0oGv/7sj0xLU5XEk
	Fu5ojvNQ5ozXMU00tL137oWNrfLThGUCqgWwjorjLaAZkLSzDraQffw0RPNoBRY03kE=
X-Gm-Gg: AYBFou1VQROPBYQ1w08EM1S3/rhCu+YnvHA0LxrnY4qak5hQqdx8rRB4ADaO/SusWcx
	ICft0+jgkQx9YNHd1nm3Dshr2360CLl7pc6+Syaw0aQkLrHGcNbYPqcGPYzVIi2CZ/0Sp/sqt1W
	wavEBXUliBzJOwXOaFy6X+FW+EOe2/x+mNt9iViN0nxmHFPCFD2hJ+WFq25XEpbyIcJljge81ol
	IsFXkUKdREh0TN+Jbn6iKMug+4nffcNUWRmRlu/LChNQaP2yCB8aPnmaeeN0C1IDATrr3TQ8xC6
	ckf2CmUkZ51JpM4ntUwI4r660xKgp65HDCwPnVH1pdkl9DrH6KMoFrm51fn4qjypmIWVWpdbGMk
	dxc4V8c/2pm78EjbuNauu14RXD0MnlWcxcfTXjzeYr1q8VJ9itUH1kelAQzAPQxCOy3oSMDvnpY
	fk3i5knqCGnc6+L4EVCCsX4WZm64JzkMF/+fH80mbvSqsfiI4qRcKsbNCdUkmGCQnE8s+ufFsPj
	vmsq3JhvJn4eZfNllfgqpJba+1eSUhCT5wS82g7pdEPxYpGzy6WECcVtyjGVL1hLdkfTpe6Sh6d
	8pqtFEdpQvRteHbskBnID37ZJkSE0+e6DUdeBgKQrPHOI+rNoT9q9ZZK5XDP665wj3/v0Lcpp5q
	QLiDW0hbwAqQ0GdAg
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id 5b1f17b1804b1-4bb8880abafmr66297285e9.9.1795173105614;
        Fri, 20 Nov 2026 03:11:45 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884a15absm67903925e9.9.2026.11.20.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:45 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 09/10] slimbus: qcom-ngd-ctrl: Allow untainted use of driver_override
Date: Fri, 20 Nov 2026 12:11:10 +0100
Message-ID:  <73098a91d24bd8e2c27ee4de81aef7a215ab538f.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=766; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=bKCrn8vViXTu0oRlxufm/tfBP+e4swrbdxcQ4l2ZgRo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrACrdvLhzTzaMKwmKnBXhF0uK0DkOtNVzco9fG yM02k33F1iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawAq3QAKCRCPgPtYfRL+ TniQCACDWbt5o9mgMSvrlUKqiqBaTVs/F+dfkkTAAv/ojdKir3ePdcwWOewFi7fwlSENK4UuK20 QRSJ0IZiKzy+DoENmo6F9pgy+tGFYAHT+p20bUom8ZEvGdksgkHZTLJM/WjP1vm9xsN3u/9C0FD Evc6HmbZovSEcyAA+wULCRVDEZgj4TIq4SZQYGtssF9KljfUwcNtrN62Dfw6uFOvOjkShZq0PSk tt9623PDRiQ4WcJjQc2vraz+jzX12aPKsCBssCdDaT/PNW3iqHEpUmmx/BrbE7KCwq7/mHJ3a+4 bXnSEzWrxBEQw/3c5i1BpaQARrYR4JXfTdh5TA3SV/fUfXvZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver is expected to be bound to devices using a driver
override---see the respective use of device_set_driver_override()---and
so should be allowed to match via that mechanism.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 8da75c4b50e5..f501740fa4a6 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1837,6 +1837,7 @@ static struct platform_driver qcom_slim_ngd_driver = {
 	.driver	= {
 		.name = QCOM_SLIM_NGD_DRV_NAME,
 		.pm = &qcom_slim_ngd_dev_pm_ops,
+		.support_driver_override = true,
 	},
 };
 
-- 
2.56.0.rc1

