Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611923E2740
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798459; cv=none; b=KxyhdAQyTM+lHnQjW/T6Zkq0i6fT70qm+dbZDO6Z8OmDvd/0mb0xxpOmEYT2ed0aMuylnsVMoRYKWGBLU2bMTXzYDKOyQf0Ajg3r71o7j03H6w12u1457QWkAcYr8YK1G82eQ6DrQC4lLpVfcPyGoU097fMc7z7TN2rm7tSBv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798459; c=relaxed/simple;
	bh=Ua5UAJT40e/0GEzjCwqx4EwOBnaqa4Dvcx7XveV6T1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sn3cbqYxRTxB9UXaQtopDPXpeJO9N2ZVFPv8ug95HxL1ws+QTAcZrx1e3kBRX0zo7r7zxs2rvthDQkPLKGtP9iX5FGNHqpNAiCaycGOecNEbOzPWgyqBKHe21bj1K9UDL/opJ/ISQWvZ3tOLKCpbULlvP8O2FSGMshvBUbT98l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDocfRy2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBNnoh1O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDocfRy2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBNnoh1O"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qTVn3260940
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lz7QXf+iBwT8QlIH9Oun8AGxaHA1wq8IUAehzHZTWo0=; b=RDocfRy2yCHEjccW
	RZsU+gVIqtmV1JA9knlL2qUoDyjx1MFmf4ZpdDgtcCPjCkD41+MaINpGGNqlssH2
	+RmCqQkCtNsfKC32m93P87q3wDV+LDgGF+Z0o4QaWHMltGFdL21fLRpZDlzauFXC
	ITws8oIBPGRDOjpHlJXTDMGYhCkRRLnR7REkcGMvmQ5r3mayMxGo9gP2+fL8cgmV
	Z1dSeukTeYYt02iGWv623uus3oOA3IZwhBqSbmORWl0Fu2ucPZ/owlrRo6jRBkjz
	Kv/Qggw2S/sze037UCDDCVLHPys0Bk3UshoaJP5hWMv2/77YZzunLT9ZY95mpTCD
	vFMC6g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw1du1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:20:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so4435135ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784798453; x=1785403253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lz7QXf+iBwT8QlIH9Oun8AGxaHA1wq8IUAehzHZTWo0=;
        b=KBNnoh1OepJ51gFeGzV51v3Pm/20EQBNNXnaRe2943hktt0R3cCRamdx+NyAWOtQTl
         tWAYg8esJmpjT3A6DPmaIANM6lUKfp8ebgF4clA/PqI7L/H9f+duBDYyuDtn+N4L20MN
         BPseUD1D+KLZ8BiOecbyBq5lu/nvfo5VNjKbKeuQPFV0n5/HpSw0jGjB6uB0K5Dh1oGd
         tyd1mM+1Rj3WkzKDmihsSt8qW0HKhSOf1xfTsouX7Px7gny4dXVx3/bRq0WpjxNJpY8+
         0TVZ908NhxMqfve/xqY+yAcdmx21jOuZet+B7YmLg4t9p9Mt5LQbP/ANtjf20aKiZJuo
         3Ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798453; x=1785403253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lz7QXf+iBwT8QlIH9Oun8AGxaHA1wq8IUAehzHZTWo0=;
        b=cuFz1c6RCPDNXbmEGIPssCuGa+6qKfvz9dC14L+XLcxNmRzV/HyMie8mgBCyt3YnQ6
         D2EpnALDet+hBzucsNKoRvEaYEl1QrB3MlTLrSuSaK8/fYB8H4mLnlNos97kFZ2NyY6B
         OsQnqq9Kxqj0M1dh/Usry12/BB27cL1RzWHJWxtps41ifes6VwbkxgDD4/gjHOfg0PeT
         aqFpjm3fUvCXq6j0bA50LP0ejbTJGtYU+UAsY1LL1yJNG5P4Yuk07dmHdgJ8GPl/0hIh
         SXCmlA41xD7ZRobCJXM4B0JOq6M7RarTPLwtZE/ikPSeL1vz00xNoVDGJ0MCJlCiJSw3
         rmog==
X-Forwarded-Encrypted: i=1; AHgh+RoxjvgGc8zJrbJhH+kBBR7DaMGffslgCevPbkzGbf/LyREyQzYLFFv40aGoJFq7PkkEi42/1FWT7ulQ0vG1@vger.kernel.org
X-Gm-Message-State: AOJu0YzhDw5JYmJiHxLp19UCYhaSkT20RqG2TXUBAK4wbwt/P9IraMfL
	7pqGDQza1QeVRtI1xFUbVooLNgdhtA0MGHIppT7Osqd8ZizE7Y/ZS+Y1i3AamRbX0QNbsJt57xF
	R6vpTnCMbNNKKrv3HYk//lE8q1usYJMQaUHt9B3LWrhJqIWC8RI0bVMJh4bqVa3BCcnhj
