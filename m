Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6105749365E
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397437; cv=none; b=N57HnBmC8TcoYOmRCObXzPApHCQMaioFY8zIjwtXmTEZ7jBfuN1ADDRpRxZkinWLnBXhik4ozp4MBcAvKqyEweR9W64jeTD7pM4zb5nq2f4BvAuerZxW/Os1QirVcmZBAdak0K07De0HeEQMu+t3zHSPgpl/1WjCilE1fsqRLOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397437; c=relaxed/simple;
	bh=+38OfM4nHCI3nn6CkX7YNwTcRX8KI+gQs8yzJHzGeeI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmHHurBaqJEyeL5vll879QI97yxHpQn5uXqiNWgt86PEnbGj7VPDpd2KwirnCON+VmhR5pZM/jaYsFB5P1dndz9fN5Z2fL/c8tI0Ue0o/F41CywbXTziMBH4mHQ88MbPDqEcvFT36q8/PyWrXW4fcORHYBRJv8V/AeDpLm4z/ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpKbxpsW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpKbxpsW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B891F000C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792397435;
	bh=oUubqkMNuzbEhZ/QzkYZrhGa1eJOqpDaXmCWOSArqao=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mpKbxpsWIL+xGNHEPltm7/PKoOw+VIet4mC/3WWio6DA7quIvt7r0Ty5+r4Rk0ErE
	 KbWuAvZ6RuPQDUZFJMVftxIWIzMerGN65TzQoQFxgM4xjWKs1+ilcochC9kSQDIi2x
	 sfd+ykQKkzblJgShYii0tpopHNf62rbZfD4s+y8mTeUYUCBvwykSMhJzFpg1+EdmGs
	 qm5hne3Pw92RlOKJ3AFzpF42JtE4ls1abYdPXb6pj4Dvoi5V4eAndacxcVJ/4dXo4G
	 WENcY47ggowV4MmBPIrvc5m0ftZroNnTapmoh5sQe6zcDZTuEUDP/cEgLUxBKsk29a
	 mxr8C8Tpvej2w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso5321761fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 01:10:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvGkuUDmHjNnBndil6kzuFkwnldP0dOSGM4mmL8/4EN5EMoO5lpO1fnv8YBdWZe5z7H+xe4Oc6hSEewiai@vger.kernel.org
X-Gm-Message-State: AFq9FYLkM72lDpId3+BwhlXBh3+2OIWHQGYPlcnQmdSJUimE9vROB7DB
	tIT9vRDp+p9OlLUKVOrDkCrroKO+yofE4wu551dipVeMvyCN822ww9F2ujhIzjVgqkSRPzbxsmR
	YyZvKhxvA6Gsxu71+Bl9HGeEdpqZ7p1dl6aqUENVl9Q==
X-Received: by 2002:a2e:a991:0:b0:3a7:812b:cfc with SMTP id
 38308e7fff4ca-3ab291582fbmr15016761fa.14.1792397433880; Mon, 19 Oct 2026
 01:10:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 08:10:32 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 08:10:32 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261016124615.61-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016124615.61-1-26rote@gmail.com>
Date: Mon, 19 Oct 2026 08:10:32 +0000
X-Gmail-Original-Message-ID: <CAMRc=McwkqsphfGC5N8P7dmwwV7BAOR_=E1aV_oNS2h1T-HKxw@mail.gmail.com>
X-Gm-Features: AclHuK_FUPXWaa7SsN-fPmc-RpCDhhG1FoH1FGOFYHxfeCyV9QiuI1-8RFA5HaM
Message-ID: <CAMRc=McwkqsphfGC5N8P7dmwwV7BAOR_=E1aV_oNS2h1T-HKxw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: qca: check the device address on every setup
To: Joonhoe Kim <26rote@gmail.com>
Cc: brgl@kernel.org, johan@kernel.org, loic.poulain@oss.qualcomm.com, 
	linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, marcel@holtmann.org, 
	luiz.dentz@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 14:46:15 +0200, Joonhoe Kim <26rote@gmail.com> said:
> qca_check_bdaddr() sets HCI_QUIRK_USE_BDADDR_PROPERTY when the
> controller reports the default address from its NVM file, so that the
> core programs the configured address again on every setup. The check
> is skipped once hdev->public_addr is set.
>
> If the first setup runs on the ROM firmware because the rampatch and NVM
> files could not be loaded (driver built in, firmware not in the
> initramfs), the check is not reached. Once user space sets the address
> with MGMT_OP_SET_PUBLIC_ADDRESS, every later setup skips it, so the
> controller falls back to the default address on the next power on and
> bonded devices no longer connect. Seen with a WCN7850 on a Lenovo Legion
> Tab Y700 Gen 5.
>
> Check the address on every setup. Setting the quirk while
> hdev->public_addr is set does not make the controller unconfigured, as
> is_configured() only looks at it while no address is set.
>
> Fixes: 32868e126c78 ("Bluetooth: qca: fix invalid device address check")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> Tested with the WCN7850 over UART: the configured address survives
> three power cycles, a bluetoothd restart and an rfkill block/unblock;
> without this patch the first power cycle reverts it. The NVMEM BD
> address series [1] changes the same branch; the two apply in either
> order.
>
> [1] https://lore.kernel.org/all/20261015-block-as-nvmem-v11-6-f890ac74f87d@oss.qualcomm.com/
>
>  drivers/bluetooth/btqca.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 22b08ab05b82..756a4a8d5631 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -686,9 +686,6 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
>  	struct sk_buff *skb;
>  	int err;
>
> -	if (bacmp(&hdev->public_addr, BDADDR_ANY))
> -		return 0;
> -
>  	skb = __hci_cmd_sync(hdev, HCI_OP_READ_BD_ADDR, 0, NULL,
>  			     HCI_INIT_TIMEOUT);
>  	if (IS_ERR(skb)) {
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
