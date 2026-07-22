Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451141ADC97
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707387; cv=none; b=otsnBwAfEB33se/xU6fV1wkns6py3S258GdkfqdqIpL5MTRv9iFJmJM+y19G38L/tZ4N9MeMLG75hHQlJyeBtyhaH7fM2rLI5eFHPcC/T7nVZkXnfg2uTvPfWFPntM6/AudJsfAOTXoVDx9dRP8kV3Ykp+ItywMt4dhVkm5vHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707387; c=relaxed/simple;
	bh=/+NiZi1tJEysQiVg+Xfh5dwTNRNU6FgC1Dr+pXjstsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKwWZ3GiVuaGEXlgFD3kHWuKX7eVXdWlbty5dAqN7PYez+l61NIOknVZo0e7rui2Sm0dMvjpn6ZG6FCw8m8tlSLnLR9w14OBnj/VdHnYtQUKPWG5Oxt6D/TXI2Fp0KsXCRYBTRm1j4MJV0XhP+JU1hs7e6Jgzllb5x3ayTuQtVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVwZCkgO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaLFz+JD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVwZCkgO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaLFz+JD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M5434m3883452
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3YLza+Mco6SqiShSL430kfFXyShTCFaucpwzk2WswoE=; b=VVwZCkgOwPI73iOZ
	ZbPgmLIwFIVHWIXa/2KJp7Iqw+SFOKxZuVnj/pj+BW61orvH2LQ5kTzZcseDxsRO
	bLIhflkxG9josLydQtbYv6M3cjJw/5NhjGTCXaVEwXPYciBMb52pbtL5XCrDVyQD
	U+AauV8gNp5s6f5PbA84eU3i7YjmFTbnP3F5njFgMgjifH0xrlO1teSjAg4LlQVF
	O1m35X2jM76qk2/hv+xcQlBPqdZUd9po68TjF0P2e3LTqwkqwkfL7S03DbwManOU
	wILyfcsU0PDJ5zTSoPoroRIgztNKV0zyLigmx79fs2SvvfXtD0Syr883WLbrzAuY
	5QQ6Lw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn11bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:03:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso15444728a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784707381; x=1785312181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YLza+Mco6SqiShSL430kfFXyShTCFaucpwzk2WswoE=;
        b=CaLFz+JDWX0U35mK7CKYGCn986WrLegg48OziVyoVAe9r/eYg7sFLg7093aF/AolFU
         +mUj0R6FCw0QXkpt47/ArBfK85r0tMKZkUIk6+trddH02fE9RJzd+qnPTOBGA8qo/P4R
         DCXlxn9xGYHPCUDL21GP4dMI3WZVzwF1ARLmhApuHRo57HPwqYuPbSn7tyEREJTGmQOW
         wrD/q1pYKJr0EZQz6/XA4TQfF+71TdVW6fWOeLkr62a0xIYGODaVW5CwkA36owkHh6s+
         WSA/5U/F2Asm6I0lMb1bdIl4MwYc6G/uvncNnfrmnjUga+jJJTJJAo9tTYd0ayq2IbHi
         M//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784707381; x=1785312181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YLza+Mco6SqiShSL430kfFXyShTCFaucpwzk2WswoE=;
        b=erKVq0rtxxE2+6ZuSEMVt7aH3t5UjQPs/a9ySpkh6HvZ+RBwYWo56MrfmnIC265S/5
         cIx5+hb87dNQrvcTp1lussn02uzjrwqSs5kgRnNbItKq5b+KJjoVBoDS8PgyvIb9ipX1
         F3/zt1xnZK9weYDHAPzMUOqNVqYMxSndE/FpsqNh9EpnKp1+1IbN6waTkFIY/bxT1rff
         Z5mjW4dgtWOHwLZ4wHQNJUIEDxk88ROW1IVPq5XUkCDfHhfjkAleDVbYbP/X5eJKfill
         pGsMyVtc+Lb6VF6EC2NVhX/KkiDm9N/hFyo6eT/jdpH2AK+08LU3FC1b4AWd8RijI2V4
         Wvsw==
X-Forwarded-Encrypted: i=1; AHgh+RpW0EvvlTHN02H4jaAeUDeJrm5mPcMS1mSfXMN8ddHWdKf0wOSglFzYgpNn+/6Y9WopTjIaLkJteHNCt73J@vger.kernel.org
X-Gm-Message-State: AOJu0YyqdkLRHxLq2HCD2JuJnEvEkHX5HYvrza0HaKyprlBRhOkEA5JG
	fY+2vaLQzMLNU8p3I84fMgg7wLgMYho79CQOdiN3rU3gu4i/510kMgWByaTFhJrph5f2evHGv2g
	7m8L8PMcHpm6tAiQDHd5f8CxX1YYmKYp+OX4GZtE37f72ZVn732xnJOFGWFXjs+CAVB8Q
