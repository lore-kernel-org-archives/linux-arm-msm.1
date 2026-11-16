Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847685;
	b=eNlf8SaYiXtqO5uPJJxJFLfN22wu/Cr64ZpiiFwem7/duLj0vEXWvajrnANYpSznrjLP
	 lMFx9Webjc/Fs73v1HSgyKkUF6T/RGTHxOxWfvlY/jTb69jgln6ugk5s8x4pdEdm1NMvU
	 799qnj7nNOuF8JyIHwWjB+uUW4Q19C75063MQPG6rgZ4KLCxhzXeThav0Tvk+MllLjdAP
	 NkMu5qKYaFS7f8zMxhBNtA3MGsC0+STqSZKYEG/rRQj/JUcBLPO0k47rNQ+ibj8AQnqJ9
	 lJhqoKcDmK/KaqVJFFOZaQxVlq0o3x3HxpCDEQ/hkhTEmF9ROsFnlj/7gXV+ejGgL1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9ucaiasafJWVLo8H1ml0lvhBlTDBTGfYuTcr2tmIkkk=;
	b=BBPQDakElin9vDb3emErULK72ovTvoS8VkcuFA5wQGmac4YbjwficP+vFsyJwhpmOgtR
	 LIwkC2BdSamiyeGxfpXPBGSfW3C3eqUgxLFGqpdFzKFvNM9EippLxq9iWvEt1oPLnW5YY
	 EAYoMjs9rQBtCTyGVzz769QsKaK8MRbxHsqn5HCr+DXRoxmvHj8HCEqNj6VL5NhHtOa7g
	 yoKKCZWMIMyO6eV7jXEnY+ewiQK3mcl2zyDYHLAXvM7tTb5Y0HkBWTBl7iEANiPSPYE/V
	 WgYoBW8EQXdWqi4nhg/Xd29x129oDJMHWIuApgpW8yOHjjPrA8WhGdRpz50YPbSqi2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BRZpPH7C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76B5606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76B5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BRZpPH7C
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so595002166b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:48:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847683; cv=none;
        d=google.com; s=arc-20260327;
        b=m0MepnnSpLfPxNC6LLGN9qrdmN5QFLf78hqBsHrTxX7+OoypBHR2AViVhOV7BVMPxJ
         IxWAWlFWiXQN+P7lFnbWQ/dULWta+BlLT5k48+PTaDQen8FiJw5jM74P5Jm1chL7Fzml
         mk4IM/faMtrVRcFqYUNKXH4/oTi14hOW8SHat+q/00ecuC59xeLgsCPZtLfHw6tIN3xM
         xU8nSBfJOqsfAKPvgDOBYZJuameVmgwFJxAmi0HArOmDdOee58uj4HtRcjMTlpHITO+K
         tiNEeRFQN5zhrgqodSy/QGvhFrnN07RLS0uVOLIb3/K188H7qc0OMrgAd0uT91M/1LiH
         g1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9ucaiasafJWVLo8H1ml0lvhBlTDBTGfYuTcr2tmIkkk=;
        fh=UL+zeOm+U/q81g5oqe+BYnHI0Kp5pyF2FDvYFxhi0kM=;
        b=o94cUPyBGNPGEAtL30jMj7EkYARsMbLSXP3BSWeMrQ3eNLgYbpFep211tA24xng+hu
         mkdGhcHnM+acm9/38y2+yI8ZZtVtsNKcUMjKKIIDnAGN9yr+rSQn8mp9KtjyPUAvjXeJ
         +bFRAZ5BuueCYG3ENtMEhMdWfmJcwzviIzWdQSg26+vFs9pDz0Ycoeh1yk3HzrAOXqAD
         MNM/dB9OBDvbvbnqxZjoYA2SbCYo4uHORi3Z5oNRUFoKexlsub9cgxyG398bfbW3/aIs
         wSFa9CwCQ8SHmxd0pOUtqcQq5WRT9N6o+Lmgp6fyQNzYgqxJINYb7zZokb3Qcz9F3Q3i
         l4/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847683; x=1795452483; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ucaiasafJWVLo8H1ml0lvhBlTDBTGfYuTcr2tmIkkk=;
        b=BRZpPH7CWREXoIQVx4hqWeRD2Q55mF2ONQt/rqbgFw+JCVZynGVS5mcNl9MqThYOT9
         20+ObweLK0jkmtZ1W290Qf+4riG2nCByG2J+6GdLBeskWBTA2tLFL5mcEmBDnPSWATBU
         BQI5CY9G1xEXxZu55qFcoBCQwGmjz9Z9pC3gd3xNAHs29aEmMKIRONon9FOOpo2uHZ2Q
         ywr+KylRdBAE1Eik7ZBk3/A7E+nr4uU+WVQ7mcRDCRBv5n02bfNhsTlxCqKMeqNtrDyF
         VbvgectNG77arQt+0qlPXBhIA+2vS1vGuQyqbekduzFfPYsk9xzMDhHUNP9rb2ifqGnD
         6T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847683; x=1795452483;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ucaiasafJWVLo8H1ml0lvhBlTDBTGfYuTcr2tmIkkk=;
        b=QZoukPU56nZZhAT7ojJqCQerdLMHt2lG4LkxVbKnl5bsIBnlrcOzJyCNACwB4MqgRh
         dpf1ggeArR6Qiof1E4P9wfbY/Am2jJjJMzTl1UOmIX3k+3euFX7kxthQF72WFl4X3/hw
         QuzC2QjEI6emspFtqKWaM4JYkIQu2lrs2dc95cpKNXIzjUcbrdMVL34OM5NlfeQ3eAa2
         K9YTsbZKkh5srXKREIalnwzqb0/+zuSw0Ta482RXKoEIl6IqxZK3wHhHba6SZRB/l8GC
         fShqWjs488s+M9/ZOjtRwjNdzhJrFk85PEtfXzoZOMDSl5MKMoWcaEoq2UncpprGKgLe
         2ZaQ==
