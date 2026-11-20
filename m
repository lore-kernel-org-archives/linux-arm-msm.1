Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175571;
	b=Da5Ng+YiJumafM3uSrTigEvq2qho7n+CC4ZWWZzj4SydTM6sEid0LP0GvQTl8VAEmbiN
	 /O4wKLzIpLa0zsgBcJ/nxEia2VNaIVzzo+JpQ0NIDIxP8d/pKgJsI7+awF4PVHQvQRalY
	 XLVpF8jCoTHfAYJk8pcnyFkzGY0h3ag6gIU3ENeONZOR1cZ2/Yx0wKKx8coSKARicvyfd
	 J+sQNjtewZ9coR1dg/eBR4Ckt1CN8IS6yuatpPbgGWbNGFV7hGmOhHokIiItlmQ4kjwKX
	 MB+cKO8n3s4RuPH918knWnL2pl4SDWOIrRusoIJgdzVoVnANLsxeeD0BsFesEBxIpxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LAgvIdQQwmp1OleVudQumUn8l7JMaos3FxIAqmwJxIc=;
	b=HzOpowPwWZSLU9AYyXmiQZFTiAvl2M0r0gDMDimMEfZqsmTST8S5bGJ/uvOufszDnqQU
	 ti0FMcWeaHG7m8ictM7ZtwJFHvBMIDBUaFXKwzBsfnqrBFfYyq3I6Uo1m5EvTFtmRQe/0
	 ibhVxbOHql2Fh5s4XhWR8KFs+X9yyobJpWUgvvjXg/tCpoedQ/JeiRC8y85Jm5R4wkP5F
	 LKIs9l8Hdqr4K9uu9bc1YspE+7k9c1FMSUY4mBtKemDvo3e/aC4q/4wto3G2wc28X8Vk/
	 LNlG4Vgupzty3AGm+O/z5ZH+DZ1796Bt/kkr2Hyo8fl5mDzFI/aYEPV5/BzWExjrjpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="KO/NIHxw";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413A606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F413A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KO/NIHxw
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so7413505e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795175569; x=1795780369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAgvIdQQwmp1OleVudQumUn8l7JMaos3FxIAqmwJxIc=;
        b=KO/NIHxwBC0mednmwAI8pRPijQVr6PeehxPjlr+r+mn/+azrSmaZxAJKd9fcJdS/RB
         hWzD0ABPIz41LXkSpWZSW0prTyYH4/BpsQvn00MByDG23v0gb0uZKc68+WIMEXxGVRoA
         jpL1QLZ17XiMqbvXwB4E3iqiwFJtrjOWohTaojPRYnvqsSc/9G5wEiexYkMm8+SFNBye
         V3kD4STrICzPC6kOXhZiBSWmHqPu/RYunNBqogZtQjtVhEGavdi5psYhgBPlI+SuLTHE
         WlB1YShx4HeTIRlSUfu9oYsTD1gFcxv/co3ITbH6dMaxECIkDi+cDtxWqa55dnrTOWEh
         n9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175569; x=1795780369;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAgvIdQQwmp1OleVudQumUn8l7JMaos3FxIAqmwJxIc=;
        b=yH1Bfjd4dCe/tKkLdoPfgwVP9iFgi08iQXQKZY295SKUhWYA1CwBAh3Oj3o7jW2AyA
         GjqL3SE5DV/ICZ7v7Nmov4EbN3OZZ4FjQRkuAY+h9R6IAWVR35bU0XKxDufZvMYSYExu
         8IoGiWXD6WkLX4yGiXD/wsFA5MyyiAxfzUvKtrLtZh45IIyu0kekoGK0vI3Nle5syWpn
         K3CDNayhkPOzYCxjsD0pYXiZMg+FPS/KaYnxjOw4VEPLomYyGkF5Hpk6eAuiv7qD8fWx
         RcIwZI7xrn9ZNXUaNQlOLmIkjewQV/NrncZHD3U0ohag+qYtiIKRYSuHGWm79d1Dn3Sg
         iaCg==
X-Gm-Message-State: APuU4Z9yDsxn2Y9Fbp8raTBGTmrq9CjmJXgDAGAGniKq1lLmfU3M8cy3
	0PcR7nBMIqdTAgYdhGZWJvANR+i5BV5vLDZykKgh5s4wjequxctnBLYxulsh7i6FA2w=
X-Gm-Gg: AYBFou3Og2mKhz3fOymvX1Mj8nIDi/tKfsEOLgsvYvLmgPiRx9KjmMYjaz7NRAOu647
	GdtQ0uKSJd99cCXO7UDkgBl+Ux0XG1YO3PaQFLc270zYPBxTJWcsiGvANmYja26PMj9kFbCg3Rs
	8c0D5HC8FIM45EirqGNLKv1CL1yI+FLSpMarGhKXfqIkl1lux0EUi/dbprF58HgkhP+YCMOc9U8
	lBgPXjsK8/HU78sABZdg8NSUJDAi1B8vXMW78BPYiye51a/pSos7cWDFkW7MhjL91//aDXdeByv
	jkGodGntsyA41i0J8LScPpItVUtIR0abFeeRAu18IiZDPOVAc6Uwh3S1V0xERfC+zcTUckyzm1F
	0A2wVFoKWkr1r+KliC85Pxzx7hdAyqjVCXHhwx2P9Lx3bxf7G8iugPDSNF0GZ/SBAhU3X0d6dDQ
	gfdpnQOWi818MxPJJOD1B2zUKNGUAIUzRPE9mySVu0EEao18fXsoFNYXtJNahjZQwntgOx4WBWD
	6uxE0kYH+9cxO46xBidknwPPdrr0mAK6gP8jLFOi6GsOqERSVlWNZhfw/x3QLGmEcCimLf2On3P
	FSL1/HVucqK2O04uttB5xfijARQ8IpB/vlBTEEjMfg==
X-Received: by 2002:a05:600c:64c6:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4bb887c2c98mr60927405e9.4.1795175569215;
        Fri, 20 Nov 2026 03:52:49 -0800 (PST)
Received: from [192.168.0.167] ([109.76.69.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm113806905e9.1.2026.11.20.03.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:52:48 -0800 (PST)
Message-ID: <4e832b25-bd98-4a48-890a-02d54d3b117f@linaro.org>
Date: Fri, 20 Nov 2026 11:52:47 +0000
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
Subject: Re: [PATCH 1/2] usb: typec: qcom-pmic-typec: pdphy: disable the PD
 PHY on stop
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
 <20261120-topic-tcpm-qcom-fixes-v1-1-9a152f906fba@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261120-topic-tcpm-qcom-fixes-v1-1-9a152f906fba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2026 09:59, Neil Armstrong wrote:
> qcom_pmic_typec_pdphy_stop() only terminates the ongoing transmission and
> clears the RX frame filter, the PD PHY itself stays enabled.
> 
> Use qcom_pmic_typec_pdphy_disable() so the PD PHY is also turned off
> before its supply is released, leaving it in the same state as before
> qcom_pmic_typec_pdphy_start().
> 
> Assisted-by: LLM
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 435e07659d65..08cf65951796 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -545,7 +545,7 @@ static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)
>   
>   	cancel_work_sync(&pmic_typec_pdphy->reset_work);
>   
> -	qcom_pmic_typec_pdphy_reset_on(pmic_typec_pdphy);
> +	qcom_pmic_typec_pdphy_disable(pmic_typec_pdphy);
>   
>   	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
>   }
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
