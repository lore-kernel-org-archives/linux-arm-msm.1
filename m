Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758967;
	b=2SnHUnchsPC6IZa70205YnSF/Hpd2R0cENP2XI5dGDqSrBXHLuhVnMdDczkWUzSVzvp9
	 clg4AEQwcb5l+/4QYBd4LkWGMuNy45kOK821SQW39bZoZD9fTJVVOxTOP5Id/ABONPqmw
	 r3ktK9jLwtn2NM6Ns6NhTMGKqyl8JxSygeTw73O+7Qzf9Dg4f1OryDGUNAFTWWYL1fD5r
	 nNjwWT7SbH9M+KoXkeXQqBkeZtziHqkJAOgn8S55bdfq7NdEVDPzIKdhT+WZP2LsOfYbk
	 VpR0MJB9A9fQ1O/ZhQyos05wlBL752kGvUVISwR8NZ+4G7mi6dy8WsBSxVrWYjZsL2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EmfKpji+90isn+q04JehTBPzQ9AQUDyGYMHQgJ4/n9Y=;
	b=v4wn9b1xPXNhMnfupLbSVRc7bMP+pczwiKq42HSLtXURAT3gU3cweJcGMH58xdUwPySf
	 YqsXQzCMWenZXjyub2rXprLM2tQNsIwZEjS6lyPRcUG8qk3owbG1ibezMxdYpIKAVjSRv
	 vCudhWVBVIdiTo6Ej1zVObSnArSAs3Tf2t7FXy1bbYVtGM+Yrq+NfGbL/CLqhb7kj5CSD
	 09Vu/GdwV89pPMF7KKxKoUC7EqX73X4U7enPUGjw7CHfcYU29fFJg0pF+ubrkELGPeRPa
	 CPTwyD3CDjNAUaML+PYCWWdykYobqSUcGtYK27V8NIOQ+rtaReu0azHW5g4u20Vf6Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Ef/gZ3Xh";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34655606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34655606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ef/gZ3Xh
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc751eddf25so423698a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758966; x=1793363766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmfKpji+90isn+q04JehTBPzQ9AQUDyGYMHQgJ4/n9Y=;
        b=Ef/gZ3Xhc+k+iDxGvZfH7kMpGROTljddNXLNpeBM0/8IlOeMunaL5yfKodpQLGnh00
         sFJEuJIpXuf4K2SQcrdbTeUGA5dnBzp4R1U9ChdAVGs9yHV+3bsDUy64w56dmD7ZZq1m
         duTb2+ALDCyParABYeioHUuLtxrmy/IG4P4PHgu0OeivVf71gBrcWl7BTMcaZMSbK08E
         ap8W3xc2d2v2PiALnsXmP1G2nK/gNhTp0/oYnfH7RA6DvTqrtDFalCNFe62uobqBx9Qx
         3HCfwhKyJO0ATr+J6TdEKIXZ1lL6Y9zX3L743pNK6dYciryMg1hNL/Ej+dhX2FBfNTQj
         3bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758966; x=1793363766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmfKpji+90isn+q04JehTBPzQ9AQUDyGYMHQgJ4/n9Y=;
        b=fELaRc6N3Ivos5D8FrkP9H1EkLEJC3hVZKCCi1nLBuxx+2vuhIADcZcdJENiLkMxuq
         rbSiEdgKzAGvvvmRgPiKFR1fqR7PJBwPIvCyWQ1EpFkBlI8lusl2PjOtsrZf+hnT36Ru
         nQpnI7jwtfA4QSVXnz0JcUn/3S+/C/mSGaZZpIUGKhWsUwehMNHJ0Tk2A4OaJ0W5TGat
         BpnJsbyq8n8jvneYh2LPmRYDVZYIXaUgK4b1ZRA/POZ8Gibil1OCRpaHhN+XOKsJutiE
         b4G7iLAGsNdTXwVWC17c4PSLKMuSZXS3cxrRrY1FLVYkPvk+wKaUIg8v6BbRQD+96VTm
         Cz0Q==
