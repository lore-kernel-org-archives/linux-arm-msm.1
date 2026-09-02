Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED81449B1A
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355593; cv=none; b=t7S2DoCnEjF26r/J7sbT9GCRlCAs1hkxBD6jZTHiyX/e/pmd2OBVD1vJ6my6CBQrt+ScxVAuasTtPDicjI2velg0WHDbmUjHm6NzQwh7n7a1JxqolnOInER9bvJBFVU4TLFqCyAshM6hkQ+ZbpK0eneU2XMf/+2PjjPx0OvBSgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355593; c=relaxed/simple;
	bh=IOYGewLhDOFm4x0hRfNM4AYVD0ENzMjIIDCNxqGXlNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTraYJ9zuvinAjnt7I0H4sGVzIIYRwx5qQ0kr5R/1RuHx3nXgaNzEc4+ljGW1sUrNHp3tYfAt492IH01YE9v/Py8uM50U4BP0/phKQIOL1xhldLuWFc26hXvje7YDAMVsFmHVzrPxzHMhtZq//l9OKqRI37+l0JEisU54d5Ovx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqQzVKqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtFJZN2r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqQzVKqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtFJZN2r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRP2x2002273
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 13:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fr0qc4FAUTiDXfo042zfsBe
	8gb47pwHgpFgz0s03Xo=; b=EqQzVKqvMp977hnDfUJoKXWHcl0xIlPx7Sr+CeEi
	zjic/9f3xzMdGaaJWM7IlK1gG2BWNi7EpJ5+tVvGLhlnE/OsVRcoabhNQq40umMo
	35t2Nh/JsnmDO41Wk+TUj8NQn+t3IMibAjj6I9XTZv6hiQybJduUEQCrfZibMVPi
	o5uGj5Aint16kYgkEfYWSwQ3eCpUKff1XS1QjHf51m3LlsbZrisEjKa2aEkMTrYH
	29Z+o2KPdWgW7/2EHOzgjJ92Z7P0tmwyu1M/wA893S7vba0bjZ0mBnVtBvdFiDtR
	k6ctWy5xdnXuapB7I15nxd3cxwOXpwkrbropD1d3FZqq7g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy0yy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 13:26:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e9bc1fb67so20523946d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788355590; x=1788960390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fr0qc4FAUTiDXfo042zfsBe8gb47pwHgpFgz0s03Xo=;
        b=RtFJZN2rWq6e9eZc+Q/FeUy9sD4VJD00VxSwYj6HIham8vurkdIMBJpInXr7CwqGyA
         uII/IGrJsmMbGuUKsEJ08rJs9rpAaMf3XTvQzTWTXX2Mt3Hx8hmpMRHoO0hKrOBOyYVG
         snyZrHkymbIoTr36Q1Yglj6mKieUSNmXb3AxUg9+VkwD3CU/CoFdkdhU3E0o2UMjFgbS
         ifL9Sj3vha1JSpd9qFAdBd2s/ieX9mlMWNryAMuh6sLovx43CUG6PEWdrbx0Z8mayp5Y
         OYznsosqD6LkDVWvlZyI4udfEvpGS8y5VJyCGj+g6f2aIsUVjNVaG71xHRZZU48p8NdU
         Omwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355590; x=1788960390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fr0qc4FAUTiDXfo042zfsBe8gb47pwHgpFgz0s03Xo=;
        b=b2FqCIR8LMY/b+UI9+b1l6/ZHZI1rh4rEVTtKswHLTOrnNrl1BwDIT+D9lHaHZ4Z6p
         I20z1qQEqq97UJdosS9BkMgrcNuIEsglF1aoSjTpfolqgfTd8ttoCjukp+NCsdJ+zIef
         uxf2EdvF/T5VF8fxastLVv0slGkYWJThqJ+AuCk3hoCTml3uNaDEmmmFXAilvePuWiR7
         1KLgIWO9dIUS9nP/lyb1ElFMZi1y/WKe1p+uYSGZm2RtovDv7Vdqp1w3+YBa4ajtE8pJ
         ZAFYoqPsLLn3bsNCgWMXW0YmZvUCzIV+LFfDzyZSzKtnzhNdDZiOc+2UQJ+2s3emeE9J
         SLGw==
