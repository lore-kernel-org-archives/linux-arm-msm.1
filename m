Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006167;
	b=V/ZOammMtfSZ89vJ5lAjTl7xa++/MlXqetwuZwtwBby5Fu/FCSs+qk4WuFvZhykIVJSy
	 xXsARoUiWfVj20j5NhbZvy2TsagCyy5LNglucYorDeyA/COyD0cSDw5HR0wx6Z8edTSIe
	 qQEmr/oyCwPf+I9klya8DqsexrA275DxppSCaO9NbcMYPRHvfquRh5tcW1Q0yOOml0mCn
	 mN0Dg7hvfJgeJftJwGUust08qcJyNEV9Uj4mhnzBOf3Yt+Ykl9Lq19rJpGpOQ8jaN3LHs
	 aMPEEIyJ5ME0CdqbOXgJTd9Q2360jkuprjKx61yxtN+7d4UJpcb3FNH5nGtF0f6SmPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uaZlVt/ieNnTy4lKgdgeePVaxkhdWiw1YPAbOzp690s=;
	b=VXNeDSUoTpKaMjApqtzZP5F5B2tL6MU8edFo2pOCw6QEVMaIslBDzgb+Lsoy1jWVFfl7
	 vvs4zAiqYR/g9q2gotCjGLIWAzPwG1n2PHYwcdQcaXnCM9JPM4EgrUDC5+GVfh6qXpR9X
	 1YavbAqprwXXxUkDbNohDljXZ0tj5Z3OdfrqMLKdnWjTsQMJ7dhmKI3t31en+8LzE38Gd
	 HwmsEshWKCQ8815wsWEUfoVsiGUpWht6CZPCmDQATLWRubMUAJp6IWpmjXb9tWlZh7MSQ
	 43zbJcFBSMweByJCg8jefipB0CqcfgaWx0pyDDDDcnYWmJHiLZIdJll91XeIAYTfKBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LP/truvF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5nv1C9m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F953606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F953606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LP/truvF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5nv1C9m
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1dZ2806317
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uaZlVt/ieNnTy4lKgdgeePVaxkhdWiw1YPAbOzp690s=; b=LP/truvFDk/rQffz
	yVuRh62lx8QD5jnKtVRVhVoai8OxoYkoaC8QH5jMbnmGV+1JP3SDgwMqR3PNY52T
	Bo7hEBO+s+sVhxb9fRgxbMiLYFfOzyjyu/Mcputw7abLiT9A0udkFXaoh7qBBCiQ
	DFPVLVYR1jYXDeWwH3aFya5CB+RXVUz0lWY/hZZEXx+1Pf9ckkNyXBHIcFXKZFiu
	+Z80vH9u7ebRvGr+8TPl9Gt6+RCu4LcypuUooY6/x/iRphdNbIDdAMK/KCZ73iMR
	t3p75X0UntWaCt0jWXbOm7OBdYF1phf/xTzk3/5B/9gHa26L5a2ppEH/2gtkEjol
	kJo+/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xnqr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:16:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so35203085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006166; x=1793610966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaZlVt/ieNnTy4lKgdgeePVaxkhdWiw1YPAbOzp690s=;
        b=j5nv1C9mKoF/o6/CAt1El6yHCm///EDlkYHwSHX+2WXZzww1IfA1MHRkDPPduBN3On
         qpw5otKui6/U7madn9Op1qOgHJMFCRdsioBme0Bqe7q22Wr9ce+/0y0HUhTwalim+91D
         htDZ8sX92Cegr0qUQ/A7MFRFssGTJgc7XuX/g8b6rci7f9+pqHUa4KwzBgDJiaoyPFrO
         obvDPTIV5YbQHeKZ/i+6s4+Ls6vEGqGAolueD2fqcHdoU9Bg8fKdHaTQ8hyaBcQ+215O
         X3rKheUQLRjYr3cHYvUHiJeXQbzIWCVpbgpK2pUqlRyLuWdRYqTaGPWig+xOZSeMuJz1
         MLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006166; x=1793610966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaZlVt/ieNnTy4lKgdgeePVaxkhdWiw1YPAbOzp690s=;
        b=17QSNdokyMEFkwbMceh/dzhzqcx28q+VtPEdpY3zTHEXbLVqVPqUO/fMmY0s0cd/sm
         S3c6rthdJJse3g7lFKi3xv16dkTX9J7qKSYj5mGmsUM3qAPqECLxW/+kqz81N4ikxko0
         ZaiYcSJua2iubQZrAOx/cRIWv9OEQRyOpFxbi9seqVnumNurMlLaB0EvHgN+Yu9m7v5j
         BJ43NBpyhpbYWbgN5yw7L7gNTTvsAiU4jDLHSxMwEEMpSFysi4qa4uj/tcthT4DEH8az
         U6kC00awO47967z0VTgH5OHOmPQk6pdLx25lxmbCpXytIhdlgz391Ask1ipaZpp3tLXH
         pUig==
