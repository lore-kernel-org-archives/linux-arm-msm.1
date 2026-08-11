Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8422A338936
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457431; cv=none; b=O7zQXqpG6NK0nly0sE9TLnUGxT7jaz77hzbEMm0ioQO7ZfL8NxhZVIL/V3vqN264xWUVW2Ez4MX54PvYp7TiZsNeq8NiBein2WQzc0oe3hAhOHEhZ7A+20gNCDEIzE3DcHmjgzmyck623HFI0Xl6UkrzuDn6v8f9R1Oxj2ZwKA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457431; c=relaxed/simple;
	bh=c0GpIF58VPRCye9Oan2goH8X0n1TBH6l8lxPQPxAeHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6uKCes7YmbMzxKqsxzYCb/U6nQ4VdWL6kLtgn645R0LEWfHvZdP1+L3zy1gjhKNdazgBkskO26zTAUo7VG7P721+qGgvXsifsNFurVXuLRxUk0mUXSe2Pt6xIeKscbD2JzAsi+LUDu8cqVNjuV9hW73842xVtytwCR8N0eup1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HyaVOOsd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQx97qOn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HyaVOOsd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQx97qOn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWfNs1317142
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C4MTfVrRtBC21wV1FG71Ff0/
	JPpkql4Nf/R0afJ7Onk=; b=HyaVOOsdt1KnAz58X7oF5a9LnfhEvWaGFdGNuOSl
	xxmeWA7H0pu1rsvLQfV6NCNp3aTygreZfpzmCDdDRMCYS+QUmuoNQTmv9w8VnX4U
	LrJcukpKLZ2t7VMCmp+fpzGxByex3U1eCOzSVoAuULIiM7d7xXCKa/UFISEZM4H8
	HiBWOALRVLCJ/nmBH3TRH6d6JQN7VJ2lpYtmfeLSrSj3SPEgDu2qvFnb4DUJLEQW
	w+w3lwybS0uasoK/xeocxk3ZLAQIAG9Bcq71X0y9JruoJX0vkTHtFsRIMsy7wwyf
	ypqzFLcvzHtQih87s+6RP3wGp2l5lU3e2nS8flIJZn2ACg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk3421-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:10:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9489f62bfso37726156d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 07:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786457429; x=1787062229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C4MTfVrRtBC21wV1FG71Ff0/JPpkql4Nf/R0afJ7Onk=;
        b=KQx97qOno6CTAHTZ9KoYIz7PwIE8gBvHUjmMWIx2XxvKgkmnWpn45PtNk5Gj0zsEas
         MC5nAqwVJRMn8wY9PfOfzvde5duFXW4WyrODtGDxG7lGdvWvDEV0xn75c+PHy8xevPrF
         TfMWe1sQMlPESSNcVh/1TLHSexX68EGvsB27SL8MVu7Xon7FwgM+TKyFmHKn4O/2h4o5
         G/Zo46v0T9PqPqaDhurmb1OURq978pJyw5M6bz2bbqhA6/KZutAi4TlDwxzOhJ7gGfMi
         S1Gz3+tHZtXIog9UDZQwESTLJoHRb2atQpf+hqNl7sNReTqWNXX4wD0qMQMVwNvMV0g8
         kDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457429; x=1787062229;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4MTfVrRtBC21wV1FG71Ff0/JPpkql4Nf/R0afJ7Onk=;
        b=QYIEoZT2E8oELDwiLQUxKGz3IcshHyI3CluyyZkW6mkQfJReUINvpFbudytuNFftMm
         D4ZMeSHwFegPjLIZ10igKffVKx4dM1bGETkQAGUc0dnIDXz8kESX6HiXxaD221vr7mW3
         gov9Yd1fLw28VgUKOKanD8GwbsQrulT+zjH/vaX25x84nPLMd5HnQoHQTR2W+5EaKlAo
         5VJie9jZ5feaJ+dNOcJKGTpw62t6G2N/uaQL8CSLSOnlAioNoq/d2uJBZq5gMFaYkRjq
         7ZrzlEZpzL12nHUwC2qyVnJX3jRczYJez/hK0/WtTkXKzPFzggPkMqMCPnLGO6MaulQT
         pi3g==
X-Forwarded-Encrypted: i=1; AHgh+Rr9qx1h56jvRs73NE8Jtx47hSpq9lIYldWW/0ElQmBImViXkPXpf3NVDdyKzA43PSaCXLcj8xt5/Fjo3Hxx@vger.kernel.org
X-Gm-Message-State: AOJu0YxNKt82HazCDL+5P7UTvvLmU/IX1y2xGKGWxwaje7LM7tIUjYQP
	+GKwd7YKEUkVulxioSFWh89TVmGdtunNdZ1uLfHpl4DrE4/F+viKQTV0JUmEOl+xdKTw6h8c5kB
	svCWe3CFUKosMZ1TC5zveyUK+hxeS/Y6+A51tSEGjPA5vKWisQzQjFsC4+jASo3bSuJDH
