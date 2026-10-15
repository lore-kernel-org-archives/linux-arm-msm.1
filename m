Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4D4E73B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067027; cv=none; b=YBvFqKoPyxhoQZBLD8GXcFYshTND9S+IX8BJRrHBJl9+bAuJgTkOBN3PvEWMYnIPuIidiRdyLsigakRntlxOPdCHeRtUnXGwrVbCfAaQNG2mHGd9Su3ZUQvCgiAllAFz5nwrQXPS4CI37/hT2lhQ2tAWmrWyJC8lArpsvOZ4rAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067027; c=relaxed/simple;
	bh=vYw3szEqR7zQw5YAGZqRLpKAPIDise6b7Wp5pAeF4L4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yf9HJhVAXbfgwDZJT0tzH893rDDhF9jVusdUQ8LPhRwZ1/DaKhypItKOom4l4Ls+eKnczOMmVGmWFYvO0/uRtifa/+vsKPj82BPxtWOb2XOwFeQLgIaXGo5SYtxyBOVw1KqYdqr8E1y+RyrhoPym7ju15WBZUrqSirqMy72qwOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmHI4wUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgL5fCj0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmHI4wUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgL5fCj0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kHwQ2999213
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvFhKVI4lkCsedzrjtoN/EvLmnSUYjT8LaUiWGuOKcA=; b=bmHI4wUJQdGO42nj
	dwWM6EEdKyRRpKdX9HZQUKO769PHEDw+K9nQco6GHnoDz+hV0xcvCxSRk7HFXfKq
	gZW4wRmXOR+ZMk5f0rzQhx9Es56J6rTR0rP1taNcv5Nl79Had+CHVs6T9x6odtsu
	Lco1e52o3pYWrOmhUe6ffDgEDxOMh7ifMfNP8BelF4qUW2zwGOkjCYY7uNm68hW8
	whIix9kTcSW5umMNskMomXck0gPDsESGBb8R28Mk1U9tpbyJEqMC9j4kry9tKFcR
	xi3Rcaq8OOxFEflTD5GRNv3wQBp/Jvtr0LCYz1JNaoOfOEIqQaG3kwGIbR4tw8iM
	2EvuzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0vrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:23:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso60379885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792067024; x=1792671824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvFhKVI4lkCsedzrjtoN/EvLmnSUYjT8LaUiWGuOKcA=;
        b=HgL5fCj0hvl1ib5GiNy6hcR8SLTuyT4oGXt6ddbTTpKPF0KoMUU0dsWA9o/D+86Exa
         SSSY53XlXQ1ylpMBgRmxNHyMeUSAE/WQrSyKD1j/GmBVJU8JMRKWByOWE4GSDyyJCDFC
         11TVdqFVt9E+nLShXzMzbq3gVNSi4Vpj8RugQNg9uqis4LXw583Lg3u6LjGqZ4QKK6KI
         HRXlrk3KkSK/vOUxnGH4gri4/FZM/CCu0ewUUDjcwNvEFEqomkd35+u1wPe0griUljT4
         tNwzl2GmrkF6BG9VPKf1HG/hBHiA9nngh1gw9+sPoIErla2M3RpOihLxjBfZ9+ohUV2P
         vefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067024; x=1792671824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvFhKVI4lkCsedzrjtoN/EvLmnSUYjT8LaUiWGuOKcA=;
        b=00oXWfnnFBhy8FMMlnnO0DtiGLTJDpODfKEWFLDZSreNhJS3XiFI2X7kdRiO41WA5Y
         7p19PaFhDNUxPC5RePyrh/rHUZyaP/ZL3Ld8EzM178gTQb4wGqWteaMAOaHOtCxruUdG
         KGV9j8khrhaPcnC/Mtnsy7lWNjRa1zifJ3wn07Pai6W1/jIK9OLhlxdDf4SnJ2JPoJmH
         6ujXsez++LmPgyWkrL9XKBtBBy1E9494e5HA5iGfZ3IJD3NyrJ1+9Fkh7zBCSp5W8oFQ
         vNrdqCNdClNtZJynubpbMblMILn3wlizrVJNdCfCyotBLjVd56iOm6zO+ihUmfgkyYuR
         hEOA==
X-Gm-Message-State: AFq9FYKYOh+gHJfdzFyZwqaF8/3jAfmUbRblw3P0Xo7y/mGvtYlk4aeM
	ygvFCu2078R5gxYmIpN5Ay6dUNAo1saPuTHrrFvtj0h2yfbB4jqH1GGmOk0YEPfZ5j31YTsq1ps
	nFdQmIDKq3Ec1CO34+Ur8lDUHIUUeP7b5mODjWCF9imEhnpOsYVpZzSzRKhAZiVta4tUnCGtAFR
	vR