X-Gm-Gg: AR+sD13l117XRC3iOebpe0vuJJ7iYgVqnBwlSpxUJrlQoua96wUlNqsizfQ5qPknmYp
	3wVtxVrtqg4YAyDIaBhboK3ojn/lyxVV7UmN1alFsqz5ijJDxFj35ljyobRJSU8270VcMhv7ls4
	dMLsYrDqR5/9c9E7MoPmNHjSd8N1ipAkZwWrbz4rNwsvLBXTZ/CcIgqBdbJxx22Ml7rIlLVzVcR
	AcJN4ydqy1aLKo7mEWWY18X6+crLIH2oujKznpdvLZSmBjnKUOi0ZYC3VLo+9vWGFspu8bPLmFX
	ZCgDolxb+x9nd96HggiqecOcyM+9NFC9tbrzW0trlKlh14Hds1J9yVHHdeOTelI1SMXTa0PNhDU
	+GtONlaksdk3uD5/OGDga2++hLQkeTMG2IKg=
X-Received: by 2002:a17:903:1c1:b0:2cf:18e5:1d18 with SMTP id d9443c01a7336-2cfa958568amr21289835ad.29.1784798453096;
        Thu, 23 Jul 2026 02:20:53 -0700 (PDT)
X-Received: by 2002:a17:903:1c1:b0:2cf:18e5:1d18 with SMTP id d9443c01a7336-2cfa958568amr21289495ad.29.1784798452670;
        Thu, 23 Jul 2026 02:20:52 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f011570sm29930365ad.35.2026.07.23.02.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:20:52 -0700 (PDT)
Message-ID: <eb99f98a-db4b-40a6-9c5b-9f9eb6986d28@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:50:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
 <773715fd-823f-4564-ba42-c60bc8284b45@oss.qualcomm.com>
 <CAMRc=MdLMQgJsxAMXLBkZNWUiz9fYh0j=C5ErbFoDLV=VfPUzg@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdLMQgJsxAMXLBkZNWUiz9fYh0j=C5ErbFoDLV=VfPUzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61dcf5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JVr4EG2OP6aRYF85f9oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BQQ2f8t0QAAylb2vzldfk2YXbic2gL0M
X-Proofpoint-GUID: BQQ2f8t0QAAylb2vzldfk2YXbic2gL0M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MiBTYWx0ZWRfX6KDchvRILm+i
 S0bEJeeW1ZhAMd2wjewv+PCWfHXUyjz6Du1Jano/I29oobqcS7y2eAecLwXpVYX1EWN/WNJ5IzQ
 g0qc09+PflJan9a84h1MuXKAxoiMuXM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MiBTYWx0ZWRfX+z2AI+Fzxz7Y
 2tDP3h+Dy7dZ3lkXFfQCXEi95eVMKzcS8kRpPVmqElKru2/FlmoIO4UyaPQOhLKWo3jQ32BZ0BV
 fAyQTgyXCNKC2rskJoPz+4OaZXvOVPuDfUYeZmdbKEKY9Dmw6jtmOWhU0Ni7Z3cmjdv40f6YpGy
 exU4P4AdJFsQRsJhhMNeR6uQg//mWwZkMg2McnVbbxnFroTQG7ENHsD86vH825Wx/9CRsO21wJ6
 bWQ9xhOxVtIUaLBBQta6cBX79XnBxaDWSSFunhlUk/cxEgNLaMeOc4V7gsk2gb1FP471Luiooij
 ToQZD87OyP7YUPcA5k+L6nP/C118qG7Va987iShEnGb9fLNGFa2fwYnr6/kjXsRKQm5evfYVcq0
 KzZsyHGQxe63Kokn/SgWJ1KThwNITdHumcPAfOl9gxiHltKo0wgNFVJMkgOO4mzj7ynRZlm/+tY
 05+pAM8jbnN/J5gL/Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230092



On 7/22/2026 2:47 PM, Bartosz Golaszewski wrote:
> On Tue, 21 Jul 2026 20:20:05 +0200, Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> said:
>>
>>
>> On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> [...]
>>
>>>    static int qce_crypto_probe(struct platform_device *pdev)
>>>    {
>>>    	struct device *dev = &pdev->dev;
>>>    	struct qce_device *qce;
>>> +	struct resource *res;
>>>    	int ret;
>>>
>>>    	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
>>> @@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>>>    	qce->dev = dev;
>>>    	platform_set_drvdata(pdev, qce);
>>>
>>> -	qce->base = devm_platform_ioremap_resource(pdev, 0);
>>> +	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>>    	if (IS_ERR(qce->base))
>> Would you like to add any debug/error log ?
>>>    		return PTR_ERR(qce->base);
>>>
>>> @@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
>>>    	qce->async_req_enqueue = qce_async_request_enqueue;
>>>    	qce->async_req_done = qce_async_request_done;
>>>
>>> +	qce->dma_size = resource_size(res);
>>> +	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
>>> +					 DMA_BIDIRECTIONAL, 0);
>>> +	qce->base_phys = res->start;
>>> +	ret = dma_mapping_error(dev, qce->base_dma);
>>> +	if (ret)
>> Would you like to add any debug/error log ?
> 
> No, I don't think this is needed and at v23 this really is useless bikeshedding
> and doesn't add anything to the discussion and only delays getting
> this upstream.
> 
Okay, got it. Thanks !

> Bartosz
> 
>>> +		return ret;
>>> +
>>> +	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
>>> +	if (ret)
>> same here
>>> +		return ret;
>>> +
>>>    	return devm_qce_register_algs(qce);
>>>    }
>>>
>>
>> [...]
>>
>>

