Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676CE40862D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317919; cv=none; b=d7kKGd04lY9VNYbVzrQG4PSN5dAWDig+4FYNBfxrFlUBdTNy9WiZTDDbGMTGyjgXggRPkputuMFNvIK46L/bkdzGekHaPvzfnLbk8j27vLhqQHMcdkDeeRXpx2avpZB1+E+NcA2eqJgMQ0dQEn1kpKt2pKoGgkqyVUHWPcWzxug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317919; c=relaxed/simple;
	bh=FxhJa29OuxgnH41IHGA24Gs2MrY0uVLmne964FV4M/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUdlM3B7lzae5qCYgUVWgilLaxy2NJg+Bh3Suj3zK1bgxJBQdnxV5i88k5iax3DKxv2VIVyjSqbXIlg8aOhAvho20SFuxvQ8kY8gLKC1X6ww14DYegpyjpKzkOf0ioFUX0qsFbKc9tmJqGgNtxj0EVEMTVN5SjFEXgX2089SfGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Da5ZIprn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jV3wSxn8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Da5ZIprn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jV3wSxn8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f3th1389967
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fn07n0HWzACCbxCAv5o5TJWZYkesjWcnmTziU02GRy4=; b=Da5ZIprnYvL7Vaud
	HYYkZ5IUmW3cfsFJzZkc3YUgLiYXDOYtoF5ES15jd7cXwr+sdGFdjADq6/C6+Dbp
	a9zAd/mAP5XUC5UpVso13N3UY9AhrGwIMspxMI7czIG5p7dzgsJnd9jsAqx+LAd4
	f6b5nH7sgN7BMP/QKtTAi3tCNURKwBoIOjSAsIsGAGNfic1SUjl0jLUouwr16Brm
	bnGWQ+UumPCpsE1hfmdQEcXhh/wRgGu8KpU/imHN4FRRUxOIYKuSEp0CsNzeP8r3
	hYybsvEoVHsOfxPD/EhM4jD+/5MFrRmPHVt6JTeG37uDYkhkW/2rXm9sh5uEuXPu
	v4NnoA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmxrwr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:38:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84870e7f498so854014b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317912; x=1785922712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fn07n0HWzACCbxCAv5o5TJWZYkesjWcnmTziU02GRy4=;
        b=jV3wSxn832qemPFhqafczC2t/l2i51w+fWbnCFkyAZDXlvm2mhjWgc073NZPqMq+dO
         QHB4mrsA+F6ZCWbPRO9x2ZD092K4Ug6ToDfnCXik18i9EJj4W7ktjDFiLqKZitQhX9WG
         e82/koIpXDQ4YasjyjwqVs4C4RIwKqXTyrzyFmFbi+3yPuA4ERsPI6jyvC0uI1FnBJ8n
         DkcDgBoEi6MBJfvrv4JvJ6/ydZkUikyaS7Cmb1ZgWjO9luMPsS/UyZa4iMsXqg/vDYkT
         O3uYObkgwOBUzbXgjC4JzXQeDZphjuO0JuTxdBf+P2tbh6n1gvbmyoBeX4DZDSBECD8R
         1aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317912; x=1785922712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fn07n0HWzACCbxCAv5o5TJWZYkesjWcnmTziU02GRy4=;
        b=FJHKCTz59yoMk8YWmhYGdufl5ogx5vmtj/9MsSeIutgOFRYV255bAd9BDDtkiChrQG
         3LBlKHyOT9VoUj5tOkNOCe4BhVmZJA3ibZj2pK1FMcOc6HT6U1sAJSdl44mbparpGBaZ
         zdm7rDTfpa8RVDEofiNiVrR3CScMRfkLBwvNhCPLzb2+CO0hOvH14i654632V3dI4HQR
         rUhKETm/7HKD7kLnT33vzpXW5rXk0ZZnnNZ3h0e02wx7kDjWLEKjln9F8IGFiKBHsZE/
         aoQPrvP9AW1zGzyxD91Vzjj1W6/5jeb8m8FYVQR5tZJsa1CVngXoPl4f3qRYsXzcNA5G
         haqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGQOvub16O1Tr2OKcllNAGdcOuYhCx3WypdPpBI0jL6X/FyKxx27Bix+IzbMpq3ZI/66Hizv6H292YOotH@vger.kernel.org
X-Gm-Message-State: AOJu0YzEE3dIgoQLNc3Z0VrNS+DwU2ROBYb/Qkp3p2SZvJooPjwRs/XV
	kJIZG0pXoRw4kavUXeF9E9I+0rExIRs5FzJPjRHfBCaKhtXexfwGfULMTHe0MmktVvunlzP4ASC
	N+mt20qsMNM4HNZd63f+wrQOlfY8T6lI0qD23h0tbHIslxJgKF7tK0DQ06uqDzBhdfzHf
