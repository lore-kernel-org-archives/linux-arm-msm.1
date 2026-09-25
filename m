Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015B02D7BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294969; cv=pass; b=aahKFlVdzP8y5u7dadqF0nst8jd3Qx6yqajLGxZUPeOuJb3jfuTUpHmiIiA4M0m1HniCA5MPY9rmoCyzHAhsClxUJTOEqBwXUVBh3klfpZsq8iHP+/iQ91q4/PJxzyF+FR0gOBlDt5vxls9cjtuAkU4pX1GcpIOAnBKOeUFERrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294969; c=relaxed/simple;
	bh=YSMX5FLA+2PLf6XOskP8bd0x+m6bdSeEocRmUK+dICY=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2BqdravHQDnW4ULUNDlJJexte/n7AKWMaB0K6XI6HlS2LOb0UiAuu0hs2fdOo1yCgDFXzF8/mxIUZ3T5qUAh4+zMW4mrlbcf5IyFEwyxDFvIdvrtSZiw+dHT8BYc0Je+PihLkYwG8rq1+v5JzU5x0+B8oWqrbtsgIpnij0wlLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMGt7b+R; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMGt7b+R"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55eff0so45574266b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 17:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294965; cv=none;
        d=google.com; s=arc-20260327;
        b=BlluVdy9IQIFT3ISkskk8024kjzDDTow2aTcbcQIYYz95pDbUb7W+p2ekqCt8YYIjO
         UvUaUPNXjyO77zaYr9B8SbxIAMgA7+w/dSgpBmx7QmDTdymSZxnCBheA6Fy7Z+EEauPV
         YpjLk6GRyyzDgVHgrB0xXQRzx5L30eIj4R6Xto9pBKPLijkru5JAbuq43a5xXuVoZ1vD
         ZkwVnH91AoNyBzdwJXEJDd8lViOvwiAJEBbMTpDnt8V5WjWOXfMDiVQ/rAvOJe+AzfN4
         n3i/NRpWtneFhALny4suU22M2IvWeCDE7EOG0THYZSQRnyfR2IXrFekrk19SyEo/2zcx
         KAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=CyX0bYFSyTy1F08pLyuTwWBLmwqeeaIpLJGH7n6wEgI=;
        fh=WjecFJ8djvczQ868uio6Cclseo5CWMfu4+OhtOx7vkQ=;
        b=QcVBybP0HlCe2TqfsNaPAfo7pahEFil6LzFXm45H/QgtEviyMNQUoE9k2JVHbq+ZfE
         bMmV5G2NDnwcKzDWFGulIKKaxxnuoomRYMnvCYFvnzJ5lWr8ci2NSeZu0sUVz04+q6cW
         0Rwg/9SOb6sbYXXGkZoU1SRGrO0HQbLQ+e0SEhsHkg0zlLp9v9ZeBYo4XY9yeA8KCIUD
         D7a8ycZqiUtKonFOBSDqnu8s0ViWOlAwsHUY8z0Cluu0elbVwrsJ6ijxEHQEsPzxVcKs
         Uvo6oZ/sWwjC6P5hGJu4jTneS0IGvlapbLOwOAaQzEfhzuUcGNftrP2yg0Qc+wWuJpfD
         Rk4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294965; x=1790899765; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyX0bYFSyTy1F08pLyuTwWBLmwqeeaIpLJGH7n6wEgI=;
        b=TMGt7b+R43WhQbmZL3n4NTNVIVlbBAiInjTRsUgiqqWIhBK08HMW2yahUbHtQDizHO
         CnaLr0xp8ExNwvlSqhUl4z6967ScxsPMITLAltzxBzggwyA+a/nHjuYkmSdxjwTpf9CQ
         2TAcIMUrnVWTncZGW2r/l+KllcbVSS/E0ggvy+Q5GLoLpIXDzh4jV38RvZ2+11H29IVd
         ei2eAXEO2V6e1KwXNTNfoo3Q4sVAESBmHY05Bv4M2KB0z7rKXN0mm92XPFYa4gjdNzXY
         gRJjh/zr8l4k2Ea48LrbKtMYB2mNvJGHdZFmh+xtaS6LexFejeCGiKxrO521KTYk+fig
         QtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294965; x=1790899765;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CyX0bYFSyTy1F08pLyuTwWBLmwqeeaIpLJGH7n6wEgI=;
        b=UiPr0ZJQjI2VxXHnKRIVt8/20f42YdDmDTQ7p4qE9M9E1CZxY1QDt91YkFupy7r+6z
         yV5e0QVhfR3cPCkQTX/3RDYhy81wJBxMjSj8ps8ogIkKv4FjXwoN7fRvBMRvSTnY6oUZ
         O8YV9N5NAzGKo7E3PBoKA4RoiHQRvMBudlYs35OBEJfOfbg68TBjxsU38YNZWccKqd2q
         BSkMRtd5JDXjg7CVz9zu/4R6fDnwgi6A2V8tC2wbhFYH0res6iuKVkXTjV1762VmJW1I
         XewHGt6Kh85cYh1FtZg+svpuTUs1oWI70sMAVSv5qLf78GKDKfgCXfU7vlmYGnmttCtn
         mVQg==
