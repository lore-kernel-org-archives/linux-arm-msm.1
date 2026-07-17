Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481853C278B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280881; cv=none; b=jA5og5wkNSxZ7QEICTCwu5LljEhRlRQ/a5/anfnotCf1MB5HyAMQrGK+rTXZ7dUu3HUoAjHpvmJ/cq4+ZnhgJUNxe3cvwRpZwHj5R17lqh1pCMOgjg8/qWx7fCsnzxZHu+5Ip2kn3HVYuJ58r0Nx00/6yiHjg3uqCvqlGPu1vOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280881; c=relaxed/simple;
	bh=axS8o/srj9XtteSbcbZNxaj6dBukKPrDdBZt5pjFzPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/rrAWuPb2EvZMxBmyO0XjZDjw/RadNqn4V1osw96+e+evlKdcJ9B0f69CNPxIwlCfU6iLRW1DdPEGJ3tRsXnn65wEy9i7sCHN5RVwVl4oAPwHERJ3i5vl3XrazEbU0WMzqTQ7YEDqSzxfiSlVSZzHg79PJGcIeN/zjOATKQNwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HKVNZ9Sg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fam0skIP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKVNZ9Sg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fam0skIP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cblX979995
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ff1f+m9asFggdFlRucXXN3qa7FWyn9GytmMCTpiohMc=; b=HKVNZ9SgpRopGIoj
	27N2CzL8WCIwxl54uLZwrfA30I/2uLVH4FbmmF6QgTFPM56JIjskZqXzWuyn+G7T
	9J3mhGIv8bkmNABEOLcSjwPhg3E4oXZitP6tf5ia86G2CGqV+1bcKEtRzi2qWlIK
	Gx0b8FKeAEBiIiNJeQLJcMmAf5oRgckSrsXCz8GXHiAJyBB+wfONMTva/Qn7GxnO
	fq1+cfAaVSsPCx25ROk0/wkcfFjgaQv+n/vJKCxGmrLKXovQX+OCwBGb5hxeFfhT
	LByed0qkEnOuzwaGI/5mPldvGWfy7Ocp45AjQ2CtzYxKkyYcWyCgHzvBTam/lTNh
	Wu+TEA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grp40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:34:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ebb599e528so16629866d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784280878; x=1784885678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ff1f+m9asFggdFlRucXXN3qa7FWyn9GytmMCTpiohMc=;
        b=Fam0skIPhBjjrsDz7uXXffG3CSVNYz+HJ0KnCEepqv5SA66rD8cTIgDvGeyGfFHO3k
         /INgHipFOmwXi8JHkX+2wlCsku/Eyh1bd4lnWD0vr3aFFay8VADOYb+IM2CkHzugpSnD
         odXBjjhi25TbzNhsAtztBc1FL7fQ03QK6JrNx7/QNPn7OinvVIUDVHvPg2KQBKbacwMI
         1FLkaxByNPshXPzFXd7mxyzOOMzKqaG0Pftbat2ISiwkOI/j9i7bb3mNs6rkzDe3NZyx
         j3EupJPXkBD3RbRaowZccIymk69JHDaWIfM7eVEivaimZZAuRAKQG+g+paV4KHc7+QqR
         mZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280878; x=1784885678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ff1f+m9asFggdFlRucXXN3qa7FWyn9GytmMCTpiohMc=;
        b=VF4JcSWR5WqOzm2zjU4PvvVQ2ydd257Wc49GVgrDJYFHWpy1AkwOJb94aD/iYFCin4
         /eMNXpoqxozAg/dbzt6BlFV6gMX9msX3PMnFJC1yDnQYyZexFukKi5wfHLmbvYI6zxRd
         cZYCAiVk7pZ+T41tuXPzXsDrMlv5aO9x7AknyE1se6KXF+fTN5gzZFgaVRM9JlHpey+w
         OYu59s7s9LMsS8AEUl9+saLYkSdmzf1v5/PZoqh+jyC04JjZaDdspzBHhiqydzcY3NGw
         AZLEJKJvq38NbhFpiMaoAerKgAfCJqEUAIFNycEsijbw1UXRAegKbU6Ga5JgfzrCcsAg
         HMOg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+r2REVoTuTaUvGYLennHJz1rtzxCOkzD5GsSh0SzdseyhcHoph56q82LCk2amB1B14yRyXSAQnysracBT@vger.kernel.org
X-Gm-Message-State: AOJu0YwWOqYA3NqMJFbgZQNBw7tQsuxIzPjldFy5LxizcYfze8sJsc9V
	ZgH1/4lxCLyuk7qIoKGnMdcNsz9YzU1asrWNS2wiqXOMoCQZvIWvBpRmrnpTkefqvosFc8kfJUA
	w9/ueSRw3mQzK/kM2AlXUjMIYu+dAcYUqd3b7zVL4f6qDiqcf6byQpl8+hd0k6DawtnZp
