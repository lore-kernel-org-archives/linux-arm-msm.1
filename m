Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE932F2914
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094561; cv=none; b=r8pHkjAImUUQ0OK43oQQrpJ91zf+y0BPtOjp3zpNE4ASYlihzNy8ryqCcWu7hupbuhjaxw1KWYeK/xvFJcS5NYPFBvmZyc8ngacH9D8fsz+btfQ5V85sy/HeARXtRDKYn9nlgQsEHRc3Ui9lCBgudWdeek46HBXTppe3PpVUIig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094561; c=relaxed/simple;
	bh=LH04lPQkaLKxsaogkFvPl0JnUsycA5CY3SThuwpZiRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsuiPBrmQ92d2nga6fnp0byMjbydv0e6baaCWk/5UtXv4QnPFPzcWTp3aMdz5CaEiBNnuYBzJa6yiAfpzA/3SxPkBvaCRrJ7udMAEG9+mJbBR89pYLCqtAgWsZKYy8I1nZUCBVwqV9egJkrjIxo/xFl4Y9DI65ZyuUy3pqohbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4mXtxyO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xy5tEWVk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4mXtxyO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xy5tEWVk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777bwJC3534934
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 09:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TXEizd0UsOhU+MZfiQQUd2IU
	V81zhg/D6jvHU/Pk81c=; b=A4mXtxyOaDny+i9uzBo9roP+aj9PblulV05DlMPd
	qNsU3+nQ1NBVapJGV9IadT4k0woPV4wv1eN9hpTYqeM/uQ7Q/HHGalC4jI+2NffP
	sKXWTBJiMTeeAIYtoDRKucbnKJomb1JyeBt8VIfKv/z5AuiNaFbRkkqVDHV1siQj
	15XqJGVCRDEUZI187o7BV69ZAb+9gNVwgtuihOZ+9CKaZkIfyLa8oANlQwbxfEkW
	gfUN14seDiRNrVhgpM9j124TVOFmEVar4ArKXiqbsHS2ZndnYmgDrVSxD0eQt8FA
	37pBRkDzfyRJ3V/zc7CjbApDoqDJFDyottlDzGOKdbQb2w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fuag3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:22:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-529ae8e96e8so33814461cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 02:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786094557; x=1786699357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TXEizd0UsOhU+MZfiQQUd2IUV81zhg/D6jvHU/Pk81c=;
        b=Xy5tEWVkhElbgkzOY8L9o08BL/SVGpT+fTwdGQD35EuQe5OdOhnYm0NNai+M4kFa5O
         MmjtFMpUtkSnXOScEmcIJkXp4qGqJ0LCVxOPr2uazhPnZ91qLozGn+SWMzjokXywFgmc
         lQx6u4eEmiBWnOcAEzUTuZcgocRP6gFt2L39WVdwpeyFPED3KNR1EZJDmcSRXRKlOTCF
         /f6dNSRpKVcdNNh8josh3fAvmeNLqcaaWu9xfoDyatwDKsUsl2uA0Eq1BXjTxG24CZ3L
         caMCyDIPDiFX5156ICgdTmMdpbPd3O8Pl3iUXtBYSTxLVPatrwkm5F1WkzLCyw9j90+5
         TV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786094557; x=1786699357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXEizd0UsOhU+MZfiQQUd2IUV81zhg/D6jvHU/Pk81c=;
        b=NjHdtDSjlSSTVb/NzQA70vuP5mZHKqnJTApi+0PcsL6Tx8fxEjmUZpipiUyBLbgpCo
         msJdGRHgeseAZAwSdLTyKJRGPymYQTbR+wRziinPefrn2I4cBzMTF6pcDwDn6afGpfnG
         WkyHySfsJEBpg3lM+2C5A3IuxNWS8qvw9k/WMBZE05jgUQ4P/xMNeMrA+fBnyv4UbRFf
         t05qoVGmKuBIvM6FBkcQbN3kYeU6+IeSboornjrcjIBtG1NVOtdGBItW2GFfw2nPgelY
         yuwTqMtCSLehNGRi+622oI+YDKa/wIgJFDUOf38CtKfuOfAusVtg/SGt1T7kfx4/9uiO
         Cqww==
