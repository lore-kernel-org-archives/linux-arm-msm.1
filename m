Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10093BCD3F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227554; cv=pass; b=ECov44GnxqWXp5ggLjTSVjTr0P+MqZrQJo7bYSk7v514tLNcfA2UIjSSJPmjljcs0Q37jSUXYxISimknk7VHVl+5jS8qrSQwvPm2UH+y7mPWPvl03p8aOuKIzYo35RUfUZzTc1KPZ1/IZ9FxJAMbgalyWNauL+1fGFAhi6ZLIi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227554; c=relaxed/simple;
	bh=YnSWqEYlcIxc6EKmwTVSgFIIELU0liQdEiKEpQob+bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScOlNJTyjaOmtrWRuSiBAhlL7pMXiQKgxvYsQO2CDcpaaGlp5jP8Tu89Teg3FVXpVeStaSY58OIhywSyXNZO6GeXMb9pYfv0jB2sMGjiam1C2M2xcf74Ekzym9oxSXvkgvxQAG3/ShHJNZRdnk1SyVE6QgUw/mSP+DIwLOPShUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGVGTB1R; arc=pass smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGVGTB1R"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c293a9e09b9so79469066b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 22:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227551; cv=none;
        d=google.com; s=arc-20260327;
        b=kWUnOI+4WKNyn6BUZ4uqPro/y9oHqp0sLNQ88FpB8ywrq+Fko4zrPcawdcITOR6gmO
         S79EB3LmU7h9abh5QGRmGB+G98ZREpBZRbgqMZv+Y8rjMRMzJ6kJX/XZirt3CdG3yYaX
         WQtrNQHIpX28OBChkh8OXl68x203L14xZxCuDWYHEcqroGyjMw3qOhAm3PGuzUFRJzWZ
         Z6/kCdNVofmhH4qxPU7O6zM348pxocx8uWJYdl7PRx1xb2UrfWqUry6VnoHNfIS238rr
         LocP/WT6vJipakOJUUdLysj1lGZwQ5KiiCup68nvi147ZnF9ePM41M52TM21MOCDfP7P
         f0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        fh=YXdI+eAbGXf0uwDG3EIkyOmF3KuOepHE+jbFO+Ln6aM=;
        b=ZkkaftZ08LOdZSmUSswOeWlmNidpiS24iQ525X4EAfW8blGKcAwhoXdwCUUksZWcIU
         FgUp6JAQYYe0g7qIAcHkHo0OxbWQ3t3EqvnDuuoSowTE4RInu4nEnzSpKXJe7nL62jbR
         25c1wey4RS1WIVJMoHzGcvdVSVAkDCDjiAk4iC9qgsdPzjQKjaJcidnDaxiLl7OfDsuX
         mJwYlpkCElEHS3+8izTL/zzLy22VQs/cfh9lxUgvmMZ1gUAdibzK73fU2uFnq4B8JsE8
         Ft8mNUWE91SC90Wo8WKVp4RY2D+dPssKO94JYJu1AZ+PClKk6JcebVjzaQdorqTt++WC
         kBfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790227551; x=1790832351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        b=LGVGTB1RZ0CCJ+y+8XehEGaT964iG66DU5X0YGqB2+pitQJZIi4tCUUuEPmPje/DBF
         1RkwdTRGNN4nQcKg7cTJwSGB++QTcoqNN1fWkfDJa7UM+59ByfVEPA0Ow7SxOnd/JYTy
         2SyuNmtVksuXYnpMQpbnjBA6FX2uoHTiLdPIgt4f5Y9pBAUXI29YQ+HyDU2xUf967I7s
         N2ZPrtPsrDqacmSLgPeTCTIpb6an/XdEFxAS4LI+DMB8b9hz8b1IJ3AahnsKtHI9pdmb
         ClzMxY8DgUhK8xaaP/BrqwBgccVHF/41TbkaHvL8p8CjhzjTFyCRCeUp0AJ7Ytx3O9Ax
         kudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227551; x=1790832351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        b=K2qfB+qLhUjuPqRQdwoe9FXCZ4aSDP9Zay6TzfnamM+ipaBpvcXRF+G8hKIk4uhvl+
         IUIYLyiFq8NQcTxxDJqSVHLGbjhvbfZh+Gkla+PnzO1y/1tx4MRGg+OFvSZsDDryImuq
         K0/e1wDLvzOW8BvYGPKqRFg37sLFyynISEYz1dngRvwogftP6A7RHDzmd0m3oQ0NyvBt
         brf8g5ghU4fJkobS0eLUtfmGjAFk21W6hQo145Ur7K6iMCgKDSQhB0Md6iKoymVC/rb7
         jnRQ6ELpuinrx+ZnqGDh6G5MwYhSqWycNNU+uSw1CqOw6V9VTebfaYU9vdQlQBhdYlJj
         0HUw==
