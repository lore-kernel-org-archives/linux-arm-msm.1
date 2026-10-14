Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09754E3781
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970784; cv=none; b=Pr8TNLxoDHI5kLZ5G8hOA63UuquMURoMxhn7pgHYTbGitaJXc65dgOimu0yrel1Wxo55Djne9yv/ZsLkpMsix9ipT7vxn3gqvtpc8QbXETdeuoMFdfCwvcHI5MuhpBwWPCdK+dDbR2OOsBR77hWMZo2kxYKHmJMNus6UQeO+KvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970784; c=relaxed/simple;
	bh=okzaYTuseeajn/y9/bMRisEYExitpZUhSZUqWkpEvcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvQ3EpsZNrqatVWYAbgBH9Gjfsaqq+ilDQQR4vNhEVi8EG+z7IddG3cfanhosRShj/kDoJL6SE28eiP0XEGH+tCuZbqawtGB6FTdAaikUnsR9SanUKoHi1+gNV6EHUDzbi3BUgb6z7IC3+9didqsp4xtK5BKTDOMub65WZGAlnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgYSlXmk; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgYSlXmk"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e5e801487so585334966b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970781; x=1792575581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1GZw3cNFikclMDGa5RfJqbcmWgweDgc3stMA6cogOA=;
        b=lgYSlXmke3NhGXgHOPHA5I/ODRDwVTY5w3VnVAo81ZF3piDNIh4XsBoU3F1iz85PkI
         MJPqAvklJACU2gpmfPp0bDi3ftPc2S1Jokv5afqZqDrddeeLU6yg5u0LIZMjrpADrc1N
         onBTXCA0w65ZLXeQQNQKl8w+ebMwLaeR5v+FDs2l8+xScqBXny0GK0jMDpASiBiMiJaM
         lMv3DXgCMB3swRdoZZbcFYcBfWygGMUKeWYEsz9X8IOMACwEMYccR+UV+LSjSUVZuKuF
         MMJM070xA+/vncqYacXgO07gjHyxC6in/VCb6VWENb131SGyDpWngnu01nYwWEMxibmW
         9ZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970781; x=1792575581;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1GZw3cNFikclMDGa5RfJqbcmWgweDgc3stMA6cogOA=;
        b=SuGoNSIpzkQhKPuPNH5tuSrGtMqZc5u3qPW5qY88gx2diSZl/0r+6BTmKO40YPf9pu
         zHYY7dFWUX0CjqkMjmCVUpqIG6YS3aNQ2mA8QmUcoue8BeGpo2GyGTM4exGLnngkrhcG
         HTmlahdwLLBkfVE5cccy4I0ZMKSINQjLKKXy2ho7BP0KHR7BL00wz2pA0lMbSckAXhRT
         mPL6Iud74lX3+oRKTn14u+Ri0ZZggOgD+kK6sA8JJHdu1u6YpDstjTVLvCcCRefY4T1b
         /cw4Im+NmyGPCg1nBzAy0U9J5u5wZOxUDFPBA9fs5d8W4ArZr4tRuloiNqXqkFTJUdOi
         PIzw==
X-Forwarded-Encrypted: i=1; AKwUvByv+x5OM/JXGXR7Blnn7kZ7ms6krjDGRKiuJSOn8PbbdY3K+7+8niWW/68eEKhoCi7JHpZ8vOUM2rdLI8lT@vger.kernel.org
X-Gm-Message-State: AFq9FYLC0U8ExVVIScbI28TA40H6+eQcy4/bcVDY4xu3vrlzYPyiQGOR
	I/WRE6/IUJY0DTR0tU4kJWdM4ASxIghxnVIaLyL80PzWR+IhyP0JDCv/qQj8+v4x5pg=
X-Gm-Gg: AYBFou2VUPBpoE4/K8EVi9pyIhC73jRb/kSkT3io5Q33nVZyYhunOGYv56MyWbI/cpY
	cczj/3ZaoyhjRn1MHdLF7xO5X7UV1IIsQw7/WfRwSHfGJZhtWd7cqo5IA5D/W87iiwTkg42XKXv
	zuzIN+cePrvQMkkxEXZz5XkMlZe3tBd1sge7uuR6gCn+4631KbT2+PmtlXexxwOyGj9JBIjhX/B
	x5k6K1QkqxDhjLFMIgJcdlfUeTKPe8uoaoaCFLS8THGAj/8GpC40vt+8zI20XvbKuLWwBPr3kOx
	zDbRAgEod/vxNt6bzT9EpI4zRxgFbjfJh8GfUtrSTZNIs4hJFZNE2RABH4vVij00GdThZQRr3Ya
	xpz5NoomIymTpXCCoafzIJyyp0HkCo/plZJx5oUpjw3FXy+ZpYW2vBv4wRX50JBqO4nw4D5aIrB
	xmKa8XGSPDwj0/IjcUzKw/R/YTChQicwG6rHuyWani7Ek9kYwOuLmoiw+TjkgY+RJ7cnbFCv6zI
	HAORlPdVlWW
X-Received: by 2002:a17:906:c116:b0:c31:8441:35ff with SMTP id a640c23a62f3a-c31aa0e9367mr1389779166b.48.1791970780874;
        Wed, 14 Oct 2026 02:39:40 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm681485866b.80.2026.10.14.02.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:39:40 -0700 (PDT)
Message-ID: <d08f3f62-713f-43e5-bec8-dd58997c2249@linaro.org>
Date: Wed, 14 Oct 2026 10:39:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] phy: qcom-mipi-csi2: Add Hawi support
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-5-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-5-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add support for the Hawi 2nm CSI-2 D-PHY.
> 
> Reuse the Kaanapali lane table and adjust the data-lane CTRL0 value
> from 0x8e to 0x8c for Hawi-specific tuning. This prevents potential
> stream stalls and SMMU faults.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
