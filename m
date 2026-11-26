Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678841;
	b=v0uyDIAaRm8wTvokBHjdipEe2zETdjMwQT8gfKgwsA3F2FsUA1guDmrULkH39gBUwYLc
	 kyUX6nJU/Fi9aRfGpsfKWTZ6BRgZlBe6LawvmNwWZtd9xX8hrCQq+4nJ8Ru9Xk0Rm2kLq
	 X3H8KSn3heHyV47CsuFbnhZv4AfKhWv8WQQRUvF8oWIwNxwyUABN4pLzn3UGeaHSFb5NW
	 D5xlR+SbAao90+BIiEJ7qUg0glS2dCmGaX0CyrN157WMuWaNdKX3MFwPWG53NYqiV7sig
	 jCPwsVho5ozA8jxd+40agF66rKBalDpbqEj03Vtf54pLCQzixw0j1pocHmxbYX/hRCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zIQ5FD3NGve5EcBWDp+prr3mXzEpkeQ2Fm1hUNRbEUU=;
	b=eXaQ/dCrPKNpnhBpcf4TgNLi2iWHV5+wrdXJgW7P/nhFlKoVcmlxqCVkGQx3yPeaENbX
	 AR6bLRJpSPVxJKSCdQrLMu02tVxDeN9AvN6/N2V5vbfnFjx4x8iVvBPg28ncNAqANspoS
	 m6qgJIIkSfo/F8xSgZn5Fdv+mopowMrYaCXECyZEjENocGG/yLkIkEbkw1YQGRZl7d7wu
	 snO2w/tzb4zkU1QsmCDoR7aBdxgcEVIiTq1j23BO4NwX1u5cseGe5vWIFVhlElO/w/nrI
	 avF2mdONLRe6QpPTTQhJUVByB3qng4scj2NOnYEPKNVCO2whTmkyKXHiHd7CPnpVSgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="KPRp/q+T";
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEEF606A684
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDEEF606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KPRp/q+T
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c00c727a26so562695e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 23:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795678838; x=1796283638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIQ5FD3NGve5EcBWDp+prr3mXzEpkeQ2Fm1hUNRbEUU=;
        b=KPRp/q+TLuJ20jc9mdh8lZpNqF2FF88uaWsZYI85sWB2spakz2yRk8BqDRKnbj5BJT
         vswuJXSKNMplSJO+KNTHQUHAP/4F8ErM3jPH10HNhbSgFIIU5tgBJCnBoW/zCz3Bj82V
         vmmOYAiNb/jAR0YQJMOI3l8iQWes8T6spXGFovLFCR5frEvEggA2s/7KHL6wUPg/z285
         txscXjQ9RWogWydQ3TVNOO89LhydDs9CsJ+D0gdXtumGEQ0vO9D8h3zDhevIpZkoXsn+
         0LHQRmWkVLwTUSJ9UJqsQZj6+vAi6iduqOU7/uVIF2BsFlxESIjq9X4uw89vgExeiV4N
         BCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678838; x=1796283638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIQ5FD3NGve5EcBWDp+prr3mXzEpkeQ2Fm1hUNRbEUU=;
        b=lxjENOqUzTJFEmzq+BTx89LDSd3FrnRBX1VbdH+sYZG5FtJ6M6Vp/AlHr9yyIhK05y
         fNKZsywLraMkp2AGl7xgbvgKqurG1KcZ3FkPoblynK7WD/fzMVV8OAxMnkuDbck9SyaO
         DS5qnF2cGtFp/ddPNLfuGrZqkGEamuyxBvUAFsLWgYDIZ9jvBW2z5Uq5sDrmeDFW9Suz
         MKtoi7Dd4aLzXySQ/a/7Gz3DD/3iTGA+06u/Rs2mi3ys6Ce/tb4bzVK2pgpKuB/jJ2a0
         +q71Xf9PalBxLwo48Zuxzp7Zi4ZHVE6dRyBjXBN250uXeOYygV3vLgzhDam4rQJU3nBC
         SvGw==
