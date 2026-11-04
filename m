Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793828813;
	b=17T+r2oTVhlkcJhXkI2qpIbzcJNeJHdJZULYNPndJopJA7UDA7Exvywya9wTiqx0a0WE
	 DehwJh+U3KMG36dcayk0UXbc+z+GdyAkzuU9u110GUp0e7YlcwX1aRV41PwX6XbG5g8JZ
	 7AhU99uYIGMiHAjy9g2UBpc85BlwuWlsj+wdMhTHRt22BfHZlnqugiJI+dhP5TmYW5Nkv
	 g/UnLnfUvYc3WR8Fq9ecWSztzC6WcqKV8dSupZfryeVSLM2ib9uPVLBIqPk24DvQxhIRa
	 HPHvYgDgOeBRDpwOOuH430nD5UwL9djagEtWyFIuPhaGqj1PPm6BiuZjK2+bHmYyzRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
	b=F4FL4DUM+nT+zjCS0eUzkMYKEP0GdxBGZqx0I/tgWnXQmW0NrqkeuxeoiPL38fYYkfGg
	 aeGzIt/UB6GX2XFIvou1AaKmibanCMlhHA2gRcH59A9b3ctyesYP62mPrt38MDk92IRXg
	 3QX1EiPXLqKoL2i5q0+6559CIsn4/jUnXrx28uOQP5UzTcEsui21x4kqxy9BdNZ5RXPor
	 SB9i6jpp6Um8pSxSXCl/lbBvtkYscJhborwK0hOrPnjqFIQPezvf2Juj/JKLZZ2RKqlOH
	 w5m8W4dhFqTMtXAf6uGgWNlw41ZDc7RtSSkIYBKQJUdhN7CiR4wbJdiL2+dWJlOiUpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ewe1JQDx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A992606F2B1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 21:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A992606F2B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ewe1JQDx
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso3784a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 13:46:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793828812; cv=none;
        d=google.com; s=arc-20260327;
        b=KXRb8bH4skWY+l6KLDGBH3DBH1BaUcIjAEx0rSOGoEAMlOCXllpbkewy6JKPYF8j2Y
         s/dMIkHVBTYAZmhv4i/hyvwB+wF6yIVxaDUB2bEXfYn/qa3iQtwM66Q/NyF4glvussGQ
         gX+HdIaK40OCyZHlxSfzfrvW40Vav2FGXrS4gShmjLL5Kv4IKzTCXfGxNFDmwUWkIalt
         +BbqVnKoWo0yXCWngMjVvNaQlYGpUfIcYNC1LuFzp0v20vGml6sWz6J8QPTvVCH8lU7O
         7IdA20GQgw/jWXXAP+EYVhvwm9XPcWDSbUOC68gd/BKT82RNVr56FboiszOORJ5bIUrC
         +3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
        fh=6O/avXvVsCvNCVjKBDFZxMNNNV27BS2+fNZiRpLIyZ8=;
        b=dlsgxEmTypCwr2x3CPmYDnZwig91/9OrmS9asL2Lb5UghTFJOyOb5aBv7pAT4QyJdl
         DJgx73Y8xB9ihBEOqzaBOEmog5K6zzxsinPa0i+lwQACqHrC8X9EUZPYjnt4wQFnh2px
         NC+OEuxrqJ2c1Os/7c3M7c6sF0GfJGRL9xa5Bsfa1zGFwb2wBlT9e3AxtoHH2hWsgf9C
         +/n4L+o3XCAiUpEmna1z+euf+YpGvnP9UVCyH68cs3DGJiPYb4JUkTbh4Xhnm9WN9mJG
         QtkpVXw6b24L/AUd2NiUVzkDq+epRuiB5QkBq9kQ4riKD22688qdnvJBLuSJT0tOVaAr
         2FAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793828812; x=1794433612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
        b=Ewe1JQDxh/OpRUCdClFd7Kz1BJmW0JX5ObbSRd6Ekyr6w1rdIhE7jMbdYwplY3NCKk
         g2aFJz08a6ruEkG/lNyZxd26EKiGj86XAMxt7uOLgX25eme/UvJCfgY83ENm95r5k1h2
         qiYJWnp7FGT0h/ykL/xzAKDzuumb6PYNgVmBtJDl0E5vVOEJZQlJ5OKiOOGlzhKY7pgK
         V50o3jeKznfmSCKKczWrp32DcUEdqOkaOEbva0veDWOkR9ZHgsPs6Uq3t7MUWVnJtiJa
         abilpf21PQjXpK0rSl0BW25FeskGFNYkmAYeYPtlNoFAo3KDu6Tq85Tc+PymlrpOJMrG
         33OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793828812; x=1794433612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
        b=POvV2pMDdBoH16daQXs4IIuRfjc9o+nqDCH2EERQE1F/B8IC6f8gfJQr0oVPvKxetN
         ShGE3AYBGut3BzXHFefQMgB7v3ZwfQqeAeBpoMJbclt2WOr+/7lNEp15GRUoyDksyVEP
         GokglmYV16iVaA3bJ98bH83nNA6Fj+mExB5j7Pq0hT9zVNFvf0/vl19PKPL2WYDdcfQk
         CV7uGvO9TRXAb0gnr4AL1koBtJu19YrQlhEE2iR1DpuoIRxaIenk6kqO5BiWvjbbB2lj
         63kGZDg2/g80w21Rd70m7d5TCbjpTf8ORw4llL4OvhBXfWKRmDFWJ6mqHdnTyKjKXHoz
         8kfQ==
