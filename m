Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398744908D1
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048485; cv=none; b=pcDvLf4+80g1mTJGLkDm7yehProuy36gzEHzx4GOl30VjBMrT9hppYwSwmbdb1a0TRBfh9KMnfHcLQX9mRrU7nRX+f7LkItBW+p+aMz+JoKDEjJNYiZZ7rO4CMaqlOF+Lt2zu5Z/94jZDbOxcZ0neUr9LNQMdRcD7X6bnylrXcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048485; c=relaxed/simple;
	bh=uko67U/o+/uE1QxwkAOnARE2HDN0VUWZgA6HGN5aKVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgbyJwzxhmkmingQAUIZqwJiSmIW1KG7fFoeqXcrPnd/ke+TTwN8Qb9M82S2VPaH/zg7PU59BM71k64C4gh9Yt6uALV213MnNRJ1+/mgXcwzktb5zk3JQzc3Kr2P8PbyhKMOdy4HTG8d9Mnm9zCt4ZJWvBzApY0g9Y3/QTnJA/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTD9IyRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7opBr6s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTD9IyRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7opBr6s"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2CsSI841915
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=; b=CTD9IyRazc3AEoBL
	FWTpki+wdfWOWtwGXQbVlwKeTCzDT1PUHWMwd//DAIBTtTeoJm5c28k6RR6cpLBa
	a+xDsTUtEiZ1o8S8nhzp/vQXfOsKBubqQvgkEgDatB/TtRTAemnRUGPgetouy9en
	ttgJFvPR0Zn2j3tbogHMTOhQGDIA8HB8vn0fhqYHKUI4BFakGuRTYRpdaQfSwqR7
	CQ+99kXf5cTyn1Uk9tqSEbfdLSmVz0r/CNsfX0iRY9FHCVEpLWA6UvxdUzswWgfQ
	EPQKlU+uX7rEz+r6UG1CGF4tqb9Ju8yHGwSz5N3F16zalFwOi2l9btbBWohWN8T2
	Xdf1TQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wtp80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:14:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso7895233eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048470; x=1792653270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=;
        b=g7opBr6s6S3oP1cgukXXaC2XojmnErLHojkRF3+SxkPVpTO5wj1LRSZ6JH6xqwk8Bo
         URsuBs2rJ9LSXTdheQBMNwbBiZs00sAg+Whh2yrPEF/GVNSZfRQ689jcGn5PUOO2b9g8
         q7fVCNNz6ilJA26jFVLwbK5TfkEeS+wqDyFYn/AVykPTCsYjIeTZ6lPKzub0pHU+RRB/
         69fvpKuHjKffW/b0yvkRROcM8/+0yaOlkmeeu/QOZQS18wyZ1hzGlapxdgAloTicwAzO
         P6uOLa8sJTEFYKdkIfg/JvGS/ukbBZKZgURZRJ1kufnKUZaUKVkVxkvLG9Daw6KwDkT+
         efog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048470; x=1792653270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=;
        b=jS3MPO4DgZlj1XD9J8N9tRKfrEA270xxmrtQnAbOHxAKql3P6YpYfntnRlmqVmv8Ft
         P1zVv52CtN6id73zlT5FgCkY3CvGcIuH7hsWrEvV10+T1QghYNvRS9zyOdO+RwhdFbwW
         cYzgF0Rdj+OotaPgUTr85Rw1tazHHDu/q9qzqyabtVzbFSQ07MNNdMQYLsEJTfYjQ5Tj
         VXaWoH7oq9Sl9SKapQnqxfyuB874vHlY+Aj3MXYeN2XLkCJvSAIXQfEm/1luhwQUaWum
         uOzIVhQ6o+21sJHT2V6HOplb+28Zz1XFh31CzMyNgnGUweUQCS3iZ/uV5TK1kJ2pgdEx
         sbSw==
X-Forwarded-Encrypted: i=1; AKwUvBxCHsB5nLsHSab0XeryHVyapx+AZDiInIEkly7mx8Yi9+UPguR6gwrD2sOKc9Ab2lAMKYxyBI0HSGzZOouk@vger.kernel.org
X-Gm-Message-State: AFq9FYK/1PK1AEJa9nXAlX7g9MYtCRQ4kBtopVPrC+F9awMgUl9Jo3/c
	71kYnLQXAOcrL9+6Y+AX39SLqCvuKwXF8pjJ0HgBH7jl3EoHxcb4DKo1pg6wpwaWaCIguBS2EZf
	UdQByYPwnAWqlvHnB7Vw+lH/9KYMnrsrWwMU3JrnTUbqgHqoYfnhRfEmINexak7VIL1baDFL2G/
	vx
