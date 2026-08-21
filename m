Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E2047A0AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308478; cv=none; b=euTl24qtQ4iFSjPVwbcoDrXR5vHcfOrCbe3C6PWUI0nWqlpyAfO0ayfRViifRkh9CbqkHZgEBid1lHmDYAOBxm5JpqbbBeJDwy1SeAQ+SXSaln69G1yFZFFy9ePvUOGDBQocUtshkz8uTtQHufnOWwXRvFbdMlqIWWd48TZbLi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308478; c=relaxed/simple;
	bh=5zMdoPmIoLyyM0dKvIT55YTmQvzQmNq41lcYOrJS61k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+EfxvPIPpo9S7tUNqWFu2SjkMagCppMVz47rycXcYByRjdiJEfsB+ontB+nKelWDLUFh+DJpf4RjAy8Ix00MIGZqwMGivoyGREYPVJYwbXeICKm/sbRzqqZUJFZ7blWcXcP0tgZg9tXh+GKa2+XShKzTAun9NDaazZ/n04R07Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIL73qzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBQpwF3p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIL73qzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBQpwF3p"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LjFs1983086
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOjHPgH/1h78uGEI85ecUIBarzFNIpLpo5cgkB5sGqs=; b=nIL73qzpgMjL3Fbm
	Vvug8kPON1rFtGhYYtMsDLx2TIYe3eLV/GLvhFwh06koXcVOfzYiHqFXttycE0hC
	f/Dk6+w5d6y/HjGbXBzBJNWRwSnsBZQEViTH6cer9GQOmmPfWBJ0Q9bjdvxnN+dK
	zBhVOKHHGeQVZxYZl97q27YrQWAd4n4jjf0XrEVtIDu93CCcrkQDuvPnLzN29621
	AjEU+Nv4qbZ4j7xitpYt1RxWTOW04rvedqn8gh52NKOPJLsADiTf52xffWiPMica
	ezWFzW/mP3NkwH1CDEB8lVYCj4/8PkV/GvbEbBr0/aYkw3QDlReknlcZni03ZBRU
	SeMtww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdshvfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:34:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84865f326efso834294b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308468; x=1787913268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOjHPgH/1h78uGEI85ecUIBarzFNIpLpo5cgkB5sGqs=;
        b=MBQpwF3piHKG19aTmJB78wCCUdYQoLnkLuqv974ubnCPidkzGL2enshXkCHU3gy9PG
         Wlom50MGAb/aFt+K/K1/vq1292embPePzlibkWqbJXsPf/NvvXJVZU6irhQ2xkos6TXJ
         w0nIZSot4vS+IXdjPxU8qLSGOi8j27CPSswl3ZH0aKYeR7hO1kVh5WqQrgULori4k2bq
         cX+kzLNv6EuA41Na39HTFM7MbKSmXPXc8ZKE/NI0BnL4oNw6Mc72AIpsk3m4sW6CJJgU
         F7w3TuSaXcFbvp8BEbIxc91csHTILtt+gORhHbEUKeXB9+1H6y4uMQcisYqN8l1euhTs
         Thmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308468; x=1787913268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOjHPgH/1h78uGEI85ecUIBarzFNIpLpo5cgkB5sGqs=;
        b=JpsuNicP2dmTQtgCL1DllKwQbLb3mAegYDXQyMhYQi6xkMmUus1vQoqeIiT0/B9PZl
         p4zjRPKk4Y48TFeuBk+X3O2LItfx5twd0lXskWc+ccgAHpjlrKpMVw90p1CsKB3oXDrD
         t+9uureVAHkSBzojOctTQel1pHmCG6d//7gW5aMQ2/pGdqut12v90F7qD8dpRMeBTS2q
         fYpu2JmLOUrfkGV4liCXHiTmktn5Yq8pNd9jTof6HI98JmVruU8gcGuHhWWLgnEmuTJp
         Duiost11gug8hzIffpYxQHMpdIC4pYucqISSa6SMhR43JAYyx/OueL8CBmj2lf/1LgoQ
         73ag==
X-Forwarded-Encrypted: i=1; AHgh+RqrqVc9kyrsZhBptsbUjNIUAFlqaH7oDcIrwvbYxoq1YYB8dmUz9RyG4no4hyQxIsS1hY0dlTbNef9qPJWi@vger.kernel.org
X-Gm-Message-State: AFuF++mr/xe69MOpOm9mZ114lPIIwoF1roV/ChEBOjIVKyUlZ+lkDMmG
	JIv89JOlEpdoMNpNm3vVYRVFxsnYl0HUoFF/DBA1QMXfNkNTu2xB/ydgSTsCW23UttXMywf/ERH
	esNIqi2yfPf2z151ljrO9y+mctHB/OMDVc0SKFoT7PA06psxkt/1KaHy/sH4XhPXjfOOz
