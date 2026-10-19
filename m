Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B04DAF89
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410449; cv=none; b=AzDaOki6IeQlpgvBLw01C+MLgG4+3N4XnHb7s7hwkDHckEIQBfgS3BbS41C5JMGPjoxL4NnhDKOLtO5soOv42goqGMKR2Vienb18m54XKLxxMxqtNiWjC+QXghLSSUjYqnUr6lgESLeC0WguzX66wnYreh+wp8ssWckEBfrfVro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410449; c=relaxed/simple;
	bh=y0Ccx45xxLYWt9pp0bul/0px2ejfDCS85zdyec5AYdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXmWjCSC94OnEjw//sE5BGnFH/XGJsdlTePc7z41QNBqDtyEh8RAirnUzrtsyUhTzo9dzCvpx3WVCnXJol8Qzb6UNktQQCqjLZ2OrhvhGgPYCcx6DyVvBxHt2S8OoAlR5if1atttwepx0B255pza2z/tH1cTqTyt9gFy5RuNcOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XW/3WAht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQnML2Vx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XW/3WAht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQnML2Vx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OocV3256577
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DA19jX9AB0uHbCWwD9Zbkxsp
	a0JfxX+l+oTCDhGHnvg=; b=XW/3WAhtWkwvCLBXO/vlD0QZ6tpeQ3sN3MTurgTS
	OxtGoYo99+/xkRlscU80YeHr1FgogvIN4dd5HV/rt53OdWbEVSDqM3X4XbcG94fD
	gLYmZGjQu4xVzU4IEVSP9Sgss94Lre2m5cDmXuV4Vt3iz8/oq9leUu0DK/20x6tW
	Z9GvJfHnd43p27MVk/MD+s/hC7YyZyjyWLIMCHa2NKhW3y8jXGRmgE38X+vLPQim
	7/Y+9OqT4cprNevEwlJoMG2NXGmUbzC3DeditX1IbIvQVZ+vQysLMasPFFit1MOk
	ma0d6KgTKawpeQZyVjP7cVVFoIgtqWdZpkqE0gfRV0khtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8w0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:47:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so338996085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 04:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410444; x=1793015244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DA19jX9AB0uHbCWwD9Zbkxspa0JfxX+l+oTCDhGHnvg=;
        b=KQnML2VxCpD+9VqQJRc4Z6MUJJCvyqV14h6THhyEY52oa64OrpoRDB1DzVNmoFQb8/
         HKTTB3zpVtde/r9EL69Kgtvms4+1zaL2pd8yXQDM2lOPiyOuEX2RJKbDNTlH00gTipNH
         KLKJFUqrFpWo1t8AAOtRdBCTtMFkNMyCwT/7jllV6UxoIC5yUA5kzkpBC/iDYVsO90j+
         /Vm/KV8NE2I4xzU6ibOTJGuhPp4FAi1rjvVs6Hfr3q2SH1HQ863JPxEE3tFSWk+0NjKg
         IZDqChhZK4yYDFuZwExU+KP4dp5NRryjLVWXJ9+g2iJEhW0UvyH9CdMG+Wge81pdXQCa
         42eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410444; x=1793015244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DA19jX9AB0uHbCWwD9Zbkxspa0JfxX+l+oTCDhGHnvg=;
        b=FkZzYo5GlqzPB7Wft3jprNG8yBcGmBPNbdsQY0izKniJAJOgUYaIpHVAxWLgzSmwhs
         AF/pOlQVstGJynUcBYBTEUhBDsoQuPe+aWT7ReUzsFIt7MYkAJSjNKVgGuAv8Z3KIe/+
         JNFplxrE4pLdTYro2cgXil1D24X8Wy77CqFr80F683OKsfIJKzPfAV2QGQC4sD3jXDLD
         Ox5BaDo/GC7Kyn/Jy2sHZvg1G4Z0Sixb8MAJKviImwdYSVXA6Zdv2sxT10x30WfTnXt7
         sL+Thtm9iqS4UgTa1ZN3XsE0KDK1hj338R3ccWOAp52NmTyQ2oqcQpW/z3PY/qDBktO1
         Pohw==
