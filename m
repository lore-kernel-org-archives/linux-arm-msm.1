Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197CD1A238F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887940; cv=none; b=t/mNwNq2ZdtO4QRi9PLNNS6Tf3CtdRrBXQOvcg06VzdNtbEUmRyx1oHOAsuTP/Whb5NSj0pCp8ZG/62qNOjqpeyQ5gV83fnpo7ipXC49E7T9yiRrV8BNN3zafZEBNJ3plUp71N93SxEZkmuxKhgWLDBBx321ajaqi+6zJ16+4LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887940; c=relaxed/simple;
	bh=/gsGpTTN5NSPm+Jmv2ESZ+joUPJVjv92q4cmcpfiVX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiYA7sfhyQ8HtVjBDqdp3uyUCL2NZsBS0RjRkdme8C77aMNIvTO8m4Hj8jbrZBhXIt4piPNdnZno2JFPiz36A+9BwIZFzFC6E9+srh9T8hAoR+IJkGlOcNTaEU/aECIztWRHsaqbuZ+VbjnoHZC7FWa6U1PxHnjKLlQinF8x45c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBL4xTER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XpO3J7gM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBL4xTER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XpO3J7gM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8bEmf302956
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0tnguisxm+NfZOb1TyPdU15DKMG6Z+tm0A66q1LuA4=; b=NBL4xTER/co8/kJF
	7DSfXerpcioiw/bezO0kWygHrgEkzJz/LxAw6aNneLmt9/vcnhlKO+ahCN7qVA4e
	zgh/Plm1Y/Ydf21ofFkhdDO1/qZGs/za6D+4F+mB1DuVkIHrsKJoiyaXSqyPgdZJ
	7drK/V3h/rvpDcfTH3RyweFSo39wU9Asgt3HbbJIkRY8BNH8QSLRQ4Y7jfxWO4If
	U0iYrJUW6/+mBOjwCuToNlNfVl2S7BaUnVWLs8inpZ3j8NjrNYyOABQS0HjqPyAJ
	JpQbMUKhFyz9VTHAokGwfQg4PTaUoxybTjbnMZaitL+l5XClj+48IdMFE8zbmm7z
	Br3C0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqae6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:38:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so39067485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887937; x=1792492737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0tnguisxm+NfZOb1TyPdU15DKMG6Z+tm0A66q1LuA4=;
        b=XpO3J7gMVIRq0JVCW3FkY4JcuuOU3tMrA06/7NLqeT5iHKWV64biI4U7GLzLK8XjsR
         KOSR+L5+k3parWEanuq+MjfFQQImAn0vov5LEE903FKYzbQLkfQm+l/FhLQNH5Z1nlIH
         0NkTqPP4M3aJ0hjlBRV4F0Gi4BY69n7tXnOxiBWP1uhWhyDjJZZZNJG/UP+nKxhODRyp
         PeBu1YOB60AobzjUb2DGqx1JPKVmxnxyiHDCxcJVLffWUXKTjSYVYRHpg8OrcwCOZ0qP
         /txsnjwCoF96Z9kNZkiwvVFkDfHSQze7VTky385W0omVbT5Zc/2nFJ4W2XM9AV1ZzzX/
         E1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887937; x=1792492737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0tnguisxm+NfZOb1TyPdU15DKMG6Z+tm0A66q1LuA4=;
        b=tiKqjoNq2sxZ+XnqTzfu0ldh55Y9BPoe26dvTwMXHW+3jPbZGi2/Y43XtfCLm5r69V
         KyyWmry1OyCKLZDs/qL2VT0Z0Maok/trT8elZbaCW6qS5SxP/C2RDbdU0zy544xD4pDY
         sEobaEG8xgWyR+OnRHqjbirsVmBYCvs2oQlUr8EsJzkZnf4OX7oYZtt2LMxgMxWB1pre
         /belp+bTZvk0SzoO3PskszEinJKfCze+WZRmBWRLtvlrY3hktuprbAL48/k6NSLTmSlO
         WNxkynMHP0TeNuoL1Cidl5n/MoFsn4gm8oKhjBd9LvDfBzaLA6AiHPIpJfYpfBeKFrRw
         laVA==
