Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EB918C008
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 23:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500860; cv=none; b=EtF2COpNv8nW3aXnA0PiSci1oq7GqTFkjgf4vrSJ0AlIfr2kitvsw2KnbetYuZB/L01ao3nyzjs6dKSMp+uArqxP1tS7PZN4b935zCZt4Op3zErtauPSiJlUbzjBIbL1un6zuAszOX5cSyDeT2sz9+ZbFuR9XXqXHxhnpdmhmWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500860; c=relaxed/simple;
	bh=Uo5ZRxOWSc6BTc5xSM/Az9cMdX0GLlELbAn/TockEyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SWcI+rTmYV3rfKG9B0kgxbtPZRG2fvQJxdxPsvfyaZQa+lWYj9iLG+/GeYBlOPoQtS7DfncKO0HcW9hkGPwKyFib7efi+p+rh/f525bFed8DbJF6a3uclh1nb6JED49TE7g34CkAVDprsTyQqnf0z3mlKghLqVTmmOvYmGICJQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuO9pcz8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuO9pcz8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso52805275e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 16:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791500856; x=1792105656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CLE+b8D5djbP1RTNiaIJqryFeKHBRiPy92yjjm07OBE=;
        b=IuO9pcz8nq4VOCJlJhCpdD2kbwsfh6qLyGdBem5Q7arYYHil98IsiX9bXURmFR8l5i
         ZKZW/kot0SNnhZppP0UAgDAXm/B7dkImrDpqJaVM5sr4A9oVe1RJlqKWcOExkREvHHr7
         oEaI7xBg8LrSsU5oDwoOcW7SrRYge8Lsvonoif7gBhrTKVmVqMFhe5Qhoevm6vOzdJRa
         IhDjewQhlIMTB/Ezd9gkn08koRz4JopIfcVTDQc2L/uOIEc2PBnNoBpaH3Ldotv3zvbs
         NsFNpHU5q+HM/GEaAsMK33JlIPieXhb8mn5F2Wfo7IV34QrwWQcMSgYwyeDdI41FdcVr
         UWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500856; x=1792105656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLE+b8D5djbP1RTNiaIJqryFeKHBRiPy92yjjm07OBE=;
        b=lSv2E8gR4yfmO/JfnnlqsZDN1AvLa0ZLpsl6gQhjh8kzfMo+GCT8mAbMxA35FmeAX/
         e8nDWRQ2vpXLxzlleBkqdRG36MeW1DdzgsAkJXyy9l4SbilfZmK3n2iNlaPRh7wWbdd3
         LlX/8Ugl3MGQDveGijnQAsqEei5YE3/BGv3fEhq2dyfP6lqXHjq8/C3lM2Kc0itNofu1
         bzATTILYYb33YpulS8T573bTbexw2QQbxKEfCUxZAL1BwDk9b41zsjUNnwF4uBm4Sl2R
         mbXbTpo1h1n0e5F/X0ZAe6ynUUpiI0oqohMogEd8SXffGGf77toMxpWNqxK9ZhEFb1Pw
         1RzA==
X-Forwarded-Encrypted: i=1; AKwUvBx7kP5UGlklOXCO/f84sS94uxW0uCBHDCGiHHy+esFgHmA/sMDzIfBvoyoyMbfHSx8Wb9RURrPcKj/L5y6g@vger.kernel.org
X-Gm-Message-State: AFuF++kFKm8MNwD472JOUqGNj2G7YXI2983DQEtcro0TkuSEQoyCck8S
	hMm/yTwmeWhwBkiMchsYvhZqlO8QddrYTkqMNZD2eT47O5k5vTbbsR02RPpANA==
X-Gm-Gg: AYBFou1DIXVfDqO63C80eyI1gCiVU28dH10zJEHaUPTzIGViavfq5T5zqHuP8xZJOmc
	F29MGp22/EXkWwhaulxL39jzgZ9BhU4mSs9kdWkEM2GMrBCkAJRffHfciXyva16qzU1K9O0ovqH
	lAcHMuIkuSOZm7TtqTb0v6OsyaINICxUOQxCPYY3B0/S+ZFdQP20Mxag9hJu9JeqIOahMZ52GR5
	1KBpTPSeGL5NiUiCFIV38ZLlwAq+s8E6U4AA4vInkRR9wbBVRn2DQM2B6nRF9tVE3R3m1SO2bHe
	4C8gHk9e5O1c8nf8swO/TfkODoFy4taOexjoo5TbRHVhVGUvWtDTcSXo22NjyDeaYkeVqPAEAip
	rWB2j+eduHXhI7nW08CHmowHImapWTOP0Ur/gziJzKlzqpMHAHnikgQ0adxhxfC7tjN28en2Vjw
	pkjd2eCpJmXKu1h89SGHWnEcQIKis5Nv4M5EUBYXqBLEoWS2pkSq4z/tER1ROBbfPZ/Qzoj8Irj
	i16adI6sA==
X-Received: by 2002:a05:600c:3e08:b0:4a0:1cfd:314 with SMTP id 5b1f17b1804b1-4a180455651mr144799455e9.26.1791500855826;
        Thu, 08 Oct 2026 16:07:35 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.178])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9abd3aasm626372f8f.32.2026.10.08.16.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 16:07:34 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleg Keri <okerixx@gmail.com>
Subject: [PATCH] i2c: qcom-cci: skip core clock rates the clock cannot provide
Date: Fri,  9 Oct 2026 01:07:25 +0200
Message-ID: <20261008230725.3228-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cci_get_required_rate() picks the lowest rate that has timings for every
active master, but never checks that the CCI clock can run at it. On
glymur, sm8750 and kaanapali the CCI clock table has no 19.2 MHz entry,
so the request rounds up to 30 MHz or 37.5 MHz, the timing lookup for
the running rate fails and the controller does not probe:

  i2c-qcom-cci ac16000.cci: CCI clock is not at expected 19200000 Hz
  i2c-qcom-cci ac16000.cci: no timing for mode 1 at CCI clock 30000000 Hz
  i2c-qcom-cci ac16000.cci: probe with driver i2c-qcom-cci failed with error -95

Only consider rates clk_round_rate() can deliver exactly. Glymur then
runs its CCI at 37.5 MHz, which has timings for every mode.

Fixes: fa1eb3af12fa ("i2c: qcom-cci: Enforce the required CCI clock rate")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 6d8be7b8b79d..289368c00fe4 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -586,6 +586,9 @@ static int cci_get_required_rate(struct cci *cci, unsigned long *rate)
 	for (int ri = 0; ri < NUM_CCI_CLK_RATES; ri++) {
 		bool supported = true;
 
+		if (clk_round_rate(cci->cci_clk, cci_clk_rates[ri]) != cci_clk_rates[ri])
+			continue;
+
 		for (int i = 0; i < cci->data->num_masters; i++) {
 			int mode = cci->master[i].mode;
 
-- 
2.55.0

