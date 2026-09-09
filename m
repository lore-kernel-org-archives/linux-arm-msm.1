Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA653D0DC
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966897; cv=none; b=T3zeeFNyJFG3dtOfI5Na0tEPs5qXM/9kGv72yXTbBamIUcTKKUA7epp0M01KQrXrkk3bp0fcjXotHRixoAOEDyMAQa0/AhZ+V4/0lfVqIfqaEbYMwas9G+s3bYoglvlYsAnKMwCODSy+hTrcn6PmV59MZNcbkK6bxPpsTQrYoZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966897; c=relaxed/simple;
	bh=CECANy83eJ476WV9+m8Z1DPlG6IR5GvieLQvKQjJhkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ClOrhJEnHKTTkjQbarC/AlK9zYMPVE1rLC23//Cj0sV8RUh9IDtQW9KTOXSGMiZd4luo5roBGDXV5Q8oT6bw9PpIuo5thTe9mCUMOD60ogOirTPDfIpoCNpBOUK682Usuz9x5JMbv9iYKFeIRBu7WhtgPoV9B+wxZJlw5CDJZoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7e8a176c1so157800e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966895; x=1789571695;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=haSiNz9f37NiWVNy2OnhpaaLVM7uwzgfEK4yu5ZD+M0=;
        b=W071+DGbUn7+G5F63B/SqOSgn68aAbTNzsPN2JgEnxz7BS97Ks9pIncGXPz3XCNI0v
         I9JMeryajc71VNtrBLEf2DwMWhTRra5kuQJUYn6YSOT6WooPd7QiADIXKT6rfxpDc4/s
         D4uYx34L2JorSddlYcWTTykJvHNOJA9PxZRiW1dDIj5VbMJMYePISRTPa4E1Aq+TeDXV
         BksJlnK2jqy8OhJRjQanzW9NHnYl2xJ02hUFkVu5SeWWdRxV9ydcLfeQW1ZsXyIMygzX
         0aYrm0kRH4Lu0Ojf+rBeX1RGCLdvJjqOfQB9GbDo375IkUAjGcDy+T9e0+cgSeYdCLZr
         wDvw==
X-Forwarded-Encrypted: i=1; AKwUvBx5P37K5Im4TvCyDd/0xE09g0aknwgv4K97c3zEicF/Y6/No/VDXF1dtsJcxKA8lcgTFW3Pt2GZVpY9R0R2@vger.kernel.org
X-Gm-Message-State: AFuF++mbdL8knYk8//y7EnnlEU2+GLjaj4mFKEk8hI8s8ClzmZznSRoe
	gMKA/Fe4oHujOxJMbAx0JMV99fF80XLK96oOyIbUNOHh6xDRXlp103cS0OfK+jG2SBrkMA==
X-Gm-Gg: AYBFou1huByjuc0AEkAdnO7Xne9MteZrnneUSHbEmE3Oja10CUUKV8scWhJRRofBfRk
	+JnEHefe3vCZrHcIB2dmytgEDC2uKfKx+SUH+AvwMov4dnIl/DRI6cIXXPoHLaMYrV1dRYBDVv9
	lKPQTDPy8WFg5/M7JPq2dq/3qvsJ7hcNx43v6zuqIzceClCmyZbL1g9dbX+BdSw1xNwGqZboaRf
	zeP05U/Fa52qaeG/DbA2gqy7Dj+DJTGM4n3D65FxGYQoY4LsAu5fYDlII9IfaWacJrRiXWtLbRE
	sAsOYQeakux87VMdQnl775fctI25JTemftqnwsJJyRxo4gJiK6gJ9NPA3DOjpYnqlAAYnzfaape
	CMoYHAdAwIyvdeKKsnE4cGrKETtgf3+yyg+HdUENhMWJdqZ7wIIaCCfKY2KoKZkTFM7Dv2whTJo
	mf/cWuhiT9K4zXvnPnjsan6Y94RuH/ZMLYFafY6htCtF5v8bPUyBfFvvmni0pRRWbqlytoSHPzA
	BlFBzIikMhiou70UEPa3FDvQ4LTH/3rOseK
X-Received: by 2002:a05:6122:341c:b0:5bc:42be:f758 with SMTP id 71dfb90a1353d-5c833669be9mr1451541e0c.3.1788966894922;
        Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097e5sm12764223e0c.2.2026.09.09.08.14.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785643199c4so123776137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdrjoBLV6vOV6vhPlHb8soaUD99t517WTaQDxe1u4OLtqRUmcmhohTr8fMvSVRkgIh/yI7TH0hu5Y2XWSk@vger.kernel.org
X-Received: by 2002:a05:6102:f9a:b0:786:7a59:a313 with SMTP id
 ada2fe7eead31-7907800afe0mr1252914137.13.1788966889473; Wed, 09 Sep 2026
 08:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:14:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKQMn_3ZeCmjdPH1KiBDc83Eodp5vhOd+yZYwz7p0sJA@mail.gmail.com>
X-Gm-Features: AcwNN1UB2bvnyx_MDMU6btLmRb2JR3XbtnsQvALz2JEMNNgbbOmmr-5JjuTx89A
Message-ID: <CAMuHMdXKQMn_3ZeCmjdPH1KiBDc83Eodp5vhOd+yZYwz7p0sJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
