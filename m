Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920233DB33F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 18:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787076125; cv=pass; b=Ph4T2WZ9P+zGpe7M4DHWgjbmw1D2OZ6IxOZRYhvHz57nXu3Eh9+8p7nvdb7by2+8WcHLRMLXdKh3HYj5pR1NgPRzvDSlgcWpnFzQ6OmJSvepXRKgAbTUFKFCLOjUDEFvRgz633GRWU9bubDacYdP+B9f/cc31LpfO+LBEJGbQI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787076125; c=relaxed/simple;
	bh=IgBGeJCDKiYKLE0gQ0v9DR22201l/v7euRFWqtsNNyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjkaU9s3LtQ5uBWvHswmoJWXMTEyW0EAWU7NrH8Jt37vuXKl/eZZMi0giVDB4pTyBKy6duF05AonKNmcmwNiQZU0Ag3i4vwFKIQANM6NPbELaWh8Q/pPXWVeP7EQiAeDq/EZ2Ip0bQmcxjVsq2yRAlttfW223mZ5DDGjAOx9jBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIfzexSO; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIfzexSO"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-836c8bde2dcso3036507b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787076122; cv=none;
        d=google.com; s=arc-20260327;
        b=ZUM4uBFw6BhStVPhQ+mbh/6O9iBoCWEzLOJqBIEmrx95uEw+Q0aYnyF9rKVTbrlW8u
         DfZwgTZ7WjaBfMtqz+iViBP+NdooD/7JvFqpf5A0XXDQDbJcpOFSzPp9uSzgSd3g+jFn
         AfERH8m8+5KdV5tk+37Y3+/zxseVmIf0tCDBDKRi5Ru//uuiswMJXNbGntN47uCBlB4C
         57JLwL8Dp40mIohqd4G0PvGpYK7R8mrZ5O5RmcdNftFDUKycjQaNr6wO5VkNqvh/wP3e
         gulfrdB7NdKsQBbzFjdiWRjqT1cblUmQsl3Jb9QEjzl0ctXw85h7wHQGpEqk6fvR72P/
         +S1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JnRPUTV0z7CVyIrMTRkfaLJ+Iek7vpJVoTQfaBHHeDA=;
        fh=8ItUCFntPi6UEKB3SfRyWL+ehqI8IjrQUy02tR7oo9M=;
        b=Ws5SWqo5NRrURGSj7c16VWJuD+qzEiUqhddAPwsCa92zVv+yN5U0RNw+9UDdHbNRzY
         2EpieX3reWtAfxziOYO5H9AS+4oYuYMZovV2Q5DkUyMNARc5kSH0QqKq/EdWLCg18oJX
         pSVtrHi36DnWo7vH3eqoU08V7c3Wg+82GO++CDXMB1n8xOqzj+BGamMOH69LFVovtSFn
         DA+IRVkfZrCUrtxK9TDeEzkP4vkz6dci1d4w2Y+IutHwQI4FHfZr4zDHTe0HZ/pJhrG5
         BwdcQ8cbubVqY9ASseXNarIe8X+iDDr/IP92jSKtW9HG81L1Pr+4VLhQdR4+q/PMZiuq
         MyzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787076122; x=1787680922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JnRPUTV0z7CVyIrMTRkfaLJ+Iek7vpJVoTQfaBHHeDA=;
        b=DIfzexSOYLQlik42YYH/zhzOl9u6/O5H/X8M4FfRYipyTqsaBGpqGKqxJKAbFBqJ8g
         8EQBeaSrw+alMuxq2SeL+yfB6hifbqg5pFg1eafwKHy94SBi5WNz/nwDIsnQLbfMzLNX
         qZS4TZ56sDZAI9MW29lgTdGUE4aumNRQf5CIPEhojPsy47Yu9VJ7lqM4WZnk1IXCWYHL
         7piiWKw1TTP0WPsJ0IVbWrBJ7F9u9QCBMcrKa6rFT9Ukj7jEhsI7cNJzEdMwehzBu7wA
         svSvlQXTFnRfOXVb0NAIWZmEbm6eMeR9Z188N+5NxZ8RLNMUq+YQUyPJJG7w2Mju7YFF
         DGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787076122; x=1787680922;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JnRPUTV0z7CVyIrMTRkfaLJ+Iek7vpJVoTQfaBHHeDA=;
        b=GP+bCf6HOJAzEU3jq6zQjIjv1ZZ4C4Bln9CyZnf0w+5vjuipb9lUieMO6G5K91b4Gr
         JHC9JEkYyO9a7j75DNmFDIefqceCCRWmrGKWSkXSFXYych1YmG6EQl0Nn4Zs5sjDjL9w
         CZuBFyBzye1TKSsYZLPgKmGAUjvM2ABaiSmuod5PdIsiZUxXL2M/9B3BTjTvwv7LLL/H
         vxLRIliA1y+5XfwctdvwjZNjF+JAtWRLpElz2BQ8VWZFvDeknf7spDWMip/sAluBohmV
         2bzCLNQwcNlkhp3l+/6yC/c/9xgVa7uDrMKgDz/aqfjjz4o95osxdnZDMfOnMBLkZJB8
         AWOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkYqr0FBZzhDKgy2AwBOiavJRrqyZrmW4LBKZzG8neG82hD7QLJSST6bwP5v0ppQ5k/Ovipg6myf4W804o@vger.kernel.org
