Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D63630F531
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144800; cv=none; b=WSy1JVREPZAnyZtCkKy1DP5Ll75zfG8z3DdhQpsGw8Mc5exirVtknSQrJZCbSqjdUCCyN6A6tDq5VivbrH8EnwISMbTB6qwlBEvoiDeGRuEqk52EJzL0HsKpMCGnPM+enjruIRunQC6CB4DO0YLyydMMXUcr0cMjMKWX4poglr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144800; c=relaxed/simple;
	bh=MNYY1h84EpmIY1RYBpjfrjnOmLrFg+EdsCvTAztO0m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcUI/sSZfDuyCV1A0U0KsQIDcLAGbQj9TnFZ14uEjanFVZU0MDSpzbv/+lYLjVMqMm86q8mT2CF9e0mq/3ABzOH4LhTFMyujzxbv8HS5L9mdvMuI9HUzKPfC3qmHw8Eq8ePSoN8CfOx+vgYQQ6nIz8jiTeJMcbOBaPt/reVWXQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=np2olFkZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3QyneC5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="np2olFkZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3QyneC5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9XICJ280576
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wa1TtJMnngd8nPLKlEErbenLvZBNtCEdzV9cCxILRr0=; b=np2olFkZYYstbOGs
	KDAbGr2T1ndffz3gzg7gzVP6qMebtYjKuifx8wRlR/8DVLyL29T9Rs/HOQNZ1vA9
	5u1KpDdPhPRlscQrmldGuiP7B/hx+47JVPmMROTN5Ri2qhukvp4lXFUn6NV3LR5I
	TELA5xZM7k64EraMcic55wC3rz2jOsJYIrsVpBC2koSULXt4VfuxglIgByUutkVv
	5toROXUKv3xmFR2KIcbuTIHpu0JqhuXIOpN55YtO72NtkxK1/JF8eL81Gh/U8ops
	UE/z51A1yQp2Zh/XNszU3im0COl7ubg1bOmglO/BpuNfS9vnR8II5rcxWtiFL3zT
	gJVLiw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wh9uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:33:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1612706a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785144798; x=1785749598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wa1TtJMnngd8nPLKlEErbenLvZBNtCEdzV9cCxILRr0=;
        b=Y3QyneC5huQO5tAyYSRGPyCccHv7aarmAIoIj+vXv/kifnvhgonarSPq+PcAw7yHXu
         cPMQDtmk9JnJ0gDgb0C+4w38Ta764RgiO9U5TGTfBicKcaapPCItC6o8xvT9W93iseeQ
         XeH0CWmscST0jy/sRnYotoMVG3Y2zUVTATtZ+q3IBywSgeW0XV4NTC+/Y2pDi643lWWt
         r9Z6XNSfnItUMoeW7nFhV9lNjXZdsa5ci6rNs+o187sMTYeYO61XT714DG3aJwlEPp6M
         t1pRCggtDHO0MTf+5mVkrPS2/qmmY2ov0hUyim2WSlxAME2rkg2EwaQF4SvHqunOgrit
         C88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144798; x=1785749598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa1TtJMnngd8nPLKlEErbenLvZBNtCEdzV9cCxILRr0=;
        b=sc7V8oyvpxBAwN+5UosrrRNlmGZ8fyHXUFIKbKUHMUrT816Cw6CSTZwZtriMH06n87
         VlJfOfj0qe6FFriGTqsplf5H6z4hHUSUc3TnrUF9rpPDEux5ZCOkKxyRTAuG2ugL2omY
         MjjN3gJlcqmkcmwaHoxPwICVM924smyhM1LSohz1j5OS2syazExSqvNG/9IOpi8XYL9e
         NetHToOPDNnYl9ajSLiCd4O2A/LpM2TqH3e7/TNjWi+6TW/N+PlyjoE8hQ78mTz6dTzA
         NRE1p60dR3eX5sLqGvINY+KJZzJkS9gkA4GtDzwCRRBY5BIG945bfO4I78EVlsuMJLZd
         mSNQ==
X-Forwarded-Encrypted: i=1; AHgh+RolT+AZkxaXSirMEuUsm1DeddWFNMj5SFmpfe/pUJ/MzXvraYUUBqKWOlcZgI6qBSyJPliUWgNMylkxqMIW@vger.kernel.org
X-Gm-Message-State: AOJu0YyDlL+CvG0AMA1P55P4TQgDpw5humuFTp7JXaeytpx6Me+ujFzJ
	YBHLuLfan9/HFcHiRfrEMjIyIR/6ABvkSA0zgILQbhTh51as2dLdCzyGcsrAAMcJjoIiC3GxzlN
	ZnuIZKGXNYSxvNrUFdR2BWMz59S/Jva9FOm2HLPiGOMS1iFpw4Hu1pyHN1T9DbrQ826zg
