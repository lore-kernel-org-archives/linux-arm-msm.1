Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CC93AC0D7
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352669; cv=none; b=nH2CmFSjZ8nwkHYJkF+iSv6XYLYFQ6H3QkpW1ruS4eK9bvaakf1EuVlxIoqlsFEhIS/1dqMKo6C5HjJaH8k4+sU2CMbHeTHGriJa0l80z3TExzNULOXAtokNo043E5Qi5jYz60/gdXHLAU1fh4CF1+SmfXGnDn17UmdPb+DwHy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352669; c=relaxed/simple;
	bh=0emLSmMzBaROF0iRiG3H9diTF7SDUgnDJBclmIJdoR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fj650hxvPJUeQAbdWHv2PN7HRGd9NwVz0mzXtBhSZKyax8CPrvC7Sii/p74QTY0tudToh5L+MvmYICZrwXRboBAbsNGhCaMoGMlhGpf8OOmJ+1nhtx2eGlMnh9WpafQOzlY1k6wgziV6gt40X52YnvHuls6cqqXJ8IyfhhEuUpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JW1MZ4iQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzIEdsTa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JW1MZ4iQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VzIEdsTa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pb7k632471
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/uS9bbyeIHUiVC3fHPyyKvdr
	qF66XTcs3XO7PAKSN8s=; b=JW1MZ4iQaSEjtkaknt4XFaKXUzU3oMvY+Xh47/XU
	pGhVTgtRwYLu4LOp5FE53q357tqNMGviwK9BMLfbNP0zEkvsqszOry/hPDqGdQRX
	0XZSiozvP65Iu/Hsi2vAalKTqGNyderrc8zqtIG0JCzYJcIRRru5hMPDVD/2RF3J
	2KQou7/SQ3FXFoGZNr5N0GRHfbv0/vwOAATgluQh20N8u0cmrNAr+LGE/41Nqnxy
	a8vlORqNm2/GurM0bADHpSAy8RLYGXwS4lAW6iLuKmZDQwM7B7ajjwrwyBiYW8Ty
	yI8QNCt5W/m7GL8MC9bB7rW0KeolF7gx2fDMcow7znfX8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6rkxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:04:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso29031941cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786352666; x=1786957466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/uS9bbyeIHUiVC3fHPyyKvdrqF66XTcs3XO7PAKSN8s=;
        b=VzIEdsTaHV3PZr2iQerLjUjsBwSwDNPCQN6lcK2X6nUIay7fAfljXpuPGRimBhprF/
         4U7bt8/aQxmZViaYXlXduSz+q5OWK3JeExjybPSVWQRQ8vCA4jR6Z1gG5/E0CZoVKYsW
         +2Gw4j4MgDIHlyegreQ02HEGlVFH2dilkm6IbLL0zIfRTNcekV880wLX8idXzLeZLpwL
         tbGhkSz3TiPZ0ZulUq+F3QI73zn1tgYm3o2qT17CtZgPth2TxLY1DiTGEeEVn8UNarpA
         8Z5zuvQa7ybagpqW2WW7EQvEIvH53kHk4KezfBxzgfOQ+U0S2lM7ftMm75uLDXkqqTVX
         dgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352666; x=1786957466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uS9bbyeIHUiVC3fHPyyKvdrqF66XTcs3XO7PAKSN8s=;
        b=RMsiq0xmw2TJQZ3bd2NzLeuBLGeuzwqOJV7/KoRIV9uO98r3A3dKXeAuBF5dYPs8hG
         /vOUCurcIiaj8QdVPnSMoNNYfbox1g9NzHupDrgGEIKvDruYykgfXhdDK3I0tZClC5f2
         VDUenbBW6Yz2vfD8JqStmikjh7+YnMhnYze+R24a+qQ0vTSZMl3MOWYRrPN0H3ecfTdz
         ywYyd1pJCYaXOqWJZwp2YxmstTnup7MiiLJ5zAH6SqzuTgDqnRXylJhLktR0HjIAtTBu
         XxV87joYklseXNc37IDejqu38aZfnlp6kmygN19b9ccQazzI1P9/9ON/Ty/SKCR9yiVg
         0k8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqr2m72D+ywVoZYvYhBAri1TSnMpNPks4S3Jxv66IyLl3PaUKJeQvtwr7Iv92Gg3BTB2iHkOfUNwc1pQF9i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhj2Xt5s3gAWNsqmIj0FYhErJpPhy6QQeeS/63gxzIiY/6v9VB
	6Hrgo9qhj6+TjgmEUxAtdIoKf+TohmbOS23KXBDQJcykYD8tLmQeJJbHAT3TIpMwNbmLEzUfS5j
	ey6mo5hhVQ5UWA2qKq2ToA/pIAgi03ZJjpK1MgxZOyz5dAdS0+YUrs6coytH8QlQKDtJd
