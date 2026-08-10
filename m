Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A593AF646
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361353; cv=none; b=S9avlC1xSyAaBZYspXSGqfQuhLNU/hQTTBna4AWplELAx1SoTGEyijuB0YFvyhBZx9D9JiHa9X9xgTQtgg30V9k+WRInzgmg5nYB6UYxUHZ35HD2OJYzD8NzjAMshstCJcbQACMnY7HjzjRm8oPMKDsD4aVhOqnlQWFWYlljdh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361353; c=relaxed/simple;
	bh=P+cSSRXvzNv9ywbkiaiji1QehkPwo0WawB8Vtr8v4Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhCf5hxgvNSsLFombKz/IocdzG9lMdwI3h1e7OgPx6P1rglhPRzcKnLWV+WQ10PVajQ+0ua2pSNk11ZZWlHeIH2qObTX6OHmMj0mvZZyJlBXMBAiSnSdwX7lvP2oCfUSyOqjl6waNmTtsvpaYc8bdWbxw8OO7nUEXLTkGG952+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdMs2iTH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rw/+m25h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdMs2iTH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rw/+m25h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9RwEj872404
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=66vf1/j/yffpMkpZE7IG5N5/
	5iGkvuETwh2qPT7BKrw=; b=DdMs2iTH088ZazOLL3MAsvXrrv8ePhsyxsykaKGs
	2x8WBfmjCBBHcwBvgEZ0OyeULotkmS4qbAa3Taoz55r9SIBgKM3M+YAMVQ1FrDry
	D+P1drC1tjjmhCagMoDjepG4XNEMylt+Re+ncemdqG6J28s02NepVGOR/JTBV0KE
	gGljREpIcpvzYXgZqplZqaf+cAlPciFs7YgIx46J6Vu8w9AREuun8PDWaD8y+Cto
	ilHGNF2iZiWxfNmGXHz0JxgEAnu5g6NfNqtbXiiyoAqn+0ontKqFONYBtoy83GO0
	kvQAxQvOhZ7fjI9dOj77H8g/Tap8josOz/TuZghcGDT86w==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v596jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:29:09 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81ea59b5979so60243307b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786361348; x=1786966148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66vf1/j/yffpMkpZE7IG5N5/5iGkvuETwh2qPT7BKrw=;
        b=Rw/+m25h0PP2n1Kb6Ytyyk0+0g+oMx7eAb0GkIJBn+zcZGuCBPy3897m6CqgPAE2PO
         ZrESZqFvlQJyYAIicuA00s75eEstgQoKOS12eNNsGI/g3MSy6MGX0b8HnhR/RRt7g77U
         /LA2NLVl9vm/EAaJSKAAr3i1T/4Tpw8Cg3VAgp4qCW5AVoFUqjvwTQYC5boJmtMYc9SR
         Ol2Vb3bx4LyeFidMy0sxgRBGMpzfkfvz7sHF03tqHICuNsy6U1XktrZyzf4SmYhpl+YA
         rSjbX6A6KxEPFbu9o49vxHj5lEbQG8jZhdBool46HJyUlvGNaRaVfb9rm3FlsVsxKf7M
         LlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786361348; x=1786966148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66vf1/j/yffpMkpZE7IG5N5/5iGkvuETwh2qPT7BKrw=;
        b=YZECnwobFTgmlohBXucSq9Fj3nYqGl4cqh9FHDPO81Pg0ptmT5L3INHVSzLvv7ty3w
         XD3zXjaW5g6+rb64o7E05MWJHf6EDk/HPpPY28eowJR0XqfPUamSHEElfWYEE5+/xLFE
         EbIjlZJDe4leI7fCJLuiEk2TEBn1Ya40gQ5dguE0YQ8oZ5+SRlB2YwclAG6JK9s7Vrxk
         BEiwpymtgZ1eos58ihTeyuUXK/lxkW6ttvQL0DqaB1Rkwo53erM7swTiTbDSPCCPJ9ME
         p9fvyOfE+Q7pQuWWvbquGldokyCNfdQ4D8lGSDDwejTAVaRZsjgfLBVcbDoJaXRxm/aI
         yGog==
X-Forwarded-Encrypted: i=1; AHgh+Rrik5FtQPf0EFgBcSqAZ013gP6IA5MLP7fxSGgxcvwtzwlr+k+dAQpm9dxy6m6kFGeGlMYn6C7mmaUIw72b@vger.kernel.org
X-Gm-Message-State: AOJu0YzBCuYokBrSAir2B+bK5di5djow7Ne/IlFkbaB+7jIHoVRoRkX8
	GAQ0Q245h/chT/hmNpIiNQZUPCNRWd5XhOw+9R9xKI38gh8fu8bvCACfcFHqHO0hI775Shx2aYm
	auOku+kOAdXsZVW6ALF71kIZwXEfe6ZIBPpOyrJRonWxezbiaxRvuuDHl2OXgiCc0N3fF
