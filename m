Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233916;
	b=SIlXPfzEn/JHSnd3Mln1h1A4XYEgo7uCbAELA0YyVHK+XbEX1XEbeciqFgVDn0yMOftM
	 zbH2JalVJhdpdriDbh1Yzr/Zg9Ss+n0c2x4uARypnLX5u3cVIbDa0LqGMhFJ7Af6r56ox
	 moNXfqUmksWotpjDflCCiJ6Xg4hTNhYc24I66WZtLOPXRDC4qlJd2EJqzVPiQNB6Nw6kQ
	 xgwmPD24sGiZDrSDtv98hnOaRPoOF/zEK2xpQOMRx3tc+oCypzhhLr8SpB+y+7ZwKNcd9
	 oCqfSUxo5tVzOdiQF/Jsepf4lmByerkuYu4y9yBs6WJFPIATvGVsE4sQMaSEGJLt1fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=;
	b=Lx+BTt1rFDSsrxhviAdm2DN0GX9X9ya7yK8AlV2lJbFokq2afBVSYNBNKNvwf/VKQJjU
	 W+B8N+2ZgkJjjQfIWyLS+uWBkFZ9qE/UhQJ0m9BR1M/ENkStBp+s5J3ho1b9JI69e+1c2
	 boBgOHU2jJAN+zY3ndaPU9o48lMUQp2yZNJTDINjjia4sre4ofCefSPvJqqVI5UXNbdv1
	 ygtMfkC4WfM7lkRoB75c/Cquh1eNcDDseNZgp5m5AJFjeVrgXMdmY9V/X5ZT6p3JlXGdY
	 9BdJLv74wsneKOevhTIrVTl14/3K6awlu+OQj/PUvFs9wGBos/O7CVkCL5SvEzho0Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1VAxCzk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVq6hVWa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49780606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49780606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1VAxCzk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVq6hVWa
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFJi1971483
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=; b=P1VAxCzkWtn9zBeW
	Hsym7T8qt+1IqmD/MD3EU9b5HLMs7+bDuSxKLw6Sjg1irvMCMcDRlZeFEPfaGqPM
	9U92P2R35y58+cbdCp2cGva8+qkOKPs3xSFoku9mRUJxiiMXWaJCkncsfEfzOueL
	0KxiphlprjBSrW4pPh0sMt4QXRgBpHnDfqCBgnpPdfLEBwyVgDxeNZ9WagV9zQYi
	8p80wHU4My15p1ElL8P9F5Kwi6TO2YRMEpr01V/PM5iaNi0Fqi0Q2Dyh9ZFHUIjK
	V6XToE1m6pVtbSXrfTmidieJOI0lFwaTrc9Aca73Iz21C/5GUOUFQ2AOJJ++JOS3
	GFXRFA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3gms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:18:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-77f133855b9so22998137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233914; x=1794838714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=;
        b=DVq6hVWaPAFFDPYCX57zwoR9Qq7T8MqrXtwv7/pNytCXwv280LKTyPHN5926jVa1qd
         6grVZgdCMNwIqWM0Q6drVh76gJH0UI/jQfgnHyN61NDJOS2+2Qri/3CNnAdI/h1TRJRo
         184sKhE00Jt8a7ADCnK9vcCF3vkVAJXP8e+ovMVVVbOVJemqbHt+DtFDBwuNbDZ/AvpY
         akpO4uewbFBSDhVssbLOe1NfgABtWh7noG4mCTKA+ni8pxPdkCxVzjH+61t7M5jzUjY/
         SAdOUAVlUY2UUh+w6hcAg/jJFCC01+jtem3B4hKGGaViz+yeVW3vm3/rxGnopGJc2DWS
         UhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233914; x=1794838714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lc3VM76iyCTHCMkYFjd2sM/8FGwGu/9SvJAqXBEZyUc=;
        b=OA87yxQ3OiRemaJ3Xrrh+oR8PPA3Ra8NTdoy1/BX49Ws4MR8JzWFbnFuD6iKJXANTd
         SXMxaoqDulnlADQ06/2j2ETPZ/q2Gvdxde4SbH/fo7eNxYN7plWEZfQwracklk4dixwc
         X1NMbbW4nP8SkI6mxANAKs4M9jpXXlNqaYJT1inyb0lysoZy+X/om5OdBytkq/kUaSit
         RfMw8I8XEhYrx9nWqMdpJpl7lWptm+zvp1uRWsfwzkG6N/koVHjArnNZAUshOowwu6q+
         bMUlwuLV2FMpYIxETAjvnbuzIbrmdcpVJ88Czm6oIYI448KBQOBCMERfHRmnw+pusP1l
         10XA==
