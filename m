Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3431468C2C
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961835; cv=none; b=iQUyEAuAIl7D1EMOpL5hByaGI1XglIvyq+Zg9gzEkPb79Yidi4t1On742O4dthUN3cGzUXFB+b8mEuzo9juWdeF0aFa/oqzuIKL6Wgvseqy/rxOlJ8u2xp6Az5q/mC/chNwLltXRseIUWzjCTY0RXiVrIpn5IkgTHDmJR2grp8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961835; c=relaxed/simple;
	bh=3dzxFQcUx5WQCAGYMGUc+utveYpfYmB+Col7Axxg32g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAF99pNNDqzX40r5/hnUIu7PD3y2Ir0hXMdqQb2vyKRB6PogOsiB1zjhjC0oUt36AY4F7wPqNOlpm6+gBj0k5BxroqlXpzrhOK3tdOGeEShFVI4YNzV4DM3Bqe8a3bKaY1t6vS2YNCdPptLTSCXjxHcVsWVyhW5OzqOeVRN7YfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ar+23hR5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8PnK/ej; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ar+23hR5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8PnK/ej"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCwcm3053123
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 13:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EUu/69R4pZrWxc32PXHedZtyNLLyryJiA5ym1cnr2SI=; b=Ar+23hR5eLWyzr7F
	BQUfP/DWw5t1xWvdNhCmt6bNQDqUFNK8NNWV4nxM7B2RbTXE2KUkNx5QoB/ab5DI
	SvR4CudEh24PfSSEyXcM739eEInftGg+4yQQfWumDSm/tR5z48oIoZ3x3jEeYugQ
	Y7bu8NzIgNs1UxmocFtUw2/1Bn2ZRb7+TnlD8Eptkx2Dwh9uaAsPEi4qXRTXSjrw
	os6KeKt78Ppt3xBHFAwiz6jPRuKCfoU3Tr4izJJT+RRVgIOVKRYrkrBQQFnFXPM4
	Hnxv3/1bnVftSmF8xEul8lRA3MGmUZQqJ9V8Kn2ir25AefH1hOM4O2xzFQV7B8H9
	mpqQ+A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk7920d8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 13:50:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c4d46037eso10046426d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788961827; x=1789566627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUu/69R4pZrWxc32PXHedZtyNLLyryJiA5ym1cnr2SI=;
        b=A8PnK/ejt09iI3lPbh9jhriStsap3jilBRNdXf8RglEB2/lsXl5WNhUO5fg0cNhEtb
         e6KTOLNwM9LFqKD16ukfRAzNvrgHcmZTc2YHx2g8Lp3TVxeDKdtsYd41Ury5smuSF555
         ppdiccl5rPympAImPsplIHADZgdvtLD/c7/KFuGibfyQteAMWKmQLl3wFMmzhhkUgm+s
         qI/9bTjZq5M9QQTXHFmZml8EMSPizHvuz3CGKbT4OwzY1wl1y/ZUTZWMW28vHUeoAyf5
         se8PdjrMcrqm8A1/b+hh3ML21VjFtKTQhwTsdsgQQOmgoPPTcKYiDATZBqRBtAWkVCw+
         NBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961827; x=1789566627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUu/69R4pZrWxc32PXHedZtyNLLyryJiA5ym1cnr2SI=;
        b=P7HlQQGbEYJbmSqZ2IaAB0kTvIjOAp+cW3R7D9brm9bvS6n4m7DUUb8n/Z50oCXnBr
         1eHw67bFLDzLnPKwE6w5kCgoMmhdbuoxvbB3bBeN+/FuilD414rAY5/4eGvpkCpNA6Bx
         ssovVkFlNFr2E2yItCmy+w58rJOUxl101M41Fw0u1O7oJoMQrJPTCYCMMUVZTCFhg+mW
         UE14GYRtgwvInwjaObzRrVRNasv3/4XxLASucwA8T2Y3jYNy8UgUUUW6OKXAuae8cp32
         OSMuml1oKVCK0PbWlEL0SIFxojltJa8INSuLnqmZTZWZ2aIrTYbDY5FcGS18ERZZMgNN
         Jifg==
X-Forwarded-Encrypted: i=1; AKwUvBxDSDabHScm3JNVN+VRtAhrrbfJt/KCvUFQa57fzF+CIdBmyvWnU6sVWUuhpy/GxifI+c9NB8HXi9HnL4fy@vger.kernel.org
X-Gm-Message-State: AFuF++lr9b3NjpSQRwIMIexWH0yCjfzUaiy+1NxUYNKMRYj9fvTwPCn+
	2xrXL81nOLyTzdpVjhOByg6pv5J+az+NCd2YQnwQude2pvJoOiQjtmU++b4m3b6WK5uJJZtQMcD
	kBeo3Uv3Z94Ihv8r1uTN17KkDP+Rx/jNhEPSJqWzfQ2GYC+DQBSomLjDhCdLtkw8LIjvc
