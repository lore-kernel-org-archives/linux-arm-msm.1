Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371036;
	b=hmuVT/sdw954E54w5SXlNmAIwzQSKt//GAOSkDLMXORBG2Ju2ggqFxXjjNH03EUulyeg
	 nCGc6DuC+XRXJotcPeh4+NQE1baoy5W3iZUVHJziUr0Mf20Xqgv4/Qh6S4okfgOLdfl5Q
	 spkneNvLWqjgfdRiVKZeNW5AbD8J/BkXSLnJynXhF4P68jnxO1wzFoWymJd6stFHXlzsd
	 wbwdbFyxaEhIlaXnOOzyLh6d/cqpaX4lRDcPsH5pz7+q59o1g5P8IxxMuE6qd/liVtvbM
	 VTac80wiFtHCQxdXrOFQIKa6uUQEaFNav9ozz3ky7dvV25A+VMr8faKp2LrpGQ63zwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371036;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3/oMUvfjnRDqTYECREY0yvKf+oNzhYCqjwUaHTL4kiI=;
	b=wt1KgzQeQS9bsyMhF23zJdfhANgYXiHo8nVrN2o9tm8+pnYfh9XBXEUDpmPVGo35Rwa/
	 QgVqnJ/lfDTdEnENShnaBbxz0Zd78qDJDRi5mb0Cp/6CR3MWrUfAOe1p8sVH3TqZ7lZk3
	 PNkIA0bWlY0LcoedO/Yeu3pZrzOy52WU2szTDN0Yo4wxvAn8VA1zWIgEE29C+KPIp2rp/
	 Z5JhXx3GbDLbp4tB9bXSFFAIiO8dPlVUgqYilNGX/cZMwiiVsG9trNnXx/38VuhYREITX
	 hh+2fwDg9MFCsrROUJrf9m4xTrWBbGCPlaS9JMPrIQrMTjWRLWqLqb6xgyi+55KREGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48066606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48066606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b37c7d767aso21872527b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371035; x=1794975835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/oMUvfjnRDqTYECREY0yvKf+oNzhYCqjwUaHTL4kiI=;
        b=xaIjapr5sBRHWxuqtY1rk+AKUqDvlzP/xBF3M2KWwTez0mkPgeZM5jO+J6nHMzdVdW
         rSDuMMRZn1IWV9GBr+O06Nm2SN+EnkqybxtWsXVv1PCVc7nULyUXQ0efPbxIl0Top5z3
         olylUE3yKR2oKvJxqBqsEqqcfgpOeHx93g5rN0nUGFO6nnbTyU8lg8JZEj55ttZqzPO0
         8M2VnIR0PyennkCO6BVW/BybY3T7O+a6lkZme1MMSOJmRmpscd9ZwrtGxflpAVOFq4+M
         dslvPMOvOhB0decslbNlbMs0jOPYWBFQ3FO5fzQiS2zu8SGKbKafdSdJ8phgEgZ5BuZv
         Wz2Q==
X-Forwarded-Encrypted: i=1; AL+hErE3I8VrWt96/shVsWRSz14hnLsNgNzUUzoneIjDG2DxDnzvqzpOHYAte0Kfhw+amKkEwDGrYYHEPmr3i7Kl@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dzbps9/pitJmSck3Yp54isWwjlY5+UIewmyx0/4mW/uMsi/NX
	jPljJklBqT3mtWKmC7kIZQrTSvXoplG74PGCyrl0dqQUXg8+GUz8nfmL
X-Gm-Gg: AYBFou1vgruWJbj5fjCzVAYEaCjshF4++OvjsB3xBspo+TVJp3esOB042h9tjrNSf6U
	ZZJN5WRBd6vAk98WUO/BmDIwo8lC22Eafv8Iki9GHecsICxHQGnZEiQN67PAtSDxK1Cc0gbopl8
	5fG00CSEw3iCTrjgO4mzKq/55OVypKNN2gCUR4/IfG8s7xVPR87vzhUmjcgezgdps/z6VnRHwc7
	0ANJnv7U2mvVP/ue7lLSm6MX5gfp61+kwBoUw8H1Q7EZMXyH9iDwzaY5ymWfUcmC1BRrzexuj6D
	v2orLgH3ZGcy/ZrJqhxYMi/L8l/jm0zJ4BIQ6x+NnK6jFe9CGUCcSJTdfIg1G8WJsWuwhhbrD0g
	z6hnSkKtFHe5lr8xpwlrwTqENBivCcYqVw/ImXwUsWs2CDvclQcJG7E+XophxD7kBmxSR+gZfwZ
	F6BLzkFtgmaCehFmFJlqYFie9IfYmfV80OqlQLw3BHX4XjuYixIspxnvKqkkx4kl2WAKtAGV18E
	jXvFNO95CdhBY5y/obkZjjpPUeFHy4IEgdOnS5PsZl2Vv/SLPE6kdUgWvfwpuDodWEpN6PRYM/n
	aWDYIghGLTeVzsZgKEqEO9rNMJRSGUHJ/qBjiL6rM1bIcncfgckwlFkXuensKXaf3wn+ufrU
X-Received: by 2002:a05:690c:7342:b0:8b3:23f3:134d with SMTP id 00721157ae682-8b3a80ee26emr9648857b3.42.1794371035274;
        Tue, 10 Nov 2026 20:23:55 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:6378:bcd1:64fa:19e3? ([2800:a4:806:ef00:6378:bcd1:64fa:19e3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a165csm36073107b3.14.2026.11.10.20.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 20:23:54 -0800 (PST)
Message-ID: <fb4d03b3-eb35-4aeb-baa1-f4df54653192@andrewgigena.dev>
Date: Wed, 11 Nov 2026 04:23:48 +0000
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
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: ice: Document sm8150 inline
 crypto engine
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>,
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-1-d697bbce0278@andrewgigena.dev>
 <20261106-offbeat-hawk-of-purring-50a8aa@quoll>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <20261106-offbeat-hawk-of-purring-50a8aa@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> This part should be a separate commit.

I splitted it into two commits in v3:
1. Add qcom,sm8150-inline-crypto-engine compatible.
2. Move qcom,sm8150-ufshc to the standalone-ICE UFS binding.

> And what about eight clock? All existing DTS will report warning? I
> don't quite get the need of this move.

After the move, SM8150 UFS no longer provides the ICE register region or
ice_core_clk; those live in the standalone ICE node. The only in-tree
user of qcom,sm8150-ufshc is arch/arm64/boot/dts/qcom/sm8150.dtsi, which
is converted in the DTS patch, so there are no leftover users of the
embedded-ICE binding for this compatible and no schema warnings.
