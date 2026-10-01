Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8344F054E
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850798; cv=none; b=u4vTBgYz67xKyX/xtwrpTeg/9W0w1bVcJETrMGuVCAl8uZqbE6pCAGCeWLZmezDWzi5oHEKa0WfXXb+x/t/Hnw6bwJsUTegFMU/K9IHjcn2KJF/EBn/e6vXr6QtGzL9t3sinswNoFbGAKjN0+PhjusGe7dTGXvp9TmudU686F18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850798; c=relaxed/simple;
	bh=tJTffJZLXlPGAsrJc39ZqaTSQQX+mKudeITiabdnp6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UM+rHuDl8tedemXe06U9H2A1Xob40Q1mhRVo99mc1YNue6XoxQ4KcT0oEtkoAcC0vV3nxk0kjYTqLylOSxyVgpDRg0ufqN3ri8sO9Sh2laQdI7TZ8TFvwT6GvRZGnd71yK8nXcNpV2N/7Xsy8iLhBy8It17HoTl4n8ZCgXhK0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NE+p73bP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1G0ygvI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NE+p73bP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1G0ygvI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xmpF1661071
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 10:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z+fRcNyFokIOP6C2JoqZvYe6
	PNaD5BlV3HutyAbAUA4=; b=NE+p73bPN3ahQPGdIi5YY5hyFQ38Ob4Ba70MnpBa
	cgNW44UkH6vzVqdajHLjAeii2LDUhmWSJ3wRttKId+OEvJGTAnjz8teTffNhoHbr
	vWJnUH3+M5Gfnd75ULtX/QjNhmAGDeM95iLyM7PocPcVGCTSX9aE4rjUIbBZE00c
	hstLQisITl8lErsQDpMJ8msWZ9vAlfxSWNBv068rjBrt+HmDVR6KFE8nS6lBrA4b
	50ATa2Sv1NbKsKs7FT7OH9LS/63lPG5GVZTjpi6FoyZKDbVe30we+5UjqgUOon2x
	khmPUdweZdqOTUmvbAcwvvobXlh8fdmW8XnoAQeh6JXHxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pky3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:33:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1e564fd5so1149004685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850782; x=1791455582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+fRcNyFokIOP6C2JoqZvYe6PNaD5BlV3HutyAbAUA4=;
        b=B1G0ygvI/kEkexvcG/wpvtWaB+uQ6PmxvmLW0lPy8AYYMwfus6VXCnQBW7oxNHAaIv
         WVZEZcZGnrp5pqrRKVtgLryBd8vzstRRnjJXILunG/0Yxurs2Qs9nSnbanFLf+S1qghf
         vaoWYkNDl0MjwSwwS3ql2Lzra83+EOYK7t7e1P9q2F3ibg5GXMDzRymIeU+LfKmdXnCC
         0DnrviSz304/ibNSXFSZRP71nUicAYXbrNjF6tkFD19vnIInFDx9cFbbdyub/p7D+45C
         6DtoYCDjaLftHKmVFlwW/bLo7YOgvsgZx5WDvn+e6Y0wuZqifQPbE6fm4DgI5lbRNVA2
         wdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850782; x=1791455582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+fRcNyFokIOP6C2JoqZvYe6PNaD5BlV3HutyAbAUA4=;
        b=Pz1+oezEd48pmYRbN0WrzGBSjllhOctuJLJ748LenD6KjE1zOA/QW+DKsQGx9d2Du6
         gkiyte262NrxowkmMOeWnMDH5kAYWRzYBnHRB9GfPZDrBaCayNNvWlwJCTG5ZM8ZPp25
         cy3gsLIgoMvxqwx+doHpFYfgNegMcX/HlrPGDKJcoySC1CfZQ/laShICIv9+tQk0FK/k
         CF3qjTP7NUsBd0ce9vxJuvmF/edA8DbF9DJu6BDEJD9gAIEbrYHXLR8Vlgu/QtfrXxB2
         FGdOr52ydYILmE1DRm08y2M7ak2OagSvVQxAFNJV7aorIyL3rvtQJO1FWr0ndRw5+COP
         WvZA==
X-Forwarded-Encrypted: i=1; AKwUvBwhKPRAoobSjYOpEDxT3zHi40Te8m3ELCMP90iitO0v2T+kZ4prKYoUCkuMtOVdNlinPm4Qhl2DoIG2clc8@vger.kernel.org
X-Gm-Message-State: AFuF++ki3vVPsp+nPeLvWwqm7YpCT57zOVUKs7W7M+zbZ/33zMSOV7GW
	BS6RuFbqyWEaHNJ9kpJxX2rSvpR5HMDzG6EeGmATh0Xmw5VnsIY/depSNX3qHZIXZL1qLKXePxo
	CP1B67XZ0nLOg1u4dBIJFXpdIAB7B+zrYGRkXbWzVDxn7n5+N+9xm4mvMKPjsmYkFE13F