X-Forwarded-Encrypted: i=1; AHgh+RqgRUdJycKYaBwKTcHSzxvgQAIbN21motJzGIrgD1rHbiqNPL/CEszvqdtUwq8N3fejyqZvxDjEDMRf8C29@vger.kernel.org
X-Gm-Message-State: AFuF++n7EkQBPRxHIczI/2G/1YNcZfF0TV6fCyyyqZCNqou2BSjDlYrD
	D7retq2XfWaox3BhfH3Rh5Qk+LcZj5VNj+P7YXBWrSyR7RHl3NhSEvfrbw9q7UU+rxUUBDLBzsw
	5ZBlH+gDkl7U3e1ELAHSaPTi7XkhlccuiVGNEEkOYZVwJwGyIk93otzKN+otJg9p3e7vz
X-Gm-Gg: AR+sD10wlLgfZfMk+hI6XFRXRQKt4qEDsHw0tb1XJJyfMrGpNsbZKQAGl7wk/je9Z83
	AxW6ZLaUJ5qG8WCmN05dVeYQl2BBZN6TW6VKQZmQKHujy5buU2nnh5XUC58BosSARmFZsFRQ/r4
	aXhwiP522kx8s+ZuVAJcqfl5/v3xnKsk9iMVjwwxmBFgQa9pGnoO1q+11AN6xysvBcj/IGe1T6V
	Zj6sXO3nRvhirX6JR7DdixGIihuJfusqeOVcjYe85bRWQ4U36UJ9CGB6cakyDFY/nHIFRd2YbR1
	/cLW5xfqC5E1fo89RrdLbeolDYffwf5X2Zy+kaBnlSg8G/8RqvdLZi8fLUMqgQBg2qFi3hwzRtJ
	KPMDBzpk1y+ci2w==
X-Received: by 2002:a05:620a:a191:10b0:939:2812:8bda with SMTP id af79cd13be357-93960e1dcd2mr457336885a.16.1788355589651;
        Wed, 02 Sep 2026 06:26:29 -0700 (PDT)
X-Received: by 2002:a05:620a:a191:10b0:939:2812:8bda with SMTP id af79cd13be357-93960e1dcd2mr457325385a.16.1788355589014;
        Wed, 02 Sep 2026 06:26:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm6630997f8f.24.2026.09.02.06.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:26:27 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:26:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-denali: Add volume up/down GPIO
 keys
Message-ID: <whnzjy22lzm6ln7qzzqx5jinmaxaronsafm33cej5ox2aeo2p3@ctegjf3sdmw6>
References: <20260902-surface-pro-11-volume-buttons-v2-1-1d893c7b5440@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-surface-pro-11-volume-buttons-v2-1-1d893c7b5440@gmail.com>
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a982406 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RsaAdo6knjiJn5qj3ScA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: pBQJQTGg2hWdOEzVe4ObZ4qFSlKpUcSJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfX+iwwHwYlseQC
 kjb0ARV/2cPrXbzSrwB4mFrVMRpgtGM89VRhHb3ibA4G43ey5zLGdJIi7cqguuaUuYd2Taqk8d4
 8aQMjl4tgLn0Nh6t6ca5yAGJfaFkVs4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfX8kirdYMAKS0P
 7/Vp6P2IzabKhnLdyPcLR4ODv7OatIf2G5d8TWF4/bGmenDgRZu0IiaNSoQweFR32MYydm4+kCW
 NDh2wWIKpHx0K/l6l9zMJsncsJ55fAJYePygAm6JB74Y/HsqMM34pnYs5IERLt/20ufmJPqMQJj
 tie4XgiUitpFe3TWVyrhhos3SWkCq17cIDxv8S+hJPk67lL4EnnzTMNAPhefo74tjpZJHsguq20
 h+QUt1c3RfJ7flFwUWa9ifhYFF4loyV9PR8H3v2qCXz+LyFzlYu7Sgyt+AiN73uDFBJHlCmSnT1
 1UsnJhHLmj3XLyf6q2W/cEWhP0e9b/aZTQWRehOoNQyLUNUe1YG+pKnnpRCahBDgF6X0g8ee/0b
 yLtSXsP7OsfW/+qn5MNvCY+bChCzU7HntN92tMKgcoQyx3lEIjZCSrVKMAyyOU2/aTojClggcF8
 Qx4L0M1bPqEXjp5dF0w==
X-Proofpoint-ORIG-GUID: pBQJQTGg2hWdOEzVe4ObZ4qFSlKpUcSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020119

On 26-09-02 13:52:36, Dale Whinham wrote:
> Configure gpio6 and gpio8 as volume up and volume down respectively, to
> enable the volume rocker located at the top of the screen.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
