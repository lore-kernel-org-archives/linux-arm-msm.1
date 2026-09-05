Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADEC29C328
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 06:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591290; cv=none; b=fhU4HmKLQI3txIXQONxBKJ/QQWV5yYCphGwaai8veH9r7lEmLoYj35PHPj4D2N1nHchasehtd75NCKAjUD+rbM7hCCDScLJ8Iwopv6rPWqvOymps7brdRqMrGjmSg9SI1ORhP4L8usLCmzg9h7Heqr0UGgiegt8baGx9HF789Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591290; c=relaxed/simple;
	bh=UrGhHTU8MRvGiPN1mMj/Fzk7F2LzGQZ4IIlq3nTBbAc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=ey5HMc/WnwPqV6zweSPZ2Xm1h1VktjdnPBkGiw26tYAL+yBEw36F4rbY1tOupAkvwWS3q1Qkm1u4SkNk8T0kleBHfuAjHZo6m9RMfgeXdU5ooodCeOMR7DC1Y+JhirVtNW1h5XGcdomuI3DvZ+N32rJFsIp417++vn2I77E8OX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com; spf=pass smtp.mailfrom=ferrisoft.com; dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b=nXl2LJHo; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b="nXl2LJHo"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c20ce3c118aso355960266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 23:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferrisoft-com.20251104.gappssmtp.com; s=20251104; t=1788591287; x=1789196087; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SlZOwE2gxMp9igH71u8jaG9HaW47C3h9syv0hxH/Boo=;
        b=nXl2LJHoifVqap3a4TGX6gYod1wJsA+wr/py4vcloxAJc3ZRphW3X5BL/I68nsiRqQ
         8oAR9gfb+R+BcSSd0iMe4N/6YSSa2Il54uBCude20F86Gw4Y15TGOi1U+cwyYLG36bAM
         ygiJlvNVw7vyb+MVSFEmu+BTrwhwq/rBHZDHGUXkmfnlYICpC1ll/X4nv1Zq8soMQHeK
         2pOBOV5YKdG6T/9VQVzrUxE5QEk1zxGkXjoFSnSX93MSU6dDJmf+rNK9jAT0mrFEpyQD
         1EHPaXiKzsLwOdlir0Pn0UcDuLHzdhE60XiuhPZiX/A17SQJuimEQ/rAPZwzH+J1hyWH
         2AQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591287; x=1789196087;
        h=references:in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlZOwE2gxMp9igH71u8jaG9HaW47C3h9syv0hxH/Boo=;
        b=rWKA8kEwg5gyFIK1oR+ETfl5lRbUddATC3WJNSiQoz1RO8eoBBD35eRrctoeDVtPf4
         Yb99gexejFaY0cC5azVPBNm/hiHYuJ6R0adOobq2L/+C64hxwcfUWqpcpotyCPNkF8Vb
         oYOgGuVrV2NjDakb9N5+UNWEHYj0JA5ut5ihMNu68PFW+35/X3x8iE4ySRqGu24rjYg4
         lw2Qcp+OG4OAgykskIBGU20oRj/DR2RBZCuwh5ji/MVBRhTPclKKWrqk4dr2BX8PHjei
         tr8Fbo3tSC2SOXTLnlRbb/2ICJ5cTZus9NeD4uZWGC+hTW/4bdmIfp+KgXHTdBTLzZ25
         QbMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBWHHd6Df7DwZyZzSB8jIx/BmmoHhjZvJt3TmvVtxqrmnS4ycm4GBzQVgA3NaTijSn1Oj4uvvZkB824XyV@vger.kernel.org
X-Gm-Message-State: AFuF++mnIOBdJEM9X2b6o3/ciBtKUXDzHHjiVCwXRRZ1Dp10aRl+wPIw
	/ULvMfH03rRzRrxcB5w7QqxG7r40B1TT0JUkENR9xCKGhwpxeBvKcGWVJF3gDRCIS9uv
