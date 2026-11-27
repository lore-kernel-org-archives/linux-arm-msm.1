Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787067;
	b=UFhjdAvOPlqhZfHzD+B8UK9u/lHyJHTuMPLX+BQY37qysuRNC+H9583T5ZSGaWEEQMk3
	 xFqXJdKV+2x7WXfb4h55cFcSyM+V2IlUl5Ta4sYNu+/eygZUQZ3QkwtM2li6FNLdsEMiQ
	 eOZNZpYSY3quR+wi1BNPcArbeSCz9qIidyhOJX48Q+7bxHAtT1ME/B3RK0HyC+y2qrOyJ
	 t75yquYdJNAY8fEqJRwIAcPjcnV4BPDT4EurWdE13iTzCHdwkBcYRkVlChfv2xmW4DIFt
	 7UOZYaTkAuDn4Q5OksSYaqRKrPvsEdw4E/opTNBwPvytLC6o0DCySMgJCsJBOSIRZYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=;
	b=1iCF/CThu08tM5x4Az2/GV08JEY+bgBTIoUkK2Ghoq+6wH9J/TaLzHZ/tbwa/8c6XO4P
	 bpJXf7MesmXxwvOYahMfKi6CFF8+NjhzKfTkcueyZfBIGY0LpV0XLk4JglDHzR86s/QCr
	 Q/X3abV+8MdERnaLMeWxyA2CP23/tt9pZISmk49zQ+9XtPEVUcVjbyKYoke5KDZj6NcWd
	 h3HS988OvTBJUc7bAAiypLl/PobzY8TqeLqlUnmv5nkdSPXxpKLrhrIh6F6OQFeFNF8bF
	 Ph7181mWM634bUjh/QIReAjApk35Zygngzvgj7anDxWULoPPZsoad3H35oMB2F61JYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GSJIpg2H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCuj2qrz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D111C606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D111C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GSJIpg2H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCuj2qrz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChI3D296663
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=; b=GSJIpg2HkmbXyR5d
	gXUVpvYlb/zZtVJ7dApCh/h20h5y6eGTepYFjdVYoCR9j5I6WqeUVNdo36v+AoWR
	NNz10/mbAlpD1xd0NmM8Mb8JfefU32GBlavkc5rf+CtgRFO7wwbtGrH4fzDKTYFW
	J0pZt0xjrAnuQc6zLAPyHbxCVy+y2KMtNSV+HjLi9hNwiPv6t02uRrnsXaezBAfV
	4lS+pUKtzC0q64KGVPBdh9XNwcPPUISxLxvJ9UBFalb7Neqtbyi6r62LHb8PqWDQ
	TPL1zuPd3zV/TXXHLEeZy1uuHfIsyBLlUN7Z/mJ5HkId1n6qrIbVjXEr3OsTCJ2Y
	C5BDBQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6snx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:44:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso12639963eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787063; x=1796391863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=;
        b=FCuj2qrzR0xLgI0qR78VUrw0zp3kIxLkrgBltQ0Q1B732mA9s70tjKcmgQ8zlGAp43
         t6+eJMPK6VRoa34grrWCfh6361gBiVJ+4f5VMSRTiy/RuSrjCrGL/NUnN588P7SvBzcM
         WCiuRs2V6GZoyMgRdTtmeGxrmqkXVlPikIGK0WB3Ta+yvAfL2z9Fh+cRHb4XkiSWC4rm
         +ieP4KdrarPCqnOgeEoV6irs0dtLS2tqvOF5PWYD8hCljfFRFXPgX0wquPtwP4YJWa0w
         SPlzDSw5nVJJlbFdI1FJM7Mx+OCYTSXYLzEs129pqPNMVIMvomGzhKaTwwrKF7ZCEMOd
         xvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787063; x=1796391863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=;
        b=sbEeWihW8PjWigZCpVS2P4S88x7TLDZvfxlg7PmK+1HOlV9blNm6Af5divOsEjsiji
         jwtqYXGgVsD2oystfFizN9DnMFfZ42b78xE/5YoNtOe1kmt1+ZLcGj+C1hkYSOuYQ9vU
         +8UMrYQYZ0y38/x/+prsRNqERcqM3gQoCP1GgMC2FtZG34zVpdLaQH8ljlCZg4lNOdeM
         RDXRsKa8PrSWJ3RmpKXlKBeJwCzrP899toDwrcWwvzJO8sdhUwRdwJ6FsDYd39u9zUdk
         Ga6iapjrNA5mokr1KnrTXHFnMtOOi5v5s9hqCPFUY5My4ElWdcMCQZdng26hRjE6jySm
         JDNA==
