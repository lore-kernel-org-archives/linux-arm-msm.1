Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504937;
	b=G0Va+pj5RTB29sqVbgSIyvJYj4MqkOf7fvl7pgf1DCGuZrji555pCycc5bL0JO0a0bqh
	 NPMvAdourq3nKlr4yrlmMWYgGy20nmkC/cuj3ulRiF0Ifm4Assef/AKPrzKoT7YbMD3Wx
	 k7okruma+py7h4dmyGkuyo7G5eI3fm5nv1OsOuFohac6Cs9epyWSJtS85kACHeWPG9MxL
	 4uK+Bspom0PNdA6l9if+NOwpoQY/Wwdjw+0LBH+wUAmoI9RA0sxH92JwlvRukwLP6zqjK
	 doWFdKBl1+/sEcRoqwy/9qudd5CkbtrID15XDuvf3abIWPns95zxxlsUjVZSBRPKR8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XkIbYXadeaMG9HKV2rC3JRZDLd4J3RXCWFCJdXi08X0=;
	b=opaIY+n9kuw73trdLnwjdif1TkRaXB6mE9rRvHViW0O+vSDk9gFeG1QwonItUQUpz1vz
	 qayJ7F4ccgoa9r6oOS7djCX1ISEUot83B8Pf2kvaDKWsfqXvbxEgInWowmAQyLL2UcTJk
	 2/g6KkyYQ/Z719f59V16pz4IslbS9Nms6g7LqIuGfDwEq+/Mm0JTg/dyvOsn7kvxkARKo
	 7kmQw5OFhlLEYIRXllKiv6hepdRMv3TsXUoGQCrJdwMvKhymxPy7Kq7rqDFa/x0Yx/bgv
	 toVykFDVE4ytGP5vEYDcH3UFf+V0lgMPGsYYpSohgjI0aKr6Za8gAzH1ET8Oays3MrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LIMP2nB3;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D0A606A880
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 17:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D0A606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LIMP2nB3
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4922523d1afso12326f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504936; x=1795109736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkIbYXadeaMG9HKV2rC3JRZDLd4J3RXCWFCJdXi08X0=;
        b=LIMP2nB3cPMUdhws5RaIXR4tga9oAlQTraWtWrHTJKOqs5l0cXKzgKLK7GCwR58MIR
         V0+47hH9R5MrphjjrCXy5PNmubHhEyJwWQyX+OAPcp1UrfnxUJP/zwQSU0PcsmJcKeJO
         ZEVVgeEfZy+Kj3YWrlSmySRLjJGWy85AIg5gQU5hbH6iUea8dXk2Z6XoyI4PSe5UhkoX
         WXtiL25Qpd1k7lOn6PIPnJfJhks4HD+3lSMpGNr3lKjeXEiI9niaqqzJnyLdud7j9e7C
         pc2g/aov7gImzhFjDKgQSkGKy24pzW7kE+CPEL09oDrlTkH3Br51aO3wyoV9OUOHqXAw
         XE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504936; x=1795109736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XkIbYXadeaMG9HKV2rC3JRZDLd4J3RXCWFCJdXi08X0=;
        b=TDDDO89MBxeu3LqJaPemVIisw/dAyJpH8sfW4z64x4yAimek0siU4FlHCkwilLayhR
         QFEZN+07OkF321rSmahcn0IoURaTeBPgXYp/9xzHKuRzuYkGpqQYSh9/lQNCY2jBZ9P7
         yGqNhqX1ehpDKhFUdLfUfSswPLnoXsTBSYRf5Pcv30AP0erwSoKze+dMzA5kP+cW3Bc3
         TWaNqAOQqtfDntASc8w6ZrReFC0gIF/c3WkLlJFPS0ImTmYiH7U5NEK3cEW/bw3RZFfG
         yzITzeWc93+1cj/bZY+qK6U92g7gl6cJxg+AzGv/a5w2tLJZNh6iwEZRW0fIKh1gcPrr
         1Prg==
X-Forwarded-Encrypted: i=1; AL+hErFuhrvuUqhYmun+Y8GorOFpGmUxEFfNJTTSFRWmnC5a2IMv8dL1tO4cVOLYLTb3fKA899r/YFFrnT5cZ7+h@vger.kernel.org
X-Gm-Message-State: APuU4Z92kCuwQ1rG3BYg6lwjjr1N0jhUwjXuGsDiYb+a3ZLNiDWYrLW/
	JnjJLJILjxOgzS0G9bp7cYfrhnEEapRDJypAEfHQAMfd6ILWkgPzFidjJS9jY7RCme8=
