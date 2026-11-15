Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794708626;
	b=E8kpeYYF/mdM7L29qPtXjgkzipMeV6MFzVcCYmjvoAj/Brv10jWhjlcwNaiY5SO3MxXh
	 tPQ1wieNSs8/1+yFVHGHDsyJNKvJ5Tzr3vtjM1d/zPhz//A5iZz28Shrw6DMm2drFGJhk
	 8LG1BaQcbRHWw7E3XgybXb4gg57ibuvPndMBByPyVPKGE2Eits4+2l69uNluRtAK7JuE9
	 RuZjaoa7RnhZGMr52UZ+TUQ188/kw97uMwqYx7y1Ds2Hc99jaQnyQshc+KhydxvqJEtTW
	 fI1YO/jHknz+K0Kex3jIYWRvqsup9xK4c0wudhycVKm7pIzAHMroyFzvcaQ+m+qVaVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794708626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Dlr8BYW4D9uRE2kBdvPJxDIlvh4ufcRQvKzhTZs/K1Y=;
	b=tWLJSwrZxkurb0qNWYZap3fxTUbzk7kUQrYsjAHM5Zkmk58gknZ8OjXXgILpmlASAUZ5
	 NyWVNDFy3Ue8BTy2II3EI7Y1ReN5AfRwcTpQio5XFJ2hnZQImgoq1xJhBOnRJGYmSMD8v
	 iut1SZxkUkmcBDQt+14VDe+abUmJ0yTtKQmmLMh9fGuFWeA5IpuLM9sd52uxBJetVZlos
	 Km78ROx9BpS4DtbmBZ0o8BSN7GN1kKtuh+s95ztGxj6SxzElOeBWXYYuyVtd5JuVj50PL
	 LFF7ugI7EoDiwaCBkerl1bYPcbvQT02gEBT6/gahniUVDDMdKn0VljPFU6gFfO3mU3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txxkvDyO;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10362606A329
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 02:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10362606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txxkvDyO
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso316624866b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 18:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794708624; x=1795313424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dlr8BYW4D9uRE2kBdvPJxDIlvh4ufcRQvKzhTZs/K1Y=;
        b=txxkvDyOusSB3/VwzuNOTJgzeLQw9KkCBACEspjdt3MsKzdy9hdSWY85SJ4YE5Wjna
         /h4bpo/UXO06tEB2cLUjjB/MI8OtA0++yvXfTUcmj+K48YDI17uQGUGCzNcU/3h8daBa
         6DNisaR0TU58PV6uwD8Yjn/qbhvdiexoVERZJi4nEyo1U/ahQEtYFyaI+A4+tnvZ4Xxr
         SHHSG7rHXn5UkQrpK/SNmoPSjbcxN0C780tLp4XD/IOvxl0Hq28F8mOCDyLMsYqwoQQL
         MpFCujzcEfpXMnx/VgnyCZn/FxOK792bWWuhLEOCsfRfUGsNBPuCgVyAVqn8ksxBSNl6
         A54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794708624; x=1795313424;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dlr8BYW4D9uRE2kBdvPJxDIlvh4ufcRQvKzhTZs/K1Y=;
        b=hQQDxweL4X2PsPxKeLR9p4qFqd4BlO0QNkAxP46MGJ0ng0WUhi6/HZtzEWFShASI32
         S6s7m4j1Qffc7luLszpXKuLPPJ9nfdR2wajeWoJOdHfbN09r2db/ONwykzA4ROlRKQAX
         Bsv1yyPyhRHk9KvXq2PvyKZD90Al0W2wfY6UR7D90hRUDTNX3XrJpPArPE1XX40NyUAC
         i22qyFysN4mFkvA/Kf4/M75kipG7ngtNJ9he5ZtG7zWgUMIV9eZRNlJcZW+ZgbMsbflV
         3qPoFW5zgcn39FkmGGnnJfGYPcFOKikb/W0HgZ0LAYjXPYbOGNlH+qGAgUZ5D7TcKeec
         YzNA==
X-Forwarded-Encrypted: i=1; AL+hErEX5HugFPXBpJkJpx4U6bxb40DVEhZyyggUriaxRyn++5ZJsAiKmlq0W/SPoQEMWEq8olj5z3LIw9ElyB/u@vger.kernel.org
X-Gm-Message-State: APuU4Z9t+5MMv8D3ahEHe4YhDDsNSxiqY8DhGv8sK6X9KlWNhWIhcMqY
	Bi2kEeo+UNqy4FRtBqQdpody/kKO9MyPYmZCMDULcgxlZOhoine8vQ8=