X-Gm-Gg: AYBFou03dmcvZ4mCebgRx2YDYK5G3z9imv3ghFc5ioaoFZATKOKzVYSBLQL//xvdGQh
	SwAuW+LFQPfCCt2pBff7UYyPjXzXnmnD/PBR90GasAJ/sG+NseH1lQ3VjIvAupRfZfpwlN4YbKe
	6Bj3zusXytklUaGjyQXY42FAcVf8cVrQsQ+QLLn7Ut9uKkKVB1INyFL/zAMtRrUqfldfoD1eibP
	agmrIb35MmongHp5S9MZbGzHFQILJxn0hLwfGcvCz09Y8LjrOOp1WSmD5qUhoxja9fasRqo0x+C
	8QYgKnXGRH+bpsdNCSV5elMW0SGyxYNEi8kG/HX6NXBfCANeHyALhJHFiSPGG/pnXEAsNE1nqqt
	j/G/yAf+es4uCRa+ddLPCkhJ9qRL4wntBdwQ+gkUlysADCb9+oYERfYArFmvjZKRLH/HZXcPD4i
	0Ly79Cnoz5reB5oqM4SCgGKJsv+e7g57ThO4VfKxgI468IAu4ReXvu4sEVKZQlZKjHsJpgc/MjG
	1QOgskdh/wzDx1jVLCnJNn6EJEFuQ==
X-Received: by 2002:a17:906:7953:b0:c25:f7dc:2d7 with SMTP id a640c23a62f3a-c25f7dc09a7mr619235566b.24.1788591286638;
        Fri, 04 Sep 2026 23:54:46 -0700 (PDT)
