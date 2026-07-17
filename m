Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16F633EB17
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289882; cv=none; b=QAcGualOXk/NrwtJPC23seS4LROBK1qhgC85PPLOtg25hBuVa3sLQplwG2hckvhdWSLWLzfHu5POzmWd68w64GwZsIQ7DvybzvqJNR9RmPNItoXLYxtikXFwxfiuI07j/2TceQVU58MTq7RJimtaJyCzQiunxlr014W3F+SwpIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289882; c=relaxed/simple;
	bh=AC9J8k7RFEQR7/Y0sar6DSCCZVXxWwtedMzJLAQhQwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKtmqG2qq/r7rmhT5a+pC+V6VemGdbiwvtBXF6dTPKFClzGA3eV4tjuBHE27QPaR7q4UQGGGJfr2XAd0vr3P845EcMXtF4RS1Z2oodBry4wSs8l02qn3rWfEN+/v2IwZ7/DzpLnOhs5AAWn/TWzdx02kZjMdfrDcdk97RHjvePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N71O+fgN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gm3OLnuR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N71O+fgN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gm3OLnuR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASuvJ1632061
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 12:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3o/UiwxME/vOKXx8jQNbJylnqTdyox4/O8cYGpWJcHs=; b=N71O+fgNKbXY7d5N
	++MBaNd6YNy5GwaP4YpsEU32hbFinE4GZOVGOrMXc77JWoP3IQs4qQLtMw1Y+M4H
	Ggj1IKd+A+to8V9PXrbQ1Ce8NcZ7Ggq85PUPfj1wmYjDZp1F3v++Xnywd03BjTvx
	0ePT/ElabdloIQJyh/nyPHNPaUR4bsSYO8B+24Ab2R0LT/ONU/qnETfQHnKLwsYF
	DJ54hccna5U7k3fPid9x9YI1YGcluVAoqh/nWhNNNMlMjboqCMwzADlD0xx507/W
	Cm89ULxPZ81UFhEuVsNt97OJiNflxxGFnTCtQ6R2Qw+qFFa/grRdC1WZRCZwewZi
	9zTEzA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0ushef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 12:04:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so5135280a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289878; x=1784894678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3o/UiwxME/vOKXx8jQNbJylnqTdyox4/O8cYGpWJcHs=;
        b=gm3OLnuRUqIn2Y5vhWgouJ/e3yxWn5tO7usE4W4o5GRUG/wudHKOVhZO+1b6z7ne8L
         3qija/FCKDZFfLnBa31o1eqvEWRPJrxC05SdgRQp7VDUwknVlFILE3l3degytJjkUQ4L
         GrWQ0OMLRlRlDqqXmRJHidajsllCRn2TWAyGoluXOytqWQQfUPCTpSgzA2yXhJwV05+J
         kT2vf6QZH+ffRz9jB8aLxrTLMNOGJiI4iTRZqs/Ld8zYcbg9Y7zT0p9XAl2JTbzJhikE
         iiPP1ewXu7jlRFgs4GYVgAgsXmtGadOIPTRyR+3GMjEiETT/7DhoTxIRQjQqYJuHHFew
         09Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289878; x=1784894678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o/UiwxME/vOKXx8jQNbJylnqTdyox4/O8cYGpWJcHs=;
        b=aiz7/wgjK/gfSg8v43nz1dL1/ydPkgWoTzdfdC8jJBEOCPlkod+kvsraoCkD7+vlEQ
         mIX/5D5mjPo9TuHQT73bPQp/BTytlTNpxZ61rbqFOiSgYC+O0xeIZVCq2HYxPGciB71l
         5eEX6wxs63gqKsN9mE8p/Szm/g3ePt+rZXsWldtp1qX8gZE8ZcUllmRzukTde9CWDiqy
         osR+3fFdwUzIWtTNcM6NN8azgOGeSFRdhZ2zhPhFFZfQ5274BarKh7/CezCUmtiYY8MU
         s2N8cx4RnYjk2xWIpJ7HiyGjxNcfJEOdb+oiT3NIhllveEgxxGZE7+sUa6/dgx7slDYC
         qTOg==
X-Forwarded-Encrypted: i=1; AHgh+RpUWPlt6/Bn/28IpVNwsgzcl/Hst0U4GMYpsoppE+qD5UH2BR7e2ZbTWDBInNwP2MH8mkT8DGi/fiZCIQYs@vger.kernel.org
X-Gm-Message-State: AOJu0YyqrltrQybCaro9x/HRiFCUZP06c/+2LcIvEGqIhSgjy7NQDUzr
	n8OKbBjCuaemmxRw0ZIVQJpnOavPbZnkEt1DwTPsa4EFBXVb9opv5Nf497EOIwfj+iqY4ftKv4E
	ffE4R4rBZAeLME3BQP3aHDc6H4QMNMvB7jCc0fA2GpPZAIzCILRwAY5qxi3TUxB0ybMzz
X-Gm-Gg: AfdE7cn1Yi8WjEgbptlFsxAo8RyzCsB6j+iaKQM3tBmjaNOGTG0WFZvVpU52DR+ERah
	F3UkDVBcjxV0cCIxSUJz8gSwiEzel6kcI4fSXlXkRa6R3k7j4JzQseSGD4o4blcWDJrBZ2UB7Ji
	jMNL81UzHqka0LQjyo1Ug8LZUh0zKXRWLscHKLajk+WhdsoPrd1LBzgHHpbMX3jVdtTtVX26GLS
	pxV7N8MMuhCBOoP4bl3eblbtubXSF69hKRqap0kSXJ/gtQb8KqsZG6FRdbOoadmo7XHqf1MYLKN
	n/YljcQ36QidQ5FjmUDo5txK4fxpinQ+/lKK7d7OgSomtYL4HsZhm/XlT/ckxTqYiFh9RZM02Cp
	g2r4nNN8Q3G21VhYAFGto1MIEyDE18c0K
X-Received: by 2002:a17:90b:17cc:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-38e4b3db1bfmr2537944a91.2.1784289878331;
        Fri, 17 Jul 2026 05:04:38 -0700 (PDT)
X-Received: by 2002:a17:90b:17cc:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-38e4b3db1bfmr2537871a91.2.1784289877823;
        Fri, 17 Jul 2026 05:04:37 -0700 (PDT)
Received: from [192.168.31.121] ([152.57.118.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b0e9bb5sm960514a91.11.2026.07.17.05.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 05:04:36 -0700 (PDT)
Message-ID: <52106bcb-9d86-4a55-b845-e5fc88040e58@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:34:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: embedded-controller: Add Glymur QCB EC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-2-aaf1cff84aab@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260717-glymur-qcb-v1-2-aaf1cff84aab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a5a1a57 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ejL5Ki+uV+h8hZHbT9l+dQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=j_5_zYGKYL8p0uFUWm0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyMiBTYWx0ZWRfX7eCxoqToRcyB
 ps5RQ3dJkdsBwjDc34AKXZd+Qf/qEBF1M6x77sErZbU4P06Zdox9LutU3Us6ICG/1/bumSZ8RRU
 IyBDSxvCZCSAMLzXlUjQYX38bW/mpckXdQZabAWCMdJcxuwEh/PV9vsqn/DQS099W7lHe6pGFiU
 Sbw3G3p06TUald6VHD8iJLfNeXIom5ruMxzjlmktcGYThwLnLJ+oJTLgCSRE2gsHGuBGTJUUXlH
 aIEPwY+3SxzOMuLuTX1ErhiPF+8mEmhOiwnabNBfRIpPbn7jbF5hYgcvSl0iRyzt9xTzj4iNLGC
 kK4t0aOUWtfirZKNnq1dNFmE8Ck8GrAj9ljrN8Zzcs6SmXi/q+EcALc4TV6tCGiHGUl0pXwe0aa
 /iEyM8eX7ZGS2tKX/TUjpczxHKtsu+8L+d9Y00Rv4vKaaoY/QScZuACVHARWoe6loOHWwPpsrdv
 c39B1RbXVHPRU3d7KFQ==
X-Proofpoint-ORIG-GUID: 12CD8vOobfkeRPRt4TgWXsP4N_Nuulz8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyMiBTYWx0ZWRfX4BXuWUjz5m8f
 sNyvrkhkX5ZkBbPiB9OQ9+WtLtbz5t5fhei3dftFkmEPWYzcirJJMdcFvXNkjlKl5EmiiHepgRs
 yMRROB+K3YZEF0XpTk+HnrtDZuJ5GNI=
X-Proofpoint-GUID: 12CD8vOobfkeRPRt4TgWXsP4N_Nuulz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170122



On 7/17/2026 5:24 PM, Gopikrishna Garmidi wrote:
> Add the qcom,glymur-qcb-ec compatible for the embedded controller on the
> Glymur QCB. It is the same EC used on the CRD.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> index ac5a08f8f76d..de416057063c 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> @@ -21,6 +21,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-crd-ec
> +              - qcom,glymur-qcb-ec
>                - qcom,hamoa-iot-evk-ec
>            - const: qcom,hamoa-crd-ec
>        - enum:
> 

Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
-- 
Best Regards,
Anvesh

