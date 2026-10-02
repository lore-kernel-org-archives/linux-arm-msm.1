Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634D4F5DE4
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 17:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961461; cv=none; b=SDueeqibRsQTln8aylUSHTAA6pLuadkbdkB7Sg1ddoNn/HPcxQkKi/wbf/pJWMmqx7xvzkHiMxYGG/v8nx7VMrkR7oiXVALLdHf87OYd64qpRfWgHeeHWnpF5KjHTXZJiWnfV8EgEZ14QW5NDpx9VAl3CfvgJc2VhDvzZ1kz0Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961461; c=relaxed/simple;
	bh=cOSITwGmcb3cfSGmr/b7iRLqk+4E6R+342jJ/eURH24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzAlUne6UTNquu7JjL+zAih0ydPYSctuekzdkv1m9Qlycj7vKfCqDRVc0EeaNe9EvWTTqA7eDZlxnnYZv2F7UCecdiLf5RxaRy9PPuNtNl53WiRzDt9j66VQhVmwpRn4rBnaxEjNzGNOqmqqcKAy2+HnPnVPLjT5aPk4AN5kt7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeyvJ7f7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6laGOy6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeyvJ7f7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6laGOy6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H61Hu3057724
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 17:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=; b=LeyvJ7f7HWN0nxoi
	VfuPp1B5rlbqdq0LoaDpuDaHbvUmBwfq89IPBS2DFQcDK+/C9PtFDDVmmac/Duri
	0wa5FzkmB6Hn0nBNXJn4LG8NSalOejtpKKEGrT0Rd/tSMSzNBRbjug/DwoO3dPcW
	wscWeTJoKLsXpsxn+hG/79IfDoE5jIm+kk6dQ3dTTxIZq0UHQ3NTSAVaoHQKKp5K
	eVw5OGOqHIKB4b8kZ+wz1koDndZIMKVLGgO2IKLhxO7z0kJ0uFJ5oQJdommxer8h
	BUYdX3Zggpq7d6+GeMLDejLZ+D5H66nCqbP7TYNRSVkOyVGpNJk87kEnW3LDmLDZ
	EUcFug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp2j1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:17:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a0f55a3941so7667177a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790961452; x=1791566252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=;
        b=F6laGOy6aI+NVxOsTnVAh/dyMVRc1Ml//c2eRI7NZfwgR2YLuReNgaq15Naj93RKjI
         wt4YZ1uq/EtYFV7ORp9rxADaC4LaoGXm7bA76QlTy5YVM/O1WiUyxvDFkRHd9ICWVxpx
         nhqw0/pKapAP6pMjQ1W+H7sPKnJJp13y2bTr0eMPUspUeNJXs+YpeReVstZ1RR4Ad5BA
         ZGoJckjo7CFDg103Wu/9v1ZLpDIZNTecYClamGPcaZgA2iys5Pal15jX6xlhc7ZhhJJW
         01EZgv23g6F4mswyTb8H/KARIZkIaBPvSFdy0bvL/6W5zpqZgMc+96qv/JrgT1BdYLID
         U3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961452; x=1791566252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=;
        b=ECinXa7bkJK7D2HR8Ug0v/aADbKZcpATR06VDX0AI4NfYEHwRojTVz3EwBNNzDfaJA
         jAuJ8hsbq/sA5JZTqnV10WAljlDYrthdq0mF633HsANJiDZNMBtOl1NTiPKz7Z2Lg/vj
         Ja3Jk1QKniAqZDkN1WnfrM2jMPDGPYxmavUxiw1tV7tfEE4YSJukVsqTDcmoVLO9ybAO
         oKAiucLfn7KJ/oEPpVFwZ9JkGzw0bSTWr1b4C5NDmY01zzWB+UjYD9ZaNZG+lQt0QbRi
         OXjxHCSJ+XQrNNwC3CpeNQm7MFdCzz1ds2jbPoQtHlCD/hlT1mflxuW/+EOqkKVKmCjd
         /jmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3e5qsLgR3pYBULQNOg7c8ax5Jda68TeHuiMFW5XWAn5rTwhKh5KhdR/M3FtbWL46xEMk4R2eRJIIucYiP@vger.kernel.org
