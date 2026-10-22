Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664041;
	b=Y6Z4ExcqXx7K9seXsLK3Hc/yh0PxSBxBE8XhrD5D+dyAbc0ykxpDEO8Xrm60oH1wpVxe
	 otXAHa+mKhArwpTkBR4H+h10z0H3/M1hOCK667mzQi14xWbz3dcuxTjsbtdHyr48LAIZ2
	 sRaVcEn6elArDcUwDLs6zFlG4YvLUa3yVAF7P5CFLxKnFS9FporIXo717nWkpPmNOtimr
	 kPpFiwSTKyOqTmI1h9ks/UmnGu8gNrTGfqWPBPnuVMFcK9/MEyngQp28bylU1ccRncjc0
	 2aPsz3ZE84LVcq/mvnHmQdeQvX/U6gxRDKAjcpvh6nIyJaBkexkv7Jmjo4N2B0XblTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7yWfrvru/Q1OyZVwkw14d4BtxF9a07L9+eZitoLa27c=;
	b=5ST9nBLykNrP6axodhjXqXckOIf0xLfiS3PgwzlERyrD8eJexPqe4xsKcQ9DYragu7OS
	 cmhpXPBPpfhLhFuu+MF18/qcGyjbZqK56VaJxWgB2NQ5gTBacCVcAkB0zHKoA9OE8XC+R
	 VuBYLmMTbSuMDa0xHf7oCgtWtlPa3iEfiL80RnLRtxko+6yTeIVOLQRhH8DoYxcnJZRGM
	 4y/uRgQkNGloZPRKUateA5WeyxRgKucLTbuXrnTvQC87SYk+zA9SBR5dffry95B6pJ7NV
	 dylLsq6ovzKtVC6hWxwd+c2RMFVAZ+nAwza2Li8gqN1sUOFN4XXVjqJrFr+/ppFn8Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoOfQDU3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0q4KltL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2722606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2722606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoOfQDU3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0q4KltL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xqla3478830
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7yWfrvru/Q1OyZVwkw14d4Bt
	xF9a07L9+eZitoLa27c=; b=eoOfQDU3bRY7mAVH3hmtcXkjrdH6IACjn+phqOdC
	tA2VafhU5tiJl4E1ugTgm8zVX/Lb/EUdy3ReAizStqNLvcpQC/FFTbZv166DoaDF
	VhIzJv3gDis0/ejzom7d0KDBQIRlYdbiA/ybY/fuKsZGNdI6KCcZI28eNyK70TDh
	wRqAnTRARMOtffz53zEmZVtNjIwR1jvPwpdmfADsIf0MnqGO0ojnRbe47YtE0eow
	XS9tQ8dtDz1M1nRIPmzt3TkRaveAOEHZBu6ng9TijkLuOh5HIOvUlQySei/HRUiP
	lS8vRuZqdzQbHPhbLNCOAzhOyom5uSivP3+lNl73roGr9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1w2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:13:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so193651985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792664039; x=1793268839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yWfrvru/Q1OyZVwkw14d4BtxF9a07L9+eZitoLa27c=;
        b=a0q4KltLx965qeQ6BcssIoLXt46Ay6E77xNE3KJkvhtlyHucHWQhCypsWCJzZ2RnUx
         oHRWGhzno5isCgxesev1MONXGyJ1CRoKS/yj8f3Mvnbd+laC0NilrmZg3ocVFaV45V0g
         8vbgV19B1oYD0XgE3+lNKMcSWTWtiEccHY+U88ToRr250F5sUcoynqsIYda6+1d77Pvc
         4cp6tITcb/96J+iInij8vXSejN2SdSF4ELOT2NI6/zdRL+eWG2U4C2akpK84f8JyeZcJ
         YGOEmg15vGQCmD/yxoQsq4z9nvCjagjCNOAcZCMh6qNX09m1RzpzRu7LRwSxyOCRDypU
         BH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664039; x=1793268839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yWfrvru/Q1OyZVwkw14d4BtxF9a07L9+eZitoLa27c=;
        b=AuFWY+hQRrjiY6TGA2dDgmq1WeM/T8VF76CLQ2TjUdTUKPR2lMC/HDI4siKv51wf2b
         CT2Y2/CnfMaXCt578yhJOx2YVFJqde0zCqpWKCRM2IbEQ95pk7L0tvgirdgWvPZd470p
         JMjIMl5ZnYAHULg/P5InxonwnA/Z9J/JcbQqlroKPb9B5lvyMKhSCbHWsfU75LbZBP79
         w49BdOBxzdI1Nmiwoyf4WNrEZ9Pa7U9y2PfNemERGUQ69OwWaTe1vusMYNARgMYa3Nga
         3fBy0Hm6DTHYExq2HSnrwZBv+CFi5I+WfrN6rADVdkquwsCUJFlnI/WGvo0w+dBBm5vJ
         R9pw==
