Received: from mail-ej2-f29.google.com (mail-ej2-f29.google.com [74.125.228.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF89151AEE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110322; cv=none; b=p+h/tQMyaC3ObPjNYwfDI2agNSLL16hgyqvfXjaMb28ZzGZtu2SXhqmtJviSXvxOC74Az5X0peqvpcMW2QZ2YMfSDIsnFgwQn8v4d9bXTd3ZKfttun2ADtWtoFYX6YFd+/NvKoWhVc758xAHnGik4TZ2DWo8uElmP/9FUxaLFQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110322; c=relaxed/simple;
	bh=3h7mHOameIoi2QgF0fHWnYb2LmLJUJCfP/tMiTq5a6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUD2xNMZ4aWsqchu/fq9f29UgqpaaGytdnaNVqT+Hi7tb3fX5qpQcPR08ghdUCArLFV3AI96gVQizwVQQ8e0CF9O+QBU5ZTquFtnEWfbJbtIklq0GhmCWWA5EqNzXqXS2fj4xKvAaR3sJIU+U5T+crdR0Bed/acfgUSsvuwn0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0E/YnmX; arc=none smtp.client-ip=74.125.228.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0E/YnmX"
Received: by mail-ej2-f29.google.com with SMTP id a640c23a62f3a-c294496989aso30276666b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790110310; x=1790715110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHGFgcODsPMbkSrmYbc3O6srVnG6fm23/lscBsfkk7o=;
        b=c0E/YnmXDXnA0W3TY21R/IkeyKdJM2PpgPM/9UWIoPip44XcT37DiRU56ajGfXQreh
         XbtA98MmU003IP6aVE4vo0e7CFyewR+OJ6jlfYpHYkyBd6EtaQIYyWn1hiueZsvbu0M8
         EXoMuH1p32WWhWL+KxL+ztT3EUV77T8v6fUfmRpjNfhwRjryLLsNB8U3ACckWJayzkCn
         tu6km0rP8tjoDF9kCDSbh8AReDVGATgSGvziAE5cjurIpws64KF6b9ezV0Br8sB8esxO
         TsLzrDM8RVugeqCt3GH3kPPLaFoCYbRrHtgMGl+cdl526gxQp0Gr8XJXS59TD1pgFWW3
         Viww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110310; x=1790715110;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHGFgcODsPMbkSrmYbc3O6srVnG6fm23/lscBsfkk7o=;
        b=QDezwWpG5mcbYG9OMT+Dvh9oeeuDJ2eq/5/8yMx5jpnhIK+KUQ6mUx/H5wyg4epoZk
         UpMVDouG1hMS64Oagj8V5adg/EpWnaP+i3Mw8RDtZusPORI9xeqBUYiQ4rcb30l0a20z
         yPOKwCYJfNTFLFNwWnlke691ViHTpXUjdAahss2cSYgHxDoudPp0ukIQCuLag8iJ6fxd
         fX82N+ek9sL109HjlZB4+Z7d1NxCpk4NsC1YT1OTbeQwSLjkpQAjsq9ktx69TF1fALU/
         WEPVT9MKC0MeNxMuW/cl5k0Q9GTceD9tcsDCOwkhMSa1rRKOrk7hTm/KmlRwRsNH7lcu
         X1QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpumgT8cfHzA20voeUyIgtrehE36MGK6prOoubdxD1s4SD+ICi3pmXV/T1D8ih/fe920PjT1ZoiO48c5O7@vger.kernel.org
X-Gm-Message-State: AFuF++n7X+PnRUR7e+bba5eFFBlKXmxO1+h3RtXEgvGCEnId27ILOHiT
	bQO6p1Y1tlTKOxTgRL+pynRrG13O0z2r3Nnpm41v+V+hCYliaUeT8EWa7vDu7d8tPkg=
X-Gm-Gg: AYBFou3uW70UpLlAjVEI9FUuiP9N1LGBSci+C21o+j5Dxxo69ht5S7BXby2LVLfNXrd
	sPqynHBYuHhd0kq+1R4xdZkKUdRClyYOlsshO1MAk7Jg/7ZfLgEDpgmVFF7bmiMgXLN7LeXqKML
	BBBXHxGy5U7/NaSzoYBRkdCDv0qYEuAx6R5Oxe78QHF6W03BCr9tMYtNgJYPe9U5eHyt0jezwlE
	wEvhoi5IR97YV1kvekZYb85/1vPgExiPcG8wYoKxaZ+skoBCwoRHG0ciK2waMZPND6aIMtIjt8h
	mxtKJpLNn8PlVpIvYwdR2Ymz6Xl2Fzvv4u7jJjjJwX9oqPI7iNuZIHo6Vx9IzDKQdU1evkr4OXW
	pvwxaX7b7Zk2kpP9vno5mf57kS1B7DKWN44zXhJ8zxbNVqkX8ehXsMm6ek5JKpFQW51EBH6ynMf
	cy4xFI/C5TbYsAn9Ycsv/d2tUh1x6/RC6TkFHSWD1thGRrrLWVwrHPeviWu1b8NyedmB3KWRPLb
	KELYjQb0PLP
X-Received: by 2002:a17:906:7309:b0:c26:227f:5f7 with SMTP id a640c23a62f3a-c2aae1202f3mr32384666b.46.1790110310034;
        Tue, 22 Sep 2026 13:51:50 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.71.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae61aa6bsm12294566b.30.2026.09.22.13.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 13:51:49 -0700 (PDT)
Message-ID: <1eb43e3c-268e-43a0-8eb5-b3671bc85a8a@linaro.org>
Date: Tue, 22 Sep 2026 21:51:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix VPSS line buffer width and height order
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <xj8gcJD42EUlaYqevxWqTohqhMOfEkOw9HpA3v6Sz5tHhGNi-JzG49H7eV8bKDlC5PhXlgSllU9Vho0Ht-GW9w==@protonmail.internalid>
 <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2026 04:24, Wangao Wang wrote:
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>

For future reference

Drop the \n between the fixes and the Signed off
Add Cc: stable@vger.kernel.org

Please

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
