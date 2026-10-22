Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663988;
	b=bNaQ2BpCTUuvpjEUEWyiE3/CYRLOEYinoOnShOr0msLm0vqI5aA9AN+f4u/Aqg/D8Tqo
	 /PgCRiP6dCPsNeeeSMo7IOpM0MTDhPuFQKwzx/a8Qmy8HDJI5jCkawc1KGClrUs91BaAv
	 IDFj94WuDYnqIl9b9PyJZcecwcUxE60VnCZOZBtyHaVSbwUqIUt2+byEP7iKBVpVciLrm
	 3vBwR6o6TwvJoma/JrYNBoLGvYEn6xt+X+kTovUqSL36enOTYUsxP6pTqtMYijkjHHNER
	 /DPFDiIDOeYzLknAFHZRQ2l3MuVwrc2RY9nn0mCsYeC6z/sYdB2qo/zo7MitCvTnRYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lc4RpHjBbggsGE6BQ9ENCcFMCUrX4E7aPdKaqKzrj3A=;
	b=nkE57BZOT/t0ncajTuig9lC/pub/y3o8S0yRkTcJfKkXCoLiUpQ42w522K3yCIEQeEyR
	 9WJXW+YiEEsA2rV6VwhKZ4I1gFtcZ9yM7GSPHeODEQBw4ihSrthmIqwRQ86Yg1zwQj8pH
	 sWy88M1iT0ZPurR6xvfXhiitROfPTjHH4CH4plEU6+FrdTq0KjS4i5DG7k17LIFg4t5Qi
	 QPtyXGyVSouH/MAGhrz3avMit60+l98+ncrPIso7Q6gudBy60f1cMkqnK+wRlEIPEsi+M
	 3cGQmcBfOTGFlFZ/XAvo+9U18C0ykV2Z0rJcfNw138gTiZUqvTYE96w2Ulz5gGBB01Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jmp1SGKl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WShl/Em3";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF093606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF093606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jmp1SGKl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WShl/Em3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA05YM3427015
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lc4RpHjBbggsGE6BQ9ENCcFM
	CUrX4E7aPdKaqKzrj3A=; b=Jmp1SGKlOyA6TeaW1G7X84+B4fb+5UsDjsPVJZVT
	lJJD6oPavf8hKUrCcJoZHe0oQm++IhutkQKSiCtOhNsGfvvGVpIrtVdDdNJO0OlR
	V8CQPhumSfEZZpB8br0wViembKYiLk4ChVZQJuv6lSCP4rej79AuYy1dfBfU/Qla
	T+6W/ZBEgNFTDlQ+CwK+DcalLqKEVbGCZtK9kC2zGrarqeCN52QR3gOMzoLPOTkh
	ihPg/9hDf0O25Z5wqj5RbvkCehd+gtRIZGnC3iNs1DZiL3fYbwpWOEkN1KE9jSc3
	tl2C7LJeUUxjjxIfIvVYz7PKPhLtShQTG6Qr+PsF35NgnQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0h5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:13:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5352436cd78so18111671cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663986; x=1793268786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lc4RpHjBbggsGE6BQ9ENCcFMCUrX4E7aPdKaqKzrj3A=;
        b=WShl/Em3RcLXVj8SbGJmsMEzlUFzXKH09Vo1iGc9mXjNDiM09wZ3wTizWQ/7vd9Ctv
         oUzoNB1Fbt4ul5OU8Dx097br2fqA3+SCdWq2kM2Kzwr5ddP5D1VAQiyVxxJTRHcwW2mB
         orflBSg7WfeTcYnIF2hu3Ky/d3+BADrqrwkgUQmxMPJVaXracn0lhjw7y4sq4SaaffjU
         Qpuw9cBvFqdg7psWv2HG2VD1TGQYhVomBQFC2VKphsBz94TBtLklMJyoiLsTVxwVQCvO
         tfsBKq4sRweKsz6O9YCMyCan49MsCfGRCMnwNVTDmXK4CdceQoTAbkP/XviULV1gTPfk
         RzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663986; x=1793268786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lc4RpHjBbggsGE6BQ9ENCcFMCUrX4E7aPdKaqKzrj3A=;
        b=GOscfUYh5L+GBoBDXHgJpMeycBVVMspsJwJVEEVJ8xMZsT5ttQHd7r3acMVKWbdodC
         QQff4C8zc0in56Md/NsBjrO1SFe+++dy57D7/qXSrbftaClg5XewwSLoKlDY/ZzxP58A
         kIrkqCwS/49nHnDtdJpmtI5paD6pOWFBQeRG5SiG2z7aM2nxu6BNUVfW6i6WI89qh1io
         aMHriK3PVcJyFDUz+h/FTiPgBEx4l+7bDcu5YIcncTFpO93jWutnGAQ+Mk+neNATXaOc
         5wO1TeNVSuYbVLZwPDEc98nG+WhS9qO2fKsMRd/5JxCpRz+ROlBMf/Gzx8P5x6cIENmj
         sq0w==
