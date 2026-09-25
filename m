Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C786A4E323D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361752; cv=pass; b=tndv4zUe6WUCAh51Xvn+aE/7Fbz+yoh5iPmT7dZCbkzDKJipksnpHtpOy1JLhQRUUDeP8sIDGRoza1j0uBs4gI/4xHutKLV/mOLMITEEYZiCD7QXqDLC0J+dtNn5znWmuh5RgQujcUUfUAxffR8gncCj8Lcqe0CPzHdrIraMBZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361752; c=relaxed/simple;
	bh=DlEudOypjlT0UT2XU/5WL96WZISmA/ECBN7ByCN7TWo=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRxo58h/HHtGOw2rmuLuT0xkrXOmrCVthXrlnb+nj0qd6PCY+n/NLEzVwQ9kuCHl3i/sKSw6JxMZfjPhE7Hx1xn5K4Qv8ACieYtdxlbGeQSAC7A0cMKfZQhxvkAH6Sf99XIaoTj2PAy70IZffjIqNYV9i/KjON9Jj+IJmS5u5LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOTkTZBP; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOTkTZBP"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbfso141097166b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 11:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361749; cv=none;
        d=google.com; s=arc-20260327;
        b=ftggq7MpqnfbLXW/vKJbjeWf+ZDdSHnTsXLMOgIjFLgM8qMwRbpZt0Us5/eSM+58I3
         jLZbhojYo3OzKMTLP7/rdhmGpqhlCwwoZOhiHwT2mvSjyl2Mz8rlWZZQtKfdy9rCykOP
         zu1FcJnlTRoHXdy6xNJG8yPlBL84nx2vG/UG11CrTFB6rJdVCwrUR6xfxMEL2aKm9SzQ
         dTGBa7N/dUkO/2wkDVwinaECCEXXom0su+Hd6eF2XMd0bpxf4TJJzpy48GpDKI0Lm4tk
         xi3frq9Enoh4crTynIKTm8CtwpntqMFKcMo8BPgOMLffvoojWvuTzq0Vi/QLPob7q/WM
         Jo9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=vaQh9agvQKXu5WYBVA5rNUeh6UbMXv22v7ZPcWcdZXE=;
        fh=gac64ud4euBk79+a5aAfBEypz8tZyPQL5PqDW1OWixE=;
        b=rNCVjF3wdpRAUJhzECgiRV9zFQ3H21prCZlxYZWuu0FspyAFd3TbSQlE4wwjrUL5fn
         pOwYy92tO7c2a+2jESAnGY0ZRSeGafvnXxBZn5Uik9SQDibQ5leh4LOEqZAMssSj46Ib
         uynzUdYAEGXm4lstvy60JgOnRkaJeIQz+Y2cZlYxkmZXONAw4KM3nBHemw+u1GWAecKj
         70fgXixeYvSzxEbQn+yAhrEYCsxXLoVgzlN9jF2CKay3WURHVUbQ+rJVdT/AikifK7fh
         1/9KdT5hbv9gBpwAao9IGkR9TkWrIaWZEVh+D98X0wHQMf6CANBrRQ3eBmv7d+d0S0em
         Cpew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361749; x=1790966549; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaQh9agvQKXu5WYBVA5rNUeh6UbMXv22v7ZPcWcdZXE=;
        b=iOTkTZBP/Lm7/AH6yWxrX3SzvVDy5ZLkhrQLnMoZBIv1nK4dGfrCAPMwWofw7kDqLk
         00bthYyZ5+B/ATTa0fFrzJDHxzgRbcGyUZ/xsLCy1YHZ9LMx4LDEOVB5YZikAIlBO74B
         7WWltWBTfBNUgICa9vB/ElUGNY+Ftp5q3bmHDiCqfzfUCA4sFs/m0xobtgERqJFsKP6e
         r8cheojJXlT3BC2JhAE78FzKaoxv7x8tLhFvJ+8JQZWNW6pTfF46NnH5VQmyqBcsNz91
         VY4ZGtQOU4ZMZp8RkdmEPLX+mDja/J1fAC0GbmxGhx5mTas0muLBe5s2dc1CEm72G9jk
         jOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361749; x=1790966549;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaQh9agvQKXu5WYBVA5rNUeh6UbMXv22v7ZPcWcdZXE=;
        b=mrm0U58WyDiLBHwAzFN1ziRLNiMguF8InHIrVpwjD56wvGMENuRRvidHdj5RS20aoh
         Bhn77wfNtAqcBmDTpTKizrDf+eQ9VnecQO8zFi2vaBk0xiaiZzW8+6Z5VWoL25WoIycZ
         NAXx10mCV+LD1yaQKEQTm5B3fuHH3ePYQFvxMzP88JcVtxYcjKWcARqF9E1pwqtVY8RT
         lYSPV97rFB9/t+49THH1nP4MNUimn4YTa1fCxyMYHFjJYzpPl8s2bOyhwQUU2VBeD5SA
         hZzSrjTQ3PD79wC/wbcSN4XA12JkZW+CyU35QTgdkpZ582Si2uhfxJxXmuJYKu96qygZ
         BGKw==
