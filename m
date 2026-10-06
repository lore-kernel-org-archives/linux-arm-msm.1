Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E5A4FC8C1
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 23:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328817; cv=none; b=O5UyXIN0T7dP5IpLZxA7wkmxJcJunSRPGwbB/eGIfmF3OElxGgdZOnCLgzyRiXfH57KI08dugnlKD1cmEJSCrEQjH74sY/XsQEBt0tyudfcdd2/2D2IFI93/KySp9QUnhlZT0qFZ+SH9+LCiUhCQ+yJCsEXlsuSiDmto9Eu+mCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328817; c=relaxed/simple;
	bh=yUdy2A8nvym2Ev4BV4bNz7ogIY937aa1By8o58LvKFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QvsA4qmnbVawr99Qr8X/ZBPHkVReym6CeiIS5amCAqJ0rfn8sbiZeQla5r+UhL3dSfyRSjtBdZkZcyS+/Qwz9Fq7qFntxvaczi/+Ng4/7NjRQ54wIpqyP0deKTcpjy0cc5PYZ5smgOEVbgHrfuOhA3WC0ccJ3LIhABegXh1bc2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rg7fwMvY; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rg7fwMvY"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-34c89609923so254027eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 16:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791328797; x=1791933597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMr+syj9Sj6lk34GvK8oCOH9vKPvZo7PZuO82URtmYE=;
        b=Rg7fwMvYmwqE4+cnCE+MfRqoIyU2KTlqSSmF0xLWdVUh1J3WKK8UTvtgVY3D1icaTX
         LnBowlAGo+oPHrlP/d1tn1OBNyakOl/0jlNqtD9cTe40C2t0WHbwrXrTqHxLhP9SAQXf
         KMSUZ+Zum7zUuYDH0/P2XogLAESFqAY+Vjxss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328797; x=1791933597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KMr+syj9Sj6lk34GvK8oCOH9vKPvZo7PZuO82URtmYE=;
        b=RGA+S6RMuU1r6F0vrTvrKJDj5+wSwDwwUi63vy11PK8twUcP7hkEDVhWgRWwr5aTl4
         0zw4E41zsoqlCxhXmzszPjdtjjTH1sXI+NYWJ5FRWOyyGL3mkRTAy6KhJbsXq+HKK0/8
         qjH1ylY2N2J4Gdbry+sLCjRe6El9sWFPCJV90lvzpHL5y4bqnJPqX8d9HvUskSlMNtFT
         2VNdYSmxtUxOgagJj/wM2dqMt+hetH0sPiuqPlg3CAuNxr3O1l78veI5Cw2IU0dvAZIw
         W24NkeJp9TQ+thBPkz4qIX3bVxksf1JLUV7EvmmHHvfwOiUXxngSQx3G8aTG2XTknR9L
         JZuA==
X-Forwarded-Encrypted: i=1; AKwUvBxsGp4jycvnkgHC/rZvO6XsvnnmEbdGfFMdynexBaJ3HiYPXtTB7GQwRn0uq6+5k6f2pa39VTJn6g0K6xNV@vger.kernel.org
X-Gm-Message-State: AFuF++njEeyiRQkaIoB0N7G7EiExEnuCed+O0DrbDag9Iix3gvGhcJ7n
	vAm5aelv2+ZC3GIpDDZDglay0ohdTRACl/eQUGPB1ruRB4HlE1EXGVdrJqQAAfNfSQ==
X-Gm-Gg: AYBFou0OeCLrpoECktGkAkTCFUuHLUXJ65q+M6dIMoovPZL678xkrN/uMXTQS3WkNXQ
	njRaen3OvC8QGMXBO3jvnJSSws9HNnVM0CVBPpwvoMvrubEBlQ/0u/wPsCsuCvKxqeo9/zL4KfQ
	v6yTRFtz8rido+05dZivxteq3dXp4Tcd2gErULH2MCri2MDsncYHzUVm13kVeBrxcAf7wJbYUg/
	ASws3DBWVPK4yuj6jLQ06pJMy6VMmFvvViy1wb4lvVbzGgza1WEbFJD5gVp30AGGK86Qj4IE3cr
	dhb7dV0ZEM6NX4kc7crLLKLxoyF1sPBn8at+UtYfBzYUNDsRvv/M0YuMgMSN3dqJ69qO6EJf+QZ
	aWHclRn8dFR23qAGeY7gYQXSF6GoudKn+ioKEvwh6+/qsm6qw1LDsR1jLNzvPlBlO9FO1HuolgM
	H0IAFqWf+dhsVGpUMGHltQcVfpAO6ILovROvGwQQy1JuJVmCJDoLXfCXAMygz/bcfPk06QOM+wi
	qtTdWupxojOrWUIjY47gsg6R5FMRcc+D+37Gw==
X-Received: by 2002:a05:7022:69a5:b0:151:2e62:fe5b with SMTP id a92af1059eb24-16206e105f1mr405998c88.22.1791328796966;
        Tue, 06 Oct 2026 16:19:56 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:63eb:e7f9:1d47:7d47])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-16166121f2asm1806889c88.4.2026.10.06.16.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:19:56 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 05/13] pinctrl: qcom: lpass-lpi: Discard pm_runtime_put_autosuspend() return values
Date: Tue,  6 Oct 2026 16:13:33 -0700
Message-ID: <20261006161337.5.Ica4bfaf179a86c8d77f8f845826602914b81181b@changeid>
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

Passing the pm_runtime_put_autosuspend() return value to callers is not
particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

Accordingly, update the LPASS LPI pinctrl driver to simply discard the
return value of pm_runtime_put_autosuspend() and return 0 to the
callers.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch is independent of the rest of the series, except for the end
(changing the return type). I expect it can be applied by individual
maintainers, and we pick up the end once the dust is settled.

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 5fd4a4eba654..b93f661c36e5 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -76,7 +76,9 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 
 	lpi_gpio_read_reg(state, pin, addr, val);
 
-	return pm_runtime_put_autosuspend(state->dev);
+	pm_runtime_put_autosuspend(state->dev);
+
+	return 0;
 }
 
 static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
@@ -164,7 +166,9 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
 	lpi_gpio_write_reg(pctrl, pin, LPI_GPIO_CFG_REG, val);
 
-	return pm_runtime_put_autosuspend(pctrl->dev);
+	pm_runtime_put_autosuspend(pctrl->dev);
+
+	return 0;
 }
 
 static const struct pinmux_ops lpi_gpio_pinmux_ops = {
@@ -261,7 +265,9 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 
 	mutex_unlock(&pctrl->lock);
 
-	return pm_runtime_put_autosuspend(pctrl->dev);
+	pm_runtime_put_autosuspend(pctrl->dev);
+
+	return 0;
 }
 
 static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
@@ -335,7 +341,9 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 
 	lpi_gpio_write_reg(pctrl, group, LPI_GPIO_CFG_REG, val);
 
-	return pm_runtime_put_autosuspend(pctrl->dev);
+	pm_runtime_put_autosuspend(pctrl->dev);
+
+	return 0;
 }
 
 static const struct pinconf_ops lpi_gpio_pinconf_ops = {
-- 
2.56.0.360.g66cac248cb-goog