X-Forwarded-Encrypted: i=1; AKwUvBwbhEPODeiz02SgX7BeDLPn3lCqb6Cgry/vEbJWJDvcvRIaVic6WLwoZhsh7IuanoLLkUp8EaYFbiodafmQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIrRmcXRZZiwmjIgJkqRfC1JAXFwrZtYIZaMINpZZxdnfpdxOR+
	5l2meBDA3GPolupKm4mrUpL5rzFVubxWx5pTFlikes7CHY8hE0yomosM3u/RFN3hG0nvsgIB0dK
	CIpo++zlASAkR2yHTExFkhG3QSj2bsmlVQ59qgwC0R27NvSRe0541F/jiPF2FHXino5/F
X-Gm-Gg: AYBFou0k4T6IWBKWSvwHruP6hM+VsPgPWTnZS7Jkf+aiKsozq1X/PfMpPKXteiErm03
	HKg682d+WTfYtruCikuJ0TOvkuCrpvLcajhrrikgJYpPHr8pbGIgmUczNUoSIg68lLy/4pzmG9R
	QCIxvpTkCY3M+L14nXLh5vDxsEONgc/+I+HEr4ueQYuGV97Ts0OjLSR76fG16XO30gh4BSILS/O
	3rDgva4XVSmiuT7xKHSB3TAIHHEt3V90Z8NrXYrT8x7s0aK1/QeA+ewCm2amv66jCmbsynZzV3o
	ptPgYeReNG61LsBOPHXGxA8TndTxhnH36YxYGVGi1vQIlLNUAbYlHMXK0wJHUGrAd/L+cy2frpJ
	KPMrBfSr8R7zgNVyPymYiH8mImR1Hdi54obNJf2SleJjYFVYn0dd9mP7sPsLyqv/hH6h1uXfuof
	tjBNKpUtJjgG61
X-Received: by 2002:a05:620a:6087:b0:93c:c08f:ecf with SMTP id af79cd13be357-93f57f93b69mr825261885a.53.1792663985740;
        Thu, 22 Oct 2026 03:13:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:93c:c08f:ecf with SMTP id af79cd13be357-93f57f93b69mr825259185a.53.1792663985280;
        Thu, 22 Oct 2026 03:13:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa4b90999sm562304e87.68.2026.10.22.03.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:13:04 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:13:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
Message-ID: <d5whwqc45gtqwmb26mh3wi4xdls7fm3wxdszo43qb3z6rhnj4o@22ghfqzuryur>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
X-Proofpoint-GUID: -5YwrtGiES41gl6lNCj5y5LvcbnDgmoy
X-Proofpoint-ORIG-GUID: -5YwrtGiES41gl6lNCj5y5LvcbnDgmoy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX1Y6ZW3/lv3Pz
 fKhi4YTSsfZlcZdlBnvVyfY8Hvz/+lPqe6jVkTyINpUsv5gdjFSA0jTLcnrjN/lZkJmUH3HFVb1
 HkfywnZiPnKGLo+X8vT722qsEtAS9kw=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9e1b2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=S65zN7q3fX_PurGuIfIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX4zoMMHw3g77L
 W2BDFRQXubhCaNCrKJaInTSPNOYtNrtcV6EmcySB2BPQU9qg89QAvt0PTNOxJayCv9U378GVlBk
 SOzzw71FYq2X/5S4xEFT4w9aUko6oHURNIEt4EDnHq3pCmBs851qaNQ807Uqb26xbGApujRQXH1
 DJj4MmOxMnQnHtygVYIaj6UlpQg+xM/WNgdnLhv4k7FYI7DFB9pkGnvHcf3j3PDUgIY5bd9Y8hY
 UicZbj/8c2c0PbIoDDbNvhmCdccXOomXG1hztZGsUaGKzCTyGg0fVYUtDHDPoW5Tu1Yel7tHb4j
 zftCx5ywUHwIVQ7Avnqsmqnvyr+T1Eoq5D/XPE4d090H2eVOuI7mrtFS1mzIaTtilCqVo1+Anem
 5H1Sve93udi67K+KN9Xnugsp0/4EUxN4uNVWb9BtanH0EYice8/MpDPEuNQQLOFMlbV4iU+0IKO
 Yoeq3F0XcpcivLDwt3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Thu, Oct 22, 2026 at 03:19:44PM +0530, Balaji Kalkonda wrote:
> Add the DisplayPort controller node, including its OPP table,
> controller clocks and power domain.
> 
> Connect the controller to the DPU and USB/DP QMP PHY, and enable
> mode switching on the PHY for DisplayPort altmode.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 90 ++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
