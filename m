Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447683;
	b=GDDbCaQU1ZBxNcHc3PV1JUAnqf8HWyTo9T+dV2sVWMDykq/T0QFcUhAOm8szOPMLEiSW
	 ck2LE0mwXSAbteQWLSNHLaLvovhKtMpH6afmCccBEvODnDZTGuHrGtf5RYk3DMr1lgubm
	 k5odOQENHKYtdu4Z/9+MZVNAawggetUgjYOfdUcG7ibv3yk7X4CYiLxzWdqxrriaPF89S
	 XS1aQJ7K25/aSW71bWK5Y2Bm95p74WKKxwnmUxpUScarEPg7HXofyhG+AGKhOG8SXr/QP
	 BWv7Pmg87ou+7aDSy+tk915gJZG5JKW1FoFiuECjUU7GlGkupMb2L5wNoNjhcD3UUmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
	b=RSJ+PMSrryem/W8sbbe2LEv2XOV6fzfM4lZYNxWgVPhsaH+JjZ1DT3vk0dB856Jnz7xj
	 OoiR0RVb1B27aIIix0XIKCuLRHJt+txYfcyC0nMQ4GdSoF9n6JTWAFVT6tZ5dXbY2TehY
	 uz6PM3ah6pAYkauXlqpm57U9BrLJqZXrF7aBmSY9YeAxtuWJs5fGTmqClnT+zh5QsFfOi
	 bQZ4KKpGMOcdowVoqvSt4cn/igDzHX+qLSgd1odgpzYBslpdqufXJRkGB6ChsY0bLXqii
	 Fn9EKKCEzfA/lU8MgOlyyoC324ZxViK+OzWmM759jZn8F8UlBDSqln/p8Zh9EplqhAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tM7/Lb4o";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C15606A33D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3C15606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tM7/Lb4o
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so10247106eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447682; x=1796052482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
        b=tM7/Lb4ohN1rjBmrP/p4jsqauMxS8DlnR9uOt5WOXDONuj9gtBL24ThKjhYyUJ1osr
         DzqANDmyaqyQRIj9/WtIAT/2YNLsDbukMTF8CsLrlVLEEj1u79LxziKXkIVO0kuI3yvd
         ilvhELHyvShgLq2T3GfJ2xb3ebiLdSzv8fG/1WUouEulxQ2bjODdAQn++ALn6A5oRrdP
         gp7+Nu5zsnypVzDnLckDqxN6joBc14yqFTXBNPePxokmg2P15CstxQ+L4Hii3L+lJDFp
         UW9V1QtAegU0c2Ex964UbGyqVPZzoLvvZqPc/2zQWmZhYNNwMxGusYtW/O0GQnjuA8yN
         3YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447682; x=1796052482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
        b=u5cwes+8l4WLY3m5o5uBc9v5CZMdwCHqSCxagA36UjeiJ2QGgn3hiGNjOgBmUl8QWs
         2MDimq50SDIZokDRpAWklCn5Fi9Bj6WI4OYAvj3TZQ/5h/XyMRYIyqzjxYzqHacnAzJE
         2vUCamudZ9RpT5PTCBnIsNWXIGunZWzPzghCCoigSq73nd70aJZf2A7wzMzpYNJx6cLf
         7/D4Rsf7B0cGneDyfAxQKVPqcLXm4lXMjfnTV3iau2Q5488hbGYij2See2mj73hsAwpB
         eRXGZZC9mkxGmYUydgFYSDc5++MHGpPx7bWsI4ImCht8IVcsbcu1UnHI2rxa5ujCavWg
         0T6Q==
X-Forwarded-Encrypted: i=1; AL+hErFzbyOXYWeNfB0q1u/XitugpEYulnyN8fgVVvwsZeJTRYAs5Ti7xKWhQe3doMP41Wbg9IkJLNSlt+kaGBUT@vger.kernel.org
X-Gm-Message-State: APuU4Z/uhLgXPmD3sbe8/0l0jiKh1Nzyy6xolbEISchGMP/8u29tUaZ7
	ORZ07pLsyTl3GuiGRJclfPZiGpPi72zKgV2jXjbhDdsW2ss7wSHWoXGJ
X-Gm-Gg: AZFdTZeCidgCayfKEVY5mtZke7JGfjFcUN6a4CjNYQ7VIdO+UMcNySOEKAjIa6/pLku
	SxvgNyK8bQjMO5AOomP3QvhmdjkMWZ8R0aZXeUWQ9n4QNYUp4+YiIS613YGS/pd4waefztnAvhI
	zuI2hLM7fOUmaFtwU7TODQWvKmkFS5V300F8YOkGvt8BFPXycJuM8NMbkVkEHIwnKVSeaWR14jb
	7sRAMNuKL9iTuYT9YimPw9WsBUylmdKAVA0kJZLURyKfha1ZcdKxTsLElOEIsQPOL8ysCC8wF0f
	9sJjYFwMszqgjl8bOwmOXvLTb902dP4IUJ622/n8S60Df+bkuxPw2vTB769OZeglizsfhFifM/j
	KSnNe1T6tcWhxSQMDZf9JgzVuWgklbidpZK1LvvEWth6D/shdb/CF6thAfd9uwyyRouy9ACfdjL
	zFMIHaBe6M0tWoa1ApzaNgpQwDsAOS8yfr1U2wRzpl5ZDbfFPvpBW/t6NS6WCqz9V+gx66ggZJB
	uuIlZYFxiSWJxwqObkZzNzhyUNKnGyhlftuIze5WtmbV7TgM7q7t6CQN4tqy4N1x3QKdk1p/Qg+
	AG5o8JkAJT7g9QhdUKOY2AUfMqT5TIxJdFC02u8FCXnTEA==
X-Received: by 2002:a05:693c:8801:10b0:386:b070:6f2b with SMTP id 5a478bee46e88-386b0707075mr3467857eec.36.1795447681882;
        Mon, 23 Nov 2026 07:28:01 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:00 -0800 (PST)
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
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 22:27:16 +0700
Message-ID: <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on MSM8953 platforms such as Xiaomi Mi A1 (tissot).

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

