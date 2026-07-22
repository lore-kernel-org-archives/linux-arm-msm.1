Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B48233954
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784697164; cv=none; b=FJ5cohczl0jPC7z39Kzaho7LwST/errmeeX4cJEQWS6s1UBOek675hj7wFFeWRYAKoIMw0JlmSJUekGkULOKGfJBraNnljWYWFHd08rrGeHZZcfmVZHS9OHjpz0WE5+2lo1U0SUpWFVbgDinZN47cG37huIXx3g0kdTA5SnbMXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784697164; c=relaxed/simple;
	bh=+PIv0zwvDK7Dtbw1NzJOdvZU98UCOcchphiEw93P0mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doeFr9MmlUrQ706y4BT7m0tpt6sUHY4hx90Yf8QEOOuzwJumiUzKpPbhWswbmjrVcq9SzokCXmLBxZ0xaVbuHfcPJ1c3EYsdvnBs10K73nnSWak+MKvae1OhlnKQ3zebLfteubu1KZHonlGROK0oYVLtye2jPpzhUHnbUAAdI/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8fhP/Dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ofdzer1u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8fhP/Dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ofdzer1u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M547vC4046130
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxfo1suLB+uzJXkAtKHEBljNDBF2FOJJ9F91Ccszb5g=; b=L8fhP/DzzjI+4mig
	f6yDPP96K2hL9htjwPruMMxRjoq+Ib1UytQ6sZ42PottOlu2coc0WLo++cSBv+Ow
	Tf5pfW4RzCKXSG64+BZA6sVUYEXR7hNZ2Vf6sqqtWERqXl1seW5TXiErGotIe2sD
	5YstWsP6TCn9idoSltCOY3+2GpmRafADmaPqxQmTkK7ce6tdgxCov0HSqqj0bDBs
	kfL1xpiZdhOp+dRHuvF/DlwXkicCYfUtFWrLWT6j3UuZtFcy3Qemz6uuWDwv2fJG
	P57/G2fa4ULpXkY5LC0V4GqijO3KvPzOn9ydfMV8z0m9jihO1cngi8v+Cqcaiwdp
	ieB8uA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6dab5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:12:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8482b95574dso15664019b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784697161; x=1785301961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxfo1suLB+uzJXkAtKHEBljNDBF2FOJJ9F91Ccszb5g=;
        b=Ofdzer1u+7nSSbRrP2+2K/0FH4hEe0eAJqGxcDS9xgVhNvcmMTFPWfSTk/I6dQbGST
         oBy4462QvOOaDOgCZKXfnuTIhCgbBue/DcYTLecCkSsNrok6fplz0WeDfS0vJZN1NL4W
         0/xDdoZRug3yvinGaiRWvU9MmuIbEDraxLMHBrui6EUCnZybQUxzsZAbH2ZBaEeNQN1S
         sAJr4YihDp6p6t3+FIgzqOBbbnAMgzJkEsLv6P5rO1qF78CsnV/IFpny4pIsp6xNBdSd
         kTbuyrT+yA+e5AjPUCP95BbK84F50oswIFo8p4wtbgxCFluvNPRxVO/EmEfEAf0HcCe4
         j28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784697161; x=1785301961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxfo1suLB+uzJXkAtKHEBljNDBF2FOJJ9F91Ccszb5g=;
        b=h/xrL0BlSsp2KGPbFDQCjsv0Wmx3+LTgbMDerLn4OhRlkP/ybgT2Ur3F130ycf15Wz
         RRiH1LLw4lrEqJr354buuftXN6qXX4oJLZMZ3zR6GSO/Vuu50BMH/KX5y330f30IpAiK
         Qc7pUh2gnk9Z2dGVar9P+JfdBwyYfqKY3ecfPxZU5yOqTSrMUBeHDhhFtVXYv50KcIRg
         oLKRZ1tj+lTnKnRCJcmAWLnt7XTlvsq17gMJI5cRKaoXbPujJsc9lbbztmnG0yBegTrx
         KX8QzPSW1dYaKpMgSOT0/Y7GOoqRBAtnJPnfA1QAo4tsQ6AoPTgnwhPqn67ks5C/eS9m
         lLWA==
