Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866314DBD62
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813838; cv=none; b=bCQyFLw0ydxLzBZdkGE7FIE8p9PkfGFaQMQJHokKKT6RNUc9jeUKWoeo80rMsdqzo7/I/XBcFePgN14NNR6NuRivrZ1DfzhORr34Zn97Ms7eVqX5iS5NdkmzmiFqltUZ+muyNvHV/WNZjDyZqbeG3De95mq9h7tpdJUqri1XM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813838; c=relaxed/simple;
	bh=cX5RyP25LLZ1Jg13iKUkAoxbJ9vy0x/xpbeWmaWKPPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3w4AA2yEs8fGKGnkQEolLNXrdbFL2sbKvi8SSBDi8KK0dRPxTKIl8aeZB1fe3YxM2idKpWIEhKGMVPCNCcz2eQhga7baiFi+vRH3Mgv8KdCpAuV1O6XXyBByeqepNZDcf/aklpiRdhOpYa34nGz0UmbQw6WRWtljjNEdz82h8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRGYiamr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpGnHeBP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRGYiamr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NpGnHeBP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvkpS4050191
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHslaQdrIxXhoR6CTG+3KawG4L5eFPme/pRlS9V9GnI=; b=SRGYiamrXt0hgCk+
	WNnhRI8ZmDZgtZWVqW1gXz7GYyfDCE+Bwv0tbm94DH9CenByUSzUOayLRpZPEByi
	ObtqjIBg+Fu3WMkfH9hGp/12ej9FnHHk6rLTwHpn/Qbk2afuBbsKCsb46Ufqs9GV
	nNZgYZxcGHmZdOWD29oxeLnjVl2GV17+ivdpU1RqCKUdP6t1H9ZOZ2ZPl6QsvdOx
	3j8kW/6hckJUjTegwZ90PGymHVM207khRlCOcFcNgQ3CBR6ePJpeeNtscXxIjT8r
	bfPedFnEKprcj0f+eb/Z/HWS3P/7KK2RVvy+IPCsxDr4sHZoNWB6LjFWL7pFir/s
	MTqFIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28vmc5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:37:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eb5f54b6dso9399385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813829; x=1785418629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHslaQdrIxXhoR6CTG+3KawG4L5eFPme/pRlS9V9GnI=;
        b=NpGnHeBPPNW03WD4qql6N4qVk/tWQ+JJ3df3O53aSc5s2hYQK+3Hly5KcX/VAurBd5
         i1OnJHNV7NQXLshEJBcs+ZTKeZ0IhEBZxrLzhW3jTkyzT2mdy1f6dCutLkOK98ZcqP0t
         FanWWo1WSprCAyGc0srLdqw77Rsi9HBvymhHiK20YPJV2AG2VlWJRYOusq9/f+B5tQKZ
         gSkVZJJkFJ1VtJt94ut8SvLW762m9mO7wY2s3wTExsWtceM4hNVznAIkaNxCTrKBDKZo
         +oeJ9apHE8RnmnYsuRrInORFnhYNfARutenf340jcSTtqgTGvmLoY24mpAdI7+s2CY6t
         WJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813829; x=1785418629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHslaQdrIxXhoR6CTG+3KawG4L5eFPme/pRlS9V9GnI=;
        b=CGmMABXKikuS2PlcLz7LjkohhM0qjBfcLgKGTxzM6p8qwTmNnfOrYhqaMdvYtpTllI
         Yd9ieL0VFxq4Egz+TIrCGOqMoS0Dwgsj4kKDoMfStn+HOz++ufBgN6yAIG1v4spXYa8w
         x5cwfiO1oL5eYrw6B24Xh+Xjfu1tmSvhOOGFNyg2AYG4eU501v0O8sjJOtzWKYlRT6ft
         2SW66qPTBSqhUzXWBB5xWNhgZJdPdTmP+bS1I0vR0uFdUQu0p3Ai+mi2Tn6Qt8LjBa0+
         vHHU+s3vdczs5lo5pgUm+/lkfXfKUYR3PPzVPJOJPIed5wnmsXAACpOSZlE9nf8gWVqB
         RQjQ==
X-Gm-Message-State: AOJu0Yy2RBaDqNbNBtI0tYivQu4eJRqOME10BysNNp0RrC1bg8GouAgs
	u2Y2gvBApO7B2wjISMxX8RXYurwZzd85/ZJEkt7Rok+YFbB6a3ZHc6ZE0SEfA/1zN3irl+kaNIg
	/CmTMNREqPYZo02dkgQ2TzO0M24LC/vFG1yGjEqyBYYr3/lVTS658oG4mIoNWq5n0k14G