X-Gm-Gg: AR+sD13Xl0xyFQuuWDIpBIUM+8D0IwkdPqwFQs0IPtOxlcuWq8Tgvo378G++PoJxeKQ
	waBosA5ggh0V8PFgpsh+fmXsbDvmlzh+pxJAwaAZr5iFMKXZO1VvVQFmVSkObS59xwqopbEYBWX
	RHVBK2dO4LlrNHArEPmYf3AQoKUnpid4xqL8HzHhNTB3nRHdRMpA8OVIW6NAthnvcfmVvveiV6o
	0RjcBRZFvVv7WaCTSa21doX9msJQRq8+xDIyCTWboTJ4EPAKtQ4PtgzD1wYPH7qFw6zhgPZIpvh
	zyUwyuZvE7YwuWRUtSdemL+x9MpPimTJR4aUINgyukOFfsdtzbRtPqGak83qlgfx/cqq/Xjydnx
	SfDnpKbIUyRz8QNidC8FBSo8XSlCuZuJTaw==
X-Received: by 2002:a05:6a21:682:b0:3c3:66c5:68d6 with SMTP id adf61e73a8af0-3c67d9b36a6mr7755239637.9.1785144797826;
        Mon, 27 Jul 2026 02:33:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:682:b0:3c3:66c5:68d6 with SMTP id adf61e73a8af0-3c67d9b36a6mr7755217637.9.1785144797445;
        Mon, 27 Jul 2026 02:33:17 -0700 (PDT)
Received: from [10.217.219.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66e0dd5sm2789586a12.31.2026.07.27.02.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 02:33:16 -0700 (PDT)
Message-ID: <f127746a-6b8a-4146-8872-6790431b563c@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 15:03:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] i2c: qcom-cci: Fix CCI clock rate enforcement
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
 <20260727-cci-clk-fix-v2-3-c3958f28b045@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260727-cci-clk-fix-v2-3-c3958f28b045@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5MyBTYWx0ZWRfXy/uxOU9nyHsY
 MZ/+bqj9vW+OmB7WPATIa3yEPPihb8wUOJD0hkHNvmtODjx5bWpP01sY1as8QLq05JQceswIU25
 WwP6hcZtGa5VgP+gNzY7kKoURTj8nvoJkdrQ2WjVfGOB11dga5ZanE1l1WAbj34jitUDyxOg2Kr
 sUR4BiRMkgBhePGm8S6cV7X5qwXuyGewoDJBBHncxZr30iakQI43z/uPBr8bt6kqtfHpkSkpdBu
 UPwwjDZ2BvviCQtnMWSckH/atzvq86h9bwR569eWN9zdQwYA6pKJyB34nEhtP1pdnv32GkkhNO/
 OWfEeZIuheBVGJbNud/uaxnk0PAZ1bMkwwLWrLvZB3dPm4I+YwRENVkNh1jj9h9z9piOZFLWck7
 RdxP7240BQbQaDNhmPRogv0WCJYFQ4E/6oPGlKrnsaD3aDkBoBv7LZ5xG24kxkkbQXtypszJxUt
 X6LYOKXUd6PnES0n9+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5MyBTYWx0ZWRfX/gwhCij0ejmk
 MDPRpMQK49gNa/n5I9W9LOQ37qLTX84sNuvvM2oFM7wpv2/RDEjG2gi2fO3HE52a4hJhUMw1K+r
 XQjOqIt2fX+uNnkutGPd22wYGH02Th0=
X-Proofpoint-ORIG-GUID: HP5qs7SHexmkJ9JCRKLZeSr5qJdpNKZW
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a6725de cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=GxJzyCk_ZRX2HhHMd4YA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: HP5qs7SHexmkJ9JCRKLZeSr5qJdpNKZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270093



On 7/27/2026 2:51 PM, Loic Poulain wrote:
[...]

> @@ -587,6 +618,24 @@ static int cci_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
>   	cci->nclocks = ret;
>   
> +	cci->cci_clk = devm_clk_get(dev, "cci");
> +	if (IS_ERR(cci->cci_clk))
> +		return dev_err_probe(dev, PTR_ERR(cci->cci_clk),
> +				     "failed to get CCI clock\n");
> +
> +	ret = devm_pm_opp_set_clkname(dev, "cci");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set CCI OPP clk\n");
> +
> +	/* OPP table is optional */
> +	ret = devm_pm_opp_of_add_table(dev);
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(dev, ret, "failed to add OPP table\n");
> +

if this is an optional why to return with an error ? IMO, further 
operations should continue which are not opp dependent ?

> +	ret = cci_set_core_rate(cci, cci->data->cci_clk_rate);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set CCI clock rate\n");
> +
>   	ret = cci_enable_clocks(cci);
>   	if (ret < 0)
>   		return ret;
> 

