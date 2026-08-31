Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C0E3769F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203791; cv=none; b=VLeocl3EbXif0WrbM9Vz2WGljRciWbMhJiFQvYrj7FKFD7oswqI6pnVf513eM/8332trlnF+WBKVqsR3Asnhd9ndTMmKRkzHniT6DzHLZxgZ7zF4NPzLzmHwivqLbeo2SFMUsb3dC8kFSQGIz2YCDcWBhQANJ5emxZ4z0H5/ArY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203791; c=relaxed/simple;
	bh=+2ZbtuUMWVCvFIdHYaupERfsGGjfhSJYa8vkKnBMUHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0O1BS2UtadzKo3d4niIc3SWOyUKlA9rP+7IVfVhJUIIrol57oJlDmaKoMh831053IqIh5g257n11N8nrbATY3HQ6YoOyrSFh5zfTOJcIScWd+wm1VtNxCqkLMPP18xmMw/pbhoGJwHg3Ypw+gweGACka3XOPKLWyUkchojr0TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOEKFAqw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJkjYS7W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOEKFAqw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJkjYS7W"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIxJ00736676
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 19:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XtunflAjjfEhiEFSwZiGBkHk
	w6VEPgFUeulyvG2pbGc=; b=fOEKFAqwD0zJ0quBtLLuXWuQwEUw/M5OjWlpeg+g
	8u9UNdXWziBvjkW6eQpAXSdeUcoxIAqkI8vijJm1Ih2xBQQHSVKqfycrpc1IYYec
	a3uVyR3WdYwTiiSAWygYOAHHffGkUs4b4Q10MXV/xNTvReUzKH6ZybydFzvL/Hh7
	V3Nq7pJu+/l3bcUJ8CpPD9ycVGyb2hyA+VQ/kmXQqkkGCDbNzu8ZvYzPVi/aO8qN
	/exVobxIZRVVbD4k+3pFIfUBlUf8sbwiVO2hWCyeKxqI7rWu0rS5TBuSw+ZezZ70
	Iu2kp5FIPDcCjoF9bWCJxFwhIdl+zOGhLusAyobxlE6PvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfch81un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 19:16:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so160978a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788203788; x=1788808588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtunflAjjfEhiEFSwZiGBkHkw6VEPgFUeulyvG2pbGc=;
        b=JJkjYS7Wfs61iWlFZglN40TMp4TZFBtpPi4t2sURfqRVYyNxA6nifqEcSLZIRzFdVl
         CL1V+UVQX1NOHA0VkfBsVdocBauB3k4shPg1C1/PqN6hAJElcWJOBQdG8EFjw0iKNkhr
         A/UfI1Kkl5e/XKlGn37lIhMNkcmzhoHVs5NiC+gBvNPMkIeze/qy5E0v90bfHX2ZiPmJ
         VeQW6X7th9xejQIetO5k3rYsOpoxDDEcLHf9jgmuIx+hW6iBfb5rlUsFhU12c17Kr2oU
         PvZpIqzrykXKUCW4NORfdusOlc1TUE29UF4HmyLL6qiz3FogcVncnnO5C96iDwTWNltK
         uHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203788; x=1788808588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtunflAjjfEhiEFSwZiGBkHkw6VEPgFUeulyvG2pbGc=;
        b=eWcd8SBpBxgEXyg24yA5OvbX2MdOzC9X+OCxrcRFzfyvdiAG/kb/BqtZU1PLGkkHJ+
         OiRIzuKdPtv4EaZ5COMyQVYS1sNXfm1BwBQgymQwMBr3OixKp8bugXtNqEkHBrLVqiQp
         wo5GOiDpn8pxPOEq2f0V/Bl+OQNEfyX5QbjfArcsi0ZZmX8C+/0Au17JFb7ZfIG6u1Oe
         lumOrPWrU9nFpDlLHfQVnsLOygfouRu9EppxMgzoyzGjTZNBf3erLNT6SZ6C1LCbFEkT
         lG/xpbmBdtLevVCMg8KQ9F8BiMlmnmZGq7xoVmGeGqkvHBaqYqLHIEFcF8DFkLO9IatF
         ZZxQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+Z6s+Q3W9IEoG1fvlPqoagV9vEnFZKpbHpu8G+VmWxHzUeOq2oJKrvLHIOt3XNsyTCJANnlmEDO5skHKz@vger.kernel.org
