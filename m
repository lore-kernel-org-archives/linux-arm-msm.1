Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964390;
	b=b8DsoJLc0RHuJG/LSA9ZTG5POvDA475E9ejVJSV7Pf1znU7RmMh8tioMJme3yZvC5wFz
	 0qxUiXeNTaC41gTx1HXoxiMXqwYNI4fE3bFzf7nfSspcmCYyqBXcjZauGoUKIn10cliv9
	 qWOnVTHZIwnsrHJLTUvFCqsWU7hT0hei8ur5biZ5EyCD0DmaMJwgW0KKmEz4uFO0Q1bZ9
	 vqGBRUdetz5SPd1YS0EIoK3sGNMzCbneiIokhNiGDB+U/cQVkf5DGomtDPM2wcBSsy/pe
	 e3lWebtuulQuJy+y7fv4Dqq++tb639OJSkt1JpSuy39IDb2crN3JOrEnPt9s1zXoZSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
	b=rrAZTnQhT6e8LMxBtieUT+tVloBtJFDoJ2jk4Ws3PBX7NFPlGUZJCS0UrtQT9cFBC5Mt
	 Ls6XGQapBALryJjapQSIearndTSG2IvyzNx9nGHj/L7vocVw2t0JuAZi2NmU2JEVpeV26
	 TjO068mrVqAPPIlx6Ab7sc44xCmNQS8RyufNOFK4hHFX+QrC9tK3xdLYEqswPe6taG6vK
	 PN6gtoQINS7qi+OpWGoneWS76XbALHfOGkUeAmq8Yhpv2TvX3E8vACGDzo4+KyOf5GqtI
	 7ZSh8busaYqcXOBEQOIJHh2ez2K5KIeQVk25JkUYdwqvkLRUcvrQRH6xRNod3GMquqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=opUqJAWA;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B431606A332
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 11:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B431606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=opUqJAWA
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48fd2e38825so350001f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964388; x=1794569188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
        b=opUqJAWAOya7CeKLUFeRUpto0xhDsHDE0HohVtyIZnuUT+wiPe4cORcwLddq3v5huy
         i9pGZ4OqYg6HndDaZqJmJeiHMZxsorpAMu860/wKTG7jmUDZwZFMb21qzEfUqDhPRHdB
         wjgK5PPTSFqeFOVI/OkI0pg1Hf6EEUS+XwWDB7brg/tpwo4MRp2+2iu8CpUB2WynFEex
         NSNn5adlK+HYH8TtofdR2pDp8iRQ9QCMWtk3fFoKfJkzsbo2JN86EjBX51QXAZfEJqKS
         B36XSyIS3N15WdMNs5DmDNZNNYh5w6CaTX7o76QRuGcUTqhk9zNOqmfNd81CkTGX/w+4
         HhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964388; x=1794569188;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
        b=sJQ+i9XuaPP6hczXmvPhK549PlPQ04ECj2WW+OVkMlVMle3/A9J5RCKXXr8QFTMHcj
         qJxIk239Bsw2MB+zX2rlcF0MjHHfi1tNbj5TcTi7btJvS+1QiYi2xqOL/53MV2IlZYV5
         Amm/Mq4uaszIpaC8KW2b7S1J/v9M7EGs+jSGZ/75174zZ52/FMrTD7T6vLnzJmbbtIE0
         ZXQuj8rc/N3aU8wcUW4baqLGuXhPTU6VWmEzv50/L4Gr7nG7lv9L0YoSKycT3H90Od6z
         B4qbpMxxZZGr3calRlg+s5yeu6gs032k0xWqisMUzMx6srAw87eNfl//B+tX5ZZJGs8x
         QqLQ==
X-Gm-Message-State: APuU4Z8jtyWo7QeB5CDn0ZUTM06NA/ZfIyMdgUb3v8YxlqIfwdkoolYj
	5iduEKuSUgHja6fu/OudD0yzEGk8vg4F3aQjxxk95jOQ784Jh8zV/7QiZmo/cj5ql00=
X-Gm-Gg: AYBFou3BvhW0Vl2jp/nrGtWePBbbFJ+hzdkK2eGxDyoE5IbHC3WTR+2ommMbhXb5ewb
	wZMCsEbCWn/DCn0cWUD9rwl8L7byLvnnJNy+BmxNNty9siCnmchSuvP1jJbCqhDwxuz5OO/Bn4s
	cD82zR3Fuhv8RY6CufJ6kq+gBVIvuPOGPN8P4cx9Es77gYcCK5fnlv9VdcSa8WPs7MVdJpDMEDL
	DIeXckCmadNvwo4KAwT864jiynpxjU0532eUAPlfx7ebg9G/svDP47j6V/WL0atweGTiYIzHMNr
	7YJlYY+1ygIgojy6eo3Fb76jhFqON4jOORK6MWc5FJwO/UEYv8oCAW7f8m306D6PzDL7JQsoJc+
	TCkTFwmRkBPmD7Hp02thx1E+53HtU2ZhYP09tuA216USZe0ENPhktf+Vwe0jh2uIwICwZyhiukd
	Buw9KN7S5JkiyXIM3M4nlnSohG6l/tZmfCQCq61fD9ufdmO0gRiqZ7JPV5RN+D02yIKo9k050ma
	fX8143LE2evRZm40ddqhy64Qk2y6bjRCa6jqRj39f+5rFIlcleOU39QtlBNGAXNFy9oQ3NlpLYx
	zQwawnAjQwIjlwRaICjX3KFzV97Ww6EzF87dWM8hUw==
X-Received: by 2002:a05:6000:4685:b0:48e:5e1f:9a36 with SMTP id ffacd0b85a97d-492778d1fb7mr3239346f8f.42.1793964387965;
        Fri, 06 Nov 2026 03:26:27 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492ff85585esm2390286f8f.5.2026.11.06.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:26:27 -0800 (PST)
Message-ID: <ac2e970b-1f3a-4aef-9a84-034d7e460c0f@linaro.org>
Date: Fri, 6 Nov 2026 11:26:26 +0000
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
Subject: Re: [PATCH v2 3/5] media: qcom: camss: Match VFE lite clocks by name
 prefix
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-3-39ee37787b00@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-3-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:24, Andrew Gigena via B4 Relay wrote:
>   		!strcmp(clock->name, vfe_lite_name) ||
>   		!strcmp(clock->name, "vfe_lite") ||
> +		(vfe->res->is_lite && !strncmp(clock->name, "vfe_lite", 8)) ||

Shouldn't this be the case for existing clocks ? i.e. only check lite 
clocks on lite VFEs ?

---
bod
