Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750596;
	b=rNcGuVdUgWKjwEsc5nyoqIrdqpnzLcuAljH67NNDBqrWdgP/vTLmiM0x+dAShi87GFs+
	 gDAlZUmKwK+R6UXxHY07daXmNJ0QP3qB7sibQJDvw2OIUe9cgOV2W4cANoT+nHe5/x0un
	 TNVxh4v8801V5if7F6njg6pStVomjt5a+rCRyWdM0yUwIQQwmbhIXwKCuSadFhmgQiU0t
	 P1Z992PEftl264Ytjn5EN7Xe5JtJ818dXesgO3wqBJFHb1Ml22XXX4TnvWwY1pTcFAxpW
	 ouAgpNMlEicIgzlKwSEIA50wehRy/MB5zuAlvuT2w+qws9iL72Xf/sU+IYmM9dtfTNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=IMobJmbhH1aWl0A3qqegt8ms7R2Y7oe1+fBk/D40vUc=;
	b=vwzUx+pHzjDoM6d++0g21bLXnRKT2IUe6RcbDLyCn8PiLpDSHhM9m48RcUkvtUTYdpq1
	 rFY/k1miSIa5XeKQKjg7sXBIL1ZEkyKu71VwcC+MfEMdTM2b+rT5nWQym2qF3JUya1i3v
	 9pgrm3zDyoDb/U5YxDV1tCr7gNBemu3ADz/gf6ciFr63vzfvgRHTXmGsdmqaStE3bsq9a
	 CnCzlinDF8iG1vX0b065oenpmaLWXtwRwGc7vt4k0qYsxsq/ROOBfQiDNtliEsqEHo0Iq
	 rXPxHqhCuYL06fxbQhqwWxDHC9nQFyilJIZluxzuA0ljR7AEiqX9rRWnpRhfLiFU7Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jh7CN3Bk;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94949606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94949606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jh7CN3Bk
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso8286375e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792750594; x=1793355394; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMobJmbhH1aWl0A3qqegt8ms7R2Y7oe1+fBk/D40vUc=;
        b=jh7CN3BkAAtOpkqLz1LO1Naz1RHvXEQYg8p34aWKEtKHt4q40/lpwzFaNhj/H3izKh
         Wa9pBhurUh4H0bunQnyYBAHwCvs9pCoFefQprPlWa7FE81jVGuEpcrRjaqbZTnXlOwvX
         qaEtYq1z0xHLITuExUkdcupfR/AnIPDb2M8lqwsIOIvJPQF5DjQ79IX15NnLP1PSgrxl
         5cEyBXiwrD+n8E6PNP8RSz1V03bB0jgfSZUqqmG8zS3xwrlDQzjumecOH/FXFZPZMcsw
         7nFh2OHKhwDEsEeM6jklL+EGCM6dN1Gug4l2wLXCUDqBSpYs+pU5gy6SkMczonsqUuf7
         hqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750594; x=1793355394;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMobJmbhH1aWl0A3qqegt8ms7R2Y7oe1+fBk/D40vUc=;
        b=1P2oaRTZ058YE7yNNqTlyIVG+Ke1zrQWAwG/vfKqHfmGgv7pAdezChFBGmhMtNvUbJ
         g2PlH+xxLOP3iLZypCPYF99kljy3UHMI9AK6HJ819G7aESgqjX5eClfDa3gS5UCOrAQ1
         nRb3p9SxXpGPrPd/D9X1tyFiSn/Wm/zhyDixwPj2wUiA9FfavH6RYGd4PBUOfcCiQP/G
         WPdFV8Vq2DnZkxDD2i0GICe4UCTbrMtnVGsbKZ3m28Eirq28J2rdfcHkmkEkX5K4INL5
         P3R64P0EDqQpZE3r9M0JOEuCgzKnxMhgbXrjGfgANNxS9J6gqQJaeah+lD0J5IPHDU4S
         x16w==
X-Gm-Message-State: AFq9FYK/Apo4R9wMB7tc1DeFoB+rKwGqHGlSEIPZBkif52euVGCXVAzk
	w2DeCKQog50pugfqUFsV3mPMyv0MSfLfcpyn4FptuWLksiEIjKJ4FV1VFGXZ+zsHWAShuuopP9e
	RiIpbYS/X1h0mGw==
X-Received: from wmdd2.prod.google.com ([2002:a05:600c:a202:b0:4a2:a3d:fdbe])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b23:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4a211edd264mr29780255e9.20.1792750593923;
 Fri, 23 Oct 2026 03:16:33 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:15:34 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261023101536.3965344-1-smostafa@google.com>
Subject: [PATCH v2 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform
to assign the QCE/BAM to VMs.

During unbind:
echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/unbind
echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind

I see a system reset quite often, looking more into this,
that seems to be related to runtime PM, with those fixes I don't
see that anymore.

This patches apply on linux-next.

Changes in v2:
v1: https://lore.kernel.org/all/20261020180804.140766-1-smostafa@google.com/
- Collect Frank Rb
- Drop call to pm_runtime_dont_use_autosuspend()

Mostafa Saleh (2):
  dmaengine: qcom: bam_dma: Take a PM ref at remove()
  dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()

 drivers/dma/qcom/bam_dma.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.56.0.307.g5fe7bd680c-goog

