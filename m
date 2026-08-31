Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374F94AEBF2
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 17:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197307; cv=none; b=fyoD7NH4etSCs3LsDGwFfS77/sSR5/KY5iOi2aCVU8Wzd8BrY5cb6/3J0/4BeXT6BrKecl1CGvkF8lVzL5DTEEZLec1Yf2cMXJwUVGNS52LJaKdwUH80rBOJ695StGuErUVCUj736Rpm0jiSya16drUaDPUEXbVSsJn2SG+WGfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197307; c=relaxed/simple;
	bh=EQKLGIpclNr7gypVyVTiYlY5af+PuK8ZOUJsJYBYGjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXMG+TNhOl9YnYibVq0FPN5S54QDe15vR2jS3XB1bfjHgocj2UL14fWQTRPlNZ1cctzz99GT91bVGp6I4jGD3EpphFsYBPIZIMwOaiytuWty8DSmzWCiXQkeoE1/4Hz2tu8FGw4x2Ihljft2+HHPPPMCXiNOufEjbD2Q5TJa3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIolEwn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxSO3AC1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIolEwn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxSO3AC1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFpeQh037124
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 17:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U+FJDreApvOiHgVna50wFhn3
	6lEdXGcRrdbklNgyIFA=; b=nIolEwn7iIuKQyspnYSNalgpKUBDYw7H+2vE+VSy
	Kw0C4ZRxp89bxPrYsO71dQIgb5FW5TGANlE3YsXHTi/6nFH/GYszk4LEGdF9j8lg
	bJzOi525PK56jw62/8LKn3RSZGX286op6ciykWOLgRw9dMVxVPY+fLlX+MX+ZfxC
	Q/hUXYjkcvFVU5rnw0pqsj9cQkP8d//tEb/TDcnsON4AxjS9TeEbLwm2vfEEkngd
	y8fYZk17v4unB0Yr8qtj5WL3qTGSZKFQTeZ9DOLAbcjwepIQ/JdZAW4MSH/WgQgc
	3eQQGDOqHCmi4dUXjXzu4h+jo3VlQc3C5StJGRBZ2Uouzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgj85n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 17:28:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so744978a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788197304; x=1788802104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+FJDreApvOiHgVna50wFhn36lEdXGcRrdbklNgyIFA=;
        b=kxSO3AC1Hef/bkbWbAJTkmGm8zNbbxMWkKup/2d3geJmwwE/xiYTTfSsJNuMjNGpOz
         su0v2JRkD1csmvfFZWQ5KcxAR1vp/lU5fWh0gXcx9N31nVeuHztGggoRXoOmCI6dBymB
         /M5aN986oeZ/Vtuf/J1xAmeUruTlmPnPA7MtjMmgkjxiBNcb830gmOqG/ADFFw0KwOMq
         GL/XgdxWn+kD5KvYf1zIAVZc4cNb/Tg2i9AOIW34Fd3f4H1Qo/fVpWKJXPqbRzcVpoKk
         JA9LEhArUWtDKDlTr1JrMey+bwTZJ0n/l8E5RSp0Q5ngtTn5MpZhpL9pcOOCvxcR2Cly
         iChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197304; x=1788802104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+FJDreApvOiHgVna50wFhn36lEdXGcRrdbklNgyIFA=;
        b=kyB5gfgOuFt3twrkwqGv3px/EG0aUMmq4ZWwovnV4AbOFJdRT262KxqqBj9iqZ/HaB
         yUYvA7F9+YfRvplht8ugmHJSei2Xfkk1CWGhunNeq6tS47UAL5ojiDLdDgbizi7z1x5r
         4pBj++bY+WgkY9vQadsHapX95hpw9wdJ1CTLLE0OY4cgbk17EMy71b3rQ7yGQl9W91Yy
         47dKZO91NX9sx4JcgokGh1/pM1OABL4WqSO2Dqk8hZDMQKlw0aOCPPzqg0eABC/3jjWw
         E0I4OvAN+Jxik3okhXHSjTnuEQoWy8c7zyLrXgdLIOdGJuT7cPQDUaSLNy/PR8eTYHvF
         wZxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuOWwSAEbs6QJMbZWBeQ3BREceky4/Jcs2mNJSh2HR/RoVdUuO7wCLKitm2030fvxtcl6vtr+LJy5yAMyb@vger.kernel.org
