Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F9A392814
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194600; cv=none; b=i69fsrtCV9frjbUf87otM/iAmAPBnfQKskN7CoMcRa9Sn9mMfdNCwQ6mATbV+OL1nCzqvw/FpAIK8dRFMGWWakQuQQjjRvKm4BTPm23J6HUzCWhhAQWb382GAGN4coiMr/bXDkpXNxy0xdiC9tApw/iFbnsbCijGLr4ROH7XT9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194600; c=relaxed/simple;
	bh=m+4b3aLkvYKYXjk/5jBk13X1toi/h2jJT0j9yCVHa34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kn/4H72EWpRRG+zHlp84eIPdF6Xhg0u7VKXOYR4yn4lALWfQ5sxkJW39PSdlxgR/NyKV0nHaGiZhhQU7i53psxZc6qV/1DJcKAglKCZ3mTNkav0O/l99Dlu7J+2Twod68dev+6Yb0B+RUd5pokAbVP8/fUOZz/7q67Vo1HBfjZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImarmEFv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+g+lcFu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImarmEFv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+g+lcFu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DN8r2193289
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQneF3Snhi2o+9zW2iPm4mlK7O1KLd3pE5NOe2Pedfg=; b=ImarmEFvRplhQtnn
	96EQn0rHWlVLm/2BIio7tnfNugFZSYwdkNTl0hgpbjgS1HGNliGGk7VXOU/Dc7UK
	C1IGWEIs23ZXlEG9sK40DMsu1sC5Kp1bjcyNggvOiGYmR6CoBCc9oGpJXQKJbZUK
	yakevVvt5ztCkKKZJcEg0jCJsUCzpYnXQpjdXbpNautrp0V4xjK3teVliJkPSH7o
	WywlIOVcVrvV5qaMWtRh/Tmsm/73wHnsDxv7EWbWJQ5VfNs/4bK5ktEVWUFaJrO/
	66CkOD7sDDY1JSlyiRCIS0G0hHRwjlKlhTbe05UmaB+p1RkMvkZQac4V6NZv3MBk
	GjGEvg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf0m46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:36:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-903694fd3bfso14740046d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784194598; x=1784799398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQneF3Snhi2o+9zW2iPm4mlK7O1KLd3pE5NOe2Pedfg=;
        b=Y+g+lcFuCuW8WY/8qVtVpBZ0s1Ed53WUxsFjh+D1inETbgXkS/9p2WKZmMkvLlGvsT
         tX9p797VnRoAFbcnjIA9NCekDYz+RBta5ZOLSJa3aKyoBEKjcd4b8XDBxzVpw+Tk7xTs
         +t4rZZA3t/aKDOUEawUAl7+xIRIVv1Nq7X0DWlY2Jq4/yAKbwCp9dABV2VUFSagG6VdC
         OkrazWvLmYIcQ27AetY7LA8tIo+CDiXkydPY5OkyIN5iGrCAmDgqcOK6m8Bq1thGhNGU
         j5bGCkk1xveslA0zfh+3j14D2l3Mu96HQml2Hh9p+ONpN1y0g2SscVKO3ul4UDFs4NZ/
         o1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194598; x=1784799398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQneF3Snhi2o+9zW2iPm4mlK7O1KLd3pE5NOe2Pedfg=;
        b=aZlkKN7dtfWXLYoTKe0Fj1kCFCD0KKl+lQ8kM/zVYBC5xNYH2tNDiIVKr0FTjOU4Hj
         P3pdXImJZQ1sIz25YvaKBukbYIMT6HbUw5H7tYslaz+9Zhp1Fg11LmTVBfeRELdOkT34
         QR7sEaJg5hyATAmM11fkqY92F/6LJjoTfzSMBGj6RFtLGV7+MlsV2+wxtb3fD2s/qylv
         paIsqCzeLhqbLqeNQGT2ENyTlOhbc63TXaY7djfRHYf5GWd8xYi1Jko8F7JVPLehYjoS
         LDudhVJ2xH8lR1ahgZN2dGNt6vgnOs+K52EitG0yeGaLXiXOiTSgghn9yfTFIdGI/5ma
         AjPQ==
