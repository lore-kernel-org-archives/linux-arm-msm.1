Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201469;
	b=KP4yuGsVgpn1+cLvGvyk/DldG2tv9cts7IcmsCZcquflbIyWkegV4uXNtGp7/MozUTvP
	 pgcLkWCQE8d45GzsJFH/AFz19l47Rj9nS7w7k0JqvDq/O1NdlSL0rzY+dKQEnyW+zhVWt
	 +KpMneTluj8DXKm4bed2kCNPILmCA2ln7v4PBUBoW/5uOa9Sa/WnHriE5mSeD/t556P2K
	 zjdtIrzBIwt6q7PWB3j/HEQoylajv5JsIwCMvC0YXdXbocqJUjbAu10B5FObd4vpQ9xrq
	 tjJph9Neqk9j3lFlJPzi5HPDf6UoVaI0Ie1goMB510CnQjq2yR9EfPGaXDcB8DjncTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
	b=YJsKYRLtyYNm36qrUobfLhu5oFLa4tbVJNL8yl8J/rVJTBN852is//Cgj5zmFqjNQ9wL
	 lU/sSroDGZDnFRcqPP6/eYwqAisgRwasg751iNPHYBA+j+xwIAwY3CwVpkGOtkSQ4oo4K
	 CBxU5CkC6zZVZaQ6cPqM2TwP/PT/75QwiEVKwXewInKP5c3ZAbkCbNtVY+FWChldZMe7l
	 9aXfibmH2QHnbXRFOX8dvWWeAqXESnLFd+vyk0xOVpe0kvgDepfBkFPb16RcTqxAjAZBI
	 tvL52bqbg5KJ0xW8g4WGMyhLfVjm++fmxsXo3ksb9aeffLy/ONRhwRZ7VTKUshYMlFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpLSHtz3;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A156606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A156606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpLSHtz3
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4682977f9aso140682166b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201467; x=1793806267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
        b=ZpLSHtz3kFRM2BRETpYSukD3bRLdMeTKGj2xHeVRSOavkV/SJShwlinM7GpZCEqYy3
         zD7wE36CmGuVt0WMUlb3rzEtobX818C1CgH6DgL7nMrgCwL1NvNueDFwKWGzLMXV+kEd
         GisIPOclVxDYGguyzba17fLH5ZszWEgnW+1ceT8rlUzLkFLCO7oMYINNoqlmBKqCUTYp
         7HWmoWQGizm2Ewx79YjaPLfAcNtKLpUSwRvWkAKEIkb51CS876G3x1/TiDL2hpcue+qc
         M0i8Dhw6UDGpu/Jpz2uK2YgVFDwNPoR3ykzRej0CH4upXFppSjaVmmOiNTrpYE6yE0RD
         PgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201467; x=1793806267;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
        b=hmrG+zo5PxJPMYkdXmquZ5lF38CgiyXLLZWNHx+A5rLRj3jF8IqJGMmw9SIQPWhId6
         ZcM8suaoxd1mqm+azfWXIfz3fFJlRCTUCCPtJYLkdelEBuwPbX9ueMqlclqvy1kOwrcQ
         AfLlWHl3Zps+uzTThFQBXRFg8B6m4Uxcowc6KlKAsvwmQmp43TXnH2bi0/wUF5A+zRVn
         zvVB73DjprtL8MsTBSMVpOZIEOTWPrLG92cHLq4DpVAa37Z/nbfRYJhenkkstBnEceLw
         2P4XWFeenfrVRbGgBfqB7uiHTwyc7QF03bnktnHIHet0heeuv/A920rxKDD8Si0oQUd9
         rHJw==
X-Forwarded-Encrypted: i=1; AKwUvByJX7RjeNBlwyU6pd9Eo8QOR+mK0PJ+2pnpmbGAVkSJuucQXv5/P9HFqdalhz+lVblTFPU8yL0RE9CRyKDW@vger.kernel.org
X-Gm-Message-State: AFq9FYKdWqe6MZuY4rpgKqNXjRj1QR5x/uVH2OSzOrzjlniXYNQSoMCa
	a+oPNk9J5RQEdbDj2021yvq02Sia3BCV42fmh8uraSgRTrVCcdNthhWA8O91ed5PGK4=
X-Gm-Gg: AYBFou1kUJF0TjegIxrkdrzEOTm163iynvIiwtAlscWkPWvgBAtjp3LfjkI0UNq49+w
	N4KNioCjwL1ATn30NeWdggDaEG4sw4MAXsvqPcpHrbiXumwJwM176/a4DxWTW+fWsIzI0aBYM6P
	YqhKuodAKy682+5o26hebFTyCy/4CuiDvVedmNMEUtCHhoIM7GJG08TDwJry1/5SNwwWUnHyrMQ
	hwxMxCweKQfun+IxXYcP2dl6viSX9NJvGtjZOsuFdZGRDwpOv3G04hhDr+2X/ZSMFy/34Nt/xZi
	5trtm4c3evJ5B+hQEAMFukcBX5rzVyDoYY6oilctt7WjRAuG5t8FSBXKNBB+M7x5Yq/LdtLbS/6
	xmIYeUMJTXr8XIFlcbTg26qiyeNNyd+e2BmwnF+CM6K5sNZs/gw4xh2xTPmftN8RoEHrm+jT7TM
	+Sd2sN8Q94lMwAlzrdwtufMQLVZP4jbDnqbMpnfeBlJlhy6WNeHU2F7FVv4tfJNoN9+2QKOHV4L
	0CHEE2H82WfzugwFbWSj6cpxGx93thWzJfGiovc6GaBz/Gwo1hIV0xE8QsDvNJL81nbgIzsxXCP
	eIa1+jXbo2x2UCL2rQS1eq1h/ukXQF3kiXfqz/HXQ/19b+gCZ1rti19PRpKw/cg=
X-Received: by 2002:a17:906:ee8b:b0:c40:9839:c892 with SMTP id a640c23a62f3a-c49bdf140a9mr230072266b.19.1793201466691;
        Wed, 28 Oct 2026 08:31:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9995sm616663766b.15.2026.10.28.08.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:31:06 -0700 (PDT)
Message-ID: <9d22f3e6-7f6a-4450-b6f5-871b87fe49bf@linaro.org>
Date: Wed, 28 Oct 2026 15:31:04 +0000
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
Subject: Re: [PATCH v23 07/15] media: qcom: camss: Add PM clock definitions
 for Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
> The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
> sub-block. Register them as PM clocks so the PM clock framework enables
> them once when CAMSS resumes, instead of each sub-block listing them and
> taking its own reference.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 98ec23c39fda..a64242c66cf0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
>   static const struct camss_resources kaanapali_resources = {
>   	.version = CAMSS_KAANAPALI,
>   	.pd_name = "top",
> +	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
>   	.icc_res = icc_res_kaanapali,
>   	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
