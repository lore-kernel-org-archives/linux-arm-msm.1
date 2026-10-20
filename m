Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506180;
	b=rVBfMzT6LU1CzsqPCnsiNn3Gi90X7zx+NgK4e+8Wo4U4lRVLAXnZlEMwFK7ReJLdPsXm
	 o+MtN+DWo8iyyGDFImfLFkH65Y5/bNIGVFAAdI+dErlFwe1YQYFZ8mBNPuRgeofR+3QeY
	 SvydWwoRZwv2qQg+w2cmOI5eo91+nIm9BEZdHGkOkUagRd25iYUICxbU9MWk3oWHKKFD3
	 negoUNUlsb8YLT1AlbuXVulOdNkQxygetBD1KZ47BJpwhQZkIJAI1uzQc1dWu3RowlAo/
	 DF5wgoNHkQQpeaYgH1x7bYCYMGlwbKY5dPivGfrxVp25zs8bdJhRvzUlnpuLdcwYHUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PZ8KNvjhkMdxTOHBC8Sl45C9JTaKlKVWxrChdR0rBwc=;
	b=pPzzZEClUOSyiKc2Pm0TkSODD1Hm9oGVIkZeLAzoaqaOtXhfHP5RhStL5EytigB3cNr+
	 SYEXFZWQ1dm3kbEqqD7rXXisVIj6yif6wVS7GCl2oLUhCH26g9iv2CqPAYvcI2EPJY4bt
	 LGulUucpEsRF875vcgqlFGiTdpuHeoMkR2knw0emB0kvy+ErlTc6zpEuClZ1xK62i9U54
	 YHcJiGLkzQctdHUozu6ERG1yZEfic9eyVFCcZVTTjpOP2wo7nZQyeaSuqGHXIUigCquBv
	 TDlW4jo8UvGyN5PWb7E+ppN29SHMOR74oiYV3R7LQq6qUfOH4VthlhF9Q/FDIcnLzrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VQA9krVu;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6153060A2635
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 14:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6153060A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VQA9krVu
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2113634c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506179; x=1793110979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ8KNvjhkMdxTOHBC8Sl45C9JTaKlKVWxrChdR0rBwc=;
        b=VQA9krVuTHut3IPDhuI0ClpvD/OmII31kBiOwwHNN/oNIeETn7hxgt7BlputxZUBcE
         PbUSk4hCl8QrSze3laotuKiNCnSkgu3J9h+wpoPv0G05m1dhyeHuSPay9Wqicmb2cDy0
         QJIdphlpcCG5laQS8NlO2KdJhtzUYCPGAKdhs7kKz6G1Sk5mPz2EfXBgAvkyXcHeHAkJ
         Cb6RQ2uL9a5cZcNEzA1A0uupAFhXTS/a5xgyLd8O14Q9LnIvm5jJqCCsEcKL3wGScGib
         WDSlNxfqdITRAcaYs5HwaXV1fGbm4AYc8vNptNvNxJNMmFzCdyuju+Ht7ohbOTMXc/Ba
         CmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506179; x=1793110979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZ8KNvjhkMdxTOHBC8Sl45C9JTaKlKVWxrChdR0rBwc=;
        b=Q/HC4bVHFuvIQiZ8xd+DCHvr8DMZtRxDZsIhjBurQSiYzaRXCIyUxXhccunCqxKUUj
         e2O4L6unjSUNQiKssf4YLGvrsOxAgzJi5BA71dKCHzdD5lWOjN6bYx4AN0p/3/ohkbIg
         nFH/HuZvmD78sq1f8X9oiMWuYttnXtjTWqjaAv/RAGzamzGHcTs6jlwfBHpWjeTXZEug
         iS0yLzP6N5L76rm+s3loag61jYfgHdlOFrF9mlsIOU79Yepn8oTsIFpMVT7388IwqlKY
         VznsrjGYfaudt2x8vXPnrecEyd2cEaRtPeop8v1EZNyztd+vj2hZB/xLMt+NJn4nigcQ
         1N8A==
X-Forwarded-Encrypted: i=1; AKwUvBy8O5JMJv8SifZzNz9Os1lJ6HxR2fi8BvGVByWgNbH0MGqPLwkzCJZBI4XFkzBPA3SFDE2PcnnwqnxH23oV@vger.kernel.org
X-Gm-Message-State: AFq9FYKmZySHPTT2z2PXwxNzoJiNfdeN15Vlxwe+AHjodgW5HRK4a2iv
	VB2S/vjWszCEtvpU5AukCJ9FTfq3uVOOBY9Id427ePgxbxYGEfWK/DIn
X-Gm-Gg: AYBFou0W3W0XteEEeRlxsvxy4Zx09VDWJRBX7j6WAxjaVEm1LV0BAQPY2pmwzPK+1fi
	OJRjtr5pk3llWtL00S9yb06w7GfwIGGNjW7a0c59Aqz8J8JwH4f6TyWGN4pO7ZaY/ISPX+auy96
	Su7A5xiM4SUan4cUXei8WyV193aorwC6LyH+i/RpXgmER11GmpO3tYC6J530DjF515VJBQGTVJJ
	gVoZCLo6bvDznQskrNw+2yciLh3hzehjfzISn+u8sOlLRKC07hrB0NwboZ8JKq3rFabp4rjtUR3
	33kTkZumXjog9rEssdfcHJ4xiOjhh2I8fXs0mVy2qfkUeZgS3vK1SyAlv+M9J/yHVGQgOK/FBT6
	VRVKP68VKnH4/PabO7WOfZjZ68g+VznGzkHNyq8KKCsDmbDvgZOqM1NOOIN8bJF8l0bp/OMbQCZ
	gZ28kQ1o+Ayyp5A26Nj4omO+AKSjugsmnt+IZHQHNYc7aoP7H7C/LAv5iXqcGMxpVtN9R+MoW3+
	gNi9YAZv9Y=
X-Received: by 2002:a05:7022:7e8d:b0:151:2e62:fe8a with SMTP id a92af1059eb24-18514256ee0mr16829571c88.40.1792506178808;
        Tue, 20 Oct 2026 07:22:58 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm66917444eec.12.2026.10.20.07.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:57 -0700 (PDT)
From: Sushmit Singh Rathore <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sushmit Singh Rathore <sushmit718@gmail.com>
Subject: [PATCH v2 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
Date: Tue, 20 Oct 2026 14:21:29 +0000
Message-ID: <20261020142157.1749-2-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020142157.1749-1-sushmit718@gmail.com>
References: <20261020142157.1749-1-sushmit718@gmail.com>
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
Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
---
Changes in v2:
- Use full name in From and Signed-off-by.

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

