Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944B232B130
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608408; cv=none; b=XqlhntS//X8QNieHLb5Evr8WyenyeBdqaRc6X41d78AROUj//9Csr30FLKHwKuXXXU/zu2Y/5vx6XLSyvVH3v15aJfWvCUm+BObpuxwdUrsMc+hwaLEyFUry4vvhTE1Hjk/xNSPNyMFTCU8vEH88Z1PiPp21npxZGysEMIHYing=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608408; c=relaxed/simple;
	bh=VlINqXCi/iiMXTXeTXyhms1lsO/523VBgaa+rvuTPfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=do6rVhIHulvOqbSStUsKD8fPyGH563rn52E2Sq6YgHJ+ZmRY/Jvzr6sXpehJ20s57tNRyTFQPJMlNhHdyQH0dh52EYg1AJFfeNk6RyfJkbAwgS9OXRRL1jBxesHHwBVRKzTSBWdHjiloMagMPggvr1OQjKPBHS5S4YY8c1uNpoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSSsfnwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fp9L/fTL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSSsfnwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fp9L/fTL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D66TuK2453191
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgCNASx8qOprTigY2vUWSc5n1J6xUE08JXG/QdWQCDs=; b=kSSsfnwNnkLn6RyS
	s9jhIm/Srmn6Lx10b17hYnBaGxLWif7LxqwYr58x9AbPnkGdvbaHXJRpkBAeC7/2
	oVe52FjGcxgBZI3GcAbmcdQ78mIkmSLDNIxoXXw4VuphhlNKWpDsT7E92R3BPemL
	Xn6IGGTSlZVYVNurSenT41WfcBlL7ZbQ/9mz5BsemmH8EYfSpKRcejuIGc07k7AV
	ACB4L8BMwzVkE7l+4bgZfGoTwkahYf7nJthMDkQ4efkH0Nn4fYjstbrOKipAMCHy
	K0LpmWY2/uo94+VuI+FmCY/Vz+aup0o8iqTm319HMKq10RCzLinWrCGkk9Jj4Hnt
	pPSJDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5gg6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:06:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9a2b95b5so325683085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 01:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786608406; x=1787213206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgCNASx8qOprTigY2vUWSc5n1J6xUE08JXG/QdWQCDs=;
        b=Fp9L/fTLUQXJFJOb7CLdhFd+VXDd2NHr1OMnGZQ0edZK9vztqBXjOvfw4JTS+G0XAi
         2Bm3sbumcstiqdVoeYDvPD3ieNC1xDciFOHpp/ta9+RN0zTYBRvjQZQ/ELZ+WbIWiYyZ
         Ir9xoA84OQ6KhepF52FuPg+OM8Sxr9qGUDmoTXnGvSx8A+H+kGJmT7zodqVpyto02G64
         2Vlv7n52q4XbaFWxzne0lByJWv96jl3mRWzERpahAGz5fk5BXolLVOwJyLUA/kla1Iam
         zoNkbPwNxlViwl+7zxPUi8vRdqy9h83j6lyzSX8dKOFiSQqqYK7FtABcHPxDRUFKpSGW
         bQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786608406; x=1787213206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgCNASx8qOprTigY2vUWSc5n1J6xUE08JXG/QdWQCDs=;
        b=Zy/z2gnnVG7kPWX9kWz8f3Cx+ZUzQ4XU5uxXYzEhukNikGV380s3jcb994ZZfL2VHI
         Y7J3y75zb+UJgJmaOOBEMkHG/YDTRpKFRmZ/OoW0ltNvY8+CXVZkK9rcWBe0Sb58WwgE
         xDoARmU+O5GMXKdIQjxtDhuFCE+Z6PQ9VCAG0GskFKS1VP4vP1Yx0PvX+syLuOYuGqLl
         9tJ9g4OXvEpzSqLL6YCPAe5OPOyWfp2ltXMhKVqSYjqtntS4WgrWsmrGtb14yXMRm7/j
         CCwbqb4787K0fYE8cf4PXuYpS3pK6KYYNS53br4DeqPrcEl5cd0mM4VqwJfT5SXBULaO
         mH8A==
X-Forwarded-Encrypted: i=1; AHgh+RqZcvigknftKz9MKA1xfF76v2UCiT7CItpZ4XpKbSYI01g0gV/7ZzsRQbc4GmvzDQkL6SZNr3pfSDsVBnRS@vger.kernel.org
X-Gm-Message-State: AOJu0YxGRZiHUWYiaqRXhZ/NM+tg3GqzRRvWrmZUduPqPZRmoJdrx64h
	0Jkyuv82rxjbq2UxwmxjdkFCc8cJ8FiwSe3K5uxh2cgJkImsx5LR6BWg3ZtfuU903+MUBxsity4
	Q4ODaTrNS3sHMQ7oYcXvFJGJqZfzCjkGEQiRzdFOfSVM/cC3NgWoTcO52bFdigUXHdF81
