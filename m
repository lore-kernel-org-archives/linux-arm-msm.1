Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5205C48EC9A
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839801; cv=none; b=kBu3JTQjApA50PhCAfBl9ay4Job57mysgm4lb5+6djEbCqJ8lKtkOhR3tIimPOP7yVv80H9I+KJgcpCeFbvTcmSBv627xCykd3MrtQm35/zaEmn99ILs+mqtf0elg40WabU2fJZGRmyK/PZt5yVdkHHDmn75s5LjLm0ZeM/RNHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839801; c=relaxed/simple;
	bh=aj90nkIktV90gsgtUkZ5qxQYTUJt/JYnxXvgLMgGLSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYgTlV+exriWGPpGB7VKcs37Drbt+TBDBCwOOhBSxdBEX3AAXxlpJ3LfXJqNwpiHKONfKfD4uw7QKHQxJ80bnRjlK3siMe4s6XtMVMQ3HzZoR2MLxHWO+RUABly9z0Y7Hoz7xyyPwYGOhBHQcNkfbgquZbN5GjLfFB+8gwogcpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nrpm+rTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hz/woWMV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nrpm+rTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hz/woWMV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xLWi1932306
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 07:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DD5muIWTBNn8mx2AjPry+QV0pHh4Dfdo+7irn0HCbCw=; b=Nrpm+rTF70oa7N+F
	PF4GLVmPPz4AmekPPON3PltFte8dTNEBjoJzbdJi15QUFYkl42yX3EJa6tR06Mhn
	8/CwtWLy3hAgBvyKzbEcNFf+KBSZEtnEDMl0t9o70QmGOidymkW0WHYwQqJnx5RD
	jHxdaWiy/o/uA5xBcfV5eDBNSHods+T8j1vM+JIu8kS99s7q7SZL+nDrsdWVUZsA
	LH//cwVO8ZYjl9puCy7YkjdHdWpL3+vcYFrva5ZHi8nVVHg4qBL1xtbWC/HD3JQ8
	i1evEQXFnJzS2iKzuaUXheBh2pgkIqzpUZgVFrbgQf/56qZ3CCYVj9nFGPrCGC9S
	8SIQLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59m0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 07:29:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91202bb99d1so9847276d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 00:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790839795; x=1791444595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DD5muIWTBNn8mx2AjPry+QV0pHh4Dfdo+7irn0HCbCw=;
        b=Hz/woWMVSgbN6cBnsrsQSwaMKZdzj7d3Qz4QNRCNXG8xBL4ClzJYYK2mRaYv3MVWfQ
         SjW4xJSy4wB/wPESulZwNxt+NQg5I5PC/Clxxj7fj4a6FxOXYsWTMA4zyLK8vK+T1EBt
         YfENVAhkf96h+GauwcNxlvEfxI1XhEH9qvQZBCMzohrwHeFIcsuU/LM93/y624jagfnj
         DKc53YjGnUVIWAUanBE8R2T3ZrQ2i6bdBA+NlqtyfJxByPoCZGVnrp/DRDn/mbIusPwT
         vBQZJw8PDeqvw9XTsPGy8e6V+pup/TgxzK+cjr8dpfKPcoQ2ZaH7TFa8bRZJP2mazk73
         vrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839795; x=1791444595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DD5muIWTBNn8mx2AjPry+QV0pHh4Dfdo+7irn0HCbCw=;
        b=z9uruwmT7jokT3tHi6nxU4czq3zO4VMw8ff1W/bqW+o4xSs7xXW8t8PbVpAOx3S5gf
         o/ONZnQ2PMk0IYxA7mWAlu2oPVm6wJYXMuw0nsONvWAmCIQd+wkStUbTpJqu8N0b+vLd
         T2ZGY/8ZmaWiXD15wzWYSRnUyCTOSmx5oSQ+Pxum23SE1ccDdeizNmt8cRPONvMl/Ht3
         ingUPsvcZWNwBnsE6m1oq/ISG2KlqMhz2CAaOUUJE0Ot7uIWLL47twO+Lj8Py4VT2DQ2
         6OK9Ka1quNA0ube+Y4Wt6oV6VFkar9uA+bBgZhEtvucQesFU55rH+d4RrhQxPJF5Wizz
         0VMA==
X-Forwarded-Encrypted: i=1; AKwUvBxaKTqJsUReW7/3YwRR04ZBo0oWBLLW8UR9CoVnsnHZ/hpQ9lDjexi/SycWscFQoU9acndsJB2uSE4RAxKq@vger.kernel.org
X-Gm-Message-State: AFuF++l/rigRdOQUTOk3Xnj99isWb6aS1t5XYkBrXwoiS2/wmEL9UamL
	lY70oEdiQAf8UH33agcEWLk7eicpk/Be9za/esEjSmvyHGmXhyIB6QHHKNEJpwxOS+HWfbzy61L
	0n1rpontJKkegZanplvOqp+L0IYuZnJcppZGq4QaNdAk9EL6nGbBYWy7czjAxZoRwY88a
