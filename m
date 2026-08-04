Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA424570C4
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864299; cv=pass; b=eJ8nZpUDYWEdd/V6HDTdxnypMNIf0c15ldUcsoik6GPHaAzy6AH/4xGPQPj6vGFDm+mZkXn25/nEWMeKH2o+svUY3nhWgMdrtkbiCU1R7uR9LQkUtFSPPfYJYa9ILuiA5h6y7YzUEjakTN8tTRx1LqYxRfuJRkWkt9cH65mtv3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864299; c=relaxed/simple;
	bh=8oq58Kw3e1RY5V+nPTqZEO2efIz4sFxYjBLsUf8jM28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRxmuw3xnmq9Xb1NfpABiW17cbtn+isJKMqWkkLpzSSn/LMhHabwU/4k6pgWz5R8S/G6LQwUMQ1xh+6zJUzmzAIaK07nB2tj6M3tQRg2xk35GxZ83bVpFxm1iWW0rHWViTChRLbCLu+6sRmjuuq3mw7JkET3z+1q/FE5PAZ45Dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctNgKf42; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctNgKf42"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6680ae2031fso8226d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 10:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785864295; cv=none;
        d=google.com; s=arc-20260327;
        b=CnVyq4GjOgggDpfhDX5ILTteSQHgXq4zuzz6TO0cRhY2jS7wtDbp7fTMS2w/iGZa3p
         4pxyurZstnY/RTzolttU+d2X3a5FBph8ltMYjFbJp03iJGBqarK41TZpS3P1m7c37JOG
         uR4dN5hCjJan/KwS2VWp8HlXiBIcMnt0TEYqNPpnxeY/BfarviWW+WbiscjX0kNw7NLi
         c4iy9Cinp8NeDxg1YD25bEQh63QvNhVGg+uhus45OD3Q8We2hUktdNhcAqglXDJTmEan
         EP9T2yrHsrcWYzc9Np0LdRea8fF0370bANzb6vbQv1JoBCu1xnlXhpk5Ux5NnJt1ngK0
         3pBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YCJrQoTfml5uDAW7GHqOcLpcahzFZHSJyluVSUxfSYM=;
        fh=dQcFZnKcgZ31+UBop9jLH4n/ppGdn7Rt5Xr6U3QsgU0=;
        b=UCIL9nhpTfbiUn/PkzuY28rQCrmxaCceihHAfI+4doE/xM5K1QqZI54kVFO6gL/agI
         hsGW16otO/UpBcowuNfUBWOHg3tLIbFf4/YzsLthWdg1fheWPODTyBTodRdPYVKHanqu
         UcCiscejcXvqLgijkQwK+AMggrsUNuWsf8i7LYDvV7sBPItL73o5x2n3xALo9cPsDAvE
         Z/Lkfy2EMFqIW4/mwiYzLY1vbZtrC0ihqHrPwJo5HMsyd9D5FMmXnvwC4/18mZEFdjHr
         pJ+j4gDCkAW3XfhOLjCq/GWvlotMxg9tClhHCs9myaZ0bRjak/pD/GWQMo6QcJPhUeop
         J/kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785864295; x=1786469095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YCJrQoTfml5uDAW7GHqOcLpcahzFZHSJyluVSUxfSYM=;
        b=ctNgKf4209RDSHk/UydzBmiasH0cWOIG1oI+AbgEB2ojKBh68rsm8ZeYWfvvFnFhkq
         Ti+nkg2gw4X+L9rG5jdNJy8MdMwAHKi+p0gxBNkmKLuqPMfaYV9LU9/+ozXej3X42e2z
         1VNx2iHmQxXbZWKIcT45etZa9Q+I+Mm2BPHV73U6Yr7fUFIA7+MbvorkYoeHkgZ7ahEn
         n1SCSBGV2kf5zB7wR7fqmFDZtAf24e5oNWv3o2M2F/FLwv2UC41g817zONaY/xAwX/lh
         5Ta3gZVXJ5nr7M6xdZYDgOwdu1GGYXvSAloXV4cBIpIpM/dLoKHJmj14gER8B8mQMLY9
         bBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785864295; x=1786469095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCJrQoTfml5uDAW7GHqOcLpcahzFZHSJyluVSUxfSYM=;
        b=sbp+52TOC5kCm7ezMs37AbVFmi6VJQ6EPJ+YLDADY85vVsa0lfzoLku/81gfvOoJNJ
         QLYHx/kxB7a/iP47KUCWag/xecNJbJ4CbgUY7frGbrMwKrrqETSTNMS5JRyYNbsjKtft
         HTMc4ncEfSj8oXXkivFamjCjj5hnVWYEHITzh+VbVE710CqEhZxE6rK3Z73UJuFUvBb5
         MGfuEJfGG/CEPcBZkdGvzpqgvxI/owMxaROPy9LN1xez3rbxzeuuqGz/k26YlyUkRDvM
         I1sDE5qEit6ASBGOfXoi6hqA7qajzJpf6eUYzmSTmDSxQbTaKfXnI4/iZ0pInXv16rI8
         DC8w==
