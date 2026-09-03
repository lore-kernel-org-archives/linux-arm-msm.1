Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA03F327B
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 06:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417386; cv=none; b=RaavG+HuH5QbjJD0TmwiuYeeUeOwJPTse9iG88QE/vLkZegnGUwhpFKWLWo1Znp+b9BagLcY6gVzZeImQx9pwF8/9DKbZ0YgOonTL7awotdddywhtYxCvHMtoHe0fuD5HfMFc9XdPonz3cKAufOLZcVJr9/biQMxbEmWKWo6MXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417386; c=relaxed/simple;
	bh=FfwkxEfilE86BNfAlLpk7Wh2Jy69VGToG2IRN4Qqqqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eojp6r7YvEuNY2Oh/ChGsq4AiUzZ/HBsnGu9AJuY1sM237dl1hdpvU42r10zr35Tck9YfS+AdkzatxlQ0v3hjhvAp/lLjqZ4684eo26JczsIVZggyjwkeZMrpcWm6EwcbhAVhJwttdWon+HUnmcT8ITMnym10HFNokGVQ1hQtOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enNaZKAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMUtYN7w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enNaZKAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMUtYN7w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lV0J3244889
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 06:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6vG8IUyMgWi+NM+7asSaQVtS
	tMEa/DOfKPbDlIqaadE=; b=enNaZKALYY7Lcg2+BRZ+Wvyk+B4pcvlzWMrbcyib
	lExhVZCU4VRs1ZIRTaTp10fJ3BdsGzciWvB5lE1i2e9UjLiFd4f07sH6fFmRSfcU
	epkdfARqe26b/VCtW+ZhAOcjEFOGnzPODymRUIxhJf7v7LKIfUJWVvbqwHYjKC81
	r/cms3K+WFZdch8xMsyf1HmqmDN+a2MQ3bwhqvWZAJkq6bByZnQM26xclsH1poAj
	zyzIwYHPaPw4nmEHZ7SMvKveQx9Wrc95JL1tjxZB0VyJGeJnM5H7naTVaLKctBYf
	mTvhhuRYKpJ3Pbjdu2e+MseRFnxd57U7ztjlQooI1CJDzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemcec3av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:36:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7293f13c6so27347005ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 23:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417381; x=1789022181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6vG8IUyMgWi+NM+7asSaQVtStMEa/DOfKPbDlIqaadE=;
        b=hMUtYN7wagtSQcUnCIQ8Dqo2KR8OJ2ahs2dl3qQRbI1BoQRp2bFy/8xBxCltZbgo5D
         JuOGUAqw7ehCZGNtpc22sZI7WQ8xLgod21AWxzrkL99DmdRqsblhM4XVUEwm9wxQR1Vd
         ueR8WhysPzRWdoLotRXHlUhRs+rZlQZ99248dg9iQ2exquNxd5dmPYMYE31A/ERbMOdQ
         Ff2H6A6iG+E0TGqsYX7eOr2a0YONYezZIfyGBJF5sRKqjCdQIqI9jiaquEGdPCHM/It1
         qDDcMic0XDX/pJMSauOyXl7dI1M4PRkNE+8jY6GQXiAOyi98SVcTwzNfsVOaac+cFmOd
         a01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417381; x=1789022181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vG8IUyMgWi+NM+7asSaQVtStMEa/DOfKPbDlIqaadE=;
        b=no+74ZndONCoyUBCgS4XS1tEpOroIg9MZFUwVCd3X3wlSTggXmJ6wcX1zPxYTdQuvb
         5vZnfDCQHnSa9jG43dF2aLDXn+hVZQ0Sdoc9vyztQnMmpGPXeuIc+a/Ydsrf3BimF1cM
         Mhn9BlIwYfPL4CsB9p+5Ic3PMGEVtePhjfYcnZX9OK6WPa3qYfrZyNUq3KgoPgLSQuip
         3P8LySZTJ6EtTtEoENbLIEvFJIgFHNC/vR+IsUwpje0+//s74cArHVobxInD1Qt2pqSh
         4xs4i4iHzA0//g/h7A4miiXZ3qqwDelsUlk/RLAZi2cOFbJVF32aaXh5Le7SJoH2pTmJ
         zhCg==
X-Forwarded-Encrypted: i=1; AKwUvBwU+i1WCU6irmca7F+4Prd+6SOsR993ulh/qfO1ztdfKWEgmYsOJ6dxWdtsxf9mDlqwWV6mqnoxxFMsQL+z@vger.kernel.org
X-Gm-Message-State: AFuF++mZAxAsqZcREH9/EDZywVHmuH+g0JHD2EYrLmGfB0QRdrgdTmyq
	C6Z//p54yd8i/wsF9sAtDmD0ClnKB8Nkq5EjszKdU91b6MDA/2Vwizem7r/EG+ycCAwCJ8gOBYk
	1bivK3camVoD/f0uv4I7+WMh7SeUa6vktFgf2DdSrTPMXGqfPwT0inD4lUJsE2205PwY8
