Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24DE33A014
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967193; cv=none; b=KR337C/lQ/H3xaDdOadu87Pv0Mbp9WGrv/hhswMHdgxHjUks85gLsdETZTYEEl0NBx5MKouQ/X9zCFnIp1YXJiNn6rs7HHkcroFQGExLwX4kfo4A6ZLu+cGMXbmxW6MnwUccG70ndOI30ykS3HEgB75VVWCPsa8W0xqXr3ard3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967193; c=relaxed/simple;
	bh=mQVTvUE5EMefp3N9PRRXFy1qIjow9eV0PSCua1TgAD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+kOEsC2Y8BdNVQ2++Rvzs6FDeL/g/okI7HTxmfTgHtVxrXXFPfuXiw5uACK5Gcnh+4JqJvoon58SMN5PM2XZJOqTRR6ZeO//zjidoF1jcto4ydgD2V9UTFsdi0UNxg6mWcF4SqC7z5t4x6ISzt1+/RGf9F1n7Kk3+n/gNUXqcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97ea365dd5cso3552265241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967190; x=1789571990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ck7KwbjNu626e6RdS1sR80rNpHN5osHYGNVSLeBH+E4=;
        b=oG0UdVT9OzQ0vvvYx+1CdKtVQ+3SAsvpzbUJThCUzekNztVUkDEj5kLwE33NBkqC77
         YE50YFtsa8PVaTjWC4pzwKDpVP7M7+gJRBb7O4vfAGfA/5iqTKHURbTkoYjDgyXAfKgW
         wKUM1LrNm3Px3VBTKCLge0XolO4p8SiqIkb7SsxX1QRzmgGqOf2g9bfjJ1PrteszPyFD
         39FPShneHe+Az9qn6vPRJyU1JSe6QjA77rzKy7LSgQ4q4Ooz7Kz43/AVsgcW5gu500B6
         A6BYvjkMdh+muYBiLu+E+7Y4Iw08vKLi8NY/dV/ZyXqFluf1YjhFxHB5p3ZkaInQvHFX
         6GwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrnr3dNabVIOnpeAIL20ydi+h2zpNvcNWVbLaEBbUKKxHdKHhkQn4hF8ax8wC0HcUqxuElu2lOMeeBhXcq@vger.kernel.org
X-Gm-Message-State: AFuF++lE3A5nqvdUJVXmJzGyclmIW4XXMpHjWcCvm33feVMyU+AQJk1L
	yqKHLQocz5kDnv0kHOQbQXNV/GvJhsf4/zDr4MHVw+i5Dx3ZS4pJXLCTJoWH9FOUpNs=
X-Gm-Gg: AYBFou3CbQVVbPcvQuxMQ+mGiCpbK8nslImQyet82GTn1WVK0D/gy7WZHpfoHEEbpbR
	Fm4T7DQQRA31SXqP5g92XIx5On4MYYs/+0QgllaZ7cuI3FedqlLSEtjGkYT0cjZdtQv1DjoZIU1
	RnJXS+1jD56BzoAvbFNOIzakLbAUM7wN5EbLdkNYXz+8l+HTzmXUfja4S6RSf9b1jbLm2OF9aQk
	rqSonKmIZeeaBxUHe98GRuuojpEbreW9yf/2s06JnoODOMIG3v8D6tJsSvnDxD7PntDvXSzsYJ8
	kxKPFmGP3JaF1Y0fvgIXtqkkBMgt6+AyKPZG9h0edHVfJl8c8RJIMkQtY4Dnwnvi+qeDir4yZQ4
	+RL4Zepbw+jW1Rh7oIwM9VlAwmkTqVL7lnYs5nTiDrhhnohgm1SUPxazYRgVJdIjZajN7d9drei
	0KEeJEDiH1Zx9mJI3iRHsqehTWxRdpzzCmLSyH8zvO7jcu0WvpcNSWMQK8oDp/2y0GvrRATMsff
	a72e1kPg6vnpPrk/pIDS2JVQ613icrr6N/bSgM4urnl3Vs=
X-Received: by 2002:a05:6122:660e:b0:5bf:d3cd:3d64 with SMTP id 71dfb90a1353d-5c7ed30ca0fmr22243385e0c.0.1788967189960;
        Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm13199245e0c.5.2026.09.09.08.19.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso3397702241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/Xe33EBD88Gwxo8BLdVVW8e5V2Buiyl7tb4o0BmaLgSk57X9hpbxlU7IrW+RcOfC9+iI7pODMMFeqvhxZ@vger.kernel.org
X-Received: by 2002:a05:6102:6b09:b0:77b:28c1:210e with SMTP id
 ada2fe7eead31-78f67ba56cbmr4525156137.1.1788967188938; Wed, 09 Sep 2026
 08:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:19:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhEuiukgHN3_KjQbOmeJo_+i6exDtJeidfm42S8sEx9g@mail.gmail.com>
X-Gm-Features: AcwNN1WrudhTWyzE-dMx-744iV6jE5_0S03_iG05gjwf1BiOXXU0ML55Tupw88U
Message-ID: <CAMuHMdVhEuiukgHN3_KjQbOmeJo_+i6exDtJeidfm42S8sEx9g@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: convert drivers over to use subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Nice, thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Works fine, and no change in generated code (besides renaming a few
functions), so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As conflicts with renesas-clk are unlikely:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
