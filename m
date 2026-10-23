Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741891;
	b=gzUuvupQAPxaA0sM5hVeknM+tzLk5YIxc4it6WbQzp18JbaImWXiWqtb+qS8zZmlXZ8n
	 pnvmkoTPoSmry5W3D2Ligp1CPD8ujipfbK67c9MTmNX+f1ZyDwDPYBWzTN7wo9yPKtmJg
	 2HL4LxUwg93WhEojP/ukGn1O3Eo8bh4nJmSAIAOR3s+aAGZjuNZv6hg1ngdhpcucuQz8O
	 F+qu/O1sLuDJGIfhOmScMgqahWto9QJEre1WqvVcTDafLLJM6mbSE5+eQ3rdqjt4ohedP
	 SHnPmyZMrWTVYvE39QU0E+GWFPhdlGyVbIBajFH0HwLvNih7x2+a+XKpDXVIFZCu9qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vS/ME2K71CVY54JXfRvbX80iH1JQGzKQFtnWeCuFrAM=;
	b=QCo7xRFfoNL7peivggjLmLYzI+z6LGaq8uKJoiSlV6zWAXdWMx2/MeMfZPQVdd/Id9ie
	 ghsGYPzxXZmKvLwKlvcP6Orj9oktGxNjr9y3NfbsXgDpVsryiLhHkiLbFSlWCPZMPyvao
	 c7CJpmOMEm4zsJ0/XN3nPjxjDdawk6W/kB5WOl73Sghl7ilDSzm1Pa+T5mCHNxvlmf5rq
	 5JAwlBT35QRdF3uFbSRKLB/OborqhO5L8win7Ld9EkMs1BaiN0bB6uGc1VMXnodYY5fcz
	 jnGbqjW7XDaUcL5LYOJUid8ytpGOsuUB96sqXTPNf5+K2koroEiLruK6vucB7hE2sYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mu79e31x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=grqAimak;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395E1606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 395E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mu79e31x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=grqAimak
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FM7L1048184
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vS/ME2K71CVY54JXfRvbX80iH1JQGzKQFtnWeCuFrAM=; b=mu79e31x4fXRYd2T
	og3CYSPHzCky+c4Nj0dD9o2+aDAg0BsX36cdSA/0Ab3YjySJnysT/LImv64stOeQ
	MkJqaF6gCEevbhOU2VlmSt3y0hIH2vQC5quepz8pWV+JqFjNq3DzoFxjxXcHLTq4
	KxcJ6K/PHJAOy0qxkK2iE6X6VsxP53friq2UX1MAG2a+fvUrBBI9m7nqp0DE3Qzb
	02XhB7+1v8/C0xuVeiA08vLx6kFN1noWd3Vx+G3wpHyKbmuoaZ9RdMHL2QIWct/o
	YQjlhjeqjSeWXYja8976JVTj7TWNY12ZMCVTiGzxpdPHB3X1AH6Gz+SwNKdGpAh4
	s7rC2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbjm91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:51:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so16477685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792741889; x=1793346689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vS/ME2K71CVY54JXfRvbX80iH1JQGzKQFtnWeCuFrAM=;
        b=grqAimakeJrNaq/Hu/AkaF4owzpqz3DZnMLUJDo9WkUUjl0A/Uowl3EdywoueUErAt
         Fy/VGE+ZRL1/Ij4H/yrj+z0evNINq3qNh5k+/I4Y6nJgfqkVcHgs9bJIRVEPN21noCbm
         auEFOHc2dZOqHARt4cA/o6PzfI4v3xQXNdtfegkHR8mBK/Wqk72NEmTB/eL3LTBifE/2
         Zsat9TrnAuXXcjdem/7RHpsDL/xHPjNOr5YKTmZ4ivbl17Bm57yfYx8bAIMtHImQc5pD
         O+GTSKX4keWvdikMKVLXHvzifFiID7NZtfRM9JKllci4F6nL0/aSSJoVX85f7rC2fmVK
         LtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741889; x=1793346689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vS/ME2K71CVY54JXfRvbX80iH1JQGzKQFtnWeCuFrAM=;
        b=cZjrrnxssWVIE+NhigOGZIhoaEC1j4Nk1AkR/YPOaTauI0mG7LwEnKjtU669Ra4G5r
         tqaNTnFQ67hxE5dYQW5s9dB0fnKBiE0HsPnPJCiYCDoX8msmd2k2S1Ez+ITk87Oh7W9a
         VXa6jSEak3CiJEO3UitfgGfgE2aUcOQEmUE2pocqLTg+9HYX+QFboWF7WutvVGSgC83t
         anQKe3fzz0YO5Ai4ygXwdPbhr6cP1LGVezijKqfEaPjEIFuK/rpBdUNFkNRNxjCF5JB+
         sM3CmUJbzs43lD/VZFxMYJKVwEfRKqmYpZiY6w7roLfTE37MahhJfAYAiVReb8MmymwL
         7C4w==
X-Gm-Message-State: AFq9FYJOYLJEXTMFAt+Eem0Raxf4ytUPzQvTFCkkI9lRQ7gHjtgG5cGI
	khQJc6gvQ3HM82e/Ce0cs3UIEAKPjw7DKPRR8/7G6Ii9DuMUnKcCLrP4xiSBBzJwk00zBiR4MYK
	m2zpKg5hjonQM1e63eoST2SaRS3qP1BZ0zBK9CmlV3/wOjOldqw+7yEx0fFOjPc4u6BZQ