X-Gm-Message-State: AFq9FYJeQBkoyLnXGucauvygERCuJ+swTQDpsBYO3BF5i4nAStXxO5wq
	mc2q4kBt0jUl4Eec6Op/d1AcereQfP9ePQqPH0n3+U/i7K4uw3zBHdFO79jlH3yR20GUSIIeeW1
	MPIWSLUaSTTXUeokNjuOE5sJQUo527QFVD0kOUV7+Xwb6uFLYDwbIRT9s5UvQkFkaTfFi
X-Gm-Gg: AYBFou0n5D1YmG1Jq5Agu5Ac0GGMWBfTU8oB58TwYybz5FU91bq7DwfJMDOzU6O7T5c
	FooywmR/h7nKFMm4hMvYhw9LDzs67T8cPhjdkGeh1D+gbY7OGuV+5ZZesnrthMn/eZfw0gGgVT3
	fWtqhELQVQYSYN7ktLtzF6rurrl7AvPazc3TwAgRm3IChBcodCdOxDZ7F/qB7PGkQ8GYYo5PAyE
	9KwU+A+B+WGPnhKKt+GN9vmQXiof05ysDQ5FlOvFBwSbLnEqGK4DrnzMnJE6M/D4/Q77plpvArS
	Ig1JsXH0YWAtgjlky0ppQmIB3XNHLJMCWDpIyavyhZ0Hfkec2swLFCs2bagXPp/NXIiu61ETaRw
	QVtuKDP9BSNFDrBYiGE8al5dKfvPE
X-Received: by 2002:a17:90b:48cf:b0:3a4:ee2b:31ae with SMTP id 98e67ed59e1d1-3a6ceadba84mr3133201a91.49.1790961451457;
        Fri, 02 Oct 2026 10:17:31 -0700 (PDT)
X-Received: by 2002:a17:90b:48cf:b0:3a4:ee2b:31ae with SMTP id 98e67ed59e1d1-3a6ceadba84mr3133178a91.49.1790961451018;
        Fri, 02 Oct 2026 10:17:31 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd59187csm5295357a91.10.2026.10.02.10.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:17:30 -0700 (PDT)
Message-ID: <c5af97b8-a595-4531-aa68-6c5e6187b3ed@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 22:47:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: qcom: Add lpass clock controller driver for
 Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6abfe72c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=3s5aCXBOHJDmPDD1+4kJVA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gMLPUS0fGnAuojaj054A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: FHbAmAsoJJ1NztXcmQCq9owj0XspMa9o
X-Proofpoint-ORIG-GUID: FHbAmAsoJJ1NztXcmQCq9owj0XspMa9o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfXzFdPkhcjqT6J
 qcHamzq6ngsacpkhCn0qzlNHK3tCEEnfNRzibnw4kM5K+DEXZpL/rXfLhED5aJSrK0Qh9VBHwof
 tSQE0eNMSt77rtrkmLbhZ21u6sAl6Mc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfXwKbxy+FfcmgR
 Oa1PP/VvgFJJejol4uIsZy//gJniKQHK38p3tWJPs+swkR4CtX/HFEZIPDRMyVcoS1jZ9IxAGb8
 Dph9zTWmsyMnGU1NdCLOa71HvcUgHRNdxDy9PR/K0pIdN1t54Hbrg4DsrkhbR/Pfc8cB78vAzLq
 dxFvl1QqkVFNU/ly9ui+e1TTpdAkdeNwTNSkKZquD26wcDu3dmH3XZLCCNWrSuQ1/cQ1ERX9ba2
 a7zVvQmgYGpso6Xwf4DRNrMbcw8x5UVLWq5mH6OKaovbOgXnGBpcuIyZUv93kaSe7sP6jGah/xI
 X4vh6L9gSZSIcr6YDYyRVLu9YQkY6ilKmLPiPDerDcbGKZenKZZUTA8Qy7FKg3DFwC0/Zf636Ge
 OdoGzfZY/a3GXYRVaYIGLmpzKU6U+927PELlWmV+tDS/xv4Hhhb91+6FPNKV5OT3kKyNivlE5YO
 CQ/7eTp7nZxlzRJAKmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020068



On 9/25/2026 2:16 PM, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on Glymur based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

