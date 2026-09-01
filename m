Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F11E47D466
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 10:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259822; cv=none; b=btLG23h4oCDYIC+/Fo5cSknhxv0a4powXcp0JYR0OYLhNASUoPfnbQvsGrTLdYvLdxgOmxyFEDfdMJvFAGEPjGxa5CLe9YhXe633IcMt3V8dETnaHCo98OhHPCiIawBFkyUP5tiyEoJolDQzGeD/yOQXVj4ISvEVSaEyXpF1axU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259822; c=relaxed/simple;
	bh=c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1yNaYD2syOuHW3stLh4nZt+ZdwMqPTWCnSMtvE/wHRtzPr54/lJrJYu/dL1mI0rxVrIi1jvgD8S9nUnYkLsobxkcIVFwJGyQL4023bBMHdpiB3zpds0cpmpq8DyZ1T+Xnlc1fja+5B5lWXuBBxBYtwHDLvz34TKdviGeAVMiBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzuP6YxJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlMxcLxP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzuP6YxJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlMxcLxP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJJQI1136748
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 10:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=; b=NzuP6YxJu9HCQXoE
	wCUBCXCQtR0RWVjIYR1In0MR2weC0zUZHs1l1O3JdvPiKuOPLQDCid/G9bmYrltb
	F5YRE0BoCceJ5rIcS8NHIbEk/zxtUWpsxd5d436gSKLCVTuv7pzCIX6Oijn7pM0k
	WciQW0CAjTDCflUEGWFl+nECwyYd6OdC0ZuM3xLRcuhgKgxyG0TSzyAOPAJcRnOx
	mRPxoBN1+t167BsloMlQ9qAAFo0Kbryqe2ftOEhlwBA392S9RKgqvBwWAz7XjOuy
	Mo4b84PErRs6PGkcmS5T4pgb6tChqUOp7GG5PT+HQVHTjtudtLs8Y4C4/bZ5doT1
	HEM7JQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcshf2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 10:50:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so2184891a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788259820; x=1788864620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=;
        b=DlMxcLxP+GpvOCSpqhFNzqMA+kTR4i7qRM1IPKWiGNfjab5af1SWKaBvLhbNTPgFmh
         To8KfgLrNIrHmrNCXptn918pzCDf64fedmL89AeS/durebHJZ4W2gtV+ECPq4ZxPr71F
         CNgO+JUZmVCjd5Vz0+tge2gjaqRa/FK8honVAHl/zRjpVZtl49jrKfTY3XYqGqemMdiQ
         gojXTmKK6iYNzlmRkSycraZzPdXo2PtvdMjvaoNdYNenma5bXBTOLc6cSnChCMtWIt6m
         YzLx9dGZ5zlkwoXBJhGRpdbWNtMoWLlvd/2xapMJjBbBMdfhEL+wQeKiiUAKR/A4OQTI
         pxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788259820; x=1788864620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/3LzFOXnOp4uaMM07Dh0Np9ElxE0mAnasoTJXwGAd8=;
        b=JROeC/yN+tb+gC7FzXDAWla9fKi8RpiLXIggbLsHorpKNJDE0bU+mdm3pLhq7DQHR+
         ZG+mrxgzP4VIFiL3ZHWSKqs9bgVeubs9HYAPlgSzbty17vUUQ82HWbbvEncqhE3bxb2F
         Oh/odMDNIscZvaEscuDHKFIQZfdlRdQVA63zWg+0dkUBFkWfX+3GGZJ+y4KcvjFBM5Za
         7uI6ucpA1k/ZkWKSmCicpBnnE6f0/GDm985WdRUXwAQxtmbtjCIzFYiBj8WvEioi+4zR
         XG/AihNI5aFkIU+Qh2XIwa3w4MgDQJU8Bd5wF5AeAYvVOdEfVay6Xz7jxouNfpn/Yz46
         SVzA==
X-Forwarded-Encrypted: i=1; AKwUvBwJjbA9ch8WQcahObR8HAmHh7N9Ppe0z+9RkIgPf9//6nP9pNjtxLbhlKL8knFSyc1FdnP5kxMHxNbVaxcr@vger.kernel.org
X-Gm-Message-State: AFuF++lt6vzk6ITVGICvfl+GzNxTCb/YUUtgzc9+PeG9CWpR/7rO8YSu
	tNT8FBqtGx9CLLm/KOXtd6Eih/7yc0SBbL6+rzZdkyle+FEj97+fCfYlH77au65of2Li7xLMPox
	hfGKJy8+Zb7eKpSxCoatOcORhw7FADUauo6ga4p0GYEGQ97WzrX7bn3GmaD2CnK5+1hXM