X-Forwarded-Encrypted: i=1; AKwUvByUDN0mlmLU42PvlzIJ13BJOptBy0hNKepwlMeVpQBXS88U4zc/1EpeNssqzHicJCDCIr4Jwep+ZBxdSxav@vger.kernel.org
X-Gm-Message-State: AFq9FYKVn538VGgjB5jklN/e0vMkvBa5ON1iZHZBnVRymYEbQKThf0yZ
	Yu7izCT5P6O/gY9qWT+Q9qVQ/nBW7AyAuDm+qdcEAPXw8ehMEQjWjAHY
X-Gm-Gg: AYBFou2a10raQsqlnBp/z5r9FV7+Qlmd4OK5GEeODU8ZR+WcE//VaRWhd3EXYTKnKwP
	2sqWtBAQ+6h49dRbSzVOFsWIjpwgRHsNGzgLXV8Ct1DcGvgScd0tn4ELSsjK3MWX9cQjkG4ug1x
	7IbNfBs7vzzy1+5gIE+4OyiZtUGrTwlNUiKWt8DR5w4hJkv5Z7ID77MuLAwvnlu+t13SMJZJnos
	cYHGRpEuHNRbBL88X9wclhUhKJ12C52oe1DVmyerdipQWO5+5nnnUNcZu12fKZEVJBCatDtr9md
	7SKUczk0bk6h8qFxqp4RWxxN1VMcRag/zVwffXcI/ruzmknbrf1oSXbjxA7XDWmmvZnSsTycI9Y
	OqQ3sf5pzOG75HZ8WF4rFfCNBqltnnhVyy7Y8jQqKo5CzewzbOMZc3jdURt013rknp0isO35XKY
	xPLVTbtfWspTJBffauGLJZwNFRN9/5rertFs4ufoWuL/joRkG5eb05YZBiaruqlAShc7r7I3GEW
	8bRP0UOE6tu4RXhL7LGsvNLpThwIg+LyCB51YACOrir99tBdEmgB/xBiQsYFl3I75JDXVOz
X-Received: by 2002:a05:6300:392:b0:3e1:6acc:5b08 with SMTP id adf61e73a8af0-3e37676d16emr1403665637.63.1792758966458;
        Fri, 23 Oct 2026 05:36:06 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a5342sm684757a12.17.2026.10.23.05.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:36:05 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	olteanv@gmail.com,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Fri, 23 Oct 2026 21:36:00 +0900
Message-ID: <20261023123601.374-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-181846@kernel.org>
References: <20261022165219.1368-1-26rote@gmail.com> <sashiko-outbox-181846@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 17:07:04 +0000, Sashiko AI review wrote:
> - [High] phy: qcom: qmp-combo: qmp_combo_typec_switch_set() powers USB in DP-only mode
[...]
> Would this overwrite the serdes, lane, and PCS tables, time out waiting
> for PHYSTATUS, and call clk_disable_unprepare(qmp->pipe_clk) on the
> error path while qmp->init_count remains non-zero?
[...]
> Should both qmp_combo_typec_switch_set() and the power-off path in
> qmp_combo_reconfigure_phy() also skip the USB PCS when qmp->qmpphy_mode is
> QMPPHY_MODE_DP_ONLY?

Yes. Since 89563a152973 ("phy: qualcomm: qmp-combo: Add preliminary
USB4 support") the mux keeps usb_init_count when it enters DP-only
mode, so an orientation change in that mode already re-ran the USB
PCS power-on over the DisplayPort configuration before this patch. v2
skips the USB PCS in qmp_combo_typec_switch_set() as well.

The power-off in qmp_combo_reconfigure_phy() when leaving DP-only mode
only asserts SW_RESET, clears the start bits and puts the PCS into
power-down, which it already is in DP-only mode, so it is harmless, but
v2 skips it too for consistency.

The pipe_clk handling on the error path of qmp_combo_usb_power_on() is
a separate issue: pipe_clk is enabled in qmp_combo_com_init() and
disabled in qmp_combo_com_exit(), so disabling it on a PHYSTATUS
timeout leaves it unbalanced whatever the mode. This patch does not
change that.

v2: https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
