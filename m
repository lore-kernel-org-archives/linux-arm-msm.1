Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8B327057D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 16:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798407; cv=none; b=UhcFyjltmz7NSc3FQXZJmsRQUH2dAHYKPPFkk43KD0rISPBHmtZn2PBG6AT88Zg1M0p9zGUk+oLRs0KW8MOjXmJE66PwQsHvNV6BFfaDpJHfjTOZB2wqWZekOb8le7Wk/5J15ta7AyTyKUB3/GoErSX5gKpMfEubE3FXQFOlKa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798407; c=relaxed/simple;
	bh=ObfdGsSd1mTjP9hpKXhHuziJmjr8XTb363EZOvxgsPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUz5HfsEV5NSCMm/CXwBQcCk+HbJxDs9BZn+d8bATcCKhQuMCOislE32K5W84ZF3C29bsHuMC4WcykewwCpgXlFNMIu093VA8lUmc+iSdYAHhOZpzsiba9thB0mjZyWqFwseArcb54zuB8l/hjaeBcYVjq79VVTzy6VU770KdVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFcBlosv; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFcBlosv"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52e2d1bdbc0so23061741cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 09:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788798405; x=1789403205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eG1iIP7BUpIbVGRt0MVKY4QsHwvAe8uDPE10PvagRoM=;
        b=bFcBlosv9FcwKat42qSIerM3/Qf+JDC4ww9BS11xPLU0IyXVCrZEsGmy3HWOq6u8Nq
         f+Uw4xiMiGZ1dccB4O2rxMGLvJlmT0PG+QApS/HFvCnTbYdsB5zFX5Z2XpL/wyJsZzqh
         vdbE6CFJK+5/CnE6EW3IOyGleOudahimufSDiVulX0irg9xY/oYJlmPktZg5D77SprS/
         KDuhhk52ld/sCP4bS1zbeMLW9ixa8hF8jw3rvqgJrNbhn3G0f8vGe/nZv95UO/F4Ndet
         AwKBuwj99e1KePuDCtH/ehFVvEZcc9J0cq1Vd334zeqonM0KtCD0i8LZtvBQGLZx1KN5
         KBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788798405; x=1789403205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eG1iIP7BUpIbVGRt0MVKY4QsHwvAe8uDPE10PvagRoM=;
        b=Abw4ROEJxvLGeJdiu/DQvqrY4JF5zqZZ+Sc4GxyLMeVwxAEHrhItdU0abg1FFTsEhR
         sSVTBobpKjDbSwiXiTgzWe06pl8inU4WXVHojpurgygDy/hHl1TYjhfM33XoARQmGD/I
         ZRWm2OFnuIBgkDF9pogqioLEex3kzUYlVHh37AfHBZfFUGvyJDGW/89tKDdn+bH94s5T
         8xJqiG21pOxAbG/SQfK/kFiofAAua+WhOrLLVbqGXAuKefTHNf4xSs3VOsFNh58E2j3V
         gRznzzy33kpDvrp+6UICJedef4EUHvs9Yr1zbU1h2yc58Q0KoQWn0okmuGZ3YxHQZ6F5
         lkig==
X-Gm-Message-State: AFuF++l/yTZzn+57Z0T4RznMIANihXxGUv5/VZGqtph1njd+F8DTjYvM
	0irK+Anz77WXaIapdcApYWhchlP0hkjnVkbrwV9e1qAy/wiMKeswcP8m
X-Gm-Gg: AYBFou1a5Y7MNN29FFCkPYXZ44iaCtxsyIKaNK1IJHDh7y4zAvyARL2j3f9Kz2ID+aP
	r1Scpkfige0vbFa4fel+7IsEY3NZkouDlKVxWqe+97iE82gexPQgMGmafODvGD/W1XDHzMpUt8T
	Vy6Tj6wkqsNlnhDcboU93aviFRBzwCIeWsuEi/H6qXmD4O9ekCN2wQPcNMw0MiIaKHoJ7gLcHnN
	0tNBLQLDZTsImSYlEvxHdbSeuo9cJSyLFKhs6ZpUFP+It1aAHvHhB3tIDyQP3cQhP4/8oueqW/S
	cdpZdYkvmTaKZFZOQH9MryFgDm4XLwqBRrweK9n/SecNg7ixwLBgvjMAJgK9pBUuJpDjSoJ0OFx
	lUynMonJ4yB9JOUJCx4H/Qzutjh0GDemdKqgakb7SaEVgHPGDwD20XGQeFkI7RR2tBTiNxidd8Z
	GjRlORMnoR2645cmJp8rwfgE8h3kgrGxadUFBxoaHXrzKgZG1JpuD0fKptS6VuLOnfZ/OhoXXGb
	LjkIg==
