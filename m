Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C486A480DF1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110945; cv=none; b=CE6m45kgrfJmlp4QaqyduASZ4xWzjb+4J8Vji9V+TAKqUjd0+N9pXXGnt3Twibo0V/3sJ2CBNnwhs5JcpdCGKMyjajDQzZYeAPpYXVdEg6N35u0jgH7/3Fi7qxO+gbb0tXmclDYGWY+uDIEWRzUsQVTYJcGpta6QLFUh0o8DexM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110945; c=relaxed/simple;
	bh=mUiTpuXZ08jRjcCjuhENhAkI/h8z83dpTQbKz9it2Yg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dZ7WibFe79l6J2oy4Ba+xNHp5V2p6q3WYkPgV7QugfyDnZ6KqiMfMCyQCgUW0wU599NrfcvAU+q9PPL8E/vkawY9+Ocy8BguDB0pcETkFMvIJK2mRej6SZCvArzyHcODdmVBvSRxmeOtzrfhbKsriwlNuNYGunxMQYLz+cS9Bt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Xz3QqWbe; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Xz3QqWbe"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939109f067cso23510785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 14:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790110930; x=1790715730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9Tj2oRUZivsRV4DF4owfEOUU+s6qPBlsbxiJLCQngg=;
        b=Xz3QqWbeNe6T5XRZz5L3+ChBpuAe4QPy1Y7mRbru5/87Cowhbal5ABl6u9iE2l4eQ1
         TERdKW/fX4uCs4gZiVPwynPb23FRQYsBNj4CR5aFLLDYlKY4M3Ir9uhjDfsWygU7s5Ww
         HyvmXKfYHhu+gwetWtM7Q+Kuw3YVA3QgGhHoJXqupjIUePjx7LhiGMDtPhatKgwHLBuR
         /7YOGD3GWNNj01hLOQhodylUG4ITUQ+KcNwlGjtGpdSZ+czxVMiZLdDKSOXmGQqPATQ9
         Tu59Wo3o73/oS7jmXsm8quAeT+Tbt3jir2usiSjE27Fss38BKaM8kC/77bYr4GFs4mzq
         XnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110930; x=1790715730;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9Tj2oRUZivsRV4DF4owfEOUU+s6qPBlsbxiJLCQngg=;
        b=ehilzSL3TwRmVop+9CVdUR1J77b5j8oh9DBAS8cwP/sNxXL8bXMecoaw8bh3OwZJSg
         vvC/6tmhYL0enyyI4UgxAbUQGV/rfCI4BXojV7HQEv5aFIS/1lLMyfGyzLP55leoEyVT
         EYWkwn061tGQeI+1ecY7AsHGSGxQx2Fy6UKKVgNUm2+Uf6H9HhStKSiFw9rqsB5v93nz
         PWmyuQNVtEBzpRxtJIBmNe5VvVsIWja7zAP6+rF0eIi1Rwl3Zp1qqADTPIb+fgRS48Le
         fLVz4SNk+nevDbu1gAgqsdf8uwPDNfUu4s1HO2F3MzBE4ReO4N0Ob+NCGJVyBfcpyS5F
         7y9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkEhUevzkkh3UcHacfyYLrpZ4JhaIhtIZG/Uya/UPKe6mgjeCQE1L/vIVJ2KEc0LHM7M21YCZeIQvBwTcG@vger.kernel.org
X-Gm-Message-State: AFuF++lAG5hzX1nZuQoKxXU1BBInwFboeWs9tLAU4KQT7Dm50McAQp+q
	7PSXZ5LASlwGnRm2+LxKgOeJJYOKPCrnkzswA7Y2duEks4gEvYtDZAE9k45Pw/ivrAw=
X-Gm-Gg: AYBFou3dNQnySCtd20FKbeYL4P7TyE8XCSsjjJ3KkPDFVp+P6Ztnh1QWVd3Zugm48oM
	ca5FBlGBgR8tQvjmfXEoMa40dEu0p5M4Mo3zfk7zDLQso1+UOLYLqGwKii+bWVwjNhe0VsXbqJA
	dyPvE9k3o5GnuzPRmFXfMWa0VJjGfUAaEMNUX6L9ckd+0KbUGhtfc5z7Mnthv0KxFPLSuUmqfaY
	ZG5k2lwCj5c0K+hK3FmsIt8NL2JsQVBGA6vQw6fs7Ihgcty0o53mo+la1FYPEohRi8xZDCY+yQe
	Fnd6prztPA88QGCNdIKgIcVDMQLKFtzpXXzmxMN5GUYrg8mCzoN/ZFCz5FKA3+KJTZAwr12s2GQ
	e6U6pCrFr/gIrZIrD3oqZSrcIq9l4GZSuSQU/3yRNxvt1odX2pQguSkZszIr+D8v1MKvyq3PWEj
	IYWmzZp4EOzRAsHKBPCDefAL2T6Yl2duLE4k9LeJQptVVVldc+XApxi+0TGJgl3WfkP4fGiJM=
X-Received: by 2002:a05:620a:2682:b0:93c:2419:37d6 with SMTP id af79cd13be357-93c252555e7mr100858985a.66.1790110929661;
        Tue, 22 Sep 2026 14:02:09 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24822e3asm69157885a.16.2026.09.22.14.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 14:02:09 -0700 (PDT)
Message-ID: <7e32063f-f1a4-4259-96c9-fcbdd25c7f2f@riscstar.com>
Date: Tue, 22 Sep 2026 16:02:07 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
From: Alex Elder <elder@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-2-elder@riscstar.com>
 <20260920-fiery-fanatic-manticore-6abf0a@quoll>
 <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Content-Language: en-US
In-Reply-To: <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 4:46 PM, Alex Elder wrote:
>> I also have doubts that this is needed - I see no updates to the misc
>> binding, which would be referencing it. But then another point would be,
>> that you do not need separate child node, which has no properties.

Krzysztof, I've done some additional work on this based on
your feedback.

I think you are correct that there is no need to define
this as a special syscon with its own compatible string.

Instead, I can simply define a simple syscon with a label:

         tc9564_config_syscon0: syscon@0 {
                 compatible = "syscon";
                 reg = <0x0 0x2000>;
         };

And then have the devices that need to use it, refer to
its label using a phandle:

         tc9564_clock0: clock@1004 {
                 compatible = "toshiba,tc9564-clock";
                 toshiba,config-syscon = <&tc9564_config_syscon0>;
                 #clock-cells = <1>;
                 #reset-cells = <1>;
         };

         tc9564_emac0: ethernet@40000 {
                 compatible = "toshiba,tc9564-xgmac";
                 reg = <0x40000 0x8000>;
                 toshiba,config-syscon = <&tc9564_config_syscon0 0x1070>;
		. . .
	};

         tc9564_emac1: ethernet@48000 {
                 compatible = "toshiba,tc9564-xgmac";
                 reg = <0x48000 0x8000>;
                 toshiba,config-syscon = <&tc9564_config_syscon0 0x1074>;
		. . .
	};

That simplifies things a bit, and requires no devicetree binding.

If you think this is incorrect, please let me know, otherwise it
is the direction I plan to go with the next version of this
series.

Thank you again for your review.

					-Alex
