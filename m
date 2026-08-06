Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845474302E1
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010923; cv=none; b=sQ6A2jQ7OCC/eDNkCmT8Th1XCkf95GRMIHQmb51yOKoPgLq+gwRqvJGdabch9pheu/JCJC+eF0qgGZ3av1RYyVU9mQwqnwuM9dNSPONWzTniMz74glymqtjOwURBPVsu8X1I13UQA6ikXN7GHFv9Qw+Eis9FkxvpF0FQxuxgk9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010923; c=relaxed/simple;
	bh=xCxUMghW2Xyi8faCH5QpwDEU1W4G+MMm2rfwWySl39Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/Q2xaRVvUKtQZJLRvR2LBsYPeEe0oM0C9f7+YByFCoB5Q8ERKoB3A/1iePCOUUT8pFUq4PPfEGX5X/pmGM8GEfybbdgRtvMbkY0UP+CRVlvj6drHImJOAbQQ6GbQ2E7OJKlxMhLjxFbMUdcR2JZYAG2VmGqMBTyba+dFUO2DlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uw0BfDb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgNbhRBy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uw0BfDb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgNbhRBy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nds41578696
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 10:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iyOUQx3uVZC2rm7J8gJxSev+lJA8+WSrUOAuZsrWWxg=; b=Uw0BfDb3WPVliKgP
	JCWmPWixkfJdB0Ste3TtPH0VXlkVC41xuBL49//2EweTIOuqqEahmsE0FH+XIzjm
	+LTB7/wQxHv286yx/L6TwXq1Xg7PP7xqlMPt4kKSCHDdLmqhjgeKqElzLogUiTdG
	lztSsFVqQBSMQ5bng9x54SgDeg44CIcPPF7sgBnmBdiWg0dbhh7ZLXJakC7JJyUb
	FYPJ6C2EmyJ5dGPc7Z1x4xi6hT+k0JwVK6KbmXPNgHHy+38Z/njaot4+kLm30IF0
	Ru4HK4kBhpAeKQmc7ZbzvLMh7b5JfSjDyzK+gBOLDJ/q67WkG/sNK3rIeHAH75nM
	NgnDJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hfpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 10:08:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e667368f0so3340578a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010910; x=1786615710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyOUQx3uVZC2rm7J8gJxSev+lJA8+WSrUOAuZsrWWxg=;
        b=HgNbhRBydknmn2D5rakUwb1VEuUd9TFwuMT4RncEgjukG/0nqBQ5TEpZNphli7veP9
         aLT/yE6oEGBW44Ld84u0iLytS0ILudC5AVmgAXHXJaUC1x4vKyhrjLyM+7Av++JBjw1L
         aaSq8Pj5YcxAHv4k+mTGG8u5BFAoNqqMDQa5/N68NTFlKcYR4xSLH4gDyJAxfy2WfUqc
         H8g2pv1YUrgElb4YP13Iw8hS/zNSyN+YhPBGkM2m51pCxo5gTdSeuunKewdQnPOgyQBb
         1makiimTrUwofHyoAmcSlz/sNcfU2bgTNnzuukyMXzThZtQLtK5oQVvG7RmYXJ9EtZFL
         ePxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010910; x=1786615710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyOUQx3uVZC2rm7J8gJxSev+lJA8+WSrUOAuZsrWWxg=;
        b=sak/ql7jMkrOcLQPtDE3yEnLy6WryUeQ1IC12H50X0on7NL9KNuY10cVjrsvSRhI8O
         smOOsrVKb6ETQyxWpKXT+Ps/8fCWD9o9kC3vERO7N9HT6JZNLV6Dt+AXDh8lQWxkobXg
         xQHe3mPStS6zhL492gTpCCyO4hdQhJ47npIb9iPutFhh0pxGCBUP5y+DoOXqKWttdmRt
         5qfY2or8aWqsuQBHK128vN60A08+qbzdprKYi3sGrfoJUs6xNUeogV6wfpQLGHKvnzxJ
         dd/aFiDWDKKV+m8cuuCBS/AHnMggXlbpaNcuIfjXbwd5P+6FHx8VVnXQQaB9QA3DcEx4
         R1Kw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/MYhCvsO4S7Hm8femq1zLB5eXZ8Y8TjLsXIf5mIYsLF7IrM9GMop3s1XBr7bsRmPj12Ri/qXYR4KjpnCi@vger.kernel.org
X-Gm-Message-State: AOJu0YzOT2UntpIbKi8dUqPc7PTc3WgRcM+4G1ZInT+oMK3ogLUsLzw/
	/bWABIhdpCcG8g1gnATZt4AKc57JqnJ/MwBcJdV3BFWZywJ/kj+QZeEoop1pLjdlkpXBoowTq8P
	gXSZygCOpuDxuFeQWH8FxbWa3Umh2GQTOodouy83reczZA9sIe/eRif2Zc94WwJeXV/BE