X-Gm-Gg: AYBFou3HgMP3eC1x8+RRSBjFRofyEcnhvlfHMsdD72i3v9sfzuh0hRsM6j+QzQkPqyX
	++ytJImq72J7UlXmnGrSUr0AqATaSJAE2eTz7/QhMBFZwVuAuAnU0xoZQeYZSuj/JHF5qcmMggW
	qB+eRe4CnsSAU6UTUY2cwFlXjZkct3C9rHWDTkyhHPcW+6QOS5x4D2KEtkVSvnmx9EqVS39UMjM
	XrOC1jPRZmxzS5esfD3x5cQWdp6Io0Z2SFIu1JRKj2ynuukUdUno6oLXqXGDPrzcKpHCgGvwiiG
	KIQEzrxDQ7u9peNnOpfkE8eXrzBEnl6oKTkNhKOzfRam3ZeZzKW7ojOwO64m9HGvr2kg/GIDmkM
	ElVYv4M7lloWq6Ahg44Sqt1qG1fM/uTW6btGmxHLNfFEx+l3iU71JNmJbVPqcsKjXSIDpgc6mBA
	n/7ERmgGfrDd2Q
X-Received: by 2002:a05:620a:4153:b0:93b:ca79:3b0b with SMTP id af79cd13be357-93ca97a1484mr787790785a.24.1790850782128;
        Thu, 01 Oct 2026 03:33:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:93b:ca79:3b0b with SMTP id af79cd13be357-93ca97a1484mr787785885a.24.1790850781615;
        Thu, 01 Oct 2026 03:33:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba44059a7esm460736e87.5.2026.10.01.03.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:32:59 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:32:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 08/35] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <aolbmfnrk6qkfifib6bmhslaro5z2734ydfip4mnn3go4efpsy@2d4m6nnh7ogv>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-8-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-8-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UXTNURx0wg39c-AgIenMlYV2lAZxGdvT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX+QfxaoyqPfmY
 c8AASUJeNz4M+YXiHlQ+RLbkriDgRyLXfvya7Xe03BFMcF4Nsi5pgU2oiENrEFXgp1f6pL10pXs
 UMLtuc/O+KZyg5pgaLvfOZrB7nHpBtk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX7P/JFQl8hL/H
 2Ki9k0qL/glN0Qe5jczz3iXKiYKMV801GqnaEV4398DgYX7B72IEgOgIHclh58xpCwyx7W8PJXv
 LGzyZaYRgqRI1FdtH9FRmsf2kdtCBpjX8bXHvDCyTwzpbJxZfBg7FIkpMLWjj5B9gdpPAiqRNnY
 +DEMqPPZnwpKxlt8E4B35akMJUT6vBS8DIQoNUm+VOFxGRWg8eb7dY8ZJq/eBlh3RDChY/i4KWA
 ncL+QdrL1rSjN+bKaMs2ZaGLpEEK+lW2rRIjAetgbMZRoj3IdzTSdAgiDj7kJKViQPElBrbHrFm
 lpMyLWyPsQO3bnsrOjGj8PGtikVzcFuoG3xMa4zDAiXCDdRacPu2KDurmzb+47WNiecLmYiISxv
 j1hsZ/PmH1B8NveKNCKtZpfiMzDdT+gBejFrEkJNMfeZ46/UWJ1zn+GlaUxkidgb/yNGAIF07Nx
 szJ3O9K0thSM48LRgAg==
X-Proofpoint-GUID: UXTNURx0wg39c-AgIenMlYV2lAZxGdvT
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe36de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=tbiIBGwOz-cSeEb3_YgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010041

On Tue, Sep 29, 2026 at 12:25:32PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Whenever virtual channel slot allocation changes, the DP
> source must send the action control trigger sequence to notify
> the sink about the same. This would be applicable during the
> start and stop of the pixel stream. Add the infrastructure
> to be able to send ACT packets for the DP controller when
> operating in MST mode.
> 
> Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
>  5 files changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index e1614bc49a7c..65d22505c2b6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>  	bool core_clks_on;
>  	bool link_clks_on;
>  	bool stream_clks_on[DP_STREAM_MAX];
> +	bool mst_active;

I really don't like the idea of having this flag in two locations. Here
and in the msm_dp_display_private. Can we have it in one place only?

>  };
>  

[...]

>  
>  static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 83117e7619f3..472429d09200 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -19,6 +19,7 @@ struct msm_dp {
>  	struct drm_bridge *bridge;
>  	bool audio_enabled;
>  	bool power_on;
> +	bool mst_active;
>  	unsigned int connector_type;
>  	bool is_edp;
>  

-- 
With best wishes
Dmitry