X-Forwarded-Encrypted: i=1; AHgh+RppxCuPD5iinXx6UA1OfscyLXQglw4yCz3SQp3KQWHaKGphAJ2Zo+frWuo/nKp5scW6niu6gwElJXnbzR0O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5nrvEwPYJYONq6iPZa6yqysxIUJ0ecm+Wuqh/Je4rAGrsuq7Q
	rBXEGCrvQMMst9dSdl4Y4OCOPHu+1b6B51E31Hek4iYaUVasIqCvlXODh3aVEfSCJ8s0tmvpC+J
	zydoJLCE7HYYMTDcT4S25BukJhstfPXi3Y1VzkNEYHp3FdumFzHYyvjNOjtI7e4zn2cgPHIbxyF
	jF
X-Gm-Gg: AR+sD11uCk6ObFyvN6IfbeICvQarO6oGz0ELpyUWpZqz+vu6KC1KJE8LhP0VTYWQNNf
	QbWezAWGhdLM0d46dCRNWtsEGuzJUhxrxRs6CGyv7LslDfgZLlY39YsOpgJOJWPFXyUXPobqhsm
	dzl5kfV8cge6c34bU6+gNkY8br5yyw6EhiIXNKNgw1tqHW/awonAI7UMbjXQLXdC5hvfViLGDzp
	mjDANgDoChhNb6U4jTvfGSI7tzP6wL/AXjslsh3uDjNTT2M13sb50me4mStOXV75a2ZQkc0Vfxi
	gPzYqNXtQGKxegav+hmKn9HfPuXR2xD7E8zwqqmsqbgCHPPxdNepL5V9Bzgo9Vz4XbgFvnO/YzH
	UNkMDf7kFAnyWwircRxLX43i7O+rK5poFDyWZsFM0CRE19pi8YD0AUz04M5pVhbOxIvaBAsgeWe
	F6z86EmySl0oNWvg==
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr209192751cf.5.1786094551750;
        Fri, 07 Aug 2026 02:22:31 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr209192471cf.5.1786094551281;
        Fri, 07 Aug 2026 02:22:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda7f4b5sm2351931fa.6.2026.08.07.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:22:29 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:22:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add eDP display overlays for hamoa
 and purwa IoT EVKs
Message-ID: <eemtq4i5xgilmy2g2ap7d3vnvgy2yucttwbujyhnn7otzavbrs@nzg3zbsbcszk>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3MCBTYWx0ZWRfX2RHv4f2yAoZ/
 nPqMMK4FzuHGwYzgP5twDzoi4K9r4CMse84XBTNqaOqvU4Vbq642aXghCQz+TmKy3AzkqNcy1eG
 pBo44lErWz/rIh+9Eun5/mowE0a02oRyPf26AXCXUH4O9ep7c2h5D5qw6BwjmKnf0SQieYnizvA
 IQVQu7GY/cIH2eS51noE1L0MwqNfzZdEWSUHRb+xR7DhmrICy1UT1CJJiCI8x9+wAR59bcj5KgH
 U2sUfJ5xnL95mdJ57e/ErCriGU7NFazs97F3W52szKcR+uHLXbCyQ7dm7qzVEsiDfBo+hqlu1Vx
 GLdDkiwLI5uNB40cuRZg86ycM9fFF+FW54tMhz6w93BQLCjYinvAqsI9fAhMxK809TAOtFFzbL1
 68ITfzyXgqj3ISpt8pcDY+7SG0pQ9gr6g7DW+HFT22Di/timObE9GzvgI9awpyBb/aMyoJje+sR
 VWywI9buEOLeORuJGCQ==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a75a3dd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=FZbN8ehnm3fXj2eq2-gA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3AlqeahUZqz9ICBoZfN5XbiGDOM-wtzl
X-Proofpoint-GUID: 3AlqeahUZqz9ICBoZfN5XbiGDOM-wtzl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3MCBTYWx0ZWRfX9Ltr9QbAa4v7
 +wVVOOwVK6JNDyTUwAUv6Z/waZczbOk7ZNc3/HtT2MqG6E9ZLqO79dndRkMt1iXsP294hjHmE5v
 XYiREVtP6/iahG3wcgNG79f4fb3LmrY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070070

On Thu, Aug 06, 2026 at 10:01:19PM +0530, Anand Tiwari wrote:
> Both Hamoa and Purwa IoT EVKs are available in headed and headless
> variants. The headed variants use an eDP display panel connected via
> the DP3 controller, while the headless variants do not include a
> display.

Is DP3 routed to a connector or is it unused?

> 
> Move the eDP-specific nodes out of the base DTS files into separate
> DTBO overlays for each board. This allows the base DTBs to be used
> as-is for headless variants, while the composite DTBs enable eDP
> support on headed variants.

-- 
With best wishes
Dmitry
