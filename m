Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763383;
	b=0PzCnZS0CDVsHPjVimOSOKvzfqLgHRH7YiCqDQL+/8BM2Gvz0xWEmH8u/r45H4JDpoVk
	 5xIhLeRbroVnduFATpUhT5CoZvqAAuAj2+uoF9e3L26/S5Zmo8gZcZ1KiHtlX6xbYZ8AL
	 J3NAMgW0+zeNRCJshhCATY/ohSbrv5aIS7gPUnER459P6+b1qwgokVFmIcOo80ncJCi9s
	 4ia+WphaFPY4dOBkud/TVKbBgruprmownByLasBXcGdNT8P+I2zqGSD9WIW89ByOVBoab
	 b/gRlG+EdBqeOjsmN/OSy3DvX4B3WqAM/PcWPt3yq9NLOMc3FaQtB/m+tMzvmZkVjVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763383;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=S5mKWxyZUewgCkaJ8UXCd6qpsfQcjhPGTMM2jnYb61M=;
	b=BuFRMVN3WonNaQv8WVHGtDsDW/vDjCK2YlImelqTlP9zBveg0b2INU10Eo/9wr8E0rw+
	 CdaJJ2rMzanvI7XfpayImzUH9fBoO3esRh3VOE8Ow6fk6NcBHA06VEr8krUXl3R0Mjn/C
	 NmcxeVZJtyE4Vxbh2pj7TNGqaS/ElHO2tSmQvonf1R7GEEC6IORsUjwfaHnug5TLxb5UH
	 zp4X1pDJh/QXlAbeaR2EeW5SdYf8Dz5gMULHqiHdqc3K7j/fg2uRT/vf79yre1t/Lthq0
	 HPalw49/Y1y+ycy6n9GrkBnfVJB9ev1MChyykO08tJJUlE+ehj+3U+EcQxOhyse104g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=dfMCyGr0;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1488E606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1488E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=dfMCyGr0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=S5mKWxyZUewgCkaJ8UXCd
	6qpsfQcjhPGTMM2jnYb61M=; b=dfMCyGr0zFCSolbwiigi3goHe+8t8XFI48oyV
	n4fkW/vISKAAEy8Vmegru3QSHLNNQfIrb5+/ke4RmvyvBpsYCe0Ya/MKRcbjwyWf
	pfM+GHPgTRMWqZau71qI1YCDaY6kIgAF9fu4JgwNOyGAYJWR11XItnvL6SQ9/3xm
	ZrOIpU=
Received: from [127.0.1.1] (unknown [114.214.178.200])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgB3AkfzZdtqllQ1AA--.2098S2;
	Fri, 23 Oct 2026 21:49:39 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: mitltlatltl@gmail.com
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [REPORT] SM8750 bonded dual-DSI + NT36536: first DCS command-DMA
 timeout on cold boot
Date: Fri, 23 Oct 2026 21:49:39 +0800
Message-ID: <179276337975.97444.18043862696501391672@mail.ustc.edu.cn>
In-Reply-To:
 <CAH2e8h6_pACX_j8YBDhhSZzbfs45waF-Y6KJo82_2c6BT0suEg@mail.gmail.com>
References: <179184923104.248043.14168731037113716140@mail.ustc.edu.cn>
 <CAH2e8h6_pACX_j8YBDhhSZzbfs45waF-Y6KJo82_2c6BT0suEg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgB3AkfzZdtqllQ1AA--.2098S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAryDKr13CFy8Zr4rXFyxKrg_yoWrGr4UpF
	W3tw42krn7KryxAr1kCw48Z34I9ws5tFW5Jwn8tryUAa15Wr1IqFyYgwnFkay2kF4xtwnI
	vF4q9wnakF1kZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjxUq_b1DUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREJB2raZFVZigBisu

Hi Pengyu,

Thanks again for the DPU answer - it reordered how we are spending effort here.
Two things, both about this same board (TB322FC / Y700 Gen4).

1) DT coordination for sm8750-lenovo-elden.dts

Your v2 adds arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts (1170 lines).
Our tree carries the same path and filename, 3178 lines, with your copyright
header kept, because we imported your v2 as the base and have been extending it
locally for a year of bring-up. We would rather not send a competing file.

What we would like to do: after your series lands (or on top of its next
revision), send the delta as separate follow-ups, split so each piece goes to
the right maintainer, roughly:

  - display: mdss resets (CORE/CORE_INT2/RSCC), DSI PHY PWRDN_B sequencing,
    panel supplies (vddio/vsp/vsn) and touch
  - remoteproc: ADSP/CDSP fastrpc qcom,non-secure-domain (this one removes
    ~300 lines of boot spam and makes sensors work again)
  - misc: audio codec / amplifier / haptics / backlight

If you would rather keep the file minimal and have us send each block as its own
series later, that is fine too - just tell us which shape you prefer, and
whether you want to be Cc'd or would rather review them in the list.

2) Do you have downstream sources for TB322FC?

Concretely we need two things that only downstream can answer:

  - the battery/QBG side. A maintainer asked us whether the OEM remaps the QBG
    properties and whether the downstream kernel reports power_now at all. The
    stock build here is user/release-keys, so no adb root and
    /sys/class/power_supply is denied to the shell domain - we can read
    dumpsys battery but not the kernel attributes.
  - display init ordering on cold boot (who programs DSI/PLL first, and whether
    the bootloader leaves the panel running).

Your v2 cites GUF296/linux for TB321FU for mic/speaker/vibrator. If that tree
covers TB322FC's battery/display paths too, a pointer would save us a lot.

3) Data in case it helps your display work

Since your reply we ran a controlled A/B (23 real power-off cold boots, same
config/DTB/ramdisk/cmdline, only the kernel hunks differ):

  without an MDSS-block reset at bring-up:  5 of 9 boots failed (command DMA
                                            timeout, panel never lit)
  with it:                                  15 of 15 boots OK, p = 0.003
  split by hunk: block reset 5/5 OK; DSI PHY-only 3/4 still failed

Two corrections we had to make to our own report afterwards, both negative:

  - the -110 command-DMA timeout is not the invariant. An image that removes the
    bonded command path entirely shows zero timeouts, reports "panel prepared",
    DPU renders, and the panel is still dark.
  - neither the latch nor modeset re-entry is the lever: bounded retry retries
    and still fails; restarting the compositor re-runs prepare and still fails.
    The only quantity that tracked the physical state was the DSI interrupt
    count (41 when lit, 0 when dark).

We also moved the resets out of the clock driver after Taniya's review: the
three BCRs now live in msm_mdss_reset() as a shared bulk reset with a deassert
prime, and dispcc-sm8750.c is untouched in our current daily.

Question on your "hack the DSI clk source select for the 10-bit CPHY plane":
which select do you mean? On our side DSI_7nm_PHY_CMN_CLK_CFG1 already uses
SEL=0 / pll_bit for this 30bpp 3-lane C-PHY case, matching downstream, and the
resulting pclk checks out arithmetically (756839941/2 * 16/35 = 172991986 Hz,
which is what disp_cc_mdss_pclk0_clk_src reports). If your hack is somewhere
else - an INTF/dispcc mux rather than the PHY CMN block - a register name or a
patch pointer would be enough for us to test it here.

We can run any patch you want on the hardware and report cold-boot statistics;
the unit is dedicated to this.

Thanks,
Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

