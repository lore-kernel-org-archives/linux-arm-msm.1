Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793373890;
	b=VLcq6ZH0suQqbI/sduNUxMZQH556vc6KKRUrMznVUsnVPFIpCK2t8nr+bKBi4CaV2p5X
	 5EKEeXveAZTJfggzBHZf3jV1Hg0jkeMkmhWIxh5FsBEWWakyr4rayLU0bkBmbErN89Uci
	 WU/Y7zJG3A7TyNPXpN5LQrszGizgMPwvkPC4ONxK4IT49LF264nleW7AJx5LAX3MfOxFO
	 NtpldvzHFDaV1fDf49AFJEloO7fYFOz0WV4zPTbel1oRMw22hG3cZKMcP/Fcg4l22/9iL
	 KIh8I+Q90LIK+ZeuLOXUGs1yqEthEG4TemPFYi1WS7XZtkP8+CDQfPsAGir1W1k4ACA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K3VqXyfdn7aZvC6p6W5C0H6nzI/A5JqmWJ506i3piMI=;
	b=ECbqAhfvJMNKKl3AS5l3ct8LEq+0I0ti9a0q5mQ8rolUs5hwNefP4gSa6AlYTyyTpw4b
	 yTiwYd0SuWYJICOCzm6u3wy4Dct9GHgiOZIgfzfqJW8loyFbsVIjJ/vbPNkHfKyslRzOC
	 zOsZ1AhE8KDjXOYPw4NNXIKpuM7Rq+vyt5h0oHy/xoYdLpe+doyM87coL81lV4NzrVEYE
	 Ams5PFn/0KtvviL83KqUbdpSfCt0jI+Pfuq717RHbaIEtsNIMqMRZbPIxH/xjWnyO9qTX
	 BhzQR/jXtNiyaFiMfo34SXgvQA32Zcw7JDO4IdQwRDU9EcqiBybZeYDecso9MfhGc7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ngBIoon7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KByB7G3V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC2606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29CC2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ngBIoon7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KByB7G3V
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER4NR378030
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=K3VqXyfdn7aZvC6p6W5C0H6nzI/A5JqmWJ506i3piMI=; b=ng
	BIoon7753itXocLi6kpSZ76gyoIht8FUgc6dDKyKExdonJVl8vQ1NXmSk/QSAB5S
	DN22e5chBcSmc1FKASMIT/DJyPNq1RNPL/K5E/FQ0NKIXx1yg4m+7wVjegl4bYAn
	Aoy1TmQOR1DQqcJxQnghj+lWVFgChBbdv0xpdaMWB0TFkWxJo/P+tbHfNxTtScBR
	RjbwlvH3Pj1bu5XOxYEt0WhrACo25jzVjW/+lOaV6BFraUZZnBVM851C/CmTv9fW
	eqLS7l1Z+wQxKiAAbuiiu5VLl/sMGcG1C7Hgh2dn/p8yMkW9XT3Lcunhk2U+rJji
	h7OjaF0A2hDjorWO8CSQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme753q8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:24:49 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-49e5451d6a5so860562fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793373889; cv=none;
        d=google.com; s=arc-20260327;
        b=ni12djMUgOhvDdE5WKAqALIcrdw0sRA0jlWslC8YVXrn5k3pRPuViCnk7lIMUTRudZ
         R9koDV18Dn3vNal/HvsgTxvSG71NlIF7CqFHwpz1UnmMyVtd57asfLTyC01tHy8io378
         7QrNCDhklwkMCqfD+kGbcJhu/aBEskPg/6W8Fg/mDz4HA7zWjpoejtDmkalpI71yhxWF
         dQuIWh20OSC0vD505Cow/XZoSUvzc9eGucuP3+sqmgr8pqm8HZ1LSoqFOnadhxd8wK+T
         W4Qf7DcXtNKMxpiKKYyyrQXnT7J3G8/+/xH5YLZ8oTlyhab/8J6zMc/AW8HkuyfaKdOF
         bsxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=K3VqXyfdn7aZvC6p6W5C0H6nzI/A5JqmWJ506i3piMI=;
        fh=muPt2XKuCryqh8C2H2S2j8UFAU2AQHw+hLf0g6tMYPE=;
        b=hBWtwcE/4XX5LWSqAEIpaDCUZB9fAaagpJW5QkAchB8Z2vof9IEelETXIz10iq8DIX
         ByTVDe5LgOFVFHltcdxy2nkYm6itJPI3D4pYCJnFMiS/IQYjw9K7vjzoOFqSgF03Ue24
         9JOxik9S5u9oz+ymMvU4KmzxcxIbsqx9cPGJvy/EsAdR+GOsc9QN7Ss8bQIMgmm5JBLx
         0COX8NJi/NJ8nEx1jcPqPjiI+eT1U8AW37BgoyYV+XQgMUDLRnaitP9XlPmSaCfJBoYF
         3hKBQ0bAm7bPTui0ZsmjpcwD/ubVfYYSXiM66l+5yVty/uupvGGxx3/Kp2rIJCI8v60b
         nIlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373889; x=1793978689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K3VqXyfdn7aZvC6p6W5C0H6nzI/A5JqmWJ506i3piMI=;
        b=KByB7G3V+IQPsPzkv1wPudONq78I3X2qHxvhoaWAQH2ktKRFur9cTK2Ez6TK1PA+zK
         lw6Hrqj8D73ZMbx35Itu6nm/itlpBAU56YBTHLMvv1vr9lAI7Og5EyJnZ/DQvDiaL//4
         tVmvMt9FDNLMfQwXZLptel+iXMqOHS1cJfeM9dDRaQMIsrmGatTmRoeyxUcL8KJ61KU6
         /8yPqHI/Mc3er4eV/UM2eqtVwzJuikebWj9j2ZLhLzyJctomz10Og7ZTvlVMmh5xOdth
         F8sVsQEBOfZhd6fJ4JayxAVC+twAGDksSdbmOZmhqEgShWki9HfJNDJgN5AWZ32JI3k3
         +Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373889; x=1793978689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3VqXyfdn7aZvC6p6W5C0H6nzI/A5JqmWJ506i3piMI=;
        b=1YNRxv3nkY9aKDljOKgoyDzTuBwHfEZQXHEYZVxFbDKBgK709pmGuQHHfGBKHapRxX
         4dWbHtj/wGS4ZUOkOjx3gGXtR31QzAb6Z92mIKHwc2sZXKQ6zVfCwxehj8YLEpWEBhZL
         xCIg9TjKs+jAjynjuBGHG69sm0gaTiW/7dGOcYo/ReV4Yx/+sXQsolYpK3PMiuHBTFjc
         1hIbVZYdrZfhcNn6V70AqweAOZKeZGOmZ8OFx2FTd0q1GkZEFQELv/JGGiKRwBcITfXp
         Xa4v5leVanjj3fPuJ6sUfjGWrFFEB6XM0ofDvHXLHrUAj7PS/Z0INw70tx8rvnpnLepu
         MhCw==
