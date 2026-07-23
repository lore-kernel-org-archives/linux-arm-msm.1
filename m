Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54565311967
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804105; cv=none; b=UvPalgKJFlSx9c6QvuieuWGsrkaJ/Nt7YqRRvYrNBvgV7cptQfoatmB4+xv1BPWfbPNLDQ0ndwbuZFuisIKvrBFSGhNKrujqpC3euzaCS24g8LiuCzE084UmcMjJwHG9yoE/QWl8As2j2+8vi4UiWwv8pxjNihU9zkJMilnsUzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804105; c=relaxed/simple;
	bh=Pi70S02miiNHDRc/Q7mSW64ZqfbjcQ4++9v31z9RVI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxgUTztOUW4GC6+IaoD5Te6yNtkm406SCDh0X3QWcCXdlenETg++aA6sMHPoOlkuvIHpv/8itu7cKASUvW/c5EGAEwTxXybBGZNskBuzsXosSxoq+vtFHMhE69wvFFDv+pIt+u1mfY18kB9ZuIJsaZWJK5+rlW+mpfaxbaC7v5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNG1gAHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwD3H1pr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNG1gAHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwD3H1pr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qb913390536
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqfqaFsHDwVvg1n0mFLME+pVcZeQc0JW7wTTIKnGDmM=; b=lNG1gAHMBTlj/pEq
	9f0ohq7uQ7BhlhJgH3Nj9pD80u4AKEs6Gp/lnqQdCXCmTrdYLkBjsrLYLvDdQ1nw
	niYzZSbcNRbkSTA6kiwIy8/2bZ0RyuLKodC5nn17fbZHrWCP3giZTmvuDyML5eDd
	LZ0/TlhAlWWXGzZV1gMsJHsNXxW00QFsWcOCPEk+BgGeSQEwxl5f2IIv/gdFnjqv
	L8gZRhkUBX+4aS8mU079LTTQ0H7rkpQ70jSoQHdQlAQl2p6orrRZ5Tn13ZBDV7Jd
	z9O1LDJDuhNGWL3rOWIm8NZRg9X3yRhcL+YWqOAnZG44yUtXx9PCSOypfCn+kZUA
	+xLTNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0krxur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:55:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so13002885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804102; x=1785408902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqfqaFsHDwVvg1n0mFLME+pVcZeQc0JW7wTTIKnGDmM=;
        b=DwD3H1prPznFLhz0RM3Ff7e9qMvt9pj+ZR2O3IH7hH1GNFiArHZpTz5qB/oLNGTLSv
         88YImaHEvhvOXYcWs/OTo8UnFYjjrv6sRRv030sp1nG8qWmdR8Z5HCYoQhf4R9SeN4ip
         Nk85U9YiqkMHLuCTjXWmxJojkHCOWdhoPxpCpYGT46GvFmnbcLkuZP3NIdsFvG4fd5Ei
         QVhCfwIGTGene+k3U/OrgrmI2VaL9IrL/iRgiuGoiwGR90h43EY9VqUxRQ0Zh3Zps/z8
         UOgK4+U48XXhbBstk+/s4x8me103Hx9NlJ8GPJCRACi7GpLNnvsYWHXbn/S12Eah6YQn
         HHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804102; x=1785408902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqfqaFsHDwVvg1n0mFLME+pVcZeQc0JW7wTTIKnGDmM=;
        b=iFTRIoxenmGDXZX6Lsk/6nOkQiGM16+90SG0TxGUn6jWlFCbRcnOAK1v3Cbc8RWHmk
         DNbg/kSEfmYv9RdtvH8YO171h5mnsiOkkJEwzPAfL+udf6LsDjmH2aoXIwqfMKDcdO0h
         1t9VXYcP40vQMcPn2ch2rtqH5VJ9cMJyL1evVadkW63ZWQZgZapFFVOH+Uuw6SOA3/BU
         6IFVRxrGcA3XD2hFWx+g7YW4yK2hdmfaW4e7scZxIOBeXzfQYhKLkHZRgl7qnRVhvk+Q
         anDdp0IgozLE0pgGSdWSyCgCLuBhpJbMEeH+9EVsyLpli1igYHc5+NldQpIL9f0brD4x
         Pk9g==
X-Gm-Message-State: AOJu0YxkRGFmVWCvNI0jK+JBBvH18Yb0OzX/BEP1ERbYYlB23wZ4TeZn
	uHX/RpzoCAwbppgodea1lmxfiljsdB2ipYnIE+Ixn0xbCDsj//LfkCTY3oGFrzzJrlmC6kK44Gy
	hyNQ4J7H5sj4AwoVTVFG5GXC7e8668rL7qSZwGwVBR7pItG+dyvjjqTgn0v9QdOh5tH3H
