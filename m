Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C3148F845
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331869; cv=none; b=KcjliuFuncZNySi/Ts+tYIE4kGJSRfqkl0KlnCBCp1b4l2GT5PqH0xBSYHr7eIHt8bz5/xZS35uCKft9IIqkHvRjACooU2bsIW45gTO8slcaE/NoI9EDKqQI8VFltFi059jIwvs2mS/x2JqDwl89nAQhOAhc3mep73dXyfwSebA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331869; c=relaxed/simple;
	bh=//ydaMvuDcE3HJ/Z4qDQc9OC9a2+tOHr0C1rrcwouhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjYCj+LiGKVIWmf1LrXjzjxKJOdzmfhIglpQFhZmR1kLYoNBDxf1lyEQuaxQIIcdy6ljVW10fUgwrLc9ouQ4WRyymcdrXqnKY882VJha8dj388zLQg5johmr5Joqc7LycofKqa8TPZfLOsQrcg1v41t/vERMGCtXcWdwvu2l8ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EV2Q77qU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFEpSwLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EV2Q77qU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFEpSwLl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YSWT1055735
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxkbBoFwPDC5kONFYqfHLm2ecZsOlzpQCPq3LAhmLTw=; b=EV2Q77qUK94/KmKi
	NqGEuT/29qQItlpYMJVwpn01J0n0VFcAeDoA7TC50z7Y+kccdrnIAmdYgvEza8KQ
	j4Y6GsDxxSGQsqkwKW8mliB4Y4xDsioOUvi0AOhKiDMB3QhzEQw9oSBd5yHaf6gd
	P++Z7EiEXL6G9rLQZ/T67DPbcRDaSvjxiFuaV8B3AIpmbONfl5KDJJ1i6SfO3lpJ
	rvFrH/5yWxeQOiTDcX16KCQFQaBtntIn5UcseuGzm0DxK9FMEEHHVAa6KshexUlK
	gmEQXsL9TVTN8m//alk69bSKi46Njh0+la5dEEOKfudG7Wbc2UHCzrlvm444haF/
	Eapfqw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7a0bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:24:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1183845eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 03:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331867; x=1790936667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxkbBoFwPDC5kONFYqfHLm2ecZsOlzpQCPq3LAhmLTw=;
        b=WFEpSwLljsRE4eGHg2vX+X2JxeqlySVzH3/SubOXGU7u4mZ8lw8HKRdBk2yW6EYnRo
         nIQFFHyMs5cBrsdg1Bzr01lWWIr9PlcFmNQV3OAvD5zzlL7PNFFcQopmItjGq2hVVXdx
         q7mwoBVougenlO0Vc8P/cb5w45mToIAj4y+f3RY3+id21geJd+VCMOqmaOgrZVlsjQcd
         MqEIOnk9p5mXo+edPxekk1THntjiiAW9Pp5pd7IYY0hC8K7qnZC9MnjS0ZYnzppMOn3f
         sLOECSwG8q3tdzD7EI93K8vvPulPTSa+aNX7i9bNRLYuO7ytOBHf3HIB6dTekHLKIsee
         tiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331867; x=1790936667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxkbBoFwPDC5kONFYqfHLm2ecZsOlzpQCPq3LAhmLTw=;
        b=jNJvG2gbJqRuTBzAMeLch21oXf6atIWTa9cEs1Bv3tUTUnRAeJcRsV0gAngRhmGqpJ
         3385cMtmzDlrNFG59PhgtflulfMGDHcxNJmMIZYwWUr0eIeI4GrVD5sHnDRdxOnLCCxG
         L2f1EOc9LzgOIlCp3FTMXrai+D6FgpKSNqfrB8/a80sZi0Tee6nxvQRmkVv6PtZiuSD+
         6Eh/NaH06xMM2DXf4bc8PnDDO065ZjLubTPM11m6uN6PxEzNfKAK1ckrwJXx29lTMjsQ
         187skN0HH7n4RgdotMpi7h3z6weM0VKb+otYozAllKI65TubyaHT0k8AhG5GFr4+zee2
         rJZg==
X-Forwarded-Encrypted: i=1; AKwUvBx4zFNJlF1UiQOdXHGOJPAlk6tCmof/UUgsnOmAFAwdohv1llBcToM437yICJjU+lZOuZ5ZXhpW6y7lX2eZ@vger.kernel.org
X-Gm-Message-State: AFuF++lYV2p0KOw/WPMH6KmR4bd6M41Eplygpkdonf5PsfaVElWeOe2h
	jrwuVhjgohGDdAaVkNH4ConForZTJy1rAcNnetfHXVgtFPwiGdQ0bFyRZbV/skJVGTWTytUV0Sx
	Dh3U8yhR6vUzfX6So1PnR0v2rZkNZrMdPRWypl+mVWNtQGNeQ0SAJM5d/2Ri3tEKbSgMU
