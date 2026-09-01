Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF01444062F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277590; cv=pass; b=O5yg3k1nXBmh/mX+mXunksY0zniIP4/f6m3u33kMRBZo08c0z/wRUUnrbyC9HG/1Rlaj/0tnHROe6lEtCVG3C6U4ogOV+cvNFabQj6w05swTr2BtewQLPLlY8XG2StSofsUTUG3fi4lUE9IuEkKouvfZYn/cW4DzU01x1o3vMew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277590; c=relaxed/simple;
	bh=2hiFglIyELsVUiYPyeBzEQYmuk8ezgG0ZJ820CL46r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcLFsGmTHLRO0dJF/CYq+u0Lbwfx/dbTJGUn9En11e6/H97qLaAjj6tV6+z83DfX2TuroAR6PrMuHtrVECEi1Cm6KMVmsNlpW0fTObCh8Y5ZTTc/QRMHvPjh4Yyp2JDv7NP/5ISLgaRPB13oDfaxKEu7JkBrNW/N2xgwXKtgRqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt5M0ggt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mc8G43FP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt5M0ggt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mc8G43FP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8awB2270396
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 15:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=; b=Bt5M0ggtxbG89sc+
	BirZoRkIMnGGCvu9cLn8DtXIJcsb4LpkHvHlb8fzIUERmgLg/QNZAbGchT/zBlta
	PrSTgamXN8kbQDu0MY00sHlSx9ejf1v1y7jUjEW4ks5UEZ2CVPglweqDJ6Ep8bta
	HZjX/gZA7COIc28EA/LeazfE0kAWNDftfjmc5qy8Hah/K2VHHg3Z/yporOq1cPa4
	8+WeM2u6qBRbjQvFUspS7xo+wQ6k+Sl5AeuVKwKAyC8Eclm6W1yzoepIgnUxYJon
	LLMaEhbhKh3SNPn7K/D/Hs+OnBBqZsp7TqsUvK3Zy5a/Th6ctxBxN0kUcZqIfhLU
	fCD67w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx444s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 15:46:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso9661a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277587; cv=none;
        d=google.com; s=arc-20260327;
        b=WneDPHpY5sJ5fTushUEYl8PyKvFsnKgjRModDa1VjO/HwL5to133HIL1UcE5pJfEH6
         c4Yag65L7q6pNbpNonbBrFoaGnkEzmHyGibdXkujGDhYV5U4vTXUtvLP/maFanNnKL+C
         cNAMXI9+CHCW5ksSOxCjjNXweNHmfF1uAc2Z53euQ/lUJScA4pBuek6/bFzMbcWygjZM
         5sIts7Wa+9D+31ddWNYuA8Gt3oAyvkql044VcX3nZjwZfG+skeU9VCDcWvST/WUQl/pB
         37Cvh7CInzI+m9RISTU3kcIviRT8DXw/oiwfSxrbeMzeFXeIZacARN6VR4IbdQ5PeRXf
         m2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        fh=ypvi/D6D08rQZzMjxbuR+HSVOV2Wzbq8i47OH6geKdQ=;
        b=mPX0NFz6ghyAouazL1kAkWnMU7m7pM1BxqXCfiqYFDxI5N78eflpPoU/GEoK59JJCS
         oi4AZ7ym9aTBxaWdoG6UHTYuNwBciWrhfLLAYZHM9jhc3YyOo/NWndCG96Nle2HQUj35
         IwwtZLBo4n+ajZPgNra0/IFx+MATi26P9bogudHcUctMijL2u14F5hprjIl64NIokgpu
         ENvjzWlxks49QRY9lHK4T6T961UUVBlOnYhLc+saTZbOyk3YLd4AfdEghCA0gr/OBWjU
         a9Ez63CeQTEDvvgdL3R5BBmLpWoLUKJ/Fsoj+86yrxJSnU+mQIUwLVkYzHkDNMikfIUb
         PobA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277587; x=1788882387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        b=Mc8G43FP4LGrtYT3+YtNrSlh4wylYrOYZGb4BZcrKVa/vt2zZPhysJW9zgr2lVmCBI
         Hu/XLkB0dJjFSMsEKWpc00o+1H2lKEhvegd3QIOMn1aHFe3rYyw6Ngu94YLOYOeRTIKU
         mSyzINRcfHZiHksJov9d4VBU55yO7itgqeWThcO/JlP+kQZHMqT1Q+/xpopyWxVfboLY
         iBhKTnylozXCCvbaYUTD9QXLSlDSSwiTU5YVnJnqYeeeD1aPxlQa+tv1KbYaQbuerbpe
         fCYJ+x+4ty1LhZtH4qCXn2MmJAQUvnjUdflXbwEyoUq7o9uQcSWEqnRqa3Ia/oOPOSkH
         By+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277587; x=1788882387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FeaQdHnyQUVUR9qe3Nys8gzsKwJQV3ZOdTi7d9wCiuI=;
        b=KBT2b+p7LGkLv8uddmh0gLZ9jVKdMJ7dTnTTyTsCQetLLlwHRgtgB7XtX/jFAEy62n
         SCkENNz6LiYZBSnSV1bKznGO37SqJOMu7ycFaYciTj7/aNVcxTX1CgiFOFnQLfN7y6rk
         BXAB4Rt8k+q83mAhr6QhtZ6xXenos+C9ksNerDFAFbVMUpz1G5/ouJk7bj+Kw4OLkXtT
         eMUWPkVNLOIJax4aPLUxxUfhh5Ievb+/B4wxTAMARepTpfqEkL+pXKoJszGL0KkoFTTt
         tMnaWURmGUNNzwYGONyKlt3h2Xj0jrZoJp/DGD06ORXF1wKVr4yAPGtiHY7uuqoQgIHp
         v2+g==
