Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793363766;
	b=KXjct4DC+wd55Sv24ZB7jbqh9ATXaCIYCgel0JzVikBp8T/CTbUV+I8XZ7wugfyZiSsk
	 1+am0OZ4Kj0ZIFDldFPFn3WOgPJmB5URlZbET12tPhpEfSq2m4leTqyot7HKJ0sleJiJU
	 WwRRlo3O8153jXkBymaJsdxV3uFphuOXRlA69G7/XUxx39fq3m32xDOj2+zCe0gUVHPwy
	 f22xcrOpm4mH+yq+UF5l7CazLNQ5+sCwNw3MspIqSpnKIaAsziSKgHAJqMYftWD3Rqa8h
	 OiqJaTQim6xrcbht6haBerXKIIkMug7T+BS53bvsX1LaNAqGElrQ6hlNa3V8QY1QBHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
	b=SJasyIgScyym79AB32iTcmYaSXBSldy/fHdyhj+nPWePpbGw2mZ4SKbuQGPU/1TfkXIX
	 f/EEYMD9IwUotznIZDT9OS0Tyk3o8o7RZ8eSeRc0liE0vqvC0L52mjgXoUmGrfWQxUp0e
	 F3GPwR+2DAy3yKH1jFrDIOEiDN5rNpkcRi56WO6LnYRCyywTjG9XWRQtLktVK2AQkCggt
	 96HDTm/4Vq1QO5xXOI5Tay0VHb6LnQu36uAJflMSM9AsgYBliRz1oxR3e12iJfNj7RIAy
	 DmtyPb/mVDs6KQyuZ6r+ukNwZKR8HFR7ukWC/jR2aG47hCTCcr9urByEHsw2/odqSbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3IE4qwQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIVHSkLm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B4E606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3IE4qwQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIVHSkLm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG3xu3142124
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=; b=e3
	IE4qwQOFgqK0bbRwjOQxAeUpHNDVsU5XPnIuBzxao7roUq7aP0qACrqYYEVkp5zG
	5oBydsI7dWtfmDdsNKVJ/XGKezJ11vkTTn39WTOWlRHhWm7XQ8U9O2seE4HDrPBc
	DEv6nU5H26xRc2yeFh2BfA7Mcv8yOzRNBRQR5yYqnWo0kZHGUQ/+JkU7xqUL+5m4
	Aj9VCtCaFuyFrHEZbPmTrPz5nJsZ/plqhFvb+pccGa5pJYSRrMwK3UMt7cH1a3ZK
	zSnTShpr58u6PKFXAWaz8ZZf4tJUfxIYGD44MirKKJCFnHtvV2H8k5ZzNQZjtU04
	YYA6jaOZIxkcMdNblQsQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk0qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:36:04 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4574f1cac98so681369fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793363764; cv=none;
        d=google.com; s=arc-20260327;
        b=K3qcBrlLePI7hOjU5IVWcmxY1cJRI5eFvbOK2HmshHDorKNegYezWHVD48GP46abp+
         wlgQpjz+yCZUzH3V8pm5sKiP9oBJvNVB8kMHlL1Ahc/WgA/N3zIAdaQOuKfHLSAcvsiy
         fthdKnBk+dBK2ci0865gZrg8SeM4KCH/RvOTYC8jmgTe/z1WOzMmsx3q4nI9pVX7F5hq
         H3tX1mN4Etb5x6Rxa3sgJ7iXEEctGPNqXcuAS8J/lHj1JhcasZ/3FLAnnG6ITMwdNYVl
         aecJJlacMMTM1a0NdxOsz7qfvNOrHjzr6d1meH4+HgUBDxI8IL2iGrB+2KPYlGNtzKpt
         7gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
        fh=Q2PN3o3I8K/2cZlLuGpeqC8YTMIqjEr6Y+CcFesweVU=;
        b=Fn5cUB74rSSGUeqEJTKBWrraiX//b2qsVvYuYI4fHx4TBkCkHf/eixW22Ll4pxN/v4
         w5e4j/eRTUERNGRhctzJydFoY6H4tV/GyF/xA8n3PL3q/VXGcBW7V0Rb9D9hTwAea8+H
         EHdGrc0xTIrCf4un1zvsVB/73KmQ0JpG//Nc2KJZUNIuznubW6s2FS74deeTu70e7O+k
         kAGFQwWXj9gtOX+avKyU6KraLX0hIloVWDAf9p8wE+2yJ9sFVT8r2W9M9fVwCViPkSvR
         6WRFzjsZuQIxEGTIYtmmwhozThLOfANxmewh3eD0Ee5lJTPFPf/TU39v74b36gObvFJo
         lzjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363764; x=1793968564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
        b=JIVHSkLmdFHFvLL4PwNnBjMznwcrJoOOUUsqLDTtB1uB5P+rJKsP6Uj1I2La2aSkWE
         +6n6jrHaocIPmz+dDJOkLGo6kEFDlwBN5OK6npvsV8Kezitryu9Hv58Y1S5jRvo1KPXW
         W7xwHbM9GdRoo0KvWrfGCI09FEAiq6WnNTq9UmDAmLXvD+4MKSPAtDRqxrsXLsNVb1Dj
         I3yYMwPmAPda1+4+P/ro1tXtOJlyYfGA7HDfu9KDVGIIfRRzOiuPuvKNcqjJrvAQ8K0H
         UJnjv8ntou9UdAjE8eMlS/aB7WJz1qJe06tToYmbZFNpeMPoYB0uL3u85IsvwqZFHubV
         KYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363764; x=1793968564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
        b=EsiXLaTlk7Dsc4CxOnzoZr/CFVvMvXuHvwKM/2c+gXRQCOlhCuH0q/CjNRzyv9PC75
         A8lwYF6vU1qsyViy9kzhQCfSxD6eci1fA2EeGqO+M9oXBZa9uozQjffhoTUuYNK4XLPg
         RywIwxQhRHgIPQO3qWQSvdMgnrNAxdgGtqJg8N13c0s0ZyysBd/SZYS585RtZTpBY2kM
         41Moz4qpVxleYgQl7Yg3Xeu3XfJl7KItH2M5mP+LIBxtGxt59Ejaz75IKHJj+mUBk4Vv
         Eh/kAOxF/K1X2yot3KtJ9i+2M5ASKXzH/1HcSPPR+7SFls599vd8tzRfXhfKj1eHX12i
         4jRA==
X-Forwarded-Encrypted: i=1; AKwUvByOvzpirIF0UNuSF9JoEui6MBIFpwQCwN3SREX2IeVS5jTHssZuJBspswNyVJGwF+mSugE67BwqT4c8EOXe@vger.kernel.org
X-Gm-Message-State: AFq9FYJYg0A72GLY/NQGjbw0wjrzL7FtVvcLUEWO2vbuxbGQrvMLcG43
	L15dbydscULKCM2Aoghart25KiE4skzMl4zUFEgTymkCiJLr4VhIiCRJ6YYU6IIk7CrIvkydglf
	OwQwPTfdTax25aFXeK9F7KFNgdPBA9q52ZWB8flgrtoRQcHplU3RGzLGf41Dqx6ZIncC9t65LDe
	bJBipfLC2TXQMq6a5J+CpDtxCXyWDUgh7isIBH3qcgYSQ=
X-Gm-Gg: AYBFou2LtznUFsSJDG0qHwVfL6hBQPawyL1dovwgLroWEMDR/AeB89GfyS897UDqITw
	yVnNF8bULlLat5kvjHEJgp4TgRjk8MEzHsW+pCqqGzyV3JsQ5QqvjO7BNGmPqYU124/c00I5Cza
	gJwVE+KJmNHPm3XXAMEbNS8TYEz2p1BU//LNVQwbrHKvHPONqPlZo9NezA9w==
X-Received: by 2002:a05:6870:a104:b0:475:e066:7714 with SMTP id 586e51a60fabf-4a9076f5d71mr1257356fac.27.1793363764165;
        Fri, 30 Oct 2026 05:36:04 -0700 (PDT)
X-Received: by 2002:a05:6870:a104:b0:475:e066:7714 with SMTP id
 586e51a60fabf-4a9076f5d71mr1257338fac.27.1793363763749; Fri, 30 Oct 2026
 05:36:03 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
 <20261029212344.346069-2-robin.clark@oss.qualcomm.com> <067b2a6f-9e16-4f8f-bec2-5ee2de10125e@oss.qualcomm.com>
In-Reply-To: <067b2a6f-9e16-4f8f-bec2-5ee2de10125e@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 05:35:52 -0700
X-Gm-Features: AclHuK_Kxv6J1o1Nk4jiUTeYgcQUlfsMkvo2Oyu2LlP58eHKHYlhfwHqpLn5bVY
Message-ID: <CACSVV00wrjhBHtKE6iJ=yvdPVaZ0RreJm27JQ9KaKy50-FSA1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/qcom: Use identity domain for GPU and display
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: v58uEs6odRlxk_58DiXXaSlOKJ6DD6xi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX/10XiSVyPyF8
 C/1+PPuYxtogSk1gDQJqvSEYOmkva+t3KjurcKbMq7FZrBfOuu0Ppc5s4h7x5+MUmUIJ4pKs3ie
 AC0Km/gCAf3n6HiQfRXb/x57Vo3HOJM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX9XFWMAPhGDk4
 UJ25M2ugfkGhvYL/E15j40/2+QPsWTbDOypibZ6if6ToGocPl/Jjb/zgLshuHK+LdPi1LQFcOxm
 B9O1jdbMzuJh+rm5NNmk7Xu4usAjzGyaP73W6eT+3Vwr7zDM0c0TD9CiNm8s7zMFxUfLCEoAOfy
 YBT2XkE4oERCaTn9SF/vo3L+3w9caQd55F1gW3mtRjcjBvEXeCId4AQM3nW+BCWdm8N0BJ9smHM
 e7IHNLtqMaUZ7tUyu5NOCBkvkImgh+dJAPu6ohyOJYDbmw4KGFQmEiYSmYV0Levabc6CpYdEv3q
 8vWGXn4ocPQ1Bj7hZ3QjUhQjOd/+8/HZRCQ0Z7w69lsXSxWAsIrUkntWVW0B+ihPrQivt8zy95t
 FqqyiOxBibfPAcQW9hRs2JfLy96PM3jfVI6ID9/FPyDBFTh8HxOm37DGVzhidLuUMj7DXZ2G8x7
 fjedobDLvwhAbzt2kEg==
X-Proofpoint-ORIG-GUID: v58uEs6odRlxk_58DiXXaSlOKJ6DD6xi
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae48f34 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=RaxNTMYahNmlKwi_CG8A:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300050

On Fri, Oct 30, 2026 at 1:35=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/29/26 10:23 PM, Rob Clark wrote:
> > Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices t=
o
> > select direct mapping") for arm-smmu-qcom, match GPU and display compat
> > strings to pick identity domain time.
> >
> > The drm/msm driver attaches it's own domain, which it manages directly,
> > so we don't want an iommu managed domain interfering.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> fwiw I'm not sure we have any devices with this driver and mdp4
> but anyway

probably true of arm-smmu-qcom as well ;-)

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
