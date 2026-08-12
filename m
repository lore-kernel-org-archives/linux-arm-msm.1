Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFF6418A5D
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528004; cv=none; b=J3YqI+TNHzL4VIAndrlBzB0ets35/X3aoB8qN+jQGV91p/T21CdqdkviewAAqOrkvYTmedxXk5r8KaCqY46FP8F6Kpmfv9mkCST+IQsMQRQsTvNcAs5hAIstfq9dYbV9c6xxSDCFv9lqXaOZghFU5S5cauAhHXI11AuyM5AIGyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528004; c=relaxed/simple;
	bh=fmRq3OUJCI0HOwd9Tp5He8EsVLoZ/GIvCjkdw7TRQcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TT29fVXZ/JgubzbMHiNzCLq5yU36LzrL01PTim+nirKjxpoS9QARuwFLCaRJjxYbXouaZt/LH7tvVMOQ4qwH0SXO9rOMPOMZibssBkzxmhVRWYVf819KtB7JjB71lfbVrMIHhJ/otGEP9amd/3J3tqgIzSkobvql1mepw4oxsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gE9NLlsI; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gE9NLlsI"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso519070a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 02:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786528002; x=1787132802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lzbbraV1K3+6Tojc98ovuLlmriNG0/xql/GJKFiqTC8=;
        b=gE9NLlsITE48tTR1mnGp+xuYiOhAy8Gdl2rRcgKUVPh3CK6ANOpOr4Mc/mM80iSfyo
         FQzK98bZBGKQrn6kaMAao0n9m7LnNJigr+hbuNm/m0oYcvy3GkbBeF4YvBQgSriUpMQM
         OVbVIckkqNeO+K02lqF54AdqC3LHOYtig0r8h7WzyJedpPXbkZP8A/e7ezHEmIwe51qi
         yOSNSMxJ3ILPqYkhsLbNbDIxQ3za9O7WJecoonMzjiByP1QBiJcmRawtk+Fxu+JZ9fGr
         dgOPt+K1aYIKZCDrzB1jFp8aST7lXKT9qYeHHs8UsXKOzB714tvt2f6r9yeA+n2qU6Iu
         Mqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528002; x=1787132802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzbbraV1K3+6Tojc98ovuLlmriNG0/xql/GJKFiqTC8=;
        b=FzL7aeclsxsG2ZgWWyxYYeZuvwGA3xqzke+QS2uCjfr0gRIqPo5bRMhT/7Sc/qE1GN
         YdszcBojNoXGl5GrrrJ2tVnePQMtiGJg0Qe+sUqcM+18VwzKj91c3PuKr8g/BeGbxsZy
         7xJx6YpeLLaoK6PPtGHR4lmYRrFd2rztEhZxygHMbafHpwMI20DMGU94+LqGJdXZR0uy
         OWXbS02dF1O5MbUW3MBgwCSMaZ/Au69M0Ph49w2Nqlz7cz19e0tOnLlPPGdwKu2/5+tD
         3cYdZR8ULpGWu1FXAGf7/tdt7y7TjDLakWSzgFMOwbc499jNI3TvTakVhgAruplHYzaQ
         WASw==
X-Forwarded-Encrypted: i=1; AHgh+RphMLuFFHvzZG4FFM3d4iz/sb8WrBNVnCAzhLvmbzL3eyPLBqbCO+em6e1NZBqU11jLKEtJsiy1yCNr3DwE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3RRZoqyGwNhNp04hZmIbi/+sO/7CxcsyR7x+f35BpHCFJO8by
	GIEXi4CkrCv1q8D3ydzLtiV/xFILWXU7w7Ju+mxWT69EIw6x8rkMg8qi
X-Gm-Gg: AR+sD10CLAUvBMCiJ5UtVD2iYgxKZkIuoaR8RZqsMJ9f24EPJ+HZnQVG4j2qNLqMmT1
	a600kAPbn/l4fOq2SCu8FivdDJfA5dz5b+JwBHZbv4sR1m9YxE79tZ4CdxVUp20e1Nae3F/39/W
	dXTKLeHXZtdrsq/dqRp1VIPB8zQ0hLoytjRmmGIUkZVF3tXSjeG5HsRoy8irQCq5UOLQDNcL7CD
	nG+cVdkVQcVIuwu2wUa2F6RC/7JHuPtRgmexMRy5NRWVFvJqOl3rscUcAqn2RH4brL0NkdFZOk7
	atUqrCCcMZKmKq0lcBrRFidtvn4G0zDjw2xRRq8DYAPkHXETX1yjjAp8NiUvRgBd3CwOB28p032
	NRxN5H4APp21kPCqTKVmRI3anCXDHiKz58INvGwtAT4VG83eVS020OO6/NE/e+M7nk47MltwECz
	+jqp6ipxd+Wkyg//4hh7HGBLhsT9U7fzGdMDNT6p00rJo=
X-Received: by 2002:a05:6a00:4089:b0:848:2ae4:d2ba with SMTP id d2e1a72fcca58-84fb555d354mr4174309b3a.28.1786528002311;
        Wed, 12 Aug 2026 02:46:42 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbee797c4b0sm424557a12.1.2026.08.12.02.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 02:46:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: qcom-cci: fix autosuspend cleanup
Date: Wed, 12 Aug 2026 17:44:25 +0800
Message-ID: <20260812094425.3515179-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cci_probe() calls pm_runtime_use_autosuspend(), but the remove path
does not call the matching pm_runtime_dont_use_autosuspend() before
disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without undoing the autosuspend setting during
teardown, this reference is not dropped and usage_count remains
unbalanced.

Use devm_pm_runtime_set_active_enabled() to manage the runtime PM
state. Its managed cleanup disables autosuspend and runtime PM and
restores the suspended state on probe failure and driver removal.
Remove the now redundant manual runtime PM cleanup.

This issue was found by manual code inspection.

Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index bdeda3979c48..25b6e4e9e3fa 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -595,9 +595,11 @@ static int cci_probe(struct platform_device *pdev)
 		goto disable_clocks;
 
 	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
+	ret = devm_pm_runtime_set_active_enabled(dev);
+	if (ret)
+		goto disable_clocks;
+
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
 
 	for (i = 0; i < cci->data->num_masters; i++) {
 		if (!cci->master[i].cci)
@@ -613,8 +615,6 @@ static int cci_probe(struct platform_device *pdev)
 	return 0;
 
 error_i2c:
-	pm_runtime_disable(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 
 	for (--i ; i >= 0; i--) {
 		if (cci->master[i].cci) {
@@ -640,9 +640,6 @@ static void cci_remove(struct platform_device *pdev)
 			cci_halt(cci, i);
 		}
 	}
-
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static const struct cci_data cci_v1_data = {
-- 
2.43.0