X-Gm-Gg: AR+sD13EuJ6t18NPbCI4krC+iittYaOO3/7mY90YaJn7YSmj80ryc28wUJbBDgnF1g0
	hZPqbH2ds83fs6XFVxqhY0xRp71AH5AHugafnDPrOp9mETkPC1Gf18A6BaqqOB4TWDBYgI5HNP7
	1lnfUcTYd6MLvvT9C1fnyYA3rc8XK21FSuCawnRnG2SQr3tQJWxws36hipsVvYzDBZw+1/kOi9T
	hQbmfsnYmNb1nBgPa3aSeRptAHB0n7gvt14SAfR7PRoCaj6GADx/DhgK16/JAuZESmh0LxQeNK2
	uxhrkr0CHjNfrIRc8TweW6kCspHBUiN8rNsEq3Mip6omRztVR2t6Y02XvKChU8eOiPHkDtdtBgJ
	PKOOFK7FDAFxfZioEh9kMewdQ
X-Received: by 2002:a05:620a:470e:b0:931:23a:83ca with SMTP id af79cd13be357-9310378b626mr218791685a.4.1784804102499;
        Thu, 23 Jul 2026 03:55:02 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:931:23a:83ca with SMTP id af79cd13be357-9310378b626mr218789785a.4.1784804102018;
        Thu, 23 Jul 2026 03:55:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c3260439esm214896266b.0.2026.07.23.03.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:55:01 -0700 (PDT)
Message-ID: <413bcb02-4823-4c2f-8e0e-c9a40664caf9@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:54:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: Force shutdown during device removal
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9fyfZVO0kUvKVd1LTO6ETrcWL6YhMSrG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfX7Klar+V3G2Pu
 3htpreibIkO2/mmHcctcHjCHnafMHIdALLv5InW85GnRw0L6mOujsgLPRNzjPDxkgWQD2SeuEzk
 Tn8WPJNRqBNDxF7VuzZYQBkqGI83E0Y=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a61f307 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=B9Y8OgnbIiifJ16KBmAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9fyfZVO0kUvKVd1LTO6ETrcWL6YhMSrG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfX9818eCgE6Hn3
 7GEDGXlKgtMZ7LaIVjhiVIiBU3DXzCIVfyJLdMe8DmWXsD9BBYy0Skz8Xy2DmKbVTrwvJBysHVG
 zck04LptVlDvAoHF6Q+5uAkwAnMPn0c2voEv//UFdp6KirRTwCo4j3kpVsiHqCRfuoKWqUxgE3B
 b8cbJZQlaP3ORT8FijcqtXYV7VEwIgXsRBbbwNFhj5936Rd0NKE+ugr/gVSXC/3aZ5RRmVk1Gyn
 uzK32V9xXfkK5JByM56YgnK431ruoivoZ3YNuPcRqel4/n5dtx1MDzn/sU6MhsBf0GNb4svc1fG
 H7eFUcEbvndRsrFG2HBLWR8SrC57gH1sRzgasZwzOX3KyPS8hMUdpE9iRpS446NMf0b5Dv9AHAu
 KOLSY1vlEWHu65gu2J4WjJRio000I9uqI03a/P1pGATFnFvUkobEYjT+JWnJOFDhyiQSuALfb3q
 xXhiOWWsKWUT3Pd7B1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230107

On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> rproc_del() is subjected to the reference counted shutdown path, as such
> a remoteproc with more than one reference will be left running as its
> resources are released underneath it.
> 
> Refactor the shutdown path such that the reference count value is
> ignored when called from rproc_del().
> 
> Assisted-by: OpenCode:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

[...]

> +static int __rproc_shutdown(struct rproc *rproc, bool force)
>  {
>  	struct device *dev = &rproc->dev;
>  	bool crashed;
> @@ -2029,9 +2008,10 @@ int rproc_shutdown(struct rproc *rproc)
>  	}
>  	crashed = rproc->state == RPROC_CRASHED;
>  
> -	/* if the remote proc is still needed, bail out */
> -	if (!atomic_dec_and_test(&rproc->power))
> +	if (!atomic_dec_and_test(&rproc->power) && !force) {
> +		/* The remote processor is still needed by another user. */
>  		goto out;
> +	}

GPT makes some unclear suggestions, effectively saying that rproc_shutdown(),
unlike other paths, seems not to first check whether the rproc is deleting
if the shutdown isn't forced. I think it's a valid concern.

Konrad