X-Gm-Message-State: AFuF++kc5phJxyWunav71DLA6rBt8F7hRrUSdEIvd/g8Iby/c/Cj773b
	jHqloZ8c8z2Wu51q3M3WMVlIpJVNS4KKeOilTKVScVyJW7OOCztQL7SNFTUehJAk+qTLdhR7bWm
	qkLj2Ei9//g0UxOnsI50RtuPjvVoaCP2SzHnHMwK3hTCzDWXR28XM6Lq53FwIkbNwc5BL
X-Gm-Gg: AYBFou0+T6o0LRLmFSbAiY5oIUQb0luc0JiVhWeMvOciqkahLScYMLJ7PmZMgIE3hxx
	8sVxouI+dGivWCgdXuHzhDRPYWnjUrpV43pkJ6Dte2K1/DqMIWN/O4pDFHfcTjd3Z3FQ7iP2oaV
	5wIot6PlXfPg0AT3hCBeHwa8bbL8n9mizrVjFfiUZKSZpNRwBmP5WpEpQTE3VPw2ph4s1bCjwX6
	nS8zXhZ0NaSMKhm4OlEjdIFn1WurBHvsTwPZUgc0JGNXQKZkpw3V6UNxsoOoMOICDb0mfY/vwp6
	LzD8ywQi5ncbyHRKDDVtlv4MlPk+6oeNoO4kSaZ3YLqr6DLgPjx8VwLqi5b6uJrRSTrV8T2xVQS
	aXXz1I65Yi98+uyzItt4hP7p6A6E=
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-396d0e71ad7mr40950157a91.7.1788203788059;
        Mon, 31 Aug 2026 12:16:28 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-396d0e71ad7mr40950081a91.7.1788203787364;
        Mon, 31 Aug 2026 12:16:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d40ac7sm29063703c88.7.2026.08.31.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:16:26 -0700 (PDT)
Date: Tue, 1 Sep 2026 00:46:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <20260831191621.ogqnsmvzv3o5mlbq@hu-mojha-hyd.qualcomm.com>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
 <apWhseqV8vdufajf@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apWhseqV8vdufajf@baldur>
X-Proofpoint-ORIG-GUID: nPrLCNEJcRbxUvwkOvndup9-t2dHp7-y
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a95d30d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HtCTlhq_qHtLlGlR9k0A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: nPrLCNEJcRbxUvwkOvndup9-t2dHp7-y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE2NyBTYWx0ZWRfXzxY83N8gLNHT
 fcN5SLIWqS3aZczdCjzILWq10jdlW9hh3vP23cDoMQ6yOhTSrj/QvPfFgHHv481UXJDWMquLPAR
 S+zXZKgV4A/VVvGVZ/zzr53qaPeqlsI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE2NyBTYWx0ZWRfX9adbumedshxq
 y7eYCztzmrk8gIzY/Ty7iwWcfcWWtvrETBItYmL+08R1axu0jyN/mILUmdehfn7mIlFiQiGISYo
 o1ZyVr9tidSAkr7ScwELh8fAdEr7G8Ue9zyYteaPPpXsugUHGH0WLoulz7yHi0n/xY/qJxavKxP
 bs2KQqC4C8tZokjny8dQX94Y6N0lYt+x6txDybkidMcR5i7NdsZ77kNYHJqv4T5q4wsEe7NxAwL
 SVXltRWR1NagkHsW/wvGKzY/pmSaLaQlw9HLSYO6yVvZYjo++g8nXwa+5RUWtyYNNlLxGkIaI4e
 yANtBFYB+V1lRDDqcLEcQrv4QAHjcdXw3ZS/vt1rVW4frE/WU9qmMAw9CoUsIQIjX96ccmS+s+x
 72RBHJF+LN3WkSNOcS1i+JVuG6Bs6xrf0M8Py4EUoZvMoiKX5p4aAUggiHJ7M9G1nxI0Dco8UU/
 wrE1T6joatibOrl/8JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310167

