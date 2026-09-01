Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CF847208B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256628; cv=none; b=SGHJHaaadd6BZS0fhJbXMcBMDkgsgeUiKBg44tVSUTN3zWj9yq8Y5WdfTHbJe2X7usoK77Uo6F4l+l798d4JNJZnZdq0NpslioSre3jre40jelbH0FHoCLEA7Bu8dMFSZMWkbBWptYvBmMlSKu20pa1OvDLNIxp0PwoYcuN0gBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256628; c=relaxed/simple;
	bh=iT3he++A8kxWgbBGKxwXXDOge7lE5zpc2ZmxC+hzKG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sljf1DFrwaYQKVSOiujfTCoz2lsNjNNdIGNr3DEfJpRTd6tm6pELCUczNU1lq9j/hNBr/Xi06ghDgu7wQGQyzGQh5h6lRDxWIlDb3045ZavAEKEWkIRUbVBrSaid4kV01Z/nDJNhKZtY38d9xzJ7iidyXb1WJOP7pbhwOzf7rSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyhlwtMw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T1kQz9qD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyhlwtMw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T1kQz9qD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Gm32561935
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 09:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riNd+k06dt8Od8kRfBQfHabMphaZU5P9P6lFEw+XKfU=; b=GyhlwtMwNdBOEM/a
	BhEVSNxZjkjMP8mQ0gWv2XaNECMYycdZfYoWbDxZMkurbAwquFlLXATHw9zeTo/H
	ez2IaJofj4kyy/+VBadRH8x3mJ4fDERIysqDm7xPFkA6pchjMjgeftWCLjDvjOKg
	iRjeH9kVhy8ozNjpLMrjki5hLxb4mug+PihJwOXDAlMXG8KFYzZ3RHsMiiunkfcZ
	Y+zUMTSScBpQcwrNKSAX+ekLcrImRMoQsgvDrP0D0a1y8Q/RerPLtAm4o3CYshBp
	jcn6sbYm45Lt0J6Nq4rS7xEvd03E26/IKCVK02Jydyji3u3dEcYBoZTmWIXKDWqF
	grI/1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3br5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:57:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90520763ceaso4253336d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256625; x=1788861425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riNd+k06dt8Od8kRfBQfHabMphaZU5P9P6lFEw+XKfU=;
        b=T1kQz9qDMIqBCMdmHdoweAttzhA0OlxfQIx2hvmcvQXmNU9xndKWVpSUpWKTZnMwCl
         WOTg2unavKdqrQoVuN7GKOIXJmjENgEQUsLgHkNQHGOkUHWyCDChMSaxDAP3MEZm7wWj
         rXzxniKqzynGmVGhYlhZlP7SqaglbJL2ZuYCosA93kE48r0HqXtk2ZW3biQYNybfDdx/
         bU4wkfg8gHaD8MaRnJyO2QdAsznfzj2gbYiI9m7WjVHcA8NxJQvyYsREX2N9IhvlaLkA
         BKGdcp1WLzyT/AGjd8y9mnNzyr74m4PeMEUy378J0ztDXM/P9WpPZZWx9UC2xnyMheDE
         YTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256625; x=1788861425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riNd+k06dt8Od8kRfBQfHabMphaZU5P9P6lFEw+XKfU=;
        b=MGcsmDZl11EDmalhErOapt0HunKB2ZxQu8VX8zCrAPI7RZKiEYzDlhjANWzi0KozY8
         8/KffUeV91I8heIzqhmyzyYYDwiOnIq5JEnz7B2OvucVf85PkMSyQSeJXma4W9LSkngN
         V/7wPNHMdXgp9Mwl6Fw3jonuNckRLAT02/hMdW9gYcbT3j5a86EZFVF1ntw+zpwLgV50
         F0T+VCAul7rKiiFg3q+xI4ZW0PuWkRaXWDId7qMglG0SR8IPeIz5aLn3KEgFlqWLc3YR
         LuxvwagqS+Inmytc0Lnv+P77oaNYUnjqs7IE8APgU36IjpsCN/2IzagI+Z4NWkXRvWre
         xXGQ==
X-Gm-Message-State: AFuF++l5DHBS2ILXXr5kSRM054BfXk3t/Ns+4aJlS7BxyfwZfyDFSvbe
	1H//oXZItEe/+IsRrCHBfMJm9KpNaEXloH54VAVzUP2vyk3P93ZOErDZYNmaNFt+4net9g1LlSY
	Mg/Oeby8AafwjGGEdkGfYYp9RrP9xx1gbj+NNMz6xxK4oOF58AJUv9ntireCL8pK2ayWE
