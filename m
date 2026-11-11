Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402247;
	b=NoBlSuNY40nbunqU+zRXi6yQiqH2U2pbPbtGKiWl7bwnZaodaAMtdDQGkRuXOfPtZntI
	 9dvWFYmYJBaFTz7Q4KBUIDcJpBUfIqRehABAg9h78ZuhjbkhF5J5Hi1tSbjTOE46QzFaf
	 m9vORrBFcygwLaXUdGAmth1MwJpRdxAIoVPANBzFWxf7eOW9dai4VNBaocY9vwDOx2Ebg
	 LtdGD1Ukosz7fDgEj1cZcJJ9jF6ebssvmMmLlQJp2+Ps7NutvNkSr0N9B6L6PelpBTOCm
	 efHZoh+mtn39qm2fdnMtAvmibrh6rxsULDEOMa4MONwJMYQBs+rRXMrwawNkR/X4FbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
	b=vUcN1wS1RFO7KHTLwNGoglp/6n/n+Pe3UPJAhXvpYiggoDBpagbxPO2eZ23e+6GU544S
	 e3cYilD5ZveUCeK+O5DNma1rZ5OlsoMxO3m9KenajROKnjJeyELZn0dYA/G++UJ3mu4Cc
	 outfzviOxlA4qBsXUTe2K0qiyWS2Z7RLrEAQTnk9bMaM3QSXtnI+g+foV09uwQWy8zwPZ
	 8CFF5fpPj5fPRvG0+QlItV07QE7MKWff8wRpr8PrDKtuKDqTH4XI39OF9plOtoUCqiEZN
	 kSBWLO3tgujXxveCskql85x7NG/tvMopE+bzWvJ+Y019si7Khdp5IqVk2EgTqTPdHvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXQgzpip;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO7diadG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B30606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B30606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXQgzpip;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO7diadG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZN813292404
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hXFO6nUxnCW4XbKSEmI+WWHT
	tNiBaotTU8OUh9DkrJ4=; b=ZXQgzpip5uTvPSftHjwaOcUkWjomKAoZGLBjeYPm
	o1VQ1fRKMILYH+E2uFvWC/UqY3Yc/4Q4Cqy7cnrDFiv4EcuAgnTv3xA+bwMUFWPo
	TOKcHIcBcPBQwTeI6WiNqonqVAiFrS98rjxib8gIQlgalfftVkLQgbSl5+8L9hzN
	2ojK22wdT3LQwRit1G1MrsSzRYQ9WRi5bskOADsWRZ+IDlHaN2bK9DM4sO2KqbBD
	n6fexJdluRTZPVh/Q0Ax3hc2fl3bhyCm3VDwbPe0oGwC43BtkpXpu+dDgqGY0ShZ
	vKLCnaMizQ98DjuFwWT3CLzuTlwV6efLjINJtlAuzKZipw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2k7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:04:05 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806756ea40so2396964241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402244; x=1795007044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
        b=CO7diadGiAttY4E/+4kLfuiiHeeRkXpOKDBR78nRQSn4cnlrP9f1b9i+N2TfYtUXky
         kIzJy2WJ1U5w/lQigNsSxgKmsJj5aiH4B8jdQZULkDn+lDYTl5M/6uknK9yI0Y+sNDCb
         NL4aJTRvkWYeHNAZ0PfxZGLAsl9Hu9qsM2o1FY/rFEpYxmvpwxOCMfxib0kbz1iLb7uv
         C8WFBxZwecyQf4UUfaFt2qCHsh9qOWo8GaYMoYYxKbKkRp7nVSX++1qKfaJfCI6dgelW
         4KvAQCMMJBQClZr7Krz6jJR+nDdQK0fEdTLjTxDD3sOCtsb+1+B42veaMJZ6kyKt1j/p
         tG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402244; x=1795007044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
        b=Q1RbL/8s+/R1/l/RX7uFJvJ0gD0j86V4ViV7R97E7i3eSDnKXpj1kuDKz3rh/qs1xC
         pB1s7jRpxnEv8EsIXX1n6L912H3VkX7FQLfgwrMQmRLPfeuC8uGusSPXINWak45Wg+3o
         /jVisGaj1RkkYEhQrenRYSMG88ZAWGsKbt5rq7FkJZWDVlXmMtKZaduN6ezMQ1LEtqpe
         huWwUUs18hYP+x15WGKCCEHhynrxgHCXD6dqsc2gHNQY1nvT9Yp7feQTLmKIUoo89MSq
         MUuV8PlvtSBFvUb6bm5bTCYKsUw5l5gYu+kpImCpzEM2fdWDqN1+yNvD87MH3PJ6IwHF
         5tBQ==
