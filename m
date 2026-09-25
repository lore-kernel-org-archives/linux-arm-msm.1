Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662A84E430C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 18:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361747; cv=pass; b=szK6LI6yuqdkB1J/XBPwA8xk6l1WTPJgp8Gu0bsdhAv/TDdP4DJK2T6Ks0nMqaSVwdmJ/B+1CUyrYcmsnMjU4iS1hDSZLOd8Ua769Wz3MqXCPeJDR4b3ArWRseTCfioL5pLsMlfZUIWKUkDeM8S4SlWyl8Qv9hNDjJE/2L2PHX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361747; c=relaxed/simple;
	bh=hrTFA0SFmbn2rhmMV3Ste6+KH/y0c6VQdoL8hcnAOM4=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrGFGqDEekrvTcvw6ql1ORWDUhwFiTBBjoDxKG/2X1/JkYGMMMysix40d6Xaxind4wlAmuwYMbYXT+tdxfThtGTjpY4vPOGIFVoJRDY0jKyQ0IlCkOXcQcpMtt980ZGJxrETfvg/QLFhGok/7t1JcxO8RLOrxAIIs1See1Lifp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pO7e4zZo; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pO7e4zZo"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c254fa663bfso197501966b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 11:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361744; cv=none;
        d=google.com; s=arc-20260327;
        b=DrUWHgaZFokV45ch8Cdw99WsLSC9jgne5vTPqVPjVKTDPAhXl1F1V/Q5nhBKVYZzz6
         xtx/bwyr7sRB2+eqNVgetzZWlBCbl7DY42M6Nv0TQcoeMVw0XoCor1JsEQJxT8Rdvmns
         0s59YP4ahNCPd4xbq+Tq0MUMWzShTMkoup/m0poSZa2kxTo6yjmvRqASLNkdbpUVYd6S
         wgkNd5o4tz8DSgc5AfcwNa3/xoK/uYNyir9NPEEv6nvPOyEWShsLRXyj03oFGiKCjo2p
         Ez9GHqaTDudcAghuCM+fCy5u8wAxp4qYub9uH2i2yjLu4AZRLhnedaXARBvr0mHTvc0R
         bvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=zYr/lFJO//fpk4Ze4BmIq34iQIgTlgcqYAY84Z7aXAg=;
        fh=7zFiBvBpPoTVHnS1s6+YiKvm5nrVv20p2bWtZq8qIz4=;
        b=aoPXYZzrvn1zn7qU4SoZDvKe4hvOZZXj5nMsKbwwyYcJsth1UQCnDrYsifm+yagXIE
         Fu7q0jo/UnZJITCcOTbQ8STW6GBdu+hkQUE1yJHQbCJSiUoCQUMJN03BVWJ5K0SGLhVS
         D4F3f79imxS05AUnLWzWXLANGxfUQbu2BIn4valfKoNxBuoMr3fC30HoBOVy07lL2cVd
         CujVWaJJd1XXMBGLECK1PTiWK69ouBlMCOgq12QIycl4urKqGR0RaOHVJkJcSysQZkhZ
         p3TZAzQifr9+FDaq5Wlj6qUD6ZiG2izjeWycRN8IP5kc027nbs5FvBgoHREFhMaA9WF+
         bs2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361744; x=1790966544; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYr/lFJO//fpk4Ze4BmIq34iQIgTlgcqYAY84Z7aXAg=;
        b=pO7e4zZo1519ppE5GIz7ojI4kdnqQwVuj82ZTdM+2vrqECGG/E25Ld3Q4tW12Rdc/R
         Tz+E04YrbkoLZfXVrcMqzOcrmlvaEUKygB/asD9o9Zijn7sW6Jopn+e8Hd3Cy20zvofT
         cM8gwG3i7nDA33Bn1keVRr+fvfbTzuKPRFa3HLFkOc0t8ZBnk8Yu0CaNcn5zBfNVuDZY
         /K7AyIjWEzQGdiIYN9AI6hRqHVOgmpHuFE5De2aXFiVg+DnPMqt0HGAQyZ/WoXOYyRKz
         bfDF0RFeo61dPkkZi8inB/Gqcbm/JJCj7OAEPvv65ETHGjcltWdAhErbSaUEsrRSYffQ
         9ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361744; x=1790966544;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYr/lFJO//fpk4Ze4BmIq34iQIgTlgcqYAY84Z7aXAg=;
        b=nHD/xjr/v0o83+DLwV5UFKadSWYl79M6VLaBmdc+VZGG9hxSeZR+0gELcfg7Aq6jSG
         pZl8LJP/10hx/jAJL8aCekf2RFVeuoPrlNLvTFGPt73V6UW3dW4AD7tgEoZK3Yk0ptAk
         hlhllMqYrrQj7u+H5MvmMlW2O8/zANJmTjMUo93+FNq3UYeI2Dh48ZOwC+LPw01toFKV
         CxngHki0ZCywCllS53ggZ0CA/4tzib0gbdg+dhGXLYjo7fOSjNET09WmaBw0HEpJlm5F
         vvmDwP2dAfnhJigysa5gykzgM4vkNY3JfXd2UX4Y5+vI+w3UXwqBx7CooWhwN4q45png
         Ze4g==
