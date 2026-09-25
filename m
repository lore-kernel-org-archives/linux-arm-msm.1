Received: from mail-ej2-f39.google.com (mail-ej2-f39.google.com [74.125.228.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D2E61FCE
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294951; cv=pass; b=AibIM36ybXzL9gfrR0ofKqj+s5daazsvP6rVxAjTgu1UyD9lL8P9dsqXmpO7b6SYRH4Im7HNTZjnbNSvMPrMNM7zC9ZbLnIJe923YqIntnGts2LL63qAafS56f5m0B7EO9bsog1osWL8mpcavfLXehW37BuVqr5lBLzq1FyvcVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294951; c=relaxed/simple;
	bh=CECXwz9NVJRqM1zgzja4MxTHWcCU82DN3pcsUZd/76I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HCQ1bB/oT7f22o0RImDhjGccnPumwh6+zxuPE/r5rzcEigvQUtzBstMnX8kci7TUfpZbgNxQsEuo8uR6wYQR9YNM3nGxeYu4kAfMYLTb1tF47PLaropdVMYrA0Wku6wgscivg/Mh4JUGGJFeRpCwMPcmuwzAqtqd8Tzhcza9YTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYP5aIVy; arc=pass smtp.client-ip=74.125.228.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYP5aIVy"
Received: by mail-ej2-f39.google.com with SMTP id a640c23a62f3a-c2940ef15c1so41467666b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 17:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294948; cv=none;
        d=google.com; s=arc-20260327;
        b=ciudAsw4i5rfXc3VOLBnibkQf4IiB6kUMkjci2TvjUzYhoaDYc4EbAbIApQ74rtVbJ
         ybpLf+C/amoUnk9IOBXZ3idSio6bBOTNK5AEQURmLA6HxLL+N4h/pOl+TvnjeBPPMsXX
         ZmeodxS9T3ChNTUTBTrLhCO2ZXVhP388f6+60urrPxCRWAn+uvkfjJXopgFzYRg8lkqa
         3gAc15lVObjO01tvTD3jMhTHtgyNG71ynJ6aM7vdfTi2nGTfVCYNOn1qxq5DH5RQqbdE
         OnrmZXItqbSiYSt1zD9kePDs3rDpdOjU2lvhSX0/DT7C2Qd4l83zehapZK1skpdrba4U
         h8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JvVb1ppKBUi1pgXwEpUrjpuTGibjVjV3ESWoiV2gIGo=;
        fh=eH03YnGn6xdxrQYesOy3c8zCRsov2YeAmsfqZqbGUDY=;
        b=o7u8JVpAMtRzT9b2OdsuLr2wjrsbb7octI5bMlOxhiw5hRDL5LYVINJjMSvHhV9XO+
         oUQDFNu28DuY2+dSBl1kQKJELvTA/ICQqWT9OvlxsBVd6TVPidN1vXMc0oERKSkh9Gy3
         ibS3FXnohMKa/xm2GlPpwrWsKfIknGPJV91Az773pK6qevAJToMr4psso+Vq/KaN6iHd
         P49hN7mRlekaKnpMKzWXmRIfybsKHmcKpWGeS0jSdsDNTKDs0FLbWoGvYANaKNGgbWdv
         OaX6GFaO/+9gv5cX0CWXuTTV0JM8DRgsQOKgLbgL1L6QgNnc6YrrdudvOx8+k7IaiCyx
         bfxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294948; x=1790899748; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JvVb1ppKBUi1pgXwEpUrjpuTGibjVjV3ESWoiV2gIGo=;
        b=iYP5aIVyIeeS1wxy0RrhItS7i7zqc16eXkOgnFkJjoUNC/uyPZ+Yz1nI5FISpHqyET
         DZ7gGonG9YtPmxlKQVGoSykkEKghqLCJPEHZKCv3ZCaDsg/ceH+LGcY8mmiu1Q3YZxep
         MVCbh9Y1umWemrFjuN9suStgzII0kccsWFi9MZjuP+i4WlFlDeSwQhZfkGSoVtaTf9bs
         4WLlS13TQXIIseuxOHINovaI/4h1aZzpMCzhMtmFB1Aumna8Y/YHeUvRYzu5iqD3RJUS
         74bdH2QMbdZPuDJ9AmHfTcuqnw1rUlKOV9AqATiWV1W6hLbHpZGU23SMkz/v7bY0aHaD
         puWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294948; x=1790899748;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JvVb1ppKBUi1pgXwEpUrjpuTGibjVjV3ESWoiV2gIGo=;
        b=GTn5Mv8tqVnTZ9M3EmFbTm7EmB2LTxde3jUc61gKgNTBAyjpxZ0XsClHWVuB/2DxvX
         4sRhSNiwdk0wAkHUgh853FThC1jsBSlWR9dcJ32DNm5x1qX64Nm4s6J7yNp7+F5ZmHGL
         BPPWlHmCckEmoNntXyz/lWp+2xRiBQZeWxiOcipdvDjdrI7r1BVVMAGerBbskdCyMf/p
         FxzkydSxhfC5J7xG1ORahhYAveO+dIWnvUBoQrkKSpb9kD/6hnqFoR0+XIZeP9RqI3jr
         8o8IEOZFokO/tCMcz3HHC4DaoMTIz/lXZEmv+ifFFGkZoHvk377Y4/18cN6YUpnxu2Yf
         fJrQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1IF9qTmqsSKoDLeZLSwWt3W6U7LfmIAAYnqvKKal2ph6Yb7p/CARbDW7vuhRyRSao0kdesUL87BvM1Vut@vger.kernel.org
X-Gm-Message-State: AFuF++k/5LA2s4jOKwf5y5fqr5tYQYA/3r4+/YPxbBuXQhytNDpRUbZm
	XdfrYFBF1Qcuq5CjLMbNKmyipuYH8YAhugwEj/T7cbNU/if6pRQdVA3fyvCS+gmn5tXNkkEEENt
	6BH80ujSrYpTc7cFzwDzHHqiCrCUFiXhi
X-Gm-Gg: AYBFou2i/h6xauzTZpaMxrQqqj5PhOqwyC2aaGD1xskU7m1DHsk9MCPgDl6Pnn7V+sa
	JuuIUAIl9mjGQBxq+lE+R3WaCoYrJHDt48TXx4MzdLGuGtyd1X4Oqw4P+wESiYPcZTa6NQ20zL7
	WSxETbijYpoCHqxLTx8kMmX8KNviiDFa/A2jc5IqoB6a2P/RzX0BcpAIkqTND7D8CdV1nKKvvrw
	uYwfx9A72jE6jhKTAzzx21gR4OJUHi6e9+IW0kKc8ZijsFzUWFHA6MXBfjNqqyL0fbOrSY6nntv
	xZYzllqZ+ZHjMpiobb3SCySK2kvh/KIFSe22ohlf5pC6+HHYx2uuJG+L+rLAwTq+M6M2Az5Xf3f
	nXAX3wBee7fUWjzJYMD0fgV/6ruqya+j59GhyoWWKjtegHcUTaXANFtq2wXQIz90+
X-Received: by 2002:a17:907:97c3:b0:c25:9102:ed with SMTP id
 a640c23a62f3a-c2ac2311b07mr339426566b.5.1790294947745; Thu, 24 Sep 2026
 17:09:07 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:06 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Fri, 25 Sep 2026 00:09:06 +0000
X-Gm-Features: AclHuK_ad8LwT8kuVDl63QDbO1AN6EHbYByYWzU8WNbNKdgNeemyDEcExbIrb2Q
Message-ID: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
Subject: [PATCH 0/2] media: venus: fix HFI teardown races
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhun512@gmail.com
Content-Type: text/plain; charset="UTF-8"

As part of our ongoing static-analysis research, we reviewed the Venus
teardown path and confirmed the race reported by Sashiko.

This series fixes two HFI lifetime races during teardown. The first patch
waits for the hard and threaded IRQ handlers before releasing HFI state.
The second disables and drains recovery work so it cannot be requeued
while HFI state is being torn down.

The later Sashiko report also identifies a separate resource leak when IRQ
registration fails during probe. That issue is outside this series.

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.53.0
