Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751714;
	b=uzRoz9GlnzhKxsipum8lh6JmGWltsvzj2uVvtF3nDvgz4QBYAQTbtYQiPobskdaLwENS
	 h1CJrpSN23qZBh/cTiU8vhuQYF1eaGL/rDIviNOT4gcTFq4AG1z62Dk2t21izdeFeK5/I
	 951IA5OSfWMDRW0gPtfUw/seaP4Oj8gnd0ncfgriouEXV6+zXRunuMtbqsHXZTPiaLgmj
	 c+T9WG3MFopug4NFVUQLBkDAelFZUo675UNKByqlEqvuLDuVPeqZZXSN3PN8LOdeeB6Vr
	 8NlU6ps27VQ/NgisS1ZP6nSeKzchXB6dQRBI17I0ElHPTONXDqFZjViVjfivSakVd7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
	b=dGXY9dXePSByB7LEILgTgttCEcy0Nsbo6ysuFt5WSmXqOWHMQQ8Z0iXzgo0f6TWtI4oy
	 m2lV7IGGZg3IYapgVR6yiheV7ZOlpdETTRdXVYkIhcH1f86O/RfM84tOPFFlZJSt/DiCV
	 vU73raUFGS/ksrNPnH6rsL6FiOMxgykSTfXOq6hgqZ6p99D5FdN4cLuyngzYhIpdV8zGg
	 UpzUOM+6LqwF2FLNNaWLxCkd9oT4Lx474GKSvnVTaKp3mNilSIe0TVuOKPd/PvhpnQP9t
	 JpE/oAj0TGyYQJZgyrEMzW40fBbgQFtPeqezM/gOR+vwDGAuA163hWV+dr/wy126OCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YvPzcphU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949A60A2613
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8949A60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YvPzcphU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c45111bebso379424f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792751712; x=1793356512; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
        b=YvPzcphUeUm9ntiRTjXKfvXX0Bscbb5UYsaP12qKD0C8ZUDh/CjG5GhOd30VyS901B
         I7injMmS92W+KzSmo5Vnk04EdkGjUDDKA5Sx1u+znNMjnHEAmhw0cA9hDBYeNCPIBk/3
         lalZ5NSjW2bDjo8ape9ruRipgTlQQFHtMidGrqzr++5bd8PeNjVTLlUyrNwpy0sO1wPb
         PHPBODmv+H43y/gEzChKYND4BmwfNpF11Y210c3H9oTaqc+W1+1wbP2A1W6iggjqkLf4
         mQ+5PXQ/1OTr8o/M5/RM/JwJbaLtIPPEBRbilXubhnYK09dJX8xEpS1zm3r72ZNl7Yuw
         G4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751712; x=1793356512;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
        b=k0sSOGfZTZINuosN8w5wdeXzDzRa4GN3SPvvklMk/Pd9GWyWvnOgrfplhzfc4P2G4T
         oPW9v42iLNUonfSStGZ8AbkegEUXnQV+viYGhPHWINRCk5pZZir83rJSPmxuluZy+92z
         PEvnjF45jzbSnN06zTKDKzmm0A49bU5tSYdOYRIDBt8HuyCfZd+h1qQD8q9B55lg94Cl
         U/4mfgIkzq6LMP0G9tz9NfkAcCK6RzJmC1vtsm+u7vJfEmbQAYwCDgqYV3VZRZdJt5vM
         qYh2BBwPDIXlpxkZrXqhUcrw50r1GTeb8uB9hkHTQSFi+3QSGlu3LyGfVgjKaTsiKX6e
         t7ZA==
X-Forwarded-Encrypted: i=1; AKwUvByEwwuBqjjUBYbh8P8BUMkDI6LAZvYKQZlhuAC+zUIsGjSXzNXLr5wAkxORv5UtQZWETqScZ0iXuh6zWmmK@vger.kernel.org
X-Gm-Message-State: AFq9FYLhtAKYIIHPPZYfYTYjz4L08uNF8gO6mu9exOGuq2r8XIz6dJ1H
	IxHCSk5kvVVXt/Uszq325sXVapbHeVd0P8nrgvX8MJfCRiMJWsLGuvt3uTrFetlv9+4=
