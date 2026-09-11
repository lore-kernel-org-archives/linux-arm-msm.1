Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF613D9DD3
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 17:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148655; cv=none; b=CBGxzNTqfhYtiPWFNjy5ZkemcUBS/EcmSMKvQezY9I219lMOnJOcefxQh1hPXhir8H9/dfC3HfRCUq0o0KXpcBMNq6GB/F7adLgx6/V0IgIwrE4fyHugYaKwh+cbRw5ayob6ohvRCLefs/1q/VcowSf7LRonPfxqBWDWnnaz3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148655; c=relaxed/simple;
	bh=iSPOqrPEqNzouRgsfdtXLZvJztzijYXXcFDpMwJ0MLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dt9p8bEJQwcossBeRi+ijKL0kd4ROY8mii4AcuuPZn1Y+3FsxqYtOnVlizRWBXcmDtO0dNcyt6GIKn/UV4uHYYYx2XBDYBf3NMspJjQetS90csi7i7ly+uStvgdFyZS0FSsFxzKiM7aSqxwJFJi1SDnFhsULP0I2SbyAwEwdCHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4IDtP6q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2UM6Q2R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4IDtP6q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2UM6Q2R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWTw64119230
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 17:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DgHv3EdPhIoOXyHYgFVg1PHeH4W7/S2tlAAVOYQ4qy8=; b=n4IDtP6qSCRsrs5Q
	Ci4u+5w6+EkIJ71oFw1Y1zQstpX89A/BA76Y5fXofq8whvtRYA60+EDh++ODP6je
	093MTlj0PZIJ9QWlFP+CTD4uZZMyeiGMunBt7EcTEScrl+C01OLfh7GHre4s12y1
	p1emmt65w4qtjfhKGdQ0ybxnk3ASvHxEWv4UMubu4tDmyIPnDgj9gYU53c/dwkf2
	FvTwmMILkTRQLxInIObPo6sbKMLwJc3pzEHDkZlbI1ur/FbH7M7BQO++fEB6M6AC
	1K4lQ4UInF8h8uKQJHH7mm5sHbSuXVZkUgL19Gd7LkJbRFxbUT0AZfrhu4yu0VMT
	UWsiCQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmnkmr62e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 17:44:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so968893a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789148644; x=1789753444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgHv3EdPhIoOXyHYgFVg1PHeH4W7/S2tlAAVOYQ4qy8=;
        b=M2UM6Q2RpbLz9XEG32Hh7mBTLecw0PAyI7RHivV9LWBslUSTZK6lEyfA2AE+s4EdqX
         47WEI8GgtTDy7s2Sryt3hkQhoVz6TGmWm7taa7QmlGKNaynwhHY+RkicKxq0PhJd+lk0
         2qakA0Gpj6eJhDx8m4H53Y6TN7+va78k/1WOPtIsWeVoOc6ZSv3KMNpxR8GBUD7imCS/
         Ierw0Pv+jRo58RfCVxCsdZNRn7LNdM+kjbjzqAMu+W97fYwQtxM8fBPjwtgpeG5eGjIK
         5soquehSo7gDSIaHk2oyc9O4TvDo4HoiwCqISbXArfmISiovupHJsFg3APO9qiLHwUgA
         +6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148644; x=1789753444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgHv3EdPhIoOXyHYgFVg1PHeH4W7/S2tlAAVOYQ4qy8=;
        b=gHu1sR5E5HeVfFcThS+KkBUx78X2VQ6XPA6lqKxo4Yx0zaAQb3Qf4M+yVJFXkEd7ur
         BHSYyHWUUkgoA9q5/2WGG5aqaxbDZKia+mCrd1eUrFNvkWshf9BF2SIFPragtmKkMJLI
         x1SE/fFpuiwHR3a2q8vjUxx6AYnxB2qdUaQEh5x6uHNqgfQTYATwyFcVa9U75b92/Xns
         KcVrSa2z83GcT9QTKypxBLodCU7KzEUfU+Kz8uOvhA3LG/jMU/dmzU5d5xUxtiMCSYBd
         YnSDDfWnPgxaEDVRs4e0LmHquCJ0+ShMBWvXdNBy9OIqbcPI1Cebi4foRYZtVjeWwJkP
         rFFA==
X-Forwarded-Encrypted: i=1; AKwUvBzpU2hIFeXuSGYeHgIFLEiyvPh0ZKBtru6RWabn5BO5pJd1Zgi3kK/UvLPunqSfLVNr8i6l0VJYxqk9ZoqG@vger.kernel.org
X-Gm-Message-State: AFuF++ngKPVQcyqtSLRNqKoz9k332EpkvkzyjpeqSqqZTzrqixT8Iu33
	yXPvdOXSJSORGNIPVdKr8IDEcrXl2zJBUYspKr6UrrBt/Vi6ZHvrlaqbfqzyYrTkvYZ2qZvyB4h
	73x8hh+4amAJXvffw13zWvoLkOZDisvDKchiGmKg94+DjmYSm3amlz7SBQI902ZRE5Xfo
X-Gm-Gg: AYBFou1KrMPFbefgD2fWLt3iLEsfp31g/gE4VdXB1CyF2jHTqVwmZ/XT48HyYNQR++O
	huu4xc/xDftR2lvJt3Aa1eoSy0vh/sUx7xxuhu/kSzb581b4HNYq7rZvoHzlLdnuwEz9Jt1/DRF
	IyuyjAk+RnDZT1NR3Jqhy1JFa8QAb0ucaSoGpXpykn4tFydYP0ApCwglnft3ZDCxzRnJsSu8sO1
	PLRK8wU2qoE4TRaZ9T3dd1tWgjqw01PykJPzAbKE2FWQGsW4oOf5YY1uKvLg3pybkqwwEqOiwbn
	4ol+2bjjm2+843FlsshknKVVRh9GIdNEKzlbD7tqyPryfdIrCt1kB2lgSoCjTpFhjw6Oi2TRmIf
	/bXcCFJJwPrdbEn6qr8m96fzZ1Wx0tiagjGA=