X-Gm-Message-State: AFuF++l4eRat4TKR2YPBtRARSfOXMJYjMIS9BTqldtowrJdOhHc5qfHc
	NS97nBkI1dVrj8JXwVCIMBKi1IpKSAUBSWhkYnzPg5+OLhdx0XesKlLLcJ04ruo6jdg0eCncDbz
	65PKOGe6dgYy3QaMfATjbW+bfgbA/PwfddffURwFmFvCF2eXsduDPOMkyJfKRuJezsRLvlKuAdd
	fm
X-Gm-Gg: AYBFou3QR+jsDkAuz/I0y9jfxhTr5w5K/ZbygTffXsb6uWx7xQ9dOwfErEGTtGddotQ
	N0gzJsdMIEHRA8UwljxEDRBtJH+xzdcJ0SFZnGnS5rrE/GYU+YMNLqWq2pCCVtZBXIXtqrAryAQ
	u3+TbtkKq8gAoUgiC2ubyWXuBO8RlrXBojo7n2TDOWO/SYBEJutp6XRGwX6aSopM8mGmRSvzH6R
	v/1lYkbM5M4L4enoPPD/3GjqM1iq6CN9uT60JpDjw9BjBIspe7FnCWx30Nzbc4uLck9UbL15woN
	mhFdIlWmx8EhCWtYaf/Sgj1dEBASvycmg5fnebd1H8ovbuBJq15C/R8fGQGeMyXbBso024MkSzv
	Lu61Qf5pGbkXYek9Ddi28u0r8nSM=
X-Received: by 2002:a17:90b:4a42:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3990723f576mr3198674a91.0.1788197303889;
        Mon, 31 Aug 2026 10:28:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4a42:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3990723f576mr3198592a91.0.1788197303312;
        Mon, 31 Aug 2026 10:28:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm51706451c88.14.2026.08.31.10.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:28:22 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:58:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <20260831172817.66p7yyo3ivdlzqei@hu-mojha-hyd.qualcomm.com>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
 <1ad7deb5-5544-40aa-baab-865a4612af70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ad7deb5-5544-40aa-baab-865a4612af70@oss.qualcomm.com>
X-Proofpoint-GUID: mCCcrU7vq18gkvT6a-6-a8PImKO7ruwh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE1MCBTYWx0ZWRfXwqI8dDXqLGfB
 o8mlL+0Ek6vclaPSqIHP2Do9NiEAaCaP9etjU+I4n7uCIbnsluP55vgGGsd8axie5ghoCFZjgmx
 OtZy9v/cPuhYLxkMipESdXj9kPaf0BU=
X-Proofpoint-ORIG-GUID: mCCcrU7vq18gkvT6a-6-a8PImKO7ruwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE1MCBTYWx0ZWRfXyG6oQdF8Q0DF
 9p7dlf8YSfA48EayGXwziCc4sG9sWJBY0mw2PTV2k/HpE496xJ6miO4gU27VD4nu7HFMh0OwdfR
 VBQjBzyiwXU9C15c2Fw0kzzhvWeSaAU/omBj0CfEI99XJE/lb0EbLqmB6Q0DlnN/7dYPSG9IxPd
 gt/Jf7HxsMiuK1UEv+nCrph2fD2RXgRVeSBCh3rhXdcNw4DcihFT6zrsbGyGsnjgxObWJig36Mq
 N0JI/Kx4OUdlSRIJGTjWAar5/yoGOOnT2gqahwAiwELcgTz7kXhGoOt/YfL7p7FzJpwhDroVF/N
 Taa38CGlxG4VMeVYtwkcx2VkOdo9IR71IkA6I1xEIwfOR8V0aQO7t68eXIh93GNcQKvQRxob826
 r1Qbuv6zn9leZdXMhufQkdJ0qnrAexn2fCgcggzFojY5LEeaK7MNmw2/Mt/zbwHkFGs37S0MKBK
 n1NKsS3r5g5R6Rwnndg==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a95b9b9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=n1PayzcEgq9-v72wh0gA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310150

On Mon, Aug 31, 2026 at 09:08:15AM +0200, Konrad Dybcio wrote:
> On 8/28/26 8:13 PM, Mukesh Ojha wrote:
> > The proxy power domain enable path currently requests INT_MAX performance
> > state for every proxy PD.  While this serves as a "take highest available"
> > hint, some SoCs require specific per-domain RPMH levels for correct
> > operation during firmware load rather than a blanket maximum.
> 
> I would have assumed having a surplus of power shouldn't be an issue..
> 
> Is this specific to Hawi?

Yes, its for both Hawi and Maili as far as I know..

>Is that a firmware bug essentially?

It does not looks to be but not 100% sure and its found recently
on some devices.

-- 
-Mukesh Ojha