X-Gm-Gg: AR+sD12+cK5QOpQZLf8K4P8JsGaZyxpsv5GJTQa8aFIgFqc+vj4QtsTycgP2cRQApJ4
	fN0rVT37gEp6AchqQADpGHiwfQPZIn4vutBONDlPMu1bsca1xBNbhpqL0miYEDUnN+iY4vGnkts
	FZMP1YqQ9ZnN1NNiBZfcJ7tl4dCwy9atib/TrS7ROYAHAOGDj7MripIhJS0OjpMa6YKNDuQHKBj
	VutM1silYKTn7rir/xlb3W5e69REYWPVF2p3GnBNWvKljCwHUngBVOqzAHH6Z/vtWRyMgnUhX0I
	OhmMPtxNwzA+Wnw/L9wqQNcFV51Spb/HgIQfdjZeYaGaRNb0gxslLhwZ8Cq3kqVfNA/UhU+/WjR
	CPO9Ps1b2GccMbyDPlnmDWGPYbfrzbgBd5qiG8EhgCTzPzT5+tcXrlw17QuXPRrIR
X-Received: by 2002:a05:620a:4721:b0:936:583a:dd75 with SMTP id af79cd13be357-936bf8eca91mr390517185a.17.1786608405845;
        Thu, 13 Aug 2026 01:06:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4721:b0:936:583a:dd75 with SMTP id af79cd13be357-936bf8eca91mr390514085a.17.1786608405459;
        Thu, 13 Aug 2026 01:06:45 -0700 (PDT)
Received: from [10.111.164.29] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936c19988a4sm96648685a.18.2026.08.13.01.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 01:06:45 -0700 (PDT)
Message-ID: <edf70a43-feea-4688-ba29-1c00748a55b8@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 16:06:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <5jozediov63riomokjzcphmpkpfqdgl73j4hd27vx6yttyddar@7bvbitl5ag2s>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <5jozediov63riomokjzcphmpkpfqdgl73j4hd27vx6yttyddar@7bvbitl5ag2s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1NSBTYWx0ZWRfX3n6QQSgu5Eic
 d4TV6P8RhlkVIjxIAme9ifI2QC67fe3iMKbccwt2hfcSljGKh12gPTevi8SzcnXv5JWDea52PMv
 INNTWRZxFZ7byk5keklEkie9kuINV9Y=
X-Proofpoint-GUID: UJMbLZl_OuPL3s_7ip0tMwltkSScYwoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1NSBTYWx0ZWRfX3gPloGLMqjrZ
 4n5zqlcdEfo2Do9fA8eO7uM9xXRP7I8Y9nAgd+vNfqgL78TKDLI22W4Gw1/voBy4nSg4FPBQn4p
 pKHh8eS8r9kQc54ClueBtcXyDKaD5606dJx+MYJdWsOgAAtk4I+/fU01TInMWpgMwRG7C3Lt5ME
 xb7l5UzVeM35A4DJHb88iey163d8DkbNqbTPRi4wZn0x7F5xEUOOf0Loaebxdv71zY8uH740wfu
 hKI/436u4dwJPFkTGpZavrZd5Nh/jo9AAeTh+PYKvts/cOXX4d2Y1hKItIrqwbaqmaO0Hj5CCKc
 y91c8cLgBL97FsMfRJZWw/0L146XUYswhjj/pGDwpaxSC5XpKSmqu5MSRwhyvMLGCw64yFUjrS6
 OR7sMRV/0ZYnZB7d28v075nRJ9nEEDjMMAeDpsdlxY5asAQzUib1DWDlgMxLTSvmP0/VRxSTzME
 YmE315jMdb1dV4oITxA==
X-Proofpoint-ORIG-GUID: UJMbLZl_OuPL3s_7ip0tMwltkSScYwoK
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7d7b16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R0RQ14XjvGgjv4nrYs8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130055



On 7/22/2026 2:20 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8750) and Glymur use two display power domains.
>> CORE_GDSC powers the main display hardware while INT2_GDSC
>> powers a subset of SSPP blocks.
>>
>> Allow the MDSS bindings to describe both power domains and
>> their corresponding power-domain-names values.
> 
> Another question... If INT2_GDSC only powers up a subset of SSPPs, why
> is it being declared as powering up the full MDSS? Can we move it to the
> DPU device instead?
> 
Hmm, yes, it only use for VIG2/VIG3/DMA5 here. we can move it to DPU. 
Since listing more than one power-domain disables auto-attach, a small 
driver change is needed to attach both domains explicitly — MMCX with 
PD_FLAG_REQUIRED_OPP to keep performance-state voting working, INT2_GDSC 
as a plain runtime-PM supplier.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
>>   .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
>>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>
> 