X-Gm-Gg: AYBFou1J1fwCgLaIXE3c/bSiSfi3j0EQB3lH+Qb53++6zqW+VUx+UizP7U+CP5TKild
	WKHWy6kq5OxqIyXq5Sa1eE1dnpcd6Gwi03irqML0nDbumt5rZxSKl8H+d3ffrl/86yaei3dL0sp
	cUbcgqbxrBdsXRqtHpD6eWT4jQD7Y4AEGnEb43EIzid4ld+T+DP6uVMiDgsH/IXPSNqyZtW+CtK
	xN2+9h8uagJqWgglc98OkiCQ9afdsWLfslbb1jrMz4cPJ1LFx3RkQjwOnSNL6UytT2DKQl3KH4t
	NeopdeALvrgHQipuDmJt7H4pypxSoxaPiPn3eXvwdHqBIkHINnYqz06n+LZRjZNv8akaAvbEGmN
	aIP2Xvt4SeHdIlvyKOpCPRW5tBF0CUUzOVTato2TG353tiYC9RDqZ5RIMS4IaYeZx9CP9rWl+bz
	X4p2+H7yGLiR0DmJfRWqRDlNrL5jsLRF+cxccR7xRgU/5iOyn+cUhGOonzr4JQo7eUeqllUDG+a
	QwVt4lDhlx326aFG3L25sBuWwgEy/Bx8OG9xZyF0M6O6A2HY+C7Xdm56Mml5iRtU0ebOfqWdksJ
	tblUcHJ8bY8V/1V4ZuRAcm0ZvjXEvWXalBPio1lmnsgrbO2sRxmOr8ttcIWQY8lEAGmBm2jql8C
	YnR74oxabI98LCzfwixf+bb88MQ==
X-Received: by 2002:a17:906:f5a8:b0:c50:5e90:5ea7 with SMTP id a640c23a62f3a-c5096853f0cmr525580166b.49.1794708624326;
        Sat, 14 Nov 2026 18:10:24 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c6a5924bsm2665270a12.18.2026.11.14.18.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:10:23 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm6125: Add cpufreq-hw and CPU idle states
Date: Sun, 15 Nov 2026 03:10:11 +0100
Message-ID: <20261115021019.731462-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115003158.391171-1-majidhhdri@gmail.com>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
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

Hi Barnabás,

I should have put you on Cc of this series, sorry. After sending it I
looked at your sm61x5 7.3-develop branch and saw that you have cpufreq
for SM6125 there as well, done differently, so I would like to sort this
out with you rather than have two versions on the list.

The differences as far as I can see:

- Your branch gives qcom,sm6125-cpufreq-hw its own soc data in the
  driver (lut_max_entries = 12) and makes the clocks optional, with
  19.2 MHz and 300 MHz as defaults. This series uses the generic
  qcom,cpufreq-hw fallback like SM6115 does, and takes "xo" from rpmcc
  and "alternate" from GCC GPLL0_OUT_EARLY, so it needs no driver change.

- I booted your branch (cdcfb1386, plus the laurel-sprout board part
  for mpss and wifi) on my Mi A3 to compare. Both versions give exactly
  the same tables:

    policy0: 300000 614400 864000 1017600 1305600 1420800 1612800 1804800
    policy4: 300000 652800 902400 1056000 1401600 1536000 1804800 2016000

  With the generic data the LUT read stops at the first repeated row, so
  the 40 row limit is never reached on this phone. Did you see it cause
  a problem on another device, or is the 12 from the downstream
  max-lut-entries? If some SM6125 board fills all 12 rows I see why the
  limit matters, and I am happy to rework this series or to drop the
  cpufreq part in favour of yours, whichever you and the maintainers
  prefer.

Beyond cpufreq: on that boot your mpss and wifi nodes worked on
laurel-sprout with only the board enablement added (firmware-name and
the four WCN3990 supplies): the modem came up and wlan0 associated. Two
things I noticed, in case they are useful:

- the modem crashed twice during startup ("fatal error without message"
  at 103 s and 145 s), recovered both times and then stayed up;
- ModemManager did not find a modem. On my own tree, which also has the
  IPA node and a dynamically allocated rmtfs region, it registers and I
  see no crashes. I have not tried to find out which difference matters.

I have modem, WiFi, ADSP/CDSP, Bluetooth and IPA device tree running on
this phone on next-20261113, but since you have modem and WiFi in
progress I will not post those. I can test your patches on laurel-sprout
and reply with Tested-by, and if it helps I can send the parts you do
not have yet (for example Bluetooth, ADSP/CDSP or the laurel-sprout
board enablement). Just tell me what would be useful.

Thanks,
Majid
