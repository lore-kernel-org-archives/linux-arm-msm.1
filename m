Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758976;
	b=o9Y7AP/o5EqCDPZ6z1Ap8RNUba3h3aMVtitN91i1IItXkcOIi5oT/KPJpuPo0XvoW9Tq
	 Re8rduXDDR1MIpyP9tGQXWdN7qtCFQlRzWdi5/WMLraGimlBhbrmvczIe7Y1bAvdgIC20
	 eDhod88YQYjoFmRxwcD97ZmtHJQepanb25CgrNuSxHULEY1dvyIHO/J1K9TdMJc8MBQAA
	 nAMBEw25VLEwa4SErcgW2WBdpUKHcnEH9ouxNxv+MNzhkbpbRRZCfwLMwAczA1kMLPRGz
	 GGDKpLUxUY+dpMq71dkCf6AnkKOHhSYd58LCBwn38iku40tjSL2vtSzPnom4hiXoDSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LMgH1io6WU/pzu5HjdNUdRFrI+odqUQmdBMW7cqqEK4=;
	b=NbkTVr60nCb/1YsqSapeM/sffDIJy0E33hZrUr726qQ/Lu/O9fkPbbiC4HxsuZC73gzv
	 p8QP2TO+lBbAFqa3ewgWRmRKwR9enxt5XEeK+l9o/y4gHLAr3rieQtsIK3J0u2Bl9F41h
	 UhlZJ48tg4CYEeCzLgmiV1Z+vEs9CVZHvaSI9LLrFJiYlLViVDpX/+NSZxQFU5A9IHYK9
	 Nq+wBWb2SFo/IA2c2Egff/tYNujke9XtNQarU2RWw6qmRY75R/Dssp1Abg9gXP/rhySeF
	 aAcQIAr9RzbI6VXcL2u5DJVPe1dRmqOSCIr7yD/WkshC5Cpd2+YDIhOtPcODNUp+pYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YrZ37yop;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD8A606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD8A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YrZ37yop
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so272259a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758975; x=1793363775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LMgH1io6WU/pzu5HjdNUdRFrI+odqUQmdBMW7cqqEK4=;
        b=YrZ37yopR6buoDLR8xhAC2kJLeRxgK/Bw5O7IZ7cSwFcn79xaLW9/ZD3IUA2OOxTFQ
         zNtHtK+YiRbw+KaKMDrRyh6JH9M74KLOYAFW5M5umKpwDdiqVA7sA16177sd4e7QJmdB
         Emcu7bb7T6U7F/V9h7Y2bkP1BZrPkZFqusLhezxPG187oYJ139sehAihDmpVFww/kQzu
         PA4euzbIP21Yb4VcCor96kjeCiq2k7rEpqd6UymEvtJIbLuSqhfLLqY/D7LrjS49tH0r
         DJopDgh2PKX+ccfDNPxJw5z6gjz4i+yvxW3o4v/ceF748QpUEErYS2T/YF5+dRDN7stJ
         3a7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758975; x=1793363775;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMgH1io6WU/pzu5HjdNUdRFrI+odqUQmdBMW7cqqEK4=;
        b=C242ho8rj+gZ8dNAOKplyMzqpgnQChxpTpg++owNUzVpDSpf6i+CC5/3FvKsHlrQHn
         Koku4GT6ONW3gEo4tnRKqCXgMUojIeRJeqrWjJ1i3LRQijbjVHmc0pN2symZ4VA4AfEc
         fbgIlFNYh/msL9W9WXCdzpTiC8sYv8vqdZqqzrV89iwH2sFcFcv5Tm62EgeKtyP9fF+E
         oEtanO9twzA4z2hntMeXH6Bzaw4pQBqnA48cmMJGVwa9mymBDpvgiWow+vM3TX3chuQf
         0kAnU20w6bewO0XC7QqXpx6TQVTL3Fu+ziLFTpwzANlxYT457m7EJlzx6K+edg7M5WVe
         eL9Q==
X-Forwarded-Encrypted: i=1; AKwUvBypkh9x8NwUz+ZNNCO6ts0StspXUX3cQpRQTlnvJCMbMUYXj0GlBbSAKUSwHFntcVBU7qC2z639G/nvaWRt@vger.kernel.org
X-Gm-Message-State: AFq9FYK73x34wliqgOH5x17DixHk891hi9pVu9L3SUO+N71LJ95jhNly
	zO79g3rW+2C7KAp3DDbCWBQjbCp69jhrdSWPkP4/pI5SsXuZdCEyhRyS