X-Gm-Message-State: AFq9FYKRowvcxdVs/oeuOuivQENGV80pXpmTu3w8fDDdd2kMUjggg1p8
	dYO/Ac47q0H7pEq44JR4uXJnaZH1wTFbUokugt388c+hmiGmICD++Eq3cLwQ3HJASkreDcZO2MN
	Ph9XFnlKv11pGTxWjz7NljEK/xcTj5NiwCU72sOuu++Tjw5px1NYLnQYcWv+Ld41xufw2
X-Gm-Gg: AYBFou3alKW1txCasE+GKrvCHNUuZb2TNsO8aDmF/4DYEeeWyyswWMu/WVfMLA/6qHT
	IgjcoX99lPHraOpIoAFbxCcMsYo7Z0c1B6nZ1cehTt5VCMkuIP4nLAPxP6AI/XOgKi/VlBoC9+t
	do9eWPJBeZNVX5/Hp32hAwrLbY7hR9p5VYePvIGl2HlPb1hRVbB7+GH1X0q9DBbcjl2UWDUVhoh
	H325nZf+/p7m7v8e+eXwESTN2GduYG82OREcWuG8/pBck+iUFwLXr679eTArCBqCMT2gCiOb1eF
	XQhYfDksccVR0xthKaD9lMADDFls7F7ZxAQ4bsWnhJHd+/MqyBrzl2MDAD3kUevpZIqhZg8BiBm
	NAmI2I7Wx4l9lmiiwlRBJ+Q==
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890597085a.2.1793006165653;
        Mon, 26 Oct 2026 02:16:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890592185a.2.1793006164980;
        Mon, 26 Oct 2026 02:16:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459711d2sm3285541a12.17.2026.10.26.02.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:16:03 -0700 (PDT)
Message-ID: <b5848cd4-bd3f-44b7-ba8c-5646f16670a4@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:15:59 +0100
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
Subject: Re: [PATCH v5 07/10] drm/msm/dpu: clear the DSPP pointer when no DSPP
 is assigned
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
 <20261024-fd-kms-fix-smmu-v5-7-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-7-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AbjdXIxyNeoEYi5Ov9kmbHfhNBArT1jk
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adf1a56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=r9vTSbpwzgrkPjDRepAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX+sRP9DBabJgp
 QJccihadLXYld07ov1NtnKNL5w3AJtzgz6jFHqZNljEf3yQe27qK5Qa2iFry/6NQHaodhCX7d0v
 LTqdmdK6J6rYPSPfr5++3J23wh9ze1s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXztKlClyQM7j8
 wARddTAxLGYer0F88mvGNQJpk9QcOSJ6ncXqwG0tF2NTtke/RvDubj3BmWBSQX35YMFIyE5Eszi
 udy9FfXscIlKFsriQUFaakCkirlnG7xSEXDmVIf4G1KZK6bO4b6T79EhPGLpONAeHzvRqGg5VQf
 wVOqK967cOYui80+rwvsh7cDcOMMtgYZDKmUBHjgiKvF/BxZ4wADfGw+tZ/zfOU8YCJrEahYaZv
 VuVvmoADCVTGM8DkRNhOXwGsMkVrL8dCkWfL6/NO9esh514J1a2WILsYlRo3b7hR2RyzgPgzc4Q
 tlKPDVnJstCiynxiCi6I2xgEpiFo4ztKzihuxzSt9WWPpDEL+Av018HzuBGaEdG5gjfUw80T8JI
 tNyZMKdDO1vhrpRxHyukG23nkXhYBm4qqSP5awfyl8h3SmejAW6tLIJxb064sjzIWEEsJLPQRGg
 qzOA+lHDF9fjm0dO6vg==
X-Proofpoint-ORIG-GUID: AbjdXIxyNeoEYi5Ov9kmbHfhNBArT1jk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> dpu_crtc_assign_resources() only stores mixers[i].hw_dspp when the new
> topology has a DSPP for that mixer, and dpu_crtc_duplicate_state() copies
> the state with kmemdup(), so a crtc which once used a DSPP keeps a pointer
> to it for the rest of its life -- across reservations which no longer own
> that block.
> 
> Assign NULL when there is no DSPP for the mixer.
> 
> Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