X-Forwarded-Encrypted: i=1; AL+hErG4s2Jg/dk0v1XIPtt3sgwglMcWaqf9jewqV5hknbQPRZaoJFfd+EqsyeRUwaySmzw5Q6ZqTpZshtyN8dAX@vger.kernel.org
X-Gm-Message-State: APuU4Z+YANJ8yYk1a8CnPgoF51J2p4euzZDe5AZp/7wwA/8Xr80Ss5c8
	ERWQiTRpsFo4fwTgyk7iU43a3sQfXIboZ2PnWukQJ7e6CBZadLwsd/6ifQ0RC2kg6kPUVfL8ptM
	x9M0OiRdMRQ9wyqlV0DySsiQzASyj7FDcerqve5wZwLx0S4Hypb1wrr1njNastu6OkfuR
X-Gm-Gg: AYBFou09hi5EkRgMmgxQeR+c0hNYwW5WW5YO03dTIzRj/+MII4Z8C/ce1/uTEzy+JAd
	JdWBz+L9eDuDaHa6VsW1sgzPOrFf4UiEb+GO/xX+K+JonYDsn+zOQJLs4c8rcA63iM3W1xQWSBt
	ROlWPtcMfL0gUnCP2vaEz2CYHQbLfpjGRDB0yA3zbtyaFs4MJYwEuioA7JOtYNmzKpjPYx7qE7I
	R7PnJhCkjry4C+U9nWv75ZAMZsx8V7dnX16/JQ/9luRkrbGVPHk2sxxRdemBRTHFoxD3BiLDD7q
	dp7N7ZwUqKtrSAiCSPQTcroI5b52332/g/kVrfQQ29fcUQB95a3ojjhhdJ8AlPaZY4k+7M5N2j9
	G9QsjaxVXzOuuEbWCqEoEExXqivcowfnIvXORks4GxxPXb4WBb0cHdbTnB/oLEGT6ZLgZK4qfhe
	s7hgY9r0akiXb+30SpxUEL0Agop9MZM8x0pXoSwhqoi3bUUXAI7tpDHRSR8KkeIg==
X-Received: by 2002:a05:6122:1d8b:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ee1c490338mr604719e0c.21.1794402244027;
        Wed, 11 Nov 2026 05:04:04 -0800 (PST)
X-Received: by 2002:a05:6122:1d8b:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ee1c490338mr604634e0c.21.1794402243470;
        Wed, 11 Nov 2026 05:04:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb758esm944566e87.67.2026.11.11.05.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:04:01 -0800 (PST)
Date: Wed, 11 Nov 2026 15:03:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
Message-ID: <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfXykzoGNuwlTfj
 OfPabRNUs5WewDAEZ2Z3z2uWEAKmxjK7r1b7j1j36vbT2DjYDucZo+hxx765WTgpjOQjF9h9nnT
 b2AZeeGjprMRi9N2U0Jy9ORuBAEjSNg/NVW0WOuS1y/m1S99Xy7Nrkj3VGNk/4aphmotjVRc3x0
 aNJDntgKNndA/tDfiXrOM/B2gz8IThdIOYjcs6fQ+L0cHAc8GKxIzGMTXt4TFWWd7m75dimMKWJ
 /b8Xga8udOrm00UcR1alXSYjnw3qQE+1A0exYNnqorvZCBhpYFHjw7hVJCYnGCdR5dbDi6UyK9j
 aXXg2LyYtBvrdqA2O3ffDhCMVYSQ/YriGZC0NmmPIYSJqkpu+Nel2VNJSHf5FAJ9ne/QCQog2aH
 hRXO2fWTmbR3E9Ulbv8L/sbivkSoGbY3xXr7/cCmqr2uPjx1gKXOONIUtAbQ42oPsZngv/kQZV+
 9hd0hc3BwUABXlEWAkw==
X-Proofpoint-GUID: xf6a0By5tHEgo-R1UYoSyZNPFX-EO4Po
X-Proofpoint-ORIG-GUID: xf6a0By5tHEgo-R1UYoSyZNPFX-EO4Po
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af467c5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=icXyEQzqa7ihQCE8Zv4A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX67Jb/X9LJ7Ii
 nqOP2YKoFjsWYKSiNZn8owaDZLNl/E1r5Moyi5NlqMxEk+5c69Go7X1ZJBQxnHAJkShHOXNS5/k
 S5y0cLzobj+kC25u+4wbGXVwJ7znwR0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
> The OF_IOMMU code relies on OF address parsing helpers, but the
> dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
> of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
> annotation to handle configurations where OF_ADDRESS is disabled.
> 
> Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
> preprocessor guards and __maybe_unused annotation.

Why? What's the problem that you are solving? Why is the current code
bad?

> 
> The only architecture supporting OF without OF_ADDRESS is SPARC, which
> does not use OF_IOMMU, so no functional change is intended.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/Kconfig    | 2 +-
>  drivers/iommu/of_iommu.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