X-Gm-Message-State: APuU4Z+STWpmotIlTDw8NZzv7dAIirT4UW2bGDX+KWG0r/OMPUJqBOR5
	D5WqdzhJsXpKTYbPMeKsOdpVw7rjmgYOutS30aARqU35BStDTaiSMLAA3xuxtrJnV3nhV3AhBMg
	3ueEUI5xmRP8S0l7FvJAxstiqM5nxnXKRLTAe/XX5GaOikMfeKFJciaC3B+ViMdUsRqJX
X-Gm-Gg: AYBFou0F8BvJ2r8LOgKub+5hbAaROf9EicoDRh6Db4CkHFCVRDV1isFgpUN8Nh/TVJC
	BFr+x+LXhGRl//HH4uPHhN+LR3nMMTBlVhNP/QEFq8ACxTG+l/J3ipYxnhlWyiX10TgP0csGEuQ
	82WSMHnnO6nONGP6NsRcixVlNxA8TkuukNvFdhdbVPdnWT6dpIOmT+jWTUefLcYNyXz5lUfBrz2
	1ZrLXvgt5Os7+XQipGdV5A/zaz+25n4Mt+Ud96J/tkkr8yHhflonM0dQLzeznQbAj1uW+a5eIBn
	w7vsyBwihLDLqLyfHNoJfxZVb7r+eU/797vAavTOJNdi1WNgA3LzzUCOUmvEuXAtPtaTeKlH4E8
	KHaAb52kZaZlkDcDBPts+9SmXVOcE5BPTsb8EsQxgzuJJEgwOA4rGVJ/+j1tVs0X82e05lg==
X-Received: by 2002:a05:6102:2922:b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d2da6441f7mr1258792137.0.1794233914215;
        Mon, 09 Nov 2026 06:18:34 -0800 (PST)
X-Received: by 2002:a05:6102:2922:b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d2da6441f7mr1258761137.0.1794233913751;
        Mon, 09 Nov 2026 06:18:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ed95desm1708817a12.26.2026.11.09.06.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:18:33 -0800 (PST)
Message-ID: <6294c55f-97c6-4f6a-9d2b-3375473ed203@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:18:30 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Release OF node references in
 init_mem
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX2yfoXuPsDtwr
 vArtI6U6XmLMdcl2pqR8Se3lWNgRr/8LcpGGcgsAlPSyG0QL9JhYC9mw6SjL2p+x3g5QnoK0VDo
 6wyt8y8Q4FOZzyYX5BcUfDHURZJOhqE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX8iW/Nw+pahrG
 BMif0rPeHayNtFiTN8nUffON2OqHVfho1iRdtMNW7LR7Z7h4fsteKCSUheOMSQOkxqfJ8AqQ33h
 IWKoNIaQedKP5EInpuvl0Z30iIK2j142x8ImdrLXQsljE1uft2n0pXO8+YxH71r0o9NsBNqeqwg
 o9ye27Irspy7P73W2sF++uE5wsPf97XTrR2Md0ZwliFK0CncT+WjRKeZOWFQwX2mvbDg0QXXg2b
 w2R5Gk3TCP1WrRu4RfR/gWi/k93XLfqFkEwGCu9GGA5qdpv4hn2oE45uqZDQ/PAt8c74TnEtmqf
 1evVy6lLXdY6iQpHk0SUkVyRpcWRmWlR9fb3F79Qy+8rV8e8enwkVcwOf5vVVLJVJ+ONPQv6uxf
 xszcpGAdBdMQbKHKyHH1fPNZVpn40Cve5D2U2vljjrA/8Lz8G2LOTisUKzu8tHHxmlHj1Eq3rYT
 WkhWxZygULufZQHW6fA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1d63b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nB5WFW7fbi4sKZXQVyoA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 9E74Yg2dOGVMY1dKTgfiUz7O5q802Kkf
X-Proofpoint-ORIG-GUID: 9E74Yg2dOGVMY1dKTgfiUz7O5q802Kkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090056

On 11/6/26 6:45 PM, Anup Vishwakarma wrote:
> q6v5_init_mem() parses the qcom,qaccept-regs and qcom,ext-regs
> (index 1) properties with of_parse_phandle_with_fixed_args(), which
> takes a reference on the returned device-tree node. The two blocks
> copy the integer arguments and never release the node, unlike the
> other parse blocks in the function, which call of_node_put() once the
> node is no longer needed.
> 
> Release the node once the arguments have been copied. The leak
> affects SC7280 boards whose device tree sets these properties.
> 
> Fixes: c842379d00f1 ("remoteproc: mss: q6v5-mss: Add modem support on SC7280")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
