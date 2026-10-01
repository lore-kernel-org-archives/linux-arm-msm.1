Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF54E3245
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849624; cv=none; b=TC55nqCd32Ui9yCEIAGMhSe3C+OB2m7XdlUa1xRxJa69ljdUIbLH8/tHaybTkgEytq98PnIWvMhI8FWZVQYXtTH0az2Wj2Cu06gCSYpO6f1oHMch6s5hFK3nNnchpwGlsGy2V5WqQAplfjnbc1h0k0GM+miBjGAYjp81RFKtjWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849624; c=relaxed/simple;
	bh=mLtX3fAnzGk7p2ckDcHug4xzNZVtvaKu+SyHnsGmiPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANDSCGn4jwUN33zWa4q1PHoKeX41uBUJXfz7fnLQsO5zIK3VuKtqO8T+E1uRHSCrTnadkgmBHg/2Fcb7DMoj1Lza6nWLt/5Ibzuz8s6YVq7bhzZmNxe74n3EPBTUcau9n/pHObquNYUb/Nri4uKxAnrqqy1Z+O89qEVzA+mC4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meHhNfPX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRXfHhdu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meHhNfPX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRXfHhdu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xTA21289198
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FUYhHl20vJ4GbrkFUA2FDZPB
	lZ3YXgo1xmjRX6hONZs=; b=meHhNfPXIWsgY+h/0aHZAF5jeB1vH+Pq5ZL26iMu
	IyX6TdsUqgi58LbwWJyqwVIL0ZTytoH8dJGe/AnM9A3VQxF4AhJi9gV8YC8UW/dj
	kjd+D3i0afCca5XS2wB1oIphS3vUgqPfXPRM/hUyhKiZnmgz9HWv3+KirxMxGsn1
	j3ZaPcFapW0hNB+YNb4M+PSQnQYnn4UXM3piENkrW3N9dkCSxn6PR4Kj8RAmApiU
	Anqsuwo9kQgSK9A+p3S2/BGKvgokQwjkK4uEsVA78N0GHPjGsXj1hxkrFbZmX7mN
	3YZx4sUmxqjveF4JVt+/F5TeKSOGYuUU7eQ2/TCoJieDMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjbbr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:13:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc40759b2so9136585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790849603; x=1791454403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FUYhHl20vJ4GbrkFUA2FDZPBlZ3YXgo1xmjRX6hONZs=;
        b=SRXfHhduY26uYbVAroQ5lc4g4l2IASiyuCO93WjkAr6CKKx5p/FOWnDxk7XUpQif6G
         kCSOA7VTVIF5mqa29wmJVZOhfWRvDA/9UnDUPYVqzvVc4JGE6EUWLOlDYLj4N4w3+PLR
         5DdxOiedjDriX42QGwkXwMzT0j921z3nM+3+dAQMy9hvC1Wui4OLXiPlAu52phW7E7QX
         XDn72RLXJrauoK/ciyB3r78fcUV9NfG/RqE6b3eQHCZ12Oj67T8dXLI1ENkU8CXqDux9
         4476WSZ7wem62EZbc0bAS1DIgwRCMg8wKBmb6DWrzV97P94fRB/7ls9BpyEzskwwE66r
         N3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849603; x=1791454403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUYhHl20vJ4GbrkFUA2FDZPBlZ3YXgo1xmjRX6hONZs=;
        b=cDLErXU7hQRs4RVU5UV5EU62zOdYj3Sj4f9aZe/MxMqTqxwzui02Jqyy2WiZCxqyDS
         5NHORToUW0RXQh3OiCoLHfo50Nf9zIrhAybX9nZXXUnD3aVqYgF+vlg8eTOvq6ORoHgG
         DMglhbqC029rkRlvc4+ezR8xnfD//JEoiEQFa29VuihLfpyU0LXXviVJmzL3cMsN6r5J
         APJKvzqP3Nb5zJNfYmZnOW+8pfnJXN1yGrhBJ9qWtcwuk3uaemVxBvGfPzliPAA07Kr7
         zI+6QINRbc/sdd+N7lVyNnvRykP2n59W1JsNUm4oViAD4OLbAkDU2ROHb8pg5i4/Gl2i
         iBHA==
