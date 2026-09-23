Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B29352CCFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169480; cv=pass; b=UOCUMOWvik05cOvhDlvju4n0lvd33pxW8SUcVJVI3vHct6NkTCmfBzLdkwJzVDDT3ysN6jGdUN7jpLSn9gwKyIYESXBi7OIJcEU44L2puEgpByQdxPMJjwy5HRFBr7+CrhV+dkdL+Fkv/q/LCUNbmXXIDMGjVC3VkbjyFF2p14Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169480; c=relaxed/simple;
	bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXmRyvu+UBExTH0D2bnRDhFD1qMJBal8HXQ7hJhVyFUYWpZYhxqTIkelvTcz/kMG9yXoo2CnwlBEQ4bDzxs7ngAlqzUKX8R6yZcufDMYri447XPTqdJTA+8bL+QdyjryhRTkGcN7r6Ld83bf9atJx8C26v3A+rEQ6jVuwa4tGnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEks3zyT; arc=pass smtp.client-ip=74.125.228.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEks3zyT"
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c2551bfabefso70021766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790169476; cv=none;
        d=google.com; s=arc-20260327;
        b=peq4F78uY9t+VdkbmOspk8oP+BV7BmNKXsUyIamX4Po2OHNJcSDPW2Ofw7hyMS3ZdB
         ODSjk+gQG9XH4AjoVz6ZSoKIRvUGUUzrYF0/9H7wXGRix8YyyexUfkfQP4C13Wql021m
         roscZTg2ZenqAjv+CTeQQFuAYDjQipQGTt6IlPHUybUcnB6hyb+FP/sFFn2CMaW7GHYq
         pso6KQ3vvXJ6q1kFtb4z2jaaJ9odiHFwSH4kKSBxC8oFthukJp5ulto6J7uVVAKT0DX1
         ynp9vJipDlPc4O3/2dc38baMC1Thj8PHBu5vdxMLgCv+j/yXjtAxg8xVsDZBIsiSh60f
         VhQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        fh=McK6w/6pd5CpfyFwj7uBu1kbjqG/LS1EfxRJUBo8h8Q=;
        b=q6Dxuftcfzr/PTkt2xaeKc8/tbx+huAbJ7HX7DAzWN3QRWC5m1NlizFtoDgC3amuLX
         y93wwmAu7/RjLwktnhnMhlSQpwS4rzHMnnIgx4BC+20R1m93UM2IAlgd7euGXot2Dznk
         eDSFx1YYSL/IDuCSBKdWFsuf8X3S8N+5YxMn/6QHbwbpfhgj+N1f/+d5jjpwD/4LInTg
         DiGLN4T7v71jTpm3kjFJKf+Lup80dKEXZgq2uxrkYgfbKAlhBHZTyryf5H0LHFd9fzxS
         aSFpR9ohIEkkID3dY6j7z3mDMnxo/VnKTFF7vgKHxXsEZeSeRr09PfCH2WFXBHAzuwCU
         WjSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169476; x=1790774276; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        b=JEks3zyTKMevzI4WFusqHT1XBVoTE1QsMGne8r7dt0EIly1YMue8Yno7PA4WBVcy7c
         P+cuWtNuDyks0uJNgxI2ZtWH2lMy4luPF8Dr66MNfEfmAIMMcDxjbdvakiWS8/QfNNys
         0WiNQU1z67kNKE0+gvBOchxLnsr9g1ilrqwtjGiOSQx9B7HBawpEP2MiBbRnGhlSsYSG
         afPFKXlu2GCsuLBBAKLF5Dfk6itSZQhZ1L2XwvLbeQG8mUQdpSmDS5TU8mgS1uLILpr8
         kk71Wmxev1ywODGNWUQl92Ncj6NySLZpTNWGKmUwUDyWMvYcpZkMpb9bsnVlHRrfeUMR
         u5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169476; x=1790774276;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        b=Ueb+p4Zirlv9ocp6WKju5/kNFH09XNZgCU0cnts6xEgNwLqvPOxjjXtpa4kxNHizWZ
         0W9VQo/sApkwVL5FG0XlxCBjxncNq3GH0pZrgC1W2hruJE8ctmMsEsNllaNP8zaKT/ep
         xacqwHbFTisqrCIOCsfxwiNfc7ztJnswevLUgPksV6VWA/X/GR8U3okkkQUbgDTlp0nb
         uRPDvKal4Bm3ZWgFA8cN3AoW9vM61D694Y0sJHAbVY0oSoFQca1rR0yOPRuN3Rmrh3p9
         /7k4dHH7l0vsBV9C8jAbgfzwks88lMV5oAy4i8dbrevRAR9GWz8fjk/ql7Qxd8aKTT8Q
         CORA==
