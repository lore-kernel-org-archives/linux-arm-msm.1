Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010019;
	b=t8A0f2jOTHWtHHWnuJGI5uQDejgAKt1pE5hGJOwpetEiHbBYdR+HH2wZ7p5VgruMPxGQ
	 AMkE1yYez5cCbu4Nh32AVhx/UVODiM5OvfSqxlQEuBs/BnXcaDOuYx8HrrGO/mfllFv7S
	 nYO5o8OH9z6etK04NcFEAa/LfiwLXIliwvbM2mLYloizr3z/AYEsa0kc8jZ4ZOqjNwhWo
	 GjF3a4a4nZf0kDxrLTY7oXNQJwvFBuFGsVGVQWFtE/RP95jU+ZY9t8heuvLlDWAJMicdj
	 YObkhPv7hkvyt3lBuOrcJn5XNv3v18zbvyTCt6n0jg2qYoZtbmCS9qmKIzpmUOCD5UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=;
	b=S19OUPdU0CdZHPPuxZwgIsVIx6F2lJIaQA5CypenHNtQyJPzKgu5bOop2BuSwusQVIDw
	 C6UJ1G6BQRDVl1zFIbxbhdQrdki8Gk6MmP4xin5eEFArrQLivdLFaOgJtSM6gMY5Uv7W3
	 wD5oprkF93Vm/hhLpzO2iQOrEPWrNgK32k+WJVWpKS2b00Fsd2Zt0vSfEku1bSm4dy8o3
	 /7LLNACyVGOg6NnbA4goV2nEXqCHv4QNicuw4qX1xduHSUMpjSYywFdKkwX2KmiHFWwgW
	 J8oAjgz4RdvcoFSbjENAmwfIJnG7BSH/cxyTHactsooGQsoMhGijpl1ObXJrsEhUwFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBa5R6DO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eo7kzBOn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE42C60A260A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE42C60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBa5R6DO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eo7kzBOn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aTId3300626
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=; b=WBa5R6DOTbjnjhg6
	oR+yaDocepQyyKbFvCO8gL6By+UFGT9Xohprkgdmh7jPeGBhZAFyjKNzaOkuOypT
	ygzkq3W3+P2AB2eBq0ri/8gOaObnxIJZbgBCgl7T4MBG7s6FV7bY0VSnSZwv4NF5
	binG9KB7KqKnNomvsStayo0oaocFxa7jCR/BVD064JVSxlhcVi8cKS7vvnu6EY4b
	GSN0Ee60XYevX2wC0LUHkZQfp40FkLpgI0o0Sc4KPoXwqP332NqnWvsKeTPSH/8/
	WX6l2wAtYXEdbplrkbwhypaNUQBMopXZofmInDGYDmvKKslYj1LcLb9bEiebykoC
	v9AuwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpsx02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:20:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso720699585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010017; x=1793614817; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=;
        b=Eo7kzBOnfE9nj63lRNDeCCx/2zXQFBWATqVXNDJtVg8QO6LhuD77GnKlHOK5qR7+FW
         zEnJLaXV/a+ZY4Icw+89xbU8kL+VE/m0ekQPMs5EqdZrHWtTg0eKU5CsT1ttJkSc9FEq
         vgzsACxbydYauiPvBIs/ckmV/cyDCtrHGwWyqAFCNBiTS+pg/5DvxTc7WA1gxFAQrW9q
         LuBYohScr4/tNL5jtR+rJw1lrUNsDgOqVsLLvU5NpvALrYefxpAAT7PtSZrtbU42I6Id
         3uoF5IF8LKT1UZtcln7W9ObN/ANLHh3ftaIHR2RW33xII/o/FlvfAajCjHettkpma48D
         uy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010017; x=1793614817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7FDKcPmUfm8pKhwk0XQXsdGdq3ble75jjcxbCWLT98U=;
        b=w+lPcPioyOr032/jgtmpnFO706ZS3qS46+K54pRH1elq+VtmDmgOLbNOibK7iTzjk+
         txltZpY2sn1HEUJG3OaZgC8KMQfJldd1sdFgmWQuDRUmcuEb7zPHWFo+ppv/tWAY5El+
         +mqcA1CrRA02rZQy5S+Z9Of51Fh+1vXzdbpS3PuYSj5537bkVS2QegmFOetmnGNTkHEd
         oAfK3hW8Bx7dQifmGOrPutwOwSCOgqPKGRKy0iARMkGZ9yfUrm6Us7U/I3/Jy4p8dbTL
         IR2uTcMrw5fFV1+U2Ch9P0p+O7tgQ0iSx4PlETBihOzZK4T62G/LDm+YUIv7FR2E/itn
         chNA==
X-Forwarded-Encrypted: i=1; AKwUvBwe2agMuzUJ5m+jPfU3FntOPHGopLkYWZusmJo1PkhcJKWe8iRqGn6xZIvDNXx8Halv8e/DhuizT96JH8LT@vger.kernel.org
X-Gm-Message-State: AFq9FYL0CMsaGtAENAWA0U5sxq3PKBDJPsrVzZdjoFduR8QClxlaQzi7
	d67MEkpa2kHTgLn8aMSiBeXzT2pqcZdyMUxwqNSOjDKGF2pNl3SYOZAvkaL6t2liQnTHX7B/H5p
	hpwTAZd/XLfbx6PBpyh5+LHEj1mLQrz+ve1kzrKdEkQkxQPzgSbuQ+mY4EEAoJT1KP+b4
