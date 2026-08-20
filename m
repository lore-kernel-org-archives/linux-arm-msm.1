Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A25640DB55
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220926; cv=none; b=b8QwCr6tm3dFqJqdcnLW/9ijqI36IvZSrABhMvI6uxHhvEd6qtsstPLx81QPbcGBrfqzXgJcw1vMVRRnwFDHrhcRDAsSo3OepUXiMxtda4BwxX1sUNgOnnIVpMT3EUatNvI1jwfScA7kpyjAfkoBmhiHskn10wauzp4nC2w58gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220926; c=relaxed/simple;
	bh=yi52HTwj5/V8AkISUNtnecpfAfVpbB7rUItTur0eknE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=km88U2vDt+dL9wTLDl9aAqjRAjU5mV6WgIDOt8tIomp8wEAI9qP/l8UQIBK//M/tca/lUoxxokNaURo+U0UMZ2Umz0fmjyOlGN0VKZgtvjk1RoOix0rv5lsaEEzL3xCOvVyuffDSxF+u+PPyUUg0INa+h9aKZi/6Y3eRRRmbv+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gp7LaGCT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gp7LaGCT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f71156e1aso947802f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787220918; x=1787825718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=73EKv/y0Hi9qvT6SwJd1WZqVvHE7yq7MtYlPP4tI3D4=;
        b=gp7LaGCTV9mM2p67TAdnwWtXn1B05kzyGKw0YbXpsvQx74eq9Z+uzLc4yofEBbYOLd
         iOeHcUJc47HgdJceYgvAuXKqk0oWV87ZmPdPwPTR6gC0WhM9pjbpEnLzwfRoa3lw6j4g
         HtW47v4NzHcs6suHdtmbYaiSXgFCFuQrq+It2+BcdmhzpAv/uXlHQQLEwjX+jFBVfPOD
         JGT/WpR/Whca6xcgE6CgT3mVYHbZn9qe+X4RCL/FFPytFSFMJYGpYoRQKrm9A7jRQplI
         rg50XcsnVlkRDDAQbz8HTrJaRuHRK5PNf8b0dj7b6IG9iVO245VNE3fgRFo6Xswazztz
         MBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220918; x=1787825718;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73EKv/y0Hi9qvT6SwJd1WZqVvHE7yq7MtYlPP4tI3D4=;
        b=e3bnveJ++Ud8Tkg+ymR2o27R3yL26BqSSC1jeJz9kgkKD4d9NHO2PZk952Lt9mdpXg
         WcizbV6W9hBxcorQoFNem21UuSoIxHMJKV7aWZsAqo76EBd79IE+/YR2NDp/w7pv9WQn
         lPKXNGBdrdTyRH8qH5+6BudZGXWTPIID+9aeR7OxbMsPMR+S9phWN2u73YUcIRp0hHPh
         UQ8+hkVF0wQJ+SjPpPkNr55/lMd/KA4LUABjVNloOkVJnTlKSfXt9aKY9F1VxpvkBFRT
         xXaT/TWF2/4ziHDZOkHZ8sO7YCjD2p+ZrRJv5pb0CRrlPKZ9M1Nb8A/F0o7OmbmegE8b
         88xA==
X-Forwarded-Encrypted: i=1; AHgh+RpBu/3PN0i6ctVP4OzEmZtZuy3Ad0cyJiKFhdYH52YPUEt+R8JoxUQs4ucbDrS8tuc4+QYuN7djxvDu51ws@vger.kernel.org
X-Gm-Message-State: AFuF++mqMqKN+vqJxCIXZ5xhQFv1FOCs377DFI2G/Ss9SRpRZitlkG6l
	EFpLS/ufZTkUN1Dm14dW6XiI7/fLTWF+aqZFh3YDfr+qB9/+W9QG//7Yb6QDM3ivMRc=
X-Gm-Gg: AR+sD12G+MYOjLZBbHY5Dzej3GLInWNJrqE0Tpa2IdkRKAnLvicOPH8P5spnufpi59+
	zHAXkUV9sslePjQVmbLKbxXkgyKUAZDaVGEbkvjzRSXvV4r/gCGgy4JiW6AqOArs11WNW8xfXjB
	eeDEABtXAJq2f0nu3pP0yCq7HE7U04WJXP1l4KfqQa/92TfrKu0imanQFI+balnEFGwQUrZAymw
	Tcbw3WDleubwzBZloBXtQPPI8/cAm0dDvnq80rakDPr+nfk3RrjLD9fzP3mKSfr/ml+13lsqaXm
	GAaoSk0Tj2n+9iQ6CNeqZADEHdb/22dVcxh6GPC8I3jQ9RIOavAW864yjvlgwJDz1phyyLwC/DL
	VUdxqaQViTw2itwaJnoy+A0aj1Dn4cokIAS7IgIf4N9nlChq8cGdPO4Ym0JCBhlgkCAeCD5xp8H
	C916z7fojY4k+UfU/co2QiCmxdhIUtDHgP+LoaEwEiqPBSrFWqlK//7zyQhgzm0tORnB0usose
X-Received: by 2002:a05:6000:468c:b0:482:b813:8315 with SMTP id ffacd0b85a97d-482b8138536mr5738861f8f.21.1787220917614;
        Thu, 20 Aug 2026 03:15:17 -0700 (PDT)
Received: from [192.168.0.163] ([109.76.167.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d9783sm11601123f8f.37.2026.08.20.03.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:15:16 -0700 (PDT)
Message-ID: <f8d660b2-965c-4955-8ce1-3871f84b3811@linaro.org>
Date: Thu, 20 Aug 2026 11:15:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic: cancel reset_work on stop
To: Fan Wu <fanwu01@zju.edu.cn>, linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260819161448.76597-1-fanwu01@zju.edu.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260819161448.76597-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2026 17:14, Fan Wu wrote:
> pdphy_stop() disables IRQs but leaves reset_work pending.  If the IRQ
> handler schedules it just before disable_irq(), the work runs after
> remove() frees the struct via devm.
> 
> Call cancel_work_sync() after disabling IRQs to close the window.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index c8b1463e6..abb9d0321 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -544,6 +544,8 @@ static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)
>   	for (i = 0; i < pmic_typec_pdphy->nr_irqs; i++)
>   		disable_irq(pmic_typec_pdphy->irq_data[i].irq);
>   
> +	cancel_work_sync(&pmic_typec_pdphy->reset_work);
> +
>   	qcom_pmic_typec_pdphy_reset_on(pmic_typec_pdphy);
>   
>   	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
