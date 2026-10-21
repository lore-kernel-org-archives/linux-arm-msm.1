Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578471;
	b=3ZmqPI1GzMKLbNOWfMQQ5DuNma6WA2XKbk785P7UsStRoCay9W+9Rr0YcPSStpwyE51N
	 ZIS0te1cgsfdFbhiCM9IIKwL1VFIoQsUJGo5bxiQOzZoRtcasF9CsnI4RNuGA093HGF+j
	 MPd2GwWq4uh9X3969QNRdCM2HS7deO2Y+bkDtt2RBYN/B6579QOpO9yB7ZWt9/XNvjaQV
	 DrkvA8PNx2UqrhSZHZY9RyQt/SmDTomOgco1erRXKSaHxVXvheTzJiEeQmQ+z0UYkRIkm
	 HYFLqP8TRbnG0BdEBeP56l5lwEaCeHPJHQ+2muAsQjLTW6nIconkmb9Fibup7JoGnVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lKIuPtXucGTuUrVP+08mQo0qmmFiAtXLjNuGxi16fbQ=;
	b=CXGNc7U1mIeBRgCG3IpQurng4800ISf3qvNterkM55TJJl0aCcu4/eULuKy4SEYxiGRM
	 7OvmHHsZnCmDg3Y+W8CX4SPEWs2N7Z4HjQB7tugOcEODkLssxF2Um51KWx0QyFbTChO/e
	 yFSaZdTpM4hmwmtcHJFsrHKu2wcnQlFuuACJGDgKfGoatJqIjN4cRHlMufsKKEeoWc+LQ
	 yeEaRc9n4QZ+t7Dsrd/vUsBwQRapJPoVaQfIkL2hq9j2+mXIUDk97CCyEjXFDaUDKjIFg
	 y0Kb8+DdQHairb9Flcly5wYjBOSZsgnUwI5r++nyfPIiSLBT4dAueHS1MTBxjQpP8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mw9yS/dk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxquBoFl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B6606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5B6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mw9yS/dk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxquBoFl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJTUJ1422109
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lKIuPtXucGTuUrVP+08mQo0qmmFiAtXLjNuGxi16fbQ=; b=Mw9yS/dk+tSEmZUZ
	/4PGeOp3wb02AZnS5ew0LavnrtXYp1V03Yt6CVm9vJadr+WHsJE6Q5Ox9Y1rJwzE
	R8lUX4HdSiL/DelTpMxlxZIh/DX3YpCab3fl8rBg+ee0XzPhhYRq2P5Osf2nD2TC
	b1ml2+5+00jI46BIIyPS7KpRDGlrfrVy52OIeeUhjQh4qI4kds0rhj+GvvPXUEGu
	CCFubzN6mEcZQ5Bo04qkV14omeG+huKbhqG0hlwBJBTCgakFvqruvrWtwaHTJG51
	StV96JyHONLGcgBI2cvAkPRu1hje6Cl7PYTKJf6d8DFPjC4dL0SwaeZ4fCCoVT7H
	BPJymw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug0wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:27:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53389750985so477511cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578470; x=1793183270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKIuPtXucGTuUrVP+08mQo0qmmFiAtXLjNuGxi16fbQ=;
        b=YxquBoFlr1nGIaAj/rLZs2YfzzePXg/bh6+EQG6MqBN8JveFOS5hqUgt28EoU++PAi
         PQmUtfUKJkZtX96Tw0IerOuuB9aSrxkCqkOkPqIfcMOJPlo6+cXdiW1PmPkOrMczyZn2
         cqQ+j+jolp33gfXyu19P/JkO6fPDuT4+Gacm1hHDcBpfmOVjjvOAtOTfY+VR4rG9ETZ9
         D7SM6JQ7eOi4tnckTYmvRtnNdYZOKTr3f0QpYr5hqo8BzGsN8zsHIJEItC2PHzjoT/Xt
         dGBB87QetBHrlZtxYnLrebYg+tm5xw+Lt8SWKr3BmNkbKdOim1gKsMgJ4QlAzdablrIW
         T3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578470; x=1793183270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKIuPtXucGTuUrVP+08mQo0qmmFiAtXLjNuGxi16fbQ=;
        b=n/mxiIQeuwF95TpEYrgh9p6EmcXCn/ocR/XgYOyyJMU/xSLe7RkVQKdX6Wc8Pvz7wG
         pv3hs8DcTG9FKSvn2OIufj+IWC/5/roFuwJOY0isMlVJdWVlXkcUzjBhh8iV8ZcG1xp2
         y8/130f4vlnsaSVWMIts77RO0JbHjwsCR7EUqrwjAu5PxCpSydiuA8QX0F/Wjds+tvtT
         g9CKwWTIFV2fdYGV5vtk7c003c3GhFVoUaF2QYuPE1VWBVWhz0WPsd3u+eORjo6jCf4B
         wikCrzs4Q+EOY13tCTj980EYBSgTg/Qzobc1Ktq+bKm9nUCtJfyAMsePY7fz0/3GwQSP
         7mQQ==