X-Gm-Message-State: AOJu0YzLA0gYiFTkGkFAcolDfQYMOSltsCXmof2vEA+MzvRk6q1T7v1X
	zLytuRukjarmuLIEAZZRUOM95fW9VqN18drqnXGcvvg95TOM4Hq0o1YK1tFxfYUCXMTHxC3iN5u
	G/aB5+zo+fr8G5VfCyjL0dgz8a9eAXdA=
X-Gm-Gg: AR+sD12iP6GrIcSA54RRa0KctbzDujZhZZihhTZW6UGpC+0hb+ik6kRp6N9X79CufBc
	DnG3a+w8+b6yRfQiUwGQYTaUoNcVB/3XD9NmJ2UqXskceh+hRluYMnl6Nu7jL7ajWAjPN9jeUli
	zv42sBKMZ8UkzLzD6OJ4WbmbM8jBHxdAakmKDfUnJ/atZVvhiBxtlqR3w3MTnz4pic8WPD3fR52
	2I7A618JP2v5cxwe11rs1YNFuucVZuak9fiLamDIhigVWpa8G4W+kg9oHaYXLy/RcerblAwmbal
	jUoU8SLkKHWFiUGJpXYkJIG9OE8oZfkWxacl/rYYQ01jffqXBYuK1RegKtVrmkjbtwadjiv5igq
	tQEvW8P/WfTpB7cIS0l3XIv3fvXHhDbg=
X-Received: by 2002:a05:690c:7003:b0:80b:9114:3b85 with SMTP id
 00721157ae682-83706f4684bmr152551277b3.0.1787076122204; Tue, 18 Aug 2026
 11:02:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817205017.56524-1-johannes.goede@oss.qualcomm.com> <20260817205017.56524-2-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260817205017.56524-2-johannes.goede@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 18 Aug 2026 14:01:51 -0400
X-Gm-Features: AcwNN1VwTn1hJ-am2OMW-FOMoM3ME9dN1GaV9yIHvOeEU0lqJnAdL3_Oyb6_pDY
Message-ID: <CABBYNZ+Bhhx3rtq8i_FGu2a_oFyWquo_gTRcmPyM6HcFC3pkVg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Bluetooth: hci_core: Handle skb_clone() failure in hci_send_cmd_sync()
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans, Ibrahim,

On Mon, Aug 17, 2026 at 4:50=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> From: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
>
> hci_send_cmd_sync() does not handle the second skb_clone() failure as it
> does the first one. At that point the command has already been sent and
> HCI_CMD_PENDING is set, so an allocation failure leaves the flag set with
> req_skb NULL. The response then matches nothing and the caller blocks for
> HCI_INIT_TIMEOUT before getting -ETIMEDOUT, reporting a memory shortage a=
s
> a controller timeout.
>
> Clear the flag, cancel the pending request with -ENOMEM so the caller fai=
ls
> immediately instead of waiting out the timeout, and return -ENOMEM so
> hci_cmd_work() does not arm cmd_timer for a request that no longer exists=
.
>
> Clearing HCI_CMD_PENDING here is safe: all code touching that flag runs
> from hdev->workqueue, which is an ordered workqueue, so those paths are
> serialised and cannot race. The one exception is the cleanup added by
> commit ed516e3f1aa6 ("Bluetooth: hci_sync: Clear HCI_CMD_PENDING when
> dropping the last request"), which runs on hci_dev_open_sync() failure an=
d
> from hci_dev_close_sync(), and the workqueue is stopped before that runs.
>
> Fixes: 2615fd9a7c25 ("Bluetooth: hci_sync: Fix overwriting request callba=
ck")
> Signed-off-by: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  net/bluetooth/hci_core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 8aeb3024428b..9585b42e7970 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -4092,6 +4092,11 @@ static int hci_send_cmd_sync(struct hci_dev *hdev,=
 struct sk_buff *skb)
>             !hci_dev_test_and_set_flag(hdev, HCI_CMD_PENDING)) {
>                 kfree_skb(hdev->req_skb);
>                 hdev->req_skb =3D skb_clone(hdev->sent_cmd, GFP_KERNEL);
> +               if (!hdev->req_skb) {
> +                       hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
> +                       hci_cmd_sync_cancel_sync(hdev, ENOMEM);
> +                       err =3D -ENOMEM;
> +               }

Sashiko flagged a problem with this change:

https://sashiko.dev/#/patchset/20260817205017.56524-1-johannes.goede%40oss.=
qualcomm.com

Im with the opinion that this shouldn't cancel the request, because at
this point it may already been sent to the hardware so maybe we should
flag it somehow that req_skb wasn't able to be allocated, or something
like that, but the command is still outstanding.

>         }
>
>         return err;
> --
> 2.55.0
>


--=20
Luiz Augusto von Dentz
