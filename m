Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407740;
	b=Ui4/lT1r16lK2t/bv6uU6pZl+9up1qfRSiwRzcqZ75oS+i5ApBq/ZVMwTPs4nxQyHpBx
	 CeE6Gt67TSsE/qbWaqdZzZZmYSJ6RS7pOGH22TfQSu/YXmCbfs2GDkL/K3UfsHPwTLuvp
	 xLZEayIKX2ZYlkS08QgoagOkOhQ+QQyFJUKwDafHppvHqLLxDLWhd0kEOYvy7cmyD+MKm
	 DErwzC7iW+P0dZlb5cco63Yewb1EYvzEJ2yJErwOTDH1VjGpc7Hy7VSPfBts5kfajnXot
	 lCvCqYTb0uKWm1mrJThu+mbz0LgqW9vWmsMwH+IM4KnDlijfzFN4Tr3qRvqqwR0rP4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Lau02JU43W/hog/yKJRveOgSPeZUVSI1SbMEi/mraWY=;
	b=v2sRjxsKtjGz2sgIkyUlNtqz56mysznsgYQcIhIGzS8qxcoC/Fj1C62kRq1Pj2ciAegc
	 uvYvcdXj701kkDSFFJP8MP3RK3BMV/4jftA99U9MJKq1nYwDc+iQyTCRi67XnW7nB7OLN
	 U5bhv4+JqKGhIlGd1cREBD7dl7z7LGq6RhvXh7QUq27Ug93z5aks+xaD7RiE9VT9QArBR
	 7Z+bSCP7wF8Y7Uf9QU+s4x0195mjZseHjIfHNrmWgCzsrH9cp3qIWRRK3fXzWqtjEeVZO
	 yEQw/eA+nh7AblZlKadIQm+WPJHRY9LvCQZTrQSaA3GQp1nuWbNIdXM+VeYGuKCmDYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tApccBJY;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C451606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C451606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tApccBJY
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso25030825e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794407739; x=1795012539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lau02JU43W/hog/yKJRveOgSPeZUVSI1SbMEi/mraWY=;
        b=tApccBJYxGqYQ0axQSwCJPn0mwq2weRps2CbB1jIwhxYbrvOD/qMMKljbwL9hVXS74
         Bq5tsBi2L+q4Tsw5R2xzIDpQyplM1pXPHpAwjgO3otf9997xSSSo60UzxeDoZRbXYryi
         JQdJsy+xVPrCkupI7Gf4vMm6SuqxzvygBY4/qeWw2O2SXl6GCAwasomweInRz+0KoS8z
         I19pjTJbFW4qKAYEGpxjj2eAV44C/SwlA9lLWUKiHNIPtxkXAkEPl7qPJcxUqPSn6Sv+
         ShE9T6jeYB34bMiGVDINraOaVozuMlE/OpN4JPPrNmA5/d8wA0OR7xVzd+AJcPfk/G//
         qdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407739; x=1795012539;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lau02JU43W/hog/yKJRveOgSPeZUVSI1SbMEi/mraWY=;
        b=cR8rxLfZARe0uJlMAWFZ8B6fT8vV2VrLz0yT8MsrVNM0CredttEpm1NW+eMLwaU67B
         TmkuoD1xxe7PeblfPZGGzPgoE3sYZw0iSmzukQDlFZmUREAl8OWo5PpnKkiMCtZrOiY6
         UOEFM+uXJAMUYmFHxACbbF3ea85uteJgv/JI+31lWL0qy9/LhJ4ASa6iNg+sJASCv5YY
         GQRy62Cb9orw1tB3oU9c79b27+DvFq2p4Pdfjfiq6UUqQ3Nc1eiCusXmgjrKtTqv6hqK
         Xww4VVtO0jkOiEP7c86xVmXZ6CGMQ378JeDaovMFkPkqnp+AAgqZSnU1k0tD0tzO6KjP
         IxQg==
X-Forwarded-Encrypted: i=1; AL+hErGz4T6IaOD2sGTMJ7Vn1pFXKWiJ336opZLYknMZIOYJSrKOLVUcAhb6lMbbPGCy1gsK1SxGcX3JDlZaFTbD@vger.kernel.org
X-Gm-Message-State: APuU4Z+V4Ce4CrLpoW3keLWgoBPyeJ/a/m6pbGaVvPa716nkRtXSH0Gv
	aR60JYB0cOcSVKqHOSIorgpMo51CvQzQI+guuuJO2LIDlMXrIGSJ4mZQxvuEp1IgoB8=