X-Gm-Gg: AYBFou2NppaZRqzofvgn7xqKrSe5NuaE8BikmBfLK6ObXIcYe0wCUO94Dq1EqabiDj0
	LONb/l/UUDBwqlyONkcGQeWv+5lBLA2h+z2O0uaMiyEMGPLmRv1nzcUvpi36EDdZWDAQZwsAHA1
	mPfgKlH9n+IdRmskSX/40iS9BnJXKpeYqGK1Jo9DOGu19442rc4VZTqBIu4sJBaRze6WiAFmWs3
	gKxV31ovB+zpY/fPBozUGwwm7CWe1uYLvhn9fVMHzg9b2Lqs7HBZHFUldCWwgGfYpAQVOqKXGDq
	lSf8s+5JgshLgcqcA9ulxSN06DgersPG3UU0sT0fIFW6Aw5gJ4fWPXBTBMSzdgHr05own2wCJIC
	udTp6/esUIHbwUQ6CrkSnpcTBO98Yxq0ybQ==
X-Received: by 2002:a17:90a:114f:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-3989be5b50emr23508923a91.25.1788259820090;
        Tue, 01 Sep 2026 03:50:20 -0700 (PDT)
X-Received: by 2002:a17:90a:114f:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-3989be5b50emr23508860a91.25.1788259819580;
        Tue, 01 Sep 2026 03:50:19 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4d92sm32534466c88.13.2026.09.01.03.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:50:19 -0700 (PDT)
Message-ID: <36b9f3b5-8c20-48f0-96d0-92cd13761ab4@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:20:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: wcd-mbhc-v2: Fix incorrect properties names and
 typos
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260823-wcd-dt-typo-fix-v1-1-a71b458e0d31@ixit.cz>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260823-wcd-dt-typo-fix-v1-1-a71b458e0d31@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5NSBTYWx0ZWRfX40VLimF9RFxE
 ZM/iotgD7chKZ8Xnn0ROjqALS0SybrQhe50GmjugvVIv7wGdGkwCYAZf0DagECTG1HwlHjedUwD
 q1kjxsuGYnHsK2Dgt3iEfLD+S7Mwt9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5NSBTYWx0ZWRfX0HttxPJ+vPJ3
 Y5cVQ5YPCXFffIgW3q7TfXwX8+5Q5wJymz6v003l5/Qp3r/Upu0UTK2atraMk333QQRWalDt7+7
 WMLlpuBis9p7QhjpQrNDM/Gc+ULNwkMGTe/S3aAEgDpXR9LRVeCTR78Ud8JEnK6khhUTk3EH2kS
 3eGrzah+Q995OLozU0DW0alqjiMcVugvL9xby7en2nDxhn+dgtQn4DJ46NLtZanXYIt1IJrlMQa
 8x5CfpvcRAYDlorIsGQp8B3DGLuO8GC9RhqfQrAu1iPyIcO2DwSQIkJbYJhnrx1Kr5IHyynTtFq
 2zeDXSxsfROrBqPuawnZfHIgzJnsBX7KSjw3CvL6TOcVBcIsnBA9TZqATFKFlbyL6jYZBX+dDh6
 tpaoODK47iS1SAH6FewNW3rLKlIyl8A/9j7CZFw789PZw556OyLn9I+fl4LIi9s/w1O/eozSm+1
 i8Ryli0TbFsil8lBHKA==
X-Proofpoint-GUID: W5_Im9vNipkfSqwTmVL2lM3Rd2T3i0RO
X-Proofpoint-ORIG-GUID: W5_Im9vNipkfSqwTmVL2lM3Rd2T3i0RO
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96adec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JTjWdI1eHk-BqoT7USUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010095


On 8/23/2026 2:39 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>
> Improves debugging experience.
>
> Fixes: 0e5c9e7ff899 ("ASoC: codecs: wcd: add multi button Headset detection support")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

