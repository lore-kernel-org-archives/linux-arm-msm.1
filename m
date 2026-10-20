Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520352;
	b=kVu2fJL+mg0MHwC8ch+TkhHu5T0pbR1rsFu6UCKLdjqgqgxP5/ZeaJyIxbudCuxdvZQ3
	 hMqwHSq9g68gMjCUwd+NheHR/A2AxLy8Qvau+Fdk+FRRI8n2mqWTg1ULHJsUuLNT7DfxJ
	 QqpzankDExLj/4CnmskHlv/+vLxkQSMQ7E6oMKHUtCNcvibxnhGB8fXw+59Ga7aDaDDG8
	 7xxLe88kEwqTgXY1DHlgV9235/4g8ucMIbaGDZdKNFOjmL3kcd4eB0iLYMYe2P9yh45d+
	 STeR1wYtCFQD/ZEn/KOp00Z9abEZ77PdbpIOwS2Z/25Yn5lPea1BmqAIk5EUpZ/eJDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=OCCi79U62TfjoHNQ5t2HSmD5JiYlUlHZEpd26/8l3k0=;
	b=kVQ2J9ZqFqnrZVjppZE1c+MYYlZmvmNuaMkcpi/WXi05A6Kz96gF15190zQHYUZdVyHf
	 sO4BABkOeP8fV1XHOarE3ZatIy/bi4HU3auw05lUIsQcDp9g8XOjGfHMPCs8CfsusfFjz
	 FWSV3cZJ7ooIWgoxh+bGaC4KWch2dXUIR8K91MkDWv49Ty0GpB7xpGsvIXMAr7saPgIed
	 zLm3RGcLGxkpvxuOzJcT9rIgn+zKeja9ZGxXazN1/e7kyXb4S3uTC3qkfG8sr+rP1lnbr
	 Kyv4aW3rgbwYC6FP6dJrljupl1jNZM/I0fz0vtRmkYHxACp5P00p2YWUPRp6TWzdmaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bBHb6tVs;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6B60A260C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 18:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE6B60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bBHb6tVs
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1de9dac94so24208365e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520350; x=1793125150; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCCi79U62TfjoHNQ5t2HSmD5JiYlUlHZEpd26/8l3k0=;
        b=bBHb6tVsiTYjAP6Ij5YjPDj3I4ruTc9GK8tSeCPSpdo7nWUVzqR4z+8l/37jfWlQ53
         FgLO7X5rua130E9MfcR32Sv6P3DicMlApPBL0HdBZtfFctiojChV6K0+PF8R0QAho2gt
         NpDB8L134NmHXpMtlUNkYMwmlIVbnPeQwI51QqKCvOKwxZeBOJV/LwFC0yV2CFXfBJAM
         uWz/umTrIADSM87328fzihtMCtEGma7g0v3aCR6rhKCYqsVdu8e5rUn9ttPlGX+kEPXu
         0oh7MPqpvRIq19cytldPJGZ6lGWecN7wbg0/cDgCM/hsB0bV9dQIqg4xe7trZvXy41I1
         q+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520350; x=1793125150;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCCi79U62TfjoHNQ5t2HSmD5JiYlUlHZEpd26/8l3k0=;
        b=pMkxpYoxhXunQOrI6uDymObxQecSA8SES0OnBQn30gmThJQJE2ppyJg1NdlZ2gUnxK
         2uDCaCtMPR9yLwyUIBMEa6oUXyM/2kVBsFwfUqSZr46DDL+V9n9Jti5XAzVHBQwi/XmG
         Sb5DjooCJsI0ThRaZKzd+SGmQ+Lq4ynByfP1Rim9kW3a52sc3QtAnqOtjqcxp4vNuahS
         5kXWaXOsHpeEefNs4GZPNkwgUdERaDNs6SiHqEfYismgX4SPOxoos9M9CFKHQLcmXqkq
         yqcSg2t6G4BjCh+5KlkaHeGwho4F0xM1Hf0PB5147i6/44HE4UEN0Nsd384LxAxBsARM
         sw3w==
X-Gm-Message-State: AFq9FYKj81djnFW8iLt8CM11xwnOuPwhaYAxDuDritwqaqZtLSmWWO3x
	92jHJU02YOsa/ZaxOjj8xiTz3YW7f8Jz372WTgjRd/ZNxGr280s2QizayICPGQiuzwI38ne8gZq
	I8iHz/ie6JBO59g==
X-Received: from wrzq5.prod.google.com ([2002:a05:6000:1365:b0:48d:ed96:9428])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr249704165e9.0.1792520348399;
 Tue, 20 Oct 2026 11:19:08 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:08:01 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020180804.140766-1-smostafa@google.com>
Subject: [PATCH 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform
to assing the QCE/BAM to VMs.

During unbind:
echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/unbind
echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind

I see a system reset quite often, looking more into this,
that seems to be related to runtime PM, with those fixes I don't
see that anymore.

This patches apply on linux-next.

Mostafa Saleh (2):
  dmaengine: qcom: bam_dma: Take a PM ref at remove()
  dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()

 drivers/dma/qcom/bam_dma.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog

