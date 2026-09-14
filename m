Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4212468C3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388926; cv=none; b=ci6z1Oxp4Po6D8HG6j7l2t2In0MBD+b1WmnyXi+nOqA2ONJbigZVkJUOlOo/8GHsO8ZtF/9xvERPoZ98VJltyCpPL+dDByVDnP8s/DvQP/kjga+Vghe/GsS0Y8Xa5re4LZnHatDcAHkBmiFbkryODQr6+dZHy0x2niCjPrKGFLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388926; c=relaxed/simple;
	bh=PNm5ThoBhQTfuRajdPniX5QsIR0yF2ykSwtXSu/co8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTVIy+56STxhLpVK6Piiu0JkF5+dgt7gKH484kEYvjRMzI9vnhfI506g0hIEszkMjRNKINQ7Gx+O+YY4H29fh7SkdZHeMXVYPOnsfTW2CiLM1DAQTZy18cTETldB6cCErUOHEP86Nu9hIk3cei8Ht7PbiBDHMI/rRfZWTFdbrZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FVEkTebF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMVobczq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FVEkTebF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMVobczq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8HF3793350
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=; b=FVEkTebFGCyEOV3c
	LbdvnhnoLu1SUeYhzTuoCCOlcxEciG1svCbOp8QP3dUqRtCsPuQzyX1b1AVVr0dd
	IJ9HjbqUumkisZiLbSx8PAlhe2ZgpuGUVXRtPeDslVcMsjAteIArVRXbkVdeyfqv
	CacMduIuSFg3cNNWpWSHS1RzOEwY1xUKv40kBT97joJPHeasglKA33vUxwJzhlJM
	CilGSh0v1ecRkVp2oXuX/vuKfgc+vryVeRgFG244J06bmrKmsM9mgkcFTCcDrYen
	66CbJpjfAvdGXrEyhnpt++cOcsEMVDVhZTPVn4s0Vhl/NbT5SMen876KiBxKvrtS
	L8Nj4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg13k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so89094285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388923; x=1789993723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=;
        b=kMVobczq/3iLN0wwL7kqHwXmSsENuVtKe+XLZG2M7/zsyZPc780klTt93ytNgzTJLm
         /WwQHZbFa6TjAOeYCc6nLFVWTmkJabeCVF70jFCMSVSkHVMIXdyUVdWytBu2q+vkZtzC
         FzmcF6zfp1U2WbXu4QIW6d9rQLWaToC1ZuypzeI4BnTejz+TXzM4Pkf43tK7Xp/h+zC8
         C9ioU70TGVUIOgLHWDZTy3t66VjztQiacPoJuxxtLwEC2uH0s4dYSHmnxWHceN5OSsXg
         Fu72Yf2AHhLa2+eTo5xDDwAuSj6bJUT2WrF685iSyUIzudlOoU8TEegtVC7qHS3wHJEo
         6XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388923; x=1789993723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=;
        b=VRGk8XXW6bMcFY8z3Q2Sv9tm8RjbZNxmyCaanJBoMPWA+xR8S4KduZzx6qUG2kNBDZ
         7vWfNH4uzaYYNQtXg+KgPG+JxUptUPkWad5NsbL3zfPb3dqTdE2PirpThqn4LfmeiKB/
         BcofWXBhoy9zDy2w6w8En4jLniAS9IGWAxzbaDszYvMO52+pyGMHAfNbFn12EHlYd+4d
         vpKpWnxnWvZmNEoOGzn3XDHIHvkelC/D6dc2oHsKkowCno5pMi0LeBKPMUUKoTVu4oVA
         ujnf2Ux7r7Rzao5rFTmtWgW9Eg+Q21YFSos/dLN2tggzNrQsWxOegbKGKug2NANj47GC
         zQNQ==
X-Gm-Message-State: AFuF++kBGmVKr+2MRAxS+BKh+A7sSKqua9x4b43UvpOq0rji8k4Xq/J/
	GMAMO0w/LsYcFXhLlca/tTTCyD5HRzo0o9NnVfI3pqvUF/ZwPBebxGm5NB34LsGIMU/UlFTcJS2
	x7OoysffhzsUnKBEPsefAvP8b0e9icXh242H0CtKtC7ATJAxGaspt8VOiKwLlA8jA1DKC
X-Gm-Gg: AYBFou1C0JcT5hvqaVGCSPbl5XNF6EEwVF4rlxkMsM/OhZPe1WU6h4siIxoyZvJyBWI
	3dFonQqc0TLOJyhhQ4tnpkuyq5T1QB7j57PUyQtzhIUqItw/H8bJkejvzbxAwE8Sd7EvVhXJXS5
	ZXB1bB/tzhT1jLUhFW05wsPIsoKNBT8CVz3BvpvqMp2e+vdvSFLpRDOvUgo/jzUlwTacv4Pstws
	Lw+kh9fIaZ1aXdOPH1vkRyHGngnAeB3GLH9M4Ren56LV8gE8j8YEoVxv18R4VyVzFlr6MuQRBeY
	rW5SW8wN9AhMmz8ciWxLY7TvWgutqY4yMVerAWKPTGkv7yLx4so/df/5rb5AbsgtFctL6Gt2bC/
	JIRdBiYwwC3zTOxDy2Lk1QQ==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr254459985a.4.1789388922711;
        Mon, 14 Sep 2026 05:28:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr254453985a.4.1789388922224;
        Mon, 14 Sep 2026 05:28:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm425149666b.1.2026.09.14.05.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:41 -0700 (PDT)
Message-ID: <a5ab732f-123f-4d86-a5c7-26351197e2ff@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/31] arm64: dts: qcom: sc7180: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-30-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-30-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7e87b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Kcc-tO6rbaCHb6YRU153tVD_N0nqKnBG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX9fkVcHEYKFaw
 x0hcIrqEnMBWeN4/jD7bvwQ62DP5+fjnmC03lHmlPuy3HS2vc2Wj9pzyLV/k0PNc428GUS2FuAz
 5XY7aoWabqqjYda/IaPJJakqpysNQF8=
X-Proofpoint-GUID: Kcc-tO6rbaCHb6YRU153tVD_N0nqKnBG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX7tfQWEN/EBDv
 zgCyfJsIaQwXvd5W/J2lCqORsFGCR8TmDKbZhtdYvIT1sV9qct5vYaCTMpI1wwG+vg4on3BrGyK
 FQRK2cZ7tUvI9kunJq+3z9BTGGaAALciLbptADimNJY+3C2bqbXIj6MI3ipoJcCcRTWwEe264oT
 xM/QUubpjQw3BsE50Oo86cOG+8+s6YuB4FavQzVKHIhudEu66b9LXTdO69ie8yE3TXxE1aqsRqt
 1qQ8OujYBKVt+ByWTi6Q1qdwFEUuw9GUnbDW8X2/xMKLkl/giEi9L48icagak4al27+EytepfbZ
 JySQNKHZqD0XpZRZwynziAorpdzvOTX/POSujUsQ7A5tXTiiMMM85OiyDG4QA7fKfxccPIkCOu+
 y6/8vroJ2hB/U1SOeiURTpdOEjFxepl2Bx06UvBwNU3+BQiD4jd4P/5zQvIg4LREDzUwPPivyuG
 /upYSIFg/bExIRYdAmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
