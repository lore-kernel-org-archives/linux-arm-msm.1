Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFE4562617
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874152; cv=none; b=Xm3pIB8cCL2S2Epk7cLfCZaEnK5Qp6vTuUIkZgi4SJQl+91+m/+kgTVDwfQekMTlu3ndk9K8LfgClAKOklqmKGPYQk85faN2xr7S+wv9apIrBE06BwB+s5shFJJzqWvIymYeQkNsliElaBb1WRCx3RDyDEFXO835bw1VNzWV8mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874152; c=relaxed/simple;
	bh=k5HCTeqFbMi57vKLkj2X7I2avf2P/QWPZAnpsRan1nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCHsSBm+epZ+N9EXoIiuZbCRPzBrtOQQhxhjwKMpgCPWNaElrnMCQVNlUpEnWkzSRwhBCwaGOI3VV+iYP1A4uCeclPN5KYOHwQd3NfhNT4m0AAO8CKzHRnrUxT2h+GTeen7XQa7f4omZi1JYHr623RJCm+PosgLN6D6vhCC9ScY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTivlwwr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LVk0e8TU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTivlwwr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LVk0e8TU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkjnS4162864
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 13:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LvFFq7I3YnVJDfVFV9SMgv5R
	NwImgPOEhF+SmMTxkq8=; b=NTivlwwrnwlzxFRnUFxldBN/eOUOXanZpJrDmPEi
	PwFbeBqjwtJ3WRLAj5OqONcO+mFxHFzzc5RmULIGhNTcKj7vCGvIMZvQEIoqSQyH
	XnqzHAyH7vLlzZz6u0lpYeCuuYq+mkpv/8zdEzG4FlEH4hHLORky7EqyC8Tjrvuj
	cUz39Om5GnyznOOx91XC3O0rEx5ygfwg8oHCYsl1Eu6SowI+pxlq8tuSjJZmFlYU
	WQCPirjuiZra+4zo1RYOMB6VcbJtagVF7dVfLjRYUrXOtt3j8wPyXqmGA6e1u7YP
	zTFAMt0hNT9nCtx9AEXYZbwNCiKkhIOgkfNOdGqYWvr/1Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pa4vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 13:28:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-785827e6073so574731137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788874136; x=1789478936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvFFq7I3YnVJDfVFV9SMgv5RNwImgPOEhF+SmMTxkq8=;
        b=LVk0e8TUm8nVGLXngBKGcMQc7diKv9+wrncdxwpc6iMu5bKFTocOAUPAcAJqjpitqS
         TAij3P7Jz2iAko95bk8ghh96rS3atLhbQefiF4sKoFMxxWjiHcHccTceJYIy6GH2dDLt
         ujXdqMdZkca8ANk65TabJzGEgGJul7nP74o5pFRtnb25DR0+CGnKD9Pjc5GN3LLbcRnl
         nfrM590P6iJMAE7DlqwDCqHMT60IjeiKsaAG0runJ29wfKrvBue5mi67wCZQbhXpLsNy
         W4ISjrJYlPu3kt4SKK1D53eItIh1lH5VwGTYavGdF4/NRFigr8NaoOmSq3AJvuuHJ8jY
         BRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874136; x=1789478936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvFFq7I3YnVJDfVFV9SMgv5RNwImgPOEhF+SmMTxkq8=;
        b=fbBXdZQ8J3JWPj0ZdmK0vHPt6MQDxCbnRPB4VzTu87L0UioUsIWa1KDLkVruSvBns0
         UnceNxGQmti7CP2Ky/Y/oX9RWpf9gM1EWqER9FZQnh/sB0uI5otGckvkqTEF+HFxLI1k
         ySdj0DJVlj0CPA1CHYFBNBrthhrjeLS9URKcAc8jQ5+Vpw8RQTUdVExJPLkcqeUJNAuK
         SjacjbBuGA/+lOMn/QdlTQqYob+AsOhC1Iw5rcGdtKM/I5/JkKkR/lf7cb8xDKu7QETT
         n2v1ogG5PnJUajlw7NYic+VZU+XTpkNmphznRLZIQ7xQbu5oTGReaNiP7VFuoyjlBI9Q
         bQWw==
X-Forwarded-Encrypted: i=1; AKwUvBxs0W+3H3fpH9xy0TdemZcBx77NGWOarrOFfAByOigOwfP6LR3aNO6olHttU7RP1DDkF+Op02RLiku0XzeX@vger.kernel.org
X-Gm-Message-State: AFuF++kLVbqS253BFq9pwUSyxyoL0Bti8pK7HOqketp+jKCeMXjvFknv
	Tsio4HhOl6KWfnE0T+M88ApXN9aLPq1FjOu35DyypYdLL2CCChInvsrfjQQo5vqb5IW0wkH9ytp
	u9HlnSPBZCWNle4+3y7blS6wLhYiI5z3sZqdt6cqZNQdwUrTRWHXMNcTn0Je6MyXKbesL
