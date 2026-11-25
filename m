Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609960;
	b=mhWxKihMJTQkiybQE2aOgxssmqM8QPFLGYA4SKOo8gdtSvzOfhDH/P7VlocAVycgzI1o
	 /9GNCOi3fkIdMsnVxPQFL8eg9fzTcdI9Ln/dLHcWgWgjtFi9+pmPth8T3hpPsSa02I7ei
	 gxBL+O7aJGApT/qbDRNTA9FGm+ogoHroWynQa6maJlmvv9bgoG3mb9JmjNM3cBwvuTyWR
	 05CH3kDUr4fw6puIp0c3nNozzirZWjcsWWlXEdQgl6NKb1yJJcCk2x7XBxIDWZMrSCwaV
	 rw2nAO0o9fFJhHkm7SowJWHHLxrYmljzfBYZ6OoXJxmk1BlunsRuRAV5tH+iRX0mTKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
	b=yjc70s0W/W47/AxpjXIVv5ZrY/982g5RVBefsGpvQ0VQRV8HXDedcLQJgBPAAhQvEi8h
	 2nIDLynlJl5Z0k/UN8jPvHQEZXuED04Fuz4tM8Hg3rtK6IRzV3N278VsBfgeGk0Pp24ll
	 v8mBCSUyglhVYYrJUTaHic5txCjOO5Jfb5yuOMoB0HQofqzWuK1+PQaPGVcNCcvmTekDV
	 HT6yH3N5YSd0FRqhrzmNnBBM1VLlzeHso9NGozcAi7AdGNAxg3YB9VqJfwgC4ZUX+Sk9y
	 pekYmlpQFJpLjNlLqFudMi/LclE3odydKvM2l89FksM8ElklCWnRf3acQz5Q1WqPKQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjf6U04c;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5897606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5897606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjf6U04c
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso3414233a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609959; x=1796214759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=Jjf6U04cQWZ+NII3vRDrhW3MUWdwXMhKSfRtwwd4R59UmStgmNqb3pePkQ09dJ740D
         TUMwlPxIinVGwhEx8pJ8X+RA/1hyWgQDRpxDjxGw4Sr1zUpME9ezWVIkmfHwzJoOuML1
         FLZE9/m+gFmnXvzsCd3guNsf8vTsYWfT8C4PAPM8HUpa0emGH7QSieVXXqdCwWyPdkXy
         JcGGcvFlDvV31c/4jSf880N+bvOzvW64ZCO4EWUmBf0AmL/fMxzJQTptnZsJf7TESfg4
         tEKX28SXJHswIQCWJl6QTyV0qs22hIrsZdFtQiLj/zpKAGnpu7MlYGSMPWIq9HMLgYFI
         5ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609959; x=1796214759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=PR54s0fR24o2iuEsLPhYeQBCghYWbFySbws+uCGaAj2ZTeCECrujJHgNW/7Hb6l8mj
         qkz8uc51Rz7NmhwPMOhePJ3uHTt1b+cUC96pIIa70+7xnRcsRJH6QmJUJ0b3jnk7s+01
         5ipEJWnML+gzfDy6kBawGniQP6JrBilq1OlYwGDCW3CoxQGmHuEMPZzBqL+hFzTHAtGv
         zrRqFRKaSuU6srLYCme2fQeezTmiTDDfwHcTUKeaulzktfrta3uIV0DBwMkmJGMs0Dbd
         CkQqU560R/YTBpI1W0HpWDQ9mL+3iTWl08PsBcGz94dbdO/Duj88sX+R2VCKWgnnZzu5
         9WYQ==
X-Forwarded-Encrypted: i=1; AL+hErHFN6cmV4HQASioAcDdGHERBoBpFNjDI0nveZtyTrFIgcTvqBuSl1GNuyl63i18YHR4bzszt5kXf9OgoLgc@vger.kernel.org
X-Gm-Message-State: APuU4Z+9vCV8hCHEWF7+Zi3/5McGViu6Z4JnVi9RnqCQSDLwsCr29RSF
	GBa1zTDlX8oXXw1fblXfpcINF33QQZTKVKVLiy9RmQX4evS0bwm8gr7d
X-Gm-Gg: AZFdTZf6KSuWFPsQUuZDqoYtUThr26NRc6vu5f34EqO/jlJwFd4c+WqDg0IN10ZjjIg
	gPdFg0tDA4LonLDo/Dxk6+g/31oULLf1qiJ11+b9NeKh75JVgIRaeEEL0co3rOQC5km+IsyxJTC
	3DlS10MVKOECUsbtoU8jws6x6htH0DFHSKAH78TtYrT2inDLhOCUjyIKPTFUyT3P3jrXyOAtrLM
	kZCYDdF/ILdp4PUgUegVWdeksG37KlmNRqSzuVZYnPg/P9+2Bq/Gtn8CUyCifkz40zaRORZjXoL
	l5ekuNwPhaqduF6X81i7NrHUp0siZ5CnTshQz69r20Ng4C9+65gwTsldnewLBDOHfir+iIHxGtv
	5/N9MLsSCzrhKgfcBCQZ3w7f3uqRfDV+06B1oBB3XjZBPtDQ9+t0l08Bqog9hox562efCPOluZ9
	3TZef/QaE1eP8GOwSgPkfz0VA9Z3duRXzDYf28OfOmHsdAikSuJR2WrrUck2ZZEngt6IHsgn72z
	DXB1qIAO8gUVclMhBRHBgiNxtNptxa6rHaGE21Qdzzk6Md22zqvHvrWVBe7bYN8Dc/709a31cba
	aKmlfG+HrSXf7LB5AgFTAPlXKLIFUsbbWyKMYN6sRa+O5TSU
X-Received: by 2002:a17:90b:1641:b0:3b4:fcba:8c57 with SMTP id 98e67ed59e1d1-3b4fcba964fmr1130708a91.20.1795609959126;
        Wed, 25 Nov 2026 04:32:39 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:38 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Wed, 25 Nov 2026 19:31:40 +0700
Message-ID: <20261125123146.379057-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2

with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on

MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8.

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

