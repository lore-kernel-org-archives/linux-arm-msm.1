Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876399;
	b=xB52Q7gfrc52sN4ao7QcgQvl9Xa60DTvlDzT3pFRalH5zlR52ei4OHpdKa5wYsryVH1/
	 l6XiO7T59QkNAr0X1BBiY/i2xfOxrbVLl7xCcKLGMiJUME62yNoPLwXbzztLAsUb5o+e/
	 lcwYTzj+63IQTOqm7gm/HOAEEkR2yBM9bupaVsJR6qla279NQMgE7kYob5edm33XMswF6
	 LqXmzPrdoVzeFq+EHKs9LTyjFJCgrxLoJ5MrYILXSfaAHGN1L0KlUDgQeVVaomxA5aY8f
	 uouR0p9PErjW8Yp/jDcy44EBEF0EblrMJBcL9v0oig9OEIDGDe/Xq0FIe1xaxNDnlIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
	b=wi5mqJuOl/Fd09tTt5h7iEBk/c6uToIU5193R2j+TwhxYbdTeZ6JMUPedj/EZUjTA4g9
	 VJ2rBB/fWS2w6sKSAZhFVnUqKsjJRo+EojeHFmXijC2z21WRjdFOUjN1TogEoZqnvSAl5
	 i3r5CgYu5RDmiaJHu93ZWt7bt2Uy/jGNzwsFDATHHR3JLkzmLppW6Lad9mPhd6IK3ItDv
	 EtZMJByCTYr3l8s9/yFf4ZMaAALIssuiWkRdjoI9Ero9Nqn3YvjSjP5nTOzA6z4kqllGN
	 uK6JRAcyo817zNY82xB4GrDXhCp8OjngQEsqiMRDkJZTQWZoAYsDFSn59HhoTQEfR/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQr0kFNb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B308606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B308606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQr0kFNb
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d28f75d62so48701866b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793876398; cv=none;
        d=google.com; s=arc-20260327;
        b=cq7hytZNwFOvRYZ936RSaaQy8c1wWApWg5Ryx7nFhZMvU852lJ8+C3fBna9fzrAcFr
         K7uUneoCXOMGWOqJHD+cF6nzsTVT1AtQFuxbVmJdWT+F0uCI/bbOwpS5Dedakqxsx7iq
         lfbXzI90vwjDwlU5jc46feAIVrkv1lRUaETRQHdNai6eHvnWotacUpNG77KM5JB3Dfx+
         F/XK8kLByGZpHHMS1gcAUJScXu9KdNltYTllmbkhTn+EHdl5AeLGk0GIbT6LWX9O0boD
         0oYybi4f350xSWlqpBl9qpmLDGEkFAOijKPQQDOxG73wdrJXHAFrgSkEnapcXUIeKiEz
         ALxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
        fh=p3phTcfCaNWKbT+xjTWEJaqsjTU3X1OzJv8n4eYqSAI=;
        b=nwCnk51VSG3TXWt+TsgpT8dDfTdV3mEcY39QJsH6Lk5G3OBL9DsxqISXoUWzkYkISt
         WtFqjOrEwtP9INOYsbT6PfO+NsCvISfH9E3sKjhGcUrkmYg3CxnSUtE6ddL4TXr7E4vl
         DwvFeYw3ikMs7XZU6BTjrcL92tIhFH3ddxWpkeG+8+/kuPdn6gfSAdN8re4Q4DMU3f+a
         FtupMhW6ZhwoNLgI3g3UNR2LGa6p6aJaveGDM+6s8mWyooouUA6v2hEZ3r487nCKcXHH
         CzEhWCRHxCohaV6Rz7qK69wkDZKqZgOTsjgo+4HZDYIp3wBfhs27dyrVbyBDH8cIXi5X
         3VUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876398; x=1794481198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
        b=uQr0kFNbU7xYaLOjvT3vxuSmVKE8PdIQlZfkWLManzx8N26orhPmHjSAwxX/RGFuXx
         PLddFBAfJJtxwn/5Jx7nf+SEnmJvmX5oDdYxcR7Pw9u7d5VsUIKpKA3hdUyj0u85HiPf
         /8aBxloPuYO/4udYDkv7QNRPzML8LadtVqffp0cdBWZmMvIpXshDmWi4ZGa0tKzwni/Q
         RCxquIRd4O4SnzD5VxMO2Yp5BO9x4c2GeY83iU8uB2ImfrL9nO5897fueIPLsqewGwrx
         /plSTVyIw8rv6gd5/7a20W8AnQHIBUHo1DUjtAUdCqR7U9T5S0IJ/5mCfO967Y30eNPr
         C/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876398; x=1794481198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IDkil2Vu8KJtD0pRC1JpHyRbwvvq9lkgInJecuVF/g=;
        b=uRKW+KBy2OtnbYxyAcgePENHTOjge/jaRjlaCFAH0x5USrHumiXHZo0QotWxT4RYU2
         4BYNek4mhtGvF6XbmIrCICMi24ASvpgK+TBKmNQW4mNx+Yh/pcs7pcUVX4VqUUYHXeNX
         BWUTO9JCIbzF5yQFCdE1PNaOLBDfAlS1YZOPCzTaoI43fklQbNk/VIjdrecxhuz/Y2Pb
         298ynJYEvu1a+K0LUXA26suPSJ7OGnXucTQXyUqdCvESZeABhcIaBTXzIM84/vf7HxYg
         /bMrakpnu4+CEr5Uk3kNmYTcaLJoSEhwepp5HZ+tvyQ4IDcQkBA/ChRIK4yKfHVgy1Ga
         xhyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV58iTAHEAO5WeKgnh+fb5rtylk5MWSmj3IXXgIaJPuCvLtlxbJHmAssvXc3e/XMyFjB5Il1wAm2w8R6s3@vger.kernel.org