X-Gm-Gg: AR+sD10wbS6nO4DEhqieVKUIGJ4W3HjyMlFTA6hVkBG+X7HjiHY0GyAvUbipu7AZp48
	hv8OPobzF4QgxK7t8ZsfgDEnN4JwbQsVt8JzS2WliQFjxRNU5x68k5JZqxOQgdtebkR3xdb8Wnx
	1jnKtFArmT9m/DPiEq9RvByTsAiTmWMCSkyM6ytFo5RMXD4UaAswZZQS2mJsu7YFQTbKTkY4iR4
	oRwILvTFGZJE2aJI4+0lMhYgPLC1fcHMQ85KKayqkwBcMkwV0BL3eAFDG32G4hg/M/x1nGpY/42
	ayRCWJIeFZcjHU/nRQCSxETgmG+3DGDyvlJE5zyicPZ/gg3LBov0CvB8liwwGfeCGxqGsooBjGc
	l4eNQxH1Qu6UMHY1wyF6g1d4k7bLKcP626FM=
X-Received: by 2002:a17:90b:5203:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3903c598ce5mr14953591a91.7.1786010909508;
        Thu, 06 Aug 2026 03:08:29 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3903c598ce5mr14953531a91.7.1786010909098;
        Thu, 06 Aug 2026 03:08:29 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm38533481eec.1.2026.08.06.03.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:08:28 -0700 (PDT)
Message-ID: <36b53e0d-82e2-4fbb-a2b6-3fd7b9c98663@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:38:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] media: iris: Add helper to create a context bank
 device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-4-da52b5228dbd@oss.qualcomm.com>
 <o6s5kezlsbe6z53jbsezeixp2wfrmwmvwda67t6chf57jnbm3x@ta5hktzs7mdf>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <o6s5kezlsbe6z53jbsezeixp2wfrmwmvwda67t6chf57jnbm3x@ta5hktzs7mdf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x-GhKx-dgNbJKeBIUJFO56u5blCaIM-s
X-Proofpoint-ORIG-GUID: x-GhKx-dgNbJKeBIUJFO56u5blCaIM-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX0vUmyEVZvCO6
 YhNrDVGPgKkIMkSIyqrHi9Ebd71hlOWkKR+NTeUUJ9pzqQ5P7tBttRkenQ3+BtYICNfxXfxQMMj
 yvLwYiAvf51rOJbA/thoXZb4+5IaOvH1C3xw9vXo7U3ToNbfSNcfg97tUFUdnVGLzOW34inONeO
 PLrfwuTjhvrcBVG1bPvFrq5YPHzV6teGXJvXaHEM6h85OKFY29n6rPLY+GExA0Hi95l9n36fA3H
 CxH17CDLb8rrMFeA2Vr7I8ZA+524shbMsE+BlkHRrDUgiFVrmj00OTt50AmWhkY7peNrXciJvEV
 w5QSZAlgD9C11xPiWW6LzZZ7eqZo/iKc8RKYg2Ux7oMqxawH3CBrRZovPAeLVM/LNhOQod/933w
 FxwPTtRrz5sGuMrVSqohMp9tYztTrDQDUznCqZio2AVbccMAK2F3rWznOl2LvdiknzwXtcNMb/o
 vdZaVwjESR7dEp+67mw==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a745d1e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=4qxhn-3g-SBwpGBp1HsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfXyaA+zcyz6wdQ
 CHSmp+1zY6A57WNLqzjsCYmDLhzxRfT2uBchgZsJZ8zrGfySpZaLVJL7/ucl4q5ZNjfN8Hx7Rvk
 BIsIC50BzKruC4pUOoFmP54pq6ZVwus=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060079



On 8/6/2026 2:27 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 31, 2026 at 11:52:19PM +0530, Vikash Garodia wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> is restricted to use 0-600MB of IOVA space, while the pixel stream can
>> address the full range. A stream can only be confined to its range if it
>> has an IOMMU domain of its own, and the IOMMU core attaches a domain per
>> struct device, so each stream needs its own device.
>> Add iris_create_cb_dev(), which looks up a named child of the iris node
>> and registers it as a platform device parented to the iris core. The
>> child's fwnode is handed to platform_device_register_full() so the OF
>> core applies that subnode's "iommus" property and the new device gets
>> its own IOMMU domain. The DMA mask comes from platform data, and the
>> segment size and boundary are capped at 32 bits to match the addressing
>> the VPU performs.
>> Return NULL when the named child is absent, so callers can treat a
>> device tree without context bank subnodes as a supported configuration
>> rather than an error.
>> Backports are intended since the first DTS of 8550 binding schema.
> 
> What does this mean in the commit message?
> 
>>
>> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
> 
> How can driver fix the DT?
> 

The idea is to backport the driver fixes till the kernels when the first 
DTS landed. Ideally the fixes tags the commit which introduced the bug, 
while in this case, was thinking to keep it for DTS.

>> Cc: stable@vger.kernel.org
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Tested-by: Daniel J Blueman <daniel@quora.org>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_resources.c | 28 +++++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
>>   2 files changed, 29 insertions(+)
>>
> 

