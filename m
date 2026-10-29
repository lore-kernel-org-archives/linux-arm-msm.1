Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270608;
	b=qvr+CFb46KhzSjVMhTeFNwDGYxBNpl7/Q7Ft9FNt6UnVehYo49zVSld1+J0vjn9JdPL+
	 1fLvOxixJygQwZO8biZFJpOG3bRvO4OWZQswf87Odri0lZ4jGTvMAdLAtkQecDdmyVhYY
	 uzRDrJ0mEPlA3dEVhkJ2Jvqpl8/jzQq29eXbhnJZsIbUbutJtE3OsvlGEZMaZEvpCOgRq
	 nUaj0Rbck98Hq86swPqG9WWV6Qhs26kGZSIWNpkOmEvtNJ0/gPWLiMmHU0/taU9h7hCOt
	 x0RoJhBdjRirE0YLoqv29ae5uQhSR4wtT6qEK3LVQSgVutD7GNkpDk8bdu8QpEVJB0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y6WNrmdR+qBzj3ocAxUNbvb7Lt0bfINfWJjQ7rs8xIY=;
	b=eBP767ENjD5582e0qe554vsP2XBy77a57kyOqMyeLiaO7h+NsRIQWk3K859jgHDuWx/j
	 mEm78ACtL3ApXT/43HCHNM3vnvDN1wlVLU1GtE3YDvq/8LFcR7Yxotji8BZRVCG2qRG+z
	 v2Z4EWmS1AfqGkoNlvVXh/cXXDk5tkKxgfWyGb8Et05kyJxAV6iUXMcHdhZ50yOI9GcJr
	 xM62jgdZRMsrzRMnAgE48ozp9rLO5vwedqFxTqC1CkW58MEah6u8E5dZTOpePaQMkl61w
	 i6sXy+Y3oBMawVraB8PopzRgn1e5JQevf4khEWuNjqxB7VN6FU4wdStCwle0/qT/yNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h/BRBNLb";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AplC34Jw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7EC606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A7EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h/BRBNLb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AplC34Jw
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8v9wQ2725086
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6WNrmdR+qBzj3ocAxUNbvb7Lt0bfINfWJjQ7rs8xIY=; b=h/BRBNLbC0ngHngS
	V3CFW1Y07dHhsDmDVDTI6zlP6Vkdq94BaYvXMxabOe+uXBoJxrPwurSRIRAe27Pk
	5c3YlIpfjIsOgIj8sVjj7kd202XmY0mirDM1wyuOUsdm8kAGOgBL/XXEg5I8z56Q
	447cx2VlxHKe5XjFM4sSHUkgotaSKvv5+H2dKGjjlbyawc5qm8wkwrcjMjRdGa9v
	6bi8DG2YqqF5FT1GSUTqv0Kqolp8QjN4RMd3Ealh0YGy+jQM7eAV5vOQJXJm00fG
	Nbuj6HcVaVX7g9ER5ruxTWU59ZmW2nmTq9umldq3kydhj2YHw/qGiaRfgI4meiAn
	UNYFHg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s9a1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:43:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89f84753b43so1585997b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793270605; x=1793875405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6WNrmdR+qBzj3ocAxUNbvb7Lt0bfINfWJjQ7rs8xIY=;
        b=AplC34JwAuer5ozFCixYk07836ITEJKCJ/4lDtlQvYZ7IYu7JInb24lyhqHQnlgn5f
         HcOG2pGQGURL66AQwkr2FA46rzO3abB2la1PGKpG42BgvNgHNTDz/WtxviqEfxpjBmv9
         M84aEsIk79s6S6hzZjpTQpA4FR1bdaCbg5Uq2D/f7wwiuOTNL2Jlb/it2ggszIb3RGW4
         2V0KfnLcP5s912crOVsUSb4isBuyurZ8G3W2wL8ztSIokXVLCF0W+yleCaXKE+lUNog3
         BmKMqSoCtE5a8rHpid00FflPR33LOcGvY+oVkGZWYPk4vM/wDexUTheXRgT3GYIT8Sso
         uINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270605; x=1793875405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6WNrmdR+qBzj3ocAxUNbvb7Lt0bfINfWJjQ7rs8xIY=;
        b=gdtyKpTtH0UcM28YXlQtUpZxGAIUxowJa34pFgAVEQUjxp3o0Mte/tSgqlXMvI82CK
         +TFJojD49y1PKjzxRs0WDgraA+cyRMMaBjHSkAPe16bUnTaLHgRsI9ZeTsX3FB064wGs
         NgHNCIIngwVn0WXpPZZiygoIlKZ7CttMVnvLx36PexEZUQfo1XrcMCqoGVrFaVffSwz8
         whWJTKdVYSyqws1eo7yBaQQ/0f/VUYh9zS/qtxx77P45ubA9N8dQUUpFvbDLRGB3mr02
         MtlqVgcDBMf2gaJ6FgHd6lrtuoRZmLZY6Mb5uXOKFzBHkzRdL2dn5pWPICp0A2qlBwBl
         lLXA==
X-Gm-Message-State: AFq9FYILxWzHFx7Y6jRVxtUQP992+dqyklH7kJm+z8yiEkCadSS703Q4
	ARApnVqtOkoMSkv7sJF6TC9QR6049jvlIHWfTIalj20eSZUd/wJm9oCwSbUL/c61kskkklIaC8W
	Lmw/RUfN7z939HHnV62M/Rc0eHING4hSgmL7RDgY/iPtcJ4c43J56DFnaXgxHeDks/TeJqD8AB/
	IP
