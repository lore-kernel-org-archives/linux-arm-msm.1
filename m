Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BE744B662
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434219; cv=none; b=vF1C9J9OmUNzLD7Hu0CgZ9rxsdH0k9BewFQap3jd6n2+B2sP5o3JkJlnfOcalbz7oeff+llAzZIJU5gz/djpXdAD2BgEjCG4Q38PWuW8LA0nTHXaW8iu+js60/YdGBD+2t2KFS/BD54kaGg/P8YiykFp5ts3boa/loG0hvumFWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434219; c=relaxed/simple;
	bh=DOEnZDCGtJEQFIwvQ/eBcymfH8FFWd8Cs6+Ybr23C2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHFnEU22VNaOf7iqhG0p8RMxmmpmANhcLElrZwgFsgd2U7Zn6WPsj1Ea6JC6ZBEJtsW+kIIwPiu4gksWmBc7EDkI6RTnyA0w+PC1y347PQo+3bErxZ/9tWEZwKMcRg0QqvHQYsbPXSymB4nhvvrG7p2q/uc9o9eKOjPpAWqZ7s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iub9610o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c86w7zQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iub9610o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c86w7zQ9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHCxo162798
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUis2QM9xnepvuB3HlsDbxs/mCGH+BZAClAgP8cq7k8=; b=iub9610oCVRP5io1
	eD2EdPaOh9s0OF+FuCzdzEvyRO2nbcb1oSWsAKC5RKWzmlLBdjRs4/uAh4VGJTQQ
	5Wvyw2D4kANNKdxrJS1zABw+nm27BYHEbFqygHCHPqao+e0et34y3Aq/mWCkOoo8
	SSYmZR/gpB00tbs62XRqtonOiNHDwdTGvbidFhMBW1xBWzWQsVhkwK34FORm1T1k
	IAlVOHaF+TQHDtuJOUykvR0yPchfusJevDKUwUc+QOUB/lyItPxDvBURlus1Haiz
	OF+xBnIcy1OlDoNfx/axH86WNhUJ/Av5/QPJhsqKaUqVJZ0OdeJMvIuOHnyD2qjF
	C961Cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx08qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:16:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so43751485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788434212; x=1789039012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUis2QM9xnepvuB3HlsDbxs/mCGH+BZAClAgP8cq7k8=;
        b=c86w7zQ9KSB94YYMn9dHpBVR7kjEwfqFrkzGIIM6e1bYq+24o3zUq5h4wk3CveiiB6
         Lq9XUuY0yacT/TEFmVCVGtossty/ED85fBIDm9tU1M/rNP4UChnUuj74Qve2JJpH/KtG
         dy8/Q4aa66a1KhwLzICMdtSihoFA38gYic7mZr7eavbBWGA9YQsrrWhFlNbbaJTbZZHH
         SiJV25yBqdKM/HrUJsO140aId/aLjIdU8nlnMDAqw/cm3ScrIJMUhnS6D+hgX2foftCa
         uIlEmaQD64UZWezDuudfdUyEMfZBq96jPi7o/qhTpoTAu8U11mEmdOgZ9MdwNltIEkVZ
         NJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434212; x=1789039012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUis2QM9xnepvuB3HlsDbxs/mCGH+BZAClAgP8cq7k8=;
        b=rO437ekTYSKr98JRDkXMtg6zAuWTTcNBOfIfihv2wgchbp87Q+tu+rOgxMpGrZPuwb
         M5VJ35cZh35iBeCtN48o9xzSYT5lK1uemzmOf32nPSWJ8p+AunK49DEbNBF47x8rKXxE
         bK1CxrUCtsivaVlKVsQMcNEqMA1FCVHrU4adGcJeof5/RJtp/rX7OEB8R72IKJBK9aaE
         WEmk8TXSxW/W+LyNmUC7owsK0G8na1Ekng1WrA+ZUzhLSvRHcwC0dold3cWh32x4r1lB
         3rhau6CqNQgGjhOmHy14OxCmP9vBtplvEd4S+BhRtDcAi1H4fUsR7HbARFvbv0lURpQF
         PGzQ==
X-Gm-Message-State: AFuF++lUuccGG+G2JbGGEf3jUn47V5hTp/sivGw3hENjxDjEX5GwRhYI
	EVum+dTLyfsfIJcZdGEmG2kqTrZh/BX/IV+kyJexLtr+xTOFgzU+OGkOR/BcCS/5TnIkvfzN/iO
	pq98drJyw/zFzsEIZZjScYB6AQspQSzS0qLOQr69BIVu1s6+TokrVktkMM5qdZT81QrJO
