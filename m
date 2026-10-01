Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7C82773F7
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 02:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820542; cv=none; b=KSpaCZeZbATYv0RGcQU12DF71MHkO6Yi67JWGh/KIOyZCvHQ7IdM9/1bTE2Juxg1Rv0o9eHHp9vi+ILP5n399gU1JOEWdGa90c0hOw92e5R+bldusiC6oK3PvQPFOKJj3bNZct1OHACP+NXUVRyXQTjyPhMMOKPP6cNkyxtjNAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820542; c=relaxed/simple;
	bh=nvqJHCANIoXVGxHP1HmuzW8LNYQ0bTNEIhhzUGY8EwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oi9XLkymh5EaB60bzEHa2ObHiJyk4dv5cz8yfdBbwNL03Abe7N5GwhxR5muZkwiolN9H7pHnRxrtzheEstXjmSusRebNHI62inxBkZYs7kfVIdVcXXGpy1HPGyfrLWbLQP+irfpEJ/0hD48ilWnjbcPZvfBl3yNeClFPuojuneQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElhKTu5w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeThhjuk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElhKTu5w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeThhjuk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910je1R719267
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 02:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=drdQJSVNiJggGHjwRXuZScgG
	pNHIrvBxG/h8lfRLgls=; b=ElhKTu5wAGzVyNoOMxsOnb0v4HyhDDgfaTmsZ0QM
	SHQblSGrjm0e56ZcyFeIU6VBH9P3sgpU4T0uiv2WnTEoMJM+l9bRs1SKx7sSwrzI
	Tbj0RXjAZFDaD0+UfS2YBNq0OIQE5EBBwiWxd2S19V6SmnqcNUSZHsx9QBt+5EOO
	wnki1f/InzmriZik0KuQ7moxI5Jy2qkyJPQIoBNNzEsa8olz9zqCWh3Dr5VdkiQG
	1Hxg+Y4biFVl0D1/C4TTEalds9kzm1t0lHptfEJWXVl4VT4j6QEEKJDKWjazQ98v
	ErWtyFbPt/GfDEU2KcJKQmURDRXIx3OGUCRGb7dZu4zy6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188ssasm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 02:09:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so121217785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 19:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790820539; x=1791425339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drdQJSVNiJggGHjwRXuZScgGpNHIrvBxG/h8lfRLgls=;
        b=HeThhjukrjN9h8knoxESVE7OpMvYKto+avVw7WeTGzeT7CY4Sm4wI2nVthIi2bCXeH
         qALdmourns/fe8dtnIpikkpObwGheAw0Kgf5ac8/vePHTum3wW5VcRqGA2zplkSVexVk
         7KBHMCWxW5b+laejHaVxl5oeWcQ5sgTU5swy67561c++6siSNp2HzbFE6+rDZv/JHD3Y
         lwuytWlnX1yKirC9GARtQSaNOjURLFfCteElfxTzpIXaakRKucIOEZhQ6R9LiZdHPHKb
         qgyS0q31aM2DPo3hGldILPHgzIl5JkuFBtPyFVM4T1/lVY2pKw+Wo8nK0QVOOWKllGEQ
         Z5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820539; x=1791425339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drdQJSVNiJggGHjwRXuZScgGpNHIrvBxG/h8lfRLgls=;
        b=b5wMqEz4VHEKR2KXlH731+mDaViI74wkeWANs1Ue5mFFGvbP0Nf6uulvNjLwNVhv+y
         N24eeKGb57W7h13CWeN2eKVpQtZA/hQnF1mLya9WlN3tSdF5ElxY77BmaoypEasYAUfV
         F1RZHy5C9GZMyyeDDS2yPAJpqArBGv/tTDQ2ZcWEzsFOiwZiplJNTu72V4vnJIKBtkRF
         W+HKTp+nPoqRX/Ij22FsFVbbXgrZEaXX2UpZkZj/r4p5GDgTRBI16Sy4nYfPcZzUXrPV
         ku5r3+B6DJtXixSWeqPxDtQKFCzYsgAkc0KKKqFwdurIjSdsM3a77J1tcEUt1FoQI/nX
         hELg==
X-Forwarded-Encrypted: i=1; AKwUvBxxIQXe6rw5GKrZ2n7q0lZCDjEpiEkkQDo9ZQN5Q/LxdlBFfkE0lB3gMzEQYUS/IS8kchB/KMzXSXr96LqC@vger.kernel.org
X-Gm-Message-State: AFuF++mAyeesnpoUmUNqQ5lXnKoyytMesTpcE3/tdHii5YLykByMTgfJ
	dd1iaOPaE9OjhlKBT/li5i5S4VAUh51T6xQDErHpbkXZylMw0jxpi1DXfyMuGjPbQ2A0nSKAo+u
	5PdrfVmgjCtNdn00z3JtOMbqhmLzT8iuHq5QgMjLPfCrJ4rES/I8Kn5rFo62MtN22RDDP
