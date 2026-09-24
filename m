Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5EA4BFE96
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276545; cv=none; b=krsOJMWh39TQhtCw8OSE1NeSpP07DMLQ0JsF+iJpJuxF3Vis9M3jvv//I9E10AZ4XDxEa6APCDBrLbTHitJ2E74ysjgOcpNGQFd6x5OVsfYiy2WjyZXyZWeJuLlONSrfX6evAUAmVIHDrc5uyUOx6DTh1WmKWmRc0bsr2/1fmMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276545; c=relaxed/simple;
	bh=I9rjMdylwRXMbZI50fmpd3PtoFlN+qirBSdlSQ+FEgg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qgQ2OaB+9NXajb0k9Tu8Tz+IS9UT7OuLBk9m5iL1kbSHWi898CFFsFXIkCcBeVuuVRGxTOzNSo2wouJZIIpg09PrackXksnYj6Op/UeD3IOV+1cR2CIBUB4BLJmgw1HP8Q8om2N+r4qUI1YwNiWstc5Hty/U9Pjctf67yPy0RDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=ARqz6Czv; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="ARqz6Czv"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed2so123736241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1790276536; x=1790881336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWQWTkpRc4mjMwr+vW7xfwNCAyBMZNGtR2Jki2MQhHc=;
        b=ARqz6CzvBJHEdx5GkyMPwb5HgkwVuHhCUBU2C4uKpjxxodRk9ko6nIfHGSoXOzCRe3
         3MWjHj9npWLFN02JRMwOSymEe9gPdj5FvEX8mSu/Swo2h5hnlK21UPtKlo/Fvo+SN8SN
         U1cYlmfV7ULFXk38xNY3Mkmo0OwcRG7XDseg9qPiOg2+Cl4Iz86tB245zwvYBL49e+Dr
         BdN874tZ2dadCH98HCAjHI7qwAriRqXUT+8ZNmS+NqlutvdvLfBpMLCynOtjrMzZz4+M
         Ky/mxdiIvrX3rFXZwlWC5qrJkeadad3vjtj6uLFQ7MaS/uhNUUbXh5wK/0kNioOb/myG
         +OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276536; x=1790881336;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWQWTkpRc4mjMwr+vW7xfwNCAyBMZNGtR2Jki2MQhHc=;
        b=IutWYdWOc9PhWGtsn5YX91M2EC1sr61iR02x2xspj3FNkS0H8qqORAFhlfSeJqMhCI
         pR/+s0iakbfIbJ6Akx/+ThCPB2Bhd7MPChr7deJnuxT/8LZRMT+fXNo7lW4lIrwB9ZPY
         8mrRZdEcHnzxBN7S1ItHEnjaxTc8Jfbuyz8586MXpHBzmLjkGYVa1bHwL/jyhg3OeRZi
         +WdbNFrsHE38U/6rG75nMzcG/FD7flKSh4SwukG1JT3QRptNYC8gQqJilne+pzQJQsJZ
         z9SGg7FrZL/OvKoA1+vUsKLkZKWff40lNI10EUCVFk0m8pbhoSeLcKbNzYO5s3iv8F9d
         fAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpB4r4V243dXWsFrMk0BwvXUHAWNB8yq7h4Jdu49Il6esY5Zs3kZtVid/9qfSGQPSIZL6LbLU1z4dxPHqH@vger.kernel.org
X-Gm-Message-State: AFuF++n5JJ8Bd6BA5uUZIGAW4COpl/vUSFhapqKOYQeanLIHIUYJdjJG
	Ob5gt6++oK/11EhyRa4ims3pnCC1pVRtTIbKyIeXZyVVMyLQ8LDepJRWtgKBsAPDCpU=
