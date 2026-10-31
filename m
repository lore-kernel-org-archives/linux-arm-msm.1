Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449251;
	b=sArTkNkRsvL2t7JfHYwfs9gs74rwA2FvG07z0LK/j2KhXGc72ms7bcVZBJL+4jymcY+Q
	 zduOdeossQdDDSaw4FOrBPkeIAQRpWR5AEuW98X/j+liFYkMFaLFOGPdrs2Iy7HnTlajd
	 ggC7xJh2kT9MiSUU0G3VvozP/TUhy+h3XjKv7a0MAcZPHzRGhg2bdCjFlRN99UDNGpp4z
	 Frp66EIoPpbM7Sd7izqN2PJn/NP/zgBNV/bO7BNDLmKh1/rQYPe8b87xlydXzgNuZFaZ+
	 s9OSznFK4RrtCNYHRCeLVQP9IOx9BrhvwGUoQ7nWJWTE7/ztuWEGCBQhcZ9yl5Oz/PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z/mFqmY888B/BY3z4ZVItkd6G0cdZL4x/ShWpC0Z85w=;
	b=0Qgo1/8Fl/LndV6lYlQlYRTb6MWvbUQpn6qBmPBCCeH/ogHxTOR4uBh1VCMdUzO/1375
	 W6jQy60ubICHh9++3/AjLai5yboNBgHcINITEpoObWAbQXZ3BgnLlIeDnsXOeZTA3c4WW
	 bPEPqUJUFH3+lGwXhsu/Ngh6EgKzCtd0/v5qQhjiLOMK3leg7RlZi0jDGxkwLbTGZapJR
	 pY02Fhf+oaX68K4lOkYKddZYoBkGxq3ZetVSBzXVQsNQ3xXg53rGB7v9JYjFWxh+ySobr
	 2BCKesUphzKPa6UZ3UUobzVdkDtHhboVYg3zKU9WF32XNT41JvxvrsX56xGEsFPKHIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rmnYKnba;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E46A606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 12:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E46A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rmnYKnba
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab3fc6e388so1928841fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793449249; x=1794054049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/mFqmY888B/BY3z4ZVItkd6G0cdZL4x/ShWpC0Z85w=;
        b=rmnYKnbarn8lvFC/p/TuYzvWN8LDg/VM3B9htlFSgSs/H1AJAU6vO4Hb2rIkxGxG1y
         nUcJQSUe01Rl0U7qP/3D4coRfr+pAPUHukRJVx80AQRYJWxVleRvZqoGaqYZyE4YfvLi
         9x0TuwNLhcsbSlC7On2oHvUsZgJXzPF6BEUNQ7xT80fP8D9RiLaDNiZU3xNGasUdRTDo
         K50eIudOE5Osnaip7uuhFnufHr8DOkBXJvi4ac0zLOSjb/4x544kbA+ecxikEcRB5ov3
         CdBu5Gd7hJwF80Ej6nISCzxrqFv0qbxKST9uSjigNFtfq2ZLvyY5cMAUExdiqHooOywe
         SjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449249; x=1794054049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/mFqmY888B/BY3z4ZVItkd6G0cdZL4x/ShWpC0Z85w=;
        b=epm++ccxpBO5ZTjEuGx/2t69K+lZaY6j54/+sqUWQ0zd+pRd7S5FwtBi/24HN+7SxR
         6IDg7cV/QjL63+wc2c2nGzd803ykUACv5ZMOBQN1NDC7I0nwuNM1IyKOXwd7zUX2QIpz
         ADZdm7IuOaib67WFOIDXPVb1qxbDGSgZZWo04UpQ7ARWdwy5Bl8vO31PK1sr8XfMqlAd
         GoGKpd7VT+co5qfgn4DYLHfXnxa7F5azWrO7vwlvw9mcMPAitB2lbV6CAQXhp25Ih0Co
         1R6hHXyyOxzPsNe6ebV1NCu17NmswGNqDWjipnTRDpbr+oGwrN9D7sBAV+aXUStbdPoe
         p+9A==
X-Forwarded-Encrypted: i=1; AKwUvBzh9ZuRWFRj3EFcy/LW36pozH0GKp4SI01F1U8nrcUv89XhCXxBHSUc9z4cGqsYW8INyBQeOdVc+T8Jhi3c@vger.kernel.org
X-Gm-Message-State: AFq9FYIYtD9VNOU7oLueq21JGUfq+S+TZORo19lohVOsmVaDhLfMHDaP
	y0NuQZij34lvWYtaJx03lib1gWsc+vRx0hNleTE74VMId6x4UuhWl5KKj5/QbWKIhvQ=
