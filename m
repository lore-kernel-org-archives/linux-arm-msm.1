Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305241F5D9
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341429; cv=none; b=WOq+rv8Lng1BlsvGTvW8LyJ8KMPDNhS0wuckG72J1s1hiB0ZK1QwlPPKypMsrM31skiyMRdJ7yAN8wXEQb+erzGazy6ZtnbZc1MXGYoaT14rtX4H7qC7rLIJcKnpv77IyKXjaBL6yKNIzuEB+oXUjYUs+2RZPhpIZive3zmGdsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341429; c=relaxed/simple;
	bh=wrfDSZuEnMkG3ElTnY9/G9FsHzmlV/3isH+AzfcsoTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aRsv9sDzkJ7YpQmtsGTQKosIudXxev2Kq9DO5358CDZMWUpFo6d9kGZ6C3cxre5K1jFxCCKJ+wyg1Q7r+J67U4HGIMxHceRkNjEwC+QG8pOCC+kanSa/qHeBtcbW/7sCbHSvmH1zHdwUDR6Q33fbnfNAih5zV6B6Vu3HjYsciLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fePZ47wV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kbz5weN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fePZ47wV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kbz5weN1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829N3ln1080198
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 09:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pOa/6zMXyO9Lka4Syf1HMi+BSQSReukrFRWWaxvn+tw=; b=fePZ47wVqWsGP7fL
	K2mPl150B/q2xhc8KQgQZpaYbTsEDr7H2Idvi+8QsioujoJnWafAwIxChboEp+nG
	3k+qop8Leh/W6VCXt+Ei53rCwjFJY+vy5bX17HiCu/+d69hNj8qKh6ZB147qo8XB
	nyBDDKc6b09+l2Oc3Cc23dV9uUhg6AcxkcypUkAFkuD4cS/lNgVBTLi4OnF+t7Bq
	X5TPbaS4E4GbCdXDH5SzZB6k7Fm4UkWIL9MyOUDSRVsiTerZ5S91mYWmAyHzVdyg
	ueAbXzvN6VQ3TCyoi4YwvFQWIerkZ1GEwF6Vk234J0KbCQxpLonOXW585jUit0b7
	BhKbMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb561ea8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:30:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso22080885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 02:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788341426; x=1788946226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOa/6zMXyO9Lka4Syf1HMi+BSQSReukrFRWWaxvn+tw=;
        b=Kbz5weN1onZf2+CA9jEkYFSUEVn42VAav7t3dU6tEBrD6MvsL6/E4gjbL+SXyezuRI
         Vyiyubg979UFWbY9WOoSuFfMXn00B3l1xK6F8UJeHg1nTERpxl6GWToNzPxckOWRs01n
         eVFYB/1NTiz3Ew8GS/No7kXITCSezTOmlDGutszvJuHTdDj6Dr1Fuf8hVuBTJgcDiYDV
         SXXOWUh+h/XuQui7LjwefXhKSf4mGKiLRPolU0LhxXggDrZ+D/0JLYEFXFcHNi+3r30Z
         O8sG3GYtJFmZv+Oj5E6a7nXIs33eJrwoiVK70Tiq5AHZ5us9HHCxNwfi/vHMBmcEYNy9
         Qsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341426; x=1788946226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOa/6zMXyO9Lka4Syf1HMi+BSQSReukrFRWWaxvn+tw=;
        b=b5cudDT3BjoyrV89gnhNGgZEMlnoIshEOA4CJjoOKSQJS2ISPJn0CLAY8q5ZZGYiJZ
         ytiI/KEjLeeffP1OyjAA4CuoWIQzOybk21LHczdMEpZtYzUHNOo8ofoXUV0zl78XYKWm
         gRZkYGPuFzRGmQQYOb1t8+sTdpZmySbnz5GWPOaIKviQSTa/mHSPbyr0bOYWE8VQiWBx
         gWgPXkBnPyhu6nMXOVPv23uYjZqOjf89mXAXhe7Lz9vdytXgsR3SpeXCoU1VG1Dxqdea
         Hmbi/UQcENHQPt41nIK6Fn21rqyEHA8CYcV27xRIFkzX1chMnWV9mz08qy8R13gHUZaP
         tcaQ==
X-Gm-Message-State: AFuF++kjyhR87H0kHUNIiNSU2FoP657fGU/TUTxP7uKQqHFaS1hut0CE
	LU+wdTzE6GUFof1C5+Z9O+8h9rVlFSDOiamYkm/pa5FMp96EDiaDVhgqtErAM2qhEzI0p6VjSIk
	kX+cpZr8FVjTGkLH2/ja4WAEjJw4Z5wMwZsGr6IatJQPKW2FSPUfLLEFKaDGeN+yE0Y17