X-Forwarded-Encrypted: i=1; AKwUvBydJWqvhcKkpJkKbY4if8z+ym5Pq0NScgmGgl/wUMa55Dpv2tMPhc9GDfZ5VgNdTP/4LaCgNp7Z3JldBoyk@vger.kernel.org
X-Gm-Message-State: AFuF++nt/33wqDoZXxCta0BSTR5NAff3F7F9sc/kjFyGmrQFyTvQZvzI
	6ZlOpfa5NYjDUh/uUu4vmi1VCW1YxpK7zJHmC2XGy1up9IMJls4RPZqvwWX79gqg57dxHwSLz98
	dU0DvC0N4qF6xfhcE4QJkI7tpxD7QHg==
X-Gm-Gg: AYBFou2Be8emcLHTFyxcmlDFdsGsK/RMn4opPJ+UqwdsqRkR97c9p8xDhmwbEy0aghx
	pqP0aIOdhR+vd0ECoBTnkbWS/BIF2/RbritsB5ob7yMBGH2odKh9JXpZYMJiBDQv/ny53AawnNm
	5CSUrOxqzgUoJ/pCwpUZi8YAkiM7ujhx6SyI89CQcDG6YMgK67tq1n0o3OO/7MBM6u4Q26tu3Du
	nbnSlFgH0IBYNoQt5J92XLW9c3zWTqTBR+Mkfta5vKc4tTKJ+y+CY/A1m5Jx6dAFV+qYaRYFcLI
	KWfbiWfBtIB26i1Eho0isuI3gmlmiN/RMD6H7Ldo4irZJ4iY+6Mo/AiYPYnLkbDe7g/DWC5tGnz
	N6Lmfxeqx1/1vYBMDiPzeL1aB1UfEgkj2qHMTJzwBdJ8MWnW94pcbQzN1Qvzhr/1r
X-Received: by 2002:a17:907:728a:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c2ac257861bmr361270666b.47.1790294965192; Thu, 24 Sep 2026
 17:09:25 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 19:09:24 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 19:09:24 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
References: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
Date: Thu, 24 Sep 2026 19:09:24 -0500
X-Gm-Features: AclHuK8SQKUaayfiqW3eGLbdulCVU75I0EuHaaMSyB3qG3Aqki_rJZf295CwA-U
Message-ID: <CAGEsz8H02F9SQ70UmnqMz3wWO5oc6=v5YTnAobBPW2a0reWeJw@mail.gmail.com>
Subject: [PATCH 1/2] media: venus: hfi: disable IRQ before freeing HFI device
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhun512@gmail.com, sashiko-bot@kernel.org, stable@vger.kernel.org, 
	ae878000@gmail.com
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
