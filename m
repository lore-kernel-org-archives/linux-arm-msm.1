Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426672;
	b=U+lxcIq9TUQpyMD6BAJi8F2lKx5hI4vd5cWZ8SXm28HbsWXH/U00NfXsdsRLZj6M1gff
	 mVJvHiZ/7OTSBnrMCvk2DwlvE8NhIGJnfhBBmAokLYPc2Lvbp79UYHfnAcJj+4Zxl4ecF
	 Jlx9XLnLCBADJFkKD8hB2XUpzzRjdRLfGF8mR3wPws8oSvx/eZxcEdG25daRO2Lc4XvMa
	 shwWumh4rnjQgtWF6OvBrmGXSwhCw/7s1MWgbfHHDWmB2X6rha3Nif5tw7dP+ffALqIZT
	 O0Dkr6Enu9LobmPH5O0VSlgjAkN5aVD7DhQFbn1ycR6ygmAOP49Ijh3ktWf3yfEejhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hsDZepg8xw8s3IYf2oycHDXOymRS04NCMJOXtFzaXpU=;
	b=DeKYpF5pRqhMihsvgt37krupaAi+kZsVaUTBD9Ye8yTkeKKoLpoCEfChzA/rt4OldDed
	 OwvyoE4LJYw34B0SuH0le/FJ1/A31yEwcArFansTPk3t8Jg5oGi+YLhB/lKbsikbtLrQm
	 /URqIZ3C8S94RS/A+RAuor8MtN0Tq20zIQdNCup0/JXVlEbgi9t45g+arh0Hp0rlKJZaN
	 4lUD48/w00ZvnBQJ4f+ebbFb2USjFq9HiGM5xsqYFkdYAR4BRe5lcbZ0LazaK7HQ1/MHG
	 fUCCWJSLjxEsmfJMDO3q/2vonLsKyKnt0TPI9Qtvgjd4N4Inz3+7R5m/OnKeMjHAe5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=doGmmNKp;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F97960A2611
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F97960A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=doGmmNKp
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f1f76ea84so4221273eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426671; x=1793031471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hsDZepg8xw8s3IYf2oycHDXOymRS04NCMJOXtFzaXpU=;
        b=doGmmNKpO+KfJJ5r3TqqgIGoAZlAoA5zWP58ZbmjTfmUxdXoID7DGxLinQE7EMeZ0O
         k9RkEadNnUmUZxuvIqmh6AfCOkYozgubS359fVQAqAp/H8yUyFsXOi0ITaqwnZhvkTS4
         agRblBsa7sJRq2n0ttcUqzGBTESAHWjnNm2wUE0yBVBVQUZtzpalG0IPZ1g2JZoRdD5g
         a2+YI5pbIQO5opBwzO38VgLgqvS0RqRpvUrV9BxZMNrJ3HUOi1avl5ogaNlhjnm86NMe
         lsbCdr7DF6tXxzK3Uwg6girjlbNJHcAc/TsDlZxiG91e7Ofl/9PbZ98DR99UNFwVphHb
         YCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426671; x=1793031471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hsDZepg8xw8s3IYf2oycHDXOymRS04NCMJOXtFzaXpU=;
        b=E1v34miLYzZYG2sBrcr6Ql5FCvHlPIZG9OI67IQ29niOrTlgcxJI2sRSyGwqdHr/yA
         AbXaLkE+3R4LIHBD6P3KNMGsBqdr3t84xWliFX2aUU27bNFKEUSnA9n5pRONtkfgAlV1
         hHDlzkutgBzEgC3HCKsEupdfoS5rJk/Wb0z2GZSf0ecCdq2vYQqMVtHcms5Ug92WajFy
         LBvF7r6v1/+Q6ZlBaIqkQDdl9QNoGcy/MzdZsXNJJnqGBT5IvQJpnuZEGetj7rl5gZVA
         CEFScggywU8ukObGt1noOM2qzWmvSQkCSoRkCSOi5Z3Nw44Xx8R80uXWbmI183JUEA5x
         dETQ==
X-Gm-Message-State: AFq9FYKircrLf7ENrf5FYX7y3oU7B632Lyx8+o86V3qf+R87g0c9HMIf
	gDUc6/JgNlU2XG9Sk6biUHWjbpXBymTrdGgZiAtrRw8i50e4e/7xWQ/u
X-Gm-Gg: AYBFou2eyANVweDUvaIEJw8B3ariZLzux0Zozs0thse3l8sYS5G+Fgbup+VWxJAnZj5
	Wu1wgxACB4jOKQIHgdDsP+MF4DW10QJUKqg1WQXLQPnNb7+t8ct93tO1tUqSNtYl9aewA06E9O0
	qTZ+/siA0mBGdmTv0Jk/EuOqqEBVQXaCtjGVpMbcL2n2ZPnHB4WvMdQDc/ylzNkQlCvzC66Yl9y
	2iO0G+sofwnC6FELGsLKlnUYi8fo0htUR33gphsrgqiK7ULo1hKasIXX9sb8wuJ7IeUCW2Z2QPS
	sCoYtrrK3xKYpoP2kO3KNju/yRDukWKcHGGA/7/nEHbfyOp3+q0LWH6Jw5ESshnl8AMdqQeLedK
	vNhkRhHh0Mo4Gg6jNbdVZa5zXBvb8WcYJlzGgaicS+sexgFvyqwRDIeAGtaycvNC3XNWRvvE0jO
	Ik6/QIkOYffIMyA1nSs/V3l9Hl+HiY/T7kMC/H8u50Et+wOErRx+iseEFwi+G7lyyXVtaUs9cXm
	vO3z9T5wMg=
X-Received: by 2002:a05:693c:8353:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-361a274b361mr11482466eec.40.1792426670942;
        Mon, 19 Oct 2026 09:17:50 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm33410985eec.13.2026.10.19.09.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:50 -0700 (PDT)
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
Subject: [PATCH 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
Date: Mon, 19 Oct 2026 16:17:38 +0000
Message-ID: <20261019161740.2384-2-sushmit718@gmail.com>
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

gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
takes this clock as its reference and rejects a 0 Hz rate as
unsupported, so USB doesn't probe.

Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.

Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
Assisted-by: LLM
Signed-off-by: redducc <sushmit718@gmail.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index cdae5d9c8aec..56503a45b64e 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -1500,6 +1500,10 @@ static struct clk_branch gcc_eusb3_0_clkref_en = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_eusb3_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
2.43.0