X-Forwarded-Encrypted: i=1; AKwUvBx5fRFK3Yy9GfJcHZ5kC6MCqkZlksjEikIeTewom7NKr3G0CQQMes1VswrWe+5Sdbw5B4NkyGynLSCSvWlq@vger.kernel.org
X-Gm-Message-State: AFuF++kBcSp/a9G4wWdEqbtUEX+G6zEcQUQVDGDkEmprbfVrsZuT7LSp
	axsWT9cGwaz14Prh19r2waAdKK0hhkwrrdMi1Q97XD8Mlgq33Hm4bGh9jjUfk7CQ1625y0xWJbV
	vnALHpFefVyQqvCjGUzbEV4NCnlUalw==
X-Gm-Gg: AYBFou1A4mh2+55zEceISGxOafJq7K9UluWuoW2ieY0cEEt7D1V8ydzUO00g3wQANVu
	FTM/fIR++3T1sLfAUh/4xai8xYnxGQUbuMfxQZgDwOrQrks6d9hdZJi4XPQ3z/8i6t+FAelONxH
	Q+1IQFJCHRspnNpSxgEolB8sa6ZUviPJ0pfQ7B5alrD8mLs8MompNYrHwiQuhhCNbdNd801X2yq
	lTWZgB5iojOxKdTEvJO5wppvTpRQx+ky2qr3oz06gJgqtSqZFL9JEFswAzaHSJYzLIfzGpoPM3S
	ojl+z2mpvpX95C15CHhLcljw9bEfvN5w7eGKjIr4lZ9buDLcHN5sCZ9J5WxAV/iDYWtkRZM01CN
	T5+lR5XT8gyhV2Olg/eith840lCO1O2J0sJzJzxMn5kzvJNsOFyt+BvgFQAaVDxpS
X-Received: by 2002:a17:906:dc90:b0:c29:57c4:cb92 with SMTP id
 a640c23a62f3a-c2ac228849fmr621819666b.0.1790361748717; Fri, 25 Sep 2026
 11:42:28 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:42:27 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:42:06 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:41:38 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
References: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
Date: Fri, 25 Sep 2026 11:42:27 -0700
X-Gm-Features: AclHuK_62Txs1R6aJpFVtyE2f4h_5eO8zVZDoQklxyOE6uOg6AtGXwg5pp6EdGo
Message-ID: <CAGEsz8GWLwXjNKo-9RpR=sGWqoqiaW-bmT9o+fYsTJSkymiqNA@mail.gmail.com>
Subject: [PATCH v2 2/2] media: venus: disable recovery work before HFI teardown
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
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