X-Gm-Gg: AYBFou3u5lGtGuA9ETQrH8iJzrwA7TuIx/xc76Ulx/+XqRUH8pACdKZi7WkMSwNkDJV
	72GR47PNAhLI7e9tYOkjequQ14LlCzg4TwOkmlw7s4wrHzdp8uPCrKZ7HkeM2zFODcm8QDYi2+N
	M3nBmxYWIjgtCf4Q+r85v47ZCZ6+OflGE8F+2NxmyvWktPvRTanwxHhCeIFlyPQm0L8fVpoQ+7E
	+o+rIbNZuBVzkvbsLOLOUgA9GPGasEnZH2F27GqnBfrVBM2jwgQJilBbV2H46zcQuuHfgrl8mgz
	2gwGY9UoI1zAlmG9anUQjhTrFJYkL6Ep+WdYwcl2+GkJqztrxU2L8RFrrbnt88nV2+/iZbw0END
	gu1Zz6A6RMndff3I9SGGpIcP8l0AADac5YRWsCD9R2aVEyKeVZbVsFr+wE7XOUXtGgeaLkjo8F4
	Iw7zfd48AHYe29wKmFQqpbnu01Ep5807yEUz2wNGdasMuemet+1/p99gb5zpdJakVn2A==
X-Received: by 2002:a05:6a21:3b8e:b0:3e2:4a46:7ea1 with SMTP id adf61e73a8af0-3e902421aaamr4111696637.66.1793270605326;
        Thu, 29 Oct 2026 03:43:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:3b8e:b0:3e2:4a46:7ea1 with SMTP id adf61e73a8af0-3e902421aaamr4111677637.66.1793270604816;
        Thu, 29 Oct 2026 03:43:24 -0700 (PDT)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc20fe8sm5388118a12.5.2026.10.29.03.43.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:43:24 -0700 (PDT)
Message-ID: <af31338e-cd15-405e-9b68-e63f1f61dcd3@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:13:22 +0530
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
Subject: Re: [PATCH 0/3] Commonize Glymur regulator settings for fixed rails
To: linux-arm-msm@vger.kernel.org
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MSBTYWx0ZWRfXwAB3ZB06k7SD
 HUM9iUAknsyb+R7smBb/cnVeT3V7nl6ueJEiPdJrKsw9HzF0c+/01oMV/n6GLySZUyjQSVnX2Ol
 9wSuGFHl66cg887MxbRfTfII19U04mjd3NSe3yCsrw9brF4gK1gZG1+YuRBswqpPPTTZlqHcf1T
 Ljqzcrm0rRygSGuU8Qr/n32wwQS3BCIJaIeI/5tOGqUBdpQQPCLxwuulP9VInieZ8NfWqHonW4I
 Qtv5HSvttmzAVt2kR8Rp8GhYOA8dPwCfXK5w0E2ngIto3uTL+JkKc8UBUrUyoDuRuT47CsZYIMS
 erOhXQQm2FT5CxH22FylvAp96k7WH0kJvis3+15YMRl4cbj5KlUiC/fs0LHGki63PiCBio5f3ta
 4M/K2M56SnOedv3xc0rPTyThBKDB0wxsisy5VBV14jO0oZ+hSXVDdYlNRS3bLf8oPti8t11VBxW
 qtH1mUpIbk4d/K8jKFQ==
X-Proofpoint-ORIG-GUID: Gy15dx5N9VYuCGwOdoM6xTIYbDpoU4lJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MSBTYWx0ZWRfX4jQO9jQIxniM
 wAKm+uz82h7no+iH19d92+3SUdWBIYN6tC4/6DEKL8BhGqIXf7BXdxtuW7JqDd+tmKzbKSyxF0g
 sOOE9TzkVQ1SOI2+MX69cLsGNZlsy7U=
X-Proofpoint-GUID: Gy15dx5N9VYuCGwOdoM6xTIYbDpoU4lJ
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae3234e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xj8uVBqlC3ZOy58p0xMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290041

On 10/29/2026 1:34 AM, Konrad Dybcio wrote:
> Certain rails are predefined and will ALWAYS have to be the same for a
> given PMIC configuration (due to electrical and other requirements).
> Factor these out to remove a layer of pain when creating DTs and let
> one have a better way to reason about the settings across the platform.
> 
> Glymur-SiP will be the next target after/if this is accepted
> 
> Compile-tested only
> 

It fails on latest next tag - next-20261028
PCIe doesn't comeup on Glymur CRD(glymur-crd.dts), seeing multiple
deferred probe pending: platform: wait for supplier for a lot of rsc
regulators and other clock controllers.

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       arm64: dts: qcom: Unify Glymur/Mahua regulator handles
>       arm64: dts: qcom: Consolidate Glymur CoB power grid
>       arm64: dts: qcom: glymur-crd: Drop L4F0
> 
>  .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 235 +-----------
>  .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 232 ++++++------
>  arch/arm64/boot/dts/qcom/glymur-cob.dtsi           | 310 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/glymur-crd.dts            |  29 +-
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 395 +++++---------------
>  .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 224 +----------
>  .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 333 +++--------------
>  arch/arm64/boot/dts/qcom/glymur-qcb.dts            | 330 +++--------------
>  arch/arm64/boot/dts/qcom/mahua-crd.dts             |  29 +-
>  .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 408 ++++-----------------
>  arch/arm64/boot/dts/qcom/mahua.dtsi                |   2 +-
>  11 files changed, 740 insertions(+), 1787 deletions(-)
> ---
> base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
> change-id: 20261028-topic-sip_cob-65df3325ed28
> 
> Best regards,
> --  
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 