X-Gm-Message-State: AOJu0Yx/pamztWrMnIndb3qXVEZnNrxEtfaWbUUWLUSNoYrhQQwIaL7Q
	vcBMjdm3KKdedgqwqxMnGHZ0u5GPNGFAm1q20NycRhSKcy1tjzkQ7vllv+vI0pAJbbOkyHQcroT
	KHiTK4OdL2f0qcUx1TFgpVjjnLZcHLUL59Wft50VKHjeodwn9rTwgsPzAdynAU25wmYqX
X-Gm-Gg: AfdE7cmqHFWLfuZIw5owarXF1jW7PBzwYXN4VsSJ3lan/bYQjuwVRkydBKCnTTx4hE8
	CkuUW00DzrPevpu+AK4b7WkQKnWaG1iQn8YBACi52jOewA6O+dQ3R/tkz/H5KHM/lBWB6irHqYE
	xUsjRl9XRbtdwbnjsHKN/IRlrbuWkbDefWQuplWkwnKY/3tH2z2b3dvZ1xQcIYup5a4wXcKaAPd
	wM+E3VALYOq2eoOfnyebM3PaSDPhb7ko1ZaBaJqIHm6G9KH3FyP7Ku53CL1ReEFPc5pNTL/wLav
	/8dVCjJAdypNpfBDW25nU+jRSG1DYfn7qv4ZrkPa1XgZ3C1Cq4Hj9ks6dgag0XzUCeoE+H7EeeV
	t4nWPxqnhNGLkcRPGADeit03J
X-Received: by 2002:a05:622a:389:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-51cbed7dccbmr25593701cf.0.1784194598020;
        Thu, 16 Jul 2026 02:36:38 -0700 (PDT)
X-Received: by 2002:a05:622a:389:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-51cbed7dccbmr25593571cf.0.1784194597674;
        Thu, 16 Jul 2026 02:36:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687126353sm178908166b.13.2026.07.16.02.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 02:36:36 -0700 (PDT)
Message-ID: <c6cf4da0-15f6-4f43-8f06-0e47d8058ff4@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: geni-qcom: Fix sticky ret causing wrong return value
 on invalid proto
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
References: <20260716-fix_return_error_code-v1-1-3295003aacd5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-fix_return_error_code-v1-1-3295003aacd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g_zJpf2-tW9zpv4TF1aNkOepXj88SBPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5OCBTYWx0ZWRfX82ffKqQxHmF2
 KBQaCp5l4/SoH7MXKtk0HwE4fGMDL9rKncVZg8qhYs7UcIYJ7Bm+1sp2F44/YbowRgryTZgKnEP
 VDi2IWgCOulYU1h99GeUfrIIJVTun9WilVUJP2LhntgBqUb9BBnEUYDpK+2gebOHTThQSubVxtQ
 tixomyrc2OuosO55t4cXJ7MpHK/vw2lpp1G66cKEQr3IV8IRmqS4D4//UYNAxnYsObPLp1yObsW
 QDszzTtauA5JLcmelPXW+Cv0VoYXw2dVZZvt1G/QC2Yqi2b43zkt85l2BQA4TMVuGRWjTX+HHMz
 6AGYhOjr8EQrzJZUeSElJFAR/nN+TvALFDcT1aYqZh3Jl62ifwGuQF/YF6e5vQzx/ZevRMbP1kh
 inPkLO6fOM15/ZfJKYf4Bx0wN0YeRlDFvT9dUn2y+lHNDc8eKUYSIZya1j6l62qN/JvmlaygIbq
 7LRl5OBFLiUUvYPxkwg==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58a627 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=hRfWpAjuP3xw3JzzUMgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: g_zJpf2-tW9zpv4TF1aNkOepXj88SBPo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5OCBTYWx0ZWRfX8boyXQfs5Rzm
 +pDJ2uKTOHOVGStP652/HDvMJD1PglAfQjcnI69cU5sKrzanka1RyolDzk/nrzehNUip5qdyR5e
 VZ1OLMpzcS4+Xl2w2Jmz+kVrY6dDGh8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160098

On 7/16/26 10:25 AM, Praveen Talari wrote:
> spi_geni_init() reuses 'ret' after it has already been set by the
> runtime PM acquire check earlier in the function. When an invalid
> protocol is later detected, the function returns this stale 'ret'
> value instead of a proper error code, so it can end up returning 0
> (or some other non-error value) even though the protocol check
> failed.
> 
> Fix this by returning -EINVAL directly on both invalid-proto paths.
> 
> Fixes: d8e9ea989acb ("spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202607122241.qzP3QAXF-lkp@intel.com/
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
