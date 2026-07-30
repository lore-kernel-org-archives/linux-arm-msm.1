Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E73D410D13
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405271; cv=none; b=bLKDq8BBRitrgOZXBAec2BpphLu2rcNY/1WP6RfEPW47PxEl7o60oBTPSB/0PwSL4mrdNOdlIJCaDGpk+c0jbpuHbr9p3jLYmdtAfeLYn6z55WXyUJ2zfCZzNrODdAd9oee9EY8D1yZoo3+HZVQZYagX1uVnRYtDCoHyYjkhwzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405271; c=relaxed/simple;
	bh=TWZcaoYedN9vt318azwnKiuxOwPacA2PqNrEVyKTDPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wyw4yy+kd4UWB8HA87RHjWfv0YuXxv/qSzD+qdDxSguYuqgzszgzbuiwwlsE/BLZxfisAuzTGdg0MHfuWkt62Ry0AI3N3BNGZq/n29BKPcMnEp6wYCY9KdXUMSsSyvoe2er+BSuH6TlT4yqJ/iQ56sjptWg9rlZCYLset+nR8TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoA3zj3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjK8UcgZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoA3zj3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjK8UcgZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8smBv338416
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5Gsqudw6nv08tHMDqKGeWVj
	bE239pjZrounP9ra9MM=; b=MoA3zj3lm11svcKrUAGVVlVpivvAbaJIflscSbW7
	J9myvvmCrbUmU03zw+Byp1RlyQjXzrSqt1a6l8sO5++YZNems1csp+xKMPNRAjVN
	78RmWvLyYo8QYu53v9n5n2GGmNUEeadPmpMKyaA4SCfMtKIYMrLouLaVgqntI0u8
	9+J9aedx9lNKCyRdSMTFh/nOctHAVpUHpxPJQBVuULpg2j1HfjQyGrkJMv0Y2T0j
	cT5BEbFH9oG5tcKZX47Yf1YFVCF3Pt8inEJkSQpRUaPJVoQF7wqKJCxmp+DqYIX8
	hmoDmXqDbORcmY9An4nMtjI4biBxQ1+cTsu8hG2NRf//pg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3h4r9cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:54:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-907e49dbae8so17340066d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785405268; x=1786010068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/5Gsqudw6nv08tHMDqKGeWVjbE239pjZrounP9ra9MM=;
        b=CjK8UcgZeM4BRcrJdjlbuDUWSS/999FgUuvEXt7/Q6rXJvd/R4juYm3GXEgHECEPso
         Jh0QEyY50NXx75R+1ev4bCRWM8JDAzOLAJRtP5PF81HhV/RV/neHK/zOvmMX8+vNLHAP
         yH7uXuyCbvcXmvWd7YwFVBXqVMWENcvnLz29z4JCWPR16tdw1jN+es3FRZEXV9MmyGWA
         xfmwLsei4DNsY1CkXkX7an6qREBAmKuUkNa7E7zOHvLGBFhg6x/Vz9gPlVqbwVLETffC
         ur9xygPaFHzjFeTKV9ff9SBPaaa7/gUfXKIE9MmIVg1P3d6kIfhUzU8YoAdx1n53uP0Q
         Z7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405268; x=1786010068;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5Gsqudw6nv08tHMDqKGeWVjbE239pjZrounP9ra9MM=;
        b=nikF1QHWOFiixj4vSQQeF13caaL5i/ikuTvIroG4tWRq6Ns//K3o1VrKdeirLAL1Vq
         Xm96NDgyy+K3he5xhdFjle620YmAt4QHzndRsDLvAoEx5yLb4g/9bPwewg3/aI8F/2Q/
         RctFeOKHv1oZSrgDkH0RwhrH06nXUxm2CIUCnAyocAcDUQ6QUokz/Ye1Qrgo9wCtax9t
         k1PjAGC3iSjtxAGnoc2TtBtP1npaiA0QmhrmXhaNVu8r75Wq5G7ntZJzerwlshN0yo+F
         nXvRETFZM0gAX293fTLuEUT2ACj5ID7Pfu2pEUvznzEU/mpsqGJldDP3u4EVN03OWxWt
         dbsw==
X-Forwarded-Encrypted: i=1; AHgh+RqvusgJ8Y9/1v7F6YeiOOPCZ3w0NEUirva1niiSzNlY8SjuSE2sVp+V6uHzlvbeAV2Z1ruOaKZZW2ybIbdY@vger.kernel.org
X-Gm-Message-State: AOJu0YxYV1ABfjK9pIisOrq+k+Ya348ptjAvQiA3AXuyrzaDw6Uc3137
	XnSJbbpzbW4Wq74BC0ILgpKgq2AyyjXbJrbZOU4YWRAfDilLCyJjwCHLwuBti+gy4kGqjEsHX3J
	ohbbr6Tg+3ZYXVhZx7bv4+/a2HJzOgSyQVs43n+S/qJJ4GV6G459jTTD6Edo8M2539NEX