X-Gm-Gg: AYBFou2PS2TJ/Q118Ps/obT41O41jSJ57AWdmp4w8lAOzQpAubY8U3jJtyI0hjpkXE9
	DpADFbJ7Ipvn24PdkCnEPUwKuBTNRCc8PU/11G8lK37shdoLKCnDD4uZRTrJlp2CudZ3Fs+yg5j
	j3hHP/87r9RT5Vl74igY8m25vbCqP1C6+VrycH3BNGipnkV80TbSPLDs2aFjwY37US1WmRVl2N7
	7Ik3HeQb+K169IASvrQmONcZuTb/RSNl2XdMcJvmwoZpJiyiSF4wswg1eOyMBFUhighYUdNH2bb
	23TfIYHxAxfxEzkQqPBQYJ63ilY51cYAc9dZOfXQMVRjNjS78WsP4fbq8Kr4T29YMXEqbM9PCNt
	4RlpMbG09Yrl0zbEYpoyRPQcHskQ=
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr16226417eec.22.1792048469374;
        Thu, 15 Oct 2026 00:14:29 -0700 (PDT)
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr16226373eec.22.1792048468803;
        Thu, 15 Oct 2026 00:14:28 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm14059954eec.25.2026.10.15.00.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:14:25 -0700 (PDT)
Message-ID: <0cb8005e-964c-43e2-8e9d-4e955cf2ff90@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
 <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXwR1CcVpjEHx8
 yzEl+kbg2h4Vn7ZxVWv3PWFIiBaF7w9p8NFwEARV0bDHM16eBAQsaQQxrCqRaHI1EfTd7T7Zwfo
 yqTvoJ1vaLUxZtBi5Qn0YeOfzU1pmeY=
X-Proofpoint-ORIG-GUID: nRb-CeTIzfK24meqCGugZmnamGQZ3jsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX0luniG8NqFbv
 puk/v6z/y6hol/S3WBnTUb8DSurg5YxxDey2uwzVv/aBpNGuhzjiKNcfDmGDuDsPJEZ3HGX40o8
 bDIoJWSp0Tn+/Ee4YOLmEKtPchoh3L1YMQj9851tBEFwKHcM9jOOZ7CxA7py10O8N5fPHOKc/y8
 7Ph6MoNIJ9MtTdGv8t0QyJ2tkXh6/mcCST/b2o8KVA9obKCXxYeaCb6OWlEML2HMElt3P45U3cs
 r1HrAzFZ+ayMeaFX3kWNuFHj/+phrOBglcpYWkFHjqCba6ErVnXIHGD7sCHEcXpm/Utc5wRonBr
 LLSx3ruLYgSDLl35TU19T81czCCy0EuPYzyzE4BY1/o9TNrlwmBm0hyC3Xw+M+0PIswOJ0EAWpu
 1i1KWgxPancZqS8rzjs91yKu6YsEU6aGzmMIs4HdgMyEUAJL04etrAzk8/PSqMZrdVmL1s9m5qB
 SomZwsAQ8X8EcSlM8qw==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad07d56 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xfIMX-YVTLGOWNOYmacA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: nRb-CeTIzfK24meqCGugZmnamGQZ3jsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/9/2026 4:13 AM, Linus Walleij wrote:
> On Tue, Jun 2, 2026 at 5:22 PM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> 
>> Add the gp_mn pin mux function to the TLMM pin controllers for the
>> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
>> divider clock output on a dedicated GPIO pin, allowing the clock signal
>> to be routed externally.
>>
>> - QCS8300: gpio32
>> - SA8775P: gpio35
>> - SC7280:  gpio60
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> This looks all right and no-one is saying anything about it, should
> I just apply this one patch to the pin control tree? It doesn't seem
> to have any dependencies.
> 
Linus Walleij, sorry for the late response. I will split the patches as
per comments from Konrad.

-- 
Thanks,
Taniya Das

