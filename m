Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE746D2C6
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658038; cv=none; b=QXNrazJTx55dZMo6gM5H/4Ead7BZDob9rUUAP+uLf0Wff/JIIbLoxqvDptCnvP7yIbwFodrSePg6G0+IFyzZ6mHxPjAh4Rmnfdp58v9YK2GrhM3RuJZAKTejua7JHloIxOVdvfWb1W3o6WtTw3BpYdxfcWwCokiNGr+BalmsV1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658038; c=relaxed/simple;
	bh=/bjgW9RO1R07ig8y9luO4Rc8hIJGrn+qc28TJYNqNB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0pjHdu7mLPxXrwDlKiTQKbHwzKKy5elEvujW0m7xyKIhSVeQJBtRDb5rdJdHB/bNgh1/jrWGHzMTZL4gt2S9LK7OOpnJMLKAThm3RLlYcVrk/aY6IDwxoxMglRsP/UHjqzQfjzVTLiRRsZsvhry8kD/DfVtCzzXwTqcWoGKfZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mn1FQ1JN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkKTGigX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mn1FQ1JN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkKTGigX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRZGe1926832
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3WzoQyUz2yjA2sAZWuslYc8+
	DuQcXPV3q7EZvnD8d+I=; b=Mn1FQ1JNrs9v0OnYqnBMZaeccvDORgZdCLaCI1Nr
	ag2CMwpqeuDk/vCSi9kqY2m2IDXWXKIj6ol4aPYUaKVkw+du0EKbQ9xjcqyn2eGx
	2/mD9zhyD2LU1HeMkg+SCTB36qgaoV4Jg/+gKZVdBqui7eJtMCVJrw8Nc1zzqQ/G
	sHEPluLRo+jVZAYbZG5qeRXFXVWr6iZj5tOvIcTyJdu8szUzR06QY2O+PYe71RLk
	HtGnN4Cyc/OoC699lqvCpt/kg+/4FmsQ35AwS5I7ky0EpOq6Hx/CgOg5X+4/hkqK
	n1GbjoeY5y6+lQ6/J5U17f8979igscfEkxBi3KSb/sTQsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fr8q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:20:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so15212081cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658036; x=1785262836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3WzoQyUz2yjA2sAZWuslYc8+DuQcXPV3q7EZvnD8d+I=;
        b=jkKTGigX5JCxllEpwBYaB0ko/Q/JwQSsBdlNdAUhyS5UkCaSDVvUe4FRPlnnEuj7Ln
         URGFvANyuE1NW1t1sqqnMomve4Bfy0T01xarXLdY0lHXVklR3x/3Qh/mdL/xYeCJS7T9
         nP4N10fnrvhVPIgaxAVQ1blf9o8ak/dA+LmszzpHjQQPjbl004YUvUZVArscsiRit0KT
         VAt5F4imLEhCpNUq9bpKW+PUE0F59RDCeFiO5EkUVBa+AC3cbsi0f8LOz3mM+UOjfLBf
         3mfBWePAs/5J3yhpYwqOgM4ixP9NS1hmWSQn8f65WA6DOvQalmfke0/9WpWQNbKBsgZg
         c4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658036; x=1785262836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WzoQyUz2yjA2sAZWuslYc8+DuQcXPV3q7EZvnD8d+I=;
        b=pmmxqbDAXt/S+pdBE9Co1i3iEmfyjxwjMv1uyMNXkmId8t3Oo38qLgBrFQyxkeXTH0
         LVcOR9+vPaI60sZlcsqqbhgy5xUYmxntc+gvV1dWJQPQ4Bs23DGEYEDePI1MBiTWBPuy
         1KYsSaSFIMOf0VNq0T0KyfaPiENGsck7Xm9PGeqFwH2MrFFPTLh4S8n4YiAX028k7IYG
         RpoS9/rTs73CfYT0iLP4rsqL2YpvbHXrgkr2hfNWC0t+HCtiIuAS9WrAR5ATjNemqPMC
         oSD0oGKu1fkph7TQl0QA59eOw8abe97F5/EXnAwpXzXn56VmE0i4J4n1oEsV+neVEQUA
         dgzw==
