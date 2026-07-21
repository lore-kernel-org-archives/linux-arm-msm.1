Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00784400E17
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658031; cv=none; b=RA9ibDZeW/uDvOBT4reP6MMuLmpSevklPbdOpg/fLWnNWfdMwbpyUDAjaA8mvngnqQLKpxFELotNDaJYqcbuhZ5fTXXpKM+Ql1aB6FD13qGLbhdP7AIuddIFG4f+n0iMynAIlqV/MqyOYcJkNR+vqBlgy9sVWXT8wrO5lZC2/D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658031; c=relaxed/simple;
	bh=9I8SuSEzPUmQkXgAoO8qB39k16yQ61FTlzIkj3Jiy8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZnE8/wOz9dQWeZRvPJFXaEB7oVCgmb1F5f5XdIhzH/Rp7d+I4WIgJwX0S/0AXqLDFJ1nUL5h4hNMh3zM7i4bYwP+4bbOIn0FR60Cup1eUl4Fo9RCbvAap0Sf0tNOBW960ZUfQkMlr0HijybmcsK5f9/daGxjfniu47sQISVsxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJj05R2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IeRmYYGt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJj05R2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IeRmYYGt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2gWe2449164
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fc5hVouaXSdYpjHELQxCbl6GfmZ4wxwxC4HC57BPPkk=; b=FJj05R2svGpfrQnX
	c4tc7mBvFM9B4aQNDUteAR7It2s6TbFcwp6eeV+GQ+dxnRwu7id/oQFmugx1iFfs
	M96r+iZL1B8zDG38y5RvigS6wes1uF5nrMDq9xvpt9tClke6yOW2xFyw2WQEGowt
	2VBHXx74dRPKyUeIHBYPKWuhnxXVmob39F36XTu+qx8nS925V1A97i0O2jkILy9u
	Gikiv0FdE4LRx3Oj/+qL3AdcN4Zz+q7VdyxB+vXn/A0auBxFvkqYS3CIg15tk47q
	z4c23L3sCtCMvuDTX/KJOah7FDg4OHwR7jPQDJbTdhxPtoNYVPJYr0SgYzF5UXqQ
	OExG+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6862g3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:20:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2caf4173b1cso167477165ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658028; x=1785262828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fc5hVouaXSdYpjHELQxCbl6GfmZ4wxwxC4HC57BPPkk=;
        b=IeRmYYGtxW6HjkSbKsjC/0OHYZnVjN7zFd3Ntp3NWP3MN84/Vt1JAHf20foS+eXpPZ
         QuEg0mznMb6YbOzdXI5YyU7amROZA62U2VsHsk1cjo2dWxB2YjkeV89HVIKmmT4CUQ+f
         Ov9/hG1ndQ0PUXN9V9YPIS8SuAPf7lDq3JcRZFOMrRVVfFagqCQgbEltkDLJQ+Zwq0AA
         ztc2TvTrYQOGY6QHJBaZcKk/3XNKujoQGRpxfHpxxmKc6Zd+5da0t+cGUNApRPK9b+Qq
         SQqE19+G8WjB/eAtl3qU+IUQoY7WPBmuJCjZ6K7lCCrDlugfTIQKkNXXduOZtEdf06Ks
         ORwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658028; x=1785262828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fc5hVouaXSdYpjHELQxCbl6GfmZ4wxwxC4HC57BPPkk=;
        b=ERGW1IpU0CwwjJ7p5xDvSqsKjPEwLUYrEhZTBhnw+Vzqz5UOc8f4LviSPunlq7zZ78
         cECiiLivqMG2h0dK6rJExyVAPnB0UBgaqPQ+H7uYPrDpmNpSWUbyYElUxRnwZHkQ+JDt
         I+H63CI8TtnT3mjTBDj/pq2snAGIPzXhRA+c2tlo8bG6ckK10K08384PjSvjwxgpBbmy
         azwLMvmc8mgA8JVMJkwotvcryLUrlAgG3hZZ8537+/XROJ/ipptUwTXyfwkOBOnRJUQ/
         WYk7bMZZgJRxdHMY1uojVyqaUMJfudsn1WNu5hb1gutxGOwJLazEILEvjhnxOSndKXKN
         2BQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCmU9hMCThlfEBY8IvlrC6EMWpa6hVf+nKjSO9CeJBDQHQETK5XLOuvs9cgSVE2UphEH1HBOaPkMPiVEJz@vger.kernel.org
