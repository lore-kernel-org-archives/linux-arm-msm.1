Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFA6342151
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792244132; cv=none; b=faDsT6ElHqQx5nVlU2icPc+FGTS5L7VBF7D1xzG09gjRU+nMDGVEsEcU18cdwqZMNCQIX63QYz3S177mJyD9dn8grL1JzVwX1XjoYcALR1kgyuJxbvjIeqraKgGeWU8DcxwUBsCqhEi6I/MB8gGXsmA3AVDJbeGBGIyM/GUjsn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792244132; c=relaxed/simple;
	bh=gBGo24fl5Af6G7SCsbJb5/idqIuEjFcib/+jlSFpkLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESIPPqrxA0SzLuDT6VIC9YQMykeD5qwJKsxKMhQVoqKFAf7NhhlE/Jqd90qEbKtcYhWU70lJDdWHIoT4IFhP78UquvYEVgR74nWZOQ6SKvz4LeTPDAaMCo78OkcG42kt5sN0N0tkE4xAbv6sbpyIpIEhywpk5MdK/I5MvYQMs40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GzRXa0WX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzRXa0WX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso6301995e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 06:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792244129; x=1792848929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bg8gcmVf98z+OPBCGbYb/r+iHjc/oki2rBnkAci8HgU=;
        b=GzRXa0WXUD3So3RP5HtlDhI0t2k2BrlVLbcmaBT4T/kMicK4Hq0KNKkw1KpbEFqbzl
         u0Y4aSogFLrOxRoAwwQUWQp1H78VzBZTIbuJZ+uFdN8XmdYZC/+hHlDxmxmZfEW8rn5f
         +UAxJTwiywIZrRDlw7ufNS5pJLzbvMBocUYd/ac7/qSQQQna9+hljdKc6KQFvQl77w/p
         IjLS5MRnIK30Sl+UNttobQy7bRd5TqKFKMMglUV/6n9CTLLJ7RZGP6zJi1pmhhSAEURE
         FT2EQVzm2V0ktk+O4YqHJ9gaig0K4xX2oFEzDSRaII0j626AEiMeX45m64ZYUvACzKXN
         CKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792244129; x=1792848929;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bg8gcmVf98z+OPBCGbYb/r+iHjc/oki2rBnkAci8HgU=;
        b=VzQYFe5GreIf/7a6x+VnsW5qtjIIJUlTdW2zY1ah9yigFqVStvpTFGBPXmrVvxGwIN
         i7Tdp5oqNlFtROuy6QAH2OYPvK0Af27S4c01+Jf6Ns9MG9JsFF1utr6Ko8cPCRopgdDk
         wXsK13RrL3Wf7jC9rtmaf/IJqV9iFIsHSZdCejd2gGg0yYJ4BIuYhPQ7c1Hv0LNnr+FU
         WkCf16f04EJrN/hfUEz6zkr4kpP68c83HmHG2BCrNnIP30zSMeaSHQe5tPzdsDdnaTBC
         iUPE5hIyVbQsn+6ObtjyHvjAGbHvLeOdmrpFRHMDjwpr+qr3YoKvMHM+FPOow1tq0FKb
         2qwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKkfyAj3p+U6eBB+u2NHyx4QK94jbmYWTUoSYe2fKaqBv9cEdeFGuOchGe1aK7W6CEhc6pGj3+273zJHuf@vger.kernel.org
X-Gm-Message-State: AFq9FYIAR53lJDnDcqVDiGMjqAHA25VcsFaxgXBrP3j+ho73vQdSt/fF
	hStAMTF7f5L0yQCcOgPpy7xOx88j9kIF6L2wBRPyA733JbourwkUy8p9udILg4ANqmA=
X-Gm-Gg: AYBFou1eQ1V9Jo+8OLLXt86nng/7WKw9raf82bhINITV6TVFCkQ5B6zhzH+/f8Drcyy
	WN0nSmzkRjlgMMp5D56WLhwE5YCAk0Wosqv2WSdFe0R9tguRIqXchTKs6BtoTUFBIX6+7JLGs2B
	7nzmGnuU85mLbqo++cZLoAM4QOThjdf11OmQn/+ZvamiZZesdGkngubGbQ/VCgX908HoLwm3gIB
	r0rqRRJHzIifVqICjFMiQqG65ZRzODhfo93zqzZE/GO3c3YWfZOrklnimbayrHhIHRVogSSkT92
	ylzewc7QzYyvbH1Dex8dVDmEJK8BLw6p1W7iy+VGWrgbrkGkql/JytRTfKf7cfEo6gA3jzwl6Zm
	6jAK4JTuPb9Sb0rZOJgMGliDEuyIt2K2wKJkRxk7kA9O1yejSJNmtINbVf1Sq71lxaI0+M201KG
	eF+6G6o8ylaGc4Rhei9Ll9a8P5Q43DVllNlaH8L06fUfpkIP14aWHv4OoCDFPynviF+ottyM6Ba
	oAW4KUGTgn+
X-Received: by 2002:a05:600c:3b2a:b0:4a1:d1f7:bf4 with SMTP id 5b1f17b1804b1-4a1d75fcdc6mr63156145e9.12.1792244129542;
        Sat, 17 Oct 2026 06:35:29 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.131.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33155fsm90508865e9.4.2026.10.17.06.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 06:35:28 -0700 (PDT)
Message-ID: <4d307e32-04c1-4df2-b93f-9dd187fa53b5@linaro.org>
Date: Sat, 17 Oct 2026 14:35:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] phy: qcom-mipi-csi2: C-PHY for X1E80100
To: George Neacsu <geocausa@gmail.com>,
 Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jigarkumar.zala@oss.qualcomm.com,
 hariram.purushothaman@oss.qualcomm.com
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
 <db2fffdd-634c-4728-a2a6-2ab1816b07ba@oss.qualcomm.com>
 <20261017070443.989736-1-geocausa@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261017070443.989736-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 08:04, George Neacsu wrote:
> Bryan, Vinod: unless you would rather take this series, I will follow
> Anusha's.

Fine by me, TBH I hadn't yet cottoned-on to the fact that the cphy init 
sequences had been buried in the dphy file so, I'm happier with an 
approach that = a separation of concerns between CPHY and DPHY as well 
as absorption of both your and David's prior art - with appropriate 
Co-Developed-by citations and SOBs.

One thing I am picking up on with an initial scan is the absence of the 
clock calculation helper functions in this new series.

Anyway let's see if that turns out to be required with a deep dive on 
this one.

I will mark your series as superseded in patchwork on the understanding 
you will rebase on top of Anusha's work.

---
bod