X-Gm-Gg: AR+sD128+p8G4p2L+YcuIgvobLq/vAYufMmGyosZJQSiroZcnR7M44fFIX7Rmujzpwq
	WgmVT2B2LFeq5g0rRiEnz9JJ62pop+hJqNidsswLfxbCX6m2RyIALb/y3+H4pcN3RxI4UIfP3Dd
	hGGygtdDUWWrw7G+J870XFkK7Flj8uCPEvqbNyl9N/oAdCDMrAPO/sZ42vqcVZ6msJRI7446Klz
	5bRqQpQqhZfjolvAkUACaew8npwpG34/kgezQV/whIvs6Aualge0xA3xGfELtEcPxIcjjr3ovsh
	1SUI9TN1UOJlD1M8LXpg4b5Ev4BHTOhR6czGqlmdYoJ82aNbcGPN9lv0OmMClZQysSjsjuGLbhs
	kORpDFplwRfvSI5BZGrWM9YQ2YSuKjXE48Xa3U1zBIT1ryOwF4pNdZ106RBRopVI=
X-Received: by 2002:a05:6214:5b08:b0:907:e7e6:9544 with SMTP id 6a1803df08f44-908346b0d3fmr15445866d6.9.1785405267620;
        Thu, 30 Jul 2026 02:54:27 -0700 (PDT)
X-Received: by 2002:a05:6214:5b08:b0:907:e7e6:9544 with SMTP id 6a1803df08f44-908346b0d3fmr15445686d6.9.1785405267185;
        Thu, 30 Jul 2026 02:54:27 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9083231a56bsm14244746d6.14.2026.07.30.02.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:54:26 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:54:19 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
Message-ID: <amsfSzgMArno9zRH@YUANJIEY2.ap.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-2-yuanjie.yang@oss.qualcomm.com>
 <20260730-alchemical-phoenix-of-excitement-fff9bc@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-alchemical-phoenix-of-excitement-fff9bc@quoll>
X-Proofpoint-GUID: 6oXXF0xZYUecglhoW3hKtH5LF4qvdN-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3MyBTYWx0ZWRfX1AoOQA5KxQ5/
 p4J9I6ozoDTrkMPbAPmwAN6iSzI5TvYhIPqP9sf69VqfM/MAambtTEAO/ovupdT+BoN87ac23iA
 CYn09lArnnS1i/2HuffgoJjoErp3Pc6mlQ7wQG2WF7DhyKEsY3Rp2EwBqIAuwuEXtemNlYG4tHB
 4iBtKII4Ox9jagWdAU8RlGGoZVKgWsbfx+8fSG1OU2KV0eNTQtQWEFfRei97QEhKng5Qes4I2Fj
 A5j0W6LEQpWKdYKg0j/u+NSuhLbUGtPa4iPlBtQj8f0zKfpRHmvcuexMWnyfJiz5wOLX71F7QBA
 n64ZFajSzbBlYde3ns97zumtAIZkmIqwOCSpL6jUJ/xQB5LzpfQAYRVBtGm+2foNpSGg5adnhuA
 D9nUDBMzdMBlWpeSX5tqKoR13DWOm54dFiSVae5AkUIqJllZ9OnTZxN0QwXJ8Z9icHbTa1ooiFP
 oEpo4LDftKUR1THLPbw==
X-Authority-Analysis: v=2.4 cv=bq18wkai c=1 sm=1 tr=0 ts=6a6b1f54 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=TJUqZQk6AAAA:8 a=DTc2QWxjjepgkL0GorEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Q0W1slMkcave-rSCEGgY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3MyBTYWx0ZWRfX+1Wo/fm0j0fC
 9z7IwfkKhSkOZzYG3IbulRMwgp8sxAzlcq2vnBjiyJvlFz8pLH06V0WkjLDdR0gpGLKDKR3S0Pm
 pRwWxdduQuCUvPA+28AEK/ORayxHrA4=
X-Proofpoint-ORIG-GUID: 6oXXF0xZYUecglhoW3hKtH5LF4qvdN-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300073

On Thu, Jul 30, 2026 at 08:51:40AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 03:07:16PM +0800, Yuanjie Yang wrote:
> > Document the device tree binding for the HAMOA-IOT-COME board based on
> > the Qualcomm X1E80100 SoC.
> > 
> > The platform consists of a system-on-module (SoM) mounted on a carrier
> > board. The SoM integrates the core system functionality, including a
> > SiP containing the X1E80100 SoC and its supporting components.
> > 
> > The COME SiP hardware is effectively the same as the SoM used on the
> 
> Effectively the same or the same? I googled for "hamoa iot come" and it
> gives me zero results. Provide some URLs describing both.
The same.


Here is pdf about the "hamoa iot come" SiP and SoM
link: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf

The preliminary figure provides a complete overview of architecture, including the SiP, SoM.

In Block Diagram
hamoa come Qualcomm X-Elite SiP Module is the SoM on haoma evk.

Thanks,
Yuanjie

> Are you calling same SoM differently based where did you mount it? That
> would be complete opposite of the idea of SoM, so I have doubts that
> this is SoM in the first place.
> 
> Best regards,
> Krzysztof
> 
