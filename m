Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015E043DA26
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429975; cv=none; b=cIJ3CEgAkGaTw5X0mHiCFBGztTL2z9uDvOvClV9jBel2NMbd2YhB3bb+mUyIBVNX8WsZqURsLt88qk6wfS+aQP9VBqEcM3IXSnXSBlvKnDwK3+LgMW9ZkPYGMfNMTgj5fK4mIirhYPLf+12R5rCMZMHYtQefz5ZXPdDSkhpGmmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429975; c=relaxed/simple;
	bh=4PCF/pTuaQyrbWnAxj22N/OYcuTbKlF5oGBXIAB9HlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qry6uLKzrnlEqTCqZFAnugD/QF4uSDs7ue43NYV/5k8XoXfU2KQRpYKosZiv9lFtNNnxzhD2618K9l6qjWubDZPFRBmOyfr/BPDZPxPrdBgID6UVIDQ3oa0ycS8Ayg9biDwEYLVFqy/MRJ+zGpuKQLy7e2E+SiIy0Ybv9nClMdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ihBQu6b0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihBQu6b0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso15493795e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790429972; x=1791034772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Z7fw3g78kgiNXX0wSmQAAF31Sb6byeELkTa2HVDBpw=;
        b=ihBQu6b09GQpB3/He72I1I2v3E07wXqqmjmsqIP37DuzjzuVmmABwkkLhduGoWmsYH
         3Jf4ADssSWbaTfm8tWx3K6Ur/bS4GQ0Ca0zZ5x7GZYOoCHkqdrXVEoFNrD1+uX4s0W1M
         mv6BO6eHrVTqzPmtmVPpJBthPJR5aO5koB6ecyAjWTHmAFbAPJCt56+PlR/G280162Az
         UMKIQ7QNn3EuhBnprpcuedFgJ4uV1NuxjBlg0tQ2IcK9s+WH8I6B/CUk6X/vYffr+mAH
         eL7/Y2ipqi6v9Nw1GsUIqNeYtvopTcs9DxRRPpMyTAGiZWj+QCqIzSN02eHd2srToM+q
         9n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790429972; x=1791034772;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Z7fw3g78kgiNXX0wSmQAAF31Sb6byeELkTa2HVDBpw=;
        b=MHXReJ81m0R+ZV1a3+q97Ua/tlKmucWyVcHsIhUbH7EqNukC+4BTtfojCAd4gHwSzN
         R8yqAvyso2WGE/0KMO5LzT6nGAvkvnu5HnFJYoXz05VTbdJC+HX7DEZ38lBvMXK/PAEe
         Lh1/bhGdPfbos+STicHN1ava1u66xJDFZcCv6VAB2Jrd+pTGph5eJnIqSnr0/fvNSsz5
         JT0bxVcVmDv37NyuOFSbVOAhJ3XTSUQygB7fxUkthQs6Zjo2rye1y19rjLBl+bWHl04V
         SiUYsaoQTR7MQfBqc6oySuV+AbpsDkt9l/or9NLWlE1hoVpMYUwNMSNWD9D43FD+/jbS
         ClQQ==
X-Gm-Message-State: AFuF++mC3XeHUeeqasKq6o7FQfbndPHKmTkfermPR582+qry6apVEG3y
	oC2dzjcPzE17mB8Ey+LEKgLr+mi7EMDH1y7DQEc5TxyxoJmr0b+0eH149ek36HaQUsQ=
X-Gm-Gg: AYBFou2Tr/sIpWRVP89NuSBrOnM+6anKr+g6o3Ynzg34F3H4JKj3YEPDmiBm+qqBcZu
	+jVxKQ/Z0q5ZchWEf4n+hCCshut4pBOgGllWw55OkOb1us+MvtwuGEuJ0nxXhCSVKL/qzZtTKiu
	moPuYmod1trhi7Qsp6JNRgmb60WFuj34Gi/ZbEHqDlOgGnIXrzEcYSK4NHb1LXmXfJ2K7BA2xM2
	Gcm7Yh2GNtg5IILZ/2DEA7/uaDcy3v1kllb9YVpusVhBC2cXCBsP5tM3RIvLxaawrKn7HIa6kMU
	SgxGyi63hYSJ6Nl7Apu10lZp6qKk1XlrToPLI1u+4KHvcqZWlPe0tZHxXIF1tY5LNvx30ifm5GV
	l5pURo+nKJxrrXe4qZN3WXR/cYiPS5Squ540XgRjlGZ5e5+TX+A8quXk0utAatY8I+fbW0lC/zK
	RIG67iuGmV2hE5hg/HjL2OTuMxUzaimvZIE/hHyGxMG+VAGkPXcPiElfb0SIxF+Y3NrvD5mCjm6
	XaNUP2DAeE=
X-Received: by 2002:a05:600c:a10d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-49fe8bf91bbmr113280505e9.4.1790429972111;
        Sat, 26 Sep 2026 06:39:32 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a76fsm14706746f8f.7.2026.09.26.06.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:39:31 -0700 (PDT)
Message-ID: <0946da1a-e8e5-4ccf-a422-abcbc24cdab3@linaro.org>
Date: Sat, 26 Sep 2026 14:39:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/12] usb: typec: qcom: Make PMIC port probe
 selectable
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg<david@ixit.cz>
> 
> This is a preparation for extending the support with 1st generation
> Type-C.
> 
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg<david@ixit.cz>
The code looks fine but, I think the commit log could do with a bit more 
flesh on the bones. "We want our own probe function because"

Then:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
