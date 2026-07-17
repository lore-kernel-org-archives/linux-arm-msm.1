Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FB83E9F60
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282828; cv=none; b=JTHpl0cEzgZZpf9MQPkz6e+py0eFmAgLiODu3fNYGJW67KsQhom32WHAhDGvZ16p2Os+V5ofFTxEkgGKwC1AMSLAATYNjGSKN7eCPIzEQFeHqwJyI0MMAl0Lm7Pdz0E3UMRdVCJlwACWF+h0sbKiiktusMNdwOwtR3qX5v8uPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282828; c=relaxed/simple;
	bh=k66LPfKQ3cSpYtH1fqSpFHQnHK2RdIrkDszF1Co0Lh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZVTSSgRDT9LGmITzAzTal68uEo5mW0yDnnkoM/bhMyewjZT0Oywv95Agx0Clu8xxA2cGMGad3jb1n9V5vUNv1l2UdEutzUrpgAQE0AuwIC69znfmiuHoR3i0TM8H6KP6VIb/ALARzx1ZpDZsvz45XsMALAJfOiJYhc4lS+wCww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1953pEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkeFzKoK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1953pEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JkeFzKoK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6chxH1093033
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 10:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6katBA3YYMgPj3qSfM8s5QF3Giyse2MBZ1kakUqCeyY=; b=Q1953pEPD+/NGkVz
	ZccmSzyzr3NZxcAqr0OQHwGLh/pGmI4J/FZNOG4xpD2KI/TX/mD2UNjm4+T7S5Al
	L36Weu7MzZdrr8LOgN7Uv+Q/+LY5FPTfP+VY0HtwHBnPZlgyE1vZvuVvd7v6BMXK
	z2qLw7DL7Zd9zwZs7qYME601IWtkti2A2+RNuN2A2oOqjyljuvKsRgjQd2tWJh1k
	SVrrqPp1CotqPLOCRmeHRc6/LN13sIEFBncHOV1z+oxGTgwrVKicR+qMVL3IlGAS
	le5EVRjsTY6kSFbd2ycgBTtrDLXkxvZPtT3URSOyqc3GjmDk4PV67aDaNg+2ncEX
	jxzNhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0us3y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 10:07:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5110c89eso188676785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282825; x=1784887625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6katBA3YYMgPj3qSfM8s5QF3Giyse2MBZ1kakUqCeyY=;
        b=JkeFzKoKxgdK0WgwYgEJw1QRw0ivd1SQc8OCUM9UMRAFuJxjjY02nz54OI2POBocti
         MDtGxcI8KENh2CF3dWmJsnOdUgJnmZqKpnLzWkhJBmL8LM6/iUY0+gdaRrmdwkrWGFJf
         B5xYyfj0aTwG+18Az9NR+/YtAaPmou0KqbCWKu0F1RytWdikkw5kh+9BVMXlu/e3miWt
         t9SinyUyw4T3QGKG0+RLTq3Pu3PNOy0s9CvmjLplf3TjbvhIEal/4OgK9Uhw96Ps4VWO
         7u8h84L4FxGorjn7VTnBEDi1MWA5kBr8mxBFBI+At0DS/16vLQXRSpaih6VZZ7qPI2Qr
         dPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282825; x=1784887625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6katBA3YYMgPj3qSfM8s5QF3Giyse2MBZ1kakUqCeyY=;
        b=QQYqmvrb9ZFHn/K57jN8DZ0FbLZ7rEZEdTulGKygdHtb2pmQ6roHp8vvDbZekJ4FPB
         tnk34f0r9M9wCyqhpgZm18MORhTfIA7OePiNu1emusmmb8q0sI5kuyE+TeqBIfeLiSqz
         KzLbIif8JE5Rka3PvH5DL2dKIayquNaGTM+JewGwQrZcnPJR8DdedUfD515+K2Jjwqax
         pzndM0cjKZNVcyO44wm5BI/9qZSYFJds/mrFH35xqXwwZaxDD/eglcuLu/iInGynIVuG
         fSVZ5Xq0uPh70ILyLuEGnq6viUEaMb4v2l68N2Aork/xQ4PM1nmrvzSy5WnkU68wkksr
         4+aQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4aOJMvhgdmRh8T9xqkGbikSmqafI7t+7tcKJLsk4qifU2UnzWGb8DP7zTjE/b/6TVD+b9UtZG9Wbfh9EQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwuCxaOlCQCpE8Wuh3ZeLCwPe2C/qS+Io7VbBHb9MKyfPvkeY8C
	NPwFU7iObjNubikLsRP8cJd4AUKxxv1SD+KqCu7dc4bFgZTm3iT29ATC7J8CRk/2VR+3HycnLBg
	P6SjnS2RY4FFp2884rE/1GuYtR+U5DkgKxV+/GgFfYkef7bwLcivcBcW03IC/hQ/BZt6d