X-Gm-Gg: AYBFou1te2Doi5KByByJDDO8HBQbCJPdW6q1Hf027HchgGtxEZsImEgMw7Hg2iIlz8i
	HnMmHl1od1Fd1GSZ6yaeitXCBdv9kXNNnkYXEIYTUYZ8ZNKislOqDZI3qe5ar/D4ZB0Zs7uE1OK
	zU9XydY19lxgsbuN6BCRWKt/YCmSWakOHreVis+4t2iJw0jsinjDIUy8L649Y1bIMPNpW1L7cp2
	e42SCqCgn4fjmXJdNQ5XGbbSaL+KZ5EBf+mwW4aAn2M5tWdWw/SFXsQNOyOqCxi81J+cLbDJ5I7
	DOqIzofQnyML6+vhMRk3Ikv+lU4BwP6Aepm4evEN1kRigulb5/IdKZYXEn0feqvZSgZRsUE5P9Z
	ogDhyIqHe+vFDen1k8QIboHcF3vyaDQm39EadkRjKrjOVdssucNQcx5ya1wI1MfsDXJeb++v0Yo
	Krz+4bRVqcFi0C4JMIV2ie3AfIRfgB7iJbd0bFtg272nt6jE+KtmQtpzELeKJ9oOvxtko1HTs5A
	UijF5hSKqSQUPQB4jgGL931chxC6iLruCCXZo1KwgNwnQ7uetblWaDhjlBfphFTf0AmwKvo2TA=
X-Received: by 2002:a05:6000:4916:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-48e38595e5bmr2679426f8f.23.1792751711919;
        Fri, 23 Oct 2026 03:35:11 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edfb3fsm4713525f8f.8.2026.10.23.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:35:11 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
From: Jerome Brunet <jbrunet@baylibre.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:35:03 +0200
Message-Id: <179275170360.4070168.11650113664838519061.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=dNgQAFqyGnVxmM7oecHvQ23reWhdI9mPMjanH5L2B3M=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm3LaJkUwN+3WXTmhS0Wn1LV8+H60VT70se+bvq/c/mj
 X9XzNSO6yhlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBE8tYxMpwu5GVlv+ARel/H
 l4mrmS0wQetMf0lT0c80eYtlV0OENRgZLlT8mjPF1ViKdcu9H62FN3cvnnFj228+iQvsp3ccXsR
 nxw8A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Preparing a clock protects its current requirements, not the resources
> needed while changing its rate or parent. A transition can temporarily
> use both parents or access an unprepared clock, and a parent rate change
> can cause other clocks to be programmed too. Raising resources one clock
> at a time leaves those operations exposed to insufficient power.
> 
> Failures make this worse: hardware may already have changed when the
> operation returns an error. A matching cached rate is then not proof
> that resource reconciliation finished. Retaining a temporary enable
> reference without a corresponding prepare reference also breaks a
> consumer's normal disable/unprepare sequence after a failed reparent.
> 
> Make CCF acquire the affected tree's and parent paths' resources before
> notifiers or programming, and reconcile them only when the walk stops.
> Keep fault recovery independent of rate shortcuts and subsequent
> consumer reference-count changes. Require explicit recovery of an
> ancestor's uncertain parent selection rather than reporting success
> from a descendant request.

I don't think all this is necessary to address the problem described
here and in the cover letter.

IMO a new provider API is the wrong layer. The framework already has
the hook a provider needs: the rate change notifiers. What the core
should do instead is fix those notifiers, which do have a few issues.
You are fixing one in patch 1. Another fix, about setting the parent,
was sent recently:

https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/

You want to act on some changes before anything is programmed. PRE
notifiers are the right tool for this. The user of this change in
patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
it, ABORT drops it.

Also, what is acquired here follows the requested clock. When an
ancestor switches parent, the chain of its new parent is not acquired,
although it feeds the whole subtree after the switch.

With notifiers, the parent fault state is not needed either. As it is,
it blocks every request on or below the clock until the same switch is
retried.

Could you tell me what you need from this approach that cannot be done
with (fixed) notifiers?

-- 
Jerome