X-Gm-Message-State: APuU4Z/1pH0Kxf2J7CrHB3LfpD6TPfA1ydUpJxkkvW27tzdJVebJMzdN
	5+AIQ16NQJ5d75NAzyylaBAJptrA0YaswJXYUksCeqfJ2FyEw+utWekAb8yQZzMdhoyqxLYR9+5
	6G/9hHrOJ2ZN3HLjmCxDaRkoQm0pxWYrgkNvfyGGV
X-Gm-Gg: AYBFou2ixboxk1WdZcvKjcNeMCDMoB8FsvRafUmCCKnP0MPFeHtu6J9K9OcNfP3ICNG
	q9GUeCx//qxvnPrzLncNCQ1DITNeBf0PCyepeuVsltrlLuymP3C1Uj+wOTMwYrR5ihhjFHKkBlr
	dMHCsNZ/EfG/9luhmVNjqSHhLKT01vj6qshBLtcNLZgOo2Yb4qJyUtyLcpId922hfJy/CU96Zti
	QSf6++zy6ygEnBNsm6gNyXYbtXykApSIfoT+VnO+dVYBV3Jpp4mxFz737x8mfHXKGiLDNsYIzzn
	pQ3kcZwJXKcQwuTiqQmFe6UbK1CMJ8OU+HPNsvHE11W0gR57gN+CwLNmRin0kkBbWCTQ7diClRP
	RAqlotQ0PbL0VKyQ/4sj2z0BRhDDJHpOw1Ws8rsLzh69DGg5rFoodIy2uKAvmH7/rbcnKQA==
X-Received: by 2002:a05:6402:7cf:b0:6b5:65ef:440e with SMTP id
 4fb4d7f45d1cf-6b57cdd26d9mr4477a12.12.1793828811278; Wed, 04 Nov 2026
 13:46:51 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020180804.140766-1-smostafa@google.com>
In-Reply-To: <20261020180804.140766-1-smostafa@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Wed, 4 Nov 2026 21:46:38 +0000
X-Gm-Features: AclHuK-hVkemMHCNU3tA_P7qPrbGUQncvgIj5WYJYosiCeTanBP84HUm7Z_PAwc
Message-ID: <CAFgf54pn3=gsB=3zCsr=6xKU7hWtmi_sxdA772vhzdAur=fZ0w@mail.gmail.com>
Subject: Re: [PATCH 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
Cc: linux-arm-msm@vger.kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 7:19=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform
> to assing the QCE/BAM to VMs.
>
> During unbind:
> echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/un=
bind
> echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind
>
> I see a system reset quite often, looking more into this,
> that seems to be related to runtime PM, with those fixes I don't
> see that anymore.
>
> This patches apply on linux-next.
>
> Mostafa Saleh (2):
>   dmaengine: qcom: bam_dma: Take a PM ref at remove()
>   dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
>

A gentle ping; both patches are reviewed and I have been using this to
test VFIO platform with kvmtool
https://lore.kernel.org/all/20261024161902.2093581-1-smostafa@google.com/

Thanks,
Mostaa

>  drivers/dma/qcom/bam_dma.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> --
> 2.56.0.212.g129ede20d9-goog
>