Received: from outbox-0008-reply-a8xx.eml (45-11-61-69.ip4.greenlan.pl. [45.11.61.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5b29f3sm195278966b.52.2026.09.04.23.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 23:54:45 -0700 (PDT)
Date: Sat, 05 Sep 2026 08:54:28 +0200
Message-ID: <20260905085428.reply-a8xx-fmax@ferrisoft.com>
From: Greg Ociepka <greg@ferrisoft.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <rob.clark@oss.qualcomm.com>,
    Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
    Sean Paul <sean@poorly.run>,
    linux-arm-msm@vger.kernel.org,
    dri-devel@lists.freedesktop.org,
    freedreno@lists.freedesktop.org
Subject: Re: drm/msm: unrecoverable a8xx hang-recovery loop on Glymur ("cx
 gdsc didn't collapse"); killing the offending client does not stop the loop
In-Reply-To: <30d4a7b4-1f1b-4589-b132-2115cab98b71@oss.qualcomm.com>
References: <20260820154428.1278@ferrisoft.com>
    <30d4a7b4-1f1b-4589-b132-2115cab98b71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Fri, 4 Sep 2026 04:29:16 +0530, Akhil P Oommen wrote:
> On 8/20/2026 7:14 PM, Greg Ociepka wrote:
[...]
>> We are happy to test patches, run instrumented builds, and provide
>> full journals or devcoredumps - the machine reproduces this every
>> couple of days under normal desktop use.
>
> Does your tree have these fixes:
> https://lore.kernel.org/lkml/06489359-1b96-43ad-a065-bfb9bee51a10@linaro.org/t/#u

Yes, all six of them. I checked each patch of that series against
linux-next (cgit):

  d9108bfdb746 drm/msm/a6xx: Fix stale rpmh votes after suspend
  b303e1d52811 drm/msm: Recover HW before retire hung submit
  fc7ccbc6174b drm/msm/a6xx: Fix A663 GPUCC register list for state capture
  d052d0358fb8 drm/msm/a6xx: Fix A621 GPUCC register list for state capture
  bc024d325e98 drm/msm/a6xx: Fix IRQ storm during msm_recovery test
  40b793714ad8 drm/msm: Fix task_struct reference leak in recover_worker

All of them are already in next-20260730, which is the tree the report
(and the four incidents in it) came from, and they are in
next-20260831 as well, which this machine has been running since the
evening of Sep 3 (7.3.0-rc1-next-20260831, with the same local
platform patches as described in the report, still nothing anywhere
near the GPU, GMU, GDSC or clock paths, plus one unrelated
fs/buffer.c fix).

So the loop reproduced with these fixes in place.

For completeness, the timeline since the report:

- After the report I started running thunderbird, the most frequent
  "offending task" of the earlier incidents, with
  LIBGL_ALWAYS_SOFTWARE=1 (llvmpipe) as a user-space mitigation.
- The last incident on the next-20260730 tree was on Aug 30, 12:10
  CEST: 689 "hangcheck recover" cycles in one boot, with a different
  client as the trigger, so the mitigation did not prevent it.
- Since the switch to next-20260831 on the evening of Sep 3 there has
  been no incident, but against a historical rate of one every few
  days that short a window does not mean anything yet.

> Also, could you try limiting the Fmax to < 1Ghz?

Yes. The OPP table as the kernel sees it here (available_frequencies)
is 310, 410, 572, 760, 820, 915, 1070, 1185, 1350, 1550, 1700 and
1850 MHz, and max_freq is at 1850000000 as I write this, i.e. the
full range. I will cap it at 915 MHz, the highest step below 1 GHz,
through devfreq at runtime:

  echo 915000000 > /sys/class/devfreq/3d00000.gpu/max_freq

and keep the machine at that setting under normal use. It is a sysfs
setting, so there is an uncapped window after every boot until it is
re-applied; I will log that window per boot and check any incident
against it, since onset correlated with session restores in the
earlier incidents. Given the historical rate I would like to give it
at least two weeks before concluding anything, and I will report
either way: at the first incident under the cap (with the journal and
trans_stat, reset when the cap went on, so you can see devfreq never
asked for anything above it), or after the observation window if it
stays clean. One caveat: this stacks on top of the kernel bump, so a
clean run would not tell the two apart on its own; if it stays clean
I can go back to the full range on next-20260831 to separate them.

On Thu, 3 Sep 2026 13:16:47 +0200, Konrad Dybcio wrote:
> On 8/21/26 3:35 PM, Rob Clark wrote:
[...]
>> Fwiw, the kernel I've been using: [1]..  but that doesn't have the a16
>> dts. I need to move forward to something newer, hopefully I'll get to
>> that today.  We'll see if I start seeing this issue.  Or maybe
>> something x2e vs x2ee is different regarding pmic/supplies?
>>
>> My device doesn't have the highest OPP (1.85ghz), which I think your
>> device does.  We might be still missing some power related features
>> that are (more?) needed at higher freq's, or maybe I have a more lucky
>> piece of silicon?  Akhil would know more about this.  You might try
>> removing the highest OPP in gpu_opp_table (in glymur.dtsi) to see if
>> that improves stability?  (Repeat until it is stable if you have the
>> same issues w/ 1.7ghz.)
>
> Greg, have you tried this?

Not yet, and sorry for the late answer on this. We have not run the
machine with the top OPP(s) removed from the DT for any meaningful
period, so there is no data point from that side; what we did instead
is the mitigation and the kernel bump described above. Rob's guess is
right: this is the X2 Elite Extreme part (UX3607OA), it does have the
1.85 GHz OPP, and it is currently running with the full range
(max_freq 1850000000, see above). Mesa here is still 26.1.5, the same
as in the report, so it has not been a variable in any of this.

Rather than removing OPPs from the DT one at a time, I will start with
Akhil's Fmax < 1 GHz test via the runtime cap above, which is
reversible without a rebuild and is also the most direct test of Rob's
"power related features that are (more?) needed at higher freq's"
theory. It is not quite the same thing as dropping the OPP (the GMU
still gets the full table, the GPU just never gets asked for the top
levels), so if the capped run stays clean, walking the cap back up, or
dropping just the top OPP from the DT as Rob suggested, is the natural
next step to find where it starts failing.

On the x2e vs x2ee question: I have no insight into PMIC or supply
differences between the two parts. If there is anything worth dumping
from this machine on that front (regulator state, the level table the
GMU is given, ...), tell me what and I will collect it.

The offer stands: at the next incident I will grab the devcoredump of
the first crash state in the loop, before it expires, together with
the full journal of that boot, and I can run instrumented builds or
debug patches on top of next-20260831.

Thanks,
Greg Ociepka

