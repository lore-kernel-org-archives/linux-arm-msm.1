Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794517920;
	b=W7YtOc/OXmHQZA8ppLV8X1wNTHZmhUwOPanIqvmk8Ot5LnHSGafiPwQbnPXCxsW8fJjv
	 uBFzXNhu2eVyfCZMQezIcDYdpOOT1A4Z5XbA/d3gYRutrhXZQnF9It1GkdUw/FLJkZLiP
	 ryg1oGEohXfFO6lr8sWDcaGSkPuNn37SycR9rJXii8dLHOWIjqI6KWGDCwa9kbs+riXhE
	 cX31Zdtalx6h2Lt4n/gxys7+wQMRX7Laf4ieGgdxrGwsXmIz/IbUTiks5Y3f2lea9QZcy
	 EHJ7Bdg+HknCYNL9yP1nxBZK+YZIS10U9plrMsezTqdpuVkAUV8u6ANiquV4VGJrdNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sw+u/f9GrnCWR6VUs3++RZAN52TxC2uVPXknWSBOLT8=;
	b=GW6Ox8SbRsLVVyPpPlmslv1SOU81OdrRHEF1WcZpzxBmWmpMGR/cpnjJugVvYEIGKy4Y
	 b6w6WGXicT7OdvvQrJVPVGcDT+zq0GyVyL45cgFQzhh0QFSEtyodOWlTNofRLWk3LHInJ
	 tHCf6wtaOiMWIwG2MhO61I5KbGAZ77vj5DYtwfT27abqoehG/N5f/TvUdsUF7kKbisjGy
	 7ixC4EqWbcMzNVVY4SDNAqGrUn5ytmAy8tFNDBAmGCQ2OEMrStQ/cWbRTxyyedtWrqUjF
	 MpvZk6ijDT8YCVmmBeFxsyjRpJ9w5P3Z3xp6Be8plCW3u/1nc16tcLkuV0NHTXKtJnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3W0omNR;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAD9606A339
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFAD9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3W0omNR
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71ab5e64742so111217eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794517919; x=1795122719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sw+u/f9GrnCWR6VUs3++RZAN52TxC2uVPXknWSBOLT8=;
        b=M3W0omNRHGTbz+A6sy4W4s2FN8ANNH6W/HkJcX8Jmcp4mXz3i3db04Rh5IzyxvmIH/
         29sN+n/uGI7+iZF6hxoR9/97f5a5zuhbhTSSMIRHvquO6nRD+UboUCqaBgyTnIc4dPzQ
         q4Bstw9i/TKMUTQaPmJbqK2MO5zfGHkxVSDdgjCavduFg3W0Ka0BnlrlTordrkmmrIRB
         wxs16YJwBUBJ5vPlwvD/asTNMCWNv84zXpOjzIXfjitiNxbKd7trC0pMwwayCXMC6laL
         OVkdv+h9rA5Ki4TQwf1cohY1XYUivG/yU7S6UtccK5UmDUNs8DeOJOwi2UU6oa2tjhMq
         4CXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794517919; x=1795122719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sw+u/f9GrnCWR6VUs3++RZAN52TxC2uVPXknWSBOLT8=;
        b=hVfFpBUz4sB70Eo31Joa+5NRzG5MWW/eKHpv1TnHfJLJos6KhAwhmtrStzexm+2lIM
         bPQ8szVJZ0jqB4iUV858PZrAus7i0vd4s7oqdqlFTc1L5gfM/jAAGYNW4KCDKsA3WQ+4
         S36DpBJIz9w/ONy9Ne/Mtfo39ujzGQB68myUWpAdzVxPvU6xVlUWEsFM3T/GfTZ5KQpr
         jlfuBn5Ch6bJWa3qvxN6f3HS4eNx/+VTC81Iggsrmp4jEx5xWwNAw24ccYXvWg9oaad7
         ruo5SfySOhZYj5XWEz7mlIBjj2dlXxB/uzH2h1HCm9sGEwmETgfeS2Jufl55f0cFIuJV
         79bQ==