X-Gm-Gg: AR+sD134vC4euwyXV0OwH3gHDZiJs7CHP0fFCBsdDXKCyACsIYcBuxZi1lOdIPxbsdO
	UhuddnL+6q36comdXLSlQdCpgLJpZbTwaQjO4EgyDEPbWaCR/IGD0D19cA/hne70unVTzQ0PziZ
	SE/SRNixoijHji0CbHBTd8lPTIx8VK2dHhe4Oyiy8uhOvhh+JbikOzrfRpJhP0vqdlClICY+/Fb
	v9UncDVaEFKtKK7nCWjm7we03C8HdBxURPg/wGq9YiFvsJY8z/Tk5k/27kpk7cfMDbg+B0LlEis
	wLQMEICqrJPmHh+2QIl8OoIwfgE0RzPaUOROecVTRLXKeM1hHjHyzEoYXWFzLNvwWHV53eDgJnP
	sABHwnepa9HKtw7zg7VP1VCvGhv8Cpyt6O4C+sp1PyXRUJ4uRh8Bi/BnW7ek18G5uYq7K9IPuXa
	Z80Wu0MYqnZh6DxQ==
X-Received: by 2002:a05:622a:2510:b0:51c:1241:3b09 with SMTP id d75a77b69052e-52d5868a30amr30207681cf.39.1786457428796;
        Tue, 11 Aug 2026 07:10:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2510:b0:51c:1241:3b09 with SMTP id d75a77b69052e-52d5868a30amr30206991cf.39.1786457428388;
        Tue, 11 Aug 2026 07:10:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486c0b96sm326174e87.17.2026.08.11.07.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:10:25 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:10:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, broonie@kernel.org,
        jishnu.prakash@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] thermal/drivers/qcom: Fix missing spmi adc tm5 gen3 file
Message-ID: <sf725msufnhfdecl3ovz2grdg4k3xfudbzcjqzrw355utpq2cw@mcuxwm7k2y3r>
References: <20260811094544.2939556-1-daniel.lezcano@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811094544.2939556-1-daniel.lezcano@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX1sYP04smrjtt
 LOUfaZ/G+NkG/C6/MgDN+X3ApdK8sFYOQifgoWa7oNl1MRg4LfvkFnXqbDJyAAalRbAeuG0+kTG
 ecm9dQ9B/N0uScZuiFnux8Tb/x2fYQ6fe/z8TK5oC8J0P4NPCAXWInHkOxr6avshk66D/KfYHQ6
 r8oRM7WRKxuZbPODDWdYPAuV164WjCo1rNvP8TkBVW8XiMofCc81rgGKw1MKJGrnrJBa5pGtEUp
 5P7MwsmDF1++3HO5fnJdffiXejV0IUak/an+31+Oo52lEbqI2Rwmd/Wea8unCG7YVnmMngpDoZy
 siy+o4hHz431PjhyyAUxPXyRJaFoOD2nNnG/04mVQrgwupB8NeC9x8TIH+PLkfRsaAzIUbdP68E
 9l8V3Cone7DC7H5JDz+edqekszTiUHQRvGdL+JwP9nvIxL4JmCj8SpFK4Ipqs3QLo36chG4QWef
 C0H8SUCAu/hLCE5mydg==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7b2d55 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QWH7kgmwNTCCleJi9_AA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX6s2yTdqpZW/X
 jxUqYpARVzdDssnjfomq0yVUnk5aQAT9mt+b8Vz9uAxR83tg0IDhgDTCxo89YO5VT6HIutmyq6V
 +dpAH/coZNDt+yrlm6w14stAZ0Yv4uc=
X-Proofpoint-GUID: XnUWaUBlv3aa6vqWdjcAHZbBPNv2eDxh
X-Proofpoint-ORIG-GUID: XnUWaUBlv3aa6vqWdjcAHZbBPNv2eDxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110118

On Tue, Aug 11, 2026 at 11:45:43AM +0200, Daniel Lezcano wrote:
> From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Add missing file resulting from a manual application of the change
> below after fixing a conflict in the Makefile.
> 
> Fixes: 948ee3a74f35 ("add support for PMIC5 Gen3 ADC thermal monitoring")
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Don't you need at least the SoB of the original author?

> ---
>  drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 434 ++++++++++++++++++
>  1 file changed, 434 insertions(+)
>  create mode 100644 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> 


-- 
With best wishes
Dmitry