X-Forwarded-Encrypted: i=1; AHgh+RpQbURODR7Lvb/vzTpmGv9Ga5r5xwc46tHIHyBPG7cJBE8d2derOCMxzyRMlpo8s5MGhQ9UlmgtK9Xstx0S@vger.kernel.org
X-Gm-Message-State: AOJu0YxTd++OuXp2OZV5PX3+5fcMX16ql6P7LPfLmShhNJGqk0leqX4/
	pYHhLTQH9OE/0xvz5DiapNyB9v59lTuE4x3jvmqJGYvsgDFeJR5kH0UluY7kj9RDIOwbDeg9rDH
	t7YPXvgwFUCDAR5WuSsm8Lj6OdLCC77g=
X-Gm-Gg: AR+sD13Ef6lwe0XJ4o3hRIIuUxZW/vmJI10w+JuyBIBrwRhh8TZ432HzE4ID+3+59wM
	iyvdmXWTcvaucWThlUTgFAMTaRv+ZdijlerGWyqJAqo7/tE1c6KKdDnkfR6xQV2wrVI3/bt0ZsS
	dztP8PtidTeuShAmvenZHbutVYkNdjy8+0AcZ7/fXsXqqi29wPhyTpxRgJMyIGgGOd2OS8xrskw
	jGcFxGYu743vSy2mjN9toDdJ1UnltKHikIHuMa4CMWVduDGjD6VSafuPB/feJzIM7H2txgWPltp
	vVYylG1yaWyRUazpELAZ+7cw1yw5JlPHsQlAJiDRRhPGNA4U6b3o+hO1yJbWAuMeWyMd9ddP59w
	gY/LLPktg4wbU5E3LxMb53IUIt8t3uGr9DKE=
X-Received: by 2002:a05:690e:4410:b0:664:ddca:8183 with SMTP id
 956f58d0204a3-6699abb1fe5mr202165d50.52.1785864295244; Tue, 04 Aug 2026
 10:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-qca_logs_enable-v2-1-587d584ef4c2@oss.qualcomm.com>
In-Reply-To: <20260804-qca_logs_enable-v2-1-587d584ef4c2@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 4 Aug 2026 13:24:44 -0400
X-Gm-Features: AUfX_mxFhsqcpcjDD-uOrczblhUYQso4LgYYmrMNRKyCjeNfybAAYqJkcTz8CTo
Message-ID: <CABBYNZJjM6P_+-mGL3SewuHRdeKBU8_RHomZNy-8L6JtOaXfbA@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: qca: Allow capturing QCA debug logs in
 snoop logs
To: Dishank Garg <dishank.garg@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, 
	rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com, 
	yepuri.siddu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dishank,

