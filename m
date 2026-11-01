Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793527445;
	b=2jR6sEaEztXK9OmkcHHE2fAWRa044ln4gswkIY0mXcZNzbQ/pLWKfRZE7KkFYQjv3sCN
	 MPrS9JOz44k2w7Bb9OMzcUnLRY4zalMvXLvYuUL2iVTv747aefGYy9zme3JvJgbBno8XG
	 0rOId/6vl0CYAH+2fkKVin3i8b8cTM4LNDc02exQVod08cp4pwR1SecbIdGR46oMAJp3w
	 YkfIvseDR3cG1Pjkzk4/WD8NtoExE/evvTT0c80INPvmJlOt/Sp2kl18N0CHJsRArKMYV
	 a/qiFOTCVApVD4w/mQuSM5s86VOJbU5vz8P62RRrNbt8UxqRKTWslWq33P03TRLAP3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793527445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lZQ8rHpkkfpRhUYETvPsbxBlPx9cvrEfEZIYciSVKHU=;
	b=yExZkmdLbhc7sHOnxwKWac9MlMXSG2fMPmaLSDhK8MsTzkdPe6FonbyTUZ5Dn4uAu4Ju
	 hX90Y1N1DXdkp/B9pIWpPaPC8cAi7Tab3aqt9V60abDmXx3MGMdwf3rVTb17h70x06NeB
	 HKaCHOGLaTfpIgt0l1C+0g3Yi70b0oVNbbH/jzJJVbNHacBf/DajH2fjTGvV8ZoLa6n1T
	 dfNwFjLZGzE2ec+jltYpf1s996VumeiT7TlNFkdr8t+cFCD/3lMH53hpK6o0FldPfWAzl
	 Q6owniQxqwSHgLjEwjN1DdRq0nHYIxgjQv+hPEhdZVL10C/LIF3de4NIy9pQk8J5nOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLOkA644;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4898E606A325
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 10:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4898E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLOkA644
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-369f33df08eso4194935eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 02:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793527444; x=1794132244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZQ8rHpkkfpRhUYETvPsbxBlPx9cvrEfEZIYciSVKHU=;
        b=TLOkA644h9HfpGw/SGS0NewdQGdEbuAjgwC6StfxYuB2bPe3WZ+EYXFOt4aEtJaIrh
         BBq3fFtIm8e++mbwBzQ+fZSH22eTonM421VOxPrOpBbgCOOHE107pqLSy+czZBRMeUq4
         TpaS5zs/fUFbM0nBc97gfHaxmVgwOLcU1oz5xqT38TmNJYGyOsXSVJ5cXNjXi3V6YOXx
         DYuOuWLmVqnDSDy3mmMs+r3Jb6DZf43fcoaGuMWC1kO6OMB9xrJSZzUqjr899avlFJ5u
         hJD0aVMe6ZKzT5fBN8mQVWpvK0b7/89Bv3F3T9pNqcD5e5KjqHhwt4I4ukZINp2YetK4
         bbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793527444; x=1794132244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZQ8rHpkkfpRhUYETvPsbxBlPx9cvrEfEZIYciSVKHU=;
        b=pmjNIfEvbiz+NCQgg0HnaRKrfxFN4qyYbfSocYitnUz+7W7EW4/AZpel6n0ibnaBAS
         ev2JAzKouUo5JlVp/eeJWjn0QfBsI5gpt4rbBYfej/MLXW/5XlOvmZc3TSoZAlM8usio
         jJwWfMNBRma33IDpO6BSL1tBU4p9KGyUJp1t/KgXOdqzH/vCo6fAtnfs0iRP9OejtL3+
         nYBSajNL1h9qIotGvIsqtF420CzEwiC2bouimFa1WQJ6D+gJ16tW6W91ULVvAM9CHbXY
         jILORK0Jw2xKOM2IGTOncnnW3f6e3OerYb0o06RiFp95A4mjN9WxEdwNrtwBOfeOE4gD
         MSQg==