X-Forwarded-Encrypted: i=1; AKwUvBwgy3GP4+Y0V4c+bKABIe8KmSNe3eb64K/8f5akSKCgV6gVL5mIqW28nTsl9UKS22L2CC/L8zzSlvbcyL0e@vger.kernel.org
X-Gm-Message-State: AFq9FYLAPPMfB1ciFpboiV9Rqa4dmgmoSvoeiiZ6OSnQ6kZABPlQW30v
	sryOJZtpo6avCQtK/nvML5502hvc1LrE0U5l26lc2hDKg3ZLbCY4PfO09nnni5j5jdh7PvVwklG
	U5TOEusUGGVrpflvoW5ItXgmVBHUoowFfiMT5qqmmLClSiTFAGaGS6Mb0tCjNQlljphNO
X-Gm-Gg: AYBFou1okh/xTGVLV40DjeMtlHJd6GOasOB2Vijnnm25die5aSOm5R33RCsPe+U3H/t
	8yFnAL0S+K1zQsgfUT2NSZVLAU3PC3uvMwpYYCn39mSxvK18nGH/znA/Yx7TpGSKtK1idPFjtwx
	zBMV9uvJXMkJECXgwnlQetdf8FFgeFbw487aLZbMED1EmAy9snK+TAPaen3Ibh8LCSLZsGWjyhH
	t/kOQqr67n0UEwQi2Tx/u564fAW9sTcbS7vVmmlLnbqXx06YzFUBohPcmqbmiIGlvcT3zPwOAGn
	tISa7qvfbRxxgBQlvqrm6m1nRSf8RzPlfPNKmw5B+kgvyGNEvqJkrSQ2lWrErdq5rf9o/39iDKW
	2g2rM3Mv0M2ArBZkf9MqBxJmghUqCDn138/HEatMu+VVHwDasBdNkadJv9/sbw5Z1WBXaUC+Yvu
	5VoFh6GqPNQEIG
X-Received: by 2002:a05:620a:45a1:b0:93f:32c5:69b0 with SMTP id af79cd13be357-93f57fa3df6mr758335385a.60.1792664038684;
        Thu, 22 Oct 2026 03:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:93f:32c5:69b0 with SMTP id af79cd13be357-93f57fa3df6mr758333385a.60.1792664038225;
        Thu, 22 Oct 2026 03:13:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfae6337dcsm16234e87.72.2026.10.22.03.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:13:57 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:13:55 +0300
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: kaanapali-mtp: Enable
 DisplayPort over USB
Message-ID: <ygtcipnjt7dxtkohaolkshopuvxigfx5gxpedjqdudazuk6qhi@t363kbfe3c2j>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
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
In-Reply-To: <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX+vQhgpm9TnyB
 BXHGhlkb8jfEuQoLazKbogAQF8kuZ4om3+EHaoWT+mnsvGDcicz5bYvJ26RfezpytEu4lIZCs8v
 UUuxrlw4umLzQRHkonTqcQcC7Ozap/Kj4to/c73xCb6Hk6WEebCuTqhxAbL23buSInn7iadbAZL
 TiydPaOSzRzSN9sFI6TW9GmKvLW3jbXQyvsvkNRdjxsPaq9aVRSZATZRmAYDfAnMGRJsHn9Twl1
 wx2BeEiQPeOcmPwyHnhByW6hjnivjbdURiGP9gaBuQRTpqbvd98JiZcIg6KnzW+Py04iPRwoknT
 sMUAFMBNb5w4dGd+uJvxDsf6lOkuXNDibXUSg/AnU8wzOPBZxNgCSKEfwswt/vwNri8SO/hcVZb
 P2BbxZpxki5UYpDom/7lglh74LXAVXSrdQ8S6iRs6RClpzN3Y/Ab3ZF3YsxA/4jcTyB19YPy+Ov
 1U396xncciu5+yT6gxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX+Ni0Nb/T9fNS
 LPBXA5DJg0CXdpQ/2Cz9g3F1M3HZKSgcitihnFE/W2gkv89Kmf8cYhUxS/P6zXuilocEFoeD4/L
 hJE0/TgBHhC/ZyWWKPgf5PMT6k1lClU=
X-Proofpoint-GUID: lbS_ONmDgROjbCeOl0GNvQaeUrJvH5aq
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9e1e7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=tbCzt_ceUV_s8fUbo54A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: lbS_ONmDgROjbCeOl0GNvQaeUrJvH5aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Thu, Oct 22, 2026 at 03:19:46PM +0530, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