X-Gm-Gg: AR+sD10Jg/L/OHs3sSrRk7mdT1ygeZBK/C7gDkT0D2jP3T4psFj/CN6px1e0m0l+VKm
	0OBUeQ2hOnDAQY5LUvYOPkCdS4DPrz2EuUyYTHveiNTsC9YBBjismCNT4/aH9iAuPg6GWpA+jAF
	nFXAcE6hC5F9hpeYt4aeA/TBwadI0GGmzVQq7lTDkoYsjrgwDBe6BMzHNfdDa381Hb6uBODf85x
	xA/AjqJnxebI1TwQ2+v0XyDDmDQ7OJb+1YGhjYlAgY32/iJmFsdLaKR33NViSHKrlEVPOpUHsLv
	HyGn+BsQmwITimCbug1KIVY9E4lHsCLqscC0svMC3+TTldvIXGFslJkpXZdonJKIi4lo4hJtKc6
	mgvW5T2wkyquYU3lQTIquuZPIv1iFApNYdG7b+Odb9ZI=
X-Received: by 2002:a05:690c:e3e8:b0:820:de0:6264 with SMTP id 00721157ae682-82d238d99d4mr3777827b3.0.1786361348566;
        Mon, 10 Aug 2026 04:29:08 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e8:b0:820:de0:6264 with SMTP id 00721157ae682-82d238d99d4mr3777587b3.0.1786361348055;
        Mon, 10 Aug 2026 04:29:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823efa07c0esm53606337b3.1.2026.08.10.04.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:29:07 -0700 (PDT)
Date: Mon, 10 Aug 2026 19:29:01 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: add HPASS ADSP cluster
 boot-order and SSR coupling
Message-ID: <anm1_dJl2QLmQcw4@QCOM-aGQu4IUr3Y>
References: <20260810110726.775084-1-shengchao.guo@oss.qualcomm.com>
 <20260810110726.775084-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810110726.775084-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfX8CnmCl0VYLeX
 Rj6WBS5opzk2J0vgPvtpwnnca8kR7R/KRvMPqmgdVxQ4LNHT+anYJ+IfF+3EMWZz2sCYZKhs48z
 f86aZu1D8k1BITYgL+HOvznhk+fcZT0=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79b605 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7UsneLLXRh_0qPm5NQwA:9 a=CjuIK1q_8ugA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: dPK-ecqRL6RHIYveCEAoYfSV_A1Fpa-L
X-Proofpoint-ORIG-GUID: dPK-ecqRL6RHIYveCEAoYfSV_A1Fpa-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfX7OCJHxcgw5G9
 ykbUnwTSbyNYQXsJ05YGFoBYzHcKnMleCrhleUqoxKSLbmyufVKzykJUk+pCzkKcmBnP/Nr5B9s
 2cmmRbz+z3sU/ksqJcsO2M19d278RMUvxpbjReuBoiU2lRtrk34B8obLeAKBVqXW6gD4uoUF11Q
 OcB4JNYAL0GYwyPpxoGILMReoqtrkC7Dzsf8zHCH0pixOBqHMKIcRDL4dqyK8862xf6pM/wtMXq
 tO/iSi+vNUjl5cYHaZDCuQV7BmZ8xJOSEg5FPQjU0+wPP+S4Dq/K5P9C0w72fDsymn/njpNascs
 5C9AoBVo4JYpCQf4lQyOxPZxjyc/MWPU52akiEvH8nz7jA8S8hTAnrDFPU54W4MME9Hfe9JzU0v
 Qd5iCWIsVK613S5rx1+LssTj1rPNYaZGiJxTWXB0SGPnXqAzaJYCd12+be+mILTyuODdiV2bNGs
 2bbNXHwFPtPy//c227Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100101

On Mon, Aug 10, 2026 at 07:07:21PM +0800, Shawn Guo wrote:
> Some Qualcomm SoCs (e.g. Nord's HPASS ADSP0/1/2) group multiple PAS
> instances that share clock/reset/NoC resources: one instance (the
> "root") must finish booting before its siblings can cold boot, and any
> member crashing, or being manually stopped on its own, must bring the
> whole group down and back up together - matching the downstream
> coupled-SSR ("MDF") group model, which never leaves the group in a
> partially up/down state and has no notion of restarting a single
> member alone.
> 
> Add a shared, kref-managed struct qcom_pas_cluster (mutex, members
> list, waitqueue, booted/restart_pending flags), looked up or created
> order-independently in qcom_pas_probe() keyed by the cluster root's
> device_node (works regardless of which member probes first), and torn
> down via kref_put() in qcom_pas_remove().
> 
> Non-root members now wait for the root to finish booting before their
> own qcom_pas_start()/qcom_pas_attach() proceeds (qcom_pas_wait_for_cluster_root()),
> and the root marks the cluster booted once it completes its own boot
> (qcom_pas_cluster_mark_booted()).
> 
> A new subdev callback, qcom_pas_cluster_stop(), fans a stop event on
> any one member out to every other member: a real crash is propagated
> via rproc_report_crash() so the whole cluster crashes and automatically
> recovers together, while a manual (non-crash) stop instead force-stops
> every other member via a deferred rproc_shutdown() (run from a
> dedicated work item, since calling it inline would race with the
> target's own concurrently running IRQ-driven state machine). A
> restart_pending latch ensures only the first member to observe the
> stop acts on the rest, and is cleared once the root reboots.
> 
> A manual start of a single non-root member is deliberately not turned
> into a whole-cluster boot: qcom_pas_wait_for_cluster_root() just waits
> out its timeout and fails if the root isn't already up, rejecting the
> solo start rather than force-booting the root on the caller's behalf.
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 271 +++++++++++++++++++++++++++++
>  1 file changed, 271 insertions(+)

Sorry! Please disregard this.

Shawn