X-Gm-Gg: AYBFou1aOM0uGGo5zcBz5kIFMm9xdvQiKs52wjH3U4mvO57qPyMiSO6xkEKqLLnU3pE
	sui+8zaWWqx9GlwJO2WwQ6NG9bskpRrt7bIlxOHnIJapYOcYTfQY2v9fH5GcVjDv/0MFuTWaWJB
	lMqQ/A5l9PdovuCNprRKYrUA5LYp/+YP1ql2C6F5YZ0Vi5okIXlrNu4tiijpVXGJFEWVOgUp0L2
	H1ngKGsum26cjCXRdDWilEwTUXRYdelfx7Y81SMFtR4rAkfPNW5C2x5janjpcLIyX53pWvSI7p0
	XecmBqRY/sqWQoTiv98mrq+cplYG7prECOy5hBATKsk9DTuc4TeTmqQfXcBVLyXDsI/aah7raVz
	R9NkUAF1c/onxo/gtx5A3NBC7sZQBnb8pZL+r7w9772yaXyqUzXodzDiJHPqa+Qo+8i4RiCU6Gg
	D8iC0Y0Dexy8D7
X-Received: by 2002:a05:620a:4002:b0:93e:910c:5fbd with SMTP id af79cd13be357-940ef9a6dabmr876602985a.63.1793010017109;
        Mon, 26 Oct 2026 03:20:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:93e:910c:5fbd with SMTP id af79cd13be357-940ef9a6dabmr876600685a.63.1793010016682;
        Mon, 26 Oct 2026 03:20:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6ac6asm1437302e87.22.2026.10.26.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:20:15 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:20:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 09/13] drm/msm/dcp: Register DCP display pipeline
Message-ID: <vd6e7jr4ciipj6ork5i36att6bamm4gpzxjdeqoqof3rdj2m4q@rtg7jop2bfwf>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-9-48aad0fe4f72@oss.qualcomm.com>
 <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
 <c7bdcdf2-1fa4-42a5-a89f-689e688af5ae@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7bdcdf2-1fa4-42a5-a89f-689e688af5ae@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX0+2RNev22GzU
 FOiX1KVyZXsSq19H3RPczpmi2AdIf1vejj4bcVSMOYBeEQ6muXJTWPe/qLlBDdYL1aG/tbvux3S
 awh8pJEzfirNKpyV92Thb+bKLcTPf9w=
X-Proofpoint-GUID: o8OdniqO4v0Vo2TbC0spO0bGYfCIIiqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX2TJdQDsZWeyD
 FrbP/g0yE57R2hHguEDlmL/OZnZZ5y4crGr+a0P/vWDMvvv2fT/VqE+mJ+UKdgfKvCy0I/Cu6+v
 5XLQpIxZX2qheh2awo5R2TmC14RwC/dj5ITQ4F1N8w8GwdNXFER+v8ZxFVDcvlQx0H8LiPxbzZE
 mLe7XD/GcKfnpERqbOHR3P7ABagsk8GdQSRVBt9bC9RPVx9ymo0FB0uOswlowoZ6TySfCHak0UW
 fKHzqZH4USb1pEayHTwcDC7bQ8jFBPnhg2OQUXQMM6WrKUjM80HddE9wwHM4yAKELeMALh0UKe+
 FDmblpH+BKq2h1XrAyEppIA/l0iUvGksFwlg7TVWqoQD+/glQeC5E4/HsFwDN17EqUT3IVoVUR5
 JLm8pwnWu864co5mIBTPzBChRhA6QAfZOvJvGw38BImSl/tzn7HNAxyVTvvl9mH9Cl+n0KDgaNB
 yZN7vbRBmnB3K35xcOQ==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf2962 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=XPLrJM8uNFvCFI0Cpc4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: o8OdniqO4v0Vo2TbC0spO0bGYfCIIiqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On Fri, Oct 23, 2026 at 01:42:43PM +0530, Jayant Shekhar wrote:
> 
> On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> > On 15/10/2026 09:38, Jayant Shekhar wrote:
> > > The DCP firmware exposes display resources through capabilities rather than
> > > through host-visible display registers. The MSM DRM backend therefore needs
> > > to build its KMS objects from the firmware capabilities and device-tree
> > > display graph.
> > > 
> > > Complete DCP KMS registration, including power and IOMMU integration,
> > > capability handling, display-graph parsing, and creation of DRM planes,
> > > CRTCs, encoders, bridges, and connectors.
> > > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > 
> > Your tag is the last one.
> 
> Sure, but I notice there are checkpatch errors, should we keep this or
> remove?

Read the docs?

> 
>   ● env: :3: WARNING: Non-standard signature: Assisted-by:
>   ● env: :3: ERROR: Unrecognized email address: 'LLM'
> 
> > Best regards,
> > Krzysztof

-- 
With best wishes
Dmitry
