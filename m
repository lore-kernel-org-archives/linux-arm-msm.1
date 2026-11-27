Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779668;
	b=jR+GXER811BvauUPlIPAN5iJ49b9heL29hXzN58s81+lYkECLKcoIYzDdd/5UW0zMiHw
	 vvrr5XnexgCRwPzz/HJBWOT4VcGsOQw128Rhz//qGEhsnrGJ6owExcklEQPUrndpJfrqy
	 lTsvs+kP9ADK6myzGyNsaeELc7hYeG1SiIdwZbSvbPV1AqzpOh+prYpi/bcGu8Z4Z1orq
	 5sx2YoA1M4PBYEp5EkUMIW0qbcw9lveuit6u8wrrYjFpwU8O4CUrHCt7sy8uk+0a9ONE6
	 JrzGzS7TZIxBLc5ygj1kyEc6lv2FWWSbhknaA9KhHAlhJrsRTy+Xe0F1/umy2nmVU0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sspZMan8fZ1WKgEVFRKxVskK0Kuw/s541urtuJ+3PO4=;
	b=A5WQofbIcfYExYMcmWgcin7cb0tOmP114kOGmvbfMaF75TuXkOEM/tVGl1VlGCrvQmhE
	 o62ADmMtyEO1zZ9z0BsNqrshznPyEszCZlr2oPbwLyd0v7JaCVjQJA+v27cuHM1asdoMv
	 D6HOZp8XnYFThV/hT5W+oAHTqrOU7WpZvWvPycHsQKJPlwgBi0SHqbfasXF80gNjFDbNu
	 dNsaFDMfJ0XSTF8ZJU8fMdachKrKWF+Iut0Qd/Y4Yp1ZPQGKDzGA95XvnHKim3neDXdL7
	 4gCuFpA4+zf/gVhwWU7SndAy0zDWMysXOR/XD0/+HeOhouQQTvxR4mjlFrL67y/NwCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z4pBFq4D;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8BB606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE8BB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z4pBFq4D
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so6785231f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795779665; x=1796384465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sspZMan8fZ1WKgEVFRKxVskK0Kuw/s541urtuJ+3PO4=;
        b=z4pBFq4DGHKRE2CBAC7ty61dVHmbS2uoKy5+23PG0TJDFwxOfoFOlm9eP3TDnJHqRI
         ccu4+SlDcaPkkLcFHu0crmlJqfq1PbjWdliPwcS/No2cyEeDk7S5WIO8zm6zml+VZtob
         R+9t8aP9NWgE3e+nTwdEN2XbTaDxbGG83deHMMoPTi9Pa+J0jSdfbEuNFUxBDZpqiMzM
         a7JN2wZgcLi3Zrt8TmRf7MyzgK9cr3lqYtJsm9Qgt0RzqnkUu9yMhmSXhoi+I5raFcHq
         D9iv7tBT1jRXDeeNzzaQuvblcCvhQ5B6dgXG6Ji51CvS5oOvKljcIef5m9itZK27aaiC
         LSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779665; x=1796384465;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sspZMan8fZ1WKgEVFRKxVskK0Kuw/s541urtuJ+3PO4=;
        b=PIo6GxQU2PGSNj18783J7XLTEtQM/MuDlGU4v4SBe0MYveBxlKKGe0sJjMBIAv+wj4
         em4ri2UGWWYih1Lw7boNm1tU6zrw1Vq+STU3MCFb7dyKPcMWfJDFmGexMaEhOuh33eGW
         52e4JZqGKKljpIRvCu58SgL0FgKaATeBOHb2wg+BxUCzFSOlo6gNTPqhR/tE3qcS5Ddm
         yHjVpyLBuLE5QHlf4jxXaKoBpk/tYC/eBiBDFtgAPL6QrS6jTo+N7AXUFA8opoJvzxiH
         dDVhckbqOQHNkZLtL+DoYK9xvCNUfleGUAqQc/2XVPzoFpjB/RdBvQnRfIAy0M9uRhja
         yjRA==
X-Forwarded-Encrypted: i=1; AL+hErGt+s2/IjXRFHpxQBSpv9mo5fGFzRSCaq8WbQ+FAUzTXiw6iKGZ0HKJvTAlSp/ayxw/T37i+pCh2OWc+y2m@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rk9eRbqTswFRpm+kKCNGbpd+nBVRjiIvVkcRiKlHLC5yYyWSN
	j/QNEacejD+zDqfarmy5k1iXCvYBgLb+gGkRpy2iKkHfNc0PzxGm4Fk8U4eBtXWOm04=
X-Gm-Gg: AZFdTZfOJiCh8Pey0rybiIne6pNY3imIRUFYnlwqRig/GHuy5lsVwbWMsegpbenpiL5
	Hd1fC2FAhmTNIEK5gzKWp2fWm0VHM9rHjbTBa8vqz9tvrHWBA1X9I0SpH7RAYulvfBAlCYeTial
	6O+jHgtO4FS9ytyjdqRXszKEKzd3JVj5SeiAWe+WXO5Vvfb+7Kw5xn6/2FP+XVV+NJuBsmn74DW
	O1C7M3OlhYFK5eBlP3ZRWZkPfatPfMh1ozQ+AET7u7N3F/Uu9XiTOT/OhhGx9m8TS812XCixxV7
	gUjnfEcQHF3h6O2K/pEEF640Gb4NTy+S5r53mOGrvizpSySsbBPPseqEorb5LuEHQbzgNeqInx/
	oGF6SdsTfVyaeyHzCUPfjziflDB5uId8bveq94UIsxsgzWnZbTIKzGe1gOf9Xn3FvxF6rW8i+t1
	UcYthFpERTa0xnC3AQU0zz9XckSbQcCyziiNTZQSNzGRkVqOH69WJAj9+4a4ztujnfENZPdTS+1
	FyVfzvvhMQAipjg6BjWhRjTdO2cMtQJvi4yvF12i+mGdfg8uXPijN8u6d+NRgcn4lQGbx5YI6Cb
	ewjbz1zlyXMl5LaVungKaw5Z2MFc1xob3znLvbNf
X-Received: by 2002:a05:6000:4617:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-4abb18cbe2cmr47257937f8f.27.1795779665260;
        Fri, 27 Nov 2026 03:41:05 -0800 (PST)
Received: from [192.168.0.167] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm47672583f8f.2.2026.11.27.03.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:41:04 -0800 (PST)
Message-ID: <fe014b6a-964f-47dc-b16f-301762b4534a@linaro.org>
Date: Fri, 27 Nov 2026 11:41:03 +0000
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
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even
 post divider table
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
 <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2026 21:34, Vladimir Zapolskiy wrote:
> The GPLL0 even output post divider table is not terminated by an empty
> entry, the table is passed to divider_determine_rate(), and the generic
> clock divider helpers iterate over a table until they find an entry with
> a zero divider, thus they may read past the end of the array.
> 
> Add the missing sentinel to the table to fix the issue.
> 
> Fixes: 1c9efb0bc040 ("clk: qcom: Add QDU1000 and QRU1000 GCC support")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