X-Forwarded-Encrypted: i=1; AL+hErEEzrfiFUWrHzk+oAZvtOxm94TwDfb8xYj5e2DUCgvBlWBEEGbsc58NblOomlcD+c6GqwlSW7n2eIczVYD7@vger.kernel.org
X-Gm-Message-State: APuU4Z8M/VgULOvXxitss6jTXNVQs2t15EuZJ35kAKC1gglGqJxydnKA
	AVM8D0HgjckDloimC+r87q0HYqKo9zD0wxbOo/XMa/veLEq+Vhb8sONBTTYUEUxWN8U=
X-Gm-Gg: AZFdTZfYFjdubV3w+bXS2xsQK6mj0wcg6HbTZvhlTuO6hCLBsakME62Tnx+jkO8msG2
	2djwj3Y2t/1uZeinPOJOeFzn+IYXKL0UthDBdqC3TqEJudif5czQRly0/nC1fKVzosj9A5eKPI8
	3uczo53/1vP7ScK74Emv6CWmccx7DE2r2snoW+x3HAsyOKwtOkcBchRxxGuttDvBQ/XNkxGY1U+
	toyEUHwiSL+l0ewVq27mUTrjGRoqGbPBkT/MfDCjH/dShjBEStCqU5aqwrGgIwKsPjjCoLbchoR
	YB2AOIQSl/7++X3XsAOUFwNKgsEzjkRHnEjjiQSYcOtwvCqMxTLggT0DXHMCs40h05KLaAyKAk0
	e7tdUOdjEQi3yum1ZFZIC+yCmOxqWzDR+tlLuVaK0nHOLpTM9fBpy7qlFwxtoiiH9ej2v+LlI4g
	k/WKz+81rTgUnbO0CmZCuZvTsfyXJNRPiaigUIXd6IK14I9eGnmhK8KJOV7oGDB2Lbf19loS2Bf
	PCJb19esaGCFSFCTTn2rKq/TITf6q+IvgvFOQn7m2NHUmXYxI+xqmT1xsBANSfjhPDLoBKbk8LP
	InCgFPYJqbrwX8PhhUahacf/gtMXEvXzKbvdM/3zGHMnnSSIgh2K7UMuJvcjlHtW7gWqmw==
X-Received: by 2002:a05:6512:65c9:20b0:5c3:17a6:7bb6 with SMTP id 2adb3069b0e04-5c317a67d6emr2319241e87.5.1795678838158;
        Wed, 25 Nov 2026 23:40:38 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05e235sm4984521e87.64.2026.11.25.23.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:40:37 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: camcc-sc8280xp: Remove unused PLL2 AUX parent of MCLK RCGs
Date: Thu, 26 Nov 2026 09:40:24 +0200
Message-ID: <20261126074024.1440367-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
References: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
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

The parent data of camera MCLK RCGs has two entries of the same
camcc_pll2 clock, one is for the PLL2 AUX output at mux input 2 and
another one is for the PLL2 early output at mux input 5. The PLL2 AUX
output is not used in any MCLK RCG frequency table.

Remove the unused PLL2 AUX parent, like it is done in camcc-sm8150 and
camcc-sm8250 drivers for the same MCLK RCGs.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index b0f1d40d1df5..e260b2983e4d 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -33,7 +33,6 @@ enum {
 	P_CAMCC_PLL0_OUT_MAIN,
 	P_CAMCC_PLL0_OUT_ODD,
 	P_CAMCC_PLL1_OUT_EVEN,
-	P_CAMCC_PLL2_OUT_AUX,
 	P_CAMCC_PLL2_OUT_EARLY,
 	P_CAMCC_PLL3_OUT_EVEN,
 	P_CAMCC_PLL4_OUT_EVEN,
@@ -510,14 +509,12 @@ static const struct clk_parent_data camcc_parent_data_0[] = {
 
 static const struct parent_map camcc_parent_map_1[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_CAMCC_PLL2_OUT_AUX, 2 },
 	{ P_CAMCC_PLL2_OUT_EARLY, 5 },
 };
 
 static const struct clk_parent_data camcc_parent_data_1[] = {
 	{ .index = DT_BI_TCXO },
 	{ .hw = &camcc_pll2.clkr.hw },
-	{ .hw = &camcc_pll2.clkr.hw },
 };
 
 static const struct parent_map camcc_parent_map_2[] = {
-- 
2.53.0