X-Gm-Gg: AR+sD11pKwHiKb8T7NduNb6rj1ZsyislHQPRLa1+QDvFzYSnh/QEDwjc7CGQ5NsCmaI
	oirAlPWy7Y7DK/LirQMS7NJ7S7/mAPd6qIvRfNgGhPPRy0pBKL5O+R5pqK0USXEfEUyXvS/X9Wy
	WjispUIovSMhCIaFOoZ+SDJFW4XU9TG0hZgxfNmCt9pkTStmuIVsMo7EbNCUP8C6wg585s57Ljb
	GiX8oXvW8HhOPdsMiaSoXaE5cXFPbghe4/WeS71QcocBzJzgsi8mtqn1baSROeSmByTTokEGoTS
	usg5TGAABTBm9VE8SETqxsGbYf4EKtsSy2Im7hh+24HfpA/BVXxGioYLv+LNhh31WiEnRinU2sn
	VhbWtfl7+QYRNXaJ0gnY38odyyRcdS5SRY/10weQJKcCiTCvIujW+8dGYNKsvgcoyBCEsPWtQvK
	Qt573pFG6EHF9IimJD7/mz
X-Received: by 2002:a05:6a00:22c5:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-84e931ec68bmr5900479b3a.11.1785317911978;
        Wed, 29 Jul 2026 02:38:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c5:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-84e931ec68bmr5900467b3a.11.1785317911580;
        Wed, 29 Jul 2026 02:38:31 -0700 (PDT)
Received: from [10.190.200.29] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8461sm1097479b3a.28.2026.07.29.02.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:38:31 -0700 (PDT)
Message-ID: <8e1d9c6e-8ccd-4383-80b6-d0418171db10@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:08:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-qcom-geni-se-armv7-v1-1-cf90f050cf0c@oss.qualcomm.com>
 <e59a1272-ecc9-470f-9120-863f490ed2a7@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <e59a1272-ecc9-470f-9120-863f490ed2a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX9TxL9r5hPD4L
 FlZNIjgiOuANKVuxBb+lu0vN6c3uthnmGBlN/trxD9QIqInHYpIi14wDjcT4eKU4nKY7vxctEcg
 0TVHoykyS92WS2meaFyoNzMTOJsYJvJDjESHPn/ibBH7roS/WUZgijzDw5BeutI57qvPHazY41u
 mkxR/pxOJPvJ8NcraLenQjkDmsMogFDWwpHSrUDGtmfuPxwnQRJYzu3v/3l7eCNveJ9XtGEDzYm
 LGrJk7nq69imdcBpbqHo8bq3NE3Mkg8AYAPIhlM/60QS4NRDRqERhAAU/CrxlQlvpGU3vEWIaox
 nNRwsJOnSLTEbq1gqqI1ttP3JJCLp65RFB483iuEZ5qXQGaecGFdreg7UGgssotyDo4M1/41Nj/
 HKwC63Cw2wzbvQNDt33u5VCYWgv8nwP5xDGlSQ9TIIpMS7lMXkB9UnVOAiYNyuHlLIH/XbwZH6F
 gPwIOsU/M1QbnX+tT4w==
X-Proofpoint-ORIG-GUID: by05nxoZAk9QIWFpW7hOTg3HV60LwX9y
X-Proofpoint-GUID: by05nxoZAk9QIWFpW7hOTg3HV60LwX9y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX7Kfgj/QmR7Lg
 Sb700PQOaYHVpVKnGWSjqV6XXkxNwlpZ/ELzw2Wcg1YLkFyN7UElIP7w39Bu0sr3Ta1Scdexw3w
 pnSRNSh+gLp9j/eO7kzfAuWprmGtUUw=
X-Authority-Analysis: v=2.4 cv=fLIJG5ae c=1 sm=1 tr=0 ts=6a69ca18 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ytFWDCM9amYekfz_1AwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290078


On 7/29/2026 3:02 PM, Konrad Dybcio wrote:
> On 7/29/26 11:15 AM, Hardeep Sharma wrote:
>> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
>> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
>> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
>> hardware.
>>
>> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
>> wrapper for its debug UART, so this assumption no longer holds.
>>
>> Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
> :(
>
> Konrad

Apologies ...

Fixed here :: 
https://lore.kernel.org/all/20260729-qcom-geni-se-armv7-v2-1-dd6dd1e112f4@oss.qualcomm.com/

