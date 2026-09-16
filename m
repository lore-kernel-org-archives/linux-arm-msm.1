Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9D5499F12
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549398; cv=none; b=i6TAc0Z3Fqj+hStFuvHs563cE7apULZ/ynn8IpzYoA7LnKlQ3fN2INTQaVcXGVSbcyyFNam96orWHMh59uaMojrHvMxVDJBdokF8Fg0O9oOcAJpfxI9tTYf+TPOUfNKlJevmET1xCyIIRNOoVWOuuVDTy+D/JU2XrMTYnLynzWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549398; c=relaxed/simple;
	bh=8UFeeybC4bmuxiusNOrf9sVTHbKx9+PFb0qkWwY8hmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfLLG9g3W2EtIPbaVE8t6S+5k3AJjQjG7HbWkvMa3NmBPGr18BUYkOpwqATGIe34b4CCdrEFVlLiNUOxHRlLut8xlo6Hu8bTulsTZPzlwzRTktZI9NlkGo/TIaq7B6BmcRNGZrN9YLn11B9N+mtkFV32vCRbrjewDobP2Jo2EgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkbt/Ib3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VL5M4AC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkbt/Ib3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VL5M4AC7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92qP63377430
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3NqAKzdAq254vliErom2NOcRQ+52lRi7cu+PTb9OTg=; b=jkbt/Ib3oZlFP/qY
	vx+fBsJvf/urm6HHBVNHJEfqN+K+1JycMarvEp7bms6ylGjyamQbsxxNuq8dEjQW
	8aCJo6pmz0ThQb0ww59Iu+Mt++3LWirm27pFMU4c/9zi/Stlz+FHxXw/qLaw5TZS
	YMulhlCOH6ZKCujjdwzPW+YdWgFwMjyYTi+MQGYguwylPkYQ+G1X6bFPtG0+wBCd
	/aPh7oS5HERU2ICluTxLftnoFtiaD1YCL1oRzVyKAsV6SryFHcOYkBEZ7ngnstpY
	g3VVCmBTxjoPKuVci6udACnFTxZsq/Ieupa3DZEmwSnYSnpruBwOSruUfiWYQnBq
	EVp1aw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpa9hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:02:56 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c748676f6cso1917437eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549376; x=1790154176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3NqAKzdAq254vliErom2NOcRQ+52lRi7cu+PTb9OTg=;
        b=VL5M4AC7hsBJ7HHuPMEpnYzQNhi8mJUQ4J+fRx3RX04ddN8/AOI6FBJN5gSyPeWVlG
         oe5LX7EypUpYOr6E3l4/IEnJc403o4aZvq709+h6wJibJrNJeevyjvBc0aTI5MODV7lL
         mcPTX3t+m3Ql+ofLocewEceupxEnu+WolM6iFyaGBMMZpvF4mvfRE3kOlS4j592A+kKh
         B6WChEL6Jn6BySBnbEEjX/rw2/yKINJYFk3NhXZMAbl0rVKzCTWmv7WxBkNxzN+VM2ft
         /uwCtBBSkZVRzyrP7NZ/Rc7c7yaVrPdYUu6vgwT93YwYHP2lmR1fmxrF5WYrbHt1J/Zc
         Kxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549376; x=1790154176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3NqAKzdAq254vliErom2NOcRQ+52lRi7cu+PTb9OTg=;
        b=SCfmYeoZXpGKz8SschWWYFetwDEWfa04koWYMmkwilBqnH4dF7tvdesQ0HwC3pdIYO
         HHWffN9PImoW4RNVJx283MhWV7ffXVDt2ah/OWP044JfvTlo6JoXh8SZLveAlqvJJUvQ
         8XMcagGzdnytZtOyllrMxkTQN1ss4V0mfbqfNmTz4vZ6wYI+s+GbpR2f3uDTEjkGNPsu
         kthod8R4Boyvdck/u8467Y4kOS3fYo3TwEQhmfK5NhIbQCVpiSwr4mytmU7yIqkob2GN
         ej+OEYwvcbyV1jfvumvOZHAeQZQrDWzHIIoG2A4EaM8Y38K7lmVW+iVRdMUme5oTZHHz
         N+ug==
X-Gm-Message-State: AFuF++nRaIVX4xxjuhnNfkEaV4Pd3k7CPbd+h0Oatsuui9WzhnEP6HJw
	apl6zEKc3IaR86OBpfS8gDNsfJP7ofQ7YhEh92cUC1ftgx9Sv7zoDr1yA2C9EE1bUPgx9wv24Et
	FIP1RtMFkzawVLRxCoUPyHxytiD9kkVktcDmOsZ+l0y+cwidbq1kIBZo5wYpFDsXiOcgq
