Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007692;
	b=I6YoDVeHtzxmpa41zXPhsx3khqkoTpgNZ55iabrk2Yan866j+TdliTtrbaJtTNS1tKUt
	 FV8hHHWRJkl3UgVGXHp4qm7cDIK5eS5hGsiDe/9ilgCsqb1Erqo4YlpSuawRpKtAL9ON2
	 lDVvEFMC+nLX8H4b0IRljjRv3D7hF+UhSrqy/7FGgIHSLnZpHrcA8deVJw9XrJbz2CaZY
	 zsk5eQdDL1Nh6MAf/s8FE2yYOXCALXcBvxP+5ST4sVlPg5+dhv4RxTUJ421vkfHYhHA6V
	 S6NwOzf8ctqPSrohhIOqICHJ26Ftp9gzW5oXufQH9E4sGhLdE+4WIf8IHHqdggu8jdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jtOjUMLPVMIzOsKurX3BXE45pHwIm7WjBEObd/L5hnU=;
	b=L8OtWUGw27yH5wPcbbqSHT8qfZoCKZsxjuEAmZkVtb6gj5pMzYBFbmaM589hVCsaHrEy
	 hqjgBWCLlsg9Cp9geSqr5gap355LKLOzFESytHWgm6wN4KOQugxL5e59lYIl1IuzNC5X+
	 6ypf7sLD95m/cLMChwRfIJTct3BQjoPAu8yPIVAnFousRV5xuj8mzq8ZKlFB3xC2bResr
	 sSfnmSnfIMIGInKmdVaKjrjaPZtdgZp05Vi42tQvuh5rzEUxygWhhfncn8R/lg50NjKmB
	 BT5XdqB1UGRtpe2wblJePFaLoXE6+PJNUEbqjM1k/on6wD6Cab4oqvwY4VJph3ZkQsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bd7cZQyA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwwVyQPP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5299606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5299606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bd7cZQyA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwwVyQPP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1Av2206193
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtOjUMLPVMIzOsKurX3BXE45pHwIm7WjBEObd/L5hnU=; b=Bd7cZQyA8FERtPMC
	Tw6IJiAeOXlQKyEVxMJWsUOC0cc9DZrz47pkfs3hxjFdRfxZbYrDZSHWLnmY3xg1
	0QGxG3mzS3vx2GzCN+szDYr3jJr7PBL72Xz6IZ0Z1PlrkBkz82X/MhyMI6LS9CgA
	iLphsZK0ZlS6qcvqEXyhHVhzaTbtlVVqOTRjWTrKOrgfSIkjbWV05NB/cD7qDUtk
	YlO+8Jg+VFLMPYKxqJcZUTWVBxPzzsLfFEngBMAg+xvALDITXRmPf1X7c8ueRHst
	CTDAzjXhQv5pNw483LxhKBUMUlGdRp62IHsteSeMTB4JtB6YFhc2DCpiWufG/AcA
	KFsndw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunr8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:41:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb1091fffso20266685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007690; x=1793612490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtOjUMLPVMIzOsKurX3BXE45pHwIm7WjBEObd/L5hnU=;
        b=jwwVyQPPXcVAKmPInRRZbT96OGvupJzO6Y5foLKjn/2WivBNN1+UCDwrrHYQzD/LH5
         bShaG07+kzf8jbuu5A3uI7m8m63dv4NIWoIUHhfOB24dcXcVkNIgnKkYrqY+mRIr06+Z
         1E5AcqtrNu6d2e7dCJztCfmuI/ZqNTksuliWfivsxsolLt10pNGm1L6MpVt2bu+siDEZ
         ehufSUkAJdKiXgv7l+6CUajcm9RnC2lNm0dyLHD0SNog0n2yz/sj4QAuGx1wGV+tjjA8
         AhXJu4pTSPMzQXyhAWe/+OKgq7Q9K8c63eBl7ns0FtOjB0Xu1s45ZSAeUfJfyCjaEFtX
         RAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007690; x=1793612490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtOjUMLPVMIzOsKurX3BXE45pHwIm7WjBEObd/L5hnU=;
        b=HOl4i9JsYvqc+NXcgJhTlrLZJ2Z+QuqFqfFyG/+Lrys5PYJZmjjRZ4SxwAktEEOVi8
         rbrW7ik07z3p/Y5tZ4RZRbvcTR+Rj95wCF9H6wOM0giJEIc/3YZidBJ0W4F5yd+/ZVW6
         8CC+W8Qts/9rRrQQX4wrpvihe2fScu8RXS7bfGMxp67Lpwjne2GJFw2bJwtYuODxfh7v
         3AcW9QJUDitvXxrFTDJNjWciXOghAZaOJybki413uc4yLqri6AgaThd8/0KgrRk+3yCA
         w6TuPkDkNv5sz/ZP03CQs+k4fx2Aw0S8j8j7PeVhc9j4POV2XJexFhB7FxP84bAeghoF
         t8sg==
