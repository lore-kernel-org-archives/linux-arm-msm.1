Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793290164;
	b=IbcmTKuXIrqSXtWwLqr4SAKIbAYSAJ1ZiPjYXZeZrOzHZUEswC8EVTC63s42uutmUWYB
	 wB2DvtJh+115FLLIHA0AusOE+AeB3ZTPdym6m1So7M8gk0cfrQj3VP+oVD1ccAocKvI+U
	 agL5Yikjmv+q/mgLEhIP+0ds0uDNFclH4Rgpd5aQ61wl5ye0pVwBw/f+m4jz04STf9uE7
	 O5lhuqK5MAKUs4ZtBa/BgUDNGRbnWx2hIsVi7ouedonBID5SXTC4wMdp/k2mgi0QUHzKc
	 hsCSxfkIB47sWN0CGrqBVGaQdXCyoeLcesgRVXtCLkujzvebVVdFKrgVMtGgXKcrJLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=epB8RoKxui81tx8KuP3TsTIU8ktJzNyauUMdiyfjpOg=;
	b=OE7tKkhrT7jGsWEDrT6kCFNnviAVjGXNBr18mvar6MeHS9sGo3gtnLuCFpbdcoprIxvH
	 TIYP21Wu2E3l2XVFdBRjjSiSNU+ETKrqUEBErVeJiWIpsA0Zp88SoCvt1lAQx1zY/8QXA
	 AYgtQX+/5TQQRQCoedgdJHvczS+UikcZqwfefhdqRM/zzdlMmYDvwPPjeDjEzYwsi+QJw
	 iQw7Q2uNS1Oks/c4jtGWXgO4AkCTnX+1tfGOiyCAPIywdeCWXOXKMeaZ1jPVvDyp1ySig
	 WegvP0uhREQEKDHJPTV7W8XYk/2LBb9zTMaEnoA07J6WT9AsoAg7Z2TtFSEPjNxAgwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdHmfZmU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD9660A6F65
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD9660A6F65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdHmfZmU
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ae8607e8afso19120107b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793290163; cv=none;
        d=google.com; s=arc-20260327;
        b=GutWiRAAASEjisJH6gx2P0TUfP+CMZanRbp9uRpsQUiaXlCCP9xcR7RUZ8x9rAEAj7
         hXxPfmxzhNdzy/t70v9u04KwKwsAwNYup+J/5lm+8JouGD9JX67hvSU+gG2KDhNLEt8c
         x4wjWjkIgO0cXes6Ajm2w2aheohusQsK/jxuhUVTB6U1iTtwMJKfPElUV9c3w6DSBOaT
         wHkk1i3GE9apQDubKx4MgByRuT4NsKqIi/XIEup4z2guhe2OodaLQwakbmI2jBg912t1
         KG746dH/w7OEctiP7bytOLXgiNTuHJWPHFkKCSP3lsEVC7OG/QyIjbTBiTHegLlll0C8
         vCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=epB8RoKxui81tx8KuP3TsTIU8ktJzNyauUMdiyfjpOg=;
        fh=Nvr+2VV9TROvqirN7/FqVBlUpcBxyCoENflOeLRv+5o=;
        b=rzZ3qdj2p/ozqVoUnK51py9zG9K1QepZERB+iPa4rxehz/ZopNaKoI0wrSdPkdeVjC
         buEBK0q4xjVjcD0beOr0l8CtVYsWrs/8S90WqlGgQ6Q/sGpjFSjGMD4ZbmTCmgnaWPJ7
         f5QwmAwMh5VFLd/lcT6aiOYIBVOJKaUTopHwVqfpjqprHHmGkleGky6/LT/EQRLkh8Z4
         KqNEkebGmCOH1BX7QqBJ9ipS+fdDxmIXBgxROUan+Hr1I9ERAJU8OAYNY5fcH2H3P3JB
         n35PYxuKhk+kndKcjAZ0OJ3k54kf6UquXcTgw+jbydTQZG32Glzns2GU4HbRXoEOxaU7
         OifQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793290163; x=1793894963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=epB8RoKxui81tx8KuP3TsTIU8ktJzNyauUMdiyfjpOg=;
        b=XdHmfZmUHaYtadkK8mCBg6rwoPDNBVSyW86SO5+2wkMAAXlNTo/xBN1h9EAjHQpGPG
         PMM4YwZkRdCMnOvqvDpxYyjWdE64vgmwNOKEw8Bf0sUd7Zgv8EmOyynk/H2TYWTuyW8N
         1QVJmaAnM9jvbUmaOMuwgZQZyJh8rNghYlzpTCBq0bcc0Vu4LLeZKxsAz3+YmXvzIvRn
         nSr6iSzEwrX9FZZwj6koh2AvPknLMrNo9QuLk9wZJS6svBHtk7p+1u8Mt+zeBPFB7m0+
         P06pyH/i578wl474LfGZ/Vc0RE6j6IuELN/8oYeOuweiUH2p8Q79SNBRRQRB0XV/Cxeu
         8U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290163; x=1793894963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epB8RoKxui81tx8KuP3TsTIU8ktJzNyauUMdiyfjpOg=;
        b=rCOXUixH3gHevVVJuQ1EHOhn9v01Rr/bm1s+9Ph8CK+OORet5IRKr7LMAevYoU4gTI
         WU1YX0/tXNYKhEDQ8j+YWFi1LxIQaclUVpR+PEmxUPRUbjWfg50lBrZoSLaDS0X6FEvO
         f+cUrxNnblsL5hlMJAPNUJhraEEhm5WaremCRy53+t1cwQ23VRI6VoRz3cRYphQclM+F
         Yd1yRA5NwL2o/a11qvVJoiDfwbtmsuQw4ZVuZQsyjUB/8epAuYtJxmVlMRsjMlN4ngdX
         EdH3Kfxh23360IsZCbHAES1dbYuIBy5QZCjJP2/DVV27zWswpi67AqZWJveply+bz5Hg
         0NPg==
