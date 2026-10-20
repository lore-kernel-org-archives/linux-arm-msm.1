Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503843;
	b=AT2Te1RpCP0vllQJcXYra/Axi5VNWsVtNRyTCoDxXZP3+beZKudsWkP1qwFbx1Cl9zxh
	 YIrcMszbmjQ26lzYgzj48N1S1VCzyQ3Rgl8JcxGElc/Xu3n3RpdjSQAHm0dhGHesh1iC6
	 zbkK5AGUOZFXL4u5tLe+G6Q80Je31pfn9CB0NfTDGttFfTG2VXuH3qJG3wnTm0HgK6/xN
	 tyxznCErXtf/wwzihRotg8aMbMrkHhNBwMGNKk94PSpPHmw8eIyjaFmHnS8JMt1W4dqzj
	 bEoYtYMGd81/VQrPyS+uR4DbLY7O7gZTKwyrvszTzyk5RNV/kLTcALm1B3fHMKqrM5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=;
	b=X9OBq5HVF3YYUngVZFS7kU46AqyLXATssbSz1J3PsJTTkju80AA7XSzzxqKxPU320oRN
	 YYCU/Q0eW8kRNEREBARoPoiqMaJatcI88K4ne5z3Rz95i8UpaILMA9Xd11zGufb+ZZd5m
	 AGheyB1XTkfzVAl94SRb1Gucu+l/7Apimgb11t/KWIJsgzXGygdPDWCZgC/k6SR4cxDTd
	 llIFcaf0DD7//SYaqeXwcDU8ibXOMXWAZ+Sv6eh5YPYfbgiqTs1mJ38mVM3jfLMQ42Fzn
	 2tfjfNifgQZYr/5PoYRI+QnwNVWsOnufgd9dDFM4fBjZKm4xYFw1Zciu23cmk4vYRag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JpwEQU38;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvI3hUCR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717E606A33A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E717E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JpwEQU38;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvI3hUCR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAFUL1430001
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=; b=JpwEQU3882d+dIg8
	ktMu/sJh9xwbtTmoE4Rvhr7dsQ32fpyggNlA//15UwZd19H1RfvQ7BKXHCUMQqGY
	6RbCbtJDFo9gA85KYtsVkYnUvNsNRtwyshYmgvxVvVeSCBT3k3qmQUxHBI0nL5Tn
	zuxT3HThECAQsniXfUqtG2LXHIZADsQNO3siSb2PoPi5KcxBjawbLKwrAF2vZQG1
	lPW0Q7RILtqOuvj+9kWp9oBec4Y1oQS1OVMyQj2cIIeQqdI/FtT6A3GCl5wZjt8t
	bBkD9Fwn8141R+Q0qqR1dICdFKs2fDTZan8BJxpvvfKQtHClJsvXKtMlDNglpfzx
	Nyj9RQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qapvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:44:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53389750985so5005301cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792503840; x=1793108640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=;
        b=AvI3hUCRr7cAp1J0PdSuCd/SJKlyeWUy58WOZbzwiClL+vLVjBnBUWX7B22qHWPWaj
         tDw6G4CXiLmBZz4IZRHO082ert8T8jAUPTPhuEKdHJ5IiPHvlgEJrjWSHtMzkLGaSbFQ
         PwOTpYDuUGjfU9fXZMAfeNCjhx6rlFTab4Xb4FPXVq9Gv0aYx5rIp5e3uzQda4lCbael
         6gE/IeooyYLmlIkZdfX3wV814sw9s2K4GOF6e+9S8hzQOuSBT6JzsIvGNtIkWsL7zf6y
         dtC0eBZRzwo+kerTbLHUlZCbciyr+hhd2FVUyiKYImrvhq93yag2db1rI+sN4cLmjOcP
         Jdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503840; x=1793108640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=;
        b=JG8pjERXLZ3IounWWL2LjjV1MpxqnMpLfSA0TQMSBZ+MpzAHoi40mkHEc3M2QFSBaH
         lHy0YXq5vStoF7qF9imFi6tPG5mQ3GxmBvm2c5HQN6shskyd44Kal0DkPNjiH4fNX938
         J0IfiiTYvb1NYFvEzsnRguzszScBKilCoZVJUU4YMciT1Ex+pyGmspGnrNLA/tV9LY8p
         WgSWg6GPI1FGc8Fr9Z/Nk1cfpeSKWQaLjgLkadcNxtKer9S/7PFczIbwpYVy56Llptb4
         ulQm67YWNkpu3+3kKOtCDbPS0AaGDtBsdwfVnU9BWHB8mmR9BomNpcbyE7C0blNt8F0x
         DvfQ==
