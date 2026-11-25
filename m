Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642487;
	b=k4aV63I66wVAvw3LFQ41iAfeBlBydbIBRs9WCZekGyfEIrdvpIDqmxj2gnDACXaPiu+n
	 cHIGVHG0Y07F5HXPsvcC4nQIgbgd4Cno1M+rmRdzFiaqcNTGBNZquTdTf7mz8sQJF3wm0
	 a7dg4Lsx2/GtImEPynHzSSymO7ETehSTBG0ki9VED/7E9iy5cLygsO6hE4UygPo9hZTrY
	 HiI6QRuIIv9QErpC/0DzlOZtnBUdHYILr9fgPuy8JawrxhMh7By5GHDwLv+NG7xkPgC/Y
	 5o9TdxiDcdNlr867RmmkBPKGbwzixMpa/DvWugOtIbBbd6GO+mOZKswmGeHIxMZeVbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lhr7gev5hPDk0ncM2f2gae0ff/kCYaYwyILvj7xGWHw=;
	b=SZrDwI33SjWF5A8/2+fXV4LC5rb3TQoE/OkHccH3KV5pI+LfWdPXh4/28ihjMNEhViBi
	 VR5BI2GEk4AX+aVBdAYLIKjqEiYI/SRrhzWIvfRyYii/BoRU9gpEtPItVKI1WwFQ+wbSn
	 ixd5fCsiQlM5EkzYpPSRlaKdxDsJRxwOUj/YIT+k2jhw45+HXxBQOyLXaFalbKhNpK3/B
	 jIDL2Xnl+rGZmfn9GyJY7SKdNEpCqgXZFC5a817tJFuQUrVkATp0t/8WfexXfTWyKkFdn
	 zGYS8hpRt/Af1oacVTfZddQ1De/wABVeX+ENgvVvoCveHCLW1ucKVUK3zbcPvJi3BTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=znbBLWmL;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FBA606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56FBA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=znbBLWmL
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c154a41f8aso488979e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795642484; x=1796247284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lhr7gev5hPDk0ncM2f2gae0ff/kCYaYwyILvj7xGWHw=;
        b=znbBLWmL5UwJ2joItEH/0zeDn/1KtpzZB9Ji/HVsWqxRyA8GZ7wHAJGBZFpdDVsSXQ
         VF2XePRg2QHi2I3hpo9LX/53IVGZ4Z9abyVIPiW+uMdr0j0JOyk4+lj1S4imLxopCDMY
         NIfFVTfTJFT0f7HxqeF4xG/lfab8rg1QLJ8BtfhLg8/CcfadQ7S9BdKCh0GQeRceHfKH
         1AzMLj61PaQ3QWukuZQkcYfcp0sY6XoIHCIjg0fLU7bJOjrbozbSAIqU/wDKbnIgUAo0
         evNOK4y520ZU/WnkjW9NIwL9YBj68kQVx/Q3DeYcw2DcLLsmxnSkbCuQePqgMN98zArv
         cdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795642484; x=1796247284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lhr7gev5hPDk0ncM2f2gae0ff/kCYaYwyILvj7xGWHw=;
        b=S2simbwgYJYCGtVo9VMTsZWQvd5lF4gqm9VyawLxZkb2Z4D2bdW071wYHWcXEO/nmu
         eIlhxFM2X72WUojfsgxV3d2UA+8DO8t2BfPc2NqOTHDLWzgu23J4JXYRuuP8dv0TkxoH
         5SeR5PTAHXSaI+GYrgcvFUdigLP7DyisVKNj4oZKPAyhkuJ/xK1MdpYBpwRuFuIIAuBY
         BRnUT+v2niov0uvbP3M3u7uX9N/N07RY/KrYzD6antNE4hr4ixMbRSZ7otEHDifSt8z8
         L2A0iTpeygZppgXKEhhAFw9+U9KiT//uriZWSXSVfwC/IuAifR9sxKV+A+9l0u899u/8
         VB7w==
X-Forwarded-Encrypted: i=1; AL+hErE0ZWIvqtJwBJfzhl3LOim1+qsKzNo9ANdczBzfy0hKOOj8A9AHN/z31AHm03jHPli1V/HsLLWyySBN03cE@vger.kernel.org
X-Gm-Message-State: APuU4Z+esBeQkQEyhg6EXbb/7WKH8T1bnpci2u/kemod30uWTOAFWAJC
	mkyPA/6W9/VsYgm9TxLEqC6ImfODe/rt2hMbi6/H+qwwCi9O14P3SzPzNl/5EKy8J+A=