On Tue, Aug 4, 2026 at 1:20=E2=80=AFAM Dishank Garg
<dishank.garg@oss.qualcomm.com> wrote:
>
> Add a debugfs flag to forward QCA diagnostic ACL packets as regular
> ACL data, enabling their capture in Bluetooth snoop logs.
>
> Signed-off-by: Dishank Garg <dishank.garg@oss.qualcomm.com>
> ---
> This series adds support for capturing QCA controller debug/diagnostic
> logs in Bluetooth snoop logs. Currently, ACL packets carrying QCA
> diagnostic data are intercepted and routed to the diagnostic layer via
> hci_recv_diag(), which means they never show up in snoop captures.
> This makes it hard to correlate QCA debug logs with the surrounding
> HCI/ACL traffic when debugging issues, since the two have to be
> captured and aligned separately.
>
> The series adds a new debugfs knob, diag_as_acl, under the hci_qca
> debugfs directory. When enabled, diagnostic ACL packets are forwarded
> through the normal ACL receive path instead of being diverted to the
> diagnostic layer, so they get captured in the standard Bluetooth snoop
> log alongside all other traffic.
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://patch.msgid.link/20260804-qca_logs_enable-v1-1-4e20=
9447da0e@oss.qualcomm.com
> ---
>  drivers/bluetooth/hci_qca.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 1222f97800f4..6996966319e8 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -182,6 +182,7 @@ struct qca_data {
>         u64 rx_votes_on;
>         u64 tx_votes_off;
>         u64 rx_votes_off;
> +       bool diag_as_acl;
>         u64 votes_on;
>         u64 votes_off;
>  };
> @@ -698,6 +699,7 @@ static void qca_debugfs_init(struct hci_dev *hdev)
>         debugfs_create_u32("wake_retrans", mode, ibs_dir, &qca->wake_retr=
ans);
>         debugfs_create_u32("tx_idle_delay", mode, ibs_dir,
>                            &qca->tx_idle_delay);
> +       debugfs_create_bool("diag_as_acl", 0644, hdev->debugfs, &qca->dia=
g_as_acl);
>  }
>
>  /* Flush protocol data */
> @@ -998,12 +1000,14 @@ static int qca_ibs_wake_ack(struct hci_dev *hdev, =
struct sk_buff *skb)
>
>  static int qca_recv_acl_data(struct hci_dev *hdev, struct sk_buff *skb)
>  {
> +       struct hci_uart *hu =3D hci_get_drvdata(hdev);
> +       struct qca_data *qca =3D hu->priv;
>         /* We receive debug logs from chip as an ACL packets.
>          * Instead of sending the data to ACL to decode the
>          * received data, we are pushing them to the above layers
>          * as a diagnostic packet.
>          */
> -       if (get_unaligned_le16(skb->data) =3D=3D QCA_DEBUG_HANDLE)
> +       if (!READ_ONCE(qca->diag_as_acl) && get_unaligned_le16(skb->data)=
 =3D=3D QCA_DEBUG_HANDLE)
>                 return hci_recv_diag(hdev, skb);

This is going backwards, we don't want to process the debug handles,
that is probably not using L2CAP, etc, so falling back to
hci_recv_frame is a bad idea like captured by sashiko:

https://sashiko.dev/#/patchset/20260804-qca_logs_enable-v2-1-587d584ef4c2%4=
0oss.qualcomm.com

Btw, the likes of hci_send_to_monitor do have support for
HCI_DIAG_PKT, so btmon don't have any problem decoding it, so either
you don't know what you are talking about or you are using a tool that
don't undertand vendor diagnostic monitor events (HCI_MON_VENDOR_DIAG)
see https://github.com/bluez/bluez/blob/master/doc/btsnoop-protocol.rst.

>
>         return hci_recv_frame(hdev, skb);
>
> ---
> base-commit: f5a7e2ae5f0a9a5caf59501457938eeb249a7dc8
> change-id: 20260803-qca_logs_enable-9b8197aaac09
>
> Best regards,
> --
> Dishank Garg <dishank.garg@oss.qualcomm.com>
>


--=20
Luiz Augusto von Dentz
