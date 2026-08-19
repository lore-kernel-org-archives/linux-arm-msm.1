Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877703469FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144467; cv=none; b=RAevQzKwqcvgmXeiQmG9ft1P7X+Hqlm5SA+Xrz5fzF1WQxMSuwAEUiz1ABrJxi1fylCr1VLj8fyrdw4XqBZTgJ5JDM8/aLCNbF3WxnYvpwSSvf+xhpBZ1seNJuduhBnyfoYZb9X/cOQyVuuucJZY0853pQj6g2H/MIGjTwSaAUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144467; c=relaxed/simple;
	bh=VZHnQPoCn9GBriYz27om5Bobo67ZK2vwUDrWFIKF85I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQRB4A31IyDGaS9e0ToGaNZc9s3lmduVKSil/P3cGMSXWteu0z73c/1hHuyCrkd9+Dm3qJPjfmgpF3ttExQRxUAbA+A28Jhbxw9dWAPEPdoFOM1QVnlXKn2n30J37cgF0uk7/7LRkORQnjFsrNlguD73bM9z6sNcYLS03iLloLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIere6Xj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+w6GP76; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIere6Xj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+w6GP76"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0MUY3334164
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwGkEVKn5pCyCeQJq0GNY+Q9U4bmzQvlyvJMw8F30W4=; b=GIere6Xj2mP7Ceyj
	fjtfXAJ6BHQQ1bAaW9g1kMMKEixfhCaSs2sBOqAd/qvL/VJo0pQM9Koj08W8JkDG
	VjevGjMzgXacHnjEcMuNdHqi/II4c11oG50ot0DQ5BI8Us9y6YnxJUQTpOhk03NR
	eJwlTMugEXTh4U1G+Qu+OENP+cgXFWOUZGu1CHMzo9JekDz7x/0ALlhR2A+bV6Dl
	OP7+AC9QmfYD5GcXHce18okiMT1b3RbNsSj0ZS6MjUG0WYeFUK6bFuGcS0WtDEkZ
	5u0zAOf+0KSY1extua4WmchLtPXE6AfrTb1K/s1mpro9uN1ySf2ENIaYB4wnVy6V
	BY00lg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkbasf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:01:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso9073485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144463; x=1787749263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwGkEVKn5pCyCeQJq0GNY+Q9U4bmzQvlyvJMw8F30W4=;
        b=J+w6GP76S12E9Wue3gOUBybIeRv/5FE85LfbA44l2Iscpjr9CJ5/c72ZXzEmZDG0D5
         rgrdyNRKvBZ3Wmmud0PuE1WeiFLTYr4eyGMDXh13AbB0Ar4r+lYAye55ByaPpBqxQv6x
         ltVzk3KQK5CWVvljZzRBzI/jWluyw3fFR/kftyijA6xSW3ej7fHTvbmfjIoWDtJEPuv1
         5uTouWKDqJRlH/n+2rXH4l0a4OF1/i4E4Yx9Tz/tL+pjwciBhgp7RhHGJuyGWn0T5EBS
         QTF53QpL78kMz0ZEC1pMKo4nEXoNwV6xVIb/ktuqzLYu4xdJFUgiYercv7WbD5i36g1W
         2ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144463; x=1787749263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwGkEVKn5pCyCeQJq0GNY+Q9U4bmzQvlyvJMw8F30W4=;
        b=naFnXNLBPQjH1HjvW0lF252q55H5eU5ZZOvuesMN/4ooz3sKVUgfUPRjMWY0PUCc42
         wFO+FedayuaYhNkNtiRNzGNs6A/ajuKUsqMJMSKsATUGjITw7Is1gdlFaxcc7XtBM72R
         kKLiV1mnFZYRsFtNqmjBSa63b+lflDuQz9LI/jCgf5oDyCX+F1cjN3CG8jEJw+rkjB0Z
         6qEhRIgZidT+GdCFeKBLrojy2ziNdnS6k1yJj/EFakw2rGm1xXvZuYthZS2DVPB4U8ga
         wKEy3CwtOumKa1G4YyAJh/XRAHFHzuiQF2BFC+uxaiHzeqQL1Qxh61GMqLxqnMoHRXi0
         0xyw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/QcPiipLrVPkIWB2hTet9sr9YCitRc3o9D1K+xd4omj+U/64B0sjizxsqZCiVN6koumm+FmKII4FmjeGq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz99dH4K5U9uv6BMaDTf+01Lpya7ENYjh3/JMEeory/+nQ/6E+
	wQSndTkIujhuRp1Xo8AwLBR0fIAbgkuzBkfW18+ifehI7U0rGGjdRXxlFItNCcageUr6q6u/dvy
	qdL0bxcLrwS0N5BXj3NLyaL/hdziMHR3kBmKRrfngh4tZYhQs+n1+bQn6xFtPHsnojd9V
