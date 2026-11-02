Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634880;
	b=lwpS8JPSH8QqWt2OCcFYd/UOuMaVYFNF8ZfDuo4BH4fTMLA4HfI87zFi5c/lWtcPAumR
	 1BGZr7p3oO9NTPQMd+i+Hh9lW59MRVJm64J/A/zvHG2UjSVwNEZii8PCoOtv44P93yeNs
	 XlcPQnX9KNMwriP8xhW3vKmdBsx3+53HzBMo4kqsa3lM77roLV2IysNkDh0jHYMxhGQC3
	 5tXKDdUOlplgB3lp2p15DwHILKl+7GV6Fd6FC9Wnf/ExMT167clqLG8Xc9yvuMp8nfTev
	 jES/GWgDJrWPrYYsl9r5djULsv1XtTzsfBk2aujKVv5dxshbCq2/RPKn9GETGlv/Gxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vn+1zZ+E+vaOD7UpEKJ9Trld0l/HcprwkYOwtqDxBhw=;
	b=CEFLQW2pxJrXRQxZ9xoGw2FYYFmbtlc4tC0xYGuJFqxmU0VuhY/Io8pxRR6vLwY0Yxa/
	 w/VKex5OURu0Daqg+47Ty1ONhqPcTSl4Sp2+5ylJgVFumlnoK8Q/BKe7Oz0jRH30s/ISk
	 Wtm/oLa02Z/KOb3sIZf9vO+y7/tfEAcNJuB8DEnMRgqI6hYorwdUD9gwbrVn7MnH/WZso
	 8jKi76OUMyeuPVh9t/r+vPzKV7yquBK0hXKyhV0PzMlprZZKKzOXxvK/67iFV/eCLJNLA
	 sDhXq/w06JGi3dnWfcUohUfsEg71Rt/EmzlkKvyOLIcPoEPa3FBjSQ9iXy5vtFpfO2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sj3Qn8TI;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471B607B40F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4471B607B40F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sj3Qn8TI
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2568531f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793634879; x=1794239679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vn+1zZ+E+vaOD7UpEKJ9Trld0l/HcprwkYOwtqDxBhw=;
        b=sj3Qn8TI+LFldrKwJgsp0Rok0K4uG21HRNkKO/mGN+46cVKszR61/78ClGBQKacrWT
         h2ZI1FTSSXis2gnzqjITBBjb/o8cgjIaYIqylfnSe2RYmsjKUWQAuG4KALWYo/tr8LGF
         TPkU/6wbOVrhvf57BOKYn7yRq9YQgSwlXXjxlqmXRccTTAx0wCpBmTcL6LJQP4rzlIk+
         a1uckgSSPPcBd/2AGlt6xN3PhHVUHPBF0DcktCl6VmUMtFvS4KL0Yw/j5BAXZ7rnqiM8
         OsO3GuA1ya+BHzyScO2oIzPJyOaIp6vL5RXoUChCpxA9KxrOTXGzZ5mTBsp+na03obxi
         cTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634879; x=1794239679;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vn+1zZ+E+vaOD7UpEKJ9Trld0l/HcprwkYOwtqDxBhw=;
        b=XaNgDaA+OM4fNzacATQzohmZr/mr9ne1Q6erqZRk/CIg5JOMD1jV40pa8wQBwgkBqn
         4DWAzrk8h6ov4IPsqA5voIXpGYv8gXzyP1AK55DfRQ6NmptwKhT67EKoEzNlgiEE6LVU
         /8QgdZYoDOyvHma0whyKcYaLpf5S282Bl0Mtn1vItyHNekGa80u8femCs1ksuw6Y7wcd
         VjxYPsjE54MQl6o08hB/Uxe9gi9wazXTDcXXA623/H55tVcOexiITI4V/ifJ9PiIe53D
         ChZjN1vC9+R43301SG+gfvQTHR/s+5diCe/D71iKRH0j9W8VvWMlQFLmdBio/L9AriNi
         oGDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0blulMuMQMGgD9Uzp1dAnKwmMq6iiVMuA1lWWezWtPbLfO8ohmPcjgzNb4nPVtlJyVZ0gSUO83jaLn6Bp@vger.kernel.org
X-Gm-Message-State: APuU4Z+FyKXEOK8aHCoJW7Ii5utMJazXahHarjr4KfpmaWIZ+M7RWppE
	sPVPUBfQRT8kandB/b1TLggP/GeOO4WgneiMNaKi6hL+mGB0q5yWwaIc0WNW1W3QgKA=
X-Gm-Gg: AYBFou3bDiYcB4pkSwn3rv/RwYDKHKEc+qFLW1BMYq6+yvQ4lJ/XPTW3AeFdFGyeJS9
	XxKmjuen8eOHeGxb+6b97XNkP/TewHbs6b4ErkJTCSqBO3DXZc9qzu7W0aLJ0g4AIClJYqe1NQD
	c/Htc/w/Jbi6oCUF2KMKZasSgv9eWJXVd6fAX5GTUJDQ0xNsEHa11qEo+1mhMN7GKubDPqpTGUv
	evQyUHIfOY22VYOFfGtkXCauqAKObQgaS12KPGgXLu39Nk4TnArDQImdRJbrY5u/3LFHLv20L5r
	4dEXcp1j+G7Tw+glNtnBZFLx4iLUkVrD1DEghl+OOBaGHurcW2DTR0vbsi0o6ZN0A82JA1LeOkW
	f968flvzHFmZyJph5z7yi1ChkgoeRMY2MOEzO+vTzPT5I3/7ImwextRJTbynLiihsLogCK85/fh
	AXbSVA4Te0Xf+xfApdwZFikAKt4LAT3rJsP5NYOfdtSZstfPSuYO13nCEU6hznl20Ue+mSAZjYZ
	XynXQ7i6OBMPTaJjOxgwRKmWDbqSPITKe9LCnY9Ztg206fk3nteqdrRnKUhOapF3X8M8BkHvDEv
	U0k7nlTYiChVHmFyDR6l0J0mRVkSWP4Zj6JLazE8iotmU3zQnpp9JsjTcTI=
X-Received: by 2002:a05:6000:4a0a:b0:48e:2448:ea23 with SMTP id ffacd0b85a97d-48e6e307864mr24148547f8f.55.1793634878411;
        Mon, 02 Nov 2026 07:54:38 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d511sm20298463f8f.8.2026.11.02.07.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:54:37 -0800 (PST)
Message-ID: <0785069a-eea5-440a-a12b-3c01a02b579e@linaro.org>
Date: Mon, 2 Nov 2026 15:54:36 +0000
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
Subject: Re: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
 <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2026 14:32, Konrad Dybcio wrote:
> On 11/2/26 2:56 PM,bryan.odonoghue@linaro.org wrote:
>> From: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>
>> Switch frame_sync_en to true to track and consume SOF/EOF data.
>>
>> Tested-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org> # x1e CRD
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> ---
> Is there a reason why it's gated behind a feature flag? Will
> exposing a SOF seq counter that's always zero (i.e. not
> implemented, never bumped) have negative consequences on
> userspace?
> 
> Conversely, what information (i.e. platform list) are you
> lacking that would let us make this non-opt-in?
> 
> Konrad

Yes.

To be in-spece we should already be incrementing vb.sequence not on 
every RX data-frame but on every MIPI_CSI2.SOF. You can't just return 
zero as user-space wants to know about sequence numbers.

---
bod