X-Forwarded-Encrypted: i=1; AHgh+Rr76Ji6iux8yO6pSGDQtivjquLI7yN2jwaY8emP9tnwvfJSLqOCDrKbLm8yvBFedo9ajYoj6svSxIvQRdWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPEte7dFjBXmPuHUHaaGFQPsVQJY47EEJhmfmedkbnSvCWINS
	n7qSiQBdj7X3bEM30nJv5b+cgW/bnNm2sDfiYovvRbyg+L5fHvvBLKGH+wBqC7efD7VjtqOd76C
	DdJr2MbHRpNYEuTXzIF8WGIgtEpCXw+4HGuGk7OQN/LqkWhK6CcUMXQnxhKA9jlIPVMqi
X-Gm-Gg: AfdE7cnYI+0s/lDd7/5bPW7JqzHt3bXLa872OXHauKIuCXMYhXBNJIjHWRZ4vwCV1lk
	c1o5bagtNubf4J1FBdEwb3a9kFTeh8iJfBKrLcxXfoSsaNs7UlMnDEQ13UmtPunODrQx1csWlGP
	S3W0SyPpbOuUqMy9AT/aQfBbzjaSwDms1KwVJMPDxtRdVjCNC7ER4c/mxxqGgCodsb4pXhMHJ/M
	My8eFsiDT9COSFIL/hwaADGBtLR1EF7pZMV+/P5RSckSlXFH+8UFuevLdqzeHQviFWpLRZ1QpBV
	zQd2OeiyiVBOL24lLjGAiG6A828Fs9R7Sm2XvvpJFIhKA+T+bF/yL/aGTuBYVk5w9lx50ZHnPGW
	PxW84qais5l2IbpjoagTGO2oD4Mh1c7cssZEaqlgtk0KQLF5OzEwHfBykm20a5zc0GpiPyexg1G
	cAyH6J8mUDz/nS5w==
X-Received: by 2002:ac8:5fd3:0:b0:51a:8c9c:7f41 with SMTP id d75a77b69052e-5213ed70eaamr180092411cf.68.1784658035719;
        Tue, 21 Jul 2026 11:20:35 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:51a:8c9c:7f41 with SMTP id d75a77b69052e-5213ed70eaamr180092111cf.68.1784658035235;
        Tue, 21 Jul 2026 11:20:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bad324sm68041e87.29.2026.07.21.11.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:20:34 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:20:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Message-ID: <5jozediov63riomokjzcphmpkpfqdgl73j4hd27vx6yttyddar@7bvbitl5ag2s>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
X-Proofpoint-GUID: _0flmmiHYDVeU1xPr7Md8_zTf03YoMyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfXxMsSyKWcvpEk
 on9BnPOTHOQ2EAA4R1vdAsZKVnusKRNXdm5DSclIyPkzOZ50HSVrmXSLTxiYQGOf3H4KARcTt2f
 BHccnmGNjk8j1QU6j/Fwn37INjFr43xuCJDzX/VORHjy3fhDmC+cA2UTlDwh/jAaUrdb46K8abT
 QFKLe3L7KPfNZNGNdgvffDdNeTg2J7Opra5YjvwjrEGJ01z9mNnlY8igzhefJm6SWde2fIOab/+
 NsTs1kYEqk9bOhI9qxn2pb/cr+i3TO/buJE8pcAtL6FMJfpPA4NOOhFYLni8SzN884aX8YjaEds
 Z1v6ixRQwmzJesjz15Zdh15AlCoB0azAh7PgyjefwIPR75UD04I03KMhV3n3YN6/r4iZGrPEEF1
 pIzN3QR3u78d1af3D6vqtFDEdxOkdCSq9wzxQFXfFqwg5/XQ1CcM1zi0Si9gujgVqwvaMURU+8l
 IRkgYfWbiXmd/JB6u7Q==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a5fb874 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=o2yrQjtzwsYVaXIb-dAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _0flmmiHYDVeU1xPr7Md8_zTf03YoMyC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfXy6tZFcCudTPw
 T7OwVicqEKNiM5QdTw4JJCQFvsuNYDMgWZuCQn9oPgutq5B1tz85nPfW+ubVJuCKWfDrkA8z2eM
 SNrL+PV84gLBEkI1cHJP+5L6yz3n6P0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210192

On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8750) and Glymur use two display power domains.
> CORE_GDSC powers the main display hardware while INT2_GDSC
> powers a subset of SSPP blocks.
> 
> Allow the MDSS bindings to describe both power domains and
> their corresponding power-domain-names values.

Another question... If INT2_GDSC only powers up a subset of SSPPs, why
is it being declared as powering up the full MDSS? Can we move it to the
DPU device instead?

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
>  .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
>  .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
>  3 files changed, 26 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
