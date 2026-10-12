Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFCE2F12C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807333; cv=none; b=VT0w13JuNFODvDG8X1LNqbohvzhsi5K0co3uvOCCJkSG0TUgnxZecQe0QDbJ47yIbHpNz0dX5asLyv5zyFTA7Liu3XjwwopgIIODlhKndamExO0RTzzQ4EWPEQUHuPRSPnh+7WuAMjtBc+ZTKJ5/ADR5vIbjuHagrnN9QJjCltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807333; c=relaxed/simple;
	bh=mNmg4igm56aIhFhjoBzo6FuKANN9+kRF97wFpfQTZz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKmAJ1QMot8Wt91xqcoXkSo02CNacxFZvm3eGIUUnSRyHCCbJREKycyPf2wMGdlUndvPjsBTJx9DUayAlW/IUFOvBbd8xVVZSuWnp3HyJLdV31JI7q0E2PkcDTn2o329Z2kmY5m5BGybj3itxBzT5hnxnOw8C71Fz5nRy32gHxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxE1te11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikJ8Jghq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxE1te11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikJ8Jghq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxvYQ800778
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W5Oee20wld3PH/cVGW463kUn
	G9EKd1KKP/fCR95AWfM=; b=fxE1te11jvpvYkuiVwwTsQSTXk/MB0NPmyKhPMrC
	AJrnrusz6Fo641hxXNp1V3xt6ttNkv8vZsmI8ZGGUy6pA2mXE/5Ivirg+8aQfuVR
	QRzAfdiDxAT0iKviWX9If4Buu+7ASPmqD6NdLBGQLeOizragQ1T6cjrBZxHBu0jq
	wAc0RLky4P3i0p00hksSATIUC1dt5qfr2rocFTIVrZRSM0q2zreegGrdrJaQROnq
	KUcJCxT28V+jYVFGK5CR+xEqlZ5EGx8SO0or/5FKrTaeHts3kINp8L2kOsSTfoPs
	aB0gD9qzaGoqJ8MH7SCeCa1tSCHtIiobEOvX36YIPjDNLQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcrkve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:15:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53514fbd4a3so41710031cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807330; x=1792412130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5Oee20wld3PH/cVGW463kUnG9EKd1KKP/fCR95AWfM=;
        b=ikJ8JghqrsW36uyz9CY+2vP2OI+FnMlOG2Cv5BHuiHYOp7i50lF9+74dMLJ0HU8zm7
         rPoitqCEjmD574jvrTVPyjt9Uk545zZQd8jviL04UmwkUk6wDQmMgmDpiXrtY7JPcuAO
         JB1R64sdY8LJklmBRkA4krFzxqiAvfrFJjLDYt/Xb1zeWeC9ynKj+DdS61UkyY53kTMR
         Wg2s8RLFeMymUXWcHrbzRFoGKBEa3PGC8fIyZfZyS2I9aXW4MT//SL9KuQp4GAjI41HJ
         4LLlq0B4DsK2ksyygIFKl5wHg5RIfdMHBXhhgY6qoTx6yc+cWx3lXl5vV243sTS5dVs4
         6Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807330; x=1792412130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5Oee20wld3PH/cVGW463kUnG9EKd1KKP/fCR95AWfM=;
        b=RPfYlyMtr+Dw2H7HXNySBoAsr9FfmDaOl1APPAd/2OpaL+e6K2RfTdYglfQBpRDBCg
         MN1qUVyT/BxR/H9NxOwPonOSMy3WJfwlY42/8QrfAGOqB7fFlrON0VJMmUyKVxuTNofU
         s9HbfCUhkcZ6urdtEAgrUB4v1ezUyImlzHfNboJeRO50O9pny2FMx5cAtbbW5z6+q/ET
         nmyNRRmNJEfO0pHcTYCmNaW5+tNoA+fpvFgDSUnyQYuTU/1nldqdTUbaXz2SDGQ4+T0Y
         P7IfKxdORHEDQN1DmcEbJq60Wmk9YB1PJwc92Asa86p1+QbvridY44glGNRdvcNXvFZ2
         lMsw==
X-Forwarded-Encrypted: i=1; AKwUvBx+CrUbCeQOhhtFZxQTfEKp0b8oaldgRnaXEmA3vM7qOetM36fmfeQcIu8ChScSBBdw23WfO7cbULAyY0TE@vger.kernel.org
X-Gm-Message-State: AFq9FYJbk47a9Qbbhv9teEc7SSLy4m4fUFyxBxntAoY3AAfoJ+dA76io
	JrReywVtYlvfiY0h2G7qzFVXtnMTqTwiD4EkczgfcNXvVXO8hHY2cnp/u/OjKnwVf+PtaVdsl9S
	qcQMq8eAoMWoRJgvCIri4OeQhkTQs/BgFS+AnSXFXGw2xCp8kRw+XQ7AypZKVNnt6dL74
