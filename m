Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F32445AF2
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 15:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338869; cv=none; b=fXABvBsIYMT5sF01FaHjQoE3ludHzZsPeKjE3Q6dk4RTtxlGN0Q1wDTYH/XkqmF7ZWT4++FFtkqBvxN6WpoiNgABuGdTv9FEyQxmtyfysbKNgSDclVBZ88cFSn2QfLadIZliHCR0tyMg8eHn/dRwPKj3nFtcfDsg472DpIg3qQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338869; c=relaxed/simple;
	bh=TN0F72Od49q/9VsV0FPLYXRT8mvo8Ym05QTkvme9qKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YVUcF7+geKNU3dG8RrZUQsRzibqxsv+9+Mq4etdimwFUg7mn6LCe+woX3hmjrP//Zt+HI5D6uTCeU7e8zjiqaZrkscbljl0DgrVQ5XzxKMPDBrmSQndElUt8e0zWhXecf2+AfEI7hJidom7RRFSYM3KDnYIF3S7yFTCaQ71wbWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUa7ebE7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUa7ebE7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso12010775e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792338866; x=1792943666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TN0F72Od49q/9VsV0FPLYXRT8mvo8Ym05QTkvme9qKI=;
        b=aUa7ebE73UwZVE4PgjDEGUbVxjNzSBL7rA/IBW+retNCeKe4sogMYJ2jIlON+gxWp7
         2cmBMPFiR9o9QFDyQx2YRh8ueS9mfomjs561Iiry2zkfGnRiJQSPyvQhHBZCLMHSF/vy
         htZSZM8PYMj9kNw8SDHXwrkVcOJn8SWjwPDexl9QYm4piY7MArp7cVQccnsuhp02cbs6
         NI5tmn7KUTg9bn5hzAa4VYfmGkjXKoRKkgqpxeUBwjPTIGsgpq8wMJgyG9g7x1rPk8B/
         d8jHFBbYeWgIMt1QlTYMXtt0hIUVGPm8S7Ld/T+GE4YMZdc4P42ubuQybTkxHjRghxZy
         cclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338866; x=1792943666;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TN0F72Od49q/9VsV0FPLYXRT8mvo8Ym05QTkvme9qKI=;
        b=TCo0ZonU+sQVhsrdK1yXPHhJvPEKb9gSRnCIfBR6eWl88Zzt0u9Hlwf5Il+XBZMP6y
         BxN+XSD8LUJ/M0ytBo6kO9a/oUxX0Ty6jiLrJe8FZuZ1aNcJheugtewrVLv1jDR5OZu2
         +cqQZqwt1KfB2tjTWHef8TfUWgTSKkVz7pnnqa52i2frm5F750mKJ5b9WOLO8nttBvM1
         J5MWSylL7ekKshbz2Ap3xZkRrN2PKS4f+7JNK1OhMSLlW6r3v2gIP3sVUQwbgE3qL8Wn
         wZlSZkBJ9LKpBGbgD9dyPjUh9oH8Gn74i/AFiRd7JyNHGqooBX8DsMbvWEE+zss3u/kr
         7H0g==
X-Forwarded-Encrypted: i=1; AKwUvBz89j5vMCS7N5qJnhrlAbnfe9xp0e8hFaLpJOtwdSxA1WDI0PwkBwe3WMgxVZru/SuPRPuOYGUS6PTXgluJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJWsfJEthOWsFdBtBbbtDPBYOn23afbkEN+WCa+Z3DSNqGcFUhM
	dHodi/75yWegtRvkttkqEwnPLz2OmJlUYleRk9Whjec/ymokL/tyeej/
X-Gm-Gg: AYBFou2PGJaeqjrT3YTMDpowRE77QGw9leZhjnF3izXHsbF9+jYyZLGIVNWMtnDohq8
	EMlmoZSnWzNje9em8Vi1+MBWWT2/2Setpe+0Z48hLaN5OTgjnmHj0Pely+o7Y/Iclpqzl30MGv8
	1vVHXlGdvWehdh9sMBoQ2wh18yimvCvZDM+JBazyq3MMn5C4CcXlseusEJDHTmIL9WWEhbuwc5q
	HiZC/numy9F0+CtvVQobamah4U576QTNjqofJLA4YFa7dYLZsA+20J/UYQqLbaiA25MxgnGNpoS
	4hZV6eYI635BhLt9KNgh0oYS4q2/pvqqkFfNpey9Lwg950B4ehUYCYglHs0Fr1Fi6RSDa9zOVCl
	Ak1IG7YKbDne7QPpUIcO7eMK4ca9VvAwWdGJU+LhslBnn65jkd/jwv3vq70TC+wegX2wD/4Y1AA
	U0wFQywm7Vrp2hNQBAGTiuN1niV8G4FSGG7Ei/am37U+tWGIolGCu7/+UZ/PgBhApFHndnpqgXt
	MiQ6pZxogNe11Qu1C1wN/6vXQ5LN3gJtH3ZTiqN7oY308yOJouvaDFzabdzI79gNIWswFymba6w
	/V+vFr47oS0dIscmZefDZw==
X-Received: by 2002:a05:600c:3b1e:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a1d75f9341mr124952765e9.12.1792338866523;
        Sun, 18 Oct 2026 08:54:26 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8af2fcesm227892415e9.8.2026.10.18.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:54:26 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Amir Vajid <amir.vajid@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/10] firmware: arm_scmi: vendors: Qualcomm Generic Vendor Extensions
Date: Sun, 18 Oct 2026 15:54:25 +0000
Message-ID: <20261018155425.1299660-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I tested patches 1-9 of this series on a Microsoft Surface Pro 11
(X1E80100, "hamoa"), on top of 7.2.8 with Linux booted at EL2.

Without memlat the CPU never raises DDR/LLCC: the cpu-bwmon instances
stay at their lowest vote (4.8 GB/s) under full load. STREAM triad with
12 threads gives 38 GB/s at EL2 and 41 GB/s under Gunyah at EL1. With
the series it reaches 67 GB/s; the ddr/llcc devfreq devices go back to
547/300 MHz when idle. llama.cpp on the CPU (Qwen3-8B Q4_0) goes from
7 to 21 tokens/s of generation.

s2idle is not affected: CXSD + AOSD + DDR stay in their low power modes
for 99.9% of an 880 s suspend.

One thing I noticed: the protocol 0x80 module (qcom-generic-ext) does
not get autoloaded from the protocol@80 node here, so I load it and
scmi-qcom-memlat-devfreq from a service at boot.

Tested-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>

Thanks,
Ramón
