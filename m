Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D547043B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806238; cv=none; b=U1a3oCh3BMiFgrIcR/PraytDpYa85O1QJsJ7N55ezgyp9b8zHZVUwLosYzEoG7pHsdgq4oleZSDo2Mr2mNSHt2pY1q6j/O/7ATgxZj9BJmjIR3x+OnFBiqHblqwFV2v7YFBtYV2XTOqqxxXc0OeVfZrcP0MQQkB3GmKndwbTukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806238; c=relaxed/simple;
	bh=Eb4s4/iQHSUXZ9HuzdIz7QSVMesCI0MvaBjzTEDaKaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmNvt4CNrILo6z7wA1Vum8G28PCTyERTFQSBgvK/5/rXcMLVc6JR3d/08zPPborGemW8y6uXXVaKN3R6sGokvNLhmQLG0TWvRyMAHyEqAg8Po/h9TqVr7zhUsvk+Iq2SC2wp52YOHnVZL0kdxBTjUj8kDEM7jB24r8/nLxHHr6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IAvG5St3; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAvG5St3"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b0190a62beso99078e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784806235; x=1785411035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=87QtCEbDS1yneeD8KD17fyRLqP9fiy/6kt3pJMDAIBA=;
        b=IAvG5St3jeYXItKhzczUcDNpVd9GzRRBoVtxAKKOEx0vfwRjOvNjR+Ss9GqNFSG1Ey
         aqyEEbCeE7tCrZR+kVjScHLdYt4hkhWIMX1IigjKq/lQvlRkL6XbJESSl/0hUk+3bzO8
         5Bb7gNljRmBIvsNPEkOeAuxcsKiTSL1SLbsjxAo6XGeWAexSQq5Yy8SEmeE1I3e4Cmsr
         94nKNsdWD3aTgnS0l+KwPaZgap437zfMxjCtKCFXKh0lQau/Q2xLmbF8I0iaO6wKR5IE
         l8QWWfrlhhBASjL4bTGJCGmyM61Fjn8PwS0PlIepBKOJich4MZZnedviD9sQNsybe/lZ
         9kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784806235; x=1785411035;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87QtCEbDS1yneeD8KD17fyRLqP9fiy/6kt3pJMDAIBA=;
        b=PvQR/4hgn00c9aUCAiDK5XGatpm5czVCf/xgFuXqT2yWs08iy2QjOz8qOAeUC0xiLu
         6kv7oxR8A1CV4gIa6hTqENuuT7FldaR1qhK+U7z8sV0Xu1IDiEg58gduI/NVZwW0ZtfY
         ju4hic8uHSzeKKfVL/p5APfPbM+u3Cwd5ilwsZtvHEY21L6mIvUDWVBEocggRN2j/Iyx
         KCYoV184aV24yabnqd2AV09qVPf1wpONyO3W61HZsdrUTnph/EruEe5MHXUo82D63Ge4
         C2BfsBBCL8PCyBvSi2LOu3ggiYBj27MsMZ8L3aQtfrre932N5TjT63Aezk7az2WHUQUP
         tyzA==
X-Forwarded-Encrypted: i=1; AHgh+Rpq36QkFX5bG/xKD8WQy9VLj+el/Ud+vACh0V7MX56EONFnqiAGPr6HZDFZDhiSQ+HL6p5kLmMpHKKjvHj3@vger.kernel.org
X-Gm-Message-State: AOJu0YylEn0xYmj1ZspIiSeE8OtrhzIotXkE8IWjCB5rZ4TmfaSJKxWq
	pOpnYjJ4+OXdkYeqE6WRRV1RCgaQMKGKo+5b47wzbV0ftxICSVe13qw9gc1UJAgk4dY=
X-Gm-Gg: AR+sD10w/C1fwsaT33P0GpgGxo2flcaqwEEg1ooh0GFkTABscK3Xh8o3IBb/zSe9rmF
	7A0fd6nBxmDICk9BgnIuHiK3faw7QwLxULEIk9ZE6P67LaucR+20nhSe4hSOMipAHQfpP1pirWJ
	hsQl6WFCtm7twVSqYdR0+sA9KOyZdLp+Qh164+6iYT6FkIdzwia6UgiqA/vUkqhaAS1NtFMXV8Z
	pnwqKwJSGPBttGp+8AgjAyEGzUCa+wuL8Vseh9U2apk88CGcmUvjZibUWuSx9A4YPq+uhE4izvk
	ZAE0/MEXbArLr84OCE2N0ZfiWh4DbUNEQ47l4+PwEiCdswvFbYZAXt6fOPC+7nMbm+67JXWTU36
	lHQ38KjL1sZi3/HCRqnQQTSEZIDepuAUk5npFhnN8JueGIrQKQqMwqeyZP41m2aEeMChOe5NRCI
	Ei6FyFgOwoW4koATIPif9QpouLTkYOeSc+we833Zhyw0bbfgkH9e8RWl5bxO8ntzM9IbU=
X-Received: by 2002:a05:6512:3e01:b0:5b1:5e89:30f6 with SMTP id 2adb3069b0e04-5b2b2f6efb3mr290535e87.3.1784806234965;
        Thu, 23 Jul 2026 04:30:34 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b0c511sm985237e87.0.2026.07.23.04.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:30:33 -0700 (PDT)
Message-ID: <58bb39e6-d87d-4c47-9d43-aa878199c31e@linaro.org>
Date: Thu, 23 Jul 2026 14:30:33 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE
 lite clock lists
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 14:09, Hans de Goede wrote:
> The "gcc_axi_hf" clock is correctly listed in the clock list of the
> 8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
> causing these to not work on platforms where the firmware allows turning
> off "gcc_axi_hf".
> 
> Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
> these platforms.
> 
> Fixes: 924f45e58b1fe ("media: qcom: camss: Add missing clocks for VFE lite on sa8775p")
> Cc: stable@vger.kernel.org
> Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
