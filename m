Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3113E172D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554321; cv=none; b=FOjdDhfNL3MPDN+FT+XECD3kN85MkfVeJJGA3SOHPI20v7PWTbtu8RS4uRVjRt80CQ+kplbjbRGlZWBLIwe34awEXI9CLfY4vEOY+vk9tyFnkBLrwLzU3EiHBZT8NT2WA8FiQsSkEH9K3iU/ybFmq/jjNrlgvWoYePZj4bu9iuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554321; c=relaxed/simple;
	bh=QJx/x1uJdyeCQtfPDtlL4Fkzic+gvsWeXF0PqNQFmMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vke/znZAXnDJTIt20J7pXPMhHtMY0q70I0QMHvh9voGtRjyQSzpCIbsCdhr6aJVgFq11f2odhovt8NXwgcCZdjikgzer68a9zuI+GIvU2B50j/G8TGrbmH2h1gLSFClDNpxb7e5N2JCMUMtUaBN1Y69TRqbpDwzcbmDgLLSzj8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrYI9+g0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FppzSKQy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrYI9+g0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FppzSKQy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R5MZ1477751
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u2AMMF4moD1DhjCOdSZRd0b0jbUKpMTQ8qLoqAJnkSE=; b=LrYI9+g0TSy4woNd
	sq8gkjvZ2D7F9ytrI5IA6buVXq8//T01uIkKztSfoZ64VJil1T0qc6mNlByqpsbf
	qTBynW5zbsZUAk/atNjMIROIACbCKc+6JWpvBNzYmFZYVqJjIB+jkT5z/cfDOxa+
	FfZh8VpBxEWFI1ISBiUecCdutZC3NpBMGdKny2pq159LaGxZ5oklP8kfVBTlxgmu
	9zgeJjAHp8V5ZrzGAHNRo4tw6gWofqHvDmhpfO90FgQercGR4adjve5EEdT4gVWe
	IkccJ7CGwZG0ZCptLB6ebelu1NEPWafbXNrMmTRIbX9XQDlH+0EV6Tmv9eH1qgoJ
	n0/AVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528nhkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:51:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5682891cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787554318; x=1788159118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2AMMF4moD1DhjCOdSZRd0b0jbUKpMTQ8qLoqAJnkSE=;
        b=FppzSKQy8hKADUe0PKHXHqsP8H8tr7uvateYPJAS9Lk8H1w8bn3Q94v8pRoEDofpMu
         5PYMZ+xdSqWrmwtKbjJTQSvY1zgs0ib3STcGOdEki9hnejVBdzq0Ja+41zgPT7XFbIfO
         CMV9tDH/TIxo1B21eE9ex50K1dVdTc84k1qmlJ6HKdwyMJ4Wh4hDcgpqIiEL/hbghQND
         XDqN40pn7QZHanDr2rJt16Kr8h7F5ETUacOCVqNLjt1PyywnT/ToJ59ldI3u2Ya/32Zo
         gd3ZWWefYmhFGG8I/zCXX9RPWO2xDA3K9CbFs0sbfiGYHEGbohNh5Qfkyoe5F/PaNJcq
         rTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554318; x=1788159118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2AMMF4moD1DhjCOdSZRd0b0jbUKpMTQ8qLoqAJnkSE=;
        b=InKyIqRaqyn5LES/R/DPa89niVT1HOc2+XCDrurpSYy+B42aZHIOdFUJmHaOQuc6NI
         sAbl1jFKcEkB6Wu6YGDXZ2PdhPOudUfoTnD4HybsmFNrK1ohlUt0loXAJR809i7M8StN
         9Y2IvtyobQGYCrDJ391b1sv3VPwrvskIvPOeHXInxhB+QeAX+58QS5Z4HPdRjvf9T03b
         R+wnP4zu5lgGfZuDQoEXfClQGuXGxSf5EUTnyLOmhO36LNHnV6gow30FNqW4QkWSPsS0
         DQKxJQg1ZcVqO070J85w/U/u15L6gTwRqqH9XspwqWmN4MjIbtx30lRK1OLF/UpO3tx+
         X6vw==
X-Gm-Message-State: AFuF++ldnJjENbR8qfJK/gTCDuAM9fA2Ikc3N8FQXG7oueMZCf2KEBuz
	z1nLqhKXgS35yIm5jXOow882U50r7E+8hfx5106nV+qtBNwzHfdR0oI35kFlrP3RoM4A81Ca/jH
	1hrin4j+3OX62p483mAIlKCfGLMqGG4FUMpPRWP518xCeGLiXBW5whpdiddDBZnnKrldm