X-Gm-Gg: AYBFou1WK6xEmoF9lcq5wFUiEgHZbJ2fRtgNfJGznWgwGCMmNMiQ+0ejLYJTKMFp5AQ
	YurKwEUofXm3Ssgprwa0mfEwVIVoUoKxnES02qG6lylwSlt5SWGS06tkqEC3p01G3YDdlrqjMMz
	hoUUxYljMuB7v4ym+a7B9FlV4M2k7GnHHsiLZFsR+yaGUS4YwpiVTzVG4NrVOOKpWoOFW+i54j9
	i3co1N5k75BXC/c8YeG/XQ/gCVxX206xVF+9HdRropjk0RZ2U14100orwef49gz+EmxgkqN1pyF
	H34SPuWacPuR4h8PD9E9KjfsLgcmBlrZREeFM8O3tcRaX17pEfEuX5baeKCjwATwpjuYJm0ruxA
	tbYoxucLvYdXTzZ4Yvlc/k3+OZQChk1CjxRfSbQYvvKw3QUilE3KaPzynjFf+qRjb4DB/8ZtnAD
	+lE7VpzMdtFqr5
X-Received: by 2002:a05:620a:1a21:b0:939:2c5c:7977 with SMTP id af79cd13be357-93cac0bcacdmr602119785a.20.1790820539114;
        Wed, 30 Sep 2026 19:08:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a21:b0:939:2c5c:7977 with SMTP id af79cd13be357-93cac0bcacdmr602115185a.20.1790820538481;
        Wed, 30 Sep 2026 19:08:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb1e05sm351568e87.30.2026.09.30.19.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:08:57 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:08:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Roman Demidov <roman.demidov.nn@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: fix use-after-free of OPP in
 a6xx_pm_resume
Message-ID: <dnf7zmshpgt23eaom6pxcatxusouw3e2yt2kix7xkl2f2tkl36@f4n7yulqgctk>
References: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwOCBTYWx0ZWRfXwY5DKQaTHB4f
 hA9dOlYod5JOkBvlzuk5GUfrU3SdD4XXLxXzW+3hOjZnbMosf7+GJpVCXZ5BnVYx+0pJsGYf/cQ
 Bke3u8Wh/MZEv0lDMZpluXqTBDOcIz4=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdc0bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B-1eJkrdMcac_h5ztLYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pb9aZSD8E0dO1XjmbSQ7Ju7urSHWdh5O
X-Proofpoint-GUID: pb9aZSD8E0dO1XjmbSQ7Ju7urSHWdh5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwOCBTYWx0ZWRfX+vmY/r8YRxDP
 zDwxUTfgtik414cjludmxA181KkKUmEupWKHMTPVxeD0S9BTBffEIG2h+iAcmnSllx1CzP3/Jv3
 FyF6lWkEFx/b5D/Sj2e4aLmX4KEWtR7QqyHsc287hMfI7rYY9zmY1ZX+16hpfVSS9PL4/qpihlp
 mwsiJNsPok4HMQr9xqKZR6zqC5RHRB+5p1Cb1w79cje5TnjLbZ2j5uR/3XTzq9vF9u483kAYFmO
 scQzo6HM8sHxMBvvTuR2zQhm4Br2+LD8hwHnRi8QGqh2mi1Uh1Hrkx6xXW7SM38HYwCqX9MWGSs
 D5F+gnXwWl6LqR5DuxXkMP0dJC7skSgE9jSblaskIZvl6T80dqAfkl0GqyZ+i4K+2EsjECUKQUW
 OKA/y60IICoRbg2Jge6/9jH+m8urOTTPGEuQCpc6diG778k0tOtkMV0Olt66VVemD2cMjInomUW
 8JeX5MzEzib08BK3cHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010008

On Tue, Sep 29, 2026 at 05:20:58PM +0300, Roman Demidov wrote:
> The OPP reference obtained via dev_pm_opp_find_freq_ceil() is dropped
> with dev_pm_opp_put() before being passed to dev_pm_opp_set_opp(). If
> the reference count reaches zero, the OPP object may be freed, leading
> to a use-after-free when dev_pm_opp_set_opp() dereferences it.
> 
> Fix the order of calls: first use the OPP to set the required
> performance state, then release the reference.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> ---
> v2: The dev_pm_opp_find_freq_ceil() function returns an OPP object with an
> incremented reference count. Dropping this reference via dev_pm_opp_put()
> could cause the object to be freed if it is concurrently removed from the
> OPP table. Fix this as Sashiko AI <sashiko-bot@kernel.org> suggested.
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
