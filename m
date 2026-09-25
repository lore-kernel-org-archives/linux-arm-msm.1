Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3AE1A6807
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294975; cv=pass; b=VMUo+W7yhf7PW2AVcLkM4+rCu63mByokKep+fcFGtkVUeVsH8HxD0Yrct/l2487tY2srTe3vhP9vn/JDGRkJt86IP7B96lZ8genRB4OP5ourbi4CJXp73yfS6YYT7WNe7kLAThKTdTcz05OpvZsfOfMO/A36xc44r/VTnZy5/tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294975; c=relaxed/simple;
	bh=iPGTdM+eHv5ZH8W6go2pTrN14Dr3emCgNgRX+uNwDgI=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7Z99lZDEhQF1EwGSBavkwg9Cj69Q5Ej2q1mLxztff/zSAFxUxwbG/rslEIvgm/s5F9bnqOsxtOLGRMhtwJOd704ypXus+Tog0lNkzKh68wRxYC/H9CRpV0+CvHeqP8x3EOo+UPs4IfBdQSLtdNW5aB9QOSENnfplw/G0vt6m9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6qH+mWx; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6qH+mWx"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so46871366b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 17:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294972; cv=none;
        d=google.com; s=arc-20260327;
        b=JVBuHqot/WEPZy8rLqY1MIX2i4wDPXA0arNNjTMiZGFwSix/K2QNomGacm10Xy12ES
         Nz7nuCIwg2gkwmdEOulffHcAlk5YdJfJm9dUpDujdXbgzjhlrrLhRe9eS2VEyLWQMvs8
         XIReF06l9eGNVVpLxHHqd6kChOdXiK9tlRrQfJte8XqmCkYaChrIU6gTAUw6uC7ARI/E
         6UrIvO6bqQ3EKN2iVXr9atutKueawi05lgoT9l+cfUWE9o1uFUEYbOUEubSNA9MmKxea
         haWPZP9p17OUBCyl2fqtGnDz4hdJvkD0U8XLHpZEwecJJlnmCB+w9mYkzucYFIavqEC+
         9QRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=O4dAZO8mqeKSgi5fN23me6gyxeqZrfrP7G0J/UeuOtU=;
        fh=KUXDyK/X9MKt2wJxhFZlX977+DnCY8RYH0tLusrbh54=;
        b=S0y4gsaTQzgOAWQSEEv8dMQBnl3w2T8hv4tVHxZyye8TAqh24mQJm+Ywn00am+scA7
         W/oB8dwnRPMTT/mx8PN3qCLJ7FvuU7cuN53AOmzTFcE3bPdzmYZ+oc3w8k2/XrQV6ZOX
         hrCzN1QK3Mp4U4lrmh32mIS60/Z4mYepkzL7QRl/9hYtmJNowHuLtqTnoWnQjv/JTB6c
         PFP1vgdNwc5y+xK+yBEDAfkc4azz0+Fu3RmqS2hKIEkvpuqGmHIsf9Gu5gh/vPZD1lg7
         aZ/OC8OU+7Scw3dTXvtVE0kbLTHTsOrMXQUA+/rM6wsNSplKdemS627F+OvTB/l7hnNu
         Gopg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294972; x=1790899772; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4dAZO8mqeKSgi5fN23me6gyxeqZrfrP7G0J/UeuOtU=;
        b=Q6qH+mWxZJaJvAv1KW0FTxI9BCsH5OsOQ96JvEmAoR3w3vc8IQxSumZclnWkA1RP+7
         AJDXlon9ahImHv8ruO7cvK86d9m4/Ox/zZgTCcgGzmORa5Ct00FHS2Bwy6wcaw6EXlv9
         c40Ycn+5OxI67+YX/58BlFWv6DXGGvh3R+hgUZRCcMrrxrvIbU6xSEMUBU+qggGc403u
         AsThGV1i5PGJkbkKycKHmB3W7emoLC3A4GapCLJrgWYV7SlenxvbWdbcmGFXROBFh3Kr
         0M3DTw8YmCLW8syU1+OfZ7RbZDR6zs+izNzmoEl6HgwHFz2fOnw617c/CvxtpghuL6YM
         zYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294972; x=1790899772;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O4dAZO8mqeKSgi5fN23me6gyxeqZrfrP7G0J/UeuOtU=;
        b=qGCgYrBui+BiEr01Oq8nsulKwj9lM5FcsDpGoFNS3GvBY/pugrQcyAUs3c0Xzwkyos
         uLSXp44xkCjoW+2Juh+OWZ/BFyZG66T2KncNQ0TbwV562XJls9DQpbNJL3FRox/f1UWz
         gywuUMe6xta0SAmC2k0F5q014J8wDPxZjnS0IYNAEY7zRuezTv35IM9jNc36wUbfYOuT
         3DiKzuo460onelNQ04zRlN1yptp314DblK3T7ht7y3Pb1bltHFQW41ZpJub2rQ1ntfVQ
         UG5CrnB2DAoexoIJid3Mz3/RzR+OYbov8EeMR5+esQyaW4SW978zBzKoMyiCzfyNYVYy
         feRw==
