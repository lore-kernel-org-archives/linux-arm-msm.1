Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B4044AB75
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784668554; cv=none; b=q2tP8ux2W0qX5b2U+J0ZkY9CG5UOVj+I9jFGT0jVS0Wwyxhwd+G0nTYI3InKJ995ui9I5qYddkNDTlub2dRMof3Mhpz8bWvopdSXlpdwKyA8jv6riFiEkCcww9VLivuP7N1BMa1k3NwXHUzVS8nJbFttXUDhcgPPxlXTwzMa8Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784668554; c=relaxed/simple;
	bh=DMovIaz9/G+SHXFwbWHhCTOVIQgwWKOW5MqMNfFcDDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHZ245tCNSZVDRi2FEVZdegUJ7hzdR9+k2AWAnwGNlFh8Noa6iv/KjJJMX94fqVu9TZ0YV7VS+FIRrZufxDCdF+TBhlYzcrc72WnL6vved5yUZydFuq0vOa6exkqJbHEhCfdnOrzS7U+ck7PqBrOL5LDPAcs49/UdVlLqatKsZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLU9O2EU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJElwJdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLU9O2EU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJElwJdK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlpqa2963734
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sowKgixtqzwSBCQCBPAGJXk2
	zmqu0fqYx82mSkSVAfY=; b=iLU9O2EUwg321QRtOHRmlBZibrx3DGTPB/eIopXX
	Esgvq6NGc+IgH2GYqD1Hbnb43M5qHqfNbRY1CaJyDArUCPCkx0v6Musb9LSmouSz
	a+MfalqWETjW5fSdfEUOYSDjvPaaU61tiM83bsMfLmsZTP7oe+crz9RWn7ekGdoA
	ITt3Bbtr3V3s+ZYRiCV9HyqEJiwIB8FaECi2L3AURRG12qZMhFompUSs/GD/A3hD
	fpeS3xKZ1oGlQxW4lojcML8lXXm7qNGdn3fhv16mxrak5RyEO9RN7e5GmwkoX+RF
	rvrHBepwNW2aHnEBpi3Zmw8b+G54dRzL7YxfS5jm33aBdQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68634tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:15:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so158078131cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784668551; x=1785273351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sowKgixtqzwSBCQCBPAGJXk2zmqu0fqYx82mSkSVAfY=;
        b=NJElwJdKb/Pc0HLhLzPyedwqTIXyrj3Ya98Jw4fADGweg7wlGI0QOwt35oxwzrPIL/
         UqdO/8lV53e511Sn3NfcXrilJvyWD3y/k2bNX0hAxwS8H/M9jDKWgAuatXEHZ0INtI2c
         izQXYpLri7x6kJtYdPVcQ5i91IqrKc64W6h9b093z/FIK5jgAArZU5F1dg+Fo/3kcp1K
         ra7lHfHoiCpbkV3hlo8r8aZU9pOoTW/+1jcrzsPRiOwYZo/29OBn5I6gHBMoLOuwfIRl
         94xKiZn3hiiGXqOMuJG8jyi81sxeYzGBSIbObjW6MuA1N3l7UE7rtlXSPyeRQEDWzRSS
         j9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784668551; x=1785273351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sowKgixtqzwSBCQCBPAGJXk2zmqu0fqYx82mSkSVAfY=;
        b=O6/+vo6NJw8TeJlevE3qNqe9lq+DuEZRZc7aAqenPG/fM0m7ywep4rjNi4MNygZMTg
         epvmo8AXfrbFnh8dmnwgY15+PPOhdMdh5Ea/t46nwEdt30I/B3K2MnMWoHMxDAkedAbM
         0yCfcgbP7ymLqOxzSArue5vepez/0qWF+veHFxVQhTCfNYsusUWxZEOESd/OcaU1q9iq
         w6IfWi67tfx/XnXeSm4pcfjUpYGabeOwBJ9r5dxxdsJAiKOcVTkNQiCigJVcWr/uIiK6
         fPISTJoQleYFb6HXCNZVT7eTc3MUqrg8YPGw5DcG0r8FbvQvsvMTl7G+F6uigf3YlRhE
         RkAg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1zgT63G7Y7b2aZmjOKxrqAlttheW7/uh+I38lQNR9WBnCJ8VrqNYtKw4HGL+NWAGd4BXZnNpXTkdeFPXd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9JZKyU4Eb26a8ncJS9hL09OIZVy0c62lzQgr/c0/ZCEcXqmXV
	gKXhInbE5fg3idoOn00zJiiWZ41X2lAO9gNokPlbp34GlOORX7ZcloQM69XJLhUCvAM/U8Aihkb
	3OFmFd6jxY+lYtoys5rfktM62iU/PSHsKlOMfji3611N/QyUVi/hW2wjf40biFebEovSN
X-Gm-Gg: AfdE7cl3NrpjtTwYlPuNovpNU+cTZUCuqti7if04AdMHPfhcXoGCEiZ9qz/ZQYHPGLg
	GLqs0UFyaM/tWmxgB+Y8bABxJICQOWBc3DrHJjkRTmdL7Oq6Ok5oX9FSWd6NUoDsSH5r8/mw6vi
	M9wB/snOcrlF21p5HHdxb8SkGoAjYqUwmxycmWiAkyak/0KHBScogunLY5t74GCqcOxzF0naaxn
	UcSRLOXLHHXdJRLNqNxfslX7nwWErKqCQeNFNCREhUKinjICdF6KRiEo2buJZLJLEFO7i6kqJok
	bhVCnyeeI7t3h6P/0K92qu1vwwfM79HlbaA5oaQzR/7Sc3jXYSjndP5v+1a/cBIUbziWcIOEthE
	I8EVFYw0LbDBYp3gSNDZmik5ifLbvdS969QMdNKN65tjvYVmDMvNNKnVLJB69b0rkFm8NJ9zC+b
	HhWujbu9HjS4BUnA==