X-Gm-Gg: AR+sD13I2STXwANSmTIFzr5p0WCo2CSHVShfbBzbF/vs6SDgHgzW0Z+2HObC3S2CumA
	6jvprcsYLp51kK8bXSZK7Ki3Shi9RoN24CijtqynWLEtMqSkTMl0Q8hFVZ9CQ+Gr2i9tOJebZWg
	n90A/93WZplnHyej5U3N+QmOUvZMc5pyPal1/BHtg0WhawaxBSHQkuR6t1Fz2tBfcfrrhPrZV6e
	f3EUe0PE2cF65dVsBxYPnaFR6LNwr6QDZY3YBfF5L2Z7xfs/y1EFmLX+zOe3T/lOv2CFPJ18yyh
	Qj9V+Yj5f4FgEETuo+UOVtvi4VCIyzEI/lDnwAgN4hSWOdHlkA8QMnviDkNvOI357p4DcCiJfIY
	GPYxMQiquX5eyLUhVk7k21h97QiShn4QfCJLof6WQ2OBIvEx+2c0TqZXWg1KeFCCprXcC7IYGw+
	PylET1A6pF/43bng==
X-Received: by 2002:a05:622a:c83:b0:51c:22c5:daf5 with SMTP id d75a77b69052e-52d0b281f3cmr301984651cf.38.1786352666040;
        Mon, 10 Aug 2026 02:04:26 -0700 (PDT)
X-Received: by 2002:a05:622a:c83:b0:51c:22c5:daf5 with SMTP id d75a77b69052e-52d0b281f3cmr301984171cf.38.1786352665574;
        Mon, 10 Aug 2026 02:04:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050cfef3sm1853717e87.25.2026.08.10.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:04:23 -0700 (PDT)
Date: Mon, 10 Aug 2026 12:04:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <eblai4d6apohd43uvo4kbm3y6yfkso7rd643ijra2awyguve5l@j7aq2vzzwmj2>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3NyBTYWx0ZWRfX5WFUMAO+qGG1
 ZcZgkAo5ma7bFhaYjMzhKP9t9rA/RNQnDAhNMFqMEilg3cDXGBlD/uT181aMLN8xkTMZ5hWWmNb
 kuUPi8dhGH6g8fyLcpZdxzklucITTJ4=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79941a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=0EW1HhQ4lK_VUIcVktsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3NyBTYWx0ZWRfX5EnZOu/QRfVb
 0yHuP3vXeslyeCttRH8hctNCTz3na7hAwamS8iSTL6n0AsEWSMfHIfPRv8FccSX0A4GEW/bw1Lr
 GDNyyP20hVsCAoFatjhPOGj19BnAvXMMGDXNfER7iRp5YXwDXFuhRb7aylHd5r1X6yVdZjIXp99
 hn01EHip6w1bIqnh+yvu4LtPWse0QZC3iIjCmTZx+fP2FurjUXrxPRXhbI5XJlOqPvVOD626/J5
 3Wtp8HNfEIDBDk8NXMuYO6RhGYCN+MUKG7wBOPvWRC/ij94MOFVWul4HM6IW1oJs8hULS+yXidH
 P4A8Zzo1H2tLY89/OcR/mLVbwUzak/4r4iuCR7oBXE/AV6drjbOL3IPkY4rXbQ1r72kS4uUHj8s
 S/wXdAcO7YN5qaW8ceRtDPwSKjQVryERK8de9YxRxCvXku3YMTXT9yu1ah/xebYFJ+g4zSvlKK8
 JSjmhklXqhRmJHhEyUQ==
X-Proofpoint-GUID: 1dNfIT7zD1K48LUsltsXvQ0hlc_3alhm
X-Proofpoint-ORIG-GUID: 1dNfIT7zD1K48LUsltsXvQ0hlc_3alhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100077

On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > variants and provide a composite DTB for headed variants.
> > 
> > To quote:
> > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > 
> > """
> > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > lines of a new feature, there must be an underlying problem that
> > motivated you to do this work. Convince the reviewer that there is a
> > problem worth fixing and that it makes sense for them to read past the
> > first paragraph.
> > """
> > 
> > In fact, I'm not even able to guess what the problem you're fixing here.
> > 
> > Regards,
> > Bjorn
> >
> 
> The problem is that the base device trees currently describe the eDP
> display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> are also available in headless variants without an eDP panel.
> 
> With current base DTBs, headless variants are not stable where eDP panel is not
> physically connected with board and userspace is trying to use it.

Please define "are not stable"

> This series fixes the inaccurate hardware description by keeping the
> base DTBs limited to hardware common to both variants and moving the
> eDP-specific nodes into separate overlays. The base DTB can therefore
> be used for headless variants, while the overlay is selected for
> headed variants.

-- 
With best wishes
Dmitry
