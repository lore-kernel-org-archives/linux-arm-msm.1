Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506175;
	b=5G65z1iVsY8td6hTxlJK+8ABGbKTkh0o/KzXidKix8PHR/DBgjo9/bu5CjJWzpgGHJAd
	 63TyTdbbqGL5em+D/UVSyeswr2+CEQpKBTlFYaTHva7JKHWdCIsqzv6RxeOw+lZ0npaMv
	 /zItJIwoR63U62B7rNLU8OvmVdV7j84koF+8BF/dRym5XQDU3RobQAvIoD5qGnoKbbPqR
	 yKuSnjzWqM1HCzblng3vW1TC/JxUvjjo6hzUglTYYJE1xIXJpdIRZ5upxq/gO1mRo/hj7
	 zDmDH1wFcSX9avcE5FkFQdoyhEq5DZzppvwZ2VdJx6RzFZVBqdrUaTtUNhGnDa3zBBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0Po6NV+wXWi97vWY2tLsfy/Tq0VC6nM3yrCItfEC7uY=;
	b=d5ZD72bOt1L93PMPJ2rbANCvv2p19rLq9xZi1NYe9yS2umm1wJON38fQUfI+Dzz9d+hS
	 uv/uJ9n4G5JyQi7Mpg+ZHfBVctz9I76KVKIYZQQfOJm0aNGAQlR+eaJVPJGdIs2IUD18J
	 cZBMENMyKBGq8QxONCIbzVCxbzQ3AeiEfDuHEHVD26+052e+y4J5BJr3SxhUkH9W1kvP/
	 3lSUNN5db1MnDSBDnpUDNd0N/0wwE/biuKlRBDlWTo3crwdZQNtdKDIiXfI3TpuWTq8UI
	 iNkoKhTVlROI9MG324nSOv4yDA1H6PN5LQ5VVrRtRmDFsNMJkY9lcOLaPnh0oVdlvog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K4R12YOC;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7877606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 14:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7877606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K4R12YOC
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35f036b17easo1134232eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506174; x=1793110974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Po6NV+wXWi97vWY2tLsfy/Tq0VC6nM3yrCItfEC7uY=;
        b=K4R12YOCrAh6mzEDRtlBL6/07vYZGhaX4UNkSMg3BXcn7NbRyDymdAEsVPnvvCSV9d
         KST6fCZGU7xlroi4Ao9SMbbM3DBT4pV8XGiOxGPuzyPCcFC21YOb3sVbf3VpsgwrgNVN
         PG/Zt0mkYcbvDRCGoxXuKh63R5VmykTzVv0+ouK+whj1zF5H6QT0Yzp2ch/WWFXmla5d
         DSHd4UNMNqBmYXypAZX6T13wquE3m+WqtFQVD0pGsXr0RcCkLM0AdObeRfAIMkAJGHut
         5YUc1M1ihMBI6PkSrzt4aPkX2XsOTv1anpygsQUwZMhWjWFRSLYLT5TBJXlqgGv2lYC0
         iI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506174; x=1793110974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Po6NV+wXWi97vWY2tLsfy/Tq0VC6nM3yrCItfEC7uY=;
        b=kmVwPMxGynVereounRBLclciKtq5Q0jH1aW6jqjRjR+Jd4+0bVdvqVWzYS/MRwsnya
         8AnUpelsGZ5ZScHPa/PxSoTVCZkC9+qHdY7IrG3jMZGDOSCvAabj3gCIVWGzsOgMqomI
         Gc5P3tAytxLYm7KnHN4c/ztfAT090WThbi44EXEI7n1iMCgJRBbWyzll8KtvuNjm3PjX
         DEi9yyKEHINim0QKanU4xTykndBYVD6f2WrX3xzYu4pdrOmQTfVHY54CKhioOb43lTRq
         eaV+Ez6Z5BMGEAM66Cmpot0SzgVt+ggYbIZAhFqm2PGJhPjRv+aavdYsO6hnvPkTU673
         KjgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJIhP0uAARVZDomdlu9lG6rieQYvlKp7xh87FQRhSIZCc+XAlfERwkAnzDTiFo3U38PUE25dKGdXDRvzTl@vger.kernel.org
X-Gm-Message-State: AFq9FYJmUp1tYeUG0qu0J3I8Q9zNBZjT8zJqcfSfxE+49O652wV8h78R
	C0Cr/uNP+SBG47YgOp0jK+9e1Il/JqOcIS9XiD3vcQTszkxFz/trn9QU
X-Gm-Gg: AYBFou2iwcaWku2G/Sp0GHU7FA6WbBuS/+UqPOAdbvdXsa9xkAnq7xhIdQY8FAUcIJy
	DxKMrEXE0hgKpfhRTFRRGBOXTF7b+iDRLJvYRNKh2GRJa6ZjQChASi+gvUvHtfTk+HV0IFzIAtp
	togG/XelzwQXCT5HmQiSyWMHcap/8BpZtMLfRvYzVoHoOwXEER6yR67ozH0XLfaCge2WhH6u6nI
	69yrp5qWX0j1UIDIwk676T1V01Ym9BiPWQoNcggRttWCWeHpZnm0aaeBkLjYVWxYgk6pegI6tjJ
	n4xfWX2T5RZpzzX2bWxLzs9vbvsifZmoias7P7vceZddMBUldqHDDfgbTOLo2p8xFxWmKG1DNWz
	0Or3bV0DULAKJqaypaBnqbl8Venp1GzNlrVYokJmrhU1QzS2V7wMuw+3G2zI5AR9cNCiKswUso1
	p35FoNWzV4AtC5FzIQDN8jCkU5SQfvTllt3sRjDYLvzMQavWldt7JT3Mivu19jV59sshJmAXJ5L
	4T/BEI8Oeg=
X-Received: by 2002:a05:7300:d94e:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-361a1b52654mr15441463eec.21.1792506173172;
        Tue, 20 Oct 2026 07:22:53 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm66917444eec.12.2026.10.20.07.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:52 -0700 (PDT)
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
Subject: [PATCH v2 0/3] clk: qcom: sm8450: Fix eUSB clkref and camera clock collapse
Date: Tue, 20 Oct 2026 14:21:28 +0000
Message-ID: <20261020142157.1749-1-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
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

These fix three clock problems found bringing up mainline on an SM8475
phone (Nothing Phone (2)): the eUSB2 PHY reference clock reads 0 Hz so
USB never probes, and the camera GDSCs lose register state and leave
RCGs running across power collapse.

Changes in v2:
- Use my full name in From and Signed-off-by.

Sushmit Singh Rathore (3):
  clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
  clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
  clk: qcom: camcc-sm8450: Park the camera RCGs when they are disabled

 drivers/clk/qcom/camcc-sm8450.c | 113 ++++++++++++++++++++------------
 drivers/clk/qcom/gcc-sm8450.c   |   4 ++
 2 files changed, 74 insertions(+), 43 deletions(-)

-- 
2.43.0

