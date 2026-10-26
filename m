Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006218;
	b=RUzavmSH5soMbXN6+gxaGNlcqTQ6LTR3psuqqgoz0xZecUv1zKVTA9t3miH+Kfv6F+m1
	 Qy4MgZTkJOvr4v0s6MdqwyBKNLwrraIIcyST2zipLAjn5IFOnts/A/riO1J6erBPvkD4+
	 dPTigBfVBCCs/NC7TvSh+7EWajhaKGpYpEpwYsaTUifLop7S5F8TnagS9R50QqE1zPCJR
	 5/cHHPhXtgQKrUynvumrt2CrKq4kLhGZOR5ATtvo2JK+GvgQc8L+V1uAx4ItM/+kT6war
	 9t/LVMqaStGnLwZ3VF8ps055CgT+uvKMRdJXYO6nRv5hQrPzQr8bxf5r+8Uc/MZ7SUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S/R1V8jcwmGSYG2QsWGibA1eheKnvmEoWMpRIpkWm5Q=;
	b=Aq8s3Tfx8CbfuTWau4ycUdINIGwXQgWhSGA0ZEvNDuU5TsGqDhauOY8Qa8Mp9wEAWGhT
	 mWgmfioZnqZOrgAzj+q0XenAHou+dCZbDNrHwpq+TPZWybHiERx3lZjezxyZRRXC7nMVT
	 VpZ0LNCSqaw9kF8NCJ4SMROjR/nTnIzd02Quf4Hgqzh18zDzu4NP58NP+WPaHZAmoivwL
	 uAKOMH3EvDq4RFZnMWEC2oUHfhBWSgj/M8iFPvSeReu4R1TwAlStHJQbNIJ8ZneFkJyIj
	 Ss2CtoEx0lgFS9bI5qsUzhVoTy7SpUYEinmdR9QgCKjkBn8bAOJAxWDlJo6Zq/x2IhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5aIRmgb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kToPlAIx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B9606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 022B9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5aIRmgb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kToPlAIx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1hC2206204
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/R1V8jcwmGSYG2QsWGibA1eheKnvmEoWMpRIpkWm5Q=; b=J5aIRmgb268pn19z
	DSO+mrBdgpsEyVvl6Rz7K/UO+z4ZD0c3wMI7EQE+cCpUAtNzXdmz2OKqMF54n9FI
	GmvDPOCtNZikgBawjr+e1vzEBxuWucEh6GGZPAPHgnAtfDe/Ek1Yodk0BPbi+Y+n
	UvD5JmMMgh5AcUY7Xs4fk7YqNaoLvUmXcVbkV4d3uEeEvU2C7zmNZmOgWB7StjAV
	Z03/v60mrkfZZ65MRj1MTJiWbUQ1eRKEBCk9r/eA2tKUVfPSGRPzSORodJY4eSPc
	BCv6WwYZZFDDGjthK+DoOeiTnm1T6dHDo9D7c95tf/efqHEBPWIOeAWROvTFrMTT
	/TkNeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunnax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:16:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so35216385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006216; x=1793611016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/R1V8jcwmGSYG2QsWGibA1eheKnvmEoWMpRIpkWm5Q=;
        b=kToPlAIx/2Fd8+2Pyp+SLOXJEO14Iy1DwxWmGi4X4A3RcCXnAsJN0uoeVyQ+6U6O4T
         1OLcFhWmkM9Ew5TpXrivuMFB9veeqjQxp18Di7+e9QYaTttkS2BdHyw+Gn4fD2hvFIO0
         +EsVHtzQv/DO6TOL9z5JeDuwhEfn0yDdEelLKu7kZOZFtU9fLEiU4g+duGXYlC7v/NiJ
         WWyz8IgLsRu6lkVAcI4MJKwEooKIaaj7Cal3oikMdFRDj73Fv1GihNHRRnfn45zMr3Z/
         UVojVpMnxikTyI3QqgVyaQRilrHCD7kfsrykXw8tJE9f3SyIlNgR6+yXT+tm1zQBnR9W
         5z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006216; x=1793611016;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/R1V8jcwmGSYG2QsWGibA1eheKnvmEoWMpRIpkWm5Q=;
        b=F6ZMuREZOr+nOhCxwMQjnFhBYODnqwuxU7Igo0g2e+uIVaOtSVAXpxay9ZFTvTcjt4
         w3NHxbI9mK1QTSEL5zzJ41Nr8aHXfDaY5RBRRFIS2zR7OlW4WKSwXL2UnoD/xPkLhCSc
         FmvUu+NK86gviSdFBeCdKQFpmrdsIEB9+xdKhYHAE6fBfAediFI/8vp+P+GJN0AyArlS
         DbbWja8xeysXlXImYqWnYLI8cywNWhvoeEGQYoPsXL94FWFUJ5itUMPpyPovqdhjol2O
         Sw2Irt/88lsmpyW1gh7xWcKRTiedq/lOLBUZSAatoAIcDqsNQ2PXr6XSiA9q8pWoVqNb
         8Yqw==