X-Gm-Gg: AYBFou3mtOnQ9tRAaaWXjbPgOL6V8qdvbG+25x03WL/CpDqUyCbkt+Kx7mfSaqDCfdL
	O4GwfNbIT4GXZ9MH6HfoMLkGCH4mGydGXEirRxw5fEI6sA/YJCt314XoRPY3sSTJ3q7cE2n4vr1
	iLJlFn6HqgRp70/uJGARPSqLhZ4Egnilo0vPHdsDYWg512GLT6kc41UzmiHpRv8ORBZ+/qWIg+B
	4tX8MpO8mnhQoKmIfpnF4YDgHS+o/Vo8w0ljP/mCswDvNuUjvZJ5qfVose+4MarY6bBPHMIxvqX
	bC2Qjij9cAM/dSE55iB69SB42Ji4AzDGy26mVuySwrUvp+u7yg9TvR/nnGAyD+zXS3bqWY+bEar
	9Ej34229PvJBh/luR+KvQYRlsb3GqaESDp9azI9Iq3sTRc5qDMilWFNqhMetxLfABhUYgaRvfwt
	NHolI41G0vGCF1tzmFx6Veucx98m5v0iXl0Bns6TsGc+w8Y93V2GH0M/v9c7UV9nzMkNl3x0NwK
	xMprjZKlCbDRIxhPSex1quuFV2lGZ2wJ1SQyHjJ3qXSgtQAyaJlWNknj0OlTGIDJBee92I=
X-Received: by 2002:a17:90b:3dc5:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3adce0cda5bmr1898483a91.50.1792758974782;
        Fri, 23 Oct 2026 05:36:14 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd7fc6b9sm132020a91.9.2026.10.23.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:36:14 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Val Packett <val@packett.cool>,
	vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Fri, 23 Oct 2026 21:36:08 +0900
Message-ID: <20261023123609.390-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <f8a9d12b-c859-4d3f-82f6-d22b9eaee472@packett.cool>
References: <20261022165219.1368-1-26rote@gmail.com> <f8a9d12b-c859-4d3f-82f6-d22b9eaee472@packett.cool>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/22/26 9:14 PM, Val Packett wrote:
> Good catch. I don't think I've seen system hangs from this on Hamoa, but
> I've had USB stop working on the ports where 4xDP+USB2 was left
> connected during suspend..

That may be the same path: on resume the USB PHY init programs the USB
tables over the DisplayPort configuration and times out. On the Y700
the xHCI resume that followed hung; a USB port that stays dead
afterwards would fit as well. A "phy initialization timed-out" from the
QMP PHY on resume would confirm it.

> The USB4 chunk above (juuuust before the start of this diff's context)
> does a similar thing in a different style: it increments both init_count
> and usb_init_count and early-returns, skipping over qmp_combo_com_init
> as well.
>
> I think both USB4 and DP should be written similarly but should
> qmp_combo_com_init be skipped here? No in both cases or does USB4 skip
> it for a good reason?
>
> (I'm especially wondering about the impact of that on the USB HS PHY
> clock, since it's actually sourced from here without a properly modeled
> dependency right now…)

DP-only needs it, and USB4 does not really skip it: the bare
init_count++ is exactly what qmp_combo_com_init(qmp, false) does when
the count is already non-zero, and qmp_combo_usb4_init() holds that
first reference. In DP-only mode nothing guarantees another holder: on
resume the USB controller can init its PHY before DisplayPort does, and
then qmp_combo_com_init() is what turns the clocks, resets and
regulators on.

So I kept the two branches different: the USB4 one is a separate early
return because it must not reprogram the PHY at all, while DP-only only
leaves the USB PCS alone. The mux path already keeps the USB PCS
powered down in DP-only mode; v2 makes usb_init/usb_exit match it, and
the common block stays on while USB holds a reference, which looks like
the safer side for the HS PHY clock.

v2 also skips the USB PCS in qmp_combo_typec_switch_set() and
qmp_combo_reconfigure_phy() in DP-only mode, as Sashiko pointed out on
v1:

https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