X-Gm-Message-State: AOJu0YwUFj2SFE9M0VtFZ9NzBFic01gtIvyAXgY9Ab5t37d9rRWchhxW
	jzf+vpiFdagPqKcGU5BKH2mKUMK5RfJL+xCmV/G9sV1DWsPZ0MZgD1qpVc0aSANoT64VeVNukCL
	WA9O7J1hTURxSn7thfRfaP6qocHb89I8QQ8CLnoWILiv15u9a9fcQgCIeIUT4eZNbop5/
X-Gm-Gg: AR+sD12E7iJStN+A5Cnv5dMTZnBKnwTZYadJ93QAypP7UsT5ZinHvR6HGksKflGsYf0
	g/RrqZnpp1yW/JUUvhqPT8ajDmyDvQ+YOpvv4QLub8/t4XPMlyeckcKUK6syPEv53Ug5ld42pet
	z+RadSMcv0LOQXLhxHAx2O3lwk8KYukfb6RbP1sJgj62bBtuWe/EBTPi6hfvH7w2DBr4NFctRYA
	gV0INecMJfCBmzys489UaKTcPxB0vMfXixXbJQJNSvOgXyqFSLwSNNvrb6IUPFPyeTdqbZTDKzt
	L0A2tNREUDMBRklV13vrwySx/GEyCERewkXCxUsiSoOB4DBFvHNimG8NOLFSdHwgJNM28OL3Q7D
	XfDLeGSP9ldD5VGZiIi7yXcSkznpluCPW8Bo=
X-Received: by 2002:a05:6a21:7008:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c3ad9a4de9mr22508054637.64.1784658027485;
        Tue, 21 Jul 2026 11:20:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:7008:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c3ad9a4de9mr22508005637.64.1784658026958;
        Tue, 21 Jul 2026 11:20:26 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm2341770eec.21.2026.07.21.11.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 11:20:26 -0700 (PDT)
Message-ID: <773715fd-823f-4564-ba42-c60bc8284b45@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:50:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfX19QjNFsj3fV6
 jVa1D2IW51+yiqRvPInCJkzxBFRM63c+/8XUDWfDk6Trnldb/c/EwUxARp0ifzAbqu2bGjs63Dg
 aMV4q+09I0JuxVKSZbQeG8p6mZ5fJ2I=
X-Proofpoint-ORIG-GUID: qpiQqgDga_BgqZ806WHTvgD616b_sjVn
X-Proofpoint-GUID: qpiQqgDga_BgqZ806WHTvgD616b_sjVn
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5fb86c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nYgDJefOb7ZtON2RxEtQrg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=DV7x2YVLp9Y0dp68W6cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfXy2UZh0GywkhA
 U6qu6yJcOAQ12JE0x5xD20HOLKz/hhzxnuNm1Qdpm3aJbPOeljJ31ZCA237c4py0SOpYxgnguVm
 VGIw7XPzFYOmQcAJf3tB30IfLcXCTt9xKjjcEIv5uQohrL6nxjH0DdGvYLRHOXBWCy3J5QQKH86
 ZfPm+FDeGlnkV+5Z7yFm5VVYBP3y96dE7uMi/DnEUxgMYEfmJcDtWp4uU6bCMh1//WqyLu4qtls
 IIWDVL+HyfCvGBVTE5YxEZoO56Qyogl9flDxxRiMjuPJHcf9t/1jFMPrFEzfypTh6HulG+I2nCA
 7jjA+5HVEaDnhUnGmYM/uSsy/kEOwGB5irEjWlggexGC7zL42ELERCsyT5H+gVhSkXSMpA5MRb/
 OvzMvpllNAvZvMbmdJ+RH78BQtsrEWXNeFew907PknuojKfpNF35OV5ThEs165bRocVT86ZAtfs
 tBsUTTw1LjKuTyTmGug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210192



On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[...]

>   static int qce_crypto_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct qce_device *qce;
> +	struct resource *res;
>   	int ret;
>   
>   	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
> @@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	qce->dev = dev;
>   	platform_set_drvdata(pdev, qce);
>   
> -	qce->base = devm_platform_ioremap_resource(pdev, 0);
> +	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(qce->base))
Would you like to add any debug/error log ?
>   		return PTR_ERR(qce->base);
>   
> @@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	qce->async_req_enqueue = qce_async_request_enqueue;
>   	qce->async_req_done = qce_async_request_done;
>   
> +	qce->dma_size = resource_size(res);
> +	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
> +					 DMA_BIDIRECTIONAL, 0);
> +	qce->base_phys = res->start;
> +	ret = dma_mapping_error(dev, qce->base_dma);
> +	if (ret)
Would you like to add any debug/error log ?
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
> +	if (ret)
same here
> +		return ret;
> +
>   	return devm_qce_register_algs(qce);
>   }
>   

[...]

