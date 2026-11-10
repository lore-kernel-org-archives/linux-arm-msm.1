Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331322;
	b=Ce2sZjUWxi1d7xWuCfEftktWjBnn68LrEl8+TZ8bUJ4OOQB1gvf64oNTYwJrtHoanKZ0
	 dhe8PFhYHQ+wIQfcqLQfYZGtGILbYD9MSX9RwGq75smxqpAdMnoQtYgbLwxm7GuyIKDL1
	 m/H34ZTYS6dHenC9keRc8d8q0evSkoxrSdBkTAq1TljJDrXeDIajoVk6D77tS4qyXq+g6
	 ECKO2Pg2eBqQSWzCyPx347Fap2iI9ck4mOgc1grUIwW+CoRmGPrbsZz51ax7JicUmUWaC
	 VPBl+iWDUxMM3Vq+mHeN1XaEZeaq4L7OvWXRkPSlXh1QzxVVQ53MrHQ9EuWusET1xmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a2lfb+YWF9ky2BY7yTeGdWupjNrafjgwonatQpIRY38=;
	b=JCBKNKpsXzMMOcDjL5CghNPRU3m/o8WAVfizL/UxJen8bxzaBBunqxK9TNlbmvKJnAx5
	 T49l1ekCStruf1YH76vZJ2fkzh9pKQpNtAieCiLg/XBqYo8YxPZzV87q/q2rseABTttfG
	 EuyGhcTH03dmmP0oucjkHuMbOq+OjIFs64Z0N1G2cSKOW+Ub7fpscRNPAq6K0aKBH3ldl
	 KogdtXaf/mKlmxQ3BjYzVoCg3wwMS1AKaD+fnElfWYG+x9PNuostwtcd65xEzHMyLAK6P
	 N+aDD/OUuEIXREqpa8LRMXpODA1Y7zlgMS+XFKfSz/57xkpuLxs1w+9TTBqVs8IgpFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjolmdHB;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A960A2628
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 17:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238A960A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjolmdHB
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491d1f66968so296027f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331320; x=1794936120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2lfb+YWF9ky2BY7yTeGdWupjNrafjgwonatQpIRY38=;
        b=GjolmdHBr50uXXPHJ1wg8NM0yDKma2Ldu1G/e1NNxN+q5BLXzJ8jmX9QJcnnk9hlgT
         lSbuSJV30ux5W/eLL0TmJ4jule/4FQD3WA3c9OfYj6T8atTZzfz3JPBWrBNf0yICi8CP
         m08xao3OyjLRvTJzrR2QBt2fTz4N0NrbPsh46PQ8qFOufnJvRcLbJXNc8xqHm19ykv3u
         aqUGQRjjHomUPY1ixLytGgKUEuiQiRZtjE0tm81aW/2/dqvwPhUwsajbYHFOv/qDii1j
         80gcbsh9KYpDxi+F9KZgUo64bZ+n6NASiu7QaJUJYgm5M2J34WeA+3zn14udtehSh0JQ
         vz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331320; x=1794936120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2lfb+YWF9ky2BY7yTeGdWupjNrafjgwonatQpIRY38=;
        b=hpU82AoXFZ0j1PrOIt1vhGghQP5I2E03mfETZQ18T8T1lWaZOI8SJ7rHOH7CtGF/bI
         njiCzqs2k5l0wyQRcjECgrCLt1ggmA/KeXjA7BwY8x5XLEZQPGGZSC3FOFkB1A43C/Zn
         Mwnbw5V8X3eOWuWgzCqOqZXwqLh/ajIdDPcyDXnmDYoNKxX2QgqIwZ44TalAFVBtnRWt
         KQsalK3+WLYf9xbZoRVuehD9w2NU//5iVr6HjOJ1RAM/lfBGNhrDz1e+8YOTC+sJRqmq
         gg5hm1MaktCVHtZMNQvMrXDrpse4DVxbK9YhI2xtxkXHn/WfxdRhbhkEeW3AG3pJAlrp
         4Zog==
X-Forwarded-Encrypted: i=1; AL+hErGuWJpbY8rhU+pzMxhUjrcSX1XbLFwQ5B5eYtnUkPK5bgYtK7xgUxgX4EevhTWEan5Z6uKkKiMl5Cp8q9Fx@vger.kernel.org
X-Gm-Message-State: APuU4Z9H6KOsIjzIX0rA+W7IArN0Vn8DjxIuLdMtRburIGiEsjKw1scm
	YUXtLWUlp0rGWr6LHV367Rf+u3Rng1FuERahJTqbZdIrn6Y8OJ4MMnmJ
