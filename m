Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A14C754A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 19:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364075; cv=none; b=d7ImoRQuH7xMekWYu+xmntspTkaUdUSOchZKOHwxg/h4BWUIQ4DP4Aj3dVQez6rnHaCjSUJr3LsYUDk47mpnRmbde40fQI9Gp/ZUhBtKT2J4LBUag226ATuaNSqznUU60XdEf3FARBQerQ1xzIfFZdcPqxxBGCOylLpqFYVcZU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364075; c=relaxed/simple;
	bh=KAeKmkNkjuzZG9TiPoOsXDj84d0lGdVN5Hwuzhdo3zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAjYBZEXm/PoTq5FT3uc2G5jBTqL/sfHK8GHkWgb9cTmBXTP8hWnAvwo/TU/hmqz5NlhIOAlXP9CA5uj2O6seiU9TImJTVNZzomd/U+BexvAVPGIAbP/AtcCyidiZBYgvCnCS9/Aon19mvg1pbMLkrafb7r8h7r+OsPqFnbhBio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asnoedmm; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asnoedmm"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3381a6a05c9so755936eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364073; x=1790968873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1AlSXbEjro2stcGQ4JnkFbJoY4FQMoz5yKwywTEmVVk=;
        b=asnoedmmhW/NUgBMm4aBxVE8jnMtXHZduRTjnB9dHZOs+nq3V1NZUKbuLsae4L4pNs
         0lDYM/GFZFz7WCAEWX2h+4B0/VRo3iPsh6nAwt9jNhrj8YNaB7hj8IonGtdWigySKwSP
         2Dsw9Wg4WOImILktjwM7YSrdpU5d448GgHLjB1wZ/XLMGFaW6w3pdz+PJizTZ68OGam1
         wUmHY9vSsdkT/6DatSVcBALStHe5faJmI36urSzWK44YbLUONVANz+RHM4ip++IZ56Do
         GaqWZwcUsR2lLwAn1GEUazWbXYXKjHmdhrbtplL7plnddVWgJ1QFcsFAmiquxIUcLzhL
         OaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364073; x=1790968873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AlSXbEjro2stcGQ4JnkFbJoY4FQMoz5yKwywTEmVVk=;
        b=uSpbeeq06uNFl3MVts9gYXRBrhxmwy9r1xzuW9pp3ZaDfklpGhQJAJlSejh8QnLX5a
         2ZGqjeZTQAGicpkK/376ngwZbaRpvsSYq4na14HzX5mblE4V+p78K/++mvfr6prGJ5Pt
         SCJJupho8QR6sfWo6JxhKRfP7Ybq8zPhoYpa1zg0aVtYdyyxO7j3pENHb+03h9uEsbTr
         H8h1Pu6GgYzsY4t8w2CTfGTtaOpqfZRUxA3F1lW3CfyOAjHDc+hz94Wzuf398MPzqXD7
         clY9RMmZ6RJNkS7q/zGgvR7eNT3BrW5MZj/fOaEXhRGqv/PmFwtSyjDA6mzOkb7Psu4F
         za/A==
X-Forwarded-Encrypted: i=1; AKwUvBxba06fmrK4KJSX0V7sbKCMXztslSB58QglvzdND987m2RfRzizpKSAhx/Bbl04FUlzvdf8iHcCr8Wt3lHI@vger.kernel.org
X-Gm-Message-State: AFuF++n9CsuFWNOBP4lF4ehzwNo3LeqmD5DE5hNDyXKwZm0bP+YdgBJB
	pT+bXRpzcfZMbj74/O2qdsbItHmbz1piX5pq7aoPZgj7dPjkYIlqP6df
X-Gm-Gg: AYBFou04nD+HYUVNDE3AYwdYSB0eMx1v6dwONw5NszDvdja8ElI3N52qWbotjFNWIw7
	oqLuEq++ZNk34cq0pnlfsrkqrQh/PVBcNVxsDGVPisDuA/GZfqaNqfmFXY6fzDJbGXNqSdD4YBw
	iwOd9uAnkEVVSgC6d9joaQiVFRYIDV+9egJqj6VcStwMEsMlEOC7yIGIH6O1TeMun7ODxJUy8LF
	UQkXc8+Tpa3kx4tR6YWTBIpNb5AHcmK590tVBCSbDCdYEVc3l0mByS5RnUnGQfu9LMOay3+nbZn
	lPRONB73z1HoPQctWthrXWsBr55txG7KyW2i8nVJ4G6ZpUi8VAquoBZdJBqVlli/ohC1CtvzFkJ
	XBu8GW6rVl71fpSNeFUYzAlLgLWJG++V+R3nyIlwBseV+oaOLAs56wirZ+BInkxy9FOKc4Ui7Xf
	pEGl4uw+DWJ4UkwOiPBf07JQs9kB9kT3YaboVGPS8vhBC6wjZ9xRz8t6y0JlpR3+LUexBOPBLUL
	BbzLMLdMUmRCc3WiL2xtiVcceft3NgTklLjc9A=
X-Received: by 2002:a05:7022:7e85:b0:143:3242:6301 with SMTP id a92af1059eb24-146ce29fde5mr1024848c88.4.1790364071957;
        Fri, 25 Sep 2026 12:21:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-146bb6551d9sm1708481c88.9.2026.09.25.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:21:10 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:21:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] Input: stmfts - support FTS5
Message-ID: <arbJQezIkyvCf1rR@google.com>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-3-4a53381cd038@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-3-4a53381cd038@ixit.cz>

Hi David,

On Mon, Sep 07, 2026 at 12:50:21PM +0200, David Heidelberg via B4 Relay wrote:
> +static int stmfts5_setup_input(struct stmfts_data *sdata)
> +{
> +	struct device *dev = &sdata->client->dev;
> +
> +	sdata->mode_switch_gpio = devm_gpiod_get_optional(dev, "mode-switch",
> +							  GPIOD_OUT_HIGH);
> +	if (IS_ERR(sdata->mode_switch_gpio))
> +		return dev_err_probe(dev, PTR_ERR(sdata->mode_switch_gpio),
> +				     "Failed to get GPIO 'switch'\n");
> +
> +	/* Set resolution for accurate calibration */
> +	if (!input_abs_get_res(sdata->input, ABS_MT_POSITION_X)) {
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_X, 10);
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_Y, 10);
> +	}
> +
> +	input_set_abs_params(sdata->input, ABS_MT_DISTANCE, 0, 255, 0, 0);

You need

	input_set_abs_params(sdata->input, ABS_MT_TOOL_TYPE,
			     0, MT_TOOL_PALM, 0, 0);

here, otherwise input core will drop ABS_MT_TOOL_TYPE events.

Thanks.

-- 
Dmitry