X-Forwarded-Encrypted: i=1; AKwUvBzTK9ZohND0zQHBPVqjXCOawWfKOvCRnj+diRLK8JEmgZB4kXidJ65w3bVVv9ODQ3hAJd7uGUn+cIo+6rFH@vger.kernel.org
X-Gm-Message-State: AFuF++luouZFSTU8d6Br7MYF5tPlfFHkukZydePGUVDkSCvEAxBhV1hQ
	Ku9ZE6o/iysovY6fBIHqZd0jc4hnXQ0QM8UMcjdgB/v9/TsLikpGsvEgCYXUK0vIJimxv06ooxZ
	Vyk6lNZysbrbnasmghXpfYb7QyqQaRqSbF2XaMHipQ8tRqEhVDH4jv8lh+B51Y/J49iMQIJSF8K
	davNqeQhEltEdHx+JjXcuZldD7wz/bg7tv7J8UqVIj5Ko=
X-Gm-Gg: AYBFou325ZKEsompWNaKHqabnSODRdpHsDjOnDtIuojxHxZLElzMl1HXWJB52nixZtt
	Jxj2ZwX43Xob6GcXzgUXEIEyOnF1bUaeLlPqO7W59bxXFaM2OqsXMf1WtG3avHfWupO0sXbAsCX
	lCrg1/iNJNFYNEhkKhwgKj+lqC1yEcFjo69KydHRZUpfRvmrFa9r0T2Lbh1Q==
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr56207764a91.13.1788277587273;
        Tue, 01 Sep 2026 08:46:27 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id
 98e67ed59e1d1-396d0fccf78mr56207640a91.13.1788277586732; Tue, 01 Sep 2026
 08:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:46:15 +0200
X-Gm-Features: AcwNN1WvPfOmS-pECGpZIzaJnQAiHHylSoHG1ZWEkcxRplBgBJFHgfUmrIeCkM8
Message-ID: <CAPx+jO8XfaAJzjrO1uL5=0hadRLGtZsvVz7c-9P-+NBFwa-2Kg@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, abel.vesa@oss.qualcomm.com,
        taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96f353 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=Z-QAWnQ1IDuNMEsj6QcA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfXzxsSGOG4GKcj
 yZKTEP1yN4gJQ60M9Di48an7wvWxr4fZMtUPLNIO38Jf5XDQui0KkIh7+UK/8GCwYTQmAI3nlCo
 6eKgmin8msTR6a6tIWTqdi9B2Fpi994=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX4QbY0p1gEKDj
 v14p4cdhOADFbbFzO2cO5QtXEhOWOW8U4CuNQnov7QNtOhC5RlQj8FmfsdAvMffG+b4HdfiHYLa
 ruUekO7xTXyBkZ8VBQFRbgJc9FHiVv+j7l8+qyJ8CUw+3mT+/QLS8vhPMSC8+TP+V8Ux+GEraXz
 ABUSyOGk7cIlis4gR7DxmgUyCsZVCRCDDcceq/ekzyXkONFKMXhzDVRmqi7esrSN+1NtxnsHX3g
 zSk7mZowvLOXNiIXg+ZNSQdQQYnJ6Dik/622suYfVA4WD1UXNtIymJsyYc+hWn6VFiJzgu1gJHH
 rYaN/WwcavGeEj978ljFrZYuHe/HafnUbVdK3svEiV2hceQLZoCzSpimLF/pQe/IfRCLBdtOII9
 bfIOI39Joq8xCDhtpk0dxUxTg8PjMHWThemRYQc8LH4x3Coa+5rbOjloVI6P7wdHufkB+Np6Wai
 frLJ8QpYY3TotI3mPYQ==
X-Proofpoint-GUID: ooRhHPpYbYLAyz_h15igIc459oTVNWiy
X-Proofpoint-ORIG-GUID: ooRhHPpYbYLAyz_h15igIc459oTVNWiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010139

On Tue, Sep 1, 2026 at 11:25=E2=80=AFAM Sreeshankar K <sreeshankar0910@gmai=
l.com> wrote:
>
> This patchset introduces foundational upstream support for the Qualcomm S=
M7250
> SoC (internally codenamed Lito).
>
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring =
an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex=
-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
>
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC=
,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memor=
y.
>
> Dependencies:
> This patchset depends on the following patch:
> > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
>   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzy=
sztof.kozlowski@oss.qualcomm.com/T/#t
>
> Changelog [v9]:
> > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver f=
or SM7250
>   Make all clk_init_data instances const across the driver.
>

[...]

Patch 7 and 8 applied for next, thanks!

Kind regards
Uffe
