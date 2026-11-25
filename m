Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621202;
	b=y+8BIyflBVtzRu0ZWWEUwfP17ECwTdW2SjtsoG+XxAeywjbYoMF83vWUbdCFDw2pJw30
	 ahrXBNzcLyS40rN1BChXjPOinyxN//xGc7ig+Q4skcPfSqi48ZuXkMmfmmxIrSNCBIVgY
	 zAgVn0IZ/sM8T22FfYKTZdAX9SpKr5ohCJnVRv6cYX7gyV9ZGPZn4RaB8oumPgw+0PseL
	 +Pj2KMTQr9kDk0mWhAzIHV7lqxvWu2wr27PHtTKC4Nj1iE3FohsMDIEaBQKtvzmdG939a
	 O6qw1C6oSwxbHY4Qz2MSYdNiLkhKNUHDI7f5IzbwJYCyqBSe6Yr83ubljCvsUIelDjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
	b=qVFqx6kIHiDcF+VjgRTq68608CG2h0P95bN47eQpXvhpnN+M3Ir6gIiMqn8SmRgDt7RD
	 N+vewMQ6+6rFfTmSgUnSKsTQ06fcq+JP7o2jA6pbWXQTlQfZWMUnCVgimz46lW+Afwp6/
	 RoUTAdpATBnksMu1VVRrGPQ1ID+ZLsfsNDTJEBUvq09UgMaX3R8PggR3bFxV7bkki2XrF
	 99q/I5zcm45/3CLr0NNiDj72YF2/5eX88auRSJj6PCTXw9BSjLapN5gIDUmpf/so2oWhY
	 TBAhPYiGHlgEDlJchfY1FIb8I3m126iKnXyAgdFEI/7puScCOWUE+LltnL6n/C5Yyfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RjxdsfKw;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7405606A329
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 15:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7405606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RjxdsfKw
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so55378115e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795621199; x=1796225999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
        b=RjxdsfKwvvddGpQSiNhRsMhHqK+KznqtEzdvJlHNkNxRcNDDOnVVWr0obg9T1+w5YF
         IXSVqRD72Kt14j7/vOch3js9XRZ+MOQav6q+WBeAvgDXBYU5UAlDmPZTqqj8maE6QTzk
         RH8OhZMEzGRWmI13DO0mVDzTjznLEvNsLJudBVG0o/2U0CAzCh/p18Eis767vb0mWFkt
         wOdRWWP4FXylRdYfohZkobSdmX/jcRRrz2lvpCrUBmEAS1NrPXbhC2X+VCfPh1YPFPHV
         tgqR26Le1ES5fcDtsnSZid+RMgOyE6a704dSJca23QAMgNQkjO3J1mJm4VtXdQs4IgSd
         E3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621199; x=1796225999;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
        b=Gvuv3DVuAoQy/QWea4MWM65XQBs1RxLmlKO2f0NrHwg7xgHlTBRGMON2v/YlsdnbAm
         KxuIeaCPOCgpw9F8+du7K+9Xbf+QVstbWC3YztFVjvFcxfghBc7MoOFIpjp4vZgjYycG
         1XCzk8HB6pa7Hc63293R5fwSN1gc8ARpPeOhPdT97rJYdQQNpgz/IL2j6zP4U/cMe8KB
         T/1J2l3lDKLL35VsJMfyPVG8KU40ybqvDUkqHnEYjwkKY6dYNbc7y0+S2irowzLEFbJE
         5Cj0qB9DaF9dKgja5kcSR8ujaZuFV6wGcdnxT0ClAj3vMRYt5FFnmYNZT2/4OK97iGeZ
         Ck2Q==
X-Forwarded-Encrypted: i=1; AL+hErHoyH1Mi3wd7vKI0OGLLNEVRzuo+BhrLnV6UB/Qy0pdpNzFbEhDiC3W7edEu/sABRrDk2RYf9a7M8npgtbg@vger.kernel.org
X-Gm-Message-State: APuU4Z9+PzDnk+3boJ2bi1gQRMzVTF2dh8qM9ryitKG6Yn8v0Zco/E11
	E/Cc2Jrbrbc53L/mEhCTpT7O054xjx1zeTP2f4iANImWtFwBklr4xPUCU4zFrcxQoR8=
X-Gm-Gg: AZFdTZf7xJ6M+ArIpk2/PlzEPSmh+gdiTo+KpdWaEjoK4OQUUL5BDAEzztolacgXlIw
	9V/P1IuK2+oHVyfnq0jZsrXDfNas6GZQV2Mk+55Qj2myMgZo9qksFgf4aiuGppJGI9a+ffNZqwS
	COvaDKclGHLsJiKIUKVQkV6Im/4QesUq0tL/SHeqrR9P05r0ZUYdSoxdfjzcUwmoHepDRaTlSHK
	DUu79Fh8mSMUep3M4MiSd28XHzPzKMhrkE2IhnT6l5sqKducgXkiu15I2NO25R6QYn5wFVOzc0X
	LGCGkju0Q/POitA7WSYteYtFwB2w8niCC+NKCKp7vApehSEU86L6qCK3CY5k2P37BcpFhcP/5T1
	qvdoYtsg+Hn8F24YE3PK8eiKmOrI5umBhpuenLhFYBk4/HtzMILhp5l6M6M5wsohOirs60EpxIb
	cltaspU9AciCQSFTyRR4rXo1lYtg/4l3ZSIArX7HM1IffCoeYD1ziLVPNs0FSDk3EMQWb4HMpTZ
	49JWfxNMlxqzTDGxt6hIjkGOFPxZHagOAjFujbYMvxg6XETgln00sP1CtcRofdwnexlLfsfFlJT
	8mkxD+2zpVBBE811W0B+vyzHgEAM3yIe78m/Hw==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr427623865e9.6.1795621199120;
        Wed, 25 Nov 2026 07:39:59 -0800 (PST)
Received: from [10.229.50.9] ([90.82.202.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm14255031f8f.9.2026.11.25.07.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:39:58 -0800 (PST)
Message-ID: <8a9a4fe1-0fa5-4c48-aa88-f61b3a01739f@linaro.org>
Date: Wed, 25 Nov 2026 16:39:57 +0100
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
Subject: Re: [PATCH v3 1/5] drm/panel: lg-sw43408: use the full DCS brightness
 range
To: david@ixit.cz, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20261125-fix-blueline-panel-v3-0-914b4a30b73e@ixit.cz>
 <20261125-fix-blueline-panel-v3-1-914b4a30b73e@ixit.cz>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
In-Reply-To: <20261125-fix-blueline-panel-v3-1-914b4a30b73e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/26 14:08, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The vendor changed the value multiple times. Last value for production
> devices was 900. HBM can go up to 1023, but keep value safe for now.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 822318f546ef3..92cab6478ea61 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -197,17 +197,18 @@ static const struct backlight_ops sw43408_backlight_ops = {
>   };
>   
>   static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   {
>   	struct device *dev = &ctx->link->dev;
>   	const struct backlight_properties props = {
>   		.type = BACKLIGHT_PLATFORM,
>   		.brightness = 255,
> -		.max_brightness = 255,
> +		/* HBM can go up to 1023, stay safe for now */
> +		.max_brightness = 900,
>   	};
>   
>   	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
>   							     ctx->link,
>   							     &sw43408_backlight_ops,
>   							     &props);
>   
>   	if (IS_ERR(ctx->base.backlight))
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