X-Forwarded-Encrypted: i=1; AKwUvBztnk3+AMww9GgF79HF5oOQ22Qh74nAemitTwEYHSRu33QzM5f1PMuVJyTtVj8s+HjLDM1WJSt0H8xqzZBc@vger.kernel.org
X-Gm-Message-State: AFq9FYIpWuJqWzcrPpyH7vgnk2fLqE1lqo6+qMC6iD8+xtjJrYM/PCAZ
	W9KEbqQLmTGpapruODzkmFwf9lQ9pTJW6xvAKexaCLwCCeRA6nLpGO+qAVPV06YOXpaHIPEaOla
	tk6HxiiG/WKu6sjClQYf5LhZCG8sGfkIHwYMOm7q7w/VYDCnkKlUFjcXYsE7rkHeIBBNp
X-Gm-Gg: AYBFou2R5nb+Mv8VFRA7pZmrb9SqHTHxX1E/IoVroF2eGV+1jD/NW/YiGw4IOzIJIOa
	wtEa6/wM5CRJnS9pd7c5PxSoXBr922nNgzSvzenuD20mFQM/XyKNLwYs6r8jZ9j/H5kss52jUnr
	9J45+VCDcbM7Cif3qpbRHNYUr4e1wGYQL8p2HqLyfT3urrRGuLmZ7kLuvzTviFMDy8Pol1w+IZd
	p44RV96d0t0TficM0IOzmRcfIAIwEH852O8r3VceCLRck35QiT8lG0m/IxdTliPFLC5hE96MqmN
	GVN5VoDNoe+C3nJtbeaKf1LWZ/W7ws0B5b6lUfVoCECRDzGgvpZCr+WwTUn9Rz+oNMhzX31Nr26
	PQsF14G/N4QNYCtLd
X-Received: by 2002:a05:620a:4042:b0:93f:735:6c83 with SMTP id af79cd13be357-93f29da63b5mr1143958485a.56.1792410443676;
        Mon, 19 Oct 2026 04:47:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:93f:735:6c83 with SMTP id af79cd13be357-93f29da63b5mr1143952685a.56.1792410442992;
        Mon, 19 Oct 2026 04:47:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c575esm19986031f8f.10.2026.10.19.04.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:47:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:47:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: pm8150l: add LCDB regulators
Message-ID: <gcsjw73m5tj42ftvhyckexor62waf5eydntycyy5qm7ubkesn4@qgr4ratyntfw>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SSltQOH6TES8mH1FR4g7yEHv_fbyy1k1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX+SLIrbNiXSM7
 PTRVGd5CaKwWVH7j1tgtc2dsjoR4ZO2jLM56goQLKJPv/E0Q/KucS1k9OF4XCR6wBLEfPS0gB8A
 d07bezSoH4cJMpFb5uZTPRQsVrSDDCJvkt8I3MGyaGAQd9/ZXAT3vyAr6VfTBHlJYyV5oaIkxQV
 /zVaffUHvneIt2ajVn7xhq+oxfgb+t+O8PHsMS7yuZNasCnUg7jA1U0KSuwzDKsN5zepqjy+egN
 CZW+q4T/pz43Moh+D9pXdWMgF/Ls4Y4C8BU564wCMBsehog9tAOB8CGaY9+tJNeciUz3y3cW2lI
 CrPNzbYxxnc0PRIiFhY371q8K8ppHLaaaBDY6f4pDhOS8slaMWkyRTyMyfN67zCnZAxkdbOyuYZ
 yVuiO/1qZSklgegse3wBsJEe1YyRB6Z3S5NOsgdp1rklvQmaNgZj8hyAq25t/06R2uMf98RX7IT
 tZyq4N7bm+V9K/rzLkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXxKjcwKNGpVkv
 T1tXqgxN+23lysWXZjHsgJpgOsDzumzc6TDwjAArGx5auOfPU9IBz1HdQ3yAA3o52g8Hgh9/L+a
 eAiv6crk3cRtYr809nMMsktilC8985o=
X-Proofpoint-GUID: SSltQOH6TES8mH1FR4g7yEHv_fbyy1k1
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad6034f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_xPOIdEwXcuG9LIM0_EA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190046

On 26-10-19 14:25:41, Dmitry Baryshkov wrote:
> Describe the LCDB block providing the LCD bias rails. Leave empty
> regulator nodes, forcing board files to provide correct voltage.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