X-Forwarded-Encrypted: i=1; AKwUvBwohf0Vp8xLExN+EMV+VopLGvYmyrfqThialewR/8JY7xwrnDIZL79U08DCGmWZk8jA0ao0NHFHmFKKYXCX@vger.kernel.org
X-Gm-Message-State: AFuF++kwGXScJtH0Vx0cziRjqBddM+QcYrPbv7uEXcq055KVcGt1T19+
	tEPgOKN4cj9P77LT7gNnpPm/CPjUDDjliQ0icO4x/l47KHXcT/moq9J/vIHBGBPBfskRx3biRSX
	BBNTA8L9/xkUJcdFFK/inxT/slSYsu0WhaD+vVUMUzY7NeatV1/SB2lDs+90X7oHzUuQe
X-Gm-Gg: AYBFou1i4iHtT1+ErZGvcSmXZnhOfyJx1vFwFj2uNyMEvYaYuqdO8eYSbvRDWpTDunE
	6GtoKdPdRDawJy5vVF6iQGyny+V/EZQyY3fM0OEAz8KZIh8FU/Ewq1ralU3wKWzcx1iH2VA/Z/2
	Pz9MAfjyiHpmW3IZlzjEgPd12N4VVogENLubO/iwgwi4lIVvK2Z/WRGPV5SEVF2BfOWD6Vc3hHI
	BR0bnq5/omT1ViTJiMMbZ3SRcWSKd36vUvr5oOgdfeWMfcx0+0ruuAzU2Jczexs1LCkY9vb5dJv
	9sIaAUy7wS/Wwi/IXzVUUBBFB7H0Pwm0s2+/ilaXwK+ILy7Y4SZ/K1DVItdB8tKsabC+BP4h+xq
	YyGgl/c65TjnnBv2jY/oeA+gktpgHF5iqG1hiKyRQKG21z883RE60X981r2KWWCYNjLU4JhFQye
	MoHIA0+DL8DIbx
X-Received: by 2002:a05:620a:c4e:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93ca97509c3mr740544985a.54.1790849603587;
        Thu, 01 Oct 2026 03:13:23 -0700 (PDT)
X-Received: by 2002:a05:620a:c4e:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93ca97509c3mr740538685a.54.1790849602886;
        Thu, 01 Oct 2026 03:13:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42faa877sm633191e87.25.2026.10.01.03.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:13:20 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:13:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 03/35] drm/msm/dp: drop redundant config_ctrl_link()
 from msm_dp_ctrl_on_stream()
Message-ID: <ktjqx64psvfmnfk2xnchuwfjblb6hhweoxd24najvpsohnmive@pikk7gtqp6hj>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-3-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-3-4b81473185e7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe3244 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=xvosr8ehAfmB6sJLDpoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: CPqdIlOVRw2xYLSTbOv1mZS_9R4TvvCy
X-Proofpoint-ORIG-GUID: CPqdIlOVRw2xYLSTbOv1mZS_9R4TvvCy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MCBTYWx0ZWRfXxmQ2jofX92BP
 tfW7zgC0CG8uXQqfb9VkknUIcmmSi7bznoKJsvrX+uSkozpFm/ov/obKzqTPVexhdOVbR+9o9kw
 EdLIbE+Vq7zrLqRcuGzKlpt931l/YFw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MCBTYWx0ZWRfX7KIhBHRxMQuw
 f+EwhlO4tkAFtXl6JXdfK2NafCV8XmYyky2Q0wnOyCqX0X3jFV+rugvX2t+pbIvNysjJz6lpoUv
 CI0KYDSzRZTWhQtAPgOCuNBCgEbne9Uyai0F2kCqqFFvC1Ny+/iiwFUz26j6UZKq1g2temrjOZz
 E6iAVnT3jZz/hkBUbpCMzr26zzA+W1LAcabk6mZ+S9Qve4ENc0sWn5NtlPNTUvzZWD9iI7KADmG
 IIUdPmX1kbliVBmGuGAokrK8ESyYFjsUZ5MWFgAmFHc1dWYE1bz3rD/Vp46Y1qMdUoA25euru+G
 zukSpA0hR4deC9/wV1bor9nAYGZuZyzTXGd6sR2JbIBVViXytUEWaibqaUVrTpBa9BsU5ZeejTC
 zo8249FiJLte3TWwTNMRkoc3h6wlkoVswia8V7xtwEXCfgrZuVL4mDwFtwBY5L2pAqU/dkR7Us3
 jeHIzWz78OjqsngJZfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010040

On Tue, Sep 29, 2026 at 12:25:27PM +0800, Yongxing Mou wrote:
> REG_DP_CONFIGURATION_CTRL contains link-wide state and is already
> programmed during link training.
> 
> Calling config_ctrl_link() from msm_dp_ctrl_on_stream() rewrites the
> same configuration and is unnecessary. Remove the redundant call.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
