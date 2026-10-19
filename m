Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441949;
	b=bt1vpFtZGy1XferD78JpbNUfFsgVCEP3X1W56556WP4UCtfERBjc2YLQ22iuC2Ti3HU+
	 DuB/iChI62icl4q7Q3PkrE+iZQ6NGxe1Q9ibj7FkvSZGJ23+E0PuohXN8vENRKfrt22qo
	 wPqkMQ4SeOC43R2d8qSDCv70Eua6p/nK0DDQz1ax6SEydLKICYNbCqP8r8EE8lWX2RsC8
	 3UMjmwZ0lH+GpGd3kBJ0WyYLiwrUx8OYOZdtdHc+msElaUmgkHqCyVli9TA2S/WIRiC57
	 S49pCPCyN/QUTiW/l7ivXICROE/QVVmuKJB7pEJ5MbgNUNYcI59eHbqe1tSoe+4Yxpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WP16KsMS9UndTPVKVIGZFfnhHsJS+B7A6404Qzj4ck0=;
	b=5HF5rJiWMP7DhmOwgOm2P4t+b9N7ttNYT/QByqHKoMKOqhiRiJEQFfOTv3fL+vCalKrT
	 HUjupPH09kgqJU1xUSTzk37h68Vlq+zw6+s1U8mKnrn4FtgembxJxHKCRUGV4C15jd08u
	 p6G+HQGtMoe9bC3O5vQdzkeUIcJkm2UkLmTtymzldoTwc9uSpBB8ue8aIDD2r+ctZjkVJ
	 6uHX0LNt6BBIqSmp1QTUBhX8MAE+oQDFEZOrCM9FcHGQftTUzA3oRNUo9xbKmPdFGzc9/
	 Fv9jqXHSm+X97fJ75DYPJOokGgH9r6fgUIU/omU6OQGdWVJwhQqjFTlTt3Avc2ObHww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oidO9ov1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TizzbNKm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C73F606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 20:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C73F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oidO9ov1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TizzbNKm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJKAkQ3475832
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 20:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WP16KsMS9UndTPVKVIGZFfnh
	HsJS+B7A6404Qzj4ck0=; b=oidO9ov1cjN/3fBf9GYVjfKzjKLzVOUFeSsa2A4F
	wjEsy0IkLqjkAU/9E+IiZ6SgaLaxUtXe7R97+2Wv79gM7oJQlu3IEwEede4zf3AO
	ruRZf+QmDA+dhDJHnSnoP0oRVEEDzfeMjFQsb/dgQ5oYnydshZVGTkXtmGP6wOvq
	0+wT/E3k/dniG2YgidT30gkVDku2s6Snaimj96tcPVeJoZmJnbhAIrlj6truQo+M
	P0pbTwrfqSDDjrO24IV07pdSH1f7tIeKoQ291s5cnzWM88ouRhIXDM5WcX66JGrl
	H1A9dLQuCZyM6CbSBrKC7bnvKyE6b1VLwptXXGLY98co8w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdqtf8n14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 20:32:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a556c43so58341006d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792441946; x=1793046746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WP16KsMS9UndTPVKVIGZFfnhHsJS+B7A6404Qzj4ck0=;
        b=TizzbNKmtvT02cNjNtZQog+ky8NF4nYdpM7A2LSyEeVn3H1R9N1z3TtXXmYCmgwLXI
         bIv03mC/WNnmDA7jV1SHhs5OjcemxVxDa3+4QTz/OHjw/urQhCAWDZfQhEV7S6TSwG8i
         RjMlpED9khV8u81tVuC4+fPZTKXnVbq54UVbhyibKY7DeTBaokOV1BDcZXX9B3wFC9EI
         lbz0bnVfIftnLWG9jfhoD/6ehfIUfKuDcCDo0nZRv6tswt5UDIBCl8CdZ4631WgDXcMw
         7ApfTH1uPJSkPArqTY+HTTiBiJkm5KlMdaQMNxaRNQirl06iyQinnvf4J6waSJSuvQyv
         BJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441946; x=1793046746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WP16KsMS9UndTPVKVIGZFfnhHsJS+B7A6404Qzj4ck0=;
        b=uSg0A/O6QwaRqs6rzQquOb2n3b8Y2+mXrF+6tm7S5/o5CGwGvM9v/5ODtGjyqXJK6L
         XffSIblZqyyVXToTKss+zi18ZyDSBWg5ildCiTbowNTUkDXy6WX1ill2skwp8tV0DQgH
         ANYWNKjGXw7sLFzUgHRUv0m1KaUcVlNYCeJrx9ZPiG4X06Duec2ycqSEp//B1NG8RC8l
         9JVj075Scpe2znBy5Z3u6nXViEDtcDQz9P0ToKe+yhCMsncrHB1yzYbhO7k537Q9lhWq
         R+eY8Ums6FzOfYQ+iYC5vgXoSoN13phFq2VXiPTlIKsMoF4c97xCdLKsAx+Qvfj8Vfyr
         OiuA==
