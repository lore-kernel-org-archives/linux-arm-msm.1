Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877943E49E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 22:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785451953; cv=none; b=PS0qU4St5q+C/25O1xCqUf1kIc6AZM93HRUF8iI/0oaJ9lecl3/ABDoOgJufK9CO/S6z3x4o/qVQlFjANlGu2phnxhtYbq6mh0xkl1/8AowbgT178VDjRk8D3iAeExEQgTscdEdBVsnpXFAiqC+PfxPTSuMvZVreqkyhYcFlGao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785451953; c=relaxed/simple;
	bh=I5ZTbXMJEZX03AE0LMGrAgs4VtCI7CwWKvjpCMzHrqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtLgeeQOuKTUTvhT+RxyCUWqrbyGqfvC6p8IctxLVR6AdgGha9Zgha0U1DjRKf2HXGYhUCfKknvoa45IsaZOa8nszjOwzfXIDt8tiw/VniWZPwM64lcsdWCjyBUJWNfh1XT6dVO0/X++iDtRLFB6EyyiKTD5Na/e8z/QKou0OME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwQrTCIj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YfLdNBu6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwQrTCIj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YfLdNBu6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMfKSM1985660
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 22:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kg9DNXzwkXj0XeF7quiXUIFo
	Jd9S2boCsqefrVecq70=; b=YwQrTCIjguPGS3kvwmKsaphZwWASLNmVOOupAJ8H
	ShUkWTH/95G6lz+JBg2Uq1NVpzMqSz4+wfDjVp/q3BzCVTv3eL8ffoCW6fZZkWhb
	4fligHw4vY8qr5s/G4WG2PzAcTOOCmvHweri9ER/NVRrF2n4/vbJWb0gpWK+c3Xc
	YfVy+s0PyBST5+xHU3SLmoRhfKE5q5xE5GhXer48RV65vmo8Xxfri0PSDkNoTlaK
	sMgfMh/8nH1W/d7KLNIFphSTEyyFopJCxxkcylJWxr5JuFMGpBlF2LWI8CThgZOP
	YgjAVDnJTNwwwOVJNSxZCk/wCyIH4cVq9/BVGz3jCTxjcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfmh00vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 22:52:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso3105601cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785451951; x=1786056751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kg9DNXzwkXj0XeF7quiXUIFoJd9S2boCsqefrVecq70=;
        b=YfLdNBu6auy4mzoi7fCF/Mf4UA6acfDLhOFlYmnXLTPHTG0zOvooPz2xrWRyRwqOrK
         U6eFH7e9L62rN99SdpxIlqdcnZmrmT2nVzJmnTEsbOMPo5DcU5qUq5IdCjYGsqJ1/SeU
         zqewoSafL8OnImujlURrDCxfpbwIQNz7KBYezDM7tVgQ6AILPOsPGhXMjWIlowRD9GVH
         1XR31oSpoZwWtPao0/ff/Q8SLHaeLUP8xgEGhdSnzRVM1gCEEPBFKm4hNPWbMkkwKoNV
         qPprpY/uXzOg1Uf3GCjZggNyTfx7wL7qTaJB/B9FgRV0GX+ZHOyPYbPQozUJEh6Fx8Dp
         SayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785451951; x=1786056751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kg9DNXzwkXj0XeF7quiXUIFoJd9S2boCsqefrVecq70=;
        b=PSLMA92gq25KHIpZVZbgIEf3/KOehkX5sVMvJwIAFKt2cK93eqcZ3vB5IoKyQgfrOm
         Z49t6lMScuMdrldjVKhLpB9ZSLlRDSQVJ8V8LomdLdEAYvktwKca3ktQkLT0iPrzB5Va
         uElN0UKVFQs7k56z4XUUAenrN+SkkuuvtOGJF56JHRRknX6M4Jp4G0aVsthp48LEb7Kx
         uG0E0hfeJH8FSTonKn8P/1chcKX/TeDVLLorAH7RuSinpTw+mJXfagNNa0sRZosXPuu3
         QM+TUVNDa8AQZ0yBGWpyRZEo20SRTEDYpmXqBBSDUWJOH4JJ80/MgZ2FXMzwwx4iRrIh
         UY4w==
X-Forwarded-Encrypted: i=1; AHgh+RpTSLs272YUjpx8Uw47dw27NckBUaBm/BJIO6a7qxKk9rjbq31TX5Y+/fYTUASMeuTKvL8ltah5Gd8btOf4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt24WnXNssEM2jhjP5PfL6URpAGPscznzXjc9OmsyLQXJh5yw5
	TvbedruJjRk9E0nztrVQJJAnTwy17bPsXmBM0SzBSo9kTXhTsMyZ0eAt5IWenAz9SCdfKIthf02
	KYWWrzM0EkV672mMwhsyT6ueJtnjqkpfRPjmVsoTlQgrvKml3qpt7qDs65KUg7IfMmqPc