X-Gm-Gg: AR+sD12THTnCVhh333Yw9uDTdeSMHlgBV8WHcCjmknj+CMcL0sif53LIV2E9rPNSezh
	0qN+TL5yisDzPC/AlEVRwZgIb74XJbJBULsacKmVToyLkymLHWP1zUKIt3rbjQzAW0nOaTn/GgM
	6EOs6V3xQck6kT397ldtQc0nslQQd/PdGyHu2cAFxRCCfVVjZfT3b2wRmaIker1RN8a9bLpXlRx
	L+lQ704ap/CyCrsg+MRKnHlWez+CLk4A6GMUBPIMRRiFtDb4/qqRScN8HjHZXJg3jR1c1xaIoTL
	GOhSobuAjaIQSqljKgyXE+wXUTT+335aK7y9/L+D9Mh4d/g97TWGg65WfUaoX9F5eT8lYfCKXQC
	BkoBJlnKUOxIio9HxDCoxGS0r
X-Received: by 2002:ac8:5a4b:0:b0:51a:d45e:638d with SMTP id d75a77b69052e-5284750cb61mr5096701cf.8.1784813829655;
        Thu, 23 Jul 2026 06:37:09 -0700 (PDT)
X-Received: by 2002:ac8:5a4b:0:b0:51a:d45e:638d with SMTP id d75a77b69052e-5284750cb61mr5096461cf.8.1784813829187;
        Thu, 23 Jul 2026 06:37:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f19c4csm231706066b.63.2026.07.23.06.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:37:08 -0700 (PDT)
Message-ID: <fb8d3a44-0792-4420-aee6-e7559eb9ab70@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:37:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: qcom: bam_dma: SCM-assign descriptor FIFOs
 to a remote VMID
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com>
 <20260714-qcom-bam-dma-vmid-ext-v1-2-cef87c57b7dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-qcom-bam-dma-vmid-ext-v1-2-cef87c57b7dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzNCBTYWx0ZWRfXy9Sim1x5q62Z
 vs0gqYg0UDkEtpNx5x+EDtv9VKOPJIbwcnYoxH1GhXlQdmF4dY4ofKLNFx5HNJJGzhHCLekVHAD
 OOQvEJukPqDlwUIQ85cec9Dr0rG/S3U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzNCBTYWx0ZWRfX7peBgyTERYP1
 Ov3WvlzXFl3TM0w7lx7mrBe91JEgeX21INgaAuk7TV+PG9l8FOEE0AzlxxknGq8qtLg5Q1Tl5Tr
 A5Zbb9myotOAVBEGtrstMrzMKdR3gYy6F65LgPNlJVnEM8qCXs6MsYW3LSEY3yFq0UYQHknZd+C
 7DtIqqbR1GMFOvn9ro9k4/x4VJFUylFA/I6FAvjRdVK4tf0Te4ME9aCyqbI4YLiqwCBjr22ZObT
 pbhrduUdtx7g9/jo8surbAduX9NjfZZglX6DDT+hSEPGNWIM/t1PuBCy9veIQNKjzDTQGiOPGle
 uJyRv3ijUQE7wuBPHQNXtow/YerWKv0NZkA4NO1UTA6DuWp4SiE5Q+5mlpuAZH9O9KU+nG+/VrI
 EnTweBPoon7eUotsPjUJVh25luWwVuduwFAtxls4CWmkoj5JNLU0cc2y5IchRwhRdHu2CrPQ1TJ
 hEyuDly7S+NhPXk0SUg==
X-Proofpoint-ORIG-GUID: jnqg53C99A7xHLkUnMjS4ceo-wXY6q2Y
X-Proofpoint-GUID: jnqg53C99A7xHLkUnMjS4ceo-wXY6q2Y
X-Authority-Analysis: v=2.4 cv=D4V37PRj c=1 sm=1 tr=0 ts=6a621906 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=jWf9ImQ_av2cyXA2soUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230134

On 7/14/26 7:00 AM, Vishnu Santhosh wrote:
> On Qualcomm SoCs where the BAM is powered by a remote processor that
> enforces XPU access control (e.g. the mDSP on Shikra, VMID 43 / NAV),
> the BAM reads the descriptor FIFO as an AXI master under the remote
> execution environment. Without an SCM grant for the remote VMID, the
> first descriptor enqueue faults with an XPU violation.

[...]

> +	ret = of_property_read_u32_array(dev->of_node, "qcom,vmid",
> +					 bdev->vmids, n);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < n; i++) {
> +		if (bdev->vmids[i] == QCOM_SCM_VMID_HLOS) {
> +			dev_err(dev, "qcom,vmid must not include HLOS (%u)\n",
> +				QCOM_SCM_VMID_HLOS);
> +			return -EINVAL;
> +		}
> +	}

Please switch to device_property_ instead

[...]

> +static int bam_assign_fifo(struct bam_device *bdev, struct bam_chan *bchan)
> +{
> +	struct qcom_scm_vmperm *dst __free(kfree) = NULL;
> +	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);
> +	int i, ret;
> +
> +	if (!bdev->num_vmids)
> +		return 0;
> +
> +	dst = kcalloc(bdev->num_vmids + 1, sizeof(*dst), GFP_KERNEL);
> +	if (!dst)
> +		return -ENOMEM;

Please reshuffle this to follow

7c4c14ad3d8c ("tee: qcomtee: mem: Fix confusing cleanup.h syntax")

Konrad