X-Gm-Gg: AR+sD10t/Fy9WZTlZbSWyxjUcZFioGsdFZ9PDXuIp7e1H5fCR19x2Lv/osWqqr3i+9c
	oRxQCpPPnil758uK5fB/6JtUEHhbJ0qQHE7UAMpo9qjYHP+EPowBHPtsVxYpDqhTmJeUBVJY+Pv
	88ZXMxuPjtUgiOPmaX1Huq2NSGNB8Qx5XY/Cjb/SzMGzey+7ta4vSuvSm1N/Wi+TFyd0q1jdg7v
	ELv8D8kX3zaBTKh0wsj/vDe8WUn77eNCYpZiw7XI/5wS1SPt5Lrz3yMxmo3/OKQvmv8/eHJ0hO1
	HkaXCj7SvU7GYXJEyca8lM82RwkAlWLCluDG/J3NEzcruu1c2xAZO5i4U2tiypimU27nySGfGDB
	xsMntl3ai0Kz/RFC06/d0/Q==
X-Received: by 2002:ac8:59cb:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52fb93d5f6cmr255606371cf.2.1788256625609;
        Tue, 01 Sep 2026 02:57:05 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52fb93d5f6cmr255606101cf.2.1788256625177;
        Tue, 01 Sep 2026 02:57:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a670b25d7bsm426703a12.25.2026.09.01.02.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:57:04 -0700 (PDT)
Message-ID: <1383bc62-fcc6-4d5d-a4e3-b2b6ebadc0b1@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
To: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260831-master-v2-1-0032ec7fd1ca@oss.qualcomm.com>
 <5bb31efb-3855-41e7-b011-1a5a94fee59f@oss.qualcomm.com>
 <5be318fd-5413-4d6e-a8c0-f1b1eb35393a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5be318fd-5413-4d6e-a8c0-f1b1eb35393a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4OCBTYWx0ZWRfXybq1V1/2CYMG
 HC2g9jXt2fQOhErpwuFFlPUyQrlkGYRkxf6el21xDk0OnD/q6mLUYRL4P3Oe7BjaIlsORD3qkcA
 w1Rwdy9NNLWkoOcBUqBvmYC7VteD6qi7V06DNcP+42L08TTjzhniTCdAxJzYxGTnqGJnfORH8lC
 4uE8pfEYw2Ylo4YZBUMgRI/pPLcz/ixj1KT65oGsHXZZZ/j4hhqP0az7PsQbqZPCAcf6gDmBpR3
 xODO3xtnS7e154PiVn+UZMHcHDi1v2SnGTHzw+teXspfe0h2MOTVjzcVQ9P89jWE6XrcfjZmInP
 GupxGMOAgXuWMdsUMiWaxKVRayBzBHzbr+stAYC04c86H71mIh3HkHMXLDejZdxgqJ+azg0gCOk
 vPvdH+c7oM4TuXh/Sakpi5ntXRFuM1Cwi5YaELdMVKhdL1lTT4971vUkkZUTwegioeM9DD7bxNS
 usxQGDmQDT2+K1EtFNw==
X-Proofpoint-GUID: 6Y58-BnFgtYurjC8lAzfWE9DF1Cb6iIe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4OCBTYWx0ZWRfXzsqIDtZWe1EG
 2u8DfuQEIGneGbSprSERvAmnyN/cV9SHunLWJjml8rCLBiJfVXbm3oPbqyU79/yshwbRJuZ040g
 5Z6FrJeIQ65GPt0inr7okcFZpMCi0J4=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a96a172 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qbdvrbZ-FacRNNmyY2IA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 6Y58-BnFgtYurjC8lAzfWE9DF1Cb6iIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010088

On 8/31/26 5:59 PM, Aniket RANDIVE wrote:
> 
> 
> On 8/31/2026 5:08 PM, Konrad Dybcio wrote:
>> On 8/31/26 1:12 PM, Aniket Randive wrote:
>>> The console port uses a fixed line number and is not allocated from
>>> port_ida. However, qcom_geni_serial_remove() unconditionally frees the
>>> line number for all ports, including the console port.

[...]

> Thanks for catching this.
> 
> Looking closer, this appears to be a separate issue from the port_ida fixes in this patch. The dev_pm_domain_detach_list() problem already exists in the current error path and is not introduced by this change.
> 
> Since this involves power-domain cleanup rather than port_ida handling, I'd prefer to address it in a separate follow-up patch to keep this fix focused and easier to review.
> 
> Is it OK to keep this patch limited to the port_ida fixes and handle the power-domain cleanup separately?

Yes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