X-Forwarded-Encrypted: i=1; AKwUvBzuwjiZqirAOp7EQjmF64SWVineJDK9BBeZaoxlOZHGpb8ZKXUIXi0JNmbrYl61w76Oy4ENzvB2wGaKLPFT@vger.kernel.org
X-Gm-Message-State: AFuF++kS0T0ikkDyxWQ379V3sSNPkQVzbrG3qnEd5+p1SUso7wROgO7M
	v8o7O3wZIK0nbbLOOLZCAf16FjBldWOqbdo1WJTdIrl+mprwHKggfTtFOgBJ77RozfbEhiqUUJm
	Pd1UQysWg9V5ZubXD8+pjUe7er0CSTQ==
X-Gm-Gg: AYBFou231hzXp0g2yGHbbxYe9ms+Cs5bR4oRjHcEW5ouKlh9dzyNhAlBEAzeGsoVc/I
	u2vLZh7khDtbRBY2vDGHKJVn3Y1sIPQQ03xj/AmGRwCJKGrrSuL9n4OOUz7LMj+ES/Gq4yGfwe5
	XY5T4f/ffXrMg7XUPXqgBdZRy9q4iUXdQlqlQ+oLOB9zhocXP9wFy0BnQ9Qouu/4iwf7ugUorsD
	nYF7sMx/pgZd81CTZG3JEIUqvO6SREcYmOeZN61yRUV2lZEVhi0OYQ+hnn0JuI9epBPQO3BgeE6
	cQRBxr+NAXfqin4jGrWym1Hg+tX+y+pbRx6t/UBAdxizZOiMr3dMndBqlVWOcA2UZbutttVe7rv
	JIgpfQ4DtDWmYEO1t1fzv8aAc8XmVu+gg2svjyHMtRhNYWahcnwtssSkef4s70rK+
X-Received: by 2002:a17:907:c602:20b0:c2a:f360:1c67 with SMTP id
 a640c23a62f3a-c2af3602870mr155361966b.35.1790361743598; Fri, 25 Sep 2026
 11:42:23 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:42:22 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:42:05 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:41:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
References: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
Date: Fri, 25 Sep 2026 11:42:22 -0700
X-Gm-Features: AclHuK-b91Uq58Jkr9vpiDUZfFWzBSqSctMSgFDJ6Ik34Htw_8K-UmJ0z9VCStU
Message-ID: <CAGEsz8GXrP1p1HM3TNJ4nWnL0GLqgp=pjsiwA-v-28wVosjtJQ@mail.gmail.com>
Subject: [PATCH v2 1/2] media: venus: hfi: disable IRQ before freeing HFI device
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

venus_hfi_destroy() releases the interface queues and frees hdev before
calling disable_irq(). An IRQ handler that has already read core->priv
can continue to access hdev and its queues after they are freed. Clearing
core->priv does not revoke the handler's local pointer.

Commit 640803003cd9 ("media: venus: hfi: explicitly release IRQ during
teardown") added disable_irq(), but placed it after kfree(hdev), too late
to protect a handler already using hdev.

Disable the IRQ first so that both the hard IRQ and threaded handler have
completed before clearing core->priv or releasing hdev.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c
b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e7..e7e4e78a186a 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,11 +1689,11 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);

+	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }

-- 
2.53.0
