Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A037F73E
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785081946; cv=none; b=I3OoxWfW2QxfDMir68Q0JBh7RH8FiwrND8dWsoRucdhnu1G2gaKqVi62kE6fBdBsP3KkxswXQjcY81VjNgBDqIc6x+cuklejqeqt1ayt1McPYw7aO538/UJxkBbldzcE4nmWlqRb8GmCXddpAnItHiI93xPiyBx9gK3QP41OUvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785081946; c=relaxed/simple;
	bh=brs5hHqKtB9j6ZuMqmEUmkBnHZBrNteSoI5ZXyNXmYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2SIJC7yEFAXOF+5hwctO9QbxvVxp+6cAaoxBwUWIisEgzT9yBW3UyyxWpCbP89PhBxmQg5VE0s60yE8q//vWAMvce+Ur1uWo5MsTMjyi6VxYOWQth0LW4KxomqDNpK4lFq+inMjQprmpm0ri8rgdoGaXyLRB7/lI6AGz5F6+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPPxnod7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJSKlMZw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPPxnod7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJSKlMZw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE3HC2344529
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 16:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJIqu3cFhw3jGnD3SrqOtGjAl4/Bdxlu4o2o32WYY6c=; b=iPPxnod7pDZF3G7H
	1SFv8LDo/UV3tdDvoHsEhm/QYvraqSMXLJWpuvozUmzPNPjpqm1xb0DcckMaRLQq
	bcHnJChyoLBD1ngfdRKkjiYjKe/hp0Z/Ar7xqrjyCX3UKT3nhd8QCR9hCwJUVQyt
	DJ0n/duSwIAF+XkMmSXAqrTTSLATwmAAZ/U7LjhRJRQXJexnIm/+R+29n4fG+sed
	6Wd57Kdb4Aozv5aP5QpfBDxyNJWwmUqaeHH6loAxeknjkwrMGYLixjT3N+EBF/Np
	CTXkD/AT7HOsZyQAirkVnZ3SNCw3/rLkN1DQPZOp7fAdAOS22mriqeBW7Ux4tMuq
	PyzWhQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajk390-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 16:05:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e63de75aaso3243348a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 09:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785081944; x=1785686744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJIqu3cFhw3jGnD3SrqOtGjAl4/Bdxlu4o2o32WYY6c=;
        b=UJSKlMZwZRMeqAdgWLJXmMjNmDe79Ws4ZVQCs/oz5/0huIWHXpf+HKv+5neNfw9FcP
         L67h5omuqGbadg0b501x0MSxMJthdT0MgdL3UoOhnFcdC9MgQHXcvJk5/6DJq0qKQqSf
         f88HM4Ry8NnDQxPYrIKFDKatNKf3zbeI0v7K7oE+wfEEaNe0CajeffIcRCeBWlnLhLBR
         LZTclCrJ2Dl/Lnz3+WKmMHrlicTyTLCjW3lUMHyXJrf42JQegjPIFX74mZJHr7O41zLs
         ccVXPimKf92ROlDLoegaXnXQumFk2JwDXWfP4aHePYnYjuMLr7MPB7/X5k76Y2EYNZph
         anYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785081944; x=1785686744;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJIqu3cFhw3jGnD3SrqOtGjAl4/Bdxlu4o2o32WYY6c=;
        b=RvqGdd4puUNj9r5x+3MxTL7a9UNaPnh+BsInElFD2jafwFTXFmcqzPgQphGxWAWB2c
         sOcK/B/726Sb5O8MB16JbEVYZBxZbU+J+SXvZStkAKawQ5AfkJnbP1gI+6Lsri5lqgZV
         5yjnxJ/H+0uo2FT8ZSq2xeeVPvAIoZEf6ParEzN7AtvYenQCEbtv3IqaXRy3RcxzK9WA
         Kg5iWIGESwAKjE0LYrg2VIttHkoknJgaBuh7v1sbHo4TkwGmg94gi8OtTk6Had1zHumj
         BB8ioLFfhoR+WyUI0c2vZjHhl7dTOx33M7KLwnhsMuxogiryy9UOB6NqPtvZgFiQr67C
         5IYg==
X-Gm-Message-State: AOJu0YyDCJFSjGUM/EUAu9XZ+Ewm2tegLUYe0fR0dHmsVAc4jP+1wP5g
	MOQ+IF6OY7Gg/punmeuhN2mznMamgIPbch/FMAeAzpwPqEhSoZgFsJFOPBdfKz4ml/N1T9dxch+
	TsiFjjHVcwMEM2uTvbzT5bcgFNG8QO+xMVULRnx9rSCU6lE+iFqDONa3wnnC7q2Vv/IjP
X-Gm-Gg: AR+sD11NWLps8jfKl8DmDB+OuvdXNcMId0mULbAaJTZW1bLzf2U5TjVis9l2kftDXSv
	qHSNEQdCZ3NufDO0ELcsUSGVDCbzUCA4JvL5o6vkxvaKoVRXZo4WFzK7w0HbNUplnqlzSM1nQ0j
	/PuWqj6UcxBh4m+o7x64CkVF1O9j6y4/MT5ESTpDsI1Ru2viUGxwtVXmq0UL1Wj+lauXCSTTZFg
	EjWA92gKcEPBiZhCu66TTE/qXPqjjxqyNq/wBg32lgcNev39LngRNajy7JR8VnHQUhn6dUMDkXh
	r+ngq3NucQtq2z+6agQQ1i2vSOtMQgeKpdRiNJ6BfRIyP8GRWGmVBRaLH2ztQP6Bw3ecvusAYtK
	Z4ApLo50CBNGMQ+oV2Bhilxw=