X-Gm-Gg: AYBFou33lVfl07iuobZDtXuu+cmw5BdKtlGpYYfN41WaZIV1RBWLOhDcKQt4hsXMbht
	vtf3KnKPVZA+0tvZywQh004WsIpWnoT3ZquRnqYTyXpMds0HZ6Km1rGOwec69KmeTIftM9hlOoB
	w4riFKsPCbYfN3crKg90bKJ+d2Fo4TMBHi5IJfO132eICV0NaSTfcVQfbLApqUiprLmGBlFtuht
	eCNQLopaU3U4/qlCj4lCiRr7lFMfU2ioaVVIGEk5fkleDXCNTml+QVynMDsbF+eswwFJAojH4Eb
	mLq65tKL1m46JtK4JZRfZL5WAF6ltR9HdGnIE6J2wiGPd69HKFLHFjVlUG9hW9EllXcRMVYySS+
	9xRSIkDyr0sVKF4iZYiegbA==
X-Received: by 2002:a05:620a:470e:b0:939:5924:e319 with SMTP id af79cd13be357-93960898d62mr801699985a.0.1788434211976;
        Thu, 03 Sep 2026 04:16:51 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:939:5924:e319 with SMTP id af79cd13be357-93960898d62mr801696485a.0.1788434211575;
        Thu, 03 Sep 2026 04:16:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f95f557sm2248372a12.31.2026.09.03.04.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:16:49 -0700 (PDT)
Message-ID: <084cc01d-f4ab-4ae5-8059-6ffdc3564b14@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:16:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/msm: unrecoverable a8xx hang-recovery loop on Glymur ("cx
 gdsc didn't collapse"); killing the offending client does not stop the loop
To: rob.clark@oss.qualcomm.com, Greg Ociepka <greg@ferrisoft.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20260820154428.1278@ferrisoft.com>
 <CACSVV003bOJo4OJGvwHAda3h+KoiVJnzOqjwAVfjNG=V-V+RAA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV003bOJo4OJGvwHAda3h+KoiVJnzOqjwAVfjNG=V-V+RAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RCbeaY7HkEbfwOxCPf1kUVb3aPXZ--NL
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a995724 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=zXLAmZJP3ypUEzgl:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=a8UEx8NLAAAA:8 a=B51BwOQrpoz89OxIyM0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-ORIG-GUID: RCbeaY7HkEbfwOxCPf1kUVb3aPXZ--NL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5OCBTYWx0ZWRfX4ZCdMJXoCu36
 cjLhqHS6euO2D0xmrocArRUkbgOmPUI7nGHwK8Ga/0FzsgB6hCurW87xDIchfu8kLRl9bVTb8bl
 +tgpMegR54xcm8YKtzDLc1YlOTfie7x+q2iH42tXgI4s/p8qUcVfdHJTIEzmdPeh12B1cdZV+JR
 9QJdfPLwbn0e6GfV/nVH1js0biBRWbawLcKw4fRqp+utQY91WCXVydUxAz9p/ivf0+r/0fLCtFl
 obvJ7AElfG6ybs7FUgUjilpFLgRVb1gzgFT/+EaXKDEQNR+arRmSc2r8qyGmHQrsxHKWIG9NgKY
 +zleXIcM+KLx57ADmNxkkhp78X0oHVghw0RUgFq1H00V1OgtWb+Vj6x7Q8IA5UqSQO4Lqal/4ky
 kv7rfg3pBOn221T8Fn6FoFylbYfKwDKGNg7kDUXNiM60cUHA2fhvan+bQrNo0aw3/iR0mfNy/yL
 XJ056BhFgzXg7p3rOrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5OCBTYWx0ZWRfX/HoofSgsnPKd
 /R/vrzy4q2ZRW8kS1EQY4e37Rgp0ghDNnrXnhjnJ8sh+OJD/xWNmqv+f0suzGAWUHzh8C5iNsTv
 vftncCTX41UI8KAkR5pEIiiLy9YsvdI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030098

On 8/21/26 3:35 PM, Rob Clark wrote:
> On Thu, Aug 20, 2026 at 6:44 AM Greg Ociepka <greg@ferrisoft.com> wrote:
>>
>> Hi,
>>
>> On an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite Extreme "Glymur", Adreno GPU, chip id 0x44070041) we are hitting an unrecoverable GPU recovery loop that, once triggered, can only be cleared by a full reboot.

[...]

> Fwiw, the kernel I've been using: [1]..  but that doesn't have the a16
> dts. I need to move forward to something newer, hopefully I'll get to
> that today.  We'll see if I start seeing this issue.  Or maybe
> something x2e vs x2ee is different regarding pmic/supplies?
> 
> My device doesn't have the highest OPP (1.85ghz), which I think your
> device does.  We might be still missing some power related features
> that are (more?) needed at higher freq's, or maybe I have a more lucky
> piece of silicon?  Akhil would know more about this.  You might try
> removing the highest OPP in gpu_opp_table (in glymur.dtsi) to see if
> that improves stability?  (Repeat until it is stable if you have the
> same issues w/ 1.7ghz.)

Greg, have you tried this?

Konrad
