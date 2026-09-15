Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85435393DCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463583; cv=none; b=tcDM6pv/qN6xgsif+ucn2ThHKc+jd1bi8hBCOrkl4PySUl9ZecmfcIn45i7JCW182dSs/9p+O6tOGeHeUWsGwCEi6FrN/5tYihPK/+GjyQUkqHsou3Mhlwms5pgZrnBmnTMHnkz19xQKElMCa4VMWpPaLbG950VRNS787fK++KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463583; c=relaxed/simple;
	bh=vxWMbiQh9UJmWPGfEPk739/9AIIk1UDGU3QXq2/A7lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njI1UUt/blYGZ44y6peHq8Pi48ch4WTAZx+r44uJVZhyBEt1YTqSHB/b4D7nw6znfTpnTxM5SZI6GVTi8PgDIwENWmwWwDCneEMxpoJ1xKzv5GaZPnF7Dh1qSD6k4LhLpfWUAOuAlnCxxTUoAZBdoOXwCRS90bGDeRDMTQS9L6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FiEXPjX0; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FiEXPjX0"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2953a01240so491968166b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789463580; x=1790068380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxWMbiQh9UJmWPGfEPk739/9AIIk1UDGU3QXq2/A7lo=;
        b=FiEXPjX0Q2NoTetGSEeCGig12tHI2fcwYYsC5ikYKcUTppbVyABJmRF/ooAqm7Ukbf
         x5V8xJxvWOOB5m5j97t7CXAr8oaxrVRWtfjdHuePJep3soTGONtAU0W1IC9SAKxdbLGW
         rRkQGnl/wJUGD9ctAaMEigUCXrs0OcVhYmqAIhttPyafsPAT5ZURCiz+D3Dqtq6vV5o5
         BquKQpA2kjM/jn/L3fJIybrvgq8ybGvyE/hQdot+vC+MCfGlid+EUcaEMPwr4Mv5Fit0
         mNRbW9kJWnmmUt4rqLN/xOl4VUArzM5J580gdQnRZ4vLki9Wh6QVtVEU67CMPptq+VgQ
         KXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463580; x=1790068380;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxWMbiQh9UJmWPGfEPk739/9AIIk1UDGU3QXq2/A7lo=;
        b=WKuTYmKkAlmd0ysfUOT0jYNnja1hVKfY7tUrF4QgPchNueL5VYS75diwPE8FamxxCN
         YQ3e40OOrNyAPRaMl+0D2LYmoCl0dsE/oMnunjMiOFtTZDDt8ng+Ajn8K6D3dD6kqC7I
         5AUi1j+FAcCy6Q2qYdP9KrCcT+BwS3eSldlsOD+QY4waOEoGR6dzBLRLmsdfHZam+r4d
         wIC5JzrPtWGCekVEkElraLSJzTARqC48O3zubo2QBP/tOPGC+FoseNJjJGqBMsk+1DC4
         EeY/kWKs8oXhCp4iOi39N2fO2OgS8/mqrbkkJ3xpQ3oS5lqq6sbnND3SyoY0HZAGdOP6
         Hf7w==
X-Forwarded-Encrypted: i=1; AKwUvBxld3vTdYYTo/W4EmtdsQLYLu+yi/W4wkVf0Z1P2eh5sp1Vqb0OW9UYodIlolpyOrrX+mOp8+y2Tc3m68mp@vger.kernel.org
X-Gm-Message-State: AFuF++m3Lfcf/HVQimf5KCJcMKbXydsvHd2Uf+rLK5Vt0eEPJGUCP03I
	y5kMCln8hsElziyQH3FKOfNRo1OEAZE0+fTzEhlrb9QYpmiaA9JLM6MXT06r+7wov/A=
X-Gm-Gg: AYBFou2VXGnzhpj20gsut8MQjD8rXF8102tISt52nljjNt9ZByfqB3K3KtrD+XXXykE
	cJYktKO0lPjkrRkEcTXab7qDIevJQVQh2x0sEv5jS2iGrntFLaDU1UiVFRkraJXOB17eHhecNwF
	loxPt2IqplBddbGZrB2ixRnm0cVdS+C0VnYvHN6qHxXxcn1eDE3HzkTrgkUorN0Z0e79jo0xpq4
	wNHfEvWl0j/8ymxZZxxLCIgwnXbSOlp0wHzeJ5pZYof/8gKp07O95vg6/kCsziQqhj0CJ56Wj5c
	cZYnNhC6p0zL3MEjgzSsQWzauOGAoJVIK3DgrZHpm3cqa3msYVun/CmAXnAh8efwzz1NOxGzvzU
	9sEwHrFCYZY1dJo/dUiXTKvCTummLpUCsQsOP7bzACShNb5FfSE8D29aVpqO11Kis0Z8QlMZNv+
	Q/lbBPUknkH9B0rs8IBMrL2ZS8Ea3sIRBuwseY98vgGpajDql+hMAENk1BNmyfLh5FMoSeDyuFx
	En8rwon5WY=
X-Received: by 2002:a17:907:c18:b0:c26:19de:9ad5 with SMTP id a640c23a62f3a-c29b875519cmr367897666b.45.1789463579606;
        Tue, 15 Sep 2026 02:12:59 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.15.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ead67sm546278866b.51.2026.09.15.02.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:12:59 -0700 (PDT)
Message-ID: <f34a3505-6216-4654-afdb-cb797fb8cc95@linaro.org>
Date: Tue, 15 Sep 2026 10:12:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: qcom: camss: take the link frequency from the
 CSI-2 transmitter
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-2-hitesh@ebytelogic.com>
 <bd3fa7ab-9c60-4697-a0bc-92877e8a2885@linaro.org>
 <20260915090929.1284112-1-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915090929.1284112-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 10:08, Hitesh Patel wrote:
> I will use that in v2 and drop the extra parameter, which
> also leaves the callers untouched. Does that work for you?

yes

---
bod
