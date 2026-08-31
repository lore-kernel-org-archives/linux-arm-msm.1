Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E372E62A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 00:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788137951; cv=pass; b=Wd4B4qtKV+kB2JY7AWqFZFrIjAKFBBdp1F08cUmE4lbHGkrFPZto6oG23Ah/DjOKsVDliFXPTntugw25P4sLrmyKR+/atOpGzn5IKjXsP5m00ToixyKxPxABsx4YRo0WNBgXEQKtk3Bs1rDRfyGN5h3+RZFUn56gwC9vBc+CeYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788137951; c=relaxed/simple;
	bh=K0NPiNRI+HC21r68OCJOYQCoR80z81MkxKVzw6oWvgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9cQpZrhX6jfEckVeFvYAGopBKq6Eb7zlNp6hzYKhsa8khDFw33dl2pq9sM8U7pF9AGjywTewbpfJI/j3BkdA09IWx6LXfbhvoE7I4iDmq7wt3VL9Pft9koqdXd6nWmW048aMR30T4+Wjj22ODPAJiGma95iqNCaovvr9PCoxBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2020421077so436399166b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 17:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788137948; cv=none;
        d=google.com; s=arc-20260327;
        b=mabcJaAKW2RXhjxtEt31Klqr0cF09lYiAeddRjdQTPr2VuT2xIny8XsuJUQhtoQDOh
         PZcZUMmXYlzcJ7PyvFjUZz3F4RZ/u7RpeKcbkQIF8RiC81fF2JGmUXZ4u8ABD3qZuyEw
         CBxGcze9voyUom99SGH5CaKmqwEgvKwRbLlWokyY3uHzI/rCFjZsHWyXWmEhiYIzdL4V
         +reVzlhGo7GjNHIr9Chl/kqzcJgz9uciGYs2Z8Yn6bzkZ01GYufyBpZwOGrcQ+xdzl9c
         9+H4P3Ep09kc/gGLNbv49zYL7zOvmOgOAhNon7BaHSrMEGc5j0c//AfVeq6CZMfmUr1x
         5Zdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=K0NPiNRI+HC21r68OCJOYQCoR80z81MkxKVzw6oWvgc=;
        fh=HWafdm68ZuZwWXVttfbZiGJb44pLXriNlAoXKEiFViU=;
        b=OYwaPVW0o/Mm6sgeMitxE0KFyjQ/6nV78DLPl0+1NqkQri60SUTbh+fvGxoAsCuZG8
         rKHoBeYKD8A1ozkeZti6pbzsCYP8y5+ywKBEa7BQNp9HZIuXxDt4tIOBYl38rkldh+nB
         pu67mDAHicpyRQT3U74aIGYZCNDc1YA3KincMB19SO07Y+Ct5Enbu0qie/nBTvCr996L
         /x+Z9BI+advnPz9aLe4pSuSMTTAUm6dD7lKWQdpFcRcWUv5U/1u90X/g8B8zaxr5peuQ
         KewQFnc/873y2nLPeSINjHcwUe51W2DepVUGfz6uz7nE0tBVfCaXe+jUcGAnp3rQdnDw
         nn7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788137948; x=1788742748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0NPiNRI+HC21r68OCJOYQCoR80z81MkxKVzw6oWvgc=;
        b=f9XbWnkmLmumVnuvNb/vy4Yq8J9cSZ9FGM9122/7Io4stWHkFqMMINtdjLNHcoecIv
         vqlkTVA+p0JFCQnZ873k+lGI/luviuDLBstqvfrw2gAtKYCyUmtm1SUExj/Ky31vRGQa
         wM0saW+P9CruoEkWU55oU6gidwm3q9QhUY38OxyxapflTRDef5XN4JD2gaFN5ZnHsawx
         /uFeaJICgUPcDp6Lzs83NE+vLDs4lp52ragDDYU6mPC9RCGuW2Wr1XUQ2GbiENqsMhmR
         YFNqPPxxCI7/xNamWJDdl0XNXcfe2f6yUC5hVXWUSt2E7TX4hQtfHTNJ6sVIiJB0ppPL
         485w==
X-Forwarded-Encrypted: i=1; AHgh+Rpqa+sXCDgxJNcbwQo8CZqmtdQeDrAIgE8+7t+j5X/dmGKd6951YATAEQjVMfwsRgCJkUyRvMqTizlwmGoB@vger.kernel.org
X-Gm-Message-State: AFuF++mGxTTM0odLQsuc2n41PPL8bBnRNddoBhkIJZQQg8K2V3wGVlf2
	21Nu72kTl91dDrNSXnsVsklKPuLdSmCzIyqnu3HKT6td912MdJTG6ZMQ3R50Caw6kXvFhXLhCvF
	ImU9JXM3z1Ok4JEbC7zuW1GE63h0vALlqlz+/+VyaGB/0mIgFzfvUFcKhd/4=
X-Gm-Gg: AYBFou1isZmRe5qzFn7iTvJcEUBvYwgDEGMCLu1ejUn1eFP6jfdHDXvWiAYlJx1WrXq
	4+2WLg++AilbLF8JICEQjocTtJMbvUytl1Z3DhhzHlX9P8dfgXiGzfURZGyXwpzMS2pOIEgzKmC
	EXh/ohtyC8cxfMmT7yAJysBso/zcxOWVluzkknFguvqKurAYc+MTxnOx/LLNe1LysVgKBKzbQRk
	kwG7rMc7iZMUdJDL/dQbfxKv6UQSKK7gnx3o/D5BLgxp0Xprk7vwy0APw451GlH2iGhT8LKXzEG
	8lPYKq+DkJIhL78j+bglsp52z7veJBvjvC/SA6NS27/E2N0ufdwFd8+ostPPaehIHY3IoNIRE3z
	0zlTKIWgtfTAYOHajyWpNJf8oo7hem8xW9A==
X-Received: by 2002:a17:907:c08c:b0:c1c:3b06:ed03 with SMTP id
 a640c23a62f3a-c2557423bfemr1484338866b.23.1788137947985; Sun, 30 Aug 2026
 17:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
 <20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com> <20260830165934.34e5b82f.michal.pecio@gmail.com>
In-Reply-To: <20260830165934.34e5b82f.michal.pecio@gmail.com>
From: Matt Eaton <linux@divinehawk.com>
Date: Mon, 31 Aug 2026 02:58:55 +0200
X-Gm-Features: AcwNN1Uxrxe2Vm3t8yDU_lGXXkWAxlZ0xh7uDmJiOIsGJhTP-E-y535X0vUdkyw
Message-ID: <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 5:02=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sat, 29 Aug 2026 22:04:10 +0200, Matt Eaton via B4 Relay wrote:
> > From: Matt Eaton <linux@divinehawk.com>
> >
> >
> > xhci-hcd xhci-hcd.1.auto: xHCI host not responding to stop endpoint com=
mand
> > xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume d=
ead
> > xhci-hcd xhci-hcd.1.auto: HC died; cleaning up
>
> Hi,
>
> Does it still happen in current Linus tree aka upcoming v7.3-rc1?
>
> Similar problem, limited to the specific case of disconnection from the
> root hub, was found on Renesas PCIe controllers (it looked like some
> internal power management interfering with operation). It seems to be
> solved by avoiding Soft Retry on known-disconnected root hub ports.

I applied these (from 7.3-rc1) to my 6.18 kernel and appears to fix the iss=
ue:

commit e3d757dc9257
commit 042aad8d0db6
commit 7e0ef4332ed9

There does not appear to be a need to apply this patchset now. Thanks!

Best regards,
Matt