X-Gm-Gg: AYBFou21PrMFrtORafJHJqxxcc6UNSm6ynpHWEVWfkPl/o6yW9CgitYVeHGzBYJ6TuU
	q8IYKltsmPfPybwPkx7gj5V8QhMmrgq8XFAHp0wItSbSPfRhdiDpBx07nu4ty32wU1e3YamcEVN
	tmEul52l69umh/HKhhZxM4MVEro2aGr0PJEO8Wqea2CAl1OxNf3ZcLeoRJ66C6jccaxxKonFcwc
	QmnnDLWtkJwfEag5LcqC6/zapHoVAQDUDpfxsoh5I2IZ1dfkl8ZiHZTnR6BhHvcGWT3iVRsbQ6G
	OmFv/TZ1VofSzmVbKyJFJNWK6ggU/7Fzc4IstpncJe+37ynNlgWHpC1YxiH/Hq5nQePRXi3VwvN
	ALFdrWi1RXgEgxh7LVgETAqulMCIBeNap+44ZymWGRINS4o7gRAnDzdUlziO6mlN4FhoddGXbc1
	rRhctjo9uCSGWDQL4CSBFbdOUw7RXIel58waPmkuZJxfYj443+s8UClULEl9YwR5ghuDorqyJ8C
	7Zudp69NqFX1txqaphSrW50K6+INrVLpZxbraE2atu7e92bj1k+9a4er7WPj+JdnvaBz0V1R4zg
	nC4Ol3H7eLVxQbZK/EDJ+tTRgGAvgnjVlxr3JPdcjecQJYcaLcwNG38K
X-Received: by 2002:a05:6000:4693:b0:490:c68e:5d5d with SMTP id ffacd0b85a97d-49c74864785mr53180f8f.49.1794504935838;
        Thu, 12 Nov 2026 09:35:35 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm401037f8f.23.2026.11.12.09.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:35:35 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: yzddMr6 <yzddmr6@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Reserve ISLAND1 ways on SM8750
Date: Thu, 12 Nov 2026 19:35:23 +0200
Message-ID: <20261112173523.1474-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com>
References: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com>
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

On Wed, Nov 11, 2026 at 03:21:13PM +0800, yzddMr6 wrote:
> With this table, system suspend can reset the SoC once nothing votes
> for the LPASS core. On a Xiaomi Pad 8 Pro with the LPASS_HW_MACRO_VOTE
> and LPASS_HW_DCODEC_VOTE votes released, 16 suspend attempts (15 with
> s2idle, one with PSCI system suspend) ended in a reset. The PMIC PON log
> shows only PS_HOLD-triggered resets and no PMIC fault.

I tried the patch on another SM8750 tablet, the OnePlus Pad 3, which has
what looks like the same symptom: the SoC resets about a minute after
s2idle entry, and the PMIC PON log shows a PS_HOLD warm reset followed
by a PS_HOLD hard reset.

It does not cure the reset here. The tree is v7.3-rc5 with out-of-tree
board support, without Ajay's series. Each run is one 60 s s2idle on
battery with the USB cable disconnected:

  this patch, Wi-Fi WoWLAN enabled                    reset
  this patch, Wi-Fi WoWLAN disabled                   reset
  this patch, rpmhpd domains left at their highest
    corner (rpmhpd sync_state callback removed)       reset
  no patch, MC0 kept voted in the sleep set           resumes

The last line is a local workaround in the interconnect driver that
keeps a minimal MC0 vote in the sleep bucket. It is the only thing that
avoids the reset on this tablet so far, and with it cxsd, aosd and ddr
in qcom_stats stay at 0. The first three runs are without it.

> Holding LPASS_HW_MACRO_VOTE or LPASS_HW_LPR_VOTE across suspend let one
> s2idle cycle each resume, but cxsd did not increase in either case.

On this tree the two votes do not seem to be dropped: with all five
macro codecs runtime suspended, clk_summary still shows LPASS_HW_MACRO
and LPASS_HW_DCODEC with a prepare count of 6 (LPASS_HW_LPR_VOTE is 0).
I read that on the workaround kernel while awake, not during suspend,
and the codecs have no system sleep callbacks here. So the resets above
most likely happened with both votes held, which is the state your
tablet resumes in.

> All of these suspend tests were done with a USB cable connected.

Does your tablet also resume with the cable disconnected? And does your
tree leave anything voted on MC0 in the sleep set?

I can run other variants here if that is useful.

Thanks,
Vladyslav
