Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AF83F86F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912098; cv=pass; b=dVg6MybmOnVlALQ7whQDel+JoOozLm2yxRZ2kRSxU2y2QeAXkvi7hREQhTV5nl4AT64UPwB92k2kVHoYEeAZeNu54CR43x9TvAEyLPh2pITiY0FJfnaf6sPMo5da17MhMNW8s3QvKUiT/g4AKSb4c54NkgNDK4nb+l8GuTF0Inw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912098; c=relaxed/simple;
	bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcd09BktUnhDPm+AcywNRRlL4nsvkZ4SzcZwt8kpEUQI0MKDvklakWLFL0Jv5S6RPcjGQ3921PuD4Bwrfflv4xko+h2pP6sk0u6ZrfE9XuD/3uLOIcWlTwXKK0UZoo0r2ih9we45yoYnj7gNeFrv7HySZH+q91lzoXqeybf5LuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=no6m/T5B; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no6m/T5B"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso139245566b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787912095; cv=none;
        d=google.com; s=arc-20260327;
        b=ScHwFzvSC7hyQrWug2I/K3rBQWS683jC9wwupEWbA2cdzZ7bpHe/fhYxR0xmwwUW+7
         /Gn8xPMDwKkJ3IKswZKydKvFLxN6a35gIEr6fE4mk7dQMs7MbEKUR9tGcC/gtPg6ikjh
         AAHua8O3Y6M2buX/lq3hsrFeU8CKo6w6zlvmFnIJniTr+15qH34aLjrBekwIpzV1f6CK
         qo5THXcqbjKjCCGIVJ9Ve8SnQP+JbyIaMf5PFI1gRnDaHWRk/58N0HJsw8pMoGEf3EyL
         1kp0u0PYM1aGCXU3TxFURttnmoQa8A9OIi3UxTqqunVNO6y/jAXsUHwHQk+FzbpAVXk8
         yVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        fh=Ccn90d/5XaIQTOsCG807HzEu25HKEUK9uDveuVRFhyI=;
        b=XWSRGXd2SOTREZg2p/5RZ0JK2f74gIxfZe50Ve6Rc9rXM2R17OdIszQLWXv7KYLcqY
         +dtI17yT8+gTJSnvq6ODcugNoC7g3fguBvZb3FYVaoQH4xnmDR4fB9Mb1/MrT/Jc1q24
         cIVAxpiuXdcthuQE2UnOmhm2hj2OwMn+jgGTiFL1MqTcfL4AOPONtJzt7WDymoG9aJW4
         sXTZhbQXkqDdo/0N51gng/KVfKRTJCj4BYSOsYzJp7sZJShSQlCL5dnWDu/iV0XRi1Vl
         TEIbVNSf/VU7X2UkrvQ7l5qM+tDkRNZqGkNuuVopr043kxBDknWd21BcOTZ9u3fWeRG9
         +e/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787912095; x=1788516895; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        b=no6m/T5Bw8c0DLSeM5A22ornHVbSjgkRZwqR3U2HtV6WyaEpB6lcmVAz8OpqsWQn6n
         k0UFY2zZ+AAFgBlq19ptPsX5aS9Ed+lv5FaV0kFkHNi6ULX9Gz7jhCFDC8vZBR19Km12
         gosgw/9brnv0PsIRROiroFwImYB7XEyZnDc9Eo2ietqRa6WkoLoRLBBn1TrzWQYL9y5n
         7hJyzBgQsJbv87gqIiQjdo4yHX+TCZ3xBEN7KehsnhAq37TCpJK2KOuJ0NOnVsnKynq0
         zdQZ42ESzDOPfyH58UrNlbXf/pokJRApl5inRFNmWRWZJP/gF+LHckYfMy3wyAwuzNQ6
         SPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912095; x=1788516895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        b=qCzSp4Tm3RAN+XRlXzj6KgsxO/fn0rWTIfmOoNcPqM0Z7l6qiEfSHITQnXz6+0Wn9m
         OeQQ/3xIv3qbK/hvsx7nlX3/Fj5aUBVQ8JNJMeT9uEi/jTvY213B3nMJMb8IyedOCNsO
         wzdT6XPXNPoogBV0L/+qL+yRDLKTLtsBMGwMM8A3CTYnL0SshrSV6Jn/ys2QKMk1rFRn
         yhpZMk1Uw2wLvB9/T7yo9BTr8llKfZb/0/B1RTWWor1fVyjJNw4DaQEeoNDciuTi/GKf
         pCHq6TDWTaFB45/TzbH5+SMu3VRkxSqNlrEImHgcrux5FVH8Oi26O3OFxTVbBTgS3f9s
         UrXw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz/Vh8TxSMrxZNyKT/FFtznQFahT5azC8cI7Oolafiu8gd4ZUcFOpIkviOInSj94wwKgGqOWfyn1FZ4h/O@vger.kernel.org
X-Gm-Message-State: AFuF++nFjnGZD/oflKWj5ajn7xzFprITYC659JCDo/jixcgPs9Aasqjw
	HRn3KSqoE2GAyjGqCZP6xuaahQK/MMW3imRB9LPMP61st9BdSPZdAgvfAzYtpPQP9XLX7L+5xIq
	bN7kxccXSzrVBATWbCxG6h+WxH3K/Zeg=
X-Gm-Gg: AR+sD13NCPZWtEfaQ850eRQn8bWhQokUBK4Za+JIwdPLQUkKRh5MnJo7Efx3+RWQWIN
	wALv4UUWaUYU5D4Mwc6fyoGRwY1Z2gFGx0B7eTBJjWYfcoCeBg+JxhKl5jdzDuBk+o88qB/Tc5i
	1uCh3n/5MuhzHtSiJUWlJGlJfOWEJ5voDW03dTpxR0yuNJstDgLa1V/CvvUQRkW+I3Z7Zturpxw
	IHyBQ5YY0kjxV9eEShiCFkKZvlph/DKf6udxuGz4mE+gvxJrQnlwBHUR3I44jcGB0BIkpjdpf19
	tUp+6Fn7HJKxUsPQYqqaP6jBdWHrWYvRnYLrnSIyEW4y1MzWOi6MW4Uw9b3Ur084WwG1vDO2pRm
	/B9Uk
X-Received: by 2002:a17:907:d0a:b0:c25:32b0:e56c with SMTP id
 a640c23a62f3a-c2556bc8abfmr482808166b.4.1787912095085; Fri, 28 Aug 2026
 03:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com> <20260828-liberal-jumping-quokka-cff4da@quoll>
In-Reply-To: <20260828-liberal-jumping-quokka-cff4da@quoll>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 28 Aug 2026 15:44:42 +0530
X-Gm-Features: AcwNN1WwE4fV98-9nbf9QfdMe5RP3mFos-H2h5xcNNdmEyy-SXjW6DtC1QoidsA
Message-ID: <CAA-+uk+5zWvmTB5NCbWpBqHSw6MswBAaJHGHw5LnKm4SBhXcLg@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] Add initial support for Qualcomm SM7250 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 15:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Aug 24, 2026 at 03:01:43PM +0000, Sreeshankar K wrote:
> > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved memory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> > Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > [PATCH v5] Link: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
>
> Please keep the previous changelogs and links.
>
> Best regards,
> Krzysztof
>

I will include changelogs and links of all previous revisions
in future revision.

Thanks,
Sreeshankar K