X-Gm-Gg: AYBFou33UO+JS+pi7XHx10gjhBlMQLizISrlsCfC51ZnUq2q3w4PxKiGQJvibgdSvm/
	OMULuwI80YaS05asjfQPlQXy0rNNUGqKUh0cFc+IAKqCEGL/doKAOfZzn9KncRNNal65o+4RG35
	Py6Tq5pijDIMXZ6sLurlLkhUBdDKFAjMNgJ0WSgQfR3hAIVKnS4lHxsfkofv9Hr6FeLiL5RZT8V
	JXlsAuSjxwLOCsmL4ILTT8nc+f94uyGCN6c7SM+IdT+xAfRka+JYGlnWYju5Z2CJVCrVVETw9M0
	bnwBN4TlGNKNFzrAmM02vozgJA7u3fhStWKphyCWmnnBmOK/aGm/C2ZL9MkIRVWKFyak7Ddux7f
	vOnSQz2jXDXJlq8vjXlCIwdvN2vbb6dh2W3xEUFSs+eA=
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr15404630a91.1.1788417380691;
        Wed, 02 Sep 2026 23:36:20 -0700 (PDT)
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr15404520a91.1.1788417380155;
        Wed, 02 Sep 2026 23:36:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325592ebb3sm3645854eec.14.2026.09.02.23.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 23:36:19 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:36:14 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU
 PMIC support
Message-ID: <apkVXuacPMqg9I8n@QCOM-aGQu4IUr3Y>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-5-shengchao.guo@oss.qualcomm.com>
 <b3ca88cc-ff00-4a6e-9335-e39bebedd548@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3ca88cc-ff00-4a6e-9335-e39bebedd548@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfXxaKcUGlrHH6b
 VpuZvwcnIIYWRVV/2tRmWOCNtPRuC0XPgzeS2oPiIZAPlkuNFLBk5qAo2/I7HqJ929ARM0J0bSt
 CdkwCmD5EZpTChqSBuVwnIT88t55xoMnmF+aLcqKxxPF4TmjO1YbeWRv8K3303NJmbFWlXHKo3y
 CFIGetWHqUndAM3NHt2e5mT6ShaJhT8+U3dNV1RZ4iNO4C0mynt/E9p3aCJq06EjawdAyLv3yMR
 u3czRlf3Gk/1g9R1TT/c7qw8VVf5aY7Kw7/o8z65RnzOvW1Y4OflJ2dVh2grCfE7hfXkVWKsGL6
 6ay/nchw9spPJ+a9CczjAa6gO/38JTOMQyGDTZCzEC0ERcFenQGkXhypLsuzQMLGyHI6fZ62HO/
 DYJ9l/T+MYB2i4V4A2+5jgnjsYxZuQFvfbV1ipeCup5KbQXpvadUBoZcN0JqF3KT5AoUx5ZUFE6
 /bnevF/5enQSKPn8H+A==
X-Proofpoint-ORIG-GUID: k7rptvfy8GQVUo_nn8ffcjHY_PFjlQ4l
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a991565 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KicveIkL9BD13D6TIKoA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: k7rptvfy8GQVUo_nn8ffcjHY_PFjlQ4l
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX7VKeBGTgHEiu
 NqgHrH1EQMc1gzDuyfR1uiK0enMMJ9GAkHKgDY80a7IWdNRbPKDUZT+ZiF4DAaKuHP06fN/kzV5
 De12BXkgEd0DpoSvawAmJuUnJNkehPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On Wed, Sep 02, 2026 at 04:17:26PM +0200, Konrad Dybcio wrote:
> On 8/31/26 5:21 AM, Shawn Guo wrote:
> > From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> > 
> > The Nord platform is supplied by two families of PMICs on the SPMI bus:
> > eight PMAU0102 devices on USIDs 4 to 11, and one PMM8650AU on USID 0.
> > Add one dtsi per PMIC type, following the established one-file-per-PMIC
> > convention, and include both of them from nord-rrd.dts.
> > 
> > The eight PMAU0102 instances are labelled pmau0102_e through pmau0102_l
> > after their board designators. Each one provides a GPIO controller, an
> > ADC, and an MBG (Master Bandgap) temperature monitor that reads its die
> > temperature through a DIE_TEMP ADC channel. The monitors use the
> > qcom,pmau0102-mbg-tm compatible with qcom,pm8775-mbg-tm as fallback, and
> > each is hooked up to a thermal zone.
> > 
> > PMM8650AU is the same die as PMM8654AU, so pmm8650au_a reuses the
> > existing qcom,pmm8654au and qcom,pmm8654au-gpio compatibles while the
> > file is named after the part actually populated on the board. It provides
> > PON with a power key, an RTC, and a GPIO controller. The resin
> > is described but left disabled, for boards that wire it up to enable.
> > 
> > Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		pmm8650au_a_pon: pon@1200 {
> > +			compatible = "qcom,pmk8350-pon";
> 
> I think this may fall into the same bucket
> 
> https://lore.kernel.org/all/20260724-b4-add_pwrkey_and_resin-v6-1-41acc214d93a@oss.qualcomm.com/

Ah, thanks for the pointer! I missed that.

Since PMM8650AU is the same die as PMM8654AU, I would reuse pmm8654au
compatibles, e.g.

	compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";

Shawn
