Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E663DA7C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383670; cv=none; b=Qt5//jST1Zvg/jcS516Tzdu/ii1rmOeL+kqjxRfAUI0I+cOw3xZBDXPLDu1WK++Po8RxWWKA2JkEADBTIf4Ci7iSTOrIfzXa1l6GsmBfFPNcaNPAjnLQ8w1GNQ8LPbK5NIBCNRSqP6lN2Vdc5CTUlzv/GiSkqUbuMc7xaayonSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383670; c=relaxed/simple;
	bh=99AvjImape4FlYCaQosf9u1laFEzTnvjo0pR4t5IDPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs02EVkszg2k62enAcNe5egc+zjE2cTwPsEk6FtUVHjdKAFOu3HTzl642dFop4t+U8c0QTQqEf1vQny1O9sC1cu5u63UilcCHW61ibiSVnHwnBW96GANsljeAbFtdMSIhzY7sbYDo+8VfJnQKbntt307u8YR8fsYw99rNj45DEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaRPhCbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUlVJwyT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaRPhCbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUlVJwyT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm3Uj902013
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8i+ALZ2u8Nt8nDqSx3U6TdSULZzHy4J/I0rxt1wzTA=; b=WaRPhCbGKOmI9/JS
	xodI7wE4EQAmRD/s9VAGw1HTtFF3bvoerOhpJNC4AehgpMxSQmtJlQce7sj/e1CR
	OU7qNSLARs2ZuucZCKSw68FROqcf4LEAnp2IRzeGCLaknj7E0JzGD3TN/I5BKYX7
	X+AX5mLP8XzwuCzx6rEyN2jAzR3t2ZujP9QP8IwpWhIKpEaleEkNRYA+8Hj73jXH
	Q3gNB5ytrnNOpIwsuVsOWVvI1/yN7L0n9LXkwtl8YgISfPQfyNJ2dJY0BZ/l4i6l
	Rk/A3M1LM0t4+22x/xgDJ5E5uMVag1dF4MgLNY65sfBJbt5fMue9b/cDT3nxHmEK
	nPPuZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrhwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:01:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so48576885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383663; x=1789988463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8i+ALZ2u8Nt8nDqSx3U6TdSULZzHy4J/I0rxt1wzTA=;
        b=AUlVJwyTqDhttd0NRuV+aAD02IKkoCjg1vd6wjJ5Nlwn/iRwl+kjBbzeMNJcn18Vdh
         RXvY0IlbUOJ7uNer/Hkfz9acOZsr1+eOJhiSRQgaqL1qE/Q0ycp/9QRc+2/tqNA+xjGf
         SWTCkN+++W9cCH4jsVcRtpW6Xq0mTQNr5x4sVHi9G3E+lDNLzQ8ArPB25cfY3he1PExK
         MO7gvtindViH7mYkwCvsE2XQn2oRfYGMkZdMOPDMxuAyOnvXmdHiaVdv4Ip71pfDL1FW
         cuDkHkRXHEEYZAEYh55j2sjvSGNTWUTihHJtdjvkOZuZesTW3F9lo3ACWDO5MCj4A/s7
         1MtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383663; x=1789988463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8i+ALZ2u8Nt8nDqSx3U6TdSULZzHy4J/I0rxt1wzTA=;
        b=cglAHzbrKMG1H3FH9D7nPs4LNSbtSMymvFjMRahhNMJzvXpjzdNsSPfCR9+WBlsetJ
         gi7wbYu2WmkJ0T5WZfPC8iImRKfNFgHeHxnDjSFapBkhNoVkEDz9xVw+tshGmtWoIH49
         6qA2vzaBIqmPXNdOzeWidc11A5z6Fri05JzDNKf54DJ5KYZHiIPz1AHP52rJ2imQzFgP
         +QpP8gB55bu4eVLeWO/7wN5c99UVbv2b2uNVKHiwq9NlZHpFCYfPwKMrzwFq2sGMe7ZP
         BTTQ8GMBMOpbNA2Jm0+yl7DV5+DPSIibZiF2FIYo4uu94pjVSwinzq21T3czV3ZjlGhN
         fetA==