X-Gm-Gg: AYBFou2+i10UQq+wS24V7lsqLweUyWCvDenJEq7eVBI3h3eHmM5kwwsswiFoS1TF7wD
	HSBQ8YSJsQgUgVsYRJN4G7jFzbWs2k/+bfk2sem8oTOBryHaCnJBThjml2osrvcAH1ImyzjUhYF
	PCmTADlvg2fUqLzCj5DFINK2mpd9PNUfsGi6pA9iROuDf3wK6r2OYrHEQKKWf7kuGdB4RwGoUiA
	iZg5Dhy/k6gkdThRextf8KBQJAyG0Ad4ZO0nxNAVs8chdI5GQkhW9YfrAbten78FX2E3hKuBJpx
	9HAhj9NT86aAYx0D06rRGNzhI/variDFPqDKqc5r1zBEwbADyTiMw0fQkMj1hULaP1Yd3820wXR
	FyySw0OTtL6CZl6uu1CeqoMvAh9UCdTHUpXVYsV1Vcm7FI3tg10Ofs0o8/d1Kja+9fjSC0Rb/cI
	J3OMddXSww7G8xvbQHxvSo73mmEOqNl6lEdyXBd7SFnMrPKXmnz29TjsBNPwV8U1x6v8zuapIrL
	dvcbVSh1hQFye7JQMih7/HgY9B52GJoZZFLn45JkP3GZT2HKWCjdBXFc/vSRaGBLocx7LDULH3w
	t+XmwhcX/sTcVid11yEDg1ybcCczahOLibRO5k4G
X-Received: by 2002:a05:600c:190a:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ba0931ed3amr49687875e9.4.1794407738850;
        Wed, 11 Nov 2026 06:35:38 -0800 (PST)
Received: from [192.168.0.167] ([109.76.11.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836a9951csm11475146f8f.56.2026.11.11.06.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:35:38 -0800 (PST)
Message-ID: <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
Date: Wed, 11 Nov 2026 14:35:36 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: qcom: camss: vfe-4-1: program the RDI write
 master buffer size
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
 <20261111135338.27008-3-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111135338.27008-3-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 13:53, Allan Siriani wrote:
> The RDI outputs use the write masters in frame based mode. In that mode
> vfe_wm_frame_based() only sets the FRM_BASED bit of WR_CFG and leaves
> WR_BUFFER_CFG and WR_IMAGE_SIZE untouched: they keep their reset value or
> whatever a previous line based (PIX) stream left there, so nothing tells
> the write master how big the buffer is. If the sensor sends more data
> than the configured format, the write master keeps writing past the end
> of the V4L2 buffer. When the CAMSS runs without an IOMMU, as on
> MSM8226 today (the SoC has one, but it is not described in the upstream
> DT; its VFE 4.0 shares this register layout), that corrupts unrelated
> memory.

This is a long and rambling problem description that looks like LLMese 
to me.

I would appreciate a more direct and succinct problem description.

"MSM8226 doesn't have an IOMMU defined. If a sensor writes more data 
than WR_BUFER_CFG and/or WR_IMW_SIZE expect we will get an overrun."

"Program WM_IMAGE_SIZE and WR_BUFFER_CFG to restrict the maximum size 
the write masters can write"
> Program WR_BUFFER_CFG in frame based mode as the downstream VFE 4.0/4.1
> driver does (msm_vfe40_axi_cfg_wm_reg(): words per line, lines minus one
> and burst length, IMAGE_SIZE unused), from the bytesperline and height
> of the active format, and clear it again when the write master is
> released.
> 
> Pass the active format to the wm_frame_based() op for that. The VFE 4.7
> and 4.8 implementations, which use a different register layout, are left
> unchanged.
> 
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
> Signed-off-by: Allan Siriani<allan@fatecpompeia.edu.br>
> ---

Something like that. Please don't let the LLM write it for you - the 
word-salad is difficult to take in.

Commit logs should be elucidative not occluding in nature.

---
bod