X-Gm-Gg: AYBFou29fyGFRxUWHOZ46yZiQckZBZ2okLSEHONL6phVO/RuoD5W+P7eGC9FM3S84Je
	KH7irnKs/9EWjx6b0vJA0Dq3Rd4lJDUaBjP/05VX74onJw1wU1pl3jA0bDswHUOH+ssl2wEfAjl
	wBwoKcOi6FkwVrGanjqumf1zuHO5/mFMJWE8YoYalyqjbE5XI1Vh78+yNIlfnqlOSXpvR5r3L3o
	NgXsuJKf9YOLueQV6goHZJsUILoIItJfxIzkILcOER0pCQ0R+HJVWm4pzKl+xCyC098sa7RLOnQ
	a5mutk8/oyYjkvi0URcSEmheCusSiJW/+DeUl/duaJrGrqWUbSQ9MC0hUYVEoE8ai0jWmz+DnIy
	D67hX6g26vNFXKYTk/SxFns74rcY62YJwL5/CNtvyuIiUHD+7Y2Q9WX69lhhrgj8SzPH796I+tm
	KDCF65o1MiBl/i
X-Received: by 2002:a05:620a:6303:20b0:93e:c12c:4416 with SMTP id af79cd13be357-93ec12c494cmr973980785a.82.1791807330223;
        Mon, 12 Oct 2026 05:15:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6303:20b0:93e:c12c:4416 with SMTP id af79cd13be357-93ec12c494cmr973978085a.82.1791807329765;
        Mon, 12 Oct 2026 05:15:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf2ab872esm909446e87.41.2026.10.12.05.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:15:28 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:15:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] drm/msm/dpu: filter writeback modes using
 writeback maxlinewidth
Message-ID: <7n7jevfti3hty27mbbsuq22oht6bxtrim52umza7xmpctpqgjn@ov6vn76takpt>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
 <20261008-lm_fixes_final-v4-4-fa986071c3c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-lm_fixes_final-v4-4-fa986071c3c1@oss.qualcomm.com>
X-Proofpoint-GUID: oQMkrXmyNm8AMdry1dCGzIk9w9u3G3r3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfXxvBnRA1rm5Iy
 qplJaayEvNgRARsTgxcWF3+0pcznSJ/OpsPqWdFJne5dfeRlSGIVJA6DAJr8rY3Eor5h5gi5vwb
 Axgm1ij8HY4geuUbbNaZSEeTT275fac=
X-Proofpoint-ORIG-GUID: oQMkrXmyNm8AMdry1dCGzIk9w9u3G3r3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX2CMexmbf+db4
 oHVLHwzU2qI+hhaJLYOIZsgV7mGkIxpn8hjOR+zhSNZNlS5EUa4dSaD24h6m9OJuCSy8fQ34kbB
 UhE/GGyb4y/yF/GTn0Jc7cI9ZuR9eTaLCcQoSRYkfbJVBl6Cpr75jmPKbufoKFyXrLUYoDTUDqL
 hbiCeQGIQh2yJyN4xXV1ldjGfORQhEn1mCmuZyZU1s2qeHmfcLwohoHHgMwMqMzXaFGT5JS1LHQ
 GVlS9sD2vxM5jzGU8okyXHb/D6+wrYM5sE7flRZyEi0yY97v1cefr80BorxB58G3qLH09h/UGO1
 oIvs2o+P7e8FglW+WuZoUU9UFU5ttY6WIgz0D7YseZNtplGY5tl52BhgriijJ1eBqmvhnUW89Po
 /mhaBdMesDHiBSTRaot3oYPe9ORaUKaYDPUaBDJI2OxAEsaOfa+lT15ZgNuciHmlMAFfRtzHN8p
 P84Hl4fQiWKKhqRdRCQ==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acccf63 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BE5bDMB6e2GY2Q6Qa0kA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120048

On Thu, Oct 08, 2026 at 10:53:50PM +0530, Mahadevan P wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> Maximum width of the writeback mode is limited by the hardware buffer in
> the WB block rather than by the LM properties (LM doesn't have an actual
> buffer). Use the actual hardware limit (the writeback maxlinewidth) to
> filter modes.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> [DB: fixed commit message]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