X-Gm-Message-State: AFuF++lwCaEGWM6/K3A81z87l8GD6UFHOEolInNvBGqtJUqB2Kr+0dji
	C0/pFFxNh+9OY8XzK9DlWLQCd8YlBp0qNNzC9jrP8b9rfTVXfGrpadaFGZ8jO2j0LoS6AWBcJDk
	899kcyHOrIytN6mFbrKQeYgM+/97KrjaO15vDdD7w6GOT4sq2bf+NCKwm24K2//Mi042r
X-Gm-Gg: AYBFou2pAzqYqPuOLyilpqw4iE+RELy7A/vMDLXwAAvddwRkPqcrx1JUNPJUnEyPmzN
	IUhcURif4foOt/7MHjoSPw+Q/md2cj6xvoNZevwat+WWFwCaR5IQ7taCNy8cXsGU+FBOncYeNT9
	Pt+4N5I/u5HMIwPxRZyySwwreiYvuWbIobexOzBFjLlp742Dmrp4DsuGQQf/6QbwGXzacyme8YY
	fTDb5q0VImnntLTvOEKNQDkWUMBXdjunQ2YIJy2Z6B1I1srXARiwyPtBl07C+2kFWEjt6mswguN
	BFj6ozDpAwTljWwsYhdblyDXezOv2TAVRUoT2viWylIFMx8gD7zcpy6oUJ/22eQEgIsMH6QAcwO
	LZhx6aAYa2sOcnK1pO27z8Q==
X-Received: by 2002:a05:620a:170d:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93a29cd92d9mr263325785a.6.1789383658005;
        Mon, 14 Sep 2026 04:00:58 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93a29cd92d9mr263318485a.6.1789383657547;
        Mon, 14 Sep 2026 04:00:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660219d0sm407548066b.18.2026.09.14.04.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:00:56 -0700 (PDT)
Message-ID: <036480ca-6308-4e36-88ef-3af743a85f28@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/34] arm64: dts: qcom: qcs6490-vicharak-axon-mini: Move
 PCIe phy and GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-20-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-20-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aoFiN-hMieqx9KxIsSlwQ6k17971x9Qz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXzFTisf66thpQ
 UxuvQm7WyFWwmLSOnO5fNiyonCU3SowTOhpRqciEll6gqb++eB/mXiFnZ/goDkEQJ4ybWNe2+Gg
 y/ksxDlUGq5c0i1rhhe11VAQTexzL2s=
X-Proofpoint-GUID: aoFiN-hMieqx9KxIsSlwQ6k17971x9Qz
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7d3ef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX7kFb3uYOmAcn
 9EehsrdCQCGqzGpcAEF69DrUfnWTrq1Qth3qsL1jK+SE0nS7oZiQi1c1VdhWiV8d1Lcn143do5N
 TBLM0JlI9w1mva9O2R19AXxOUNRS6MyNKp7chRD1pv7J5hUe9F7bhZXMNFI1OCaBO3CZb4R/I/J
 X3Ly1tfo7Dzf4OyOME1xruD/n7bJDy96k6pGKbuCj73QqMJ49ItI810FoeNNaGYoQA/P92ebnnz
 yGYSdF6j2GNkn6jAZ5E7864g6R/Qa0scMDS/YpN8mNZtWBswinjDbR+pAKylQWnt79oABgkQhdO
 xr3Dn7mG6NyVStgNU6QezQV+bgKA8e2QoXBUZQMGF9PJQy0bdR9FafWu7PsoqaFXMEuL6FEsHqg
 Xp8N7ObiE64ACzH+M/RVwf3iNG36FR73eoMm4QBao5O5z+syz4iUkXS6n4hG2fZZVyAmTLClL3O
 box1x2l7rluX3tr7T2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The perst/wake GPIO properties are per root port and belong in the
> root port node, not in the RC controller node. Move perst-gpios/
> wake-gpios from the &pcie0/&pcie1 controller overrides to the
> respective &pcie0_port/&pcie1_port0 nodes, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