X-Gm-Gg: AYBFou3PTrCWpGMxsWKqbw+lXr34PIGIZKONzRq9LKLfQuEceln+g6Zvyj+q6fEtNK0
	OF46WMe9efb3EBKVm2OfpPEMapBkYsqKauBYOmYrxUInpIwUsDQQUxAk5TgHqFyNvzg7qdhEfv1
	IFFpfuvTAQrDaui5SrFuOfobaShBeH7wA/HN2m/Jh8QeVjeJ+88f1jaQiXeBvCw/BTh29ys9A6F
	yJWCwqHrbeyD3hp13TT5npEsEse8UhDuyxuApBwR80TORilPMx62IxX93pFHz95ELRNEpFPtOG2
	69++P54uoGW2aDrB8cfb89deJ53Ws4s2dF1ScK4re2QbfyyMhOVpHS9aoBwfCGdBwnRfscwD7j4
	TP1ojmfzOgtWkHkETTv75I85uWz0f9RU=
X-Received: by 2002:a05:6820:81d7:b0:6c0:e39e:c22d with SMTP id 006d021491bc7-6c7d48ef8ffmr1847066eaf.53.1789549376054;
        Wed, 16 Sep 2026 02:02:56 -0700 (PDT)
X-Received: by 2002:a05:6820:81d7:b0:6c0:e39e:c22d with SMTP id 006d021491bc7-6c7d48ef8ffmr1847014eaf.53.1789549375491;
        Wed, 16 Sep 2026 02:02:55 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm6413732eec.16.2026.09.16.02.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:02:54 -0700 (PDT)
Message-ID: <2e5278bc-5f11-43f3-8e9e-b70786a697b0@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:32:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfXwucGgCVPrtvn
 V436xEB8PxdhvVIZ964JMp99/OwHduheZcQ4rz7qcHTuDBPi2DdpDJP9VazP0rwyhNkspDWe9Pr
 jDlS3E7Qm6ezwyloeIBiVG+GV5FJgSg=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa5b40 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QTb_0JKWY7oM6lVZCfEA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: mlJZIBhOKqjltiVL3L81FtDJXhIMsHBW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX0nDyN7Ufdqz5
 jqbdrWi+be9VVTSHANBpxPtDHBCofBZARNp8a7t6TQx+WSN1s+UgjSxN++tX1vBJ1UwUuPgVn3E
 9/T1AwPOzfGZENHOXKJiPvtKWjC22HzquTdZv9SbXw8j1TMj/uXATa5mpE4+JBCM0shAkhrP59U
 7Pzov1vyX1SgSuWq79ImIUX6JzMtCv0lfkJxN8Z1uE/368m1tgCrtmG29beT8RJnJIJdpx3l7jF
 KTBGsa/NtPcQWbrV0AmYf5gFgjWC1c8txNutzk/cFCck72muhw841dbtA1vFc6C3hLlD0GdDf4V
 kBrysEWBvJuwrXl4w9u6K0Y/Rnucjeph8OkeAWqlpXOuUuzMLfsY0p4GzI7mdrZJAI0y960gkzv
 9OkBmAbMqsMnbFCfL45BRVWWT8tQLpqphagh8hUjC0gMH+GMVXWWLfWfveVBU5P7QFWfFv/Vgp3
 2UpF7vUEDj0AvzWkuyw==
X-Proofpoint-GUID: mlJZIBhOKqjltiVL3L81FtDJXhIMsHBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160116

On 07-09-2026 14:58, Kuldeep Singh wrote:
> Qualcomm platforms with a discrete TPM (dTPM) talked to it directly over
> a non-secure SPI channel from the kernel. Arm's Base Boot Security
> Requirements (BBSR) v1.4 require that access to go through TrustZone
> instead, so on affected Qualcomm platforms the TPM 2.0 instance is now
> fronted by a Trusted Application (TA) running inside Qualcomm's Trusted
> Execution Environment (QTEE), which talks to the dTPM (or implements an
> fTPM) on the kernel's behalf.
> 
> This series adds a kernel driver for that TA, built on the QCOMTEE
> object-IPC transport (drivers/tee/qcomtee/) already used to reach other
> QTEE services.
> 
> This patch series functionally depends on below(patch 5/6 specifically)
> for qtee service discovery.
> - https://lore.kernel.org/lkml/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com/
> 
> Tested on Glymur-crd target with tpm2-tools utility.
> 
> Validations:
> - Get capabilities
> - Random number generator
> - RSA key creation, encryption and decryption.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Hi Jarkko,
Kindly let me know for any review comments/feedback so that we can align
and shape next revision if needed.

Many thanks!

-- 
Regards
Kuldeep