X-Received: by 2002:a05:622a:e113:10b0:530:6f9f:d4b9 with SMTP id d75a77b69052e-5306f9fe2fbmr98949141cf.20.1788798404930;
        Mon, 07 Sep 2026 09:26:44 -0700 (PDT)
Received: from localhost ([35.11.35.209])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53087363c46sm24743601cf.18.2026.09.07.09.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:26:44 -0700 (PDT)
From: BurningHoryd <sjunhyuk1@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Vinod Koul <vkoul@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: SM8250 USB-C DP alt mode: DP AUX times out in reversed (CC2) cable orientation
Date: Mon,  7 Sep 2026 12:26:43 -0400
Message-ID: <20260907162643.36585-1-sjunhyuk1@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f0fc4211-2040-4115-9847-6e5cc3fe8161@linaro.org>
References: <20260906225206.2994952-1-sjunhyuk1@gmail.com> <f0fc4211-2040-4115-9847-6e5cc3fe8161@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/7/26 08:40, Neil Armstrong wrote:
> This means the nb7vpq904m is _not_ responsible for the AUX swapping, other
> boards have the wcd9395 or the fsa4480 in the middle to use the AUX line
> for the USB-C Alternate Audio support, and does the swap.
>
> Could you check in the vendor tree if there's any reference to those ?

Checked Retroid's downstream Android DT for this board. There is an
FSA4480, plus a GPIO AUX switch, and my mainline port models neither.

1. fsa4480@43, on the same I2C controller as the redriver:

     i2c@884000 {
         fsa4480@43 {
             compatible = "qcom,fsa4480-i2c";
             reg = <0x43>;
         };
         redriver@1c {                 /* nb7vpq904m equivalent */
             compatible = "onnn,redriver";
             status = "disabled";
         };
     };

   The only node that references it is the ASoC machine driver
   (qcom,kona-asoc-snd, via "fsa4480-i2c-handle") - so downstream it is
   used for the USB-C analog-audio / MBHC SBU routing, not by the DP
   driver. The codec is a wcd9385, no USBSS block, so no wcd9395 here.

2. The downstream DP driver does its own AUX orientation over GPIO:

     &dp_display {
         qcom,dp-gpio-aux-switch;
         qcom,aux-sel-gpio    = <&tlmm 8  0>;
         qcom,aux-en-gpio     = <&tlmm 9  0>;
         qcom,usbplug-cc-gpio = <&tlmm 65 0>;
     };

   TLMM 9 there is the same pin my mainline DT currently hands to the
   nb7vpq904m as "enable-gpios", so that assignment is likely wrong, and
   TLMM 8 (the orientation select) is not wired up in my port at all.

3. The redriver (onnn,redriver @ 0x1c, same I2C address as the
   nb7vpq904m on my board) is left status = "disabled" downstream.

So the SBU / DP-AUX orientation switch on this board looks like a
discrete GPIO-controlled analog mux (TLMM 8 select, TLMM 9 enable), and
my port is missing it - I modeled the I2C redriver as the
orientation-switch instead, which is why poking its AUX_CC_REG did
nothing and only the DP_CC2 (pair-swapping, 2-lane) op-mode ever got an
AUX transaction through in reverse.

Does this look like a job for gpio-sbu-mux
(drivers/usb/typec/mux/gpio-sbu-mux.c) - a node with
select-gpios = <&tlmm 8>, enable-gpios = <&tlmm 9>, orientation-switch +
mode-switch, wired to the connector - with the nb7vpq904m kept as
retimer-switch only (or dropped, since downstream disables it)? Or is
the FSA4480 in the DP AUX path as well, making fsa,fsa4480 the right
orientation-switch to add?

I'll wire up gpio-sbu-mux and come back with reverse/normal traces
unless that's the wrong direction.

Thanks,
BurningHoryd