X-Gm-Message-State: APuU4Z/Els/dAGM4NHJm3G59Ss5ai0Sxj0KHcbXOFTzq9/PbOqz5Aakc
	P1xJzvgz5aHyD7lSCAUEUiTn8pwOGKXI9zVd4J0GNIK2O6pruy9Vi4wlDYIeBtS7ew/y3qDWJ3y
	+66vmZhnC3mnXws+SAimCD7pwlanEda4=
X-Gm-Gg: AYBFou0p2ZrTrXdIVERLxDXTeCZGMJQ1+8fweS3D6BX2LOj9jf+VT/cJuvhonxFCpKh
	hftHSX1wn0SAz70ZCLB6OSbxwJJ4Vb+4l5ooHYvfKW0WDgo3lrv1zFkjziawS2YufYbgg6ZPCpt
	faIFI9bcv0iHyuLjmaqE170OWDFLdDiJFF/6UoPr/UwaBTnB6TRSyfeKyMb22uVkDdOdXTHY1GM
	3RNW5AEjRQPZdDUCYQwWgFkJOutJ/I9dcSNYyVP49sgh8dKafIsYWZiz619N4pLAbTkLrCwdf6+
	4PmntRWiSvmwwHWE+XnjG+0iGPAXJpiJvgf75t0Bwx5ddTW4fwJ2zL462v2gL0+sO4lGO2ZRHm2
	1p5Ti2S+0VvivPPzjC1fJDR9oBRzgPqBrgvz+hoStZq7jP+GZQYZ7cxT+u8Lm5ezLfzkc3Q1WZ+
	LQ0o+Ft0fP+d37JrCTXyzXBTcoCQl92cdcG7VIWyXJkmsTmHpRUY9RHLiRFGjV7V1OsLBbL/UyW
	8Ai2EMwjxe5Vkos+/tf6wStjjLa9Cqmdj2UndMCi1aFc/WfAPAhKiQ/6R5NkAxbGgis8yt45kUJ
	gWLQ2oU=
X-Received: by 2002:a17:907:3f95:b0:c46:8b87:c1f4 with SMTP id
 a640c23a62f3a-c4ca7a86e98mr1520903266b.20.1793876397539; Thu, 05 Nov 2026
 02:59:57 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-iio-light-gp2ap002-v4-0-fa1cbaad2ce5@rudorff.com>
 <20261104-iio-light-gp2ap002-v4-2-fa1cbaad2ce5@rudorff.com>
 <autr3DH6UZLY_ys4@ashevche-desk.local> <ed75d869-c51a-457e-9cb3-6250029d4ec7@rudorff.com>
In-Reply-To: <ed75d869-c51a-457e-9cb3-6250029d4ec7@rudorff.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Nov 2026 12:59:21 +0200
X-Gm-Features: AclHuK8zK_VKtp7fvak-P7kamZod1UIl3e5bgYtsqibH1ihAtEl2wIiK2lVgYCA
Message-ID: <CAHp75Vd_Rr6pFsTwpkwBcA9Sn74Npj37zSau4APMad3UE0U5QA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] iio: light: gp2ap002: add led power supply
To: "chr[]" <chris@rudorff.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linusw@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 12:56=E2=80=AFPM chr[] <chris@rudorff.com> wrote:
> Am 04.11.26 um 18:31 schrieb Andy Shevchenko:

...

> > Missing '---' cutter line which makes this patch invalid and it may not=
 be
> > applied (your SoB should be a tag and it should be last in the chain; y=
ou may
> > conduct an experiment, take the message ID of this email, run on a clea=
n Linux
> > kernel Git repository something like `b4 am -s $MSG_ID; git am ...` fol=
lowed by
> > `git log`, you will see the issue).
>
> Sorry. I ran checkpatch.pl and b4 check and they missed my mess ...

It's not handled by tools, it's for now just common sense.

...

> >>      int num_chan;
> >>      const char *compat;
> >>      u8 val;
> >> -    int ret;
> >> +    int ret, vdd_volt;
> >
> > Don't mix semantically different variables on the same line.
> > Try to keep reversed xmas tree order.
>
> So like this:
>         ...
>         const char *compat;
>         int vdd_volt;
>         u8 val;
>         int ret;

Yes.

...

> >>      if (ret) {
> >> -            dev_err(dev, "failed to sett VDD voltage\n");
> >> +            dev_err(dev, "failed to set VDD voltage\n");
> >>              return ret;
> >
> > Unrelated change.
>
> Yes, but I'd still like to fix it. Ok, if I mention it in the changelog?
> Or shall I drop this?

If you are eager to do it, do it in a separate patch.

--=20
With Best Regards,
Andy Shevchenko