X-Forwarded-Encrypted: i=1; AKwUvByrjyzexJwpJZA16YzfjzOJZbBzIk2rwhJkERz1TiRnvAz6nhlqKYTbLmlAtIFOXRwUD37GkBm4I0utFh86@vger.kernel.org
X-Gm-Message-State: AFq9FYIB5qNPT5guLrkTOYjNft3VkG6Bb+1QgPP1/EZJV42i3TVXmSsP
	MGk0CIgGaT8dDI4d0wWGJp+5zqhX7L+E7DxcPu1fgF/e0RcLMYjAo3KmiEhPF+n+4UneRc0b4eh
	4doUEzQbzLK4Uhz/fZX96sDeFhpJ1zUDdMQDyjTL/uDqfM53UYWk8Yj8svSOIdl0HpnZh
X-Gm-Gg: AYBFou1o6lK+LqXQovlDrnFUP4ijyZtkSJ/05yR00+09Vh8Ra7Qfuy5mfXwXjHYraMY
	ttcqveoMoJNps2FO6bA3+50vFxqVmn4+GK3vOlZ5YUNQibuqSTKljZsS1iWluJNjBh2l013qRbt
	VR/DoBrJ0X4K34WdQAH8Ts1Ut2VfdW0He36YHzjecFj51WGQHEuZ+4dCP5mWbD0fxFiSL2gMiAA
	uwxeSeM2MBF5BBR7xFZjBuDbZHNrX/xzuh9nV2X+g63QcxJ9p2LQQKwLmREHN+nytqBATQxcSqd
	fxoIEogfUye5TVAQnKNmj9e1/tC3iJ944QShcNegVCSjwY5bepROvp00BoFO7A1at7atDo/gVEz
	V1ERpwszCKMLzPb4U
X-Received: by 2002:a05:620a:72d1:20b0:93f:34b0:4880 with SMTP id af79cd13be357-93f34b04abemr804967185a.22.1792441946339;
        Mon, 19 Oct 2026 13:32:26 -0700 (PDT)
X-Received: by 2002:a05:620a:72d1:20b0:93f:34b0:4880 with SMTP id af79cd13be357-93f34b04abemr804961985a.22.1792441945686;
        Mon, 19 Oct 2026 13:32:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm17135825e9.15.2026.10.19.13.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:32:24 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:32:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Message-ID: <evnzk3qzvvy2pmf6ndffqamxf7sv5hrmu4tia342tmix2xhoyb@czxgky7ywmx7>
References: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
 <20260516-a8xx-clx-support-v1-3-62508bf651ac@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-a8xx-clx-support-v1-3-62508bf651ac@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SpEFe/O0 c=1 sm=1 tr=0 ts=6ad67e5b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=PlByJ0tI-E0pWcfLig0A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MSBTYWx0ZWRfX5Oxud8RSZOWE
 FKSH1eddKQ2tO8yFntVT57JshJIXHkLP5khf1bgIpU4GnPOnOpA/BgIpi4+DLBfPi6n6TjTMpyQ
 UhwpHovEf5Rx3ZOtcflvskajeIMXKLLX54ZMRMVYrBCbaKse4aTBwks5b6TflZE45UFk8ktTsSO
 TGPmIRG6XkzMTjmqoM8OIAgjO9X4JL3iTqbUZXVJw91gDM/hgH0IUkJVCnEkR9m/gtLu4yqUqmE
 SbzWzz4kgpYvR1Q6+4t/PDxeV6EKMS28Q31xflN/X9jagCkG5mWhzX4VIhG7pJ9pEgnqEGFSovW
 OrblpSX4XDvMxzAGjrOKdTkNB1I3tnUXE8+1nhHCji2Yasu/jakESCOE8rSHLWO4+7gLTSaWHDA
 evXH65RA3cWpbchdkhFtZnk/1KzSf/3+8opXIyQSl2us2m79sHPnLMCK/zopgzcoY33SzviOjAu
 9DSBlKD2tTit+11Rkwg==
X-Proofpoint-GUID: b0Y__mh4I2L07jAhrEMrixqR41g3QV6l
X-Proofpoint-ORIG-GUID: b0Y__mh4I2L07jAhrEMrixqR41g3QV6l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MSBTYWx0ZWRfX/wEHMzv+VbIw
 dsShMmeMzQj5PDHYeimKN9Dp1AkOOzgvFTkQT2Rt7B752qmp0s41cENzhsSii9Z5MbXUcqm3fdm
 HuaM55uf3R8sqjs5lN40LN7+WmlNPMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190081

On 26-05-16 01:37:51, Akhil P Oommen wrote:
> Add the CLX domain table and the IFF/PCLX limits tables to the catalog to
> enable CLX feature support on Adreno X2-85 GPU present in the Glymur
> chipset.

Same on Glymur CRD with next-20261013, GMU fw v5.2.38:

[    6.619232] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for response
[    6.629590] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
[    6.629750] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu [msm]] *ERROR* gpu hw init failed: -110
[   14.795082] platform 3d6c000.gmu: [drm:a6xx_gmu_resume [msm]] *ERROR* GMU firmware initialization timed out

Dropping just the .clx_tbl/.limits_tbl from the 0x44070001 entry fixes it.

Tried on top of next-20261013, no change:
 - the QCOM_SCM_GPU_CLX_EN_REQ change
 - GENPD_FLAG_NO_STAY_ON on gpu_cc_cx_gdsc
 - modprobe.blacklist=msm and modprobe msm at ~90s, after all sync_state()
   calls are done

So on CRD it is not an ordering issue. The CLX/IFF_PCLX HFI messages are
all acked, then the first GX_BW_PERF_VOTE never gets a reply and the GMU
stays wedged after that.