X-Gm-Gg: AYBFou3qOtVQ4SdqEU5H0R7l+4mRaUsjc/KCW4TakyFBBhQSze6NR45g4yCK2EGPqlG
	BGiZA45HE6iHaMtXcVtSS13TmtBEsfXv/CtypdN1ILyj9sHQP9+uRTYUyPHOWZGBUCuUxQW/NmS
	Pz2uCG8Rca7fZ6hGUWwHXzC3Yh3P1HgWHjCfqmCmThpSIUan3+XTMcZ5n8J3/sljVEOeo30LMhS
	SCBwqb1OQ6MnJosfgB5Q9pJQCmzrdwaM23qPzzamGIvXhCLKL44J5VelkPCBOXEx96gu7Poxhlt
	K9aTiMix0MNnrrR50WIfEiTcpK7kCptPnuJBwgqaRDc3VKOu3S2JcZPvcGCCGWwITlGLtuj7u08
	an5UirI9ufWEdjI4nFmxI13FznOeMZA3aulml62EKVo35tUoUgWqhQvNAhQycesmBOLqYnOVxFl
	UUiB0rfrYRRSp6OcXFfsp08swDWTGuUt4IJaYEqXqzHGefRK+awfQwurbJMzGqRhupU9kqcBlS2
	Kx+rMfl1faqjLWEEn+vSHeQ7ee8WkcVcZiTLgFL/3rN6Wb1K6CGh0Rn4ZQn2i6zYqog5/jxq6RK
	YTio5EXlj6mpnMxDznGhOBYQ/JjwwSmbFi2ZBdw8mCY/ssHXxvk6rps=
X-Received: by 2002:a5d:64e4:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-4982f77f085mr6324632f8f.37.1794331320173;
        Tue, 10 Nov 2026 09:22:00 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c83432sm5460826f8f.58.2026.11.10.09.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:21:59 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Prashanth K <prashanth.k@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during system suspend
Date: Tue, 10 Nov 2026 19:21:48 +0200
Message-ID: <20261110172148.1640-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <auu9hx_Xnjbi3WkB@vbox>
References: <20261022224220.480-1-tvlad744@gmail.com> <auqXyUxc9cRIuYou@vbox> <f9d27fd8-cf33-4e6a-a9fc-6770a933cfb3@oss.qualcomm.com> <auu9hx_Xnjbi3WkB@vbox>
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

On Thu, Nov 05, 2026 at 12:02:46AM +0000, Thinh Nguyen wrote:
> Hi Vladyslav,
>
> Could you test this change instead to see if it resolves the issue?

It does. OnePlus Pad 3 (SM8750, UCSI over pmic_glink), v7.3-rc5 plus
board patches, with my dwc3-qcom v2 reverted and nothing else holding
back pmic_glink notifications during suspend. I added debug prints to
dwc3_usb_role_switch_set(), to __dwc3_set_mode() before the glue call,
and to dwc3_qcom_set_role_notifier(), with the device's PM state.

The same kernel without your change resets the SoC when the cable is
unplugged in s2idle. The last lines in the ramoops console:

  PM: suspend-to-idle
  role_switch_set ->0 (pm suspended 1 late 1 noirq 1)
  qcom notifier: role 2->0, vbus override 0 (pm suspended 1 noirq 1)

With your change there was no reset. Each suspend run was 150 s of
s2idle ended by an RTC alarm, with the cable changed by hand during it:

  unplug                  2 runs
  plug in                 1 run
  unplug, plug back in    1 run
  cable left plugged in   1 run

plus unplug and plug in while awake. In the suspend runs every role
switch call came with dwc3 in the noirq phase and only stored the role.
The glue was called once, with the last role, when the freezable
workqueue was thawed:

  PM: suspend-to-idle
  role_switch_set ->0 (pm suspended 1 late 1 noirq 1)
  PM: resume of devices complete after 108.388 msecs
  Restarting tasks: Starting
  drd_work passes role 0 to the glue
  qcom notifier: role 2->0, vbus override 0 (pm suspended 0 noirq 0)
  Restarting tasks: Done

Unplug and plug in during one suspend came down to a single DEVICE
call, which dwc3-qcom skips since its role did not change. After every
resume with the cable in, the NCM gadget was configured again within
5 s. While awake, the glue still gets NONE and DEVICE although the dr
mode stays peripheral, so the call has to stay ahead of the early
returns in __dwc3_set_mode(), where you put it.

Host mode, with a USB stick on the port instead of the cable: plugging
and unplugging the stick while awake works as before, and so did two
suspends with the stick left in. With the stick unplugged in s2idle
(3 runs) the NONE call again came in noirq and was only stored, and
drd_work passed it on after thaw:

  PM: suspend-to-idle
  role_switch_set ->0 (pm suspended 1 late 1 noirq 1)
  PM: resume of devices complete after 2554.135 msecs
  Restarting tasks: Starting
  drd_work passes role 0 to the glue
  qcom notifier: role 1->0, vbus override 1 (pm suspended 0 noirq 0)
  xhci-hcd xhci-hcd.3.auto: remove, state 1
  Restarting tasks: Done

The host-mode suspends were on a kernel that also keeps the USB GDSCs
of gcc-sm8750 in retention. Without that the xHCI came back from
s2idle with an SMMU fault and "HC died" in all three runs I tried,
with the stick unplugged or left in. The dwc3 code was the same in
both kernels, so that is a separate problem. I have no result for
plugging the stick in during s2idle: the port did not detect the stick
every time, also while awake, and I have not found out why yet.

Two comments go stale with this change: dwc3_qcom_set_role_notifier()
says role changes are protected by the usb_role_switch mutex, while now
they are serialized by dwc->mutex in drd_work, and the @pre_set_role
kerneldoc could say that it is called from drd_work, so not during
system sleep.

Will you post it, or would you like me to send it as v3 in place of my
dwc3-qcom patch?

Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com> # SM8750
