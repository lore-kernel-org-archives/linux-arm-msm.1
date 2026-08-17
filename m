Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C774D41A50B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786989970; cv=pass; b=PoLU9OAIbAERRmX+pZjmteTKL2Uef3RfYDqBVJfjTQ3EQ2M6UrwFbpBDxjaMno48BnFXzzTeoQoqLEDZiZRXONuuzUaZvv5tY4Mg/us3SmHNb/XcO+iPhKSRcFmpggq8mQqz9JMO6RSjcLtFVgAgZv53J0cdG5VrdSoaqb1DL8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786989970; c=relaxed/simple;
	bh=JlL4Z4kCZkMEBPHWiE/ViVx5PDkOaDSjW7qHiafpgq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X70PVLnQSd62Q7aQXMiZcnzSCmK67g2ve08ylRzj1v5MgeU3EQFbq+e0qXpPEDDQBGzwTRGb5ws8s5qROnCGSC4NxKI84lUSmYilDfNVXl6WK4c95Y4g0nS9dryARnSp2uUBQ3ITrDVvCTjFhu40+Cw94PTx1F7/jIk2QQBtJ64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoF288xH; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoF288xH"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8200ca16f26so52584537b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786989968; cv=none;
        d=google.com; s=arc-20260327;
        b=D77KH+naw60GKPSpIPYjeVrKBxV7D8Jaybcmr6xc4wVBqKFUqnJJ+BDenRr9IhFly1
         mUtMrPDjd01glXrsrbbrKR1/WMx6AaiaIofx2rydXZpMUXtHMB4jbOx4RAuuQs42VHtV
         vvFb3oSH9wq4dlRSEsBFHH2irrzbyXH4EDvCHaDcFKPiQDvReEZohkpTVmKjRVY2eYK+
         TaN+6rsuWZyH+38mP7R86dpGIRJp4nCu7TQjgNvcNZYM+KsA/JzSFoqio2r0gwbKVWV6
         JgEnZPKoL8uf7q5aWAFAl1sh+oO+Iwwp9zE6TR/MXgtqH+7tL/klE0lhLCekr/QS/gYt
         GXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KcQPlUyt9fGbPvuHNX86KFq9XHrXHuGXNoT23phPfOQ=;
        fh=WDPHSzBMY1IA9EgNcV4TL5BCHruJL3geUKo4/USze6o=;
        b=gxltwyoo3eR8xkpQy7zEvXpuaudQKZkJEW6RKIhy+gsKA5PMU0s6S3FUP9WxSDFuRN
         llCrnaoHVPpnjLvXFMKQIhjAhT0jcmN+h2MyDit8kF3Xsy87RuQ7NR8AwqrmVKKvitsx
         KcxsQIRPbyybeHR/SPt9SuGhgpzWQJsBTQdgtr9DFJG85yxieuiznzPFFeFhOyBJl73R
         RON5FK2h15wE5LRBydP0HJiR9/b4mWR7323SCJxM1pU28aKJiKSssjpPjuaJepdFZICg
         ysL0+/jEDyHqgGE4qC/tlvojWeFAN85EtNxi05ltXC90Qcc2D72rndUzJHdQ2ZKVbxxP
         ZMzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786989968; x=1787594768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KcQPlUyt9fGbPvuHNX86KFq9XHrXHuGXNoT23phPfOQ=;
        b=UoF288xH+Mns0z2qqrohxnUILeA0J7bJLIN2G364RvZGRS/0LfU1Ypa5U/OKPU3Q1G
         bqe7CSd++6zp95NR8gtL04473B6JUohGiFO4Wb39Ykmx0lT7dhhco89uydKQggVEO7iN
         YUD8sgURgdtF4Tl8vz2e/QaX8GS/oy/Z1AkHt6sd8uL+PH6xew4uesIFVOXBTgvak7Dl
         Rr/MYGWktv03ErtBO1p3mvctya+BkHl++5U3tnAQPoBLbyn2Hi6bdusV26qQCZVA45+6
         LKxjf908ihjgs7f15iWQSLNaJcVWXdfkjM8Cwcd/k+/8uzNcAj9jzfqJm6e+Ky8MmKNw
         Bcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786989968; x=1787594768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcQPlUyt9fGbPvuHNX86KFq9XHrXHuGXNoT23phPfOQ=;
        b=pdyMiLlfrdyxlotThvLzVKaoHXbBYnAbwjhsOrmZzLNX83DItN7yiYOXJ+NnrUvPKc
         mhYQYMl2/lSpJhki4ylvoTroAgoeN+jvNjolaJAWkIcvU4sOQ55hRnN/Qww/jlCof05A
         DX3jEZ7v6SvSzn3kXQsAIJKYID2NDe2eg8F59DM0XAProv5kTlaZGM0SuivDuMy4Cx/D
         w94zNArs7tK/Sdsa62xyU6Rb9KL88AfVyijKPbgbxTCTGq84EShZ9/KdbIE75s7YYzRm
         +M77wy/ulo083tBKvFSA+zphNNe+v7QbLbPN9uPZskqws4NEm3YdSEKjWuPFcWn2AX+L
         LK4w==
