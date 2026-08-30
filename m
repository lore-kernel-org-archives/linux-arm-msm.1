Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F95325C818
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082399; cv=pass; b=H9eyhG1RboGrqlQFw97cyCsJtkgdxyrTfW8Z/vSwZy+ZOI6MV3of+vA/EE4IFAX5AlDGM1oPpTuv/gO+AWGGQiObggY2GrXn2sOCe/7ZoreZyOs3HTFvZpXrmijECnfNYPYQixjQSbq2mVlVzOkrgQvdtLAL9xonexxVn4wRgMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082399; c=relaxed/simple;
	bh=XjkYzubNknDxtSLcJD0OSIc3FWWZftOwgASfjFMJ1JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3m9QOl3OMQ+qwr6uS9KVaC5H6BLtORntXgGffou7sZYQv3vFom8d9dCB7C14M6dfR/vcK0i+mMqa5MNi//bxqShwnbF0egIBpWdRRlsLfAsJk9Np541M0CiUMmtZO+fjwk6qHLUUZTsu4VFCJTJwzqeXp2KM07LkYTioHcj+Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a611ba5130so3034846a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 02:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788082396; cv=none;
        d=google.com; s=arc-20260327;
        b=oRLGhawQpU2d4X5bqwIrNlvpwAfBrC8qnVGhRSOp8Mto5AeeNpL8JsHRjFB6Wf1w1B
         lBnsy2bZeb197GtLUgGGr3H3ld3MLwQSXXUzAZ9/GAaPpzsfemZsOwhxVAKDUdVJ6qel
         bEEGhJNqe0I4qVAiVBqcF1nT6lq1c3VgElUT+Fnq3oiEfhLZKOoNlMqTRfIvRYl2bjRe
         XxkHGNEMChU+TbLZIwnIC67tVQEU0TQu8MXOPrQpSz4Elf6x23lYpvhHszjp4YeRR5bc
         /2f02flc4Nl5Wgb5Y7T2ES+D9wdNuRIJKkTaw0wKNyYUVXni9utBqhWT2vQargOzb7J6
         +0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=4S/Q8LsIlAtco+cE6yiBQGlAUU2xKF533bVW2yFHbcQ=;
        fh=Rxemscxo6ZLOQ6T5l9O/Wf4mxD1IEF/uHjp77qq7tqc=;
        b=hYfd/7RUF6AA3Hx7IDaBilmf7EAKGRArzyQMHMoZC11EwCkkG9h2xUm+zAUEDQlpmg
         loEyAGLbW+49BgJVl2eo4CGfC16q1QJbKuTS9/vgu3urxuZmJey527V+59JOh9RO79Sw
         qhzxagbiFB+/gB6V6SH15P0SwqBWA6Pt+P/z/1Wih//1Ib/dTr8F4AcpqdMpS4nsqjV1
         0IiLpyBPURSSvZS4drjMh+Sinw1s+ZDdDSndNcvpgGeH94Mq+Wawu3xZ6pBMUp3GgoQ2
         kAmVtDUgl2g1fARZC6rqDlyDabksIC/+nXJAvT0fyOXtIHiqS/OAqZDt5+xI/NqhHOs3
         Ts/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788082396; x=1788687196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4S/Q8LsIlAtco+cE6yiBQGlAUU2xKF533bVW2yFHbcQ=;
        b=EHs3n5BEu7roAJ6+swZaSU1yWDvrN3acNKvHB8X+WbhIjw6s/UC2R3c6wgJuTvQnlJ
         sB+xiYaADDVn1bTcluoktGOTDag0ghrDr5eV4uCAUa4SZG92gWhkg7cnorUNCKjgLBOf
         KlEk7nW0QIKFZ+a/jHAP49ukrYbovNBGPuciYnm5cCKlZkJaylCGwC7ptae/x7cO/KCZ
         C4Pl3un8D/p2nrmlWjj5G8lFlBYfrqr6E1vg4ywkwNlzjlb2xnzCgOalnGSlY9xNZUsy
         qLtC4+z4J/ZrfqpxaKc6VAqlrEHWMlk91Tj+R+eEBcY2+xTSnNmZh750tt1mfNOMa/Nm
         T3tw==
X-Forwarded-Encrypted: i=1; AHgh+Rq67XBxb54Gv9ToSsTzKyqsPYgb5n1Xs551Bd6fumAbNV+DxTlEJXA+fR91Mr4pbsZxv+U66MhFK1Q9/rkh@vger.kernel.org
X-Gm-Message-State: AFuF++m00jQDyhlGH5Paj8xb+eFqdRhdAl87IZkcghejm6hqU+KCn9ST
	mZriFd7Xc4BJOLC9jm0xAQrOvNSNPgnT3UKtxJ/mz1cHxN5a2AC3aJc1NodnHmyNUYVSi9Zr8q5
	GohSmlhgcYyAEGA3jV1v9DxxsF4M2z8Kmb2bIZG0B
X-Gm-Gg: AR+sD10+Sdf2NtEg058+2KAzjEARJ3S8lX6r57BJUFSI066I8QBcaN1+APTyJLG6xyG
	ugsOPLSGMoTgeZb9UUnzdE7l2KY2aKQEebBitF6JHMNQ5cLiacwBr4gD5VAqFGtbtzkPVoFkdfE
	SOYbti1qgX1dF58K10dh3AGfnPGVVb7PdWorVHMkb/8yEDOYgMFyauHiWF4mDQZyT16rgdLgNeL
	Vz62tnLUkBKicCCMH9WEZVQNY9plVAlrmEwIdREheurDuUkiCfDeD+xaox8rkd5G3BG8VA4OULJ
	WzwwEgIhr3os8f3XVVmS1FUGVr8kljzzDOPY0902gugL8SGHRMKU9Ale9F1/Fre5SsFRRwZ3HOs
	cP/c+Mq+ZlYv/zQvNLV53e0a6tjEbth5OgBs=
X-Received: by 2002:a17:907:7a13:b0:c25:2e93:289e with SMTP id
 a640c23a62f3a-c25571deb5fmr1292724366b.16.1788082396393; Sun, 30 Aug 2026
 02:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com> <20260829-xhci-no-soft-retry-v2-2-0efe22f1c2f8@divinehawk.com>
In-Reply-To: <20260829-xhci-no-soft-retry-v2-2-0efe22f1c2f8@divinehawk.com>
From: Matt Eaton <linux@divinehawk.com>
Date: Sun, 30 Aug 2026 11:33:05 +0200
X-Gm-Features: AcwNN1XMIbCJzCRFD4Hg1pCFjnrmfyXU44jNCBVbq9X8JPUOmt7-zWV52VzJ6iE
Message-ID: <CABUBpLfK=w6e-M_TV4BfwX7EsUCLaZO7_GN9_506yHvBFEWJEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: dwc3: add xhci_no_soft_retry software property
To: linux@divinehawk.com
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 10:04=E2=80=AFPM Matt Eaton via B4 Relay
<devnull+linux.divinehawk.com@kernel.org> wrote:
>
> From: Matt Eaton <linux@divinehawk.com>
>
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index c5674161b2b0..e22a8dc5d090 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
>
>  int dwc3_host_init(struct dwc3 *dwc)
>  {
> -       struct property_entry   props[6];
> +       struct property_entry   props[7];
I think this should be props[8] now as it should have been props[7]
before (latent bug?), with the last entry being NULL to satisfy
property_entries_dup(). I can do a patch v3.

Regards,
Matt
