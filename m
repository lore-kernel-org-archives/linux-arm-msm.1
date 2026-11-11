Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384391;
	b=q+QizzKUueoVou/gkXfOHKQXXGtW6KW2tqjfzX3bRwcWQd4WG9EQF9rpvxwGEHXWj/Pv
	 u+5mR+RNQHvS2Nk5l6ImfKTXEmCSkGzcbK7rPFjeXjaBherqb6C9Kc8l2Qbh6L5ZhDvOr
	 VAA6jK69TSVyfWwOnBmWJLKLztcwW2a1Hx3hjgqr3/lWPFmb5qHfGrq1BpVqRkrJXF5bA
	 zMg0KdFbb6G17j+ZI+R0Os/M8Xp6hYtov1JhBmrG4y3H3mKLrvvPvv8RCZcsYZmP0FyTi
	 I/8w76Kcak9RbutIT27Xjs+fTT+36Q4Bud3XObb8lMEhGs1oAm4lGB0wyfntgk81kJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W1gwVkZ/2RHWAhZ5H20eTFslqrz/7SXfdf02mBXveOk=;
	b=tKLP/+im0djFtyLrx6khfg01Vw1M3asj10rlvYnMZlVXq46mDg0ZWG/dd++Y54HTDRjn
	 ZvBZDT4OTst0vtLVZ0EnoAJA6PDoCBZaMKjKCKoXHq5HDBijfaTEqHTh6KrpN+IKI4jVR
	 bDXsNpJ5y6rsaXqVWVCK7EhmShZqMAKj4ghgqVNsCQfFiBvY+P72XPhBBrqZ4sg6QVvE0
	 x+0+ewoKTUDiFqj75TkKx1HQ4R8b9L0ilRglQ07+CcHZWOJddiDpoS0cWBPk3gktmhfBp
	 GHpz4xfAXGqHcKCN0Bh0t79v5/Eo95QIIZhFGiWIj8SIsf7x0tF/xbSZgjT0HZm7G3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=b2ri6zZL;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E76606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E76606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=b2ri6zZL
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so3728706a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384388; x=1794989188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1gwVkZ/2RHWAhZ5H20eTFslqrz/7SXfdf02mBXveOk=;
        b=b2ri6zZLq3enGxYL08H8xb/TtOdSWDeVZMx4/rE2VCBd4WTVa3wcVPgS/v4aGiZnQk
         +mM8g76WGQl+uZWm1oNQj8NQ82MIsYZmwB05aik8TWMl2eLTuOCEVoY9lvhNy8LGp3RM
         oohwhC9bspeoCfvbLQxFtk8cdyJb0o8+WDxalC69Tkf4YCheOx/Rhumow4Fdl2ENJa5H
         m/NbPYnlWmtUwfc7zKJxYcaTOP4VugExQjHrbaxbvdG6JlFqD2AMtWpRySWr4XEuWiac
         wXFCaMGqRvL3WacMtZX3XcCYZ2HX+F19B2ZAOoTftBANgUK3wbYwGooVcF0/ETOsKnFB
         y3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384388; x=1794989188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1gwVkZ/2RHWAhZ5H20eTFslqrz/7SXfdf02mBXveOk=;
        b=GMMwTOBGVjrcFhsnXTobcDWpEHZXM5/aDyIm4giKW9FI3qys0OyguXTeeWaWYFtO2v
         G3YH23MY1fG80yO8xC1t067bXkpFGnJwsTLVQyeBhLaKWZ8pJ2t0hSn/fgenYI/JauKq
         Ob78i2rzjBTN/0utn3Y5oL51PHuNnCX25JbxPy0smJq8C7uWzaIqqzxgbY8nyu5+nBXW
         na0jtDkKzjnZsuP+3TpIMSj3LYcRkYPURkob63HX+1vxNL+jom6WdlfzENjF0bkcsDQ7
         mZ9Qz8itk8ERn/DyDNe2aJsUjnwQiBA5NOQzhNwEhx7A44dYELwNEJvsXI+OWn9M7yP6
         jsJg==
