Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007728;
	b=TZWIJBhgIvuWT5igtY6Qm3mVhZqUlhtMkJi6XC8fk+/HKaBME/ep1uzbk0VgMFDbf4ZV
	 /cs7rY17lBQZaJ0PHK+NyA2xE9scPbaVcljOEdSd7FBlYBW/UZN3WITRoR8sMknNPcJ1Y
	 bw76RUatJdaWonl3TUzSAoPYyTNgSUx+BpJ+yxsrDa+iElavWUYHJ54AWVAgecywwS5qv
	 d9eIjdxgEG+FNRMe/18tXmw5QPrkURkjKoWGCL7ehkd5rowdMt9ZVjCVwXYAuz+0SMFOv
	 ub77l9Oyt6m/gVufri1uKMkozU9hcSTX5zTlw8IFE/CSFCB2NuyYGXva7GTXMojgHcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EPtH13VTn4R7Yb2sy+8OKOvdDZ5ZAvbReyMqod1w9Ds=;
	b=UvA4EoDYI//GNny0O6XV8khS7gM9jyixvFztu7NsMzvm+xLWvVMHGlp0JlMSnV7lqK17
	 A6tB/kU1Im9LDEw0WoX7uWBQZ8k/5kCYEnKYTAxCPWb3z3kf+Jp8Pg/f9ljHCjxIAnxeg
	 pSJVbbMLXUU2eHRQ/OsUumPiuGLDSxGPu/CiyCDKOyP60ZvoRd/Tzcp+jsHcXWMZN9Xe+
	 A1gWY/nY9sA9JAhzByrnhsS6NHz9noLCDF7LJ1ZQYEc/kT4jmvz97nG4vtVOLmxEgwVDf
	 lByC/M3Tmq7SezEwUC+tPeDbcE+mMIfBhbSpYpJaVuzrDMAE7TgxKSoFv4b4n95UdOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVKefm99;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+xUAKHn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBE0606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBE0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVKefm99;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+xUAKHn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4ausN2255121
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EPtH13VTn4R7Yb2sy+8OKOvdDZ5ZAvbReyMqod1w9Ds=; b=HVKefm99672kmLwm
	g95SEjJpFBWotCATx/LSN0mCzjCoZ+VneujD1PYIVRclmxKqeCKxKxalyWNzviNw
	lp1b9NIRgsHsj4HoIVlZEh5oBwZ9gBLiGRBG7OfareMEZbODh8h0SM2BsqfJ78Ax
	T488IxfRurhRCt1xDtJgmiBgwUsFKvQSWoQ+w55OtCctFYmKSCkNwRICrS6PNDxR
	kdGV560SNtQazwYwYQk31E8ABO2bSLnWOVmYnz+HxlrWKbEY2AGmjsLP61yfJFh/
	01DzUwpIGrmE8RatdkGUFnUQEpTJDxnAxvy3Vt1vkz6ghbmjdBieg6qUX85HaL6v
	5cdEhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nqaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:42:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53568f05f8bso9787351cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007726; x=1793612526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPtH13VTn4R7Yb2sy+8OKOvdDZ5ZAvbReyMqod1w9Ds=;
        b=L+xUAKHn3R/BL3TT5lE6i6COQBEGO8XFEhZ9K6ofM08qutO7MdmOK5DBArhUbHEO6w
         tNDFD/Xa9Ql16sN09k0ykb86+sobr0vn232nbvowiVJ4Kx000Mq7vdOCM2pHPTfSk2qK
         CExoV3S39H1Wzns7pqb0kTRBHC+/uZGJDdDDdn+pVR0WxXBxoeMrpqoMXclioumGJfYa
         bIwC41yQ3Rmr+SD/kS+3yk4n0ou3cEPNv1P2bnIH/cIV2x6nwdilP3LV5z/C1hEcUkkf
         lkQF1ncwGW5mv5Hx0AQBc3NkPlbx+pZ9rtY4NkeoAkRv/uhHF8STcsIKOOYIx5oi41rq
         dKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007726; x=1793612526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPtH13VTn4R7Yb2sy+8OKOvdDZ5ZAvbReyMqod1w9Ds=;
        b=WI6/MnJLWWC+ysCtol5Lyaw6qc0PPpVlVW6RHp4HgqMKM2wsKlQmJfNmzJAxRO5bu5
         ApkXi0vAxic9H3GEqBOvaqkbTMBb4tGE6bizRHFawtofF/U24mDjjJ1Fufw+lV87vaYU
         NyNd003j8cq5Du8an6zLY5I8QjB+Do6M8gwntAdkdPEClufy7gTZdq7x5CAEap88t0Dd
         ViEp+NIG3Uk5eFfb4tSXud9CR6Yb1BoHfBG9bZJOjPkBDniwzQMo1ECDXr50TUxBR11g
         97JN+TF/sWBZi7/GZ6x/qOITdsRPVBUZd00Na/OjqB9QRYeGMwznCkA64k5YZzpfr2OB
         oJSw==