X-Forwarded-Encrypted: i=1; AKwUvBxdSw4mx96urMcl3r06cjQiqdd75sueKvt8Qv12TDajRl1vkSvmay/ebND5rHww2xiX91HCVYrVFcBg1yCd@vger.kernel.org
X-Gm-Message-State: AFq9FYLVQYTk18bAFkgj7fuZIvh8xFQYuR6kOOhEu6D6WQ06KhhrZlRi
	RLiuX6SPTp99s5QB5ZI7lsZ+veNCgjaf0QmWa2ua3p5CBf+lq5oKHh+SU8vIXlfQzSonoKRNNkO
	7R8uTBXw37bdRsh6G5JgISb/X806GoGHfRxnDV9WmIwXqTOpTxQzMPZoNbyX9bEAeSrVx73vh3x
	Q2KwmlxRMYMfPkl4kTN3pzf0qKFVrFNlRELRYkPf9c8t4=
X-Gm-Gg: AYBFou11O8E2asvtXcQKEf35UExc5lIRxPZvYJUE5+caxUbrq9/GvGP1iurmQtRxVgR
	25SDc97Eb+ZsI4L7y0f/Ds3vxxmlxxuO3J/QkdGi7bH9XBssIgUO6NBcweBBzw9fAUM3cD22Q3d
	D3/rkyVypmxk/bnI+gxk/MAokO0MdR1urURyp3u6NfqnYgfkrj6C2bqhNY9A==
X-Received: by 2002:a05:6870:142b:b0:493:186e:b51 with SMTP id 586e51a60fabf-4a90765f95bmr1797645fac.20.1793373888586;
        Fri, 30 Oct 2026 08:24:48 -0700 (PDT)
X-Received: by 2002:a05:6870:142b:b0:493:186e:b51 with SMTP id
 586e51a60fabf-4a90765f95bmr1797609fac.20.1793373888097; Fri, 30 Oct 2026
 08:24:48 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-13-robin.clark@oss.qualcomm.com> <72mcRc_XaEFYOXsQm5r3_QWSIcGfu2OOwWlCRp086BzS5v9e19_2L3wttKhZOHho-XlIv1lZODbEYPFwnSVWDEQXgilHOfqgP5U0t2xsNcA=@pm.me>
In-Reply-To: <72mcRc_XaEFYOXsQm5r3_QWSIcGfu2OOwWlCRp086BzS5v9e19_2L3wttKhZOHho-XlIv1lZODbEYPFwnSVWDEQXgilHOfqgP5U0t2xsNcA=@pm.me>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 08:24:36 -0700
X-Gm-Features: AclHuK8BnLlPd54aThROE7CjiGNynTqPFp3Ou8wSOh8Og2sGLyha8Oc-svz3-gQ
Message-ID: <CACSVV00SZWNNrY12Zw8NKUksvEagDFEw1S0jJxLNVvc7kGVfZg@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] drm/msm/a8xx: devcoredump state capture support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: kSPvyT963lEcuN_BoynA-1j5ngnfFgA-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX+Ihm2yVVZrK1
 dnNGIYB2wz3Bs4jW4euEyR/M8ES/DSDC5kNcR/+hoIZBkfZywH+wm292OwoJO2tK3Po9aWV7m0G
 l2Lo8zOJ9TqmA24IwPGi5u+DCu+xqkkVKZYFiLhfZNouohHkNTHssjibSAt8bdEsRKxb+eGd3AV
 VlE7+kpRRbRRWymKBlL7LkmkzqKhoYFi6KS00pIQEIc5BEcaTsu9/OYa8FtmhV+0vtpppUlBbG+
 QAc7zQYmVHUJGaaHUoQB91qiwAnh3uUXZBy7iev6GEIYUepOJETZanj3UO2lDOENLhiUsEgSgvT
 zI5yDnXIKcXkGUZeEyWyXYE6j1u8Su1zHHjxhREUaE5o8trMI0TJ9iMUegZa+0/h7kdB5+0EA5K
 3bXOvtVyJn3z7FyjUSDcpHCQf5R397AEx5Htfs2CMbtss8nZKo4zu+93B9D1BboO/MH3SzfG45I
 xxfNy3IUJ7BqrY3oD9w==
X-Proofpoint-ORIG-GUID: kSPvyT963lEcuN_BoynA-1j5ngnfFgA-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX0+kxfi+Y6lAk
 HApSs6ppazimhTlOquaPdeOjGStg5S3+qXGSWo7cMhCgQB8M56ndbgn1XGSBgfbru3kYUSXEmQH
 KM+RgFcZ/eYb0/DmYpu9EjXn98G+QQs=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae4b6c1 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=hxNMMXO8-ik_v7z4v3UA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300061

On Thu, Oct 29, 2026 at 2:20=E2=80=AFPM Alexander Koskovich <akoskovich@pm.=
me> wrote:
>
> On Thursday, October 29th, 2026 at 4:20 PM, Rob Clark <robin.clark@oss.qu=
alcomm.com> wrote:
>
> > +static struct adreno_snapshot_sect
> > +__snapshot_sect_init(struct adreno_gpu_state *state, uint16_t id, size=
_t extra_sz,
> > +                  void *sect_hdr, size_t sect_hdr_sz, const char *func=
, int line)
> > +{
> > +     /* A few section types have no section header: */
> > +     switch (id) {
> > +     case ADRENO_SNAPSHOT_SECTION_REGS_V2:
> > +             sect_hdr_sz =3D 0;
> > +     default:
> > +             break;
> > +     }
>
> Heads up that I'm seeing this warning when building with clang:
>
> In file included from ../drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:9:
> ../drivers/gpu/drm/msm/adreno/adreno_snapshot.h:398:2: warning: unannotat=
ed fall-through between switch labels [-Wimplicit-fallthrough]
>   398 |         default:
>       |         ^
> ../drivers/gpu/drm/msm/adreno/adreno_snapshot.h:398:2: note: insert 'brea=
k;' to avoid fall-through
>   398 |         default:
>       |         ^
>       |         break;

thx, fixed.. not sure why gcc didn't complain

BR,
-R