X-Forwarded-Encrypted: i=1; AKwUvByq4lNjkMKvHhvkGecZ7twBCR/A7TWcwIQx6/tahEyRKkqgyUDCmsJDig0o1iJkOfuNChqDIDGZJO8K8RlH@vger.kernel.org
X-Gm-Message-State: AFq9FYL2UVd5YJjOY2lZxVNZJT/T7vgcu0pYSX6roRdWo7j4tpOQIm5Z
	NKxInajJC5SOIwDZN+Ap5Y3/WdTFFnQjEPp8/8ul+mRDVf9RwK5AWdJOM2kXXEB2q5loNbMStec
	nvkNFIVKdijwi2/1NtNKmocUTzqgrrsVm3ICmCxD7TjNd8SR4BXQkYqchMmBtICbR77+Q
X-Gm-Gg: AYBFou2pTKJxw6Flz2JJr+MX7l8vhALMpxJpNqiQU4bkwOVY7e4/a+Vm3F+c41/i2Bt
	MeSoy7bCmfg2/M/TtmrDvpoSTmnedPaiphRq0ULjsVjbizo0OVeCwTuoOSDydAfApyZlxVgYBM9
	PcLZDM6XQ8BsHR5JtVbTU2cJsc9K6ugP1mAi2vrlQtgZbBzJ9R5+JGgGpl/qKb5GB5ZT1ZrBZNq
	TwfKUzFzEuLQmLhb5JJbFfWdjovgmD3otwOL+x22XdVnysS34ZeB/6Sx6vdUGgUzfXCHTgjApFX
	5UMcWIj5Dl0TzblX2v7HyEO2p8RI6qQBMe9hply7QK4LvYNiuVY0g6V3igqYJ+WHW3fIeBjhDhX
	J4qeoNSNLSwvKDVTNgNKYvA==
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26674701cf.5.1792578469479;
        Wed, 21 Oct 2026 03:27:49 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr26674471cf.5.1792578469077;
        Wed, 21 Oct 2026 03:27:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7826csm65275266b.27.2026.10.21.03.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:27:48 -0700 (PDT)
Message-ID: <31b06177-69e0-44f5-9f84-28dd86a4e5a3@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:27:46 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] thermal/drivers/qcom/tsens: Disable hardware on probe
 failure
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261021085749.3786101-1-daniel.lezcano@oss.qualcomm.com>
 <20261021085749.3786101-3-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021085749.3786101-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad893a6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pCP4VrvfTVqM1MFBOCEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXz0xDpHaXOyKO
 6MLzZUerayPnjWuXXZPFQ9LNv2NpTkyR9Q/zuMCqLB8oNQH07gETbSyI3hI+qghMAfElD6WqITW
 9B1o9pLVUvAOVValLPJDnMmUn37z8sk=
X-Proofpoint-GUID: -C0ukpwTxDS3qimSu2ehDJbq_niiPVTk
X-Proofpoint-ORIG-GUID: -C0ukpwTxDS3qimSu2ehDJbq_niiPVTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX6eXXOEXjJjm6
 nHYKs+nbrWAN/uOjsDNknlDbxZgVJ+vvTUOsUOSAz4TuVdHRHGS8sj1biFIzE118j5tfF1ECocF
 OvyozrPi1CrQ4L2H8ZBCYVe6JrbEnlF0b08JAu9RPgImztk1DPbP1wkrILxcSMl2I1VxCa5SYGx
 TGUB/JSJQuz1gvVCImuaSUIvGW0u0kAX63+RPLcjQ3odxEZhRuBt5eqBpuRBEx2kAxbM1Rd1IQp
 wmC+T8k1M+SBpbUysWqHeqJWKNSypwT3WrFAK7C5k/bOt1U4vJp8+xLoylaMX7H18ZdAUAC4kfn
 tfPPUTTB9hpvYZbb0XMFAbNzzJt99PxXg5fhL7+BgkXC4qC5aosmufk2yYCrBH029Evoow6cXB9
 zOTgh4Hnfro4G7lOT06i89ftc3G5I5GCDZ5DK9Yz4t9IWH5ne0OBFQef4Z7znOLhaxBS5E26mpp
 nD64cOk4OinboMhHywg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 10/21/26 10:57 AM, Daniel Lezcano wrote:
> Hardware initialization enables TSENS interrupts before calibration and
> thermal zone and IRQ registration have completed. If calibration or
> registration fails, probe returns without disabling the hardware. Devres
> then releases any registered IRQ handlers, leaving the interrupt source
> enabled without a handler.
> 
> Factor the hardware shutdown sequence out of the remove callback and
> invoke it when calibration or registration fails after successful
> initialization. Disable hardware interrupts and call the optional sensor
> disable callback before devres releases IRQ handlers and register maps.
> 
> Fixes: 634e11d5b450 ("drivers: thermal: tsens: Add interrupt support")
> Closes: https://sashiko.dev/#/bug/linux-4b873699-7a0d-46e9-b768-169916c70d1d
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Cc: Amit Kucheria <amitk@kernel.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
