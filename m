Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363541;
	b=o/jaBOVYq1mLOdhB7E5S47ZDCF9v+mz+/jgb8vRpEAUQHWeID5oYw/ZLwrKgIWNF88a5
	 S+uEOW+Ap8tI+xrGBrMR0h/nfvIZZwpitgxpH+gBkz/Qxc8HqL9Si4xcwWCo2pwE2fm+n
	 ZVv1JNwv0Zph3jMxT0p746QbS0kd6JmLTgFFDjTRyGgQEIkvyM2Wx13m2fsu65hlWEgNA
	 Sj4OEYQ0jz0WBlILej8NJ2KyxRP04U+fanTD5IKsRK8zM2GHs8hR7Fj7BVJCrKl17UphC
	 Ll9Z5qzYzKdBWF6ybwmzQ4b0Fo+lLU/UwGt2zin2/U85D/p1bxjAhA4GETzhUDdIc5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2fMVd9+BG4VO7hqMxKMuY5cqj5bvPICv3nSW+GWLiOc=;
	b=TZHfOAB46J9SyFR9rXCTkKdVyromGeMeKtudnTmZ5rpAySik8yjOpkuVZ5rlpgoRxU+j
	 MfgEu1j+4xQ10+wsfpRQxIV0ajq8cfJv2hDIOkxGgoIojY5zEmYIAwDy/FhQHUg4EloP1
	 0f+fjAaugi5w1KU4CfPOlMO+X2A5e6siV6/gA8/lVTlmI5Gp2P7wd21d2Vd7sOdPZ8MO+
	 B5pbDtPkvKQluS3eoiJYfrotkMFPMYDGHhHhDEEubgzhztFaYhhDoZTerW+XRKR6EF+6g
	 PcYx72H0j2Hp/wPRDIPBb5b+6ickl5vD079va4q8lDIIYvfaTF9zVkUox9P/zLO+m2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2krku+Y;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A795E606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 02:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A795E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2krku+Y
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1469819241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 18:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363539; x=1794968339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fMVd9+BG4VO7hqMxKMuY5cqj5bvPICv3nSW+GWLiOc=;
        b=m2krku+YjvL7RwAHdVnX5JwwsKjAmCTwylPED02piBX5bjzoH4ibDEntBz6HiCdspr
         nU+8QyqtiUrsnaUjbaYHQsStgBvg3X/67QQ8hZWYApOh3F0ksrsMTvGJaDQ+1AZ8V3Ct
         6Q40Jf3UD9YQQyYjI3//L/0W33Btupqqz8ivO5Z4dVW9QRngt+HFPgenN8crFEGxGDdN
         VCRHCwsc1Q9F4g1OW695Y1ARMEyvtjb6LFZvr990hyM+jF8q6edfDH6irdZbQw3/uMgV
         MF0pBlfW+dCPMd38ESEFm7u4AUX02QO6jSr1JCTX+pbbweQ6MprJg61/EDmyOC6ZTryl
         /fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363539; x=1794968339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fMVd9+BG4VO7hqMxKMuY5cqj5bvPICv3nSW+GWLiOc=;
        b=Ob1AqhmOiB/cyKjjB6OGO9gmSkim0oxn1V+Z6oYp/6+EALYiYINhcIdnG0dQ+XCJLx
         6P34yx6LKMCxTTPBz3rfxrlgBM/e2C7umhhG4/dcRRGT6no1oQdMlNYtjoEBpciaUan7
         6s+VSTgMokRqbBp6C2Wuf9M+817GIEBkTWThd64lSlqM0ZFoFcLooeJ1axpl3QbkZzlM
         Y1CN222seEAhq0HPW1zHbbNegEV7EtqehFPeoQNh8/eNoKJ9so3Coa9Lg9bzYVJmvqTj
         s2tCtl3p+6c2XyEm+HlIOWF9WBrGuGzlUx/FhulkBXMji00i7ZsQNdgkjjUYx3Tq0Fh+
         FUgQ==
