Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090039;
	b=E+5F8Vfl/ygfn/YgqpBgG8Tn/YAQNkVGvvAUfaDM/d9b/bZf7K+DySArKwFO2JpP/Bkc
	 uwKXItxd8TM1TogVpQkZ1YIF5JgAPjAxd9Z5g7nBOND/xJZ394vD/reWIIOJRSfUYZDOS
	 /i1epCzMdZm9CdJxaV+Wp+RSlxV2tCp5Ltt8Z6+pT1+BNssyQw7lZ4b4LTwlYr1X3YBHm
	 p7rtPoVY71+t1SQaSiPo7Zbewbti+Mm/+q/Wl144mOmNBWhbCCp6kaueF0dDlMHni3d5L
	 Hgq+PHk4KSlOGCr49wFrDqznr7sKr9Ab96T2cBuBfB7Ic+x4C9K0j2CPhRNbnArZK0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KcNcY337sx7NujaeCz/DnRXy5zypv6RDzrNLxmfRG+w=;
	b=OKvbOj4NVJPFc3bI4SmG1kskARumhns0VjGNkH6JuhgsXre74fLdHtpxOgKvS/bPIrWM
	 Fw7y34sJtweIQHn1/py+Rj5OWlAYgqLsMlLiC1rQ3Yg8+v7XcW93Zyyxepdm8VMCHaeIN
	 LBMhW/7IIraCOXpAtxONW6wHEqavq8DlgcoEyqq4zkG9DptA1ygs+UknT8E3uK02jGLTm
	 2MbSQwrIl9S4EgfXNit+AVYq658hzSXhypGHTxoSsyhBDPq/OUprSRI/W5hHNebBebqdk
	 b/efsey9qTT8zkTGllYOeRE3gvQRoL1FpRwfLMfH1iVjS+/MeOvg6EUFn8qwUpd5k1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="f8/Lj6+P";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RG1mwtRv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96392606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96392606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f8/Lj6+P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RG1mwtRv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJiH3950112
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KcNcY337sx7NujaeCz/DnRXy5zypv6RDzrNLxmfRG+w=; b=f8/Lj6+Ph2jtau2X
	HaeYSMlI/wV4ugoBWJFNN7k08DqFxAeks0hD7U7hR8eBWAWLkDfbYkIjZrT1fXfr
	kAsKrE+eNWkN++/ACZXcAjvTMblPwjoT8ypOiLUCySmeUjv2o+0AFjg1/1mVy5Fr
	qHxMx8mSHBkZsmPYeN1ZZ64cLkD0IxIWiusOeWxwJQn2cMOkhPa0wft+kthF7vgj
	xbKb8C+o4XIc1AhZve+Fn2EHJ+j285tt6UDaDuZzmF9V3HCMUSPwTIkIwDfRUinC
	1qeAF0ODs8+0JwjyCznzq/qOvJkoyyoc76fGSvHx92tRP8b8aO/uhoS2ldCRr6p1
	+av9gA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54jv8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:33:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53630cded29so14023051cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090037; x=1793694837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcNcY337sx7NujaeCz/DnRXy5zypv6RDzrNLxmfRG+w=;
        b=RG1mwtRvjZnVpJsO/OCuiduUjg9ysDnWNCI3ZOdyyr9kKAE9ZHeb45xT2ZFA3Jd5sh
         sOqETuYNBrYJr3huO9iFHJxNzwnLYNTI3oCa74jUD99eDPlRnkhANqU2la8ijp5a5fb5
         GAAME8Vf6YSUAE8ccycCzqStUU6ACYsd2bKUvH3ZE+HOFtJgYLAQ/FmmFcqJbsnWZDHB
         oYKbHdsB857eWlqakJ29y2X0DUz9mDgsCLhMo7lPV574W5jgPyytb25Gd5//et3lGg3p
         sBbeUNdtAs/uMqDTNBtPQRAkzPveG06OZMG9hnsI6ZnpwffbHv1kHFYo60FiNLTLnHY4
         rCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090037; x=1793694837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KcNcY337sx7NujaeCz/DnRXy5zypv6RDzrNLxmfRG+w=;
        b=16niAItjBMy02tdAGGIW5wm1e9c2/fgCbARCCWXPGNTz1vJG9K0MYxXh1p/FS+jsVC
         7/y9AF843l0IF+l2C4YrjADs35WsP/XH4lLfVaS9i9nTVAMDOfPx+42BC/Vpvm979Nm5
         Wf+wlvt1RoI9s9PA+8qVoeHLgHenBGwk17cu04Zg/Acafx25apVSRuUFRuBtu5sDIVBU
         7knSlthQksIvHyTVOY2hgAW82Q0tVyIZjDQj9jDDuzQYmqW+gka8yAp70ow5zG3dhfHi
         QomAhpBVXHSKjQh7an7prNATBpqXdEHFBvEeQuxFqEdLuvcMBhoslsxFoQAciicUkWeI
         GYmw==