X-Received: by 2002:a17:90b:2689:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39d9bbc81damr9099632a91.1.1789148643605;
        Fri, 11 Sep 2026 10:44:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39d9bbc81damr9099566a91.1.1789148643138;
        Fri, 11 Sep 2026 10:44:03 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.104])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm7652016c88.8.2026.09.11.10.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:44:02 -0700 (PDT)
Message-ID: <ccd42f9e-935a-438e-b5c8-2643cd5cedf9@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 23:13:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, iommu@lists.linux.dev,
        Daniel J Blueman <daniel@quora.org>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-1-2fe43ae45495@oss.qualcomm.com>
 <20260910-careful-finch-of-fame-eeeac7@quoll>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260910-careful-finch-of-fame-eeeac7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0OCBTYWx0ZWRfX0Gfc80RsgjXe
 IwAxDtpR79TC4qmvkS+SbeqmjIZnaU2PmiqJjXQJfAyTiOdH+Kaik3N51wqjoNZskD3uQbS4XLf
 3YR6G1E353/CLacR1MS7SAauGwuUkm8=
X-Proofpoint-GUID: O8kF4QwzAG7yjyVie8xKgv1Cysx9NQZf
X-Authority-Analysis: v=2.4 cv=N/C8hG9B c=1 sm=1 tr=0 ts=6aa43de4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=TwCXObd+TJU0JWB7kQOUgw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=t9ty7G3lAAAA:8
 a=EUspDBNiAAAA:8 a=gweAf5VaqOsLJRT3hzwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: O8kF4QwzAG7yjyVie8xKgv1Cysx9NQZf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0OCBTYWx0ZWRfXzHcngjen+p/m
 Kma8bY2cn9MlebQIMszpFjfCg0cMK5UuCZDSw5P8tnnmMBp3QymS1Ku+fQAMGQO9+krSM/GUZVd
 3PWDxQhK0XQl/Y27Bs1GaVqofI1RB6JGBMqCFcxCxX6No2OnnfH40s5jqpSVLbIajm1LpuNPZXb
 7s+ase/C42hkmkj/2CekPmnH9qlZZ0Fs69vWHKdy7tRfAPoK+fkoHjQO2CYHSNd/He8IA527t3h
 Ad8ufRFT3HkDmkGOOrZG22k+mnILiQZnap3KAUGkZKi5mpji6HiEoLPQq6N4hruSG1+sdCuuVPy
 ZQ69dknXkKNUYLbMlVn7/uhPmWAHCOhu14ue9vnKCogN0gL4HD/w6fYrZc/szdyY7KjMcPmAa0H
 XOhE41n1RZaAfkxLCIwxLNfRZsRnjTg2bRiXR7R/oArjHu0gD0yhKoQr1nDipCKbw1VOzN5Eewn
 HMiJKbct4pypRN58Zqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110248



On 9/10/2026 12:29 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 09, 2026 at 08:27:08PM +0530, Vikash Garodia wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> cannot address the low 600MB of IOVA space, while the pixel stream can
>> address the full range:
>>      +-----------------------------------------------------------+
>>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>>      | 0x25800000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | pixel stream addressable range (0 - 3.5 GB)               |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>> A single "iommus" property on the video-codec node puts every stream in
>> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
>> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
>> that boundary the hardware faults, which shows up as unhandled SMMU page
>> faults and spontaneous reboots:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> Given that the address range restriction is for specific VPU stream, it
>> should be ideally be moved to that stream. To achieve the same, a subset
>> of streams is now represented as subnodes, so that each can be
>> associated with its respective addressable range. The design was
>> discussed and agreed by mainatiners here
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
>>
>> In the past, this limitation was addressed with an iommu-map approach,
>> with the iris driver dynamically creating the devices. That approach was
>> later concluded to be a hack to avoid having subnodes, and was NAKed by
>> the iommu maintainers. It was discussed in detail here:
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
>>
>> "iommu-ranges" on the subnode describes the *allowed* IOVA range that
>> stream is allowed to use, so the IOVA is allocated from the specified
>> range only. Define all the possible subnodes so as to describe all the
>> VPU hardware iommu interfaces, both secure as well as non secure.
>>
>> address-cells, size-cells and dma-ranges declares the 1:1 DMA
>> translation into the parent.
>>
>> The parent "iommus" is kept as an alternative via "oneOf", so platforms
>> that have not been converted to subnodes still validate. New platforms
>> should use the subnode form.
>>
>> This patch depends-on:
>> https://github.com/devicetree-org/dt-schema/pull/207
> 
> Please drop, not suitable for commit, keep it in the changelog
> 

Sure, will add this to changelog.

>>
>>   Tested-by: Daniel J Blueman <daniel@quora.org>
> 
> Plese drop, not true here
> 

ok, got picked in b4 trailers, will drop.

> 
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
>>   .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
>>   2 files changed, 97 insertions(+), 15 deletions(-)
>>
> 
> I see this causes DT checks failures but I don't see the report, so
> probably it was because of schema dependency.
> 
> Best regards,
> Krzysztof

