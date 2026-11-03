Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694746;
	b=16XjSR+77Y/InFncQcZoamsDNgpFprBLHG6bznyPLQP8HBT1YrDWQT3ExfUEVzCGVLtH
	 nku26jPDJihXwDdTRb5lRXf18lpxXM7mazMmcJLNkf59jaYt1MWa37DNZYV2NOQQlJ6eN
	 jUD3rCaPQK7FnQfWffUn2MWkm55oZlmVUXqmGSzvSjPxvzN/rxpJYVfwG/c9j1fAkSReD
	 GeHWryoh/3Cd1Q7PoGR4aGVjAussq7CdLJJ0xf1F2gWChXFFDcPVug5t7zXUoLafn5Xk7
	 /vEmvAxAl4yqQLAgkXHAeolY8n/yE0sqXVghJwkoHEeHlZ2tOLGQZ7skKjYbnJW3Org==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
	b=C8Qm7RL+r5edcmGFViqAE/XYLq5wf+P9/3kNHi+VHatogsSf4faXPrKL0Mzsk8SDMC3n
	 f9zUj5iUMkaW85KTOGiOP0lLE5y4JFd6OlBht5/pHw8xI+TPXvlTAl/pFBcCyH/kMf/Bx
	 Z+CvnI6wuofVsVqnpdCNGGKR2AnXWNCV43+9eyj3P6EEEMZa4rW+77JBcMJjIek+DqnYC
	 OvDi5KZ3sbkfblLbZGoAnVWXkY89DJXxwpAWqUBr+iXrmnbwVn8jGjVjN5PjKlvFSrp6F
	 6zEhUo35662kPQexpDXSGeeNjnigsuen3u+yHE3zBgEDLe6kPWSs+JwxIdg253yi5zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5fohdBx;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1099B606A32E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 08:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1099B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5fohdBx
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1861168a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 00:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694745; x=1794299545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
        b=N5fohdBx1NFB9AacLoSHrX8kbHCWs0MOFlRa7iGrfcHrdu9N2ICrvSNW+jtvWA/at0
         0iQUKX8LtCxGZmPCnF7TakoIIzG2QtQom9Y8mi5FybXTwj+yrGJXGzs3R4WU565xPvqY
         6kTFfWOGhnFahW92OPvWAuDPs/0ByNgGPmx7cjEX6Yn2ZPZ51UAxbhv2ExJM3lSrdbvl
         Aav+HOMNmVy3U9ELqSoyECWxI/U/gIdxDgbnUdc+DC1NhC/ahaLM8YV051OMEDk5whKE
         dVYmHjFaaptVC9InyjtJ6HWO+aL8rbE0u9GSswzao2FfSnqDJ513az1Guv9iat4lzrxS
         WT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694745; x=1794299545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
        b=K76OsuIwCfrAABIaAw5FZzhAWqCO7ry9PPRUUi+QcuwtixZxK+X0x0g96Yqb9YA2d7
         dsQYywOTiRNSSS+uq7TItExUY6UcwagBJrcV8/biIUUP3YXhMyn0hmxgzSjMs0qGBNJT
         n4e0sQtu6lP++Cz9F/P3lv2i0l3eoCGC3ORj5WUQAJk3gjBeg7NjVzG4yDsXbSPI49Gb
         BMk0xWBSwiUCsizwoJY8+qJt1oe7LiP8mZMTes4Ehe7ibKl3TOPIKeVtLZ8eDDrVsjmW
         TPRQWevnBDLucagp19H/TeTUvZ8tl/T1JNUTYD1r27r1ALtcv+Dee5VFZaIIsDKne1U0
         TmUg==
X-Forwarded-Encrypted: i=1; AKwUvByQ6htNYOVwtb/5vVhKiFWG56KfF9TU2PUEpOaLUapMS01D7m7v+T/ewnWqRohkfuvoBTcvtD0LArOFsqSz@vger.kernel.org
X-Gm-Message-State: APuU4Z+MR4grMCiueml1iA0MNk6POKe00QO3u8lvRBdVwq9PMHYKEEI4
	gz/Mxjs6O6MsUQSCZVAYPAqB8MeyA51FuTCHnhc7bYlh6CMbgEpx+r4m
X-Gm-Gg: AYBFou3V41dcajXRkeIVwjVXQq1F3XLovDc8b3G6fuVcBZewTySqxt2+Yj3+COt4qj5
	jipAnSLR3Z48oUdvleSpd9+zdLbOMluvT8HfKoHk1GarzeQUqPNsJQi4RHYrXvQ1XpPCpFbm7Ni
	a5FeQMe873xyBmuvz+mVid4JwLeADlhurLjfwA4uynU/Uuf12M76hBARNEua/LPkcXeXwr8En5O
	quZl1Nsy91Z1nX6NBFh4HCMhX7F9F3Si+L8WosrIDtf3RWfbDCTX0BHdzognK1KIpg9cQ2zhz0d
	ugN2C/xd6f6QrPdCw2k77diNFaY0r7+vGfyrOMHrs/my3mXwzbudX7Oj2pGGieiYcuk9kwGRWmZ
	PPnD9SAD8LFwDcn1r6grgpqeOMapMQPNNk/cmlqvuKexXT19gzFF2xK18uGyE+FA4HB9wgGvExR
	sacs/PBQa3aLNLJgSeBdMA0V8RNTG2n9R+s6R9HcMgteRZ7y14dkbQOjJ8j2Lm81dyYXit93Yvv
	w+NWRla0uxUoCFvEnP6b/okvT7IR8bPqnj8EEaZ4j5U+eCMnT+B5p8pGfxFXo7Df/nmnvwYPtgU
	k3yegR3Fa3EnmFPVKQjWHbBRns2aZfXkJ+08XPgMgLwhxXUG
X-Received: by 2002:a17:90b:584c:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae8981e640mr9133105a91.56.1793694745256;
        Tue, 03 Nov 2026 00:32:25 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5d7f82sm3232140a91.5.2026.11.03.00.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:32:25 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] dmaengine: qcom: hidma: fix memory corruption when active list is empty
Date: Tue,  3 Nov 2026 16:32:14 +0800
Message-Id: <20261103083214.1682930-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not check if the list is empty. When mchan->active
is empty it returns a bogus pointer, which causes memory corruption.

Use list_first_entry_or_null() instead.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023073154.744365-1-lixicaicai@gmail.com
v2: rewrite the commit message in simpler words as suggested by Frank
Li; no code change.

 drivers/dma/qcom/hidma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be..925c912e0 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -176,8 +176,9 @@ static void hidma_callback(void *data)
 		queued = true;
 
 		/* calculate the next running descriptor */
-		mchan->running = list_first_entry(&mchan->active,
-						  struct hidma_desc, node);
+		mchan->running = list_first_entry_or_null(&mchan->active,
+							  struct hidma_desc,
+							  node);
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
@@ -238,9 +239,10 @@ static void hidma_issue_pending(struct dma_chan *dmach)
 	}
 
 	if (!mchan->running) {
-		struct hidma_desc *desc = list_first_entry(&mchan->active,
-							   struct hidma_desc,
-							   node);
+		struct hidma_desc *desc;
+
+		desc = list_first_entry_or_null(&mchan->active,
+						struct hidma_desc, node);
 		mchan->running = desc;
 	}
 	spin_unlock_irqrestore(&mchan->lock, flags);
-- 
2.30.2
