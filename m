Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD8313E0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701309; cv=none; b=BYesV7lJjoFBQR/mFEIW6eotm59edOPoPoY+SAXwA6bdhZTgm/N1VCSpMQX3Cne3lm9K8fmNxyFEGiCvtOUbBGNBOEZSXcJZG9R89fy0aX5hfa99LYPWguL4xfuM+OrrQHbFEaHYp/bRblQ+EgzxvqE8FeLbFKJ6wVb6PX/KgCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701309; c=relaxed/simple;
	bh=0OXxP6sf26lNs2V3qfnLABobtN42cteBFXTKE+NyddI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTdwiA86rUzue2t8UTgMGCVZwxLILZbVNaJklpQ1oqhEQPc43om38iEaJ6EqCnpB6XH4UvgYwGF7UUXyPHllNm+7V5b40UiKUY28kmQD6AmHStSxOWKKeTDO334redXIV3rs7/pr4HJo2l8nscvsu4lQGLJvx1PDTq6jLDRJABg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RK++QXHB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evuPY6HK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RK++QXHB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evuPY6HK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53ung3996087
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fSR8cxfbjrDx5wDPjTiMdNNv
	rDDTqrjKaq1jOYu++oA=; b=RK++QXHBsod7F31zM41VJPW78anuEcvrhF9O9fda
	yr5w2RpkHjW93SkEJrr9oP39eedSRjI5y8UFilCSj8cGYFnS6tJ29cgVqJYTCelK
	fLpREq/iVKLchLvhlN3v0rRhg3af2w2YHziL485e4tOnAX0q0Y5F58TkEs5apiev
	Cp8BTulgIFLi02fimCPpe7s5as9/5y0v9Taz7YCHoX3e6gbhPtsJ07OGjjGRBKeI
	x1u4e3FhprEvt5qOGFFAs3pNTLuPt2rW+MbjcFutTkmwffTva545YVGQXLTEFn3Q
	+QuDeZDvKej+5xYFSfG1OuHMW+rRVeoESibDqdt7x14sMw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d2h6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:21:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eac2620cb0so169658866d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701305; x=1785306105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fSR8cxfbjrDx5wDPjTiMdNNvrDDTqrjKaq1jOYu++oA=;
        b=evuPY6HKMnfPs0PrFU9noCHxtj8TVrfJB1qDxqEhoJrSWqpwd1q0uGIL971fFCLS73
         ltB/iK72WIDTQxlqAKFN+Zefkt1ipoa38Tx0SxmU3Xyw/ESLOqgp1ZomKdM9sYhCLiKK
         wSuBew+kwUxsuiuMdPSSnF8puzTkmCqLvY5CRbfEHxRTeZ+j6Pj8Kx7D5QWIwgokyqgH
         JN+99yiywskZ+0kMthpoIwOYnp8tYxpHboqkepq9TyCID0wjSk6QRi2hVc1fJlihaDYz
         Dw96EkvXZwYFcOnf17jKzUkL1ECm1zusGPNE77g3EultBmkQZKCwVbMFcTd/B1dUzEqg
         W0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701305; x=1785306105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSR8cxfbjrDx5wDPjTiMdNNvrDDTqrjKaq1jOYu++oA=;
        b=J0Z3FQ4pgAMCqdbt8UOYZx9lFha4nXcggfLN77kLrpl525CJe2M9x5C+ImQzLpaz7/
         hVawY2KRXVWwepOGe/Bu58Inpy8FWiL8kPUf2VxKQhpDnl1XPjMLn9zgnpfCoy/msVZk
         qegBjUmlpaNNKHKgjHoEa5R+PLi7AZ+1wwwZGjCQpYgULWfmxxvitm6n/3G7FGUpY/uc
         DgnncQHxMGhy8XrAktU8k1XE6mOd14rqYpclOg/bradFjd+IIq2a6WRBKOALIFfl7FiV
         Ps32+0+P3yMeUth2EQeh3mz0cZx28iL2Pzf2ggA+CC6BgAZ0PmFDv8l/+NVlaOyLG+WT
         cb5A==
X-Forwarded-Encrypted: i=1; AHgh+RoNEzeOaLjowDJyxLbN+5JUeVG36vQIYSLETgNxoA9sfCSGInRJLv2ir8DZZEIcnm1Agn85q4wLbjXP3m2M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2wvfkNkLYh1C08K/NpJrTVKQWBSCFxO4HFJ622h/GYBz2cK2
	QXk6XeI2Mtc/4G1r6sXIp522qAJ517fNECOj55Yg3cnJsP3xhL6ASXOl12qNKyXp+kx7T0MD15a
	V3U8qWCSWTSfs559njpl1uQ3y3NDLlU8HN2Sl6xBTlgl2MYnZYF9I9OBCo0pTX9gL+V9U