X-Gm-Gg: AfdE7cnnY3pjBmgaMVdsxnlHpgFUbpZibvnfKWz+8+i4iUBySP8WBRtZbykcMrXcnyc
	76qt0KQNT4BjXrGst+dNkqEkjn/fQf7Eu5fHocxAhjkVd1lcFqvKOTjDbH/O/BdUzSQU9Dqwi0e
	NT7RiTs+uOdByyltIHxGqVnF5Ik8aUCoQTNUUXEe9IhGNF/oDiuc+XkjLt5V8EnISt7dGQNUsVg
	EWUCJDyw253q1fjt/OJN8MZcy8PBcwRcOdBBxLrKFCpRkEkj00CsJp18mmbtmrUPmMPPBst04YA
	XUqG9wqGMk/mAMHhNED8TIpLJLeDuuhz3Be44xFMpRxwR+NMksI5xeiOcwfTfv3JgzRH1VFTvFi
	1wOE2xcpZwEBDjpnVPdhQsyo8
X-Received: by 2002:a05:620a:a119:b0:92e:6071:7cc4 with SMTP id af79cd13be357-930b3f73e4fmr119223185a.4.1784280878368;
        Fri, 17 Jul 2026 02:34:38 -0700 (PDT)
X-Received: by 2002:a05:620a:a119:b0:92e:6071:7cc4 with SMTP id af79cd13be357-930b3f73e4fmr119222085a.4.1784280877917;
        Fri, 17 Jul 2026 02:34:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5fa3asm45991766b.35.2026.07.17.02.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:34:36 -0700 (PDT)
Message-ID: <e4a1699e-b2c2-466f-9cd3-aa1073b8e45e@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
 <4b543abe-2482-4381-b41e-623cdf5be9a2@oss.qualcomm.com>
 <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
 <316fd37b-9936-4bca-8521-9a11ee65cbd6@oss.qualcomm.com>
 <almBxBhYxTR9n5FZ@baldur>
 <2e9a211d-a877-419a-ba8d-40bfc42e65ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2e9a211d-a877-419a-ba8d-40bfc42e65ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5NSBTYWx0ZWRfXwGBLw6HyYNNE
 Piar22fu6uzFK+ubhNDNaohF7bmedFnAtV6du10SAqcS7EQpUF7ghm+rEybFqxnVeCdiTvCHX1T
 0kftOwIWrSKw0fLHFREShL9FPzD4uv0=
X-Proofpoint-ORIG-GUID: Bsww5kvIfPezkVC-e_EogPIqzJc-VfN4
X-Proofpoint-GUID: Bsww5kvIfPezkVC-e_EogPIqzJc-VfN4
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59f72e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JlJ7fyL7TRLw1iIcAAAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5NSBTYWx0ZWRfX9XJ00cR54oPw
 NYlTayGAaVgDomlQAqTlAcVIX3YuprAZy4wY+Qq7KTKjyYL81DMdJekGzqJ8/vzFXF7XjcEG4kY
 G2J9EQawQF0iO4iBFB+7EfZg085pCcsKu08QZ3rka06a6LlGZm8YzoXJdwgWxqSJZQ8eB23g3Km
 3/BCjs57pYiUGD/GiZWaDZhHqtY5hyyrEpsCrdsWnmhOM75zeE1g080sgoe8+iwCvYQIL3Wk9Jq
 yiHpz8wrJjvpYffuskk0lM4SktaipWtHkmOkTnRUTVShXhgREdh/S8Ly73YZIukd9DTpllphy65
 ll400tHuxciXBeOgUOC9Hiuqo2v/gbQbBxKd59dxJzj2DCmcp4bTnBIvNuqGqcWVpm5UIJOzfpR
 fs6LobAKXQhEBQ7CEQaWmYcEP1FeUGbBJRBVKYIQNScRx8GIne7FwG7c+Zw9W909qmEH0ZaUH36
 YTCSoPZmj2jQtRosiKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170095

On 7/17/26 11:30 AM, Taniya Das wrote:
> 
> 
> On 7/17/2026 6:45 AM, Bjorn Andersson wrote:
>> On Thu, Jul 16, 2026 at 04:42:11PM +0530, Taniya Das wrote:
>>>
>>>
>>> On 7/16/2026 12:52 PM, Abel Vesa wrote:
>>>> On 26-07-16 10:13:48, Taniya Das wrote:

[...]

>> You're expressing this in generic terms, can you please provide the
>> concrete example of what this would look for in the Glymur GCC case? 
>>
> 
> Yes, Bjorn, this is indeed a general requirement for a clock controller.
> 
> In Glymur I do see that CX could drop to retention corner in case there
> is no vote from any subsystem and so it is better to vote from clock
> controller a level above retention using the required-opps.
> 

Is this still a valid concern in light of

Commit 7178817f1904 ("pmdomain: qcom: rpmhpd: Skip retention by default")

?

Konrad