X-Forwarded-Encrypted: i=1; AKwUvBzms9cqw1kVQyeK7AkCSGrK3KcudMjT9CVgRfLKWGRM9ELY2gRcm3KgWdjkqNFUrwbyxjSPFHPneEO2XLED@vger.kernel.org
X-Gm-Message-State: AFuF++lI/D8OAWqO6OhN9pQLeVa6y7Jv9LwDf4EyJC/kmfCvw1pYW6Lo
	UQ3WMuu5eUCiJQZZNhSSTL3Y2si+EWM/xNjmRwijS3/IxOgt+m9FoEi8EpUwl7adb/4NRGIf5dJ
	PdVI1P+Q8mJFz4vi9Iso2EKJ7XeoLAw==
X-Gm-Gg: AYBFou0Y10xLm4XVUAh7Nf4NWu09nZ7aM9c75VlFmrElobqdDD4FGwqA3JwP75EWpl7
	5FY3riYSgo6JrnPM6IhgijfTFvvp3HrPjSM1YbBFTuyJsEToIUsC5WXIEDHH39NlBuoRyW0ceFj
	zH0jn+5aCxyut2osJ14GeWcHTynJlrlyeKYyt9sMG//o6by8dISV8V5NtZLcJFPAJxTq18kf2+J
	qqUZ6KFP9Sy8SpPJ7wrh4wrLLVS4R13wqEYjJw9W/l/5mw3yiGN3hCteCW5U1SDvbUnHJgtw+K4
	5/lphbQ0ciroNJxNj/JzGVjBlZ6x5FLtgOQwJD0l3b52sHDqX6YhqBAwpmyUWDhiGS6BdsJ66cw
	eyX0AuEHAa6GM6Zdl+FyPYoxwUc4EP82BPtZwoPucGoSHbeQNS4TT2fg6gn3ee5y5
X-Received: by 2002:a17:906:dc90:b0:c2a:85:5c01 with SMTP id
 a640c23a62f3a-c2ac22cabd1mr365869266b.41.1790294971950; Thu, 24 Sep 2026
 17:09:31 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:31 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
References: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
Date: Fri, 25 Sep 2026 00:09:31 +0000
X-Gm-Features: AclHuK8Qhl5-EGC4HUcDq0yD-vI60rrYH2FFCNerdpeXKUT00izorJWy0kVNFrQ
Message-ID: <CAGEsz8ENFnYSCS3w7zLnkVbG4FEVG04WoptROY21mn+PnnJ7NQ@mail.gmail.com>
Subject: [PATCH 2/2] media: venus: disable recovery work before HFI teardown
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhun512@gmail.com, sashiko-bot@kernel.org, stable@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

venus_remove() cancels core->work before the IRQ is disabled. An IRQ
thread can queue the work again after cancellation. The work can then
access HFI state after venus_hfi_destroy() frees it. The work also
requeues itself when recovery fails, so cancelling an already running
instance alone does not close the race.

Disable and drain the work at the start of remove, before other resources
are dismantled. Do the same in venus_hfi_destroy() for paths that bypass
remove, including probe unwind. Disabling the work prevents both IRQ
handlers and the work itself from requeuing it. Drain the work before
disabling the IRQ so an active recovery can finish any IRQ based
completion waits. Then synchronize the IRQ before freeing HFI state.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and
helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c
b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..94d4b8688ac2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -538,7 +538,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;

-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c
b/drivers/media/platform/qcom/venus/hfi_venus.c
index e7e4e78a186a..20b8ba1e62f1 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);

+	disable_delayed_work_sync(&core->work);
 	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
-- 
2.53.0


On Fri, 25 Sep 2026 00:09:06 +0000, mhun512@gmail.com wrote:
> As part of our ongoing static-analysis research, we reviewed the Venus
> teardown path and confirmed the race reported by Sashiko.
>
> This series fixes two HFI lifetime races during teardown. The first patch
> waits for the hard and threaded IRQ handlers before releasing HFI state.
> The second disables and drains recovery work so it cannot be requeued
> while HFI state is being torn down.
>
> The later Sashiko report also identifies a separate resource leak when IRQ
> registration fails during probe. That issue is outside this series.
>
> Myeonghun Pak (2):
>   media: venus: hfi: disable IRQ before freeing HFI device
>   media: venus: disable recovery work before HFI teardown
>
>  drivers/media/platform/qcom/venus/core.c      | 2 +-
>  drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> --
> 2.53.0