X-Received: by 2002:a17:90b:1d84:b0:38e:4b60:e01 with SMTP id 98e67ed59e1d1-38f2950bfa9mr5476601a91.12.1785081943617;
        Sun, 26 Jul 2026 09:05:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1d84:b0:38e:4b60:e01 with SMTP id 98e67ed59e1d1-38f2950bfa9mr5476585a91.12.1785081943243;
        Sun, 26 Jul 2026 09:05:43 -0700 (PDT)
Received: from [192.168.1.7] ([106.222.228.38])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm77428254c88.2.2026.07.26.09.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 09:05:42 -0700 (PDT)
Message-ID: <bc2ed82d-0d91-4683-b9ae-cb4299636c2e@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 21:35:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 0/5] drm/msm: Attach a driver to GMU
To: Val Packett <val@packett.cool>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <1118d9c2-4efd-48fc-8a3e-c2cc3eddc940@packett.cool>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1118d9c2-4efd-48fc-8a3e-c2cc3eddc940@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DIdCHQBfwDkTeu9Sw_hu-PMZUYcADWx8
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a663058 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=galigqb6G80s4G3+64sspg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3hBfBgDNyV4BCgyVU0sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: DIdCHQBfwDkTeu9Sw_hu-PMZUYcADWx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MyBTYWx0ZWRfXwCwzPuNSK4sz
 qjCClsRQvPma2ioBG51nQScUpin1tlXaOAlHiSbPkvdnYaJB29/uhn1NOMKQlLsy1vEUXd6Jo2c
 LzAn4VcwqngkxUwVC+WxMD0/0qOTuiQdgXKVyFk6jjwlP0ztskqasWY/WRNnIBuqg6/pugemu9C
 5EYOAS6rBUn1J0SW3PvM5OPeZ0gMb53bz4cT1cvzkKVABrIXOuXkZKvHxbg7zFbsY8gN6ggZyYj
 KO4Qg1NaopI/ifZuegALt7pmJobfzjrTYdgWEai4ab8PVe17vjt3GLugtUgnU6+VTSWlASBxtwR
 6rxiOshDlA+q+Cyj8oI9u5fsdZU7NikJB3KQQUdyYMAeb85r6Q2E+KuMnBAnsBtQnACP9NgGpkp
 o+yab4Na9NDqJ384+ISQ+pfxB3qdpjuzq8LY5hPXAOj5E9O3nxmBw5YkyBy2APrA+DK3LO/W5Ew
 vY9KGDzLishg0WxPbZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MyBTYWx0ZWRfX9ivHI5tyKqmC
 pS4ZEUlCUGEWA9HyQDCLDYbWwQykAFnNx0G87SjHzuIJD2kCrvuYMI7PvG5njIJq+Y6D3ka4Cyu
 h1IRDRLTgmKB3Y+LEHUbrzLcc3Sucs8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260163

On 7/26/2026 10:52 AM, Val Packett wrote:
> 
> On 5/12/26 5:52 PM, Akhil P Oommen wrote:
>> With the introduction of sync_state in the genpd framework, any consumer
>> device of GCC and GPUCC which is not bound to a driver will result in
>> bootup warnings like below:
>>
>> [   24.362666] gcc-kaanapali 100000.clock-controller: sync_state()
>> pending due to 3d37000.gmu
>> [   24.371210] gxclkctl-kaanapali 3d64000.clock-controller:
>> sync_state() pending due to 3d37000.gmu
>> [   24.380268] gpucc-kaanapali 3d90000.clock-controller: sync_state()
>> pending due to 3d37000.gmu
>>
>> To silence these warnings and also to have a proper state in driver core,
>> attach a driver to the GMU and set it up as a component device for the
>> drm
>> master device.
>>
>> The first few patches are preparatory fixes and refactorings. And the
>> final patch introduces a driver for GMU devices.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com> [..]
> 
> For the series:
> 
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> 
> When I first saw this series I didn't think this was important, silence
> warnings whatever, but since a couple months ago deep suspend started
> randomly not completing (bouncing back as soon as everything got
> suspended) and I didn't know what it was… just now in #aarch64-laptops
> this was brought up again and turns out, yeah. It was bouncing back due
> to sync_state not completing for everything. This series actually makes
> suspend reliable again!

I didn't get a chance to revisit this series after my vacation. I am too
not aware of any impact outside of those dmesg warnings. Any chance this
recent rpmh related fix is helping with the deep sleep instead of this
series:

https://lore.kernel.org/lkml/20260605-assorted-fixes-june-v1-1-2caa04f7287c@oss.qualcomm.com/


I will send a rev 2. Thanks for the T-b tag.

-Akhil.

> 
> 
> Thanks,
> ~val
> 