X-Gm-Gg: AYBFou1PXlEWE9hAHaIQkzST4JOXBo0Pu6RF4ha2w9D5Lm5j+KPxnV9j9uRWWn5yx3M
	/vQMr2H6dgZaqkpCrCt+6lc5qWyoRxECn+/DqmNrZCl5JfIb6n42gVAFukCD7SlbGdQ5DYpcf4O
	6hRv1fEmaR6AbxU4GoRdeB+/mHYHwGKSjB/s8WiSK7T54MG2szB8s3nM6HrAD+l49fwRWG9Nnly
	W6djVTLFCv7zqlJySJvxFAyWnmzX3LEGyCJKB3UzsnNvZx4W05ZJAHJibMaTc5G64HDM7e2t4xz
	9w2EgUa5OmzUzQdoj+mkQdYbQ7BUkocHMeLZvmdl0QlPc3REM6Z1IXphbj52ArCSsgAx4xODNBG
	/AJVT96Ga/aSo1zC9mY3iJw==
X-Received: by 2002:a05:6214:2301:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9104771744amr280943236d6.2.1788961827128;
        Wed, 09 Sep 2026 06:50:27 -0700 (PDT)
X-Received: by 2002:a05:6214:2301:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9104771744amr280942556d6.2.1788961826639;
        Wed, 09 Sep 2026 06:50:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6dfad6sm775719166b.60.2026.09.09.06.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:50:25 -0700 (PDT)
Message-ID: <e9a39278-dbc5-46b1-8d74-581dac008b3f@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:50:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
 <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
 <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
 <aqFcNhB9ZeQlkOFh@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aqFcNhB9ZeQlkOFh@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa16429 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=i3Gk5ewI70OSVfywh64A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1NCBTYWx0ZWRfX6Qitw1AN/kRQ
 2WksEnT56aDQyFTBaEnZpU4BWiu7XphwEmC4LS7S/js43AhCapsUgoP2YIGi6Sj7RMHitRVk4x9
 HsM5wz2JvqdCAe3ZCexnqTngkD/LpJb8nHs1ThhU5gaLQDY9uknKhcrr74ta183aoRJ7rL5s2Kx
 ESY8NkJ+aoEUOY/3iD7zlrd7/x4z5zc8m7CMUjd9T6BzM2xaa+ZLvgpRILu9iNGEpYbq32ujfSk
 JveBpPaGtF3kA4yIN+8XJ8q1XjoO6ohlOXNqammfcZzjBh+UJrDKCxwAPJs4YqDODbSDnihf/cu
 bgJgOE962xc9EzNBtVvchsJivzwRSmEcfqDtqpZFZlFXT3UUGnOm5M7omeg1oeqChad7pZ1SRlL
 1T6Zi9xaia7ZZ9WsgkVQYSjHP+np8ECY446eziKlo3nQBc1Y/1eFC+m12WTfATygT93nkmOOcPk
 iDdClpfYhekOtpsWkxg==
X-Proofpoint-ORIG-GUID: doR4JC_BqIVx42W_wvNvQHJUswasb9zO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1NCBTYWx0ZWRfXwSix+SwJz6DZ
 EV9kDWRffKjAQlvBK0GFLcXHyW3oRCPvEaHpwI0l/WR3CgzbL5lui4OMD2y4P5Uf5r7P9r+tlYP
 8tQESCxcunZ+7bPlo5iPhOYZciFLleE=
X-Proofpoint-GUID: doR4JC_BqIVx42W_wvNvQHJUswasb9zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090154

On 9/9/26 3:16 PM, Shawn Guo wrote:
> On Wed, Sep 09, 2026 at 02:13:35PM +0200, Konrad Dybcio wrote:
>> On 9/7/26 2:06 PM, Shawn Guo wrote:
>>> On Fri, Sep 04, 2026 at 12:00:40PM +0200, Konrad Dybcio wrote:
>>>> On 9/4/26 10:16 AM, Shawn Guo wrote:
>>>>> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
>>>>> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
>>>>> initial device tree for the Nord Ride Embedded board.

[...]

>>> - Supplies of Nord SoC
>>>
>>>   vreg_l7a_1p2     -->  VDD_PX14
>>
>> Does RPMH require HLOS to cast these votes? Generally such supplies
>> should be taken care of in the fw
> 
> Good point! I just did a couple of tests by:
> 
> - dropping regulator-always-on/regulator-boot-on from these regulators
> - dropping these regulators completely from DTS
> 
> Both booted fine (the nhlos software for Nord Embedded variant are still
> under heavy development though).
> 
> So what do you prefer, dropping always-on/boot-on property or
> the regulators completely?

I think it's best to reach out to the PMIC folks and ask what they think

+Kamal?

Konrad