X-Gm-Gg: AYBFou37FfiCP8s5uzgGMocKuV6SzSTh8RsGEFKFx4d+XNafTxyL9YEeoh3Ah/MBZ/2
	OH2dQ6QfrI1oihJHCpNEd59DUB0ESJdxY0rKFsaalD5QIJJr5ee1fZ9enc4jYovp9G7ueTELaAD
	XdIy2TW0A7fuZtUAVAwBwryC33aff+PAy6hVkqgxuCINtkQmlPKNVOwYoftYWH/4EzuEQuFBDUO
	NQiIlD1pHlSy075mfv3y/cT5sbBkRTlICaKMIwm76f/zp7adxdYHo3t31JTviBT9NOfZt1KAhKN
	NFw4lRHiiJJx+GMDf/2sDRKB4TQAHtsO/RlOEn1tJANqfGBb3BSE/MjuiIEAI92G/RlLPGRPkBH
	jQ+h6LxRqEp7DwzuPqOk3p4Ypi06cvFCNqYxq9e2hjwZeNqY8PoopGA73UoZIx7rDGPE1ls3HbK
	mI4iIabmyJIc+gpe4i2xdn+keXFFTsnI7RyxpPKNJvG7SgXoqyJ8Uh127oPjsPNC3m5DD0i1qMj
	o2YVidDYkLwOEQQDTOlhPvCQQZiIL4E0C5ltnWz5Kzq
X-Received: by 2002:a05:6102:441e:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7af1c79966cmr1958653137.7.1790276535690;
        Thu, 24 Sep 2026 12:02:15 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851e8c4f2csm5199683241.10.2026.09.24.12.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 12:02:15 -0700 (PDT)
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator
 volume after enabling clocks
To: Liviu Nicoara <lnicoara@thinkoid.org>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924125940.22665-1-lnicoara@thinkoid.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
Date: Thu, 24 Sep 2026 14:57:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260924125940.22665-1-lnicoara@thinkoid.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

this is just papering over the real problem, which would be the regmap 
cache being out of sync with the HW registers. there's no requirement 
that the volume register be written after the int/path clock enable

(fwiw, this problem doesn't reproduce on my setup, where this driver 
does not autosuspend and the regmap doesn't go into cache-only mode)

On 9/24/26 8:59 AM, Liviu Nicoara wrote:
> Commit 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless
> gain read/write sequence") removed the read and write of the digital
> volume register in wsa_macro_enable_interpolator(), on the grounds that
> writing back the value just read does nothing. The comment above it,
> "apply gain after int clk is enabled", was left in place.
> 
> On the Dell XPS 13 9345 (X1E80100, four WSA8845 amplifiers on two WSA
> macros) the write does something: a volume change made while the path
> is idle does not take effect when playback starts. Lowering the digital
> volume from 81 to 63 with nothing playing, then playing a test tone,
> gave about the same level as before the change. With the rewrite
> restored, lowering it from 81 to 69 while idle played audibly quieter,
> and restoring 81 while idle brought the level back. Changes made during
> playback take effect with or without the rewrite.
> 
> This is the behaviour described in commit 46188db080bd ("ASoC: codecs:
> lpass-wsa-macro: fix compander volume hack"): "the volume registers
> still need to be written after enabling clocks in order for any prior
> updates to take effect." The value read comes from the register cache,
> so the write pushes the last requested volume to the hardware once its
> clock runs.
> 
> Restore the rewrite in the interpolator's POST_PMU event only. The mix
> path event removed later in the same series is not brought back.
> 
> Fixes: 902f497a1ff5 ("ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
> ---
> 
> Notes:
>      Tested on v7.2.6 on the machine above, by listening. This function is
>      unchanged between v7.2 and for-next; the driver's clocks moved to the
>      PM clock framework in cd054a6e272c after v7.2, which was not tested
>      here. Build-tested on broonie/for-next (arm64 defconfig).
> 
>   sound/soc/codecs/lpass-wsa-macro.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 4242366601a5..899c8bee4645 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1849,6 +1849,7 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>   					 int event)
>   {
>   	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	unsigned int gain;
>   	u16 gain_reg;
>   	u16 reg;
>   	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
> @@ -1890,6 +1891,8 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>   					CDC_WSA_RX_PGA_HALF_DB_MASK,
>   					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
>   		}
> +		gain = snd_soc_component_read(component, gain_reg);
> +		snd_soc_component_write(component, gain_reg, gain);
>   		wsa_macro_config_ear_spkr_gain(component, wsa,
>   						event, gain_reg);
>   		break;
> 