X-Forwarded-Encrypted: i=1; AL+hErFdkp/0Jx/ET8jj+fMNuvsSFhHxx4Qag9UEOdZ4SnODG/ZhvUhSEFUqWmYH6fP+pc+UTN5zYhtXATvC1rnM@vger.kernel.org
X-Gm-Message-State: APuU4Z+K9BWtO5mzboT3EnN2oeP9voKtIOrDH/PVUc9sNjgHwFlid8Xr
	Dp9WdbWxtfOH50DP1ftZjtfZQg79xKj4Vqtj1RwiMJjfv8bSctJTrp6Dq1gG6triD+NvOtq5IHa
	u2LMTmptrLd8q2cKgPvPJcLTCZFFvThM=
X-Gm-Gg: AYBFou2e60Y8b38juxY3kSfMhQa48Aa5G78dRo8i0pomIwMezOjP+ADNuJL3YXDvHGO
	CVpY+wGMbqcyXBcHC2IbyViN7oaiF5Y6AJ6TDplVxNGvBrKbz5d23C7Fb/J8O6CNETbE1zt8aW9
	AVS/2WfmhclRf/JWn6VuG+/ompFcPcNuyn4uXjFk2WfCD/CiihXRhuw02OHjgz4qQ8L1rf5FX67
	UZcL77MQw/+q7j5I2WChFm6AYmVQ72c/3ajgE4UJ8NQS3SO9a2mG4w5TB25bZ0NsSVOwvh00jc0
	6KlFjk1kmbd9o4gR1HQfd2oUDuu8rNcvgDM5EtsLIeTFCL/yIgSfsnJRHdEZOCWISp34OsmwUDI
	s1z+lOJyoJTW8LwVnxJVSi+CNPNShJnqQ2YQcLxNqm8t8xwHj2VzNB6i/nEk=
X-Received: by 2002:a17:907:1b06:b0:c41:23bf:18af with SMTP id
 a640c23a62f3a-c509614e4famr897868466b.5.1794847682879; Mon, 16 Nov 2026
 08:48:02 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sm8750-llcc-island1-v1-1-64055702ca3f@gmail.com> <79ac053a-3235-4da0-87da-ebd8da01e4a4@oss.qualcomm.com>
In-Reply-To: <79ac053a-3235-4da0-87da-ebd8da01e4a4@oss.qualcomm.com>
From: yzddMr6 <yzddmr6@gmail.com>
Date: Tue, 17 Nov 2026 00:47:50 +0800
X-Gm-Features: AclHuK-Lr4J3nNZOiRUCcA8IWzVao3HnhljllZthBc3TfeqQ8ypxS6Przkn-9Ek
Message-ID: <CAB63uaGQzATJHQgA2ohAothVDYsAhAhPDrcPmgLzwO9EvnB-Vw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Reserve ISLAND1 ways on SM8750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Melody Olvera <melody.olvera@oss.qualcomm.com>, 
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2026 at 08:55:33AM +0100, Konrad Dybcio wrote:
> On 11/12/26 6:35 PM, Vladyslav Tymoshchuk wrote:
>> It does not cure the reset here. The tree is v7.3-rc5 with out-of-tree
>> board support, without Ajay's series. Each run is one 60 s s2idle on
>> battery with the USB cable disconnected:
>>
>>   this patch, Wi-Fi WoWLAN enabled                    reset
>>   this patch, Wi-Fi WoWLAN disabled                   reset
>>   this patch, rpmhpd domains left at their highest
>>     corner (rpmhpd sync_state callback removed)       reset
>>   no patch, MC0 kept voted in the sleep set           resumes
>
> This means something is accessing DDR as your platform sleeps
> without voting for it. That indicates it's likely something that
> Linux set up, as various subsystems (ADSP etc.) cast their own
> votes.

Thanks, Vladyslav, for trying it on the Pad 3, and Konrad for the
table fix [1], which includes this change.