X-Gm-Gg: AR+sD11ki6QEa1A+mcySOiOOfEzNKMrPWyBvXaxP4/1+qNlZYqqzJgSg350kIaZXV8P
	4Oq+E6i8QzV8PW44a8DyEfh/YTE87JLD78L0YE+89CSTRd63z9GeFJgq9WFdbwLTVHkDQMHrBvF
	4Kzq1o4x1rCXosg9vpX3HCmSVhHBym0oYRlbXKqIjzAIT4O4oLQIAKFWuhpaVWDP/bASrO7pZAG
	Cw+qr50I9UiXRgFWr40IlGXGZqc0D3Hpb9H9/mQM3bJwqMP9XHnYR2xBoAkyhoOpoFwXHhg3wrt
	cP+7iPxrBD1Y1U5PaS0DVb8olNvlMMkTlLtrB7SGMzKa2gCgqkUB6TbknNNaZ5aes/6H/ozO5Ks
	VLA/OmVbsyVddtKwleVGiQOapXD0=
X-Received: by 2002:a17:90b:3f86:b0:38e:7297:a931 with SMTP id 98e67ed59e1d1-38e7297ab8bmr14046130a91.43.1784707381210;
        Wed, 22 Jul 2026 01:03:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3f86:b0:38e:7297:a931 with SMTP id 98e67ed59e1d1-38e7297ab8bmr14046084a91.43.1784707380728;
        Wed, 22 Jul 2026 01:03:00 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7aa85c3sm611869a91.12.2026.07.22.01.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:03:00 -0700 (PDT)
Message-ID: <515b04a2-b595-4fb7-a72b-2885121e0066@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:02:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] media: qcom: camss: Add SM8750 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
 <20260722-real-diligent-pig-c97d3a@quoll>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260722-real-diligent-pig-c97d3a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a607936 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eB01bHF-wB_RgGLiRNkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: b82DxpxB7hdR3CuNpAGlqMx7qZtYECxo
X-Proofpoint-ORIG-GUID: b82DxpxB7hdR3CuNpAGlqMx7qZtYECxo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3NCBTYWx0ZWRfXyQ8Md235D5cG
 oM2VUVLP4sNr1PkHJcArfuIYo4r5LdjS13izFB8Rfaim5pjC8k/S/0cwCVSgjuz3Iaze5tL6Sqf
 /SdT9LZ79+DmoNTfBbl9eeEJg6OB1u0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3NCBTYWx0ZWRfX9VxcVHqfjNu6
 yUeOBu3Fnb6VIfIYlBwVqdH/kEH/XSWnKntxVCu+L4SON1Mq/mKpWRwrb7b/6rc1jqZdvn+bNbk
 oyrNX3yM0p1p5f4EvyFzlUnLjy91PYNHfIz9v1vZDB5QBgePg2RaH5qw1NOWQh2HLXbzUIgggkV
 gnq8fxWxzYjOzwGrRPBykNB4ucaQTO168X/cF5lFzllkf3rdPAcX80Z6KjKb4kyEcEJb8jfvUom
 J97Br3w+QQ3qGX5mugSGRg+63UVt8Ee6xNsQvDt6UO+GqMyzKpf28QAqFaAvudwiololH9i/OpA
 Ndtltxqr7tseECDebm5xxYpWeHe/05qttPA2hx0azp3yxUVwUcYbaamMx2EDAtzcZFG9dM/ELlR
 hKuiCK4wZu3f0xhH5AWh7n8Y80saRtcK6b8mtRLZ53ljKfFMhQbZfBHdZ3Gs74VWftTOdiT7nL0
 xs+jBXfeQkEy2gcWMJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220074

On 7/22/2026 3:00 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 21, 2026 at 05:45:59AM -0700, Hangxiang Ma wrote:
>> Add support for the RDI only CAMSS camera driver on SM8750. Enabling
>> RDI path involves adding the support for a set of CSIPHY, CSID and TFE
>> modules, with each TFE having multiple RDI ports. This hardware
>> architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.
>>
>> SM8750 camera subsystem provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> This series has been tested using the following commands with S5KJN5 sensor.
>> - media-ctl --reset
>> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0
>>
>> Dependencies:
>> - https://lore.kernel.org/all/20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org/
>> - https://lore.kernel.org/all/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org/
>> - https://lore.kernel.org/all/20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com/
> 
> None of these were cleared for merging. IOW, all received comments yet
> you send work which depends on it.
> 
> This is exactly something Bjorn said a week ago or so. And then a few
> other maintainers re-iterated. Exactly the same, nothing learnt.
> 
> Best regards,
> Krzysztof
> 
I understand the concern and agree that posting dependent work before 
the prerequisite series has been fully reviewed and cleared for merging 
is not ideal. The reason these series were posted at this stage was due 
to internal planning requirements and the need to keep work on other 
dependent platforms moving in parallel. The early review is aim to 
avoiding blocking them too much. That's a dilemma that I was asked to 
handle it in this way.

However, I understand that this can create additional review overhead 
and confusion regarding the status of the prerequisite work. Will 
transfer your concern internally to try to avoid other colleagues 
posting more series that has much long chain dependencies.

Apologies for the inconvenience, and thanks for the feedback.

Best regards,
Hangxiang