X-Forwarded-Encrypted: i=1; AKwUvByhHChCDRhrKbZOr3uhTnXhDEGtZIKHj44LfiNKof+buwKDYt7iuhRUi3kSD9mYw0CkYFgZL5BZBthj7cQV@vger.kernel.org
X-Gm-Message-State: AFuF++ktFM1zFJBl7m5qoQfbpX8lPIHBE2Xv6+9IGHkb3xtdEgBxfKeL
	LpDdeSQQeG2tVsO+WoBDQCMCCabGovKwNo+3fBwUBGzJp46544/7S1czc1aiR03gOlfkhwOzNoH
	3wG5dFimipKax8MOTXWelUTBt4OepHIU=
X-Gm-Gg: AYBFou02KJ1jCWdeVBTZyZ9KeLLqcREEdIqkpIqMW25tUKUx+8eAzskMI0qp7j3gdlZ
	ido6QpCUDFzh722GmtLoZh9yGIVhCWNdUMthYIGHQbxbunmOLNzrFpMA9ixDNR8YIskke9cLA/S
	hZJnHal3Qe0Pog0y0tlcgalX5PpI5FJuZEnhtL37FYzxQMNmmvu7FhlxgvFAmMCz0L20rHgvZHm
	e1wuPjp40WDF/urK6vzaT06cUGMrIPbBg8Tta1s42iGK49Cv8xEwDWAY7zU6tGiglKQuPzJnSeR
	MLZc4gu7O1J/X/p/4n1ugrn+n4j5V4kOF/r1mOWV8JZl1PhV8DN9lN0b6g==
X-Received: by 2002:a17:906:c14f:b0:c2a:8b27:325c with SMTP id
 a640c23a62f3a-c2ac24c6f74mr93439666b.24.1790227550909; Wed, 23 Sep 2026
 22:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com> <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com> <ca67076e-3877-49ca-8c67-a6dc1b70e667@lunn.ch>
In-Reply-To: <ca67076e-3877-49ca-8c67-a6dc1b70e667@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 24 Sep 2026 13:25:38 +0800
X-Gm-Features: AclHuK__h_lDVDtTJPJ1hE5XUrq-ElYVbuKeNXUkTTzBjP1E-2gaCgXFCmYTLow
Message-ID: <CALj3r0he_NrY61dWo_ib+rj4msXZsRbBJ5f20xGEou0BfOWg5g@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Cochran <richardcochran@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, 
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B49=E6=9C=8824=E6=97=A5=E5=
=91=A8=E5=9B=9B 02:35=E5=86=99=E9=81=93=EF=BC=9A
>
> > Non-existent MMDs
> > -----------------
> > Returning 0xffff on reads and silently discarding writes is what a
> > floating bus / unimplemented feature looks like, so I agree with that
> > direction. My pcs-xpcs-rk does the same.
>
> Did you read 802.3?
>
>   45.2:
>
>   If a device supports the MDIO interface it shall respond to all
>   possible register addresses for the device and return a value of
>   zero for undefined and unsupported registers. Writes to undefined
>   registers and read-only registers shall have no effect. The
>   operation of an MMD shall not be affected by writes to reserved and
>   unsupported register bits, and such register bits shall return a
>   value of zero when read.
>
> This is what i was commenting about in my review, returning EOPNOTSUPP
> is not correct according to the standard.
>
>         Andrew

I hadn't gone back to 45.2 when I wrote that, so fair enough on the
standard. For what it's worth, pcs-xpcs already treats 0 and 0xff as
the "no device" values in the identity path, so the glue follows that
convention rather than inventing a new one.

Sorry for that.
Coia
