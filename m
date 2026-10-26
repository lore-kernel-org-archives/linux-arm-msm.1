Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025516;
	b=u7EEvNKJK2GeCu9JksiiYxBFjJRFUEJTQSvxg2pmq9qDYZOH4+IHiig972a9rl6iqSzF
	 CWEbXEle+ZPclx10DfqU+s374DW/SluwdKxq8yw4UDW91yPkSAuXf9xYNFxwCWxw3o44h
	 KV1xX6wEr2CNy/MGdl82Tn7xQl1zIe2GICLvWNoZVZ2x1QY+8JXw4GA2gbdAdAtMXxA6q
	 kugS85TJfcpopVJVQG5ZrQvnBfchZ8F9/kMyYtOkNMgjXNRyFhWOn416If7jEuVwvkfNc
	 LeYNcfmXwsueCZb6eTk3HDypC9QlI1f8XHjc9foygnJ/Qn4DVZwK2AdJrBLsxv9Ed7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1M86rViJTscv2Hqb6GQf4GI3sO2/N2byXiLqjAgB39k=;
	b=xJA4gTkz2ObDsDWUYMeBzjS39+UAQnCugywdwWA8Y5qpuRoTDI/41UF2ZrVrGTs0+4BF
	 Dd3dFjUTMFO5cBh0z2KpTZsq4xqbl/pfyXmp+2KWP42x+qnF9+vkTCUFLXwezb70fR05r
	 FiEnGb9lytlgmqlzfIKHMbuIW2tiK1Bn0Oh/2v4EVb2nz9Ip0v007FmrNQ4WQ8xjb+P/2
	 o5jn8adZUSw+sh7zidAjPBg2pzRLwsNErjLnNzAnYSW11UTbqWys360KLdbkfAT6nPMSV
	 3MAUP+G0MI+2hhjKVDKJlVYNywM/J1UsRPSdwSLyuA9lPafztpXLUG7T6cs3JYxdPXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gbttxd0P;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8BD606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B8BD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gbttxd0P
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1847862f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793025515; x=1793630315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1M86rViJTscv2Hqb6GQf4GI3sO2/N2byXiLqjAgB39k=;
        b=gbttxd0PE7ohK81EuMWEF3BAJ9lsS8RDFMVL0T0QOka24HA+GVQ+BpzQV6EOgcmCTm
         NflAoR45waG96fLmJgdjvqhACzNAfs20EQ/Qnqj9RxjJsE9lBKSfzI4tlNX8XnuZLg7L
         j09iD9HTiY3F7SCIshIcAe4dhqJlYjBup9EJ2maVJD7sOY8XSUOH5AebO51XyhP3K1cr
         DtrSVw+f77Wv+fBwzNZvD/47CeDpGqBn7Cdpeg3LNGPvkcrBmVXOG+5Tsqkq6ELdQDtK
         HkMMbxesQuKMaasI7Wj4v/Jt831d4XGMfvkORp+NLGg2KQB3vYZdiNoSvPnLG3qIVAp3
         N0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025515; x=1793630315;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1M86rViJTscv2Hqb6GQf4GI3sO2/N2byXiLqjAgB39k=;
        b=vBNy1l3KaEXWv53ES36rV1JX9Lg2g70YEq9Xnj4IQNqTlixrPspu69KneSbYQ064Zj
         /mHvAsCFi1nLDe5nh3pIWL1yB31uPHGJ/HIY3xy5wiIZ2JxWx91hIK++7yR3qqUaPFzX
         BmpuH4JPucO34L4cwVyeAgpYwHNd1YrK9m4S9XC2oD4/rd9IxT05wwxuI/M2VsT+NDPi
         Bc3zantS58fB0RZ57+Mq8gXQHW1+yrt6P+YFHoFB/BcYBk7gGqvlEsbRxR7sz1AmKkxN
         PT7jBbJHQj2E4Qf37XcJ78hzGeZYizlqmC3+bhCSDWW7ihr5hO/EJ9wB+HhRZ5YTVs0C
         /Ofg==
X-Forwarded-Encrypted: i=1; AKwUvByx8f06ej8Fu6Nb1zriA0Z2k1c+WPJlkEcBrSvP2g3SHaUqoWGWP4/Fc4IAYvinag6u7QFTB/KBQl+ONudW@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5e7WneIYfX6jeHU7bVLX/bsM7kx7QArGcAzWpr+LZZu9ekDd0
	MrJw7vNN6qmjMLgQ/O3AoFBcDWTsSDJyVoZkOrou+yGR05NLJa9Zvt/bXl4kxhHf4NyYs3LkCfb
	il7Xq
X-Gm-Gg: AYBFou2b8JhMSx9uvI2vHETy5xgWVFrP1YBtykOhEna05SEYtLobuKHOrV569IsmQdZ
	oeZAWEJCFbRRRk8b8uh89NmgJUcSmJfkDjRyxKnOfmsbK221Q49GkkcieGvK0AdGJob5WfUY8G1
	YvVw+1RhULoQoJbOSWUmkRRcdUnL7ROc3BTNvPT0UWTs9xYTHlPP91NzmyEXPm7IVvwMrzUjxV9
	JTePnnPh3ba31xtgNspR0DeJethqHF+R6gR54w1DT1pWmxUoN+hrMTdLuaUgX7U/O6xfmW+Qhpa
	v5IK1/C64eZFyhKTSLnCDc7RAwObm1suUTyzcOokiyW8P+g8unjC29D8aoei8J5UQHYx1NRrhUz
	6jY6tsynsYX8gm9YYpCeyKSQwu64gK5K4kRD6+TyR3/Iz6aA0HZK2X4FbsvhkP905k3pIbLtKeq
	o7iXvuHPqLuz+7zc3ZrbnyhdmUU5xbbBaSxucvcZrGJ88LGgBk2cKawqjfgFBz43l/EjNpwPkl7
	hvp74qCJxwQq74ZUvXzkAhajorZN2MjS9MledusmO47rWv3fUKMWIRkTG1MSwjhupM=
X-Received: by 2002:a05:6000:250d:b0:48c:7143:610c with SMTP id ffacd0b85a97d-48e3eb8bcb6mr13216874f8f.36.1793025514695;
        Mon, 26 Oct 2026 07:38:34 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm17390775f8f.10.2026.10.26.07.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:38:34 -0700 (PDT)
Message-ID: <bdd89ef0-9cb5-4926-a8ec-92d8a4d78738@linaro.org>
Date: Mon, 26 Oct 2026 14:38:33 +0000
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
Subject: Re: [PATCH v3 4/6] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
 <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/2026 14:35, Loic Poulain wrote:
>> Rate ranges are enabled through the vfe_clock_ranges resource flag, so
>> far only on SM8250.
> Why? I think it would make sense to use it unconditionally.

Yeah, my intention suggesting this wasn't to have it booled off into sm8250.

Also would be grateful if you'd add Suggested-by:
