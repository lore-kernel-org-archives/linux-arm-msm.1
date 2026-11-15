Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764607;
	b=ZsAoGyqsgTDdAMV2nfIIK0xoOSw02+l1zzrKYyPaU56B28ANWPPNQKKuriJmm28+48bZ
	 H/dZ/S2SfVaMnudXjuH8yYWYot6/CZWwXCRtUZUT23IvG/pnHnaFia7TcsmocwBgv5SzB
	 j3gNF3TzlbmT3LNZHX6hLseKuKNQV1RviAFRU4GCgGG/00CGI9FILj4zoLJqhtfwYNuDt
	 abrSJJHI/hvwyjkB1Z2eRpgQieDj3/z26wsbCgExmCBwxLCKCN2V0UYzO0P9lKV+HwYxf
	 Aem7xXlCKIcgnQNXnvkyoxyvguKK9PxsYQuMIFUOnR48mj5VpJvCOJwB3WvCt4OUTfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
	b=xYkCXks5gp3FZ6AE0Sw02uU41BQ7LdpfDIHFdjiPs9WsMhrSgqNNCQEsI7PYdYlWXMDh
	 aHAYE7RDA/3A86K126PaQb15ZLtV7EYDbqScy2Dzz0GYaWbXmQmzldmg+XGpTFdoApvOE
	 Gu7cUgvakfWr4A2U/rxljZcSPzruakdiLD2uGM7GfMM0YW+fPx8501vI3gIhovYu7sTGl
	 1xABIwrypSUZmr6J2MldlvXK5yXWjgkOrosyBzyXyuOqf4pRaaRoP9hLlhvqhc6x6rrCf
	 Bmike71ycliCW/w/X/tW9+/ItROeOcJUpOy0nLJgpaixRZPnRPz5Np8xqromatY0V4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBe7A8yb;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BE6606A31A
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 17:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4BE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBe7A8yb
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3704d30b84fso3192644eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 09:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764605; x=1795369405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
        b=fBe7A8ybKmjdDCAZUf1AwgF4q44d/nheQLu/32nrMbMxbngZAUVuSOqxpLKUTYn5Oh
         U4cfAd+4MTTOjCcl37kmirwnd2oZvvZSPRKpBA5l+f8LHHOAB+eT6CFzVeZBR1rwjGvQ
         SCX2ed0LFNy8/6yjRAH+yeryFFgztze2AL79p936zIEXvRT258hK1+3bOQrKxOkXVBjN
         Q7rOPdW7gjmNgYKpBFe0uVELjgllFL39L97cOrAyFKrmC5+NceUl4ZHAdw+PwsPuOLcj
         L3B+/tEUw36iVhkWHXiPfY+SQFXOTGQhc3qrp6VCg1NJzZ9Z43pxuZdahJK6z+3PLoja
         cDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764605; x=1795369405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eB3a/6b3wofIV5PVq3fo6B4mlRfJKc3ivia26nSP8Gg=;
        b=R232QeVxt7x2NZImdtZclc0NBJOwVVcIcu0T+a5/w9SuTASgCxCbKyNCLci+qqPVla
         iph/H1nYTazQ0LJLN0FY9HXYxOPFAUjIJS7+posylMUFgU1TM+hL0EYzT+SSgp817SHM
         Mf67AJHpHX8GJ8tbKNAFRrxEjT2NDzrpgdDsPwZ0h0K7MvbN/6uMfwypxekPz+RmlfbZ
         sdBkTU5Ce5VAq36cc4ylb4ZHgtBvUgirDKRbFdoC+3iWuuqGuRjIy2bU2xrLVKDZwLcv
         EHEKHcg3WoJ/ITy/nCL/A0k+dZcPV51t7x8myEciq24bR93YdwYKDLth4KPMIYS5hsGM
         2ZcQ==
X-Forwarded-Encrypted: i=1; AL+hErEaknXuZQoj0QhxN1jOSxn3Xs48ds6vzZnzrU3+6EXxfFNUePnsECKir3qkx3oo/vRTSCadZSQvGZzPg1lm@vger.kernel.org
X-Gm-Message-State: APuU4Z+GhWU7sNzXoMfUjYbn1ofvK1yJVjFIb5EhsKyqexvA6ck5W6rU
	UkH+YMM6fF4gl2sxvg70lYd9sp23Tfh5jVpAXqF7xDV/ISxyGyMaE/X4
X-Gm-Gg: AYBFou12V24AEZZrQXYBJOnbybje6dVtSHJnOvbJLXGtMmPw2WVHjOd4LCb6OXZ9H7q
	ZojFXo4ZmWTnYy9KZB4DsphCJZO5fdQHXQKPLu60X8r7vdNcU9bho3cE8L+lKsAdCtpZZwuyKsj
	hzKn/JyTYjFCUL+VACnHQsiObkv7Yb96SZiUb8emYg9YsiU4pa4g2O7shqOY2f4j6NNN3H850Gc
	0g1afLfxMc2AOqS4jSEmrVib3nSFsnliAE98QOsPABwTRAeK06SH2vLdJQ5iLKQWYkHvSOTxfzu
	2NKMpRRrSokfiNze3CbRsg1D8CRJ/OlFh5wEKbEs6lhmRACPGeaO4OHROJ3AN5stMj7Yb6v6YiE
	rz/u77mJnsJ4vW512qLiSjfJzQCHFzgDyFDj+zOg1fIJkDCKRmZQIIVVuHy5D3X3yQQCMvhNofe
	db5H0ci5paHDMu07MYHVAPoWcjaHbhkUVgJ6fIRhfrzJHcD66Sr5HZQ9wsLsquwtfWfy+ooeLND
	bv1oOCb+XdTzwMRSIoF4D0MuxvTq6tTUF9Bfx1PkMHpUDxIv8aThQw+sz6hVXThFq2e2uiuO46B
	QlPM3MP7gUh3WthyMP03dkjdBIgZ7D6VQS+lQN1QD38Lw93KoIVxNOQ4VIf0l+fx0xNyKK03+lr
	/8vn7PywCsDWBMWEhDrIZY41MjLCQE7XtSmw25/CgV5uPLa5kVUbja9UKM9emXYSiqrqTN4z1QF
	dzw2DsTYKXCVKBwrur33tuzMBqBoE=
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr8600534eec.10.1794764604805;
        Sun, 15 Nov 2026 09:43:24 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:24 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 2/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun, 15 Nov 2026 23:12:37 +0530
Message-Id: <20261115174237.48908-3-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115174237.48908-1-surajsonawane0215@gmail.com>
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
Changes in v2:
- DT binding moved to patch 1.
- No change to this driver diff.

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
-- 
2.34.1