X-Gm-Message-State: AFq9FYJxD15vlZQ8fGaKXSEKL001GUjfKp6u6nHfk88qjZ8r72CctFxO
	LADWE2lLIJK0qJCwIu1XvS/G+u1nrno+Gqc+emJUpZ6IuwZG39i9uN+eN6Hj227gn6l3dU3/rMC
	WKOf4Tw4yPmh2LHUChafcR4H9Fy9KfjbsAkbSnbREna3Ht/hgv+kdZh6mqcdTAP/M2SGi5p9YhS
	Q8
X-Gm-Gg: AYBFou040mDzmNp0jI0pEjDgcg6h7GtXcWvxKhQMV77ksyNmCVlPxhqGvTfhaLpMA0R
	O/F+qvZsXrKs4SAY8jTHFy63bVn5ZmRvkkau9JHLlB09lqj/VWhpEPqExX6sqppwfA5vvn/pqLU
	INYzZ/AE1QNuIrAAbn1fxL12qg6epAl4uuTJdeJFx1IiZ/SNsi7rFByCx7KlVJGHaWOY6LyTiJX
	8KOfAfTB+/r5KEKzWa60EE1qgfur2ahY7OK6PcsQrPc9T9rvb1w3ywwgEn8gxXZsqXS0sO/CgUj
	zioxt8e1yTIm3oYUcveYmCAYO+n7j7m8l1JBh5LwVsPqVHRZTBCo83aDZxELCNPq2eJEx16NhTJ
	CueMyA8QiF3nAM6RjXxPwnw==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2416252685a.1.1791887937225;
        Tue, 13 Oct 2026 03:38:57 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2416251185a.1.1791887936833;
        Tue, 13 Oct 2026 03:38:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3527f0295asm208034866b.72.2026.10.13.03.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:38:56 -0700 (PDT)
Message-ID: <61840bbe-8167-44a4-a127-469697e4525e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:38:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: acknowledge notifications
 on undescribed ports
To: Rahul Pon <theflyingrahul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930111657.1147-1-theflyingrahul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930111657.1147-1-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX1OC3OXTF0FQB
 inublWt3R4I497cSEiR8Z/ZEMILHwW1wLGGY/VRxmryC69gz5QZVVzJ7maOE1S/VNBpEvMXK0R+
 DvNc9VMPENwpB0YC1WxMMTqETD8CzqAmJ826vYY/ka/XFIu8rPjUKYVFSO6/7ttzCxWl0FkJUMb
 i0OnQhS6COJPeojTjCfoS6XMskUh+2cLF+yKSWgr63CxNjrRFQw/5RD2/2whD3QPqPkhXpTYMMv
 JeOOu2cGT7y7cfj00PESmyvv059fEpT2bs2LU2OZ3JqQZgX8/M3b+gHLRY81TokJrHVkMl8cQkS
 OkRP/rjruAl934sxt35UBOGS2t8iW2GLV82OlocO/d/LiIGwy9FPG4V3eIOLioqHJDMiQojTLQ+
 YHvKKlkH5G/1wNlS+DdYCiIRNGmPH9Qcb9E+eACm+MO2gyqGA112YNUm+WtYPvTL/uzsvW2DVVK
 iXy58+jb85q3o23InRw==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace0a41 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=5B3i7hfZnreuUmc6IpwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX/BgA3ENsKprq
 TrE8wKJI9aOzYeyYbhzzKd8bqOfnG9KoGGjNOKB9OoehjnJwEui63gHouxgJvqiSv6T4RIfeaP1
 xfhjULh5gE46w8UxxycCKG+WIGlpbPk=
X-Proofpoint-ORIG-GUID: PeNSKiaMI5oJaVhbjkAr14ojxDc78OUs
X-Proofpoint-GUID: PeNSKiaMI5oJaVhbjkAr14ojxDc78OUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On 9/30/26 1:16 PM, Rahul Pon wrote:
> The driver enables port notifications from the firmware (ALTMODE_PAN_EN)
> for every port, but only acknowledges them (ALTMODE_PAN_ACK) from the
> worker of a port that has a connector node. A notification for any other
> port is logged at debug level and dropped without an acknowledgment.
> 
> On an HP OmniBook 5 (Snapdragon X2, Mahua) whose device tree does not
> yet describe the USB-C connectors, the firmware kept charging on the
> connector that was plugged in, but once a notification had gone
> unacknowledged (on unplug), its UCSI connector status reported no
> connection on either port through repeated replugs, and no charging
> session started again. The firmware also reports more UCSI connectors
> than a board may describe to this driver (here a third, USB Standard-A,
> port).

Please fix your DT instead, all you need is to copy-paste some
boilerplate.

Konrad