X-Gm-Gg: AR+sD133MzCd2Qj/MCVMzEPyzxYziOH0h2rOI9YseUak/Z+lQli+4bLKETrHvtzB1fM
	m7EftKr9oNRmFUcKo921INneYF5pFhlQQVM0K1VxrMNshLXczuPuYe72a3P2aUJmhPDf6/6suQ8
	OSdDf4Yoat+run3+aqfBkOK1ihm2bEtEwxG30X24E3xFW0pekwn+njJhB+9k/wuQNj/0asnQkEV
	Y5BREqRd9HerFwP84zkSy0oX3aqUA5Nyq4LYO8Vxy3BuZMfml0fx91IQ7z9yc+kdlI3pM7pcH1u
	jEq90ANUY8zBI5GP70jW6y3XFFoicQ3iyxUlIkYLt45GasCZ/bTaQr/DduIVW0LLKGTTcsM4Ryr
	thCpQoM4Fcjerf8h71z0yfuANid52YDm68+1qd4U3rXu3L63pO8DbkAcJ5bjWPf2GDwff05tyWV
	8fZiK2PZbOsUNiJA==
X-Received: by 2002:a05:6214:b6b:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-90778387d8bmr228608056d6.29.1784701305481;
        Tue, 21 Jul 2026 23:21:45 -0700 (PDT)
X-Received: by 2002:a05:6214:b6b:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-90778387d8bmr228607816d6.29.1784701304957;
        Tue, 21 Jul 2026 23:21:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6888591sm2595881fa.5.2026.07.21.23.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:21:43 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:21:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in
 qmp_v6_dp_serdes_tbl structs
Message-ID: <sjvy2u27dxljx46iu5pqvtze6snrqnljmcs3c45gt4ckeuhwub@34mbkowlmapv>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
 <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af>
 <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me>
 <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk>
 <47b1db2c-6314-49ce-a7b9-f68eeb022295@proton.me>
 <zd5wulhfcw7vzbwaz4akhetbqqub7ygsmexuswkdvzxcfmqvqa@hom4ax54efft>
 <8066103b-e1de-4b20-b21e-533a6cbc2bba@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8066103b-e1de-4b20-b21e-533a6cbc2bba@proton.me>
X-Proofpoint-GUID: IbX_idYCgeyyUfjAlQP7R2xR8LKPW3dW
X-Proofpoint-ORIG-GUID: IbX_idYCgeyyUfjAlQP7R2xR8LKPW3dW
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a60617a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ws2oWbXhS7LMuVARQf8A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX9rNJWF/gz8tO
 SAF+Y8PiuULM4V/rm+dmDns6Jq2K8q1OmjB2UtJ6FOtylphSLZ4hlpwz1MEjINBOOQvPs0kWsc9
 1ZcOJBYYQaNRIZtGRjHUnJ906tmh25EhJ6Gec9VJrIv5OV9TVdKhoMsZ7jvjURIqGq4ZTkGwrLO
 NbMNoNruUkd+9XshnFDoqhvkgTn26OGbnv38ZlYNHV+9DLIp4oyq4JKDc7z3zw/mwrqogwXxrql
 AFEr5VgBXllvCshttU74MYp/G1L3o6Cy+Pv86W9dUjiF6/CiFH3cRlO698FeJbie51lxyV/iPc6
 bfevdFjiUOZ1WPRLv/R1EJynC39j5HkJybm1MIxuq/mDotYqMwz3+Z78dsL/FWbgy/YZvs9ube7
 MJgRs77ZNfY0xnaSupDEyKgRpYvHZZ2CEzAJ5JDMzBjxHHT+nMZ7zV+PaAsm8Z8IMxQcDrC88NQ
 5SjNWrPYkMaBRiTW0Aw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX9Gf/iwlLfChx
 SklbGlI7Ri3e9EyuHXRQLQsA18Q4GPdx40mmNSZmWYB4Hdi66lieUp4NIOEhjuw3COvVId1aTPi
 FcjUh8ZAZxdB8NU6XUQjMMBCaorskMo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220057

On Wed, Jul 22, 2026 at 05:51:39AM +0000, Esteban Urrutia wrote:
> On 7/22/26 1:34 AM, Dmitry Baryshkov wrote:
> > Yes, because the platform has different refclock. 
> Sorry. I think I've lost the thread on this one. From what I've
> understood:
> - For this commit, v1.1 tables should be left as is without renaming
> them.

Yes, you can add a comment that downstream uses "4nm-v1.1" PLL type at
the table or at the PHY definition, if you that it helps in future.

> - For the third commit, v1 tables (DP serdes, RBR, HBR, HBR2 and HBR3)
> should be added along with a comment in the driver explaining the
> reason.

A reason should be explained in the commit message. If you think that it
helps, add a comment about 4nm-v1.

>  
> Please confirm if my conclusions are correct or if additional changes
> will have to be made.
>  
> Regards,
> Esteban
> 

-- 
With best wishes
Dmitry