X-Gm-Gg: AR+sD10Wdl5sy3mW3eI6uitHsvh3S8HIjFiUDGcGCuftwI86O2Ih+p7M00XW83GILKi
	WkO79OcEeKdr2E8aMLAe1z4tQANTj/PGP+p11DBg5XsvwYcaYfP72TVqqbFznG3aVcigfBPXV1z
	826w8G1HjyBzW/bfHYQkpc//Ri5cLGiFoDE9PSzZfToEEB+QnIx8sadpHcs+hf6QWdYtJoYuW9W
	WAp0giXJir1OwAGfuAmRAUiw4PzlXN07nhr/hLFC9oPLDcjJS7gbBc9IHVpsenG2te7Ok97/LMt
	xNKRJ5XE7vd0DE+GRQZGjM20h2Q4NGgqxvYwjHzKHCIQfImk6LBTRNJvaNL36DxHIhbgfc0JF+H
	XXNMBPyFMRn3NgHCBwipHADIe9Hg3iGPny2JiP6kKtZgnNuc5oQiwgDxWrU67S9TCbibXF4Bc/z
	h0hnPFW1raPA1cHw==
X-Received: by 2002:a05:622a:303:b0:51a:8c97:9378 with SMTP id d75a77b69052e-52b386b300amr45739091cf.64.1785451950618;
        Thu, 30 Jul 2026 15:52:30 -0700 (PDT)
X-Received: by 2002:a05:622a:303:b0:51a:8c97:9378 with SMTP id d75a77b69052e-52b386b300amr45738761cf.64.1785451950001;
        Thu, 30 Jul 2026 15:52:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6ac9b9f4sm5447661fa.32.2026.07.30.15.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 15:52:28 -0700 (PDT)
Date: Fri, 31 Jul 2026 01:52:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] media: iris: enable VP8, MPEG2 and interlaced video
 support
Message-ID: <xbvyccur5htwxzxpqywtnh7orm6gwjxqmfh7qkzb4egqxhfv46@ilvrnxrztdbv>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2MiBTYWx0ZWRfXybtvqG7mBtKD
 ZReAMoEn6yVqYGyYrwagyvMwP0se3aaET5W5awu0XeaTFqfVmAdjg0tSLtx3qoKW0f0vzKi4hV3
 l2dwflPAXHfkn6Vruby6b5mxhLEjMmU=
X-Authority-Analysis: v=2.4 cv=evjvCIpX c=1 sm=1 tr=0 ts=6a6bd5af cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=lxEG8TWL_LL3OZABwnwA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: v7893qloAkyMLUZLt4piU46Ukg-JxKv2
X-Proofpoint-ORIG-GUID: v7893qloAkyMLUZLt4piU46Ukg-JxKv2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2MiBTYWx0ZWRfX2w34qVJWp3xN
 EsC5zRh4sh5wChSXf+RySwBL1d+c3UhZcCwebEbCv9gswr2qcKSb/uPjhkIe/XkFsN1jPgyiGtz
 hiQqm2QFOTvTxuxL3WvK6cfK3ynz4utY1zFcnCBqr6rcriA9BwQgzgA8N6waTZ0mJrs2qEpUvCM
 h/j6Txr5WcXwG5EiNLCZB8/gBGTROW7zHkhhZROJ+AOuyd/jFZzr806rGFzRCJu31d+c+JIO0be
 Hhx0PKxZUL+Q/Q5X1h9dt1W3VCEMT7pP+wOzUAWWNCLGHd2G60rW0C4MHAwQ7UnWsGgPPWCXceD
 NTjAN6CLRc+50oqvtUT2/p4SmoLhEUO/ZuVefNjlmCIsjl1BrllarcqrO6wIfxWI4ediSE2nvry
 ZiKGpTReVNNNGN6JHOkok2zTPXOoJ9IwDOvbcLQYJ/7M1FSiplbSF9rEf/nnz9V0UdSJObmsjML
 pvUWhHgEtdy0UthqQDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300162

On Thu, Jul 09, 2026 at 10:36:57PM +0300, Dmitry Baryshkov wrote:
> Bring back features supported by the Venus driver, but not supported by
> the Iris driver: VP8 (encoding, decoding), MPEG2 (decoding only) video
> support and also support for interlaced video streams.

Dear maintainers,

This has been sent three weeks ago. Zero reviews. This is hard to name
as an acceptable response rate.

-- 
With best wishes
Dmitry