X-Received: by 2002:a05:622a:2cd:b0:51c:7b12:5fee with SMTP id d75a77b69052e-5213d4bc640mr183884391cf.74.1784668550806;
        Tue, 21 Jul 2026 14:15:50 -0700 (PDT)
X-Received: by 2002:a05:622a:2cd:b0:51c:7b12:5fee with SMTP id d75a77b69052e-5213d4bc640mr183884061cf.74.1784668550325;
        Tue, 21 Jul 2026 14:15:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d4353csm112784e87.57.2026.07.21.14.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:15:47 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:15:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
Subject: Re: [PATCH v2 0/3] media: iris: add LTR and hierarchical coding
 support for ar50lt
Message-ID: <moj26vrjujn6ci74yrthdjyfdabg4tn67n7hczkeqvjhknm4ai@ilxz3c4jvcfe>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMCBTYWx0ZWRfX7NVDL90IZqhn
 2JIXn5w8dfU8G+7wutfDhKn6eHJru+GeXbyj4jiVqXLONOrBww8Fjn1jqwZ8WPFMk4BmABwnNgy
 ah+gwLXY7ubCW7VZ3TPGDpgcZTRf8ws=
X-Proofpoint-ORIG-GUID: eu-Iy3pFPVL33Md0g-21SdMxACjyW96c
X-Proofpoint-GUID: eu-Iy3pFPVL33Md0g-21SdMxACjyW96c
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5fe187 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xINO69gzjztef6yCAoYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMCBTYWx0ZWRfX+kKvQtLvzoh8
 sVvvEdlg+48IEG1vDLMw8AupAUh/j3NayogXwP2wmU0QPXWKpODdc+QBSmzhWuQp1ZOsc4ZImq4
 TdbxlklgGvUGIfebgozTeBGe/ngEL9C40+U1G2pVhKWS645mPVnQX3gNG0Eq6GducL30g/bfIBP
 +VYdtoBQCvleUknA6uADcdR3hM2EZzZXqQD2EDVekVaif9IMmr3KE7rb6peOybycCtKynObRWlI
 RnHJLHGoQvO83h9Hok2GdveAYfwaTakYCwQGN4Nl3z3acvV9zPUnZcshTggDO99p50JorMXqVoV
 zWlqm47E4qh/1Qp4U+itIqNyprl67eCXz0CGtQJwzhM3J187X/bXizHqCriJM30oNbvHKC8L85t
 pl2sBf7HI/8nAW9o06g21IpRTXjFYKOLQgniZ+P+tl9VMLpVIqWY93broqbbDg+16zjCuLfyiaQ
 2rrXk+VMmbaV3cb2m5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210220

On Tue, Jul 21, 2026 at 07:06:22AM +0530, Vishnu Reddy wrote:
> This series adds support for Long-Term Reference (LTR), hierarchical
> coding and request key frame controls for the AR50LT encoder by enabling
> the required firmware capabilities in the iris driver.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Added request key frame support
> - Link to v1: https://patch.msgid.link/20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com

This should be coming as a review feedback rather than a separate
series. I'll incorporate those changes into the AR50LT series (together
with the similar changes to Gen1 firmware).

> 
> To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> To: Bryan O'Donoghue <bod@kernel.org>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Gourav Kumar (2):
>       media: iris: add Long-Term Reference control support for ar50lt encoder
>       media: iris: add hierarchical coding support for ar50lt encoder
> 
> Vishnu Reddy (1):
>       media: qcom: iris: add request key frame support for ar50lt encoder
> 
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 222 +++++++++++++++++++++++
>  1 file changed, 222 insertions(+)
> ---
> base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
> change-id: 20260710-shikra_ltr_support-27bd9a496950
> prerequisite-message-id: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
> prerequisite-patch-id: 8b5a1be5778fb4c7feb069452ecb60e8b8dfc3f8
> prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
> prerequisite-patch-id: 922bc325dbd9a499a3a209d2f8dbbce6a4166e60
> prerequisite-patch-id: a5a49cda4e21d835558fa84f2f6bd25b8f7e72b4
> prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
> prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
> prerequisite-patch-id: 4dfaff2f9644d7a168b1b35fe947660b8f464af6
> prerequisite-patch-id: a26fa49eefecf2b5ba6cf964be9327eb5ba5929a
> prerequisite-patch-id: d97c79463fe1487fa7bc9eebd4cfb4610713f44a
> prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
> prerequisite-patch-id: ea9cd9a8e6561321cd9cf338a76da1382ff47e13
> prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
> prerequisite-patch-id: ce4576bd3d20880939a97a1cda9bb8678808ea65
> prerequisite-patch-id: 8c94bec467b385c373bd98eb9ee5a5805fc4e6a6
> prerequisite-patch-id: 6e258cd475b77927d6476704cbf91bf48a63aa0d
> prerequisite-patch-id: 54c8855d0721ba8667d095e6ad6556c2021f89e9
> prerequisite-patch-id: f5479d2ca6b850c0c750944a8e0b05a7df2cc5a8
> prerequisite-patch-id: 96dfec1c2df69f748c1a4bd741628e946cb7bec1
> prerequisite-message-id: <a2c02dce-b097-4f52-80d4-d63006ebd8c5@kernel.org>
> prerequisite-patch-id: aae7aad665adb93ab0106c28420e34587ee82aba
> prerequisite-patch-id: a2b7908b27a6308f9919c986f8bde5b902e5d6da
> 
> Best regards,
> --  
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