X-Gm-Message-State: AFq9FYIGJmWuL0jFOkr3Tm5+bqkfn559ERYiW/p8WavT+mpUDpACz1Ic
	tZmU0kN9r1zbsJngZmC/94CSGgQu9JDsbscXTsI7BaVq2/94pR/rRXVnTYFt4S+IBBCHjxzYoSi
	ysWwfSk9npNGnqbhPU0613pu+62qaYJIVfr6FzjhWbKX8ySWT1Eo2jrjEOlX7q7aIekTV
X-Gm-Gg: AYBFou1vnc9cVrhPm4rYB8zz6/a/RakDU8At9BpFO7UM8INQAd0DLzqWlxp99CbL0TJ
	OLiR3RO/ly8y8HOAguHVfTtYhZeAnMS4XTDJJFEc659R8K5DDD/kgklFC44/RS0sLm/erWyARO8
	OWIsyOPdcOtY0YtFKffikbPsYUgkG7ema+vTFnzzpafMm6dlS5ywoufdGv3MBL9tRmZmZaQgmY8
	EKLYLTmvmu03LEGZikvi75lZzH7r+N9FlAKskbnUteByxF1aUb9KbTxcwMDKV2QdAUmLVA02mYL
	FLdG6foUaZRmTQgc8TRjUjvNiOYmcFGTmDBI+lYNc2Au4WFNBqLfn8SxTI7HVdlhhvuPb55FfNh
	uAxFUqzY6K4tQ4GIKfj4SbjEXvCw4t+w586VYjfruy92Qlcgq5Z2Rk9CC/ejuTtl4IP3V0LU=
X-Received: by 2002:a05:622b:212:20b0:51c:2324:666 with SMTP id d75a77b69052e-5383b547886mr145891891cf.3.1793090036593;
        Tue, 27 Oct 2026 01:33:56 -0700 (PDT)
X-Received: by 2002:a05:622b:212:20b0:51c:2324:666 with SMTP id d75a77b69052e-5383b547886mr145891611cf.3.1793090036019;
        Tue, 27 Oct 2026 01:33:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c498f8e6badsm215366066b.22.2026.10.27.01.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:33:55 -0700 (PDT)
Message-ID: <46403aa7-ef76-42a9-9bb6-5ada503d2fdc@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:33:52 +0100
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
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-7-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027080758.3990418-7-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX5fV4IxA/2ZVc
 CusNY80R64dr/yIBacPGHKSv4wKXwWTFlezMpwwShBx58s3ojoKNyP48GT4Jqdhu3iK+8a2WYw3
 /+dtgEMoipSFVxomMQCXMlyeZRDL4HM=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae061f5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=nbs0e3HrYrdHu2yMUt0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: JK1WhUzORD_e-SmXYjxakD4MGN4-0uVO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX4u0AUixeEQtE
 bPZFrZSrqTVTdPlg+XiRpW0hw62mluODK2o78KU4R0BwD/1c/e3CtW/VK/wbSkPIgC+hIMzAdKZ
 IJS5SK6R8Oyoy7nBAaj0EfEMIKxgxWe+eRfwgdDPe8sh8JOPxv/7p2/Wut95GRcQCHTToQNLIkt
 gMwpgxckB5NTuEZhEB+0Byhledg3RZOsb7j9tCs6hVtIolvHoxkFhRl0aFWNBISTOdIwLdKxbJQ
 gyA6J0GlCojkZ8utgiNR+RcrixCnmtwtQBO1WPC5KzhlVNsdf4X3sfJF2OFt3oQ6u+/JUu6ufUQ
 aTNa1rlhK3LylYX2TAcotamIkzxlcHMNnoYUk1BF7ToRu+KE6HImNCiOS+aL9Z9P7ymkhxroWEO
 3III+eiDgvNltXXYwFwo9enTT36dTKmj1/vRjm2EB8xfb4OW6riDqbT3olqk1KJIlKJHotffmoa
 gV7b1sDs/T0uFb6IQzw==
X-Proofpoint-GUID: JK1WhUzORD_e-SmXYjxakD4MGN4-0uVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033

On 10/27/26 9:07 AM, ShiTou Hong wrote:
> There are 2 LEDs controlled by PM8150b on sm8250-hdk
> which are not added in the dts file.
> The LED1 is for heartbeat indicator,
> the LED2 is for wifi activity.
> 
> Enable the LED controller of PM8150b,
> add the LED nodes with proper triggers into it.
> 
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