X-Gm-Gg: AYBFou2kwXwWOiU8M3XypuOOAryN5pMcg879Jmh8Kltyc6LA4OB+MUDS2EEzHvtdXc5
	aoWRUGQCfFgMwMHd1NPCnRivktO0+nKugpC8MfDaE2Ke5oaLft66u7/A4YMLz3UALT2aP3/RVcY
	XBERxQ6JDs9ho0h7UzUdL5aGLcMgOwRQvMjYPPS2/rW+iS2cYASPMJQcJ4MUg02c7NaMI9yR1xQ
	Kwlxq4NWui/NhROFXYsohBxUvBQIVsbxg/xRt+BooPS1hKbYuSUQOTEXQxmooOZoYMHx4yR7C5s
	0ft7eE3Dic5o2zb5qwQO6c6YmuTV8FyjsHcAs9rSldi3vr0y3v6RVwnOEZOyA9qI9M3l/LRcKuc
	q1V1Mrxxq3xznn0whJ2MdCg==
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr664520385a.4.1790839795470;
        Thu, 01 Oct 2026 00:29:55 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr664518385a.4.1790839795035;
        Thu, 01 Oct 2026 00:29:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca64e84sm556505a12.21.2026.10.01.00.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:29:54 -0700 (PDT)
Message-ID: <284d1013-5bc7-4732-91c0-87a6c870a349@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 09:29:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com
References: <20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com>
 <ar3LTBFtF_qqw7U2@zenbook>
 <0eef230f-1db5-4419-91f3-ba220891e577@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0eef230f-1db5-4419-91f3-ba220891e577@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Njwx5C2YGv9Us0KZ1Hr5r5rfI4ozuLYw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyOSBTYWx0ZWRfX9Bl21P23+RAI
 pwgdo5lnCXU9O5q/dNA8/xSmxp7dTntWanlik0+gI/Shk3cRL+ywzj4mUbjF/iHf6/cmY7mL0Ir
 6yTRaXC9dpjD9IEvEk1GQqjGz0hfUCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyOSBTYWx0ZWRfX4Vz9FmoueKd/
 3dvB1rIzLkQYScqcKn3kX22Hx4mLp5pui6zx/Mnp/0jUMcLBPxi9F1jbwy8hTwrPJzNl0NtKS3n
 BKh0+mIeLuHb+ajEE2WVVOfUufxS+D+kcAMVurb+36kga08SrXNWRc9RLnL+AfQ0GC7ZBgPw5HG
 q/3OVZAEp5a+KlM3Bd6jeiPpuRUpbcIY7Sl2HwVkDBDuVnrr0H8Gq0033xBdTgWNyJNdvDX3cCo
 o4i5Gig18w+U7SjcF7DgLmYeEgwaQV4kM/XU2gJ0amZayVDBwBiMX0ZhWT3GtASkUgxC6/5VQRO
 eYyzL1TL/MwqnKDTYEPCiAaJyNOmyMe+WV7244mwCuBXTWXjOSClW68E7maHl7r+vjoVb4zTz1O
 TywjnmWtpRo3cp0YgE4HLT5xFz6zFFAEsrX868KvVOL3ofDizzJyrs23NUYhN/nCGdxv7hhgXs1
 A4VgLOJnH9Thl4A0VHw==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe0bf4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cNAZRwmMWnWlOyi72XoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Njwx5C2YGv9Us0KZ1Hr5r5rfI4ozuLYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010029

On 10/1/26 7:12 AM, Yepuri Siddu wrote:
> 
> 
> On 10/1/2026 8:28 AM, Bjorn Andersson wrote:
>> On Tue, Sep 29, 2026 at 03:31:29PM +0530, Yepuri Siddu wrote:
>>> With RPMCC proxy vote removal, the WCN clock must be explicitly declared
>>> so the wcn3988-pmu driver can vote for it during WCN power on/off.
>>>
>>> Place the clock in the wcn3988-pmu node since the PMU driver owns the
>>> WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
>>> RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
>>> variant.
>>>
>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> ---
>>
>> Why do you have one problem description above and a different one below?
>>
>> The information after "---" is not merged so the git history only
>> contains the one above - and there's some interesting details in the
>> description below. Perhaps this is the b4 "cover letter"?
> 
> Yes, the detailed description was in the b4 cover letter body which
> gets placed below "---" in the email automatically and does not make
> it into git history.

FWIW you can simply ignore the "cover letter" for single-patch series
and leave it empty (minus of course, the changelog)

Konrad
