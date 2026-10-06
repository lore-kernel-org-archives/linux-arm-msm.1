Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84CC4FB9A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 23:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328815; cv=none; b=I0dfaRlIAJZApLnV2PATaM3k2z936NtQnknZ7Tzj/hnQ+T4j/6v9Dl6GZRUNH3Nf5NH6tmCOxenae1TJqXo4pCtvxBp8s0WekL/3egKN6r/3t7ZWQXSn76nxNnnRZ5RDNWtUDpYYfBoeXAM7YSLPzDByb3qCLbJu3QMg8tmcA3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328815; c=relaxed/simple;
	bh=+r6PH4HB+WQWJr62dZukEIypy3+RL/XccpRzbSn9Log=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJbvXSH1x6btGm+hPXtzwdS+KE9ux+gUqaw2yy0ol2cHji3C+8ykxuEJ3yTGKpwAmUuOmGVGMOlwKv8hSy7+mlxcIvBD2BtJEDvHHIYqbSjseoNR3uJmBHS3tQUaxb8Gul0CKbNfXuTMI0iTucsBUW9QT/ynfKP4tyf5TflBru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nU6vSTfz; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nU6vSTfz"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35115b52125so1367987eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 16:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791328795; x=1791933595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAcYfvRf3dP6Vfas4zYsUbJKP9wdfOC0aJvUADv+txA=;
        b=nU6vSTfzUBeQmsLTx0KlZ/8QFQdCaRqwt2umTY6pj2MbAbpe+HKVV9ISz762r/Lnwn
         Ltq1ECfFyoB4wg7MAthtZ1x1rUxt8xRADnsQ6ZIwIj47RO3w5r3ykBLGRGxQgr2gzJIC
         HcNp410VUf0Itvsx88OuefYmqk6wliEWdWcU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328795; x=1791933595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vAcYfvRf3dP6Vfas4zYsUbJKP9wdfOC0aJvUADv+txA=;
        b=c8VAA9+ca7QTI1U0qzXoINNtXUb8akJbXvDswfGkIllSl/aqT18hm431BwR0c+oMYN
         Fei01iRkImxg6af54DMFEEsaUif/uAcRzV0mNUlNDQ1r3MpM28MYnEhVfxASZWyZkePK
         m/GiUT+w+bauuU0NUbd1mM++KXNypdwdiH+Xs3JIDr8VPqUaC1bB2ji8BPywFH58AMYe
         j9rnL0D35Mup7TOYp8dSdrsxids4DVC9hEvx5XZMsccQb20/M+rMj1tEBxAt05WJwapU
         cTSb/ZlQ58iXqdshMYM1nNctegoWtU/bCTuVS3l6nGmTwo0zE79jChOoAbmDMZopYREG
         nbNw==
X-Forwarded-Encrypted: i=1; AKwUvBxihzQYOGYCQcxHtm4PtvuCRkLvkalHTIojfmAUuURYY1aeLYw0Z6z3l/woBEHRjQ3BZ5WzRV9tmyUoswm1@vger.kernel.org
X-Gm-Message-State: AFq9FYK8qo6QX6QDqg/kHIJbcmvic+oY7tF+gCsTbTidRVCIOPKjokWn
	qJcIypHuCQ1W/Pqf2/FpljltnpT3v/Xna9kFa9Hu6CFu28NQWMGbq2YdelbKcPXDs00bs9qxGMh
	3L0Q=
X-Gm-Gg: AYBFou1fGFU5a4UDVE2MG8+NVop6KNR/a2nSxybZtjx3ngEFDZD9Rdgztgwa2DES2fi
	WX2f/guQt9dWKMnHlxfeJ54zfc292HmR3TRROindNmdMuljdcaSwYBJC8xPurvoh6vln8NTJC6u
	SIFjHepekaI8EXpyrjX7/RqYT4pEhb+X5EFYfP9cto4xc8v4ZlK8QVEznk200sbIXeCcOdXdur7
	HSLSSADgw8pSL3xXZtsdMkSWP1cRs3oLM0x39rRSo01mG70DwezpiTWW315Mr37F/3Anf1SGW3f
	9a+Sro2sj1pofuw7ztuykztFxVqeXEOmK6fa5z2yZb4gdD1wPcSxSIeW1O4odKlksZeMZjE7lNQ
	dlkmyUTtxOqEzlY1qsn/ZjpSIJ5PG0pi1F4mXIBx8gZEZ3K430hvsUz3RwM9nbfsElDt3snQta1
	mopLPJHFqAwQz1jLoDAbCye73V0ueibFPCwXzhVeKQTHyQ9LlIahsYom6CImMXv1HgNrQVJ+i9L
	qbmdWLHtO4Wp2yuQEEJTKwMfHp+L8Gj3dFeQe0=
X-Received: by 2002:a05:693c:65d7:b0:351:202c:c7a5 with SMTP id 5a478bee46e88-3515d7183femr385288eec.0.1791328794653;
        Tue, 06 Oct 2026 16:19:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:63eb:e7f9:1d47:7d47])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3515a8b7c5dsm1985276eec.0.2026.10.06.16.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:19:54 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 04/13] media: venus: Discard pm_runtime_put_autosuspend() return values
Date: Tue,  6 Oct 2026 16:13:32 -0700
Message-ID: <20261006161337.4.I574fc3def9965f603755a968ae88309aafdfa285@changeid>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261006231900.3230373-1-briannorris@chromium.org>
References: <20261006231900.3230373-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagating the pm_runtime_put_autosuspend() return value to callers is
not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

Accordingly, update the Venus vdec and venc drivers to simply discard
the return value of pm_runtime_put_autosuspend().

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch is independent of the rest of the series, except for the end
(changing the return type). I expect it can be applied by individual
maintainers, and we pick up the end once the dust is settled.

 drivers/media/platform/qcom/venus/vdec.c | 10 ++++------
 drivers/media/platform/qcom/venus/venc.c | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6a43ea191da1..35c1b6ec1f9f 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -644,12 +644,12 @@ static int vdec_pm_put(struct venus_inst *inst, bool autosuspend)
 {
 	struct venus_core *core = inst->core;
 	struct device *dev = core->dev_dec;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&core->pm_lock);
 
 	if (autosuspend)
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	else
 		ret = pm_runtime_put_sync(dev);
 
@@ -671,7 +671,7 @@ static int vdec_pm_get_put(struct venus_inst *inst)
 		if (ret < 0)
 			goto error;
 
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	}
 
 error:
@@ -1200,9 +1200,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		if (ret)
 			goto put_power;
 
-		ret = vdec_pm_put(inst, true);
-		if (ret)
-			goto error;
+		vdec_pm_put(inst, true);
 
 		ret = vdec_start_output(inst);
 	}
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 79acf7c1ec9a..3c7c24dd7159 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -617,12 +617,12 @@ static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
 {
 	struct venus_core *core = inst->core;
 	struct device *dev = core->dev_enc;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&core->pm_lock);
 
 	if (autosuspend)
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	else
 		ret = pm_runtime_put_sync(dev);
 
@@ -644,7 +644,7 @@ static int venc_pm_get_put(struct venus_inst *inst)
 		if (ret < 0)
 			goto error;
 
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	}
 
 error:
@@ -1275,9 +1275,7 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto put_power;
 
-	ret = venc_pm_put(inst, true);
-	if (ret)
-		goto error;
+	venc_pm_put(inst, true);
 
 	ret = venc_set_properties(inst);
 	if (ret)
-- 
2.56.0.360.g66cac248cb-goog

