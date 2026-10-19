Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426677;
	b=X2n3JokfsJJ1hy+LQiD4XXumiJrNGxXtLOmYal6nEuAwEX2gZVcDp148AVD5zJszTIO3
	 TO21+Cxw1JcEMKI900P0HWlsD3ODnwwU9MaTjzGoEXjq9Z54gC4NtyyaNIXva0sI5Y3A+
	 jQX6a9rmakkX/Sj4OAAPr8hQIeUCEWtVBjBC+1TLMWxPvQ5ND0aVqhC88YlirozFdla7W
	 ykHj6+G7NDck9OvEeWLkkHDe/JhXftCf8Lg04peLJ7tfrG/MTnlsURWjKAIAYg02k4AjX
	 0n6+MnqpymCfPHOdR7Vs/rVVKdaRaowa5GHwRYy4G+JT+SqyyYEvQSmxWOssG/0Fk7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j9/YY5ZYigZ1aqT0I55Hlkm3+bQMNT99YHPRJIImTVQ=;
	b=3UMY1pkXqzSm+Vdd2WUqp4/lbZcTGuKmF8LO8jCFFSlbh9Vtt0inEmvWUlRU1abHLY0H
	 CJSdZqKnls3pQrgCdAjvM6ibnm2wAVODQoEwpBOGhtwNZGuwTRGYuUNHuSIWIZirw347p
	 Sof0W9jTiROW1/3sPFI5aAyUsPnukbbG330wXIW4/99RS3UJcziDcvZSw7prKpX0IB4LX
	 sni/OQBdthLRjS+WYBur+WH5UJ4BKDjJdqN6SpDKm8yO2V9yJeDl0zxdpF4lZCvJaesAt
	 yMCb2kJ85jUy1ecKBBkTPCO6uKe6zY1Q3CXhiyLnEE5PbXrt7O9ewBXQGJQsZymiwXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="qDF/voXd";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F80606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDF/voXd
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-353804b591eso4394327eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426676; x=1793031476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9/YY5ZYigZ1aqT0I55Hlkm3+bQMNT99YHPRJIImTVQ=;
        b=qDF/voXdFABxdK5aqc6szv0m6DU68u4FnQLKltgfFFS9FTwVcQUs5mpmv1ar6qArnv
         EBAcMNZLwr7QOzfMGz0obGeBaSWYonpdRy10XrrpBY0DDamcAQfFKjtJHYfwDpfUzHVM
         JkGbBeEjtS0MwWX6GhHuZVqQTWpb1a7HwJhP3WqZGzT9gH6+zphy3AujM3rdT3SvqIAA
         9ZrtZjvxtQSAkbKFQSdJlguPJZdG7NR0tW/ppWdUaauv5s81lcVehkNTjn0Hb3Zd3c29
         j3ZesgtL1gOVmOrqVXSP/mWCbWh2aWyTL2unyetNjHOL3oSBwmHPGyRAXuZYLBDJuLWv
         WrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426676; x=1793031476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9/YY5ZYigZ1aqT0I55Hlkm3+bQMNT99YHPRJIImTVQ=;
        b=NfKePHB+flpPOsebzZIG/Go2yNd5Xa3NdG53bcaJ3kaiPZVcJcK0VspabpCCNcRuqF
         i01WapK2H844w0XI7iu6ns/f+TkdD86aMBl8tz248C3cqvO0uu/iv+GF4QCcbdD8kJuU
         f/ZLY2wR3IlK547eJS9dUlvLbujWoQlFgugb3zciTqZn+VMcbvvnSPpRsZxAOpcacm/A
         M4PjOlfynbZJ9T3smPkM/M3HqQFZlKdA2NTO+O0NKcKrnoe71l0x3kXeviBnJTun2nqP
         lOOET0DaZTZZri11NzJTTpph8m7qXCwzFjfuldCnS5mOz401g+q4ncGgfuLo0LTOYczY
         4Nfg==
X-Gm-Message-State: AFq9FYJOn/eAetECUylR2Lx7CQxTg03eizqYfJNj+6wYgRIkUuP6/D/0
	LfBHvwnM+2f9qBxhHrowf0n+k54sgC9C07imQmGUAZDt1p+s0VSfQlkW
X-Gm-Gg: AYBFou3/6THsreJaE/NRhGQNGRkCEi8JMsBWkt4NviYwnzSD+Cd2y6agVzRmRpzwqVL
	e1j9IwD4l/UaibteFb2rKtHMx36pC3fQznwUoiRZuWPPvq0oYpXtnrJMQX/1gKdmlHVU7cEZ9uI
	zneXoGJ8YrfTD4vPlFcFc0rdYStzDAeNTJswePWpUzWyFO3DbbWprA69i8YBsmccGn2pEWPp0Wm
	Vwg/rm7n5VvFtFJkQzUi6hlGjdO/4Fgu416Tw5echU5G510hXI1NGef9Ur1Ct/xzWpr618X5Stl
	EJmG+wn+6m+gD9suR0Fcxw79IPoetg1GJ/KEPjKfFC7rEOucxsGqCTNf+ghNs4BtphVrCpklPpp
	SovgIMNeC4CLhX+wzoTWMIfdr4QmqFDHrlCJsRPC+8H7ZilSceLm+gXdrxkV8yPjB9iYKU1udSG
	nzzmSTx6krRO0EV9hGM0EV87YgQbhslqL12l+qfOAvGB0/sC+itX8bUj2uBd9rB6yX9pcIV/Rpl
	NQJ0gvzT7o=
X-Received: by 2002:a05:7301:4614:b0:35b:3181:80e9 with SMTP id 5a478bee46e88-361a185eba9mr9880037eec.20.1792426675354;
        Mon, 19 Oct 2026 09:17:55 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm33410985eec.13.2026.10.19.09.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:54 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
Date: Mon, 19 Oct 2026 16:17:39 +0000
Message-ID: <20261019161740.2384-3-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019161740.2384-1-sushmit718@gmail.com>
References: <20261019161740.2384-1-sushmit718@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera GDSCs are collapsed between camera sessions. Without flop
retention and with the default clock-disable wait, the IFE GDSC can
stay stuck off when it is powered up for the next session.

Program the same wait values and set RETAIN_FF_ENABLE as camcc-sm8550
and the downstream camera clock controller driver do for these GDSCs.

Tested on the Nothing Phone (2) (SM8475) by running repeated camera
sessions.

Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
Assisted-by: LLM
Signed-off-by: redducc <sushmit718@gmail.com>
---
 drivers/clk/qcom/camcc-sm8450.c | 45 ++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 4025db23d1a9..9f1dd51db0d5 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -2930,90 +2930,117 @@ static struct gdsc titan_top_gdsc;
 
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x10004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "bps_gdsc",
 	},
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ipe_0_gdsc = {
 	.gdscr = 0x10078,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ipe_0_gdsc",
 	},
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc sbi_gdsc = {
 	.gdscr = 0x100d0,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "sbi_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ife_0_gdsc = {
 	.gdscr = 0x11004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_0_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ife_1_gdsc = {
 	.gdscr = 0x12004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_1_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc ife_2_gdsc = {
 	.gdscr = 0x12050,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_2_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc sfe_0_gdsc = {
 	.gdscr = 0x13050,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "sfe_0_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc sfe_1_gdsc = {
 	.gdscr = 0x13098,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "sfe_1_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
 static struct gdsc titan_top_gdsc = {
 	.gdscr = 0x131dc,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "titan_top_gdsc",
 	},
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.43.0