X-Forwarded-Encrypted: i=1; AKwUvBzW7ZEXCEBq/Uc9JlikL59dLf/yj+wvOFTH4KIaqeTiooRMqeJkjsEdLnOXK1gWeBT5oooyuq9RxUZI9dpt@vger.kernel.org
X-Gm-Message-State: AFuF++kjWGG0bhLUq0jFfALv9BpnHRQ4tF+3yDZQLmVifU0IBL5aws7w
	SgcVDTI+9EQMRmZRmrbwAAV89/xKx566tjsafWiusatMUg3jQ0Ynqh5yyULnw2PsEGZTNcB+GVX
	rUvJ3inzcBHQcugiQqvXU7i/hOOJqJrs=
X-Gm-Gg: AYBFou21NT5Y2clDAJURYTXcPLOQJRdHWSmSmRv5p/sRlfIfafyAsAenlvWjrnxCzw1
	V+9cdKEajckoTtTixq/bpd2wuHSuXUreiNzLLJ6sX23Zh0LluXzDNICcqYC8v6n22o8a0bLCqUX
	q0aCLVJjASASSoJbMDKCEzzY/z/nhsH6LMgWzShYMxz9k+EOWL85RRRXBBuqp0dFuMxE92hmCk1
	ax7le0YFaJsf51sx1Lcf0BordzpkNerKUABvyYTaScKr4Dzbc4SaDFrInEZHUxiCgEG+ZSlVegE
	92sgR6u/bX34+U/5dPJ/KNxG5tMBlftl59LnDTGk3phS65qF0VIDYe5+OV2N436sLLEX
X-Received: by 2002:a17:907:9409:b0:c25:8e4f:6d84 with SMTP id
 a640c23a62f3a-c2aadc98eb9mr212676466b.2.1790169476343; Wed, 23 Sep 2026
 06:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com> <arOtU15iv5CWPUEu@oss.qualcomm.com>
In-Reply-To: <arOtU15iv5CWPUEu@oss.qualcomm.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 23 Sep 2026 21:17:44 +0800
X-Gm-Features: AclHuK-Nd-SsXdAr_w0eePSBz9cFeJT2YpbrMeoFm4kjMm3oXLxfgGRct4bNM9Y
Message-ID: <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Richard Cochran <richardcochran@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

Thanks for the RFC. A few comments.

XPCS_ID
-------
Is 0x00000030 documented for Qualcomm, or is it derived from
NXP_SJA1110_XPCS_ID + 0x10? If it's the latter, it's a magic value and
I'd rather see it confirmed against the Qualcomm documentation or a
register dump from real hardware before it's used for platform
identification.

Non-existent MMDs
-----------------
Returning 0xffff on reads and silently discarding writes is what a
floating bus / unimplemented feature looks like, so I agree with that
direction. My pcs-xpcs-rk does the same.

Structure
---------
pcs-xpcs-plat is itself a platform glue driver, for SoCs that don't
need any platform-specific handling. Adding another abstraction layer
on top of it to cover Qualcomm would be glue on glue. Generic, Qualcomm
and Rockchip differ in power management, address window size (2M vs 8M,
...) and MMD redirection, so they don't share a probe path.

Pushing that into pcs-xpcs-plat would also drag every existing user of
the generic glue along: they would suddenly depend on GENERIC_PHY,
PM_GENERIC_DOMAINS and whatever else the Qualcomm path needs, or they
would have to carry per-platform branches in a driver that is supposed
to be platform-agnostic. A per-SoC-family glue driver, the same way
dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
separate, keeps each integration self-contained and leaves the generic
glue alone.

Would it make sense to take that route here? My pcs-xpcs-rk does the
MMD redirection through a custom MDIO bus; maybe the Qualcomm glue can
reuse that idea directly instead of extending pcs-xpcs-plat. Happy to
help with the generic parts if that's useful.

Best,
Coia
