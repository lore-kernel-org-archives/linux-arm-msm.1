Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582A248C41B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060117; cv=none; b=bdz8t8OGyDCRhwnuqtn7klQdiLH4OQnnm2LXnkZtE0o467Rx5t5fWNeMCIBT6pGDKRjX8namgK3lLzz95u7L8WMcR80lN4HZsLAo1J5k6oinpIVOsVnaYU0ZpDvh3uzG+3GhJ6RFGcyqyZEu7HAhhSZsvxgEo3oxR2SMcFJJIIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060117; c=relaxed/simple;
	bh=klD+1bPn20FdCCR9QyFVYkMKWskBuEhyCL4qVmKbDxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWPzViVIRoInpl3FHHsFDvzvj3aZYyJOwmF62qX2mrlfpAfTitXHhL1a5igAIQEUz+ZrjvxXvIy67QoHypM9M75BRVcItabZIobf4p6r/cta/LzRDRDaZgWh0rHtx4mrayhfyk6DgaFNuqcmZ4sreY9fQG1ykcYslAeJwCJX+NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YySU0glg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhUI59Ny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YySU0glg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhUI59Ny"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSGV2662666
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KB6+lnNaJsEI2ADF2CB3BJtwA+u6Lxdf78IIw1N1pAo=; b=YySU0glgRC8JsDv1
	ObjaIUGQzJmCNQ0xXHn8KEaWKbePL9VJqztNgKFyByDdqaO4majLo9MIALAWcGle
	ow+FykKhNmyiPMK+WHz/ed4/XQuYgWlM7Zk7HkSQiCQlux5vD+k/jFVAmKGZ0btq
	p/aB7Rh2HaFARg+wzp8DAlcqsFHaa4KVp0TMC9DBGMqBwOSjNaD1/debgm4oYF36
	tp8Zq0UlmRNke8BA+Z9fhTJmyXhwQytexA22/otoSO9PQD63FmFdoFgDLP0FDjSh
	llCgEYwfF2nStJ1/vgHAr8q2zjbufaxmszVvOzpQbpOpImk7mKht4RHJ0Yhhr0q1
	X9AiLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1j1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:28:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso59107685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060115; x=1792664915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KB6+lnNaJsEI2ADF2CB3BJtwA+u6Lxdf78IIw1N1pAo=;
        b=KhUI59NybH8BcvJF5mRHIa1pPuhFMebMOrSbQMgs5wr2i0u/4BvUuSBIToBYA2IcEr
         kYPExtWha5TETBvGby13H4OhhgMaAstgVvIBBD2Sk3cBzuNFV+bj+uX1Pz0Z2z6nvkkC
         6Bwd86+W9BkTVkHpRQw4iEXaFKGvd9OOl3A1mTE5K8TYnaVxkyoTtoqCP9JOAOjFgBM1
         pqXWEGrseayak6I6AJ5sziXzNGzeSbcinisbqUsOVWm7oaTAm/SzHYFvo29tNdRidZsa
         vQaYzaFh9yxQSVguTgwidOT8VFjUhNpc35alIzZpZT8mEwEnWstwua+R9k/9gvTA9FvT
         JJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060115; x=1792664915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KB6+lnNaJsEI2ADF2CB3BJtwA+u6Lxdf78IIw1N1pAo=;
        b=frm2xnvu9/Re50Kg7618ENnotjw+heaLVeik2w2QCmVCJAFGgdWH8Q60/8uhbeyEdo
         qlvpIGaU5ZALCeokHzhSvYbwQo0NCKBXJHfN7XH+kvNqw92l1P+ClStBlBWfi5DItwN7
         +lDBOY0uItWvXkq/C3hq9EzSgA2Y5uuJfH8m/5Xy8o7+bk8VxWFRBfGCtXwnl2JiVE+L
         mXoWUNbjEUYp63XtvKrsH3SUYAy2BVl0FLRU5l4cPlETM+iNVVTyJAWsHFqNJb2WbNwm
         1LkuvifV3thtOHNl3jOwEvsguZMRvHmdpk/QEgyLx6XZAlP9091URSH1KQdnc28Mjo/2
         HZVg==
X-Forwarded-Encrypted: i=1; AKwUvBzhkscUrX/NvGRkkDIYl2FdNOlxl6EbCyafa1702i8GuORfPpoPp0yWduKiJrqosYrCueOMR7sq8Ll5BMgz@vger.kernel.org
X-Gm-Message-State: AFq9FYLXqIr4zdNBFouRCIDhq+kk+lPezh+jhsWMLbmZwOC4QKjcB13p
	y8yoZOW1b+Vl56SKZFPCzbcZhRt9jzx7zbOGJhOJr0NYGPBo/lPQ2/3awfoTAoXRQGrAFgMfO0r
	tosiERw3ZxjVzE9mL4DRR8/+tmpTaf6FogxVJlVizx+Er7/NYhtrR41ddk6SeTKwKyKwC
