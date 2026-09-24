Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E92F60CC
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 19:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790279585; cv=pass; b=Q5jKywyBhV/+Q2TEW1OWWn96fmNXRZ9E6K0RrQvEyf/a4WwonioNh33LTivlb99i8K4ikcEmUXPhniRMEFg2mD23KgLNEujScZ4kv1+gBWzIZdG6y/gP4hDtUQJhtgJRSOkDnHH5ou3kEmMrtZ0SKmbsWN3X07CSBj32KEsgsdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790279585; c=relaxed/simple;
	bh=QoubT9CoXhKpEUyyyBiFnbmENvqSUiUg/q8bBXketCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKtqixnyHJVY84djI3jZTiBDQHAWv+EBbSM0x2WqiZDI6QaPARlWIXfGlu6J5gIMmIxo6ePVpZ5RvjGNEO2Qjq1U6vqw80ORj2fST+4pmEoU0+Vk4EEmuMl2Xx5jNqtr6Khkn35tXna+lVZEiZtq/ZnA7qYo7vnEqJOZ1t7s8SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=qyRdLfhc; arc=pass smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="qyRdLfhc"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7ac5b4011a4so105261137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790279574; cv=none;
        d=google.com; s=arc-20260327;
        b=gQUI16z2CeRmi/7WgImmNISNt2gCH4pNe0ql5j5DIeaLrerMiRDE/u1MRLAUuS6tll
         oNrhkPuOkAMbd2JndhINkPsVGTb7qfIQfU5p48U6eWqO/7pPja4xD3UdiVf3wqW5osjZ
         1AaQ/DsV6jBDY2PcXlRIF6CNcjqnahJnsjlv0SGfCofxMkBM9VWM2VYZl4b0p11Cb1VU
         CRNILkROyRCZOyb1LayzxOMVcdSpDVnJ9K6XPT64iZl+2I5n5C/M6QaqqKHu8fAOHAiK
         lNG4AphFxC2ZHxXqraPekIKwYnjbWBS0Q60Q+nRcNtU/Y6SgSBDBc3U/c3glvmYYR7jF
         Y/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UWTnqz7gHpCXSb1m9qCCSqzvyxAbuc/zoS0Ar8FS4l4=;
        fh=Ue8O49kHBu3SM4vg8vl98xTMvvVquWhV5R7mw/oZtJ8=;
        b=JImriS4HGJ4bGVkaG55Rtc60Z60vvKRgRtIzx1QUdKVB974ZwU970dxIO4qhdn9kdL
         FFaA1ty7EGj+r4A3h+qJNNS7DQJodaBPWgsFyClwDuTeEZADbl7qC1x+nmtwb0xYFZZe
         ibW5mlUyR/k80z5Vjylw47XB4Lx7AGSdTTtzpFM+py7bX59KPPbW4NpGGbzmr8wY7cmL
         gHSKso5kJGULARiz36ZySgkheFAH8VTl/oVfc1o6JdDDLsfoeuBfYTer1p2p9pKFtpfh
         AfzThx4biqmcHN21+vSZWnsDkuoi37/APvQoq53mkydO7SrDQlQ54UtbgUPh/XVSV0+n
         Ytcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790279574; x=1790884374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UWTnqz7gHpCXSb1m9qCCSqzvyxAbuc/zoS0Ar8FS4l4=;
        b=qyRdLfhcgyRcsb9h50M0Xs2yyGilj46mmpAW1RrzesjpafuKgEpQCxfLZXUess3oyg
         WYpiruTSta4ce4G6sFP3W7we6wx9kHBbZehNbuOYCPhmjDkqLLSI5pdElXzF6htOVRXl
         Zo57zg/nuSEZi6nbv1skbB7Z2okM7mV+BXmIc/wr2x1CBNyyob62IYe6G7CI4VwLA7jL
         8s4iADFbqGOc6et8S3HvhCmH0C8CBU9YU/Tmxm3n2cCoPgOVEWzRDBp9oiPOJzDOJIgg
         q38RtBoz9gg0hCxWQBnY0MmEgZaeDI3FI0+QMdbMI1Y4N+TMfqg89CgU3Y7PTVcoEVYw
         MoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790279574; x=1790884374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWTnqz7gHpCXSb1m9qCCSqzvyxAbuc/zoS0Ar8FS4l4=;
        b=Xx1hPjCq1c+aPndDZNYtjDTWj2tfFDn+VD3S9BYRDc/YcV923Gv8L0QKZt/pthaHCj
         1zYSAwPFTZiJxhPsMZIkVnhUI61Le31WlUCbE4dYE7ze+a7Jguvynov7fklEnHlLkjvQ
         JOJz82p11UxiCZZcnGHA56hpG3XoGCd9clnhcJ3Z3MKlBvBMZLgDG+YhWV19r8B+9sIY
         1JpBB1tV4lXxV9tVUgZDc0Ae7ip+wC20Xuvdw7++WmKK9PFIne0qg56as/gHVT7OcbZm
         rKgPKiXvXzzaCzWPfDh0FgfAxYzkIzgoY66aDYWE+gfOrDV9jq24UbX9D1fi0CRc+n2Y
         ydSw==
