Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411944;
	b=dnFvhN8m7ikd5e8U4wyF+vkqdU9t//F0ybrZsl0jjhGdOzLqIFOU9VvHi2IyDdIWCv11
	 ENcx6kmdze+vxMPFOeNDSAqm0LNsvBE55ub024sn0+vTjTeEOJ4wImLoCSUWhxG0WE6PB
	 3Iqms6YI8L0lGZ8fNoJPmgyeQrLuXUgUcBaywnLgiP6ZtcpESE1oaI3xVIZGuZtD/bSvG
	 WrOQpEXtUC358K4fnZQO4GWXOSNLXD+y9b+a+ZlGTzmgjC4AUVFQRW82KS9YMct7xHSdC
	 gTdqVuxRYwD7wYACZ6G0KzmS6nTDG8HDgoNKF0Xl3B2PcjUuwMYlrqnXS5HUEsWgFSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N7jG8qlIvYKjoXn3tNaYxmGrygzFqcyCAqa2HwUrUVk=;
	b=vk4tpKKJysHJBLQ8rOTMPp3w9MITE8Sr+9LjeXfa7eCbYJ61cJKGd9iKNR91UkIPvf/8
	 CNhDeBz4aCAgkJa2QerQzxB6GDE030xvId6uuTaj2blpXNYeRTzglwOfpUmENq092pcA0
	 BJmV1Zf/vXLrpPDqypfq+7+ZqxEfZ+F1u1JHLCR0RVoSwYG5MOEd4RjQCuT6GX1FKc+7V
	 +kzdHkmSe/8ykQSKdDn4b65fJic2w1nWVXvIOKlRSl2BQEeWIQbEPvz0L5gZ3Kn7D8gDS
	 tOmKwjlm6RZBXI80itJeC5jsdg6wwiuteJzQvJPgLJ6Y5t/xA4hgSMdNZUjUPm3SbyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qJAZQ6mW;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34974606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34974606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qJAZQ6mW
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b300713befso28562087b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794411943; x=1795016743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7jG8qlIvYKjoXn3tNaYxmGrygzFqcyCAqa2HwUrUVk=;
        b=qJAZQ6mWSMFxoquRvMNoXNgt5hiox5BzuH7nygG4x5JYQWfHdgztateXr9JCOrjHxv
         NnjCaLmomq2hI0EWo034lmajYWUKCLvVo+g6hs8SkWMMfaBpbIYsURUiwaCl36zBpRch
         qdeJWPwVzAtG7YnxbMdkX4ZCLoGoSPtf4aGoMCPCWAFZKhcMUKCvEVha8XMiBkK8JBYY
         Mp11glU31Sn78rdLPi20mOiHVrCb7K64DBlkVZFSHNpFH5m+VCxl3vhRQCBJUCd0O/ZZ
         2x7y51B+T/EXNAqWptrxq19EXJ94T7VNcmdMUhhT66V/cHZa2q2sZNOJlT/qYZ90M5gn
         xFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411943; x=1795016743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7jG8qlIvYKjoXn3tNaYxmGrygzFqcyCAqa2HwUrUVk=;
        b=hnkfqdP1J5YhuTc9JObDnZ6STdwCwEpAqPs29QS6w+o+EbgyXH0LyxNqbymlm36C3Y
         l6aMuILI5LRiFdPgSryJzlhuAS6Y3q0C97KOE4s8ptKPkp4XkrD8c8nNUs55IT47HfHT
         QlAQsTsSZankmywfeSCNTpNK3Am7afGHGEfwYDJ3wqNWVqzrn5IyRJoS5y/pulfnT4Bj
         j0YQDWwvFQQY1+Nmt1qCgR7EBIHKyU2v9AUYIWd03fueLJMJPHkCsHIAX3j0Dh/vLHVn
         SsNb1PVza19sS4w5zUOSqq941vo97LkMr+4ZcFRQwAD3sfCVKytt3+UKuGA/xHf5Dfkg
         rHhA==
X-Forwarded-Encrypted: i=1; AL+hErHeydnCtkBN+wwwuhD12U8q25H8zPfKbtl4bxT2r+EZ0v7CsglzUVz71woqZtDdzkSPIDm+hxc1P9WOYW2m@vger.kernel.org
X-Gm-Message-State: APuU4Z/rGwTR6dHZd+yWIpmY1EkuladrpK6BrMBOwcfNxJ9nkKkDhR8x
	9kbD3q9rAfFNz9IClUBk3B2pc0ci/I4x3TD8R30C5AORfEzlfmh73wXYZ0V0hAFY56lk26citZZ
	yM5vfmm8=
X-Gm-Gg: AYBFou063h4PbkQziS/LUMxQdKf1YVSH+/PYatZosRwchONveNoSXSW2k02NTLeXp75
	5Jhv0hkk+LWc/zfL6DlDT3WR6t9FFvjhPecZPnzmrmTROmzAzsKudPQp3380sdDATKqJUqM5XHT
	ZPof0s0YMQUzYC/UCxurUsg/CCXfS0oVxAPteXRcpveyYrl9w91fhrmtxoWnVl8efjWIL1Jus3O
	pkpCvJ9vWJulYpJbdRFjINHlbpYFzuY4XrBiA5SpMywpbHxIogMV3mS/5fSsYOTrVgvXUptaPvZ
	CGVGUh1otsJupKK9HvhialtI64H5wkiGHnJdQidwAsuSAeC6r1DEpBYrabDVEXqYDOp7uvGvwWB
	X2aOevSTy7AjJDaN82j1mq67QRSP84wiKX7BRlqj+O8V+Ubd0pdiO5oUQuDw6TAG83zG4gpBXss
	P0Rs3jjx7tm05tvwdj+g3Ct8LluouowW8jg8MlPXN+Vkpmx5G+zgOPvWOYEsp9ju4ohfh519UZq
	bdPOY4u6JapglCubvPlgOQSqbCLCNk3lkQZx964D4TOrlYRnhQz0ICV66ihqw5gIHiWCMxwj/i8
	z10AT7mrD3qwkHrzwVBm216HeDqLqAnBNYsSZUZIru27G8WhkenLt2kVux9PwH048oNrg1/pz49
	Vk6A=
X-Received: by 2002:a05:690e:790:b0:67b:f621:8d4c with SMTP id 956f58d0204a3-67c67f038dcmr1488696d50.25.1794411942980;
        Wed, 11 Nov 2026 07:45:42 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.24])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c6e207adcsm1433127d50.15.2026.11.11.07.45.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 07:45:42 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: qcom: camss: vfe-4-1: program the RDI write master buffer size
Date: Wed, 11 Nov 2026 12:45:36 -0300
Message-Id: <20261111154536.24163-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br> <20261111135338.27008-3-allan@fatecpompeia.edu.br> <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
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

On 11/11/2026 14:35, Bryan O'Donoghue wrote:
> I would appreciate a more direct and succinct problem description.

How about:

  media: qcom: camss: vfe-4-1: program RDI write buffer size

  MSM8226 has no CAMSS IOMMU. Program WR_BUFFER_CFG from the active
  format and clear WR_IMAGE_SIZE to prevent RDI buffer overruns.

Can you take it with this changelog when applying, or do you want a v4?