X-Gm-Gg: AfdE7cl3WFlGFvmusUa7coHuiZqq2nMbE49VHtwB31xIbigcSvGBvJVD1QErx2W6D9b
	QnnZlt1a1GXyL7HJwiS2oLvIlklLN/dvPMrSRzUZn69sgfy9fH08rf5CgzTdkJxl7Fgqhc9WSSz
	sjQJH/BjSysA/Hh8oMK7f7U74w/rZY906CeR6gtiPuUDPARCkXM5nPUuVef/oYGzaRBAu0gzVl9
	84fU0i7ugI3GKUUkLqlzEN1FvjZky1V4XsuN272ucKF6ixkJRPZe+jJLEhKoG7iwHzUkmGgA2hL
	LAwS12vZ719AFogR046svh1df/VUevCCyG8s6TraPRxtt3fk5qZ4lhFNYNt0IO/67oI5mXMZzoM
	FVmdpS60Krk3lMJgbe5Cn2Ilf
X-Received: by 2002:a05:620a:ab08:b0:92b:7420:bd58 with SMTP id af79cd13be357-930b3cdf523mr129232185a.0.1784282825258;
        Fri, 17 Jul 2026 03:07:05 -0700 (PDT)
X-Received: by 2002:a05:620a:ab08:b0:92b:7420:bd58 with SMTP id af79cd13be357-930b3cdf523mr129227785a.0.1784282824741;
        Fri, 17 Jul 2026 03:07:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a09a4fsm51391466b.18.2026.07.17.03.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 03:07:03 -0700 (PDT)
Message-ID: <6d12cbb6-23de-4e41-b449-9d9b6cbab342@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:06:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
 <clfy5lvz7vm3ogw7pvyyidiujqcjxftx55p67szwgc6ivsq6r6@xrrcbfdkqkjo>
 <2d9d6724-a3ea-42ad-8cb3-ef08fd0882be@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2d9d6724-a3ea-42ad-8cb3-ef08fd0882be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59fec9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=J1ZTZr7FdFypxrWY4IMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwMCBTYWx0ZWRfX+tq4wn8d2v+0
 yAu1UtU9huSs4d+FqgFnHjqGMPFLM5WN4q+CT8RzzjKdKyjbqb68BZ+CCnv/bYQGvyuen5INnZK
 dbKWyIJXNwNiUkaCXM2QyYlbz6ay+oF/3qKjJevLOM6+nELiSj5fQxeDRX8pjGcXMra2w2OY38K
 isyNdJ+4TNuAxMu5dB0ivHz4EdUMkgbXpQGWBj+H1+DxZxlo2q2SvrxINoXrNku9XndCc6vp+Sc
 PaVFp/xMqThxorRm7OydIS6irH69O2V50mpovxh/1XqTj13YWJVX9fElEDDARTfAMBgFQIpaqPC
 vg5slv7xS8VpyhpGNggzp7vrn+Yod+O0ZIhv+TW2hKJ40E/+hzfiB6Ne51TvehADCzy1ysM94gM
 IER3p3RkX3n1M9NUEB30hjnNdlglzhLxXWR+fxKgFj3tJEW3SqwoccTFq2oPnft2MpXSmOxGVC2
 3RWCCEGv4iBDmIwMJow==
X-Proofpoint-ORIG-GUID: 30qajhbK9URGQLQCnXcHc_7qK5V7ncPx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwMCBTYWx0ZWRfX+szjRLRSPEP9
 zL2vBe3igRDxfFTrx9WL+CuX4oic5yOqwZDO3MIx8bwno829P7+ZTwT4DL9QxsEsZ61DxOexYL+
 rNZTynAZK5Uk6p0CvgDiPvJnCIDDtiM=
X-Proofpoint-GUID: 30qajhbK9URGQLQCnXcHc_7qK5V7ncPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170100

On 7/13/26 9:50 PM, Akhil P Oommen wrote:
> On 7/7/2026 3:53 AM, Dmitry Baryshkov wrote:
>> On Sun, Jul 05, 2026 at 01:44:23PM +0530, Akhil P Oommen wrote:
>>> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>>>
>>> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
>>> shader firmware path.
>>>
>>> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>>> index 1374afd9d14e..b280d8e845b1 100644
>>> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>>> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>>> @@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
>>>  	};
>>>  };
>>>  
>>> +&gpu {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&gpu_zap_shader {
>>> +	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
>>
>> Should it be gen71700_zap.mbn?
> 
> Downstream uses gen70e00_zap.mbn as this fw is shared between Eliza and
> another GPU. But, for upstream we can rename it. In linux-firmware, I
> will keep gen71700_zap.mbn as a symlink to gen70e00_zap.mbn.

Let's use the name you proposed. I mistook it for the GMU fw, which is
named differently.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


