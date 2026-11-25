Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642487;
	b=Tb1k5cN0uH+lJJX7JwCiXfFlWnFmMQmCouQgE73s/OBLeC6JLTeZMhLluoVrfcO4p39s
	 dCCvHM+YCKIC/mnCdsmUNRy4RE5JE/d+KOxEsystHVpgpIq8G7mzCw4Q2mC395mKCb1B9
	 TFf3fH4gr58l3ga/Rohy1MLG4CycPYGTD67l8jhR4nDPnQp02Cgrz9JkDcfMC/Gw2CMF2
	 Vwau+jKLf9jsYIB9op5YyOjcbOEyh3f0OwV9YAHOAmuoAnHjCVS7HlreY2HggbPeFbfcS
	 sxErEhTu7W01BS59qZxnrBDG1gN+/ZjcpJXl+BmhUHQ28FKInDX2Gp+J3vJWq14nuNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jXX3gkFCOkNPcapqV5zy6fgymKr5RIqiGnmKRbO39Qw=;
	b=O6ab8MnWA6x7dbrZDfJ5F3yUa3Q4v8x98Cnt46OWjMe0UijGhQXQIgJRLMagWTxgPAfb
	 RADxTzTKTYMfCcbiHh9w8ldbmR3QDE1TeAvo99cgcbzIjvws4VCTu6HO/xuYFYKY2iw9L
	 1rGkqRoWKOFsXki1LNvnyXvQcXAHV8Euy+yAkw1WE8ibw44TJVWeHWaI5NIievYdvT1ul
	 yk2G1jzLhKDGL3gh47VcHSzPKhrBuKVNJ7UE0267dGzmWVQW9FdPOegWXmJAaEFR+dTko
	 mY/B9U3L51+GjW99d2jj9DbMkUrEVeQGSuRftteqNVxDYGobHZyhMV7gv1/FOnkfL5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qeVdXljI;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1729606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1729606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qeVdXljI
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c00c727a26so517376e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795642485; x=1796247285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXX3gkFCOkNPcapqV5zy6fgymKr5RIqiGnmKRbO39Qw=;
        b=qeVdXljIB+1M8aTtHy3OLelc/hYOQZ7dY7OO8jm9OSfqgeIrgsoeVwA7mLsGob950/
         7PJ/flx7gIa1tw6uXT+54jxxH7lQFMUGyPJ3/4hSmnRDKBOAIWFQ7oMirVfVvL9uz6Az
         5nZ9MVe/ZSss3DbHP9u2azLphlAga3cNjF08WNYLxCLSS6WyAcH0+QqLBE/DkAWNV+LS
         eWcJ2C896XVe468vgjb3l5sFAftNBZw8Mq1/WaE7CljFopuu5LMltL4uwKfTFdWo5C5q
         tG/llhKZducvRh6J27ba9Vx6xmjgCB4pPvfDQPJjRSD0+Y6x5S8UEPLcU+0srxLw1FKJ
         aiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795642485; x=1796247285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXX3gkFCOkNPcapqV5zy6fgymKr5RIqiGnmKRbO39Qw=;
        b=sJs+sXdqDvgdAO9hcTuqVDnCBBwHdPYGST6cQBHTxt0mfRdmXdYYDkLRqsPeyg/vu/
         hHrt43QA+XEE+J1qpyi4j2EI8gcZEX8/SgFIH2l+qaoqICDb/scczpjOaL6vAscYHTze
         19b5LgU0QgnASz4oyLEpBsLdbAVsDKifpQbEbiqD1Thyafk04fN7jdWVD+sDyK3ZZhxB
         sKElgVAEVkU6hKL1eHPUiWPnSnFobVPjSkkeA27V9GkP/3sO3A5vwPUc7EM6HwwDNhTu
         qh3+rPmnd1M7EzJHxCJ+a8yK2F9laOwhm0czsl3ZICXlPGLT2FEU3nkjqoaSbDfGuNJY
         YK/A==
X-Forwarded-Encrypted: i=1; AL+hErHX93/rBMCfTtpWtFn+7nJMlrxOgSJoknapWcFFBi9cEMTkJlqnAddAmqzEQ9bVdYdGN9rtkS+WqCopCh9f@vger.kernel.org
X-Gm-Message-State: APuU4Z9M2qtvUNGnFnt9uGkE7KMm+d9DWuiYjFBjIfS/4FJat+AB5rVu
	hw/+WQkFfhSaTF5GX27jzWtxUKVB7SJRpzaAPZO8MIOAmzoQ6soqFxSw//BZXm1kUX0=
X-Gm-Gg: AZFdTZeRia+ij4zAuwQNfGLDN8Vof7Qx2rsgSWTNjrhx0vUaNQZx/xUr3sQGlxRHyX9
	UV51kuy6q4Wn2JOfju3jwxmqIcvRS67e+Pg2BDTXdoNwxBNDXGKRrh5FKnusgBSWukmoIKGMILH
	1EjF0KreNmvZfPWb37q0DAufswspcz2KMgcz9o4xSE8xpPsahztbT43fGm2QFUKzEiC0OobXWpe
	PJpYYXCLGWET/vie+h413+Gj+KUvF+YLwQuLz6SfbWkUYQsWMaIKvEOKE9c+ozxbWWA3O5NOEXw
	Qeifa0VYN+Mt1j1qOXkUwur+/jJ2EuuWRWaRt5RBwSjpKFf53GXrbKQP2rHLPIgPwZWXKGlOkaV
	wq5qqWp1NGoeXxmYZnmydb9lQs+fGbMkhKuBdYs3l9HHZruDDnpPFJ7adoNLkDAQrHjfvMlGf3C
	9OkBUPpH+MbtiuobIHTZaXyhocMS7iDTvWjdUcmREkR5wuxRa4hAIlSQSq4TalqXy/KJIEDGmWI
	krJwckqgswd87u5wzfxh8ukRl20HDHlY2PNH2NNzPxEXGSnk+E5nuo/xiDB2KISNTGJeYUOo+ea
	I3s6SJJUPKwaVsWvRAF8mBzn/DbMEPAE5K1jvAXhQ+AjLedZMwp6hS+AudzDtpV65Rputw==
X-Received: by 2002:a05:6512:6719:b0:5bf:ba43:fa67 with SMTP id 2adb3069b0e04-5c1bc935c91mr5378563e87.6.1795642485238;
        Wed, 25 Nov 2026 13:34:45 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf3338fsm4845422e87.3.2026.11.25.13.34.44
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
Subject: [PATCH 2/2] clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even post divider table
Date: Wed, 25 Nov 2026 23:34:33 +0200
Message-ID: <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
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

The GPLL0 even output post divider table is not terminated by an empty
entry, the table is passed to divider_determine_rate(), and the generic
clock divider helpers iterate over a table until they find an entry with
a zero divider, thus they may read past the end of the array.

Add the missing sentinel to the table to fix the issue.

Fixes: 1c9efb0bc040 ("clk: qcom: Add QDU1000 and QRU1000 GCC support")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gcc-qdu1000.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 4dfc67280611..6f44f4cc9968 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -65,7 +65,8 @@ static struct clk_alpha_pll gcc_gpll0 = {
 };
 
 static const struct clk_div_table post_div_table_gcc_gpll0_out_even[] = {
-	{ 0x1, 2 }
+	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv gcc_gpll0_out_even = {
-- 
2.53.0