X-Gm-Gg: AR+sD10zoZsc+X4b7Sh6zLS0LQOr5GB6TH2SSqJSjaPK53U47o4IKGfvuTaTjAI0SSd
	zD2CAjlDBFirlBMAjGOlnEQOg1cYf3qD06k6ETsqSLvy9e3uk2Kcpbpk7RswxsommK1mvW7ha14
	BLIsQ1oDSy+muXkK5yR1wrLCzualOwTVNshiX6EWPMWmn8lMs19wCcuIEOf7CJ8IWDwBqqdtYDb
	KZ15tAtjJ09KupNLamBRAklWiD6LZ8vK2sZU2CfT4ZBwbrLNJA8tlBrj16BWjPEBvmYcEoJEGP5
	dNxjbHVy/hS9Uo6iJpQO3TJ2eAAReBErHDRhwYLUaCaMt03V5QlRkPGudKj4EzvVoTly7svyMfn
	A4yiSVWdosLZHpenHKvR25bA7
X-Received: by 2002:a05:620a:1728:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9371e1af3d1mr306223385a.0.1787144462654;
        Wed, 19 Aug 2026 06:01:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1728:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9371e1af3d1mr306215585a.0.1787144461995;
        Wed, 19 Aug 2026 06:01:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478854951sm502596e87.3.2026.08.19.06.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:01:00 -0700 (PDT)
Message-ID: <cd5a25ed-76a3-4f1f-b924-06bb685ff426@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:00:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Jie Luo <jie.luo@oss.qualcomm.com>, Stanislaw Pal <kuncy7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260730191353.557494-1-kuncy7@gmail.com>
 <aeeeebf9-dbd4-4f57-847a-5f495b3236a2@oss.qualcomm.com>
 <20260803091003.15285-1-kuncy7@gmail.com>
 <8af46926-fecc-4396-973e-2290ae285998@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8af46926-fecc-4396-973e-2290ae285998@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a85a90f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Cml0np4gJbHuCS8qjCYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX5qdLdd81wZVj
 NyJIuSflgX/z5f13kw0UxE4MypwjI1S7n8v091l/xWyqxx2dsAsnZQmxIYxyWRULAzkKVRkLRTX
 I6WEqbYfBlBXKLH8PbV6X25G0/4WGbI12VOzEf7oRuWsqFmdPy8HfYlqIP2hUJC/PsfG4IvnMne
 K8E4Y4IsUj5lkNHiLSIgX5ownAeY3kRk/16mpy1Q6OZSuek5/QsYrhOHU0Qj9vn3/n52HQFi60I
 xTpA/dob0EdGbPTHOiDesaUdibgeZ6D127/3cn1aiplH6nsPwwpd0fenaaivdOEoJ4qKN+gZiGv
 opgvj3M7MN/zYf2ApmzVGwHZK4SaCe7PXTuBJdsjvyHQyS0aCDUjua6JHW4cSJxg0gWZbha/dUK
 Pt2RNUvIbLjnd+I+2aKqiwj2sd5PRTijQh76JBIK5AspxBMAkQW552wuqsxTCEw/qGv+sVPrxF6
 tFX8aTv+WeD4yN2UcIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXxm5QkF7GgR9A
 +XeKZvXst/oai7AVn0oegXaA2WSMjzClUsszWLnRCa0RgcJSBuRm111MwlJhC+zw2izjaXaZ7io
 BKvnCEqeBVpj5iaXG1E3I2XFsT56DVU=
X-Proofpoint-GUID: zQIjthzrGgA-akjfl0ELK533j4bLtF1I
X-Proofpoint-ORIG-GUID: zQIjthzrGgA-akjfl0ELK533j4bLtF1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

On 8/4/26 1:03 PM, Jie Luo wrote:
> 
> 
> On 8/3/2026 5:10 PM, Stanislaw Pal wrote:
>>> The CMN PLL AHB/SYS clocks will remain enabled as long as a downstream
>>> consumer of the CMN PLL clocks is active — this behaviour was confirmed
>>> experimentally on the IPQ9574 platform as example.
>> That is exactly the mechanism - and it is exactly what IPQ5018 does not
>> have. On IPQ9574 the nsscc node consumes the CMN PLL outputs in DT:
>>
>>   ipq9574.dtsi:
>>     nsscc: clock-controller@39b00000 {
>>         clocks = <&xo_board_clk>,
>>                  <&cmn_pll NSS_1200MHZ_CLK>,
>>                  <&cmn_pll PPE_353MHZ_CLK>, ...
>>
>> so the device link holds the supplier active, which is what your
>> insmod/devmem experiment shows.
>>
>> On IPQ5018 there is no such consumer: nothing in ipq5018.dtsi references
>> any cmn_pll output clock - the only occurrences of the phandle are the
>> provider node itself and its own assigned-clocks. The actual users of
>> the CMN outputs on this SoC (the internal GE PHY and the uniphy blocks)
>> take them directly in hardware, with no DT linkage, so no device link
>> ever holds the provider active. A few ms after probe the autosuspend
>> gates the AHB/SYS clocks, and the box dies on the next bus access -
>> which is the measured behaviour the patch description quotes.
> 
> The CMN PLL output clocks do not depend on the AHB or SYS clocks. They
> continue to operate correctly at the fixed rates even when the AHB
> and SYS clocks are disabled. Therefore, once the CMN PLL module is
> loaded, its output clocks are expected to operate at the correct
> frequencies.

Linux sees there's no consumers for the clocks the CMN PLL provides
and gates them, subsequently also gating the PLL itself as all of
its children become offline.

I can't find the docs that would show me what IPs consume this block,
could you please help out here Jie?

Konrad
