Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986E23AAF72
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221120; cv=none; b=ERWyqIBDGHgXHvTBaHlcA4SYTcCuPkamELN43kMp0mdNxl7dMP16e7KK8/eJ6wmknVohx7he8SbM6MaTDLPfmPIKF4lwxfa5hCvSJMUG2NGLSX0KQx+kgl/wt6cqvMyYcuxOL+EHwbscU5jWYeYdhEmsykpCABGPfnxvN8EQVeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221120; c=relaxed/simple;
	bh=oU8Q8cxZ9N9b+kZmjkv7HR2+ZdQQqp1Cz2rEVM7YSDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=parvhZok7CARMw27Tc6cSUexDSHq4zqeETsVIYv3dYYaBLItri/03etlOlvPw4QMN3jGGCv0q1tcMcg0Jqka1ThSOPjJmZ3ERajOoXil7XDPnZAXteeq9jQ7A2V+yUR42BbTLTrlROJoyNCpH7o6ksWL7JOTcOb39VyN0Q3G2WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dj2HhQg0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dj2HhQg0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f71156e1aso949586f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787221113; x=1787825913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jTRsDr3KJBScAQEjpdGgc1pnZRQT2r5s5VcOgpe4HIo=;
        b=dj2HhQg0Ugn/oZ0IO4A7m3B6+q3WUTqn2iVFeGDy5o6HM8tawbZ9BKIpZq/K4ex8md
         TGy0Uzt0rb/KterUNN61Hm6014ZcCJyNlSILbBOWyBHSPMDD6ER2tD3JIDtU4Wjpb1O9
         zjkDikGeYfdZkuu2et8GdGPVJkW+nWJFQeWooYsSPaxocu1Wn5q23AUvVg1xIyu/32Bl
         qlXh/bt4jOBKr+T0DuE5QwofJrrfDTdEko9r62+dqmIfrDmvwZ/2VLoS2EqAr95prRNW
         CqB+JPUP3exlldqo3zfz60Un18pxjw79qCL8OSvmSLgPjsQrOWa/HUlISosLYRlH95H/
         u+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221113; x=1787825913;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTRsDr3KJBScAQEjpdGgc1pnZRQT2r5s5VcOgpe4HIo=;
        b=VsTT4cfVJfkVLew85dI87MAhl4jt1P9N04bbBAC2579iFKJ/XSFLsAzT6lI7QGER7e
         gFogJCl6xDtNoHgz4Yd6IbMNHC6N6vuJtfRUz4MbUqAvfAgm8HWLgsrc/yqxmPSJ3RNv
         j6Vbh39mIM9xQfdDHoruvQ6/2UG1jKj6/2KNU/0YaVvTAZOzyTY2YALpIdpOp8b0DV+Q
         gTwLIAqiSG3POS5YDNQY/lAw718+z5icoH/T7+65ChD8C6ke/pD2LDAxOXyAC6pd7qZT
         SXaG+JmPLwzxbDlApzupEqBMfaKDvh/RsEGh3dti87ktyc7wCVFs7Iay84MzYCcOyAxp
         n/8A==
X-Forwarded-Encrypted: i=1; AHgh+RpepZdEAcxxDqpU4QiD0o73kYh2A3fI9OvQuaM5R7CS+6VK0lMTIJmDJAribX49G8qN4pFj0fpHG8Qbh/PF@vger.kernel.org
X-Gm-Message-State: AFuF++nC+nZF5SITmvGmOuK3/2QR/OTD0D/pHXejXC0ccJRsvLJYcGv0
	F7Msy1kzwEBZJwJkXWFxEz1auwVn8KsRF+SpjC184/t3R0LVQ9QBY5yCATJcjO4nvQQ=
