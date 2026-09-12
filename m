Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CDD155757
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171648; cv=none; b=OTCV/ws1tyw4hIDqvCEozS/Iho/ZTZheWyJ7Ft+TiC98++s3S/BDO3XUUTZhkL9KabLrG/ixVXn+j6kc9htd+RS8ToCq9ZcrYxVmV+UsHYpevAEMMIVzPB24RFVWIBLVeJ/33kv6AiAqDl/xTyorFOF8BepTcRyoTUxDViPmDG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171648; c=relaxed/simple;
	bh=8m1R80XfDZbh5zUhLZAcOUU72JG3PqinZPRM3tOCJuc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gc1NfXqmJcUdJgkF8oSLcCEYYVMfDIWygGiT7aEcv8Mf3nFyZNJzFvmlL4vH11glCIkSBTegr8ccfHyTOjwg+T6JpYSVsndDhDsJ8Tv1ioJ2RK4A4aKUL/0LSkLolAomUTZoRKnpRegNOw+J1FwVoNun/iRPsMWC3QKrrz1OrVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSjBh8ik; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSjBh8ik"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca94bso483305e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 17:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789171645; x=1789776445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Txatduw7g2Rcis/bJMKV9l341+MbMhD8Kyx8qAkEHH0=;
        b=pSjBh8ikIX0hcVexn4ZqdE8qq6PaYd1s0cPLovSEgnI/qaqWBbrLaFXax9Ho/ncWge
         0YF1wXq39lMIOrgXL5N+hQt7kftHDV7wPdFxFmIyfxqOJpgE+eeIVQFIOshH0FdC+t4B
         uXbgmPMCNfOJUeVMg2tKI1xIy7XLMT2KdPlEEQl0odDyrx/F8qyvjd5/Cgs4Bg8HjrKi
         4U/GqHX+TeWv5pVSt3SUhMQ3e1CzgwVBkhYngE7V0DJ+3Yxsjkj3jxbQzA+2kHz4dcqc
         k5/HPb6QK4AU9Tu0fe03VmDiSL6NWk64PxgX50GSbshvkNKTJYXpqQ1DNH79th6I6PH5
         a1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171645; x=1789776445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Txatduw7g2Rcis/bJMKV9l341+MbMhD8Kyx8qAkEHH0=;
        b=ffYvMHPaOU9gVFEoYrrxNR0FLNHDv/GyZI2r6FmQRrO8YTUTVYEuKiAEa886Caf4Vy
         1r83y7TB0kx4fRv/bwh66IJ/C2NIRq/+yvGQ9FE3f4OvTEcUwBGgXitX4BZ5G+RnAm+e
         +s+TyR2jrIF8k8coBavT4A0bDv9RQFMSpEcx9IxD1MBg6se5uzNbIkMWsX/R+9yVwxCu
         VFNl/b5kotLmVfLFT8Q9K2wCzm3EtlsqUnKkD902DriarurjIa5qL5j8rZ8bVVaTGLfE
         INSdRGhTOaHAvbJWl731t6Dnaz3iAPi5gFHwjFcZWZe1NLn+17YdcW5x+V9XHffhFxtT
         9BGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfKyF5MJYLe1Z4d4Ot5/JNb4NNaQ62y3h3Mnqm0brz4/D0GP+1Jtbd1+CnsUpTpf+n/vapC81wzUJxuIcD@vger.kernel.org
X-Gm-Message-State: AFuF++lBUeMMn3Ohq26jcZP7qNsDdZHxBf50NMLooPaxPMUu/W5BF6Pg
	XctLGKXmwLRR+U494IksFjAvcYUjuXDJh7TpRmFFfaBOdPCjq0Xsgtjc
X-Gm-Gg: AYBFou2wUglsL0wMpuuMviT86pLYPPrYHBwtUhze1mtmqpg+5LOON+Jk+k4Hr37d+Be
	1yofgMMM7lvCIo/B8W0bjDYyjOEJTfEqCi5iVvSJsd28lT2Ulj7A8c2dfi1ORkDahnLEviB4fgm
	npZgDP8/A9GXhIPJo+a9ZIGSDMX9pl7vdiuuCX7q74I4ox8ZcT15LWPb8bMnOXTIUoGZAdBClNj
	pR71m8DgYb3ZY76M7JNAfkVyqKuEgY+3f+HE3hbc7Hs5WuabBm6giRGpLT0MAtIIuXPM2NJT//k
	e7yucYsq7f7ipx62M5y3ijuEa8a21m05p8iM/SedOa0plJlXOZTeUB0wTG2AdJXc1KKPm6O2OxJ
	7V0XROY7qeC7fNY72N4cL4zqnu8UtvSy7Rx6+ygoIpT0pZD4H3vVyvvJrujM31S9a4d1eZfuYjT
	+wl+x+1jnXy58CPWr7lBgn77XoIANHXmQyiK5dC6p/sTvZqxJeIb2jvxSWi+DYiUZHpEjIcwWyr
	mCik3Rj+8yw9yMKIBf12tGn7Cly9QPfUJCeZXaITyVq365czBp94E+E+Waz4kSUIUePwZXqTTM9
	w4UVtldvb+XZGFC1T3DJFLKua2HkgsKSMVB4lg==
X-Received: by 2002:a05:600c:358d:b0:49c:fc6c:bdfa with SMTP id 5b1f17b1804b1-49e6cbec302mr4417405e9.17.1789171645506;
        Fri, 11 Sep 2026 17:07:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60a8a89esm108823005e9.1.2026.09.11.17.07.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 17:07:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-rpmh: Fix the return value in rpmh_regulator_vrm_get_optimum_mode() kernel-doc
Date: Sat, 12 Sep 2026 02:06:06 +0200
Message-Id: <20260912000606.34614-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpmh_regulator_vrm_get_optimum_mode() returns REGULATOR_MODE_NORMAL or
REGULATOR_MODE_IDLE and cannot fail, but its kernel-doc says "0 on
success, or a negative error number on failure", which was never true.
Describe the mode.

Fixes: efb0cb50c427 ("regulator: qcom-rpmh: Implement get_optimum_mode(), not set_load()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 25c14de3cd8b5e77b48f168d1afa0f3ad7ab9d5e..7db5730240e257c056e5e83e36e9b7816b44db7e 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -400,7 +400,7 @@ static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
  * This function is used in the regulator_ops for VRM type RPMh regulator
  * devices.
  *
- * Return: 0 on success, or a negative error number on failure
+ * Return: the regulator mode to use for the load
  */
 static unsigned int rpmh_regulator_vrm_get_optimum_mode(
 	struct regulator_dev *rdev, int input_uV, int output_uV, int load_uA)
-- 
2.39.5 (Apple Git-154)