X-Gm-Gg: AYBFou2F9qSAQPwb7gz05KpmsiSneONgV0R0ABdpG4UXFpIIk4AxEsKNmVDAPA8tSmr
	me5BStV/Q9uopOFY2UzHTh9ocSOM2WCaBuJ6DHrxYdJ6XYQiSehWPv3LtV0iDWWwXxkFm8aDkle
	rP+bZBrjfJch6uUkGCYMq4pONEN7BOTvweIZmAhjNsHV+h/JeBs1hxHtrd5brbtY+urCGYAJiEX
	geh+fmClNwkJ0+hFv2xQSzEB2DeArh2/OC8EwdC6Odg8nq+U5uDHbBP/R3OlhZBLUzzqB0nYUMq
	8QZcPh4FbiZcKHz4OvtBjUxMNbkfs1yWo83bqNN/tsgag76RhB/cC4asxOIGoiP5f1gsWXzB0Lp
	KNpi2AvaujIDCIE2p1+Fd/CojOmaB5e1m7NFnqhQg28q57BTq0wwR1SiTg6NMPSCuJQe1cU2E6g
	KO3oBxjSSFAiVJ8wo98DcDuolnVJguroVCZYMuWVyvVU3njMHKxmutePZADaQVOtV0a/O+/jvkZ
	c/k/fr4M0aE5c4nJYlKce9d0h7uGEAK5TaHahLtEyElsG8U2E+KNLjA5WCd/AbxmHZtbmeiLe9K
	78YqwTttISYtNaf4Z27LjKNCObSl0x8xsyYgSYjLk2ejZlsa1agpB8Yxzcdyfq2+yGBGzA==
X-Received: by 2002:a05:651c:4353:20b0:3ab:618:fc81 with SMTP id 38308e7fff4ca-3acb7a34d8amr10639811fa.1.1793449249381;
        Sat, 31 Oct 2026 05:20:49 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf35251sm8743311fa.37.2026.10.31.05.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:20:49 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: camcc-sm8450: Use clk_rcg2_shared_ops for RCGs
Date: Sat, 31 Oct 2026 14:20:37 +0200
Message-ID: <20261031122037.565113-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
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

On power on a GDSC enables the RCGs within its power domain, and if an
RCG is left parented to a disabled source clock, the GDSC power on gets
stuck. After a camera clock controller RCG is used, it is left parented
to a camera PLL, which is disabled together with the RCG, this leads to
a problem that on SM8450 the TITAN_TOP GDSC can be powered on only once
after boot, and every next time its power on fails with the message:

  titan_top_gdsc status stuck at 'off'

Update all camera clock controller RCGs to use clk_rcg2_shared_ops, so
that the RCGs are parked to XO on disable, like it is done for SC7180,
SM8250, SM8550 and other camera clock controllers, see similar changes:

* e5c359f70e4b ("clk: qcom: camcc: Update the clock ops for the SC7180")
* 52b10b591f83 ("clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs")

Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8450.c | 70 ++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 4025db23d1a9..a5379ae21332 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -834,7 +834,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -856,7 +856,7 @@ static struct clk_rcg2 cam_cc_camnoc_axi_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -877,7 +877,7 @@ static struct clk_rcg2 cam_cc_cci_0_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -892,7 +892,7 @@ static struct clk_rcg2 cam_cc_cci_1_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -914,7 +914,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -935,7 +935,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -950,7 +950,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -965,7 +965,7 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -980,7 +980,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -995,7 +995,7 @@ static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1010,7 +1010,7 @@ static struct clk_rcg2 cam_cc_csi5phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1031,7 +1031,7 @@ static struct clk_rcg2 cam_cc_csid_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1055,7 +1055,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1078,7 +1078,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1102,7 +1102,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
 		.parent_data = cam_cc_parent_data_2,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1126,7 +1126,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
 		.parent_data = cam_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1149,7 +1149,7 @@ static struct clk_rcg2 cam_cc_ife_2_clk_src = {
 		.parent_data = cam_cc_parent_data_4,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1170,7 +1170,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1185,7 +1185,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1208,7 +1208,7 @@ static struct clk_rcg2 cam_cc_ipe_nps_clk_src = {
 		.parent_data = cam_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1223,7 +1223,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1245,7 +1245,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1260,7 +1260,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1275,7 +1275,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1290,7 +1290,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1305,7 +1305,7 @@ static struct clk_rcg2 cam_cc_mclk4_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1320,7 +1320,7 @@ static struct clk_rcg2 cam_cc_mclk5_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1335,7 +1335,7 @@ static struct clk_rcg2 cam_cc_mclk6_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1350,7 +1350,7 @@ static struct clk_rcg2 cam_cc_mclk7_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1373,7 +1373,7 @@ static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1396,7 +1396,7 @@ static struct clk_rcg2 cam_cc_sfe_0_clk_src = {
 		.parent_data = cam_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1419,7 +1419,7 @@ static struct clk_rcg2 cam_cc_sfe_1_clk_src = {
 		.parent_data = cam_cc_parent_data_7,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1439,7 +1439,7 @@ static struct clk_rcg2 cam_cc_sleep_clk_src = {
 		.parent_data = cam_cc_parent_data_8,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_8),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1460,7 +1460,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1480,7 +1480,7 @@ static struct clk_rcg2 cam_cc_xo_clk_src = {
 		.parent_data = cam_cc_parent_data_9_ao,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_9_ao),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
-- 
2.53.0