X-Gm-Gg: AYBFou32i2QNfI0e9oKrdR5hr5k2j7Vp3g/4dma8zflP8puHHx+oUmDoR5+NRLduY8H
	2bOI3iWtxhmOmQThLuqPRaCHEouNctqLptXW2NTuF7xn8R9ZTusRNsssHp+rsubaa9UIUc4abO/
	hAwRg4Z/JpygIwdsuTsuTt4fZG9vsVorai8eZsEGAx+U+oI0GkMLKvz8sBZV6vpUJWoRqDoM5uu
	AJBfB8aSI6yi6AfZMncGuDlmukWrlp+Pdu7NpTqVp2ePyBktgxKdenyzbT6mkXZ8dpszWYGW8BT
	ciAZjIFrgaMhP1immXHHT0pn1gMoQpEFU/90zLaagh5W/eIJFmL7b22XvMCNGQM+g1BGyzCkFba
	HLEtT2phZU2VkUEBbX8KlTw==
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3512979185a.5.1792060114423;
        Thu, 15 Oct 2026 03:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3512975285a.5.1792060113895;
        Thu, 15 Oct 2026 03:28:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203762b6fsm2277016a12.5.2026.10.15.03.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:28:32 -0700 (PDT)
Message-ID: <a87613ea-5f6c-4697-af4d-1110c12f799d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
 <20260929-visionary-hospitable-beaver-e2c1a5@quoll>
 <arvGQKBY9DZlS2EJ@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <arvGQKBY9DZlS2EJ@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX3flaIBl3URVO
 vtQW2X2nNdwkEl87cFlkPFv6d46rV9lYp8iIpTlVvQ1Gs8bzg+F4Fxc+6zsci7R4lmArxJSlOpo
 vbVpQPGbjaloZySGaVlUbf6meEvy8rM=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0aad3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=AByBbePJZrCWKXECz8gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: dhmsDIXKDtpn64lLH1NjMj4IQMnTcQED
X-Proofpoint-ORIG-GUID: dhmsDIXKDtpn64lLH1NjMj4IQMnTcQED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX+wW78kSOfLd0
 IaYrynw0pkbyEzBRnhxNYftWY91LU5c7uNzARz4VlRmrRujT/+FjjZQPK3lFSohAKyE5f/w993n
 i13eTDkLzO0XuOIi5v5PULjBWlHEdR8K0no8Uj1CKzIirBsjEk3UQZRvrX7f3BUzBMHNO28fiTt
 z2KkzA3vEFFy30kXEb4gg4/HQX0+zL1qMTXQ2ma8cIjCL85z5mqJvTElBCmHz5FdzJUbz9ayn7F
 R7fAGEgF1r2cqWJaBx9xHVTUgkigPG2e6K6g0THSV+DkiKaZI/OAgD9YbSDV0s6Yi0hDQZOoluR
 yESwqai0wou1l2n6sVr8oHA+5JRKAh89etDhVMA80e61opJBQWRHesxmZO8LPkPuwcXdglUKVzt
 IyAQLgp4MaTqBTPaBu0m45XSEOWi6ZfV9XDzj7bDvEHNU+XQpQjxBIsfC0E/PEaHk9a8dPNjGx0
 CZI08j3Z6QpK7g5sQCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 9/29/26 4:08 PM, Shawn Guo wrote:
> On Tue, Sep 29, 2026 at 09:57:40AM +0200, Krzysztof Kozlowski wrote:
>> On Fri, Sep 25, 2026 at 12:11:50AM +0800, Shawn Guo wrote:
>>> The schema describes exactly two clock inputs for every compatible it
>>> covers, a board XO and a video AHB clock from GCC. That is only true
>>> for part of the drivers bound to these compatibles. videocc-glymur.c,
>>> which handles qcom,glymur-videocc and qcom,nord-videocc, and
>>> videocc-sm8750.c both declare their DT inputs as DT_BI_TCXO,
>>> DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
>>> DT_SLEEP_CLK.
>>
>> I don't understand what you are saying here. You are mixing drivers and
>> compatibles.
> 
> You are right! The argument was the wrong way round. What I should have
> written for a schema is the hardware, not the Linux driver.  Sorry about
> that.
> 
> Per the hardware documentation, the video clock controller on Glymur,
> Nord and SM8750 has three clock inputs: the board XO, the always-on board
> XO that feeds its PLL reference, and the 32 kHz chip sleep clock that
> sources its sleep clock generator. There is no AHB clock input
> on the block; the AHB clock the controller uses for itself is generated
> internally from the XO input.

I'm staring at the document and my interpretation of it is that the
AHB clock provides bus access to the controller (via the AHB2AHB
bridge).

Konrad