X-Gm-Gg: AR+sD10WYUhiz3OjHsC45bnIBotDh5+61IYTEhPRLxERYtXvIFVXhCrBFk3QoqliSrb
	vvTvY0z9ALLGDlqn6SfZNBPUYn0Wea/G5VBFoOK0FjF5J+1UApzkNHI9wKAvitCltnNLoWXV513
	5YCiRf5HB3Aafx094OOZU00a9zpo4tIp2Fhp6zc561FlnRackGn8Xx/+WD14A5nteVaOvyeiG5m
	keTLIlx114e/whIqKjvKwTiSYe6LZC7x1LuWWeL7uTaC/j8aCR+i5s5l9Kj2a64Jg8s/La76VJF
	W4EtRRJA3q0tBUnFd+XrVsjbvBn0+EXnpH0WW0O/VVw26E+Tm09KR6fJ1/MUvNj3G1cv9djt5a6
	DVxIXcOqXKPJobOmC7PME9jT4vvSNZxsMInziTZsbAva+w7MjMMoy1tVGs/DVvXU4ykKnLB9Z7W
	OWt2xGNZmkuwph1khYyB0qiLKkv1wBepqzO8FJFrMi55OqkOO05Wozsix7byar8UxKMACqxX2e
X-Received: by 2002:a05:6000:4918:b0:47f:8b9e:f44e with SMTP id ffacd0b85a97d-482b1fd48e7mr24038240f8f.12.1787221113240;
        Thu, 20 Aug 2026 03:18:33 -0700 (PDT)
Received: from [192.168.0.163] ([109.76.167.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c33b3sm10947026f8f.27.2026.08.20.03.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:18:32 -0700 (PDT)
Message-ID: <3662ce56-7471-491f-b2db-7a87a4379099@linaro.org>
Date: Thu, 20 Aug 2026 11:18:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: disable cc_debounce_dwork on
 stop
To: Fan Wu <fanwu01@zju.edu.cn>, linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260819161950.77858-1-fanwu01@zju.edu.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260819161950.77858-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2026 17:19, Fan Wu wrote:
> cc_debounce_dwork lives on the system workqueue but is armed from
> tcpm callbacks (set_cc/start_toggling).  Those callbacks run on tcpm's
> kthread worker which is only destroyed by tcpm_unregister_port(), after
> port_stop() has already returned, opening a potential race window where
> tcpm's worker flush re-arms the work.
> 
> Use disable_delayed_work_sync() in port_stop() to cancel any pending
> instance and prevent future schedule_delayed_work() calls from
> succeeding.  Also unwind a failed port_start() through port_stop(),
> which otherwise jumps straight to tcpm_unregister_port() and leaves
> the same window open after a failed probe.

I'd prefer to see two patches broken at the "also" in the above statement.

> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org # v6.10+
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 3 +--
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 2 ++
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 35320f89d..f42c9e65f 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -101,7 +101,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   
>   	ret = tcpm->port_start(tcpm, tcpm->tcpm_port);
>   	if (ret)
> -		goto port_unregister;
> +		goto port_stop;
>   
>   	ret = tcpm->pdphy_start(tcpm, tcpm->tcpm_port);
>   	if (ret)
> @@ -117,7 +117,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	tcpm->pdphy_stop(tcpm);
>   port_stop:
>   	tcpm->port_stop(tcpm);
> -port_unregister:
>   	tcpm_unregister_port(tcpm->tcpm_port);
>   fwnode_remove:
>   	fwnode_handle_put(tcpm->tcpc.fwnode);
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 429bd42a0..fdc379fc4 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -694,6 +694,8 @@ static void qcom_pmic_typec_port_stop(struct pmic_typec *tcpm)
>   
>   	for (i = 0; i < pmic_typec_port->nr_irqs; i++)
>   		disable_irq(pmic_typec_port->irq_data[i].irq);
> +
> +	disable_delayed_work_sync(&pmic_typec_port->cc_debounce_dwork);
>   }
>   
>   int qcom_pmic_typec_port_probe(struct platform_device *pdev,
> 

