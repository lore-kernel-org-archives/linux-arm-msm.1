Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782233;
	b=jYfH8bpilaUmuaOdOJ6HHI9GlT5Ix9yQBSfocLUKVNOQ74Q2LVKmhGv48Dgwe0NnCLJ5
	 soe2pJ3lnjtBcOEXyl5ssZ+HcyrDGm6EhGo/GsoucU2vQoK5lKQ/peR69UNrF7hi/qy5/
	 ArG3SVdbiHl2lDG/MEJ6NlsO6Ax5ME1K1REfumDstHHLZCiGZYnEplGeJwUo8HVP1m26K
	 FLuIDwB+riX4zxX8uPYjqy6s/teB48Ra65GEiNZsuvUfX7Y0d5cdkg51bkuusfN142OO6
	 S92veUeUhUo4b+38QI8D/Xx6Hd/qgrIo8KDbGe7rP6nXGGUbHzUcNg7Psdod2O+iRkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
	b=aJM6WGRTYkqBwRtw8JFRBrLItVMhDh4ugGmrMYGACwlIY4AJtakmBiKKJLgyDBru/LHe
	 NS/cWpA7cs3fS5yQgv18T3hQrsdqVPNW7whWLUJkIpx6PZjAdQoVY2SW7ejYQ4x3fYK/Q
	 YFNH+2TrgWpxS/PzljnGsbIVZfegpjhE5Nxam+Gjav6tYEdH9pZ4Doo+uAeuMpAC4m9xQ
	 XOVk26+7Wutj3q/wCVG5Ank3bGHlr0fwW54iMRbuTBQNn3mmai6CguRnXXWMaAuKJdQLT
	 kuVebLvnOOzVYs9laoEndI9C7bkUdi6CP4ZjkTkyq+bIJcGbPtRu+14fGQP5ysIR7FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BeGuGwgx;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2213606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 08:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2213606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BeGuGwgx
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso404719e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793782231; x=1794387031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=BeGuGwgx4Rt87ZlwOx/3AgYM5Q+NiOd8+GRccRF0FlCMrtzc/x8taqLQSg4KpGaFcW
         HgXjPMzoEtBeUJrJfyGki5vj42BcCyW6KuzYGXmKgKsyQdhx/1YqynSk8SkoZjYTqGsG
         kmJnggFJovR02NygTlrcWhWf0lZ39nxvFPuZtvGmWPkrTlPi2XqgbFTdDGngKh2Z4KNT
         cTiQYEX7+c+hx99SZcocOoLEW5nVULFDjHc3EUR44oXYQPDqVQ/RcGn9u+NnhrlR4fnK
         9uXPpNhVdaseLgNSTovn1tSJPvHbL4tY144qOx9rJLcOu+xL+S9EBRK3GtOzgeJOl1/b
         6AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782231; x=1794387031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=jfcBbNbjlOkpzKdS3A6pUPzDv7aRRvP0lIM97qnuN9APM9pq18/BRWC/oc+Algtfys
         O2zqy5lUb1ln2BjkXT6RUohXIpoHy2tycUCYPQqfbEgLJAwHarJfOh4YgEa1BFlXm7hq
         H7T1+85kN9rv6qegGDXmDE+SKLIIlEbx7a0Zz4d7mdSJGL3aVzfK67vSql7fA3OFXQwv
         NUOwND7L5lSQTe3lnZXt5atuI6N3nxToIxpt8ehd1m9riP1I8xuinmt3PxLQhVbTK9FM
         gw0SDf8ECeZhYmNs2vcexkHINg6UtZrVSyww8eyd/jc8DFeLlvrIzeKi2IoUP5dhosP1
         JQbg==
X-Forwarded-Encrypted: i=1; AKwUvBz19cETKPTQ9Akb3Smo7FC5DL9xgTGK61+AZ5JjfQrO5qitcoa+H8NQhYK27uxupX28GWyjTZdOcaMvalHu@vger.kernel.org
X-Gm-Message-State: APuU4Z9jt0L/aI2RBvcHxAHkbmD12Jj4Oi5IIElWkZv3E54I/wV70Vz6
	HQoobLY9jIBOkvl96xlBlYDd++r/naPcCEA6hvnfSmIVISSMVUfp3XWsKGB82GSZk0w=
X-Gm-Gg: AYBFou1hUCkt3MHhqM7jP3EJZKIEGh8CagTDvpj4HaTPkCqW6WZMnmPhZAV66HfAht8
	jeavkSo0pwB42297GIdKI9hNeMSbPuO+C99O298a4fYDIydzAbdgTNpC9iDY1wNm8hVtfVRW76o
	0NUf0PIZQs3DavWYV9adA/t7cXW7OtgRs0sNPxwOUui3KZPTvtkcN3mGYJSm4f3bm7tVeYUiYXf
	+zciQEHA0705HqB0nDz1K8UfFnyGcoWAxj3SCan+miO2kcdxYDuag1E68Kq38fBrVLcUWlHqkur
	8JU+hyFIFG8POuBN2Xkw8qOZqui5cpQNgH0CDjOaWxmumPsV6nxbL3jTX7Rcn8EUZlnCZWY8pNv
	7TMF6eQTpFD88KaMlyA7HHcti6v5Iec3aBxJ2R7mkZHMErMQ3B1cR5NSAqcmex+PGUlhASAzzbv
	DIU+1dHa5qX8a/ctIgz3qaneYL53Q8SMr3rgXsGxCgFAxlx/onk5D02aIzKVuJj7k6uEC0z7k4S
	pdeWl1ldYLwBqN0e6m3VdzKqpKsqT/H3jQ6066uyBgGV2GV5rxGdw7vi92Ndfycg6/o1JH1sZ7e
	qpyN9DMNB8d9nQhSKApNU9DCb2/ljDwogm2qxRt7ykUkKwiAAQ/Rfvo=
X-Received: by 2002:a05:6512:2250:b0:5bf:a12b:9ba8 with SMTP id 2adb3069b0e04-5bfd957cd8dmr5159537e87.65.1793782230950;
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff384c97csm278483e87.5.2026.11.04.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Date: Wed, 4 Nov 2026 10:50:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
Message-ID: <aurx1DKC9JQcO94B@nuoska>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
 <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>

Hi,

On Wed, Nov 04, 2026 at 09:37:27AM +0100, Konrad Dybcio wrote:
> On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> > (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> > yocto kernel maintainer Bruce)
> 
> [...]
> 
> > With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> > in arm64 builds:
> > 
> > LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> > 
> > In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> > get applied in the final .config etc and one of the checks is for dependency loops which now
> > fails with 7.4-rc1, full log below[2].
> > 
> > To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> > driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> > depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> > on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> > now can exists in the kernel tree.
> > 
> > Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> > loop to and from LEDS_CLASS?
> 
> https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Ah, excellent! Fix is coming soon then.

Cheers,

-Mikko