X-Forwarded-Encrypted: i=1; AKwUvBxv86Qwh1MAmRdgZG7Dcuvo3EAf2O5X8ZovJJAh2jIQFQds3Ze2pJXJwGrmyS61kc4sk0apvamq4VO4nUn1@vger.kernel.org
X-Gm-Message-State: AFuF++mPOt3pGpEY07Y25AneF8YekBkuyoQjEURRD44HRiSRoRImFvoF
	F88nbHkzipmZXHCc7NmBxpzux4ns5Qhu7TBbrP7qi851cIWKQFtz0bj7aFMNN+051RG/pYlBxZl
	YpdaQvW27bWj3SN9bvcBt0hfHyYQ4PiHXojFDRDcBEA==
X-Gm-Gg: AYBFou3Kyll6Tk0rEyH4x3CujczyflCweG5dl1+pgvWqXpmPvVI3USRixC5h5L+DLqa
	Di8Rii3L61AHiz+mCED+X+vszguU/1Twnya/H2zUFeKUayK+voSbdFCkUK9YU1QMq9Q3UmYKVtM
	b4aD2C1w78W88VVmtDz0GRi2GMvQikxy2F2KjNqWNWgjPTFJQkvwnLm++yoiXWP0bzlHOLJDkj1
	cfnKtrh8ygPR2OxUi/NJnOooFLUG2sGno3c3Pq3RmfkvoJjv9PddWkiD4z5iR3rSDl5C1z4AcfO
	6K8D2NMie/hdyMID+oAp9SJibQaMHMt7xkhQU4ZqQo9kZ/UO35ZJeZ6Zgnxc0nJELvw=
X-Received: by 2002:a05:6102:6a83:b0:7a2:2068:6b67 with SMTP id
 ada2fe7eead31-7af1dddb820mr1606892137.25.1790279573796; Thu, 24 Sep 2026
 12:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924125940.22665-1-lnicoara@thinkoid.org> <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
In-Reply-To: <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
From: Liviu Nicoara <lnicoara@thinkoid.org>
Date: Thu, 24 Sep 2026 15:52:43 -0400
X-Gm-Features: AclHuK_leAsQLblHRxuOpdcET2NRKKGqkd34mCi1ubZfnnfcE3YhUz2hrAzgGrU
Message-ID: <CAAhq3a6OV6+Z0p=qVqpUiL-QoP92fYTsf5MBQL-f2oedddW=Dg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator
 volume after enabling clocks
To: Jonathan Marek <jonathan@marek.ca>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 3:02=E2=80=AFPM Jonathan Marek <jonathan@marek.ca> =
wrote:
>
> this is just papering over the real problem, which would be the regmap
> cache being out of sync with the HW registers. there's no requirement
> that the volume register be written after the int/path clock enable
>
> (fwiw, this problem doesn't reproduce on my setup, where this driver
> does not autosuspend and the regmap doesn't go into cache-only mode)
>
>

Thanks for looking. I checked whether the cache and the hardware
disagree on this machine (v7.2.6, where the macro runtime-suspends after
3 s). With the macro suspended, I changed the digital volume from 81 to
69, which updates only the cache.  I then forced a runtime resume, which
runs regcache_sync(), and read the volume register straight from the
hardware with the regmap debugfs cache_bypass: it held the new value
(0xf1).

However, on my unpatched driver an idle volume change did not take place
when playback starts (changed it from 69 to 81 and it played at 69). A
change done during playback though, takes effect at once. I don't think
anything writes the register in between.

The register holds the new value, but the path does not use it until it
is written with the interpolator clock running. The read/write-back that
902f497a1ff5 removed did exactly that; Johan kept it deliberately in
46188db080bd ("Note that the volume registers still need to be written
after enabling clocks in order for any prior updates to take
effect"). Unless I am reading it wrong.

On your setup, does a volume change made with no stream running take
effect when the next stream starts?  If your changes land while the path
is active, that could explain why it does not reproduce there.

Thanks again.