X-Gm-Gg: AZFdTZfKLRMyYwG+NfEFMwcY+xuWbjiMJ/c6eCwnHHfvZxQl/4adtSVVCPVvsKiKJdF
	SHouUXIk/jBKTOSRFoKokoG1ONt8QrwFc/wphpbdOqEOVLVeF+ZitzBKCM2eo481iqpZ/wm2dtp
	e/lWBwgjt9p4nJ9Eeyb3D29L3eRqqR26nVvwa8h+xHRHSDKYvchB+BEWgBxLxttQ5zekMX8Zs+c
	EVxg3k0zTJ51h3pyKacQWC9p5iXraSNIsMspFtxmvjxtRbLCtLbsVbR9gwnWjXkteOjlwpVjTJa
	4f8SUQUHcJx8Tb629apac3lgjpWLRPzJmXN5evlPcit9LXBbww/NcmAMRRFDISPb58k6zsRQx23
	o1tT8vE7hlmSiQBwrwdfxAvZpagGnyLtY5mtz/NteP3I0tKSKJU9fHxeQETcqLfTSOJlzh5JP0k
	+I0gQH6f8dJS2l7GqDp5broDbrJRRkYKM+0mNTKfn1QETfebt34pMzAbap2ajKYufOpzxksvujt
	ndurYi3CoQvT4ewwr/2Xs8uXHlo3BuO5QiobTw5OFH72JTbfCYxC50626+cZ+/YR4HEPddb3CYr
	XkmJTphB3ozYFAXJnZPpq5klmgWHhwOFJOUTG685wreW+5pgI2qGCwGlBfFWx106rmf0lA==
X-Received: by 2002:a05:6512:318d:b0:5bf:d00a:b6c0 with SMTP id 2adb3069b0e04-5c1bc78eb99mr7209496e87.3.1795642484502;
        Wed, 25 Nov 2026 13:34:44 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf3338fsm4845422e87.3.2026.11.25.13.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:34:44 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: camcc-sc8280xp: Add sentinels to post divider tables
Date: Wed, 25 Nov 2026 23:34:32 +0200
Message-ID: <20261125213433.1438537-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
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

The PLL post divider tables are passed to divider_determine_rate() from
.determine_rate of clk_alpha_pll_postdiv_lucid_ops, and the generic
clock divider helpers iterate over a table until they find an entry with
a zero divider, however the tables are not terminated by an empty entry.

This may lead to the out-of-bounds access by setting a rate of a clock,
which is supplied by a PLL post divider, for instance a rate change of
IFE, BPS or IPE clocks propagates to camcc_pll{0,3,4,5,6}_out_even
clocks, since the RCGs and post dividers have CLK_SET_RATE_PARENT flag.

Adding the missing sentinels to all post divider tables fixes the issue.

Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index b0f1d40d1df5..131e5d1a1879 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -85,6 +85,7 @@ static struct clk_alpha_pll camcc_pll0 = {
 
 static const struct clk_div_table post_div_table_camcc_pll0_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll0_out_even = {
@@ -107,6 +108,7 @@ static struct clk_alpha_pll_postdiv camcc_pll0_out_even = {
 
 static const struct clk_div_table post_div_table_camcc_pll0_out_odd[] = {
 	{ 0x3, 3 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll0_out_odd = {
@@ -160,6 +162,7 @@ static struct clk_alpha_pll camcc_pll1 = {
 
 static const struct clk_div_table post_div_table_camcc_pll1_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll1_out_even = {
@@ -238,6 +241,7 @@ static struct clk_alpha_pll camcc_pll3 = {
 
 static const struct clk_div_table post_div_table_camcc_pll3_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll3_out_even = {
@@ -291,6 +295,7 @@ static struct clk_alpha_pll camcc_pll4 = {
 
 static const struct clk_div_table post_div_table_camcc_pll4_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll4_out_even = {
@@ -344,6 +349,7 @@ static struct clk_alpha_pll camcc_pll5 = {
 
 static const struct clk_div_table post_div_table_camcc_pll5_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll5_out_even = {
@@ -397,6 +403,7 @@ static struct clk_alpha_pll camcc_pll6 = {
 
 static const struct clk_div_table post_div_table_camcc_pll6_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll6_out_even = {
@@ -450,6 +457,7 @@ static struct clk_alpha_pll camcc_pll7 = {
 
 static const struct clk_div_table post_div_table_camcc_pll7_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll7_out_even = {
@@ -472,6 +480,7 @@ static struct clk_alpha_pll_postdiv camcc_pll7_out_even = {
 
 static const struct clk_div_table post_div_table_camcc_pll7_out_odd[] = {
 	{ 0x3, 3 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll7_out_odd = {
-- 
2.53.0