X-Forwarded-Encrypted: i=1; AL+hErH+advHHzc+qC9A1eyksmPApU0dbVpyXzULpSXDqFrzFQQW8vzZy256x2AeJuPeTxDI5fdthPt0QpD7jGGs@vger.kernel.org
X-Gm-Message-State: APuU4Z+tfSIev+dOPEIzF0OCr+Y4gU4jWRZybmieaNj93bMaybp3PRNg
	QaD7D1UlyRlV3LR+VIeRAHSNOh2XUipP3FwRpXEGXlu2P5GFfAiss8QC
X-Gm-Gg: AYBFou2jzB8duOApdLurSFXI54QNtekThoLHqCSSTtDQwHzrzJJhD8VzZA794ZBaQS/
	x82/w+BcSWG03nxokW9zCSyioFd2Re6keo+C7SjIGyb/b7NSOeJEOVEU8+zL/jxL6PwZ3D7beE1
	L4A+1tiKg4TofD+mFzETsWcW5EGZCL3+bzZS6Lsog4HiRi6JZMmA/7NjjNIfGbUMuWlZzth5Zs/
	pKnlt6KygaR6CkM32fgnCpGOm0vq5LkFOxykY+x9ZjmCPmVq/qtNDEgOf3oRq386comEMT1TCrn
	5Qg/BXehGfvGLzen5S8DIGgzmZjkI1vpvL3qmIK5OyvKlnL91waKzx5fFji4q0oItEmlPhxKXE+
	efI74p5zwzPtEY3VYb6AYWZ81sg/VDNOyo+DeE/P2tmIypBdVlKZgIwo7du25I9p8xb/EBPEJFW
	Bkirakhgzv6JqAFDPA6H8sn7UayXu8PeDuNYjOkYWoLQa+MFgaLjH7N9F2YJDSSTBneY2FdAVIz
	4IvQoCbg0KWsMm5caT1PB5WTsXUYC7NnZJHMXVLGA1EHF/AAel3YgQ95pIyKzVXIoyPfeuK+bm7
	W9lZDtDznKOVG1enfWdK8BeiM9alv2ipGkWVo2QkCE1kaRgREMw=
X-Received: by 2002:a05:6102:5092:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d4fb2a44camr283379137.8.1794363539520;
        Tue, 10 Nov 2026 18:18:59 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023aeac7sm2888590137.9.2026.11.10.18.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:18:58 -0800 (PST)
Date: Tue, 10 Nov 2026 21:18:47 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/9] ADSP for SDM670 and sound on Google Pixel 3a
Message-ID: <avPQhxfKOpmihOTo@rdacayan>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <18dee813-d4db-49c5-9ffa-7a150747a4b5@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18dee813-d4db-49c5-9ffa-7a150747a4b5@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 02:23:15PM +0100, Konrad Dybcio wrote:
> On 11/7/26 3:24 AM, Richard Acayan wrote:
> > This series adds a user for the SDM660 sound support code [1]. It also
> > adds the ADSP remoteproc for SDM670.
> > 
> > [1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com
> > 
> > Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
> > - stop using fallback compatible and add lcx power domain (3-5/9)
> 
> Can you share the output of `cat /sys/kernel/debug/cmd-db`?
> The SoC also has a LMX domain, which downstream seems not to wire
> up to the DSP for some reason.

Here's the ARC dump:

	Slave ARC (v16.0)
	-------------------------
	0x30000: cx.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30004: cx.tmr
	0x30010: mx.lvl [00 00 10 00 10 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30014: mx.tmr
	0x30020: ebi.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30024: ebi.tmr
	0x30030: lcx.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30034: lcx.tmr
	0x30040: lmx.lvl [00 00 10 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30044: lmx.tmr
	0x30050: gfx.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 40 01 80 01 a0 01 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30054: gfx.tmr
	0x30060: mss.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 40 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30064: mss.tmr
	0x30070: ddr.lvl [00 00 20 00 80 00 a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30074: ddr.tmr
	0x30080: xo.lvl [00 00 20 00 50 00 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30084: xo.tmr