X-Gm-Message-State: AFq9FYJ1n4BBmpllS9nPcjwE27NVkvIzXiaMG0rcU5sU6OsJqWYRBobo
	NXyEWGNWnMw2P/RIg4ylZ/Enxn+dNmD/e3cS3bev8pDm/FjDLQNn+ei5qwhcdBh/4enrHc7kkV2
	bdUn4421gAf6inmz/9gK4sXkv+SQVXjO0IbbgXIagO9otxk0KKQkWDKW2PHP4GjPc1CqE
X-Gm-Gg: AYBFou2fFeAbM+LV7oCFaKEe0aO33b+S1LHUm2cG0aah8s7evsryhVm54/7O19yztuk
	PsAnHAVfku5/Fw9jcDD8oThXoUbwmDBiWx2YwoqInd1/FJf2/ps+/oE615jITUj7AQ/k+G73s26
	TE8Okmu7+jZmlkKwMdIKJeVXSvvKD6wwQLYV8x+HRZXEQewFqOAl24aD651znYNTnIhQxq///bM
	4PDibZ8rcQY34VDD1SKU789EO4VLFYXympN1veHJQdPTSzJfxtfzKgsOmORceEMY9fLXgljoRka
	rui2Ksnvim3Gt5r1uUFE0qSbdqDMbAfpXJlGjRB3kR+REq2fY2K7ZfXx9xPYNUgjbVDR9kdAnKP
	gcs+Y+8m6b+eqAwaQjIC4hg==
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr954270885a.3.1793007690221;
        Mon, 26 Oct 2026 02:41:30 -0700 (PDT)
X-Received: by 2002:a05:620a:899:b0:939:eb09:4458 with SMTP id af79cd13be357-940ef8dcadamr954268585a.3.1793007689733;
        Mon, 26 Oct 2026 02:41:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650890sm308885566b.51.2026.10.26.02.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:41:28 -0700 (PDT)
Message-ID: <9bfefd42-8562-4915-9d5b-8fdfd2cb6d8f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:41:26 +0100
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
Subject: Re: [PATCH v3 09/14] drm/msm/dpu: don't tear down a failed hw_init
 twice
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-9-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-9-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX22wZzpIORoO5
 SWTuO+obH+xBGGq2ey+NC1DRI9VIlG9UpC7oX6z/UXO+4SGYkFWLQUVEUpgnjZKMNC82Wi2q/yp
 ZASarJ2ZgDnwTJRr8EEXYmtIV1dVoD+lhtR5mgV5XjGaEB3jCIsXCSAl7NnT/pwaXqz7kduyG8i
 /sZHkuMlSOWtpMXbU/OCWMD18SMe85X4bGj6fBhmidWBdVxBoeJd8p25eObq0DzuAcP+w1XgEtw
 g5YlA3+uiFtYjf7gXW5RkWt69G4APd8BbWREyijmPUj1sRlfMqsVj8Tt9DySz9bz+q0LqpEBwYY
 P+LUkz0H0hJpi8DoMevix56yMVloAJgtQNCUSGlxX0cRTCeX58mIZ0hsTO+Si+zvAtckBjV9XBs
 S0yEIhIEOJNsQ4o8hCZM1gZF3vYI7mGkOLu283K1Wwm1xacR6cDZSoq8rIM8qxgx245vRKS8hOc
 qKn1hu2X8gS6orl4X3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX5GYCd9V5B5oD
 yx2Hsa1nrevj9amXvn58dNRXfW8fJhRuPhejpsa6CWmPdJO8661ovIPyoNNP/Ai4MEIJILavASi
 /i0hy3UuyadFdV8d7jXGhsb9tf0My/w=
X-Proofpoint-ORIG-GUID: DYYta3eQJJQY5oOx99Hm7DoPKZEBkdcQ
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf204a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6EvNe4Iz7nrDccDV2EAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DYYta3eQJJQY5oOx99Hm7DoPKZEBkdcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy() itself, and
> the caller then runs the ->destroy() callback, which calls
> _dpu_kms_hw_destroy() a second time. Since the global state object is
> finalised there, the second call deletes its list entry again and frees
> its state twice.
> 
> Fold the hardware setup into dpu_kms_init(), undo the steps of
> dpu_kms_init() when it fails, and tell the caller not to run ->destroy()
> after a failed init.
> 
> Fixes: 49e27d3c9cd6 ("drm/msm/dpu: finalise global state object")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