X-Gm-Gg: AYBFou1LCq8gq8pbJi4Ly30SN6Alh4fSyRIY44VxdHUle3UFetOC1aObpCeHD3MOKU4
	LLkbm1DCHoTvgiJTAUMfcWOBjzxzwihEIzB0+7rW8ODxVN17B6nIV0b/EBP8BSeV2aflejya6MX
	Q1A57j21QG0VVGISLwYqT5EKip1Yvv5dhZsKt18EZzT/KNGa+Z8HFnD81wAlOGuQ2vKebH/A3J9
	ta/vr6w5sF3y2ZlOz9i1R0p2UL8CtPFbwWji+yvB8J8SDiCgAdQFpJTBpuUR4Nok9C+otvO0XL6
	y6ruxhQAB/VekhdIwoi8KWajM5uKf3rhxoasPautjMa//0VgZ9SgPTBrhtk/yS7KC2NIEYUBEVm
	NgL+tja7UOSyYmvcfVBc2z3jsXk3Z+Q==
X-Received: by 2002:a05:7022:e80d:b0:143:2719:566d with SMTP id a92af1059eb24-145040d4075mr5212165c88.41.1790331865619;
        Fri, 25 Sep 2026 03:24:25 -0700 (PDT)
X-Received: by 2002:a05:7022:e80d:b0:143:2719:566d with SMTP id a92af1059eb24-145040d4075mr5212136c88.41.1790331864761;
        Fri, 25 Sep 2026 03:24:24 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb7bcsm4598842c88.2.2026.09.25.03.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:24:24 -0700 (PDT)
Message-ID: <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:54:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C2yMrsjX4FHi0VMd3X1QUnkwezfRGl_p
X-Proofpoint-ORIG-GUID: C2yMrsjX4FHi0VMd3X1QUnkwezfRGl_p
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab64bdb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=azjQQSWQslUy6IvBT_cA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX6qpuwzdpKGJ4
 tfuLcOConkSXREHcyD690j8q4QvKCyj1AA2ayXpeIMaAUViYIRje9sdUScmr4EGg6do03echHay
 JBlITwECT2kwX4i5MdEhuXQ9cLTVM0zRfkoi/HJXjVZx6DPZ0JbcetZFhQc3r7KP3ZGn6b7wVde
 7XJudZzI1MU1ljJgzzVJHO4/hi3xT3z3LpI/JFu17GTLKqqlsIyd1xC9XqC5h+urZvPilG8UWVm
 icTFkf3ItEVRdtu86xloDoCX88Cayeju5wYER3frdv2oXrZCHB+On9uoaDeNiz4+1d7UXHNZ4j8
 qbIKEJ1ISjvpP5d8mj68ORDyewjasy9FmXrHlqLbojI2k6YeIlAUGmwln9rTwL9OV40L2/j/oZc
 ZwVSN1Ts+NYI2V6N3rKzApuR7QU6cVFJVynfJfKrH+Vx/5rRF9LLfMBH4K4L0UIDbaxH36z5fVZ
 CMFqfWD/SFFn5Gv6PnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX01qEicy88dOk
 apxfWKYo4XBleBsM1lPeEXGLzsCyzCeDsBL7Io8R4MfCeUe23hNinam4ijJRNCAWOREa//JnLgf
 Ym8oHCZFM8lnzks3qNQm2QRAJ94vRCI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041



On 9/25/2026 3:13 PM, Abel Vesa wrote:
> On 26-09-24 19:52:32, Gaurav Kohli wrote:
>> Shikra firmware handles CPU thermal mitigation up to 117 C, while
>> Linux CPU critical trips trigger at 115 C. This can shut the system
>> down before firmware reaches the end of its mitigation range.
>>
>> Drop the critical trips from the CPU thermal zones and leave the hot
>> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
> 
> I thought that was the whole point of having the critical trips set to
> 115 C, so that the kernel can gracefully shut down before firmware cuts
> it off.
> 
> What happens if CPU gets to 117 C and the critical trips are removed?
> How will firmware thermal mitigation handle it?

Thanks Abel for review.

For the CPU thermal zones on this SoC, hardware-side mitigation is 
already available at 115 C and 117 C, and hardware shutdown is at 120 C. 
Because of that, a Linux critical trip at 115 C is not very useful. It 
overlaps with the hardware mitigation range and can trigger shutdown 
before the firmware thermal sequence has completed.

So the CPU critical trips are removed and the firmware/hardware 
mitigation is left to handle those thresholds as critical is not helping 
here.