X-Forwarded-Encrypted: i=1; AL+hErFIEjvj5g2jkcg0oQkR6Cg/MiglhXsQjrpsnMXv2f8bb75AH2fmSStlKOv1PUgbQsLc1wLPwURh0ET3afx9@vger.kernel.org
X-Gm-Message-State: APuU4Z9fWJWslVUeOnNuL08yxQeV+lMc6aAMXIGrxiwRRrGkiUfuK4eN
	VepOrxYQKeLSq2BGTBncrLmsnPMuqxlctwh/XtUhcWPBxJF0FOJWKLepfyou1YtttA==
X-Gm-Gg: AYBFou1YEtGbk0WHBaLiTa4xwCvTWuBlPiGivqkSpH6soDvu9LChD8CKDAed+FQ8Ews
	w25I82qtGDA2Ug62eDHl0pd6mgLlOqbEpsprgYkzLysDTt/bDyTYLRyq2UpTzgAa9EqO83C6ZHU
	BMYvGXRY+GQnJF3FqW9cG/t+7JXk39vUpVfHAYmblKOvDbdFToaR+GCGLAdsjtmnJJste2Sqe+y
	awqM/Bi3nd+ptDX8J2a4aqN0jMn7Ug2gvJXxrl+y5q1aJ6d7IXMcb5kiAlXdgbVLQhf73yXXEYv
	t6oh0qWNlGAnJpJcUJHyAwYoflX4hPQ3Hy8+DT95Iaqn9NjKDzCjpszWVmSI65B+iga6QAfZ/lE
	U95kMSeL8liAhFb1cFL9iwJ5q4vhegO+CohD4ZrOv5HukCyDu78b+ptU/dOKboSoroQtxUo99fU
	p0UY1uWnjpEDcGFouzKRifgFipolVm0iQppSCPTt/nYHpISf5y8HEgEgAFodyx3ZtdUNXEqlhty
	Qa5zcZkN7M/lXXmlhdEdr73WvD7cP6dJNrRqkOUPiZCNXqaWrridcdcJ4loTHdQU7fJWHR1OFO+
	3zleOiF46BoiRW8sXxorpNG40Tzrqic+6qth+b2pmjPMhGsu9ImqJqWEtV6DHZbZDXOxdQRjVfo
	edT+lCZ/fttKJlqayi/zBUxM6D4c6iP7MJPT9ReSWJ40CU+LioQw3CFdHd3J7An8EEDAl7Wz5HL
	eIlPOwaxs9qyF/ks+lskv51KMc0z3vxx9AuBk/VEIhJM1zIbZcnpVseRWAIjCzgNAyknYgoPRrm
	/YPtqnntQ6s3OCQV7pJQhJURgbnIiDAfZT7mZxrw/9/gkLXXoN/Tcop0oPTrIRpCPw3UefLPf6h
	fq0dJP5CL/BmM4xKmh0=
X-Received: by 2002:a05:6402:1ecf:b0:6b3:c0f2:eccc with SMTP id 4fb4d7f45d1cf-6b77780edc7mr1263629a12.27.1794384388193;
        Wed, 11 Nov 2026 00:06:28 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2287549a12.0.2026.11.11.00.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:27 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: qcom: qdsp6: bound the compress ring by the DMA buffer
Date: Wed, 11 Nov 2026 09:06:22 +0100
Message-ID: <20261111080624.244291-1-julius@bairaktaris.de>
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

q6apm-dai and q6asm-dai allocate a fixed 8 MiB DMA buffer when a
compress stream opens and take the ring geometry from
SNDRV_COMPRESS_SET_PARAMS without comparing it to that buffer. Their
copy callbacks place each write() at the stream position modulo the
ring size, so a user who can open the compress node and asks for a
larger ring makes write() copy data of their choice past the buffer.
Each patch rejects such a ring in set_params.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  ASoC: qcom: q6apm-dai: reject compress rings larger than the DMA
    buffer
  ASoC: qcom: q6asm-dai: reject compress rings larger than the DMA
    buffer

 sound/soc/qcom/qdsp6/q6apm-dai.c | 3 +++
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 +++
 2 files changed, 6 insertions(+)


base-commit: 20f1752b9241d300b42cd45a07e22d063bccba45
-- 
2.53.0