On this tablet the reset went away once the ISLAND1 ways were
reserved, with CX and DDR still collapsing, which fits that reading.
Some of the numbers below are from a second tablet, a OnePlus Pad 2
Pro (OPD2413, from the same erhai project as the Pad 3), which runs
this patch on the same v7.4-rc2 based tree as this one.

>> On this tree the two votes do not seem to be dropped: with all five
>> macro codecs runtime suspended, clk_summary still shows LPASS_HW_MACRO
>> and LPASS_HW_DCODEC with a prepare count of 6 (LPASS_HW_LPR_VOTE is 0).
>> I read that on the workaround kernel while awake, not during suspend,
>> and the codecs have no system sleep callbacks here. So the resets above
>> most likely happened with both votes held, which is the state your
>> tablet resumes in.

In the one s2idle cycle I ran with each of LPASS_HW_MACRO_VOTE and
LPASS_HW_LPR_VOTE held, this tablet resumed with cxsd, aosd and ddr all
staying at 0, as with your MC0 vote, and Gopi reports that held LPASS
votes keep CX and DDR from collapsing on Glymur too [2]. So with the
votes held I would expect DDR not to collapse in your runs either, and
the MC0 vote to make no difference. Since it does, I think the votes
were released in the runs that reset.

On v7.3-rc5, as on v7.4-rc2, the six consumers of these votes in
sm8750.dtsi, the five macros and the LPI pin controller, take them
through pm_clk, which drops them on runtime suspend. With the five
macros suspended, only the LPI pin controller could still hold them,
so I would expect a count of at most 1; 6 looks like all six were
active when you read it. A device that is still active when system
suspend starts stays active until resume, though, unless it has a
system sleep callback, which is what Gopi's LPI and SoundWire patches
[2][3] add.

Here the count read right before suspend was 3, 3 and 0 for MACRO,
DCODEC and LPR in each of the 23 s2idle cycles I recorded with this
kernel, 18 on this tablet and 5 on the Pad 2 Pro. Still, cxsd and ddr
grew by about the time asleep in 21 of them; in the other two, both
on this tablet, they did not grow at all. This tree forces all six
consumers and the SoundWire controllers into runtime suspend at system
sleep (Ajay's TX/VA patches, changes equivalent to [2] and [3], and
the same for the RX and WSA macros), which drops the votes during
suspend. Without such callbacks, a non-zero count read right before
suspend would mean the votes were held.

>>> All of these suspend tests were done with a USB cable connected.
>
> I don't think ToT linux will let you get cxsd with a cable connected.

On this tree it does: 21 of the 23 cycles above reached cxsd with the
tablet attached to a PC as a USB device, and so did the tests in the
patch. The tree carries a fair amount on top of v7.4-rc2, though,
including Vladyslav's USB GDSC retention patch [4], so I can't say
what ToT does.

Vladyslav, to your two questions: yes, this tablet resumes with the
cable disconnected, though the battery cycles with stats here were
PSCI system suspend, not s2idle. Each tablet ran two cycles on
battery, with an RTC alarm 180 s and 70 s ahead, and resumed at the
alarm every time. On this tablet mem_sleep was deep, and cxsd and ddr
grew by 179.1 s and 69.2 s. On the Pad 2 Pro they were s2idle, and
cxsd and ddr grew by about 178 s and 65 s. aosd stayed at 0 in all
four, as in every cycle I have recorded on either tablet.

As for MC0, nothing that I can see is voted on it in the sleep set.
The interconnect drivers are as in v7.4-rc2, where the MC0 keepalive
only votes in the active and wake sets, and a sleep-set vote on MC0
would keep ddr from growing in every cycle, while it grew in 25 of the
27 cycles above (21 of 23 with the cable, all four on battery).

One difference between the two tablets that may matter for the Pad 3:
on the Pad 2 Pro, adsp_island did not grow in any of its five s2idle
cycles with the cable connected, which ran from 59 s to 2.9 hours,
although the ADSP does enter island mode there while awake, and cxsd
and ddr count a new entry every 5 s or so (every half second on
battery). On this tablet the ADSP stays in island mode for nearly the
whole sleep, and with this kernel cxsd and ddr count at most three
entries per cycle, even in one of 1.8 hours. If the Pad 3 behaves like
the Pad 2 Pro, the ISLAND1 slice is not in use during its s2idle, and
this patch could not make a difference there.

Since you offered to run variants: could you read the three prepare
counts right before suspend on the kernel that resets?

[1] https://lore.kernel.org/r/20261113-topic-8750_llcc-v1-1-6536cb46d7fe@oss.qualcomm.com
[2] https://lore.kernel.org/r/20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com
[3] https://lore.kernel.org/r/20261112-qcom-swr-system-sleep-v1-1-a61a83f6475d@oss.qualcomm.com
[4] https://lore.kernel.org/r/20261110213346.1359-1-tvlad744@gmail.com

Thanks,
yzddMr6