X-Gm-Gg: AR+sD119hNGGRD+QKKQxnkZw4rgA6sBBDsY3uaNDWx7HnUo2yN7UeQxGsoIOw8apF5J
	w2Y929MfrIjKl7tAGqVtv1fZVm6ar1wIfJbomE5hYjJVBcJ98QbEz9bUfWUw9VYolFLtnI94jBw
	cW3PLCf813FptjgmM+7pr0MBe27kMZLr9qngrhNd+yoX/F3NI3vN6ZyXe+xop8uHuhKm24cwwZd
	er2QHfoJLz30Z+eZrJzD450+ktWcMaUh5zZk2QVOAhWuOczBWNvNqdFymQ4VtVE03LqTPL97p8h
	DQh2Bci7Pj7ovMhYkgI+p8bSl8hmXQGLGaXErxi0Gz9K909IELLKa8d6XabMjYNqPqo3bh1Y3W0
	YqX5jpGosqCNlSXgdMO7a7gYO
X-Received: by 2002:ac8:5f50:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52df5a35311mr164652691cf.4.1787554317996;
        Sun, 23 Aug 2026 23:51:57 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52df5a35311mr164652461cf.4.1787554317580;
        Sun, 23 Aug 2026 23:51:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b161sm1211801366b.11.2026.08.23.23.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:51:56 -0700 (PDT)
Message-ID: <e783bccf-4f0d-453c-961d-0bc8999c4bc2@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:51:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs for
 ADSP
To: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
 <40c85916-6694-4976-95be-6ce2a2f19732@oss.qualcomm.com>
 <0ebdf8fd-de3f-418c-95d4-17474075bd55@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0ebdf8fd-de3f-418c-95d4-17474075bd55@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8bea0f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hC9g_JFbI4hlY6YCmcwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Dgntmy-iX-iLbjr2HztJIojZMCka9j9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfX8hbRuVMyOxdo
 WeW9onNFz7HYguFNv8pycB9cMFJ4O4TqMkfCwgasrdlwI7qnG3Q7aQ3H9/7AO6saiqCRX+h2vYB
 xtGXFhdJD4XwzWYvWOhEIOvdHYLpNhjLueevgl4i7SJMREsSULpSIdiBqyeXMgIVVPobzurdync
 BXmxB8Bu6lOEOifhcYgAiwKqZ9TmSvAecsrPJaPg52j7dLJFQpI7eFcWGK/t0yGgJ+CuefGSi76
 D4JHKeRkKmnbarLoBpvHlIVk7XIiYwmHLXLa6PhesDVYYJHZ9i1HHg2bGI0DuME2f9zvJQ2pmuj
 0XZP9Jf4tbfBaqBNLpZKEwCzK8NW6ARwCUJj+KnoqSQ4wg+BpdaXIgmOy3+RiZlK9IVLnKnIv6P
 2vZhVhjQVdc9AZzhnTbTN6HmPRxUVmhPKxN48CTFdI/hdLNgvq4Sc4FH1Qf+oj5+XrYbl1DYsuV
 /nlRFd5xf+pr1REKkbQ==
X-Proofpoint-ORIG-GUID: Dgntmy-iX-iLbjr2HztJIojZMCka9j9L
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfXz4Kofj7MhQx9
 U47IYQL9lrr/Fji0XN7LeFGbAXCj5iwH8Z37HF5EDiLBVTNVC5QAc8ShzF3V9oUQVRInC2ZpAL3
 G0lt+i/op61szvIYb6OKmFGiMq9X3P4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240059

On 8/21/26 8:59 AM, Iranna Mundaganur wrote:
> 
> On 19-08-2026 17:16, Konrad Dybcio wrote:
>> On 8/11/26 6:44 PM, Iranna Mundaganur wrote:
>>> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
>>>
>>> Add the missing SIDs for the LPASS eNPU masters to the ADSP
>>> iommus list. These masters are exercised during audio record
>>> use cases where Environmental Acoustic Intelligence (EAI)
>>> models run on the eNPUs.
>> Could you share a bit more details on how we can reproduce t his?
> 
> This use case is not enabled upstream yet, we validate it downstream with the
> AudioReach application where EAI models run on eNPU0/eNPU1 and need memory
> access from those masters.

I figured it may need additional changes. It would still be really
useful to know how to reproduce that, even if it's a little involved.

Konrad