X-Forwarded-Encrypted: i=1; AHgh+RqWpGvaJPL7EYHZHKLF2Dkq10EWLl0fnucdNnd8sv0JfZtXvMQ0xCz+r00oHuFCZRlJIK0ymZQQubBfnNY4@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRqmzIrsf/HfzJAMbPrmkQS3ooz1EzRhEhNmYttYk64WqemOA
	JuOa4qomOHZMP3clAKJHD/gYZ01VAyQGIWQXyVWQuSTTTOtQVV1WOEFIqELvvyc2+Ky0FdGoO+A
	PNTsr05RHfmg2dt1fHuPpV/iC7gkgyi4=
X-Gm-Gg: AR+sD12qFVEnRcDs7F8WUnF6H2RwIWeAbtUstXaLCRGdEvU4asJpdPtBYYCgncSSTg7
	C9BtW0b42qhoUQkCReOqpBHan6ptQWSOFkZZh3HtawfKKzqCqZAsO2OA9ajdc3vCLK456lxclpy
	ry45oSZ0SaQk0cjId820Vhp5d9mTgQH1tXrp0SRaWzdku2qsjpAPXWIVx2KQBH9LS+ZMfKirdjN
	uBaKg2WzcEWmUlwrfknYwO89UZTAXEvMdbKs9lcqqXu/NneVaQ6yW1/AFYeiZOTj8OM0BR2A7H8
	310Kq+IYXQm/6tWGDU/olO6LTrtTJ/7xiZUfgebotClUwKQm7auapPc3xhwTYBGLU5MgvncUQJu
	k/UZVqC6I/DaZ3yJuDwImElr+nqqaydg=
X-Received: by 2002:a05:690c:6606:b0:7db:ccda:a40d with SMTP id
 00721157ae682-8412cd4982emr9774557b3.5.1786989967577; Mon, 17 Aug 2026
 11:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817060134.3298439-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260817060134.3298439-1-shuai.zhang@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 17 Aug 2026 14:05:56 -0400
X-Gm-Features: AcwNN1XMzSzXt9ZTguCz-D2FaYR1VfQ1zJWmPA_Y1wKxiOlQAox_14y6O9qpWcA
Message-ID: <CABBYNZK=Pk_5UpB5F9RkUvk8kTzXYVi_dzB-yr4_yCTumTBE+A@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: mgmt: reply to cancelled mgmt commands
 instead of silently dropping
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	chejiang@qti.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuai,

On Mon, Aug 17, 2026 at 2:01=E2=80=AFAM Shuai Zhang
<shuai.zhang@oss.qualcomm.com> wrote:
>
> The kernel sets HCI_AUTO_OFF when a controller is first registered and
> starts a 2-second timer. On slower boots bluetoothd and the HCI_AUTO_OFF
> timer can race: hci_power_off() is already queued while bluetoothd is
> still in the middle of its adapter setup sequence. hci_cmd_sync_clear()
> then cancels any pending mgmt commands with -ECANCELED, including the
> MGMT_OP_REMOVE_ADV_MONITOR sent by reset_adv_monitors() early in the
> setup sequence.
>
> When auto_off=3D1, hci_dev_close_sync() skips __mgmt_power_off() entirely=
,
> so there is no fallback path to reply to the cancelled commands.
> mgmt_remove_adv_monitor_complete() silently returns on -ECANCELED, leavin=
g
> the command with no reply. Since bluez's mgmt queue is strictly serialise=
d,
> this stalls all subsequent commands indefinitely, leaving bluetoothd unab=
le
> to register the adapter.
>
> Fix by mapping -ECANCELED to MGMT_STATUS_CANCELLED in mgmt_errno_status()
> and removing the early return in mgmt_remove_adv_monitor_complete(), so
> bluetoothd receives a reply and can continue normally.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  net/bluetooth/mgmt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index ac4864e56..c660bd3cd 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -301,6 +301,8 @@ static u8 mgmt_errno_status(int err)
>                 return MGMT_STATUS_ALREADY_CONNECTED;
>         case -ENOTCONN:
>                 return MGMT_STATUS_DISCONNECTED;
> +       case -ECANCELED:
> +               return MGMT_STATUS_CANCELLED;
>         }
>
>         return MGMT_STATUS_FAILED;
> @@ -5675,9 +5677,6 @@ static void mgmt_remove_adv_monitor_complete(struct=
 hci_dev *hdev,
>         struct mgmt_pending_cmd *cmd =3D data;
>         struct mgmt_cp_remove_adv_monitor *cp;
>
> -       if (status =3D=3D -ECANCELED)
> -               return;
> -
>         hci_dev_lock(hdev);
>
>         cp =3D cmd->param;
> --
> 2.34.1
>

Sashiko is flagging a couple of problems:

https://sashiko.dev/#/patchset/20260817060134.3298439-1-shuai.zhang%40oss.q=
ualcomm.com

--=20
Luiz Augusto von Dentz