On Mon, Aug 31, 2026 at 10:56:55AM -0500, Bjorn Andersson wrote:
> On Fri, Aug 28, 2026 at 11:43:11PM +0530, Mukesh Ojha wrote:
> > The proxy power domain enable path currently requests INT_MAX performance
> > state for every proxy PD.  While this serves as a "take highest available"
> > hint, some SoCs require specific per-domain RPMH levels for correct
> > operation during firmware load rather than a blanket maximum.
> > 
> > Introduce a proxy_pd_performance_states array in qcom_pas_data to allow
> > each proxy PD to declare its required RPMH performance level explicitly.
> > Platforms that do not populate this field retain the existing INT_MAX
> > behaviour.
> > 
> 
> Is it possible to encode this using an optional opp-table instead of
> filling the driver with such details? (This is a question, not a direct
> suggestion)

Technically yes, via required-opps, each proxy PD would need its own
opp-table and the remoteproc node would reference specific OPP entries via
phandles. That is heavyweight machinery for three scalar values used only
during the transient firmware-load window. But let me know if you see the
benefit.

> 
> > Also propagate the return value of dev_pm_genpd_set_performance_state()
> > and emit a warning on failure rather than silently ignoring it.
> 
> Also remember that whenever you start a paragraph in a commit message
> with the word "also"; it's probably a good sign that it would be better
> to have a separate commit.

Agreed. The dev_pm_genpd_set_performance_state() error propagation fix should
be a separate commit.
> 
> > 
> > Add Hawi CDSP remoteproc support using this infrastructure with the
> > following proxy PD performance states:
> 
> That is quite weird, because you already stated that we added Hawi CDSP
> support in
> https://lore.kernel.org/r/20260427190614.3679937-2-mukesh.ojha@oss.qualcomm.com
> 
> 
> Note that the line:
> 
>   compatible = "qcom,hawi-cdsp-pas", "qcom,sm8550-cdsp-pas";
> 
> is supposed to tell an OS that "if you have an implementation for
> qcom,hawi-cdsp-pas use that, if not you can use the implementation for
> qcom,sm8550-cdsp-pas".

Yes, the April series added qcom,hawi-cdsp-pas in DT as a fallback to
qcom,sm8550-cdsp-pas. The NSP proxy PD requirement was discovered recently
and I realize you are right. I initially thought nothing was changing
between the HW description but the performance states, but I see from the
point of view of someone who has the latest firmware or DT and is still
running an older OS, it can result in a crash, which is broken.

> 
> This patch tells me that you need to also fix the binding to not say
> that - because hawi-cdsp is no longer compatible with sm8550-cdsp.
> 
> I'm guessing that this issue might have been a late discovery, state
> that in your commit message changing the binding.

I will add a binding patch to v2 that removes qcom,hawi-cdsp-pas from the
sm8550-cdsp-pas fallback list and makes it a standalone compatible, with a
commit message that explains this was a late discovery. The DTS will be
updated to drop the qcom,sm8550-cdsp-pas fallback string.

> 
> > 
> >   CX:  RPMH_REGULATOR_LEVEL_TURBO
> >   MXC: RPMH_REGULATOR_LEVEL_TURBO
> >   NSP: RPMH_REGULATOR_LEVEL_NOM
> 
> I'm guessing that what you describe above about INT_MAX being a problem
> is only for NSP? Would be nice to not having to guess though.

Yes, for NSP only. Will be explicit here.

-Mukesh