X-Gm-Gg: AYBFou1XI06TfpKuyAoY8HI+ngt2sotNbXxHf4CJiQm3TfS8ZwxwraEtU0RNTtdosKW
	a1Gilmw/1kEdr2/ejQiCX9aKgcVUYV69uOJejPuBFs6wjYT27Q8TzACdYO3DiGcsZziE/CUAi7X
	2kLvwDhKy3jnpL7jbvFFTzNgab0aQ3Q/qs5wYoFFARvcwc1VAqbMdgPhUjNUJmGuTmIWfAmSsyX
	uhCY5g0qdm3UIQwX+n3Dm7oLPJ/D7KupktFWQMEqPJntbNwhxMZTgRWBK71jCeBVGSLC5adJ/4Q
	iPXlfGmEudsMMoVTjjhuk6R7sm5ZWTdeJKq02j4jJSLvUWbHWpyY2PsnQQLLy+QMcrnZ/7M24r3
	yn6tQ+3Zc8RBkplFfCCd+7A==
X-Received: by 2002:a05:620a:158f:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f6f92dfccmr300565685a.4.1792741889465;
        Fri, 23 Oct 2026 00:51:29 -0700 (PDT)
X-Received: by 2002:a05:620a:158f:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f6f92dfccmr300561885a.4.1792741888907;
        Fri, 23 Oct 2026 00:51:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432cb42f4sm778056a12.23.2026.10.23.00.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:51:28 -0700 (PDT)
Message-ID: <b6980e47-710d-4e55-ab2f-d57ad5a1a371@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 09:51:26 +0200
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
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and
 questions
To: Jeff Roach <jeff.roach0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
 <0e5df58a-e97f-474b-bd3b-9b1a24ae0c03@oss.qualcomm.com>
 <CAAnD8RaQLxstSjib-521b9fTKgzDnS+x84rLZeEYT=M=D5f6gA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAAnD8RaQLxstSjib-521b9fTKgzDnS+x84rLZeEYT=M=D5f6gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX3pCookYHnpBw
 KYvTuQ+KqdsslrUglJYA3EK7CANqsQSCctfCMAyqXP+TzQHTaGbXz3F8mRkhiYc09tXfFZ+h9Go
 mBrCKMiJxz5j+cZAdOHdNAdsNF0KSck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfXyjykwXNB+XbZ
 kgCEWSR1KaLvSZ+MwrXD0P5hfZJ0rqYujFmmXBd8L/gbdaJspFsfjv3T5BT9Yd7n1g7p2jj9DGP
 8ZVi7p514MyGAVhZnJIDweNu4mM85uXeJ67TblsbvA/eed/9qzNMQfai2ETgkkaQcnEBnHnhnhb
 UbjY30J0L7hFTpR4MHaH6BQbb5TUL3SWQPkULMrvVqkILp/zfMas3uhBFy3x4EzTNqo3poei3Bc
 Zpb3VmC4tb2hXlaX/z2LQu8IN3gFAsBXT0ttvnS7jkgDB6CX+WCIDpdfV6C5mkpUTBs+aiumyrZ
 4Q4NKi49YWQdq3xcx+EYWvdZqzfwhbjix9NRKXu1HuvF3oSVeW1I2x/Nyd8jOZU/xX9YzCvWeDu
 wQGZ/q+19ZL36x988ju+//Y3uS8qDih1CBnXuOrqOrSf7Sh40lgD6YUcY91P9vahVzorywDM15F
 y7+7N01lLpd3l3ZxPHA==
X-Proofpoint-ORIG-GUID: DeKR7zbMGiyklmtgZG3AHskT0rGv6W6i
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb1202 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sjay6-vlHlI0LxQkin4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DeKR7zbMGiyklmtgZG3AHskT0rGv6W6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230031

On 10/23/26 12:22 AM, Jeff Roach wrote:
> On Thu, Oct 22, 2026 at 3:30 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>>> 2. CPU frequency. scmi_cpufreq fails: "timed out in resp" and "Failed
>>>    to query supported version for protocol 0x13", probe -110. The SCMI
>>>    base protocol answers at boot ("Qualcomm:PDP0"). The perf
>>>    protocol never does. The clocks stay where UEFI left them (about 3.5
>>>    and 3.9 GHz). Is perf over SCMI expected to work on Mahua with
>>>    production firmware, or is something else needed?
>>
>> For a workaround, adjust your config to CONFIG_QCOM_CPUCP_MBOX=y
>> from =m
> 
> Thanks. Before rebuilding the kernel image I tried to check whether
> load timing is the issue, and it does not seem to be:
> 
> - The Ubuntu kernel has CONFIG_QCOM_CPUCP_MBOX=m, but the module is
>   already in the initramfs and loads about 1 s into boot. The SCMI
>   core probes right after it and the base protocol answers.
> 
> - I also put scmi_cpufreq in the initramfs (dracut --force-drivers,
>   loaded before udev). It now probes immediately after the SCMI core,
>   in consecutive log lines, and fails the same way: "timed out in
>   resp", "Failed to query supported version for protocol 0x13",
>   probe -110.
> 
> - Later, with SCMI raw mode (debugfs scmi/0/raw), base
>   PROTOCOL_VERSION still answers (2.0) and DISCOVER_LIST_PROTOCOLS
>   lists 0x13 and 0x80. But perf PROTOCOL_VERSION and
>   PROTOCOL_ATTRIBUTES get no reply at all, not even a late one. The
>   apss_cpucp_mbox interrupt count only goes up for the base replies.
> 
> So the channel works, and the firmware advertises perf but ignores
> perf messages, whether they are sent early or late. Could you say why
> =y would make a difference? Is it about the order relative to
> something else at boot (e.g. a firmware handshake that only happens
> if the mailbox driver is up before a certain point), or something
> else? I want to understand it before I rebuild the kernel image.

Timing.

Konrad