X-Gm-Gg: AYBFou3GtGTmDdFgpxU0Q7igpkx4xmnhH7ClGobhvWZb8gAHS+aEbsZeUfK2XQkFoKp
	//KLu+02S7IImUgWrgztf3U989tH8jK/HtS01q2LDLiXzYll9UvDb373GNVqAfzdFD49afKSs7B
	OoekXNkipbmoru2sFzvDfnJeajlQTXgg3aoLDzraTlxXlgT+flA65IYRNlGuI1Nm+LrYICx3Rpo
	842iHN6yCnJnKv/UiZ7OIEoe8bD7GN8agdlIA6niQYbYV2YoUo4s8u+6EquUDJMWPbgIsPPhNJP
	8xDQRu+2wjnR2hblaAm6B+N4y7aQzdwI6bW//d3Md1fpIEA3KVBj5DWJOeeKBjeZt4zwIVroMlG
	Bs0/pKQ1t3X7l3EW/JcpXzQ==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr3138020885a.0.1792067024413;
        Thu, 15 Oct 2026 05:23:44 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr3138015085a.0.1792067023825;
        Thu, 15 Oct 2026 05:23:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cf98sm117559366b.13.2026.10.15.05.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:23:42 -0700 (PDT)
Message-ID: <2fb64437-e5e2-4c32-8ee5-6e81913789f7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:23:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: mdt_loader: fix off-by-one heap overflow in
 segment name
To: Kenneth Kabogo <kennethkabogo2@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260912065651.59968-1-kennethkabogo2@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912065651.59968-1-kennethkabogo2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7t9dB8DVucd9wOk1DuoxAflVZIrIvHCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfXzVfrBuS/2oXW
 5b+Y2xew6AsXpAALgJBBc34skTGNfnPa8Eyj7n+qV5omw1pXhVt+e8uF/4pjjsg+X84XDPnMcyd
 H1CWvU/+FmJWAihRXWs7JnIpQ8Iwyqa7t7lt9B8F6+VTGjCMhG+wWTj5DA7Eu6xmtH3Y4tFQ8U5
 eUa9qeVuYB1UyyB7bfqYhJAJGNzeimNbsgakzCzjWSpbLXoTWbDBep8phLi6O4Ew999xxZDiq03
 tiwuHkgtqqWpgnMr26gAADE+CadpO9nri8wCV1JY+3iF0BZv7kRNZT3U7XKIhB6u+E70dvI7Q/N
 tJFZMk1Um0oQMMN8qjOqAXZQFfFHzJ4UL7RozqFh8crJLgjDWfreknlRLm0d0nt0I3GFds6FyLq
 GVf1SCqeAXk+ur+9Gj86/mMc0kS+VP9olr2Gnh2OmI/dW8aeRp6JK1v9XHzWZayA1xGnNjxigrn
 CJOTcRw4oloBTvNcmuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfX0/TjDNW9VE7X
 5QOEVHXQHR577otxQLbP8QA41GaQTggiKpZuNLzLjVwM7M19teKFthQ8ZcV7T17Zy5GnQ+sLD5M
 2MAy0LFErg3fCwA8dBYAkLDWu8ZzOCk=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0c5d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GfdbEUfwneyheCU63SoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 7t9dB8DVucd9wOk1DuoxAflVZIrIvHCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150049

On 9/12/26 8:56 AM, Kenneth Kabogo wrote:
> mdt_load_split_segment() builds a segment firmware filename by
> overwriting the last three characters of a kstrdup'd copy of fw_name
> with "b%02d" formatted from segment. %02d is a minimum field width,
> not a cap: for segment in [0, 99] this produces exactly "bNN" + NUL,
> which fits the buffer, but for segment >= 100 it writes "b100" or
> wider, one or more bytes past the end of the kstrdup allocation.
> 
> segment is not bounded to [0, 99] anywhere before this point. It is a
> raw index into the firmware's ELF program header table, ultimately
> bounded only by e_phnum, a 16-bit ELF field (max 65535). The existing
> check in mdt_header_valid() only verifies that the program header
> table fits inside the firmware file, not that e_phnum itself is sane,
> so a small firmware file can supply e_phnum > 100 and reach this path
> with segment >= 100 from either qcom_mdt_read_metadata() (the hash
> segment scan) or the main loadable-segment loop in
> qcom_mdt_load_no_init(), whenever the image uses the split-firmware
> convention.
> 
> segment was never valid past 99 under this driver's own "bNN" naming
> scheme, so reject it outright instead of widening the buffer.
> 
> Found by code inspection while auditing the Qualcomm PIL/PAS
> firmware-authentication flow. No reproducer beyond code inspection is
> available; I don't have affected hardware to trigger it on.
> 
> Signed-off-by: Kenneth Kabogo <kennethkabogo2@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