X-Gm-Message-State: AFq9FYIeoFF0tvRd451Cu6JCg2mPWcN4RwqW/6mwTCHdct7CNkhsSpjc
	Y2J0I3V/D9GNPXmDks4Updj7XH79BWYCHw3ilolOGVbX33beid54znvbjDVMoMB3WqwglAz3eOp
	h+ugxhNbkdoOQsDNdW8GlHtV7UD9/jaOutYKnIBTAU/BAWjC6Oz0Sot4IhXb9aaS339hV
X-Gm-Gg: AYBFou0iPWocGvEjdofGuY76w1UhlYz08jllFb4yThiMBoVCwp5jS54NmPmlp5+dR2g
	WeRzp97YAGKxX3hv2bnsdNubylv1kGku+AECf54GUJWVpUWcKE28Kh1uGJCKPfnt/yqrx2AN+6N
	tKUCcWWT/8pdCQbEZyaoAKO9bQNO9o0ZQBCJ60Pg4cBj+fCDCL4dblefTCHFSFIwjqIT6HJjQKd
	eKUpqA5bi1qlUpOD3MYe2kuPasQt3o+bh8MsmIVnDmk0TJnFJ8YShVFKs60wwmFnA8In5IM8lkO
	9lARZoKTsQRi9y/k/2lFAGy4maMTBPhBKBe3tohuXKGYhILlHxnTskFvuBHdVzmI91CDFbP/2Gw
	TnEawxIwd3D1XGNfPnVlmSg==
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890801385a.2.1793006216194;
        Mon, 26 Oct 2026 02:16:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890798685a.2.1793006215661;
        Mon, 26 Oct 2026 02:16:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e25fsm3373276a12.7.2026.10.26.02.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:16:54 -0700 (PDT)
Message-ID: <a1f0d3da-fe38-4ee9-b876-1884ee14d74a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:16:51 +0100
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
Subject: Re: [PATCH v5 08/10] drm/msm/dpu: clear the DSC blocks left by a
 previous reservation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-8-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-8-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX+k3MMg2SvAC9
 EZvAQs92lEwpwOb+VEYe4tHPku57j7ssTGWEShF48/PAzHV+CymYcq+aNOoS+jC31fEFUlDSeTJ
 8NU2lXf+F5yC2mGo4ygGsEADm69ur+r2A+qWKep7PTxWek6fvMg8i2OUOdZIknFSdkjshA9JsFF
 vApO4DzksUbsTgeJXwgqF3XWYZReEFoFz8gR54bPzQtn+bsJeKVlBLAn+kQmAghSmVufe19sJfV
 z+OcTqZ6ap+SOk3fU9mB25mQu0AWsSk2zuPROCN7S6AWbBedMsOK6j7B82i2LgkQMR2SZcnTaxG
 kWE5qdmRLzcu59dVfI++yyOf6KhBSqJ3lgHCaIN4FvrDcvKUiEJkOM3YLD8nyDsWCHPtTA01q6r
 kU6xNP2QJuQ/j0ZYUTchO3YXFEHbXYkc42geAP94/ohexEpC6xBqwa8bAoj8xETs6MCBGtyFe5n
 5Lqd01x4q39Pll5lQHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXzonKpVRK3RRx
 A+4VVOA7/t2m4SvdOYn0rp/3H34ED7xo6s1RM1fvrL6ilko7XtRyYZWDJw0eJMKKUHX1U0QwMN+
 DXj0a8SwLFlKi2ZWlWXfkNRWXX1BrNM=
X-Proofpoint-ORIG-GUID: sCsy920dLMAzdZINl9ZjEcOmp0i7lYHx
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf1a88 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=201-j9D5Wx46gDUpQiAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: sCsy920dLMAzdZINl9ZjEcOmp0i7lYHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> dpu_encoder_virt_atomic_mode_set() fills dpu_enc->hw_dsc[] with the DSC
> blocks of the new reservation, but only the first num_dsc entries.  The
> array is never cleared, so an encoder which once drove two DSC blocks
> keeps pointing at the second one after it has been given a topology with
> a single DSC.
> 
> dpu_encoder_use_dsc_merge() counts the non-NULL entries of the whole
> array and compares them against the number of interfaces, so the leftover
> pointer makes it report DSC merge for a topology which has none, and
> dpu_encoder_prep_dsc() then programs DSC_MODE_MULTIPLEX into the only DSC
> block that is really used.
> 
> Assign NULL when the new reservation has no block for the slot.
> 
> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
