Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3ED4746BC
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849498; cv=none; b=tcj9Li+L4UFQq4cv56nbSRKnQunIS7fuKVMSmvhf/s58PHvhFGubkZV8eOwSdaTyYKdqscet6ob5v1LHSveX3YSI5C+XZef9itQWNFg/TdDzBTUOz+ruAkjNKURXWxccYEmUMtb4wI8OxEr5Ym0yZUvobhQkCpyh9uDWO7BlWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849498; c=relaxed/simple;
	bh=6C565t/VlyoDv3UV6Pv/GK2eTKoZ4N03hIDuBo2UJDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HV8zNZZg3taHcB/X23AWjkrilIxGjmQHotu8fO1RRtRl9N3KQjV0W5HUIGjRczlY7mgy4+M6nB2878SSE+A98UW+b7XI823iEh9ou5XvLUfMvdLEdeneiR7SdzCqKJmrAGMyQFVQc4au55XHsli3c8QTpcX3F66SD0Lnd6yGlPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOMFfnn/; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOMFfnn/"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae3a72e02eso1095477a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790849485; x=1791454285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3XG5cy5KBLHekXoy0zdt8qQzO6LEdX5LiupQKnkZIo=;
        b=bOMFfnn/jgcz1WJBEzhyFKMrlGUEYbsuCSbA6r3wTylJd66TyCu5SR5fCkUgQwBOZW
         KCIcufLthnXh9KQfCHlLl6IF1XEBvloeFkmBFXF0LJHMarEOn6JQ6byyvAzMyOShQzQ6
         ZeXpvpF+kCn/QX5M7cdXO+ltiSp50HpNN66qTWqfVzrO1GWLSk6rHIO3ctSgJGFXilPx
         cWJ2a1WagwmIT/r5gmeYZv75Sgf/gADZh2ePg7Gip4Gs5qS3RkeVui5mj57bHcWc1hYD
         tT8Pn0TUhjCu8dEhc4DwmL1JtVVcp4D+xWFtpf2R8SZMySyhumIc59LClekjWdnvLITG
         CLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849485; x=1791454285;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3XG5cy5KBLHekXoy0zdt8qQzO6LEdX5LiupQKnkZIo=;
        b=KLEeHBVcXgCUmT6hl4niTr5D/TwJHICgXubh+pwW9Xu9UTNYoKkMgd57g+HnQkgFD7
         +xdTB/MOl5Wc/oYhcdwDMwpzTLhr23VDFFcwAwd22iUvFkaSUyAWZ6S9H5hgQIZ1R8XL
         0pLfEbEpNd7k44qSZ6x4zm0icZF+7FYdq/Cq2ae5ZbqnTkbyZXEgArdrGqcyf2wITKTt
         Mk2hP8zdzXXLoXQ60God8KQVpEi14bh4Sz1640x/tvQjmEnglXClZZDK7UriaKotgMOS
         5/irLeiK0DTTXtpxzER3kUahvLZkIrvUJ8k66KC+bAP0NHC05HNFkxJXLJcZ7tGvssYq
         Ke6A==
X-Gm-Message-State: AFuF++kawwOWy25yrGHgC+16fegaun4cEw4DcHreDHds56m1hVeetRc+
	sHuEPgxoSmygDlYy+k5Eq5cQyXFpunYoHBji/uryaNSvC202yeSNy9vB8jtm0E3v1ds=
X-Gm-Gg: AYBFou0bikX7DMbcx84eRPIWRfr4uOXJovhSprhM0v3wDWcaj5AkyCQuy1ALj71951A
	qRG+X0lapXKe7pVZz8RoO+hrzFtNvudojzyXMAasGkW19S7e+WadQNxFBXtascNtSUYKfhlt9yK
	yAsjLjjMyyf9zjBPgpG0wIUgwWAgtrqXEzAt0MrSK4yoD9hCFp+i+xhQz/0s4F7frvJQWbjcjzi
	qbi/rh4nDMJ4lCQt7hW37+qCLvK9X0imVUd2ThPZ27ZDphjYahsAfPp5TJep1e61kU21tuhCjO0
	zsHXaWtkyXAuefoGTDYbs7yhOpvgicb1zylnuYTD7DqRP93FuYjB2Ea+pYsL+2HKUDyql2TQApI
	RVNqvkA5oIFybg/OMhV52KdEVn77v4P6/pisXLtXmbDDMoXCSy8rPe4nVb8aJz/ms2f8EmeXdk4
	RXYyhKxa9RvctD3FGYZT2iGEFYLWrXuB96wSgm/lBYNetFtDan6PVVQKmc1WRcG/eLa7NVj2d4I
	t6ivIAADxY=
X-Received: by 2002:a17:906:f587:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c2e23d7e12fmr327647166b.30.1790849484765;
        Thu, 01 Oct 2026 03:11:24 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.14.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e342a24c5sm95689566b.4.2026.10.01.03.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:11:24 -0700 (PDT)
Message-ID: <f61f1882-d6a5-46ce-81e3-b84648ecc6d6@linaro.org>
Date: Thu, 1 Oct 2026 11:11:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
 <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2026 07:57, Wenmeng Liu wrote:
> Add bindings for the Camera Subsystem for X1P42100.
> 
> The X1P42100 platform provides:
> - 2 x CSIPHY
> - 3 x TPG
> - 3 x CSID
> - 2 x CSID Lite
> - 1 x IFE
> - 2 x IFE Lite
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