X-Gm-Message-State: AFq9FYJJhKsNtJ3HEwXAKYtGBSAcQBXozCE7iqK4WLVqyotG2RpPoabD
	Ig0q9OISRX8aPP5Crl+EH5SE7EVqUppYyJYP0JJfAOfvBwU+lo5NcaqfvGEjrUVm0MlY3bNJ6Sg
	bqEIkKGYJIPQmmwve+cJH4wEi9kptNm6hOiiw7HsOn6YAn0ZoE9iufkgaMWkHIEqYcXG4
X-Gm-Gg: AYBFou3EYM+xqz381NOPEPOhRXGqyH901D3NcnCgRSnOfdD1Ea5FmUj7mLjWwnYCfvK
	rxcGLr688DuPigDSDaYCY5eNF7hIhru46F126j2/+MBeyz626M1+zrLiR8qSrzNS+XAx4GWtOF6
	OW27tQ3WakJir5m9K1fuqBHs0GfDLdxodjCwqnpfhd4fcJiEkfiMbnuZEdVtGQqtU/liQmzXUBl
	aDK8M1jAsljCzPmygY6KYoHQmCffrdXnw8EtnxKxsgizCCqpf0rcPvqdqP5BvwQsXs8XuqUt8Nw
	N3mTKr8Em2+Gkygl2GNjOQkJ6PEb7K6xHTvtEds92tdgP5YQ1y1q7JhSLH3ge4M1Jxx/A+Kn4RW
	njEDCq2vyebVT7zlw+1bXOA==
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr977928685a.2.1793007726385;
        Mon, 26 Oct 2026 02:42:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr977924785a.2.1793007725804;
        Mon, 26 Oct 2026 02:42:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650890sm308924866b.51.2026.10.26.02.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:42:04 -0700 (PDT)
Message-ID: <8825300d-4ba5-4a42-a27f-1378132470d7@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:42:02 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] drm/msm/dpu: clean up the self-refresh helpers
 on teardown
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-11-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-11-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IN-o8ejECUXuWhFsAFdP1f8_T3yBJBVB
X-Proofpoint-ORIG-GUID: IN-o8ejECUXuWhFsAFdP1f8_T3yBJBVB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX4JtKhya0q2oq
 y76gsJcsrCRZ5XEzw4isIvQ7jnIbhgni6gWlBM3s1fIloy+YQsOVMTGsJipIDh2ELTUMjZ2+/cf
 m8+jyX/IuaALYC2myLNkMVJEXo/Xq5I=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf206f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_fTQ-MXv4NwHnn4YafAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX+SZsi4KYP8qk
 xEHGI7vlbRW7uMG/Faio7iPdpnU/8FwM0Lsad/UktBh6lllUXymD0n2j/mtPyEGa6AFhIPxT3F9
 WeF5l13gXWZLwPJEJmWQ6MNsWx0EOgXhvifb8kkLiPnxNemfWkyx2SVLCukM5NAhjFXAgR7+SYM
 +c76cqzMwkg3s0HnVDvKbB9CilR5ungWGZgz09OuW9EdM25ClYgnCMd9qfi6mMSaZYP9vk9v8Jw
 B5rxvIpS2zKEqqc0HbrvELDJ+5NIkR28aZY7Vd6ukRqvyDF/eCOs6XOkBUacWAHc/NdunUC7Vm9
 yl0IFkU4HPfh/LLm+0MvFk5gwg3WSGMKOsRQ2mCoYETmMRgNn9CgIuVg53YN7FkOABYy12YSKgJ
 KBjzNaI27XA12nY8N34g25HRIlbsVpTqZituv/yGDMxXJ7WHXe93DP0Bw9EAZJ7Lb4DsgCJiRxj
 KSa9yE7UtzVJWdosc1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> Unbinding the display driver on MSM8996 with DPU oopses about a second
> later:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000870
>   pc : drm_atomic_commit_alloc+0x10/0x9c
>   lr : drm_self_refresh_helper_entry_work+0x5c/0x1dc
> 
> dpu_crtc_init() sets up the self-refresh helper for each CRTC, but
> nothing ever calls drm_self_refresh_helper_cleanup(). Every modeset
> commit, including the one which shuts the display down on unbind, queues
> the delayed entry work of the helper, which then runs after the CRTC
> and the DRM device have been freed, and its data is leaked.
> 
> Clean the helpers up when tearing down the DPU hardware, which cancels
> the pending work while the KMS is still intact. Doing it from a managed
> action instead would not be enough: the DRM device, and its managed
> resources with it, outlives the unbind as long as userspace holds it
> open.
> 
> Fixes: 1122697810e5 ("drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