X-Forwarded-Encrypted: i=1; AKwUvBx+qqC1vR0kPsZJie/zKxiVuQ+QBhhsObftmvEkg0kNbDbis23Qolk1twMo4gLJjGOCbnp6hlDp15baC9Tk@vger.kernel.org
X-Gm-Message-State: AFq9FYI+FVouS6NsVMtCSEcIiDkqaRQIYi9qN8qpVX4GUltCmvIvVHIv
	Qual/UShoF5u16eFRLm8piLiykwX5yGaBid4wwGcricYRyMQrHZrGzGBfYh0JR4uD7RO3R9L9OX
	i7YZ99bbY+YiPLWdcNgF//Z6vjT6qeV0=
X-Gm-Gg: AYBFou13iEpkCqWts1U43b5vkG47TeyBvXLRzSQMXX6gumX4qZf8nSNqNBg4ol8I5xk
	+HnAhHeLgnDhQJWuAILWBLNPZGoKp2pM7juntDdh8+oqTwhBmbZe9GczzmIe5ObNyzW3c8n27W7
	paYt8KdHK4Q8KZB97eA/j/NVP1jmIzlsAnVkieo7z1NvQIwY32i4lMOvv1UgCH8nL6L3QG6wBl8
	iS8OPjVpr7s7xKYJHPi6o6nV+C0bpDYDMv8qkdFAzw7RCrRBrDfaFPlLpq6rmLN1Zt6qaMrV8Kt
	6/1l396CrIqlqLZNj5L7Lcu71ZDGVJkKJXQTCzPSNZTPEpFIyGhEIIaEd7qjfmTw7PLaThkNQSI
	17tP11vzs9C85xxPG4kDGmNSIz0S04fErhxgknPaZiCGt1PW0LXCb7Z1v13LXh/7Ano3je7yP4Q
	jceMr79ND2InIbl1ewS8vn
X-Received: by 2002:a05:690c:fc2:b0:8ac:b167:4877 with SMTP id
 00721157ae682-8b1b5c9ff05mr38036237b3.36.1793290163455; Thu, 29 Oct 2026
 09:09:23 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029094104.2952304-1-jinwang.li@oss.qualcomm.com>
In-Reply-To: <20261029094104.2952304-1-jinwang.li@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 29 Oct 2026 12:09:11 -0400
X-Gm-Features: AclHuK_t1FdhNrTPRKMKSpeKGIgS_hB6YvmkkGhHzb48NiF-9DwnIvkJnl0-E9U
Message-ID: <CABBYNZJ0YZ6hZaRH4jLtKRSdcVYz9_jdaQgCg4RdfB2O9t=TVg@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: L2CAP: Ignore connection responses with
 wrong ident
To: Jinwang Li <jinwang.li@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Jinwang,

On Thu, Oct 29, 2026 at 5:41=E2=80=AFAM Jinwang Li <jinwang.li@oss.qualcomm=
.com> wrote:
>
> L2CAP/COS/CED/BI-28-C requires the IUT to ignore a Connection Response
> that carries an invalid Identifier.
>
> l2cap_connect_create_rsp() only checks that a connection request is
> outstanding, not that the response answers it. Add an ident check
> against the pending request so that a mismatched response is dropped.
>

Needs a Fixes tag.

> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> ---
>  net/bluetooth/l2cap_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 83b622a42811..70ad30b091e4 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -4480,11 +4480,11 @@ static int l2cap_connect_create_rsp(struct l2cap_=
conn *conn,
>
>         lockdep_assert_held(&chan->conn->lock);
>
> -       /* Only accept a response to a connection request we sent and tha=
t
> -        * is still outstanding. A channel waiting in BT_CONNECT for secu=
rity
> -        * or the feature mask has not sent one yet.
> +       /* Only accept a response matching a connection request we sent a=
nd
> +        * that is still outstanding. A channel waiting in BT_CONNECT for
> +        * security or the feature mask has not sent one yet.
>          */
> -       if (!l2cap_chan_connect_pending(chan))
> +       if (!l2cap_chan_connect_pending(chan) || chan->ident !=3D cmd->id=
ent)
>                 goto done;
>
>         switch (result) {
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz
