Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B59635A39D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766111; cv=none; b=kL/Z7g6mpSHqLmV+r3lFfwzI5BoXroN/CP4l81lOdREIpeuKu8N/9dJy2SR2kIsdpyOdR0/Z8PD+h65vFR1PwHRYRUo1SLSgTCgrnQoI5m2b4YSBIXfpRh6XA8SLQERq7UQ0XrAESXiHMpEV47IEo+ORIMbBsa7NPjYMdvDl/pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766111; c=relaxed/simple;
	bh=Nvkt7wX2n7M59sy4Jon/gvKKGnV+tkjUblreaxER35M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YifQn3d4PEWHgRMmkg5LuCq7hZ8Wr7LVtvfzIU5jmNd6TUEJwvrUoRIEJUG8+GQqudZa1oPtUGmLKOmUaWRqIC4b5Ma8cjrlmNWzvpHt2/zZ619MFCvY5djRFOtF4rdCDdYp8MvayPMAjcYNwMOlcxK/DwB7+31D9J46BIKYQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p48mtdRc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGN3R4qw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p48mtdRc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGN3R4qw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777X5K2668284
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+wc09jClfRYyUGuhuMvo81/24b72YLfwMnqQxekFvM=; b=p48mtdRc2ckbvtAL
	ATMa2LOhlZenBDjStRC8VqiiYG5mLjBrfUvicycNodiT853Trv/rVp3ro4X4UjOI
	fvq69SbRN8Rq4mfqGftgYa5zsAFbKygQsTp43iw00njkiIhuCGW4kofL7Fnoe23Q
	HXboPuoVuP+9FjkZrdR5IZtrLM3yCWfJpz4+/7o3qB6OTC7wlog3c1s7eNtlD2Tg
	yKO0oge+8vgetcf4+b0l6+KBpxQsG5dOkPC9DDLi5Xxl1OdZZaGKwx/h+1cy3W3v
	/tXlzRrWcXycw/Nvs4wLTUr2yF+fmt2dVFbvxe8FFn2V7dV7xaj0B0fCerzckxvA
	YuO9QA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca5gdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:28:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fbd0f0367so3588341cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766108; x=1789370908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+wc09jClfRYyUGuhuMvo81/24b72YLfwMnqQxekFvM=;
        b=eGN3R4qwsqJZnpVSjxkLQAntK9eY712xFj06aXeQEV3m//PyJJ8EwlQuXyHvRb1nL9
         BpCGhASZKLiW06LQX/sc1rmKHrdaEqWEBZ3fBbiGEOr0Uf0kWGy+y+XNVhtHLcaaHKT4
         k7hHyPt6kvtRUJBINVwOyqiS6JmZq6luWe36WLMh0Lj5m9vTUXzJekND2c5G71bqXNjr
         8N3y8k6deOu7r52HC7QvgHz6ZBna8sBeFjmBoQgNSlNjiquHhA9vNWlo8p0FUXvpUtvQ
         LyVtkbgRoXZZUoeWhjmYaX2KWOnifJAGA86WqZs2CVWIB+26EZOmXmL2RdpDz3yy048c
         qcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766108; x=1789370908;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+wc09jClfRYyUGuhuMvo81/24b72YLfwMnqQxekFvM=;
        b=ZKlkGX8KrYK50ARwryyf5AQYfqA7B8LKHDuTZynaLrpagmqp8+0uxG2wTYvpR3kfvY
         2d/fdtpj7Y1QWSuP5qS752+PykLD7gSH/4UrhsUWSMCBYaIj6ZBNn51CE1wJKC6Yh81T
         ENCa2ZUSb4/1NNmuaog019au7o+0UCh1alPWELubwjBcixfgALFAXDbocO8alHY/gpJ0
         NUE2iQkUpa4wj7mwUaAqHm7G8+XJqngJmFt2D1SDqi3HUNJPpcr7KavG0JIp8CVOBvKu
         ragUBwFpapk47Fo4no5dVROQI0jg+riW03LGfb4nq5fNfP6mGQNpzclt5k6xmzrV39xW
         lfLg==
X-Gm-Message-State: AFuF++m5mReexbmIBDxJ8JuLFBaDNQ+H/ouY4J9rFOiN8n4fAn3WLVbi
	yEVFN14AltZlfbBQ0pJTOZcJFKKxxpdQMgFubgfLb2GyoO6iyPtkcoB+vGbI4sk/7jE67n+VmC8
	7X41IdCHR608L1wYIJ3hY4PfNjgcbPgBvB5P4EXs2r7UNFRcX/5D51L5XOJuG/K3MQ78r
X-Gm-Gg: AYBFou3EV8ZVunEJqQ3bLDTXmytFJ+V8nAJQY4YJcjYEfePUV4JndTnUTYBED6hbKRr
	Qg1uzUvz/BvOImn2FP8spaE4aj2DhhrOqrf8xwnM/SiFEVi4zAfe1KDqVdGfv6CMPPoNHEXLIYx
	LgjIq7zo15LQ/TICh2BfPEUB+lwxj8RoT9iopu/1EQjkrn7BwauuOSlll+hzKhqMItEnJtyBbam
	hqhfAQcTTMDilll4MUvkzZxolJSPN39vxjxBZgPlyglveLpbQMcGU1wS6+7bKyhSN1KU7KctOhL
	Dz0T+UA6oZI7Mm4LfHYd31xkNFYgkqpceZYDdUSRbGn92DM//8a3dwWtSJebkxKExXCo6G2bU9b
	fpEiMvR16hiiArVnJseSzLA==
X-Received: by 2002:a05:620a:8086:b0:939:b0cd:2c3c with SMTP id af79cd13be357-939b0cd2d81mr111503085a.3.1788766107724;
        Mon, 07 Sep 2026 00:28:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8086:b0:939:b0cd:2c3c with SMTP id af79cd13be357-939b0cd2d81mr111500585a.3.1788766106990;
        Mon, 07 Sep 2026 00:28:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm432124566b.36.2026.09.07.00.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:28:26 -0700 (PDT)
Message-ID: <c23ee6e9-6286-40a2-a504-1750f5baf078@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:28:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: fix typo "upto" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907061742.10954-1-hemanth.selam@gmail.com>
 <20260907061742.10954-3-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907061742.10954-3-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fXdVj-gmVttP3Yc9BV7XHegYCF7NHuhR
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9e679c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wbSmXUBKm7kmP3h1SjcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: fXdVj-gmVttP3Yc9BV7XHegYCF7NHuhR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX93gde3uRFa9E
 23mnKVzAxFXxMTHFCdCQUY3/EkK0oRkAs4kvKiyktGmAnVHRje6xrpnkTjhQptO3ChAhuzfnF9N
 X6oK5Bcr+a4YXn+fxmbghMnZeWTF2SRMlvkSrPRcLNm+7+DEES+UjzCuGCrl2tQW9FbDw5ZV89C
 XkCvmNArMllTa5yKkBrrjYLGEeLHtFF45TgO6qpaBTH4yMxxEMbeo5V3KHS9Sgr9jNeuD9PPLuH
 /jrwU6cc4iCXxr5BDwx4iTrL2/c5+Xp2KBhNs7lFarEqylJssjCDIWMLf2pFPiYYSGAmW/6I3Y9
 KY1Tft+wWu/XB+wa37AP+kciQ9UlCt6J8SeOOzvS1LU+71lFvitJVcF685s1RCqPFVs36SNherZ
 ngfP+CCeqYMgWx1QQdS/AlQyHeSLXhbMUmWbhvuRxzDX4uWyc7FaIqgmlLGLyW4S13qaoYOuX72
 51XwSutUqv86xcq67Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX6YAz7DP0i/gN
 xDfZ0wwRf6j6zcJpuohH6zV4I8bo5lAXG58H1Oas9Gqpnd0NgLLWxeQanrf5HgKOzd3OmBY7Mxl
 aSOiEj/vtbeObbmYsPdj616hf9v9LhA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070079

On 9/7/26 8:17 AM, Hemanth Selam wrote:
> Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