X-Forwarded-Encrypted: i=1; AHgh+RpnSDce2nHEUB/SwsyN994X4uto0uHvNEl1ZDGW9h783W5tVvv/JLlnMtF2Nepv4iefi3QytHH1dJIhI+PW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw246QsWlocU383iWFYhkYbgo3yhT0Jg8yhCx05dt2J7s8zaxz+
	lTWlqXH9Nv2wg/qVxVMY8R5/zxMaowGs8PMpGYxG4wYb8CMjCk3lIVQ8hvenNUD1zJREtFNIyYV
	H55ZZmLlHHoDKk426qyJA+Ps2yJoShbEh3xwXjhRoBghzjxDQmqbHMY/FBf0EW6WxPjsxHwwSaW
	Lc
X-Gm-Gg: AR+sD11VtCzOKwPZtioPIOXqzQMV4w4nXQp9YVPm/uhtyRIj3zeAbQrJD1VUqzie4CF
	pK1jFarNJs6S0IVmM+PQ1IHVTF/Z0J/nkKXriL9r8F1RFN0WBI0sHsEgxBlG1xv0aPabhjYjGX1
	N1fmbkk9y92R6A6a6CP9LgtMwCLzrPfV88Zl7O7YSnqICyO5jHS2Tb/xwYtmpkpdV21ZLMfZ0m5
	Hq2DjOkOS/s3Jtfn4SdXt1KHy73EuQsgL/haycC9tsfwmrEK8T6x0DLyablgyKyJF2FQ71t/mCC
	Ye7uwxmF7THeyM+udWdhf+npU8rBCokKkQJKGMC+TtIlGGZFj3VRTU2ifo4DFZDvZwwCuDtr1Si
	lfolIN94Alb2uT2hs1Y2khtCVDP8=
X-Received: by 2002:a05:6a00:21d2:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-84c29333c94mr20107639b3a.17.1784697161192;
        Tue, 21 Jul 2026 22:12:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d2:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-84c29333c94mr20107612b3a.17.1784697160756;
        Tue, 21 Jul 2026 22:12:40 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1728566dsm701761b3a.18.2026.07.21.22.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 22:12:40 -0700 (PDT)
Message-ID: <7c7448fb-085f-40eb-a471-9ed81c55973c@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:42:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra
 AudioCoreCC and AudioCoreCSR
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-2-b320d822cdd0@oss.qualcomm.com>
 <20260717135608.GA476084-robh@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260717135608.GA476084-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0NSBTYWx0ZWRfX5ynI76zGhtH+
 JTr9iO3mK3WyJL/T15gP/gKrQtUpgp4Y/FiKtVtvpDn/XxadbNNlyGlwWt9FgsXAnMGL/QLQRlD
 vL6pm/jPNn/3r5kvjSWR73/C63KEFVs=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a60514a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fkvVebzWtNyKPa1jhH4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0NSBTYWx0ZWRfX2CuIlWwwEJvC
 scqYMBaqR04lw31wx3Wc/S8e4Va2rRCsk2+CmSte5BWCekIqPOsECYOk2jaUVA65jJ9Rixq9gcB
 SInZ01NOYW6V2Btuqw50m2T00UNiPT7JnUjQ8QwnAlAP4/qy2kVtG/tSqWGajWnZcK8HkOeM9pl
 0605eXjrskGlPe3GV+Ay7g0jm8/TopOpiTpLx7zYpb6EiUESKmv+0C9C64wGzLWHts1vU7XeAWE
 xECDoLxEGu4yc1Rld6a+bBkOOXNYkz54UQ0orqVjpOMAiK3OhEzS84D5ElTQpnDfab3/C02CRpD
 nc5IUb68If2uKB94AT1KhuKcSIfQDnRijCDrZLHXbjc0K85myHWp87+HFq4qe4Z0mZ+NzSfVZiN
 YFdm5v1ahhh5Ln1kPGLdeKV19h5UttWPDmqUwupjiwD7mDYioIexKEwi7FT7CLSUNNH7JbiSrb4
 d4ElSVCWrK/9ww5VVmw==
X-Proofpoint-GUID: TrFgGQGtnpnZfqlEo2NxGDvGEL0S6xOg
X-Proofpoint-ORIG-GUID: TrFgGQGtnpnZfqlEo2NxGDvGEL0S6xOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220045



On 17-07-2026 07:26 pm, Rob Herring wrote:
> On Wed, Jul 08, 2026 at 11:55:06PM +0530, Imran Shaik wrote:
>> Add device tree bindings for the Audio Core Clock Controller (AudioCoreCC)
>> that provides clocks and Audio Core CSR that provides resets on Qualcomm
>> Shikra SoC.
> 
> This should be 2 schema docs. They share very little.
> 

Sure, I will split them into separate schemas and post the next version.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 90 ++++++++++++++++++++++
>>   .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 ++++++++++++
>>   2 files changed, 139 insertions(+)