X-Gm-Gg: AR+sD104rxZ9PHLCaL6pCbVI5X0LQSm1B+4g0SvAAVPOTxyyrXCcJ6BiJQE6YPJLxgo
	l16Qaa3DlI/ELIBVFjSfnzGbJWJgaIfSAgmEOYlcES6yp/BiBvVtkdtMhY70DzghchtHljlMGci
	FxwXIkrCyt/bVtgdcjCWAJBty7IwABy5qfD+ROG61Pim6e1rZ8WuGqBrlKyWJn+3baz4jHhVnFi
	M6dAbIO3516O8zJKjz8WrXAQkO5QhQ0Af2E7vJ/i3WxU2faVvdUYssY88KhHqkY8j3YIYyBVhv/
	ALbBtJi4ThtVplDH62x355jZbtMkA4OVJY2t+ZjH+qPmrw0HfzjJ8Eo7M5z7ghsJGNJxkfYl+vn
	Gv4HnowPC3GtNDu5yPbdbug==
X-Received: by 2002:a05:620a:40d5:b0:930:a08c:cf9c with SMTP id af79cd13be357-93960e262d0mr236217585a.2.1788341425575;
        Wed, 02 Sep 2026 02:30:25 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:930:a08c:cf9c with SMTP id af79cd13be357-93960e262d0mr236212985a.2.1788341424949;
        Wed, 02 Sep 2026 02:30:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d9236caasm58370966b.27.2026.09.02.02.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 02:30:23 -0700 (PDT)
Message-ID: <46625820-4890-41e9-8355-997fac0c43e2@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:30:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v8 0/5] PCI: dwc: Add ECAM support with iATU
 configuration
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com
References: <20250828-ecam_v4-v8-0-92a30e0fa02d@oss.qualcomm.com>
 <176160465177.73268.9869510926279916233.b4-ty@kernel.org>
 <e9306983-e2df-4235-a58b-e0b451380b52@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e9306983-e2df-4235-a58b-e0b451380b52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4MiBTYWx0ZWRfXxguqZCCPYbfl
 +znDSvo5keeTS36T7pF1PLYXZ8zdqqkffRcDqvWP92PR+uiefsp6GMkKCFazj9DqCridgApyNc3
 NYP/d8k3YcfBKwqz5BEiyXF+ZfYl7XsfpKekOLRcXwwDDYqhXH/iuidvid1xoCqM42Ln2pC6cS8
 /Iia5wJS9icytm0WA9WO5p4fAkQrfqxeYpMnvEd2eoHmOR6kjFyF5f8YCYsW0pmTT/DGETDA3Fd
 qBDeNNYXGVzrQNqGbSSJf9+7xA9A0MzxPUFrbfgXpAv9985Sp+ePQkXclUgGHE7bC/IIZLRBZmY
 wZbVnHzHD0lldjs1VdW7LHOLpWyVgeSabcRWKqiF1CHEomKPnIqfJ2ZbxwSe16T3WpSdIuSxIDe
 5FOXPrw4SMM9ZG1oBKgU1ms+P+6hTLhbmtn2ST+IeEHsczroDq4Y7hlTRlTyKeYt0O4B9qKvxcj
 NOeYjW+cC/2hG2NKm+g==
X-Proofpoint-GUID: RFkaRam0jb2uCA_Be_fwaYgwvE9FMgCb
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97ecb2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UULHRhTqb_eqUsvF39wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RFkaRam0jb2uCA_Be_fwaYgwvE9FMgCb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4MiBTYWx0ZWRfX1ibQzkg9HHPy
 p9Id3a3x/H8RWI8rk6VcdBipI4mr2aHDpPw1q4xMue99q1b4Lb9LZwS0EoorKC7krWEKvT2tQRD
 T4nT4OQPhhl2CgQtMOaOuWfeyHMJfIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020082

On 10/28/25 6:42 PM, Krishna Chaitanya Chundru wrote:
> 
> On 10/28/2025 4:07 AM, Bjorn Andersson wrote:
>> On Thu, 28 Aug 2025 13:04:21 +0530, Krishna Chaitanya Chundru wrote:
>>> The current implementation requires iATU for every configuration
>>> space access which increases latency & cpu utilization.
>>>
>>> Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
>>> which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
>>> would be matched against the Base and Limit addresses) of the incoming
>>> CfgRd0/CfgWr0 down to bits[27:12]of the translated address.
>>>
>>> [...]
>> Applied, thanks!
>>
>> [1/5] arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature
>>        commit: 03e928442d469f7d8dafc549638730647202d9ce
> 
> Hi Bjorn,
> 
> Can you revert this change, this is regression due to this series due to that we have change the logic,
> we need to update the dtsi accordingly, I will send a separate for all controllers to enable this ECAM feature.

I was doing some unrelated work and came across this. The driver
support has been merged a year ago now - let's plumb the missing
pieces.

Konrad