X-Forwarded-Encrypted: i=1; AL+hErHtU2a98dT5LbSlcd6dRxrKD0+K6nsu9miKtrxSgSmbSvlfCiYXLmr3mPCkL3fLIsKVgygKuZ3Z0rXtuCqz@vger.kernel.org
X-Gm-Message-State: APuU4Z9B1mMfM+ODCYXSPbYXgG6thF1YxeaBT4haBA9VzqauJBCjLalv
	2K7B3mfMvU5FXQmyK9e6/bma9IUcHryjxxxIutbZh3OI16uZSs6xVhuzsL8m7gYbNHvSB1s77B7
	Zkd+amhysKvhSk7yWLKQ4mpEgfyqY/cYk5ZznzbcrKzaEX+FcgxLqq+fOUN4rGBpVl/5y
X-Gm-Gg: AZFdTZcElk/WYNle8JBD8+DaUeSFVC3CSBUyi/MoH/b6YCyMydwUGPYLT2/oQxoTz6W
	/i4VqPv4O4f7jt3tiuena/OwcHrr31rhWaBNr33kv6lA9geIOe0lIdmz9HyEquU7IBOj8EZLDR6
	xkk22lirdCI/+s6UGlWUSRffKCV0WBKfkZgHq0yv9FRAVF7DLVust+FwPN1XuL1h0HLIvwV3xwE
	MenhtPVicAo7CEHtKxaIqxvC65MbCkunI+fdrB4avpYuF5t7juZhMPYwPK/JmDOuZxy67peLa2y
	rYNdgFMZLdSU0x87B3Anozarsr9euHIcRA3E/qxb3QE9jxP0WAemy+i0IYLqkdQw4uLQ7SlTLe3
	YnqK2kQLLXuI4/3Losh0TRVBqym7W5fyRfIDHhuh1otuqTxLQARWynQDNytPH2IOCfCnMFAOas/
	sR4hSy
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr21345078c88.29.1795787063352;
        Fri, 27 Nov 2026 05:44:23 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr21345050c88.29.1795787062620;
        Fri, 27 Nov 2026 05:44:22 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm57734614c88.12.2026.11.27.05.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:44:22 -0800 (PST)
Message-ID: <904e456f-6e36-4ffe-8383-0c509c52c59b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:14:14 +0530
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
Subject: Re: [PATCH v2 4/5] media: iris: Preserve timestamps on error buffers
To: Xilin Wu <sophon@radxa.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        sakimidare <ssmzhn@163.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
 <20261127-iris-va-fixes-v2-4-385e8636c22d@radxa.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127-iris-va-fixes-v2-4-385e8636c22d@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dKRQEPuktmwCeiAC_y-YKogBZM16pGje
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b098938 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8
 a=WqctcwEyiccVfxc9fK0A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=cvBusfyB2V15izCimMoJ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX7S0XnhaNJ4je
 70fso2eVgborR/OAHEJoa+hKRZ7RC4onnFdvwhJBCkle1s9E0nmXAp3LfdolA5+H1L3odg0Py6f
 MzWIGQj2NrWLIyDytmNEmzHrOAdPG34=
X-Proofpoint-GUID: dKRQEPuktmwCeiAC_y-YKogBZM16pGje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX4w4lKens0xxE
 pbld+5krdiJMVziDo6cvvvRhrqOH46tzMfzfGrFN63r2EXxtDgipYe9KeffMaBCMCaVOHo3rNHY
 nE56zewPhWtirmtU/QBI1Fe7df1D5n0a2GA380yopdLDxuKitJA5mIcDzHk41WHyBFlTiTSRJPh
 fMIJe+LFkKHaNzjjFI7k9cCBI0HUbjDPLB2nRpyQ25Lx9mPYjfrbTr2k9ju3Gsip0YtQXseAlxz
 TcrhU3zTiH4vR9yC63/j27M+vewOg91E+SfOTu347c5F22s5q/uZduOxhl9O+9iW/yOkYUNo4l6
 4QHltCnX6JlKPF4kU31HzuQ60zUcsGnO/Z/rGtGHEL2NiIYgPpL7/O2s+7iWGwYmjY+g+oU92IW
 7lwAIvnMBrFcxZlrdR8WpvNXf6tZEc8XdDtyz3D7BFf0KYvRotoz5c72AMlBTIrHy8KhrLwbgv0
 zHoiuZLglK8gvslWFoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270054


On 11/27/2026 5:10 PM, Xilin Wu wrote:
> Clearing timestamps on error buffers prevents clients such as libva-v4l2
> from identifying the failed picture and can cause synchronization timeouts.
> 
> Preserve the firmware-provided timestamp when returning an error buffer.
> 
> Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
> Tested-by: sakimidare<ssmzhn@163.com>
> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Xilin Wu<sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