X-Gm-Gg: AR+sD132f5f6r1u6IuqM/hfFPZvAijAmn8Qmz3uDb01x16r//dws6CK/FGwXhKQX2sF
	7npjh38/Ag48NFCCL8wb/s04cGjrZjYXNRu3hzQKXvnjKB3RGvsgUopJQxlA1ttCq20VlpjA1ZN
	hink60LBtY3IydhecWXtayHvBV636XSmImsr7RmEkfzDU7AgaoXx4jg0mvym41a08SadPlJi2an
	obEUyM5IYt5bSnzgM7gRRV44UhqSXjcve4HuTRab+Dz+VMqch5Idw6TfYMpx70nrynsexlIVCds
	L3hSjB/DcsS4YkxEl+gYXmlJho3rxMa5sI56FcqUkIi7H0P1NYzJ4ZoHit+qpi9e59dK5HEpa0u
	YEaGjQFddH5UaK236BzQJ8DzaIYu7Tz7Y7dRW
X-Received: by 2002:a05:6a00:2305:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-851f9f42680mr7475528b3a.8.1787308467355;
        Fri, 21 Aug 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:2305:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-851f9f42680mr7475452b3a.8.1787308466823;
        Fri, 21 Aug 2026 03:34:26 -0700 (PDT)
Received: from [192.168.31.188] ([152.56.14.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3362860sm2688575b3a.8.2026.08.21.03.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 03:34:26 -0700 (PDT)
Message-ID: <812d71fe-40e2-47c8-ac4c-ddb8a45f582d@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 16:04:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
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
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -est9Y3bo_-A6rGyE1aqW6UEN6QHMhy5
X-Proofpoint-GUID: -est9Y3bo_-A6rGyE1aqW6UEN6QHMhy5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX+pL8rN3ptJqI
 kCRwANvVCJbr6HaIz4J/XP0majUwRa1hHHGjjEUSAY0BDY89RLV96u101DO7XCaKi4yxhlpSAm1
 O3OED90WSUB1NWmVXquWl/pJvWVYPVU=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a8829b4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=UgjVaFD1vmiot8dKuSzQiw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F55jpGqvRUC9acNfLbcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfXzx+XoqV7yS19
 c6OVtA9BJq10HS7bD5/G/kD6Ve+GZcTSnAFQRgdFq1QwQ8mJTy9zAVVCCATMYDa8ht9/X/K6G6v
 lnZjYnkJxGCwL981uNkwiHf1fPnbIMNAQFxqWK4W1wT/7KtMn/0b1FWkYlUaqRLDZ9Xj6uc2Rk6
 sYGG6S+HbofXVmXKwrlFd0RmmT0o+h6arlrnLMdc7EJWfhBnsAVaQLj29CkJtf9S2m06EN0h/I1
 +/h2IzeMVzVwBJso7tDuoo7mXnk6SpBKn8eCRaB8rgBnSL+H8gWVK/KgsdEX5GqKOKUgdAP7Z9V
 8FmmjuT7InZN2sp1j6uoCt6Ku8UDZ0yXxO06OZWrGi7BQSkyUVeHD+GS3qNNMjA4rJLq5wAxGr9
 FQSE0pIe6lCxAmJW8q9qHl0fXJHfCXBvQWX7TeU1kp+MK39Km23UMc5A4JAPja36jRf2EQwWgJV
 mrxu4qs+0U0dw9XD/nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078

On 8/17/2026 3:40 PM, Konrad Dybcio wrote:
> On 8/14/26 8:30 AM, Pankaj Patil wrote:
>> On 7/15/2026 6:59 PM, Abel Vesa wrote:
>>> The suggestion of having the CX power domain tied up to the GCC
>>> controller started here:
>>>
>>> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
>>>
>>> and then, for Glymur, it has been brought up here as well:
>>>
>>> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
>>>
>>> These plus a discussion off-list led to this patchset being done.
>>>
>>
>> This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
>> Reproducible on latest tag next-20260813 as well
> 
> Yes and the ""fix"" is to disable the GPU nodes because the custom
> runtime pm dance done in the gxclkctl driver keeps a vote online
> 
> That should be fixed instead
> 
> FWIW ath12k is causing some issues for me in this regard too..
> 
> Konrad

There's no need to disable gpu nodes for cx collapse on s2idle, I can reach cx 
collapse after disabling crypto, camcc and evacc nodes along with reverting
this series, Specifically arm64: dts: qcom: glymur: Add CX power domain to GCC
Can you share the steps to reproduce? Are you running additional steps before
triggering suspend?

