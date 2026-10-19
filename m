Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426682;
	b=aVTjDU19gYMFW1w/5ukT2gVqc0SXzkSFKdmJvqCefz+lToEOP6WNAgt9vaHy33wcCQqn
	 A0rZUptn01/qffpyHIA+M5xUG03TmWp3BFAJ/rjWfTYXa00k+T9oTfv/D5O/JLQCfnRmh
	 YvjhR5wfS8nwEyQuy9hpWnXYbCC8WsGuSQNQEN6eDo94tyN0YAXNraXI0OzknKOeuD6PZ
	 WhrXLIm9Y2hWI8BH/aPP/KzP31Cd0qFvdjFY2KlooBvlMQTd33DbN29IXKbHMrM4wVRYF
	 tI5mo/9eBUUDZ+yP7xcAi7NpBLvoLDKUYY2xOSXVCQJ0qg0ar16uB5e8wIoi+P6qvkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DXtMdBajp2aV+I9O1IycmvhTJ3P4GuSEtRtN8YcfKOk=;
	b=ahEkhu/bAw9Kv1wYRjsSUeV9W4u6wKz/AMoM5QaePek1SozoyK4impBI1/NJs8ab3fGg
	 3sOrVeyBnVRKw+NgqTjf/gTVQWjUsvrs9W7ZAcJy8H3l3zvHYWVckpNsS+9uhIMunwKmO
	 YRXC373wykzf+MKYG837nEZd8mlkAvO2Y1XCggAg+dRwOhg6HepwryN1pTM5fymwcL9kH
	 DtyEbGnGaPNvIkAXu38B/1JEjQIl3/I3ha2y6lcfs/5PoTpkh8anVeHguugj2TXuMQnjx
	 a3/jGx6jreaXs9i10qByrFnoVsaZg8q1QXfZXV6muks0AV+59/56Et5EYorcysdV3Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X6utE1Mi;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D660A260D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345D660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X6utE1Mi
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f1f76ea84so4221592eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426680; x=1793031480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXtMdBajp2aV+I9O1IycmvhTJ3P4GuSEtRtN8YcfKOk=;
        b=X6utE1MiMIBEcibYl326t/RLYXFKYrBr8JeJjXi72kPdntNkeFbGsKzNZPkJvwtVvY
         72eoHC41r1x6Hwl8+seNa2qyLfdqWTtqfj0nPArZKR048dhOmVo0dJxXzqVhw/QxVKjG
         R5I+7PfmuObo8GTkWSn9FhfOudVRRTPKmM+zYVDdWz4mlwadjU8dHFkejd4ZB541CvTL
         obzT+hAn8hUmV6Bme4c3/jyv03eQcpChj0oS9IbplhuBMQH2DfWPANFjOmAX23TDKXYx
         nL3lZ/Mua3TfkORjou+Ep/AN24BWjv+MQo9XBdw3loAPX0j60AqvoKBpo0s4MSmdx92d
         5BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426680; x=1793031480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXtMdBajp2aV+I9O1IycmvhTJ3P4GuSEtRtN8YcfKOk=;
        b=BNotp3/h8VpVdmTirJ17c+cGz4u7tx7QnpDtRNxXi2bci61MbAxT8/oqCjQh0xKc9n
         BrpE6hWcnQAT/OZb2BO0dScO4kXtwOqYj4rpm/Nu9Vmfq9/9KgZblwfT9yZBvL8FUYdV
         QhzzEPoh2YDMNcE8/ehCNWAFWONDPilT2zj2cpmJX4tL0GSw2ysvJRTgQOJqLnVhkOS1
         niNoYo4HAFNUUE/b6q+qOmdxzT12OsMIGZYXFROLDRXkH8JMV7TuORnhrZOsV8lNM3YV
         tgRZ2k/8bBZbQq0VFM2ZRON5Sn2V6c6W79F9HdxEHaBT54R4imEh/FYJd0uvh4dRohgG
         QJWA==
X-Gm-Message-State: AFq9FYJXTquiZ9d8RJAvDqanYMtSEHZqUmF2y2O2qxMRPpHVRRrQAh7E
	L+5wnVXfNBLLPeili5gAbndSS+IzCvZlAKDCIiBR4yFFYJJ7N5qf3o4Z
X-Gm-Gg: AYBFou3zRaGt3SJ/NsifZTpVLI78seLz3XN8AGY3Vzx+GdNuGSHeHusZbbJd41dHDQT
	vWmbe/JpZoXgv+OQLjGTOwUvGylGssVsKDkFWnG+t7JTsSW5idvGs13Wa82s4Ee0sI1tWsWtcy4
	wD4e0OYK7Eaf8DNfYB5AB4EDSHo1fhlCM1y1OF/LyqdGYWrjsjbYHmWt4zxjL94mx/M3183hAta
	IO6bsNcd28r4PfXs+dSzQS6l7gd8cZcsaQ9hnEDiatH/GJCx3FBLafiox3zXjhBRapDXZS4iLt0
	W+nXXbWkp9hpKA6wBYNCXiNUoh3wf6mB5rozQ68jyMpqICK/ybEG/+l8b+b68+DNheK+IDE1W5L
	J9Zd1e6b0kVe/6lB0VshNV+fKVd5TBcyhhP3YmZwGW7jT9rpJI+JbuyS+DZuHGgrJBarXEfe2HM
	hyB2BlrJLDE6YxKuWo/GinCS/oLIhCl0mWV+1tptfBjwltWXwlcbbFEyNP1WnvxS6eg+7GruK/1
	IUP2A7CpZw=
X-Received: by 2002:a05:693c:88c6:20b0:35d:19d7:84c with SMTP id 5a478bee46e88-3619ea20ddemr11526918eec.3.1792426679694;
        Mon, 19 Oct 2026 09:17:59 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm33410985eec.13.2026.10.19.09.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:59 -0700 (PDT)
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
Subject: [PATCH 3/3] clk: qcom: camcc-sm8450: Park the camera RCGs when they are disabled
Date: Mon, 19 Oct 2026 16:17:40 +0000
Message-ID: <20261019161740.2384-4-sushmit718@gmail.com>
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

The camera RCGs use clk_rcg2_ops, so a disabled RCG stays configured
on whichever PLL it last ran from. When that PLL is turned off and the
Titan top GDSC then collapses after a camera session, the SoC hangs.

Switch them to clk_rcg2_shared_ops so they park on the XO while
disabled, as camcc-sm8550 does. cam_cc_sleep_clk_src runs from the
always-on sleep clock and is left alone.

Tested on the Nothing Phone (2) (SM8475).

Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
Assisted-by: LLM
Signed-off-by: redducc <sushmit718@gmail.com>
---
 drivers/clk/qcom/camcc-sm8450.c | 68 ++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 9f1dd51db0d5..77b9d7efe390 100644
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
2.43.0