X-Gm-Message-State: AFq9FYKF6pOnbIDjG3PEKHWK7eAvHLQ9rVjWuPR7MXPrR5Cw/K9oIgqY
	X8CFsVqlo0bK/nWly1MYFxTjyqMpubZqQ9Q2yzUuoXiIPVq/Xtw84IKrCL8YcnDgcQpr2IdMb6A
	KjWhScGIK/p+qluDEi+6TycTZEoSsx7End57fB3KcuXk8AIFeEziZ9ILdizAQ2g0f1yLu
X-Gm-Gg: AYBFou1BiB0n60nyJatTkf9qsL40WnMpbagQk/dhcq+b9EHseBPfcfn9sBSoztPT7Wp
	X66+B5uG1y28Mo+6nsrwyYe9Id4ii9fR8nM2DYsjS0TzvAS4NKALlvSTlSjvzO6OM1FSI8UWe7U
	1eB8NR1AXyX4rW+lIWm/3lzs4CvEsJNcuVp2G25YmsjG0770KzD0Uhoc57ZCMamMSH3WFr6qYcQ
	qTbIbRGQ/+w8fOUM1V/YFjHcW21Zzj9lGPoxKtwMomptounSPnI8ynQzKajG4AefJGMA2SO/ioz
	V7wrQXFQXqg8cW9iV/1xZaiM2ZOzGMuAxEsdM7n6D6qeSAgt4RYrQ3CyU7uJgUUXquAIWvMBOJR
	VuPUGJredg5xw9e47T1Cs5g==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2180702385a.3.1792503840173;
        Tue, 20 Oct 2026 06:44:00 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2180695485a.3.1792503839596;
        Tue, 20 Oct 2026 06:43:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1337d2sm5441811a12.1.2026.10.20.06.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:43:58 -0700 (PDT)
Message-ID: <11891012-6a4e-4d7c-8155-cd8266e00bc8@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:43:56 +0200
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
Subject: Re: [PATCH v1] arm64: dts: qcom: kaanapali: Split cluster power
 domains
To: Xin Liu <xin.liu@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
References: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EPG8u1cHFRirU_xD2EwYH7fqmSse9-e1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfXyx+Ns03XOd2B
 EQcPlsl0DHTLL5bi5wBlKiQQe1X/YlSpF/eMNf49wQqrd9VB2mndell7hXcxWM4Jmd7SULfJWXJ
 fQTy/HtIiX7nuc3bEGVw0CusTwQn0L+VwgcqaZ+sK/m1ZTYAUzZGyjJSat8HocR1tCPYeog1I6H
 jicSFkHmjY0VJW7rT5vsgO+6YFlw4dSI84oPLbSQ6U+2Beiyj7UcCi6XXc5W5tZe9jlCdepJaIY
 aa46mqt3PrvG4GBMpq9vhaVKokjG8SFh03nFqQ5QiflCCVkqiff+ph4e7j3Wqm8FzlW+1rt8365
 SwaOSActvAvfjcFSIauR9A4HjwKR22TKLXgcW3MiSvUfpcaFwh3phAyeNoQYeuXTC5FJIkKJ8DS
 8u2/boXR3AJ4ahSGg4anN2Ioxs0I0zeifoPxGnJqygkxrdpDzBT8ztG1iGrvOtHqTVbN8Xhj25N
 9HKHBBKj+DVnwJBwbuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX+9jBxfRk2bjw
 sDhYkgHPwCzY1aygPaCv7IOT76KtUvtvgIkgjJTi0VEr05pxCtKyKkXhGBPOg2fIMczeGX2/ff7
 LbA4VCfj2sI76mfZMnisJ/8CjMBsOko=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad77020 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0piBkx7tkWQQxamy7twA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: EPG8u1cHFRirU_xD2EwYH7fqmSse9-e1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200054

On 10/20/26 8:37 AM, Xin Liu wrote:
> KNP has two CPU clusters (cluster0: cpu0-cpu5, cluster1: cpu6-cpu7),
> but both share a single cluster_pd. Even though their domain-idle-state
> configurations are identical, sharing one power-domain node means the
> kernel's PSCI domain idle refcounting merges both clusters together,
> preventing either cluster from entering idle independently.
> 
> Split cluster_pd into cluster0_pd and cluster1_pd so each cluster is
> tracked separately by the PSCI domain idle logic.
> 
> Link: https://lore.kernel.org/linux-arm-msm/1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com/
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