X-Forwarded-Encrypted: i=1; AL+hErEhk7sMnLzXvZ3S0ZVaFg3Q2SUGtGdVY+Nyg2sEY+btJCqgBMJpTyvzYGDxEJUGvgLjeQCLU3rrNK2qVdVf@vger.kernel.org
X-Gm-Message-State: APuU4Z//ODcHYSrmZSNfwrwnGSq2qj98nl5bj/QD6aiJEoafehTu4CpO
	aFbA1bYmKMARZsap5jQgc/zU6olNLa+IEwYPBc0C5LHNIotELKd45VSt
X-Gm-Gg: AYBFou0aY4hkkex3awshlREACn1ydLlXesGZYVCxNAPL0KOgT1oBBZ834jHzCgnoZAf
	MUT47PxaEyaRKlm8liGfN/uoDEIzJyhDWZEs0DdrWuuhzBoBv6pw79yhdWVvvoP7Tk0SjbL2S7v
	TGKwIAASzUmBJSGQfkIUqzjcUBQ/6WkQR5/LhCWSJ9k/iZPuk+oCQzYNs4OHc1dk2ZCX+TF8Og1
	iDZUPyFFiad+qqeyubqlf28e6gGl6hxjFRYqw6gvi0kJU+cYjS4XGGYo/SzhK7d/KhROAcKVn2O
	NGZz2mpQLMM5dlf9SNVXuHXrD/IqViHJNeqtEU9vQFyITS8DzpqVYDXnMAeomSvfu6Iuvl8RZeR
	bwVLpAZSH5YSRrLueH4mzQ/pQfarPinP7Nreq/dPS3ORPs09lQMbKRSOfVbryEZqs7GDbgep6Yl
	ZDRPdsV9i97EcBZqDL7H6tvyM59lsFMY86/yHM+gfDYJ17N0UtVzwnGAVk0ePQgLquiPYLPPHAS
	itzinfoSS9GXXznq0qojQRLHOkyDiVqyUqDDGycJdk3EvFTZYFyjQM0S9dCjQYHaNpl31YXd4xl
	MLyZf0YiOrzE2eF81U9km7Zj7oXjU2Z//tVnEWD2Il9LoIR3O5tFC+DoWmudfi1gYBqfDnknUKU
	=
X-Received: by 2002:a05:6820:3383:20b0:703:8835:5fd5 with SMTP id 006d021491bc7-71ab4f55eb4mr186047eaf.25.1794517918643;
        Thu, 12 Nov 2026 13:11:58 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm364257eaf.0.2026.11.12.13.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:11:58 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: pmic_glink: Add GIO pmic_glink instance
Date: Thu, 12 Nov 2026 15:11:38 -0600
Message-ID: <20261112211138.40217-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9d80c088-1a0e-48fc-9a24-09fa8c281cd7@oss.qualcomm.com>
References: <9d80c088-1a0e-48fc-9a24-09fa8c281cd7@oss.qualcomm.com>
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

On 11/12/2026 3:10 PM, Fenglin Wu wrote:
> Could you try this on your side? If it works there as well, I can
> discuss it with the firmware team and come up with a formal fix when
> pushing next patch.

Tried your diff (pmic_glink_gio_enable_alerts() not called) on the
HP OmniBook X 16 (Mahua). It works:

- UCSI is fine again: no PPM init timeout at boot, and plug/unplug on
  both USB-C ports creates/removes port*-partner as expected.
- Charging works on both ports, and a USB 3 stick enumerates at
  SuperSpeed on both ports.
- RTC via GIO reads correct UTC.

Please disregard the plug/unplug sound problem from my mail yesterday.
With the GIO modules loaded, qcom-battmgr-usb never gets a change
uevent, but the sound works anyway on both ports when the laptop
starts after a long power-off with the charger unplugged. So that
uevent is not what drives it. My guess is the earlier failures came
from leaving the charger plugged in, or from power-offs too short
(about 10 s to 40 s) to reset the charger state between test boots.

Jeff