X-Forwarded-Encrypted: i=1; AKwUvBzvAftIsBhL71CIsQLAy2rh+YIU4zgCZ9Iq0R7PmbeKhe85wqIbhIDFo8iIbWhjhYpCyjjdUZGg6BZfYfRG@vger.kernel.org
X-Gm-Message-State: AFq9FYIFl/Z76rAB9EqPzkiq0kIxjKjk4tGu6uqIkJRG0wEVlnHpiHRW
	434XAeh4BpvLyzTVgjBwkZ5eHENCYyxrbCva0GjHh9Ziuv7tLiygNRCI
X-Gm-Gg: AYBFou23r+Dt4iTv+F/I1F9MOuO1E1GRnbVWYbSAbZS4NcnIJGT5INum5juiA7Ai1+h
	RRysgXIzq4K6rFHEiI2PygfljQPRQ0wgEQm9RgD5mT0OmdR4FzYGzpaHwg2ccRINl8kJ0s8j31v
	MN7d4LejAIo+8dhJeD3k2KxEBG0FKrwfWehnRh9IcR19T9jqmxVRZ1S9v1cs20qEI0FSShwb4Cv
	jSmWU121eZD3gn3ry9DGslg0ebrWmqgYA5o9PZ/nCO4BxkrGtnYWrU8F8TER0DNinGFz4B72HZu
	SCZ6gk1ime4EQRJe71C9bl1l2fPdhaHTWBoETtgD/SoI04Vgc6B/Of9TwT+JE25hV4dPGD1FFLL
	qT1Y4m95z99oLdd8AM+6iAXjjRXLwO4dTAkcLXj6KBqZmHpqkGQySl6vxGSM+tfYPIbbC/3l7nq
	yBlLb5jaMIz2ZVr1fXjdNYLLGz4a+l/YujowuAxdUh+1xpYx0vuiZIekFrw1qQKDnBxI0TM1tQY
	VKEoSjGG/g46s2K4Rf5X0bYxArIhLwOk7lXDYVxhs9OlwBysRGY1sYcGdoxaRTVIG/ebbPJ6JrB
	duAqEAxSdYf80dHImvTQduOv73UjSxomTKb0j46CPBGYASvFdPbxZ4Z502UG3mOvO5mO7z1JGKI
	TE07suQt4+9IGJoQiGXZQo8iSqSCEsgp/lIUeXnr7ePauAuLlzAaZ3VRoOKr7gh7wHYFCmzE5Je
	IWfYu2
X-Received: by 2002:a05:701b:4511:10b0:160:6a5b:7edf with SMTP id a92af1059eb24-1ac5fd0852amr9931498c88.44.1793527444190;
        Sun, 01 Nov 2026 02:04:04 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.. ([2402:a00:163:3509:1f2e:5705:c23f:b6fa])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm26302562c88.13.2026.11.01.02.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:04:03 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun,  1 Nov 2026 15:30:30 +0530
Message-Id: <20261101100030.15744-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
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

LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
unnamed, so a device tree cannot select it. SC8280XP already names the
same slot ext_mclk1_c.

Name the slot on SC7280 and assign it to gpio5. The third slot stays
empty; on SC8280XP it is qua_mi2s_data.

This file also provides the SM8350 LPASS LPI driver, which uses the
same pin table, so the function becomes available on SM8350 as well.

Tested on the Vicharak Axon Mini (QCS6490): selecting this mux slot
drives the codec master clock, and ES8388 playback and headset capture
work. Not tested on SM8350.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index a61df10d4..278d5fac8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -34,6 +34,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_swr_tx_data,
 	LPI_MUX_wsa_swr_clk,
 	LPI_MUX_wsa_swr_data,
+	LPI_MUX_ext_mclk1_c,
 	LPI_MUX_gpio,
 	LPI_MUX__,
 };
@@ -77,6 +78,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
 static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
 
 static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
@@ -84,7 +86,7 @@ static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
 	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
 	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
-	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, _, _),
 	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
 	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
 	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
@@ -118,6 +120,7 @@ static const struct lpi_function sc7280_functions[] = {
 	LPI_FUNCTION(swr_tx_data),
 	LPI_FUNCTION(wsa_swr_clk),
 	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(ext_mclk1_c),
 };
 
 static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.34.1