X-Gm-Gg: AYBFou0I0QA9eT5KQxdWHnvWmvEapD8Xao0No9KCTyXyEJ6S1+KIDNDO5q6hAlo9EiL
	cZqCllhzLBqAHoSeQrDDNZOC6/3g2T8BX5NjDlGjUZurYe6myD0r5VYb5g83K6alSAKYUX/OEQa
	+mTog63rGtP2W9Sk3MT6zoVgM8IPzsc3h4NsDfW8vlr/ua+L1VvDh+7E6nkEw61EXi3Vo2Alfs3
	27Tm0zpW7v/T0GhdMfLjF1N3HMnJnj05V4HUjiIXTGZUehg80hQD9/QJv+mSmWZ+wNgqolIOcnG
	fjQvvPKEUy9KBXPKXEVPzsL4UYBhX5xFCtcruWFoGyas66zgz96W5cdUw/P8f0LeD7/T02fk8qb
	bi5MyZEUc1PcZqlAWCGR/unkBUadW+TjelQS1J27uUIDukoq5hHbOiyK73PKzxgNupYGDrM3EjU
	BG3ezCoVhjiS6F
X-Received: by 2002:a05:6102:4409:b0:789:56eb:39a5 with SMTP id ada2fe7eead31-78a4a836e1amr8346224137.5.1788874136299;
        Tue, 08 Sep 2026 06:28:56 -0700 (PDT)
X-Received: by 2002:a05:6102:4409:b0:789:56eb:39a5 with SMTP id ada2fe7eead31-78a4a836e1amr8346200137.5.1788874135747;
        Tue, 08 Sep 2026 06:28:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed043sm3118098e87.24.2026.09.08.06.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:28:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:28:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Message-ID: <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com>
 <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
 <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com>
X-Proofpoint-ORIG-GUID: wr4yV4Bv6PCgbFXf9GksQGxFs1EOXjhM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0NCBTYWx0ZWRfX2H/EnlEHQSnB
 M6GG2cjMMlTomWHiJHo97mG3hiBZvA4GHlm54kYpgoyp9fLmnDQT8NOIGkriUZeWQS15czSTvP8
 UI667u9ukwUnVXdo7blOGZb01+mRTqw=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa00d99 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=uEsHIfJi1mZuTdkiAjUA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: wr4yV4Bv6PCgbFXf9GksQGxFs1EOXjhM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0NCBTYWx0ZWRfXzZoICN+m8Z6E
 5Yj1qvySkKYS16NsoeXdvWIoQJD4fGCJHqx1h1b6m49u4MtjIrbCyBEzT3/ArsYnmMOrSh+H+cm
 mm2ClcScj9xx3C1vzq8Ym6f6AJMgfzPNrV0CamGWT2MHam5uj1al6fVRY1Tkwq1v0WD5uLDUoCy
 NbeRoLam5UvNpLo7vuP7QHqU07S1QH+x75FB0TMpybW3agJOQR2fzCOFBW0Z65ElYNmc1bKgWr7
 0S/Rkkzd9adY5i5NXcDl56FEB7OZxfeCcZP2PIy0/oCmMopZ3cLCCurDBZvNC5wp47v9i0vxnmB
 v+er30q0Ctu5ZRFxSapGVcmzGRUeUZJjqDxDP8X9NDdvGiFvjutTGG+eZSSn0wI+rDpA9mpC69L
 aXexamXH+JnACB70F2ZWZP/EUu2PdbFeNJfPJbOvWZEs7wDiWbqxH/9KKMsX9SIkoH4+DD6WAGv
 TuDNsXSi0+Q5UK7gXvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080144

On Mon, Aug 24, 2026 at 12:04:57PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
> > On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
> >> Hi Dmitry,
> >> 
> >> Many thanks for working on this and sending this patch series!
> >> 
> >> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> >> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> >> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> >> > spec, however they differ from other Qualcomm platforms in the
> >> > implementation-specific registers and also in interaction with TZ.
> >> > Venus, MDP and VFE SMMUs are secured and require programming only of
> >> > CBs, while GPU and JPEG require full programming.
> >> >
> >> > This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> >> > and adds only MDP, GPU and Venus (although untested, it is required for
> >> > display to work) SMMU instances.
> >> 
> >> I do have a patch series (sent years ago to the mailing lists as well)
> >> for CAMSS so I can definitely test this in the future.
> >
> > Ok, let's land these first, unless VFE IOMMU blocks display on your
> > platform (Venus was blocking display on APQ8074 DragonBoard).
> >
> >> > Note, to get display to work properly one fix is necessary, [1]
> >> >
> >> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com
> >> 
> >> I've applied this series on v7.2-rc7, with the extra commits between
> >> that and linux-next for qcom_iommu.c backported so that your series
> >> applies without conflicts.
> >> 
> >> So far I'm stuck with the GPU not being able to probe, adding some
> >> printk's shows that in msm_iommu_new() the call for
> >> iommu_attach_device() is failing.
> >> 
> >> [    5.971154] msm_mdp fd900100.display-controller: failed to load adreno gpu
> >> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000.gpu (ops a3xx_ops [msm]): -16
> >> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
> >> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach to DSI host
> >> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa1 failed with error -16
> >
> > See the patch [1], it's picked up for 7.3
> 
> I missed replying to you, with this patch the display lights up again!
> 
> Unfortunately the GPU still seems to have issues, I don't have a log
> right now (I think even SSH was dropping then with a bunch of log lines
> appearing in kernel log on screen). I assume kmscube + more complex
> workloads worked fine for you?

I was mostly using kmscube, but I can try running the CTS once I get
back to it, sorry for the delays.

-- 
With best wishes
Dmitry
