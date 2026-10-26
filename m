Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006797;
	b=ZE/gnW7Iptb+aD7VakCGMs2IGntBzFfSUmM/0gVwSpGjUnIhpZU7uh/BJSkGLcoSGzX4
	 dnFL/MOhv0ZplH15+Yn2sy8DaKvaWkQD0EmVVOgHCUto0KbeAbjgLoiI9bmHAcLnNvxE0
	 AIdY27ZpR1Ethn+LVqDB38POybrBhT1sJu8ZZ+INBDKb1pI0mOP1yEACHV1Fj1JNUB1UX
	 eTkMviRAByLPaIRqh/VDS063q04pTXI1NZlJzSbQJ7pwYU62Fm/X5i9b4Znl0DJDMC6x0
	 UBxKnRDP2kqIonMgWBsttz3+yAOX9wM9N9c9tCj+5BDmdCKiUvrLe6FIxx1WT26PqQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jzEc9HqqeJ0Y72eXS6b2HTt5hh2dAgU7hXsaabSdUAc=;
	b=jArIYRPAVEHZ552a7Z6fhLiyy+FDIgurTpqLm1cgj1kOORii/4uxcagHqTMgWOK1bdH2
	 DNv1yhi/w/ZaZFZmypd74uXoxkjNiN3gZ82pwbapnKEMxIkt+V+pdJhbzDPChruFicNtz
	 9sG093oA7sCrtPcm/Jt41HWiq5bbpQCSHMqyv/oOTbRpftHYnCB6/u7RTiC4DkrXK27Gg
	 TO2fm2dvBJuxRq+jtjPIbYWikVSinyPCMtVQal+YXioVVSQkBbUMdxq8gSa00pvOf5MEH
	 gWQA1ba4bNuXmRNAFGxOFuTL04EQb2E4r8d/olUH9Y5MCugOJQPsbrFdG6cyXfLselA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eORX3JeG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erSFPzz+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB3606A320
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95DB3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eORX3JeG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erSFPzz+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b25T2206271
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzEc9HqqeJ0Y72eXS6b2HTt5hh2dAgU7hXsaabSdUAc=; b=eORX3JeGKnCXHjc/
	T2mIhqF3pOOqpR9pZG3y4dGgQ8/I6cfuUi2jqYLVFdt7P8fHsYYDmOSi3Hl56c/m
	v2Q+hSmIUDrVD9SwcrBN9DBnVbkMAuBJ70+hbLY+sIOVq2B2xJk7kGKBXd0N0ueE
	1TFiWzxICwLe5XLq7gtz9/y63WNyAoq+gzJFqK3ixen49JSUAGsPEKV1YmBT4fiw
	v3lKL8O4hjjLrTBMNAM9mOpfl2CkYHnqNFoLgNXburCcLwa3Az2NicJw7LJKMEnf
	2YEhmjTw+bJ9TVASN8Y0lAD+qw0Nq2hYT+YoXKq11pyiiD9D5dLQkOSZhUoDz+cs
	NVCZ8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunpg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:26:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533962f6bc9so8115891cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006795; x=1793611595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzEc9HqqeJ0Y72eXS6b2HTt5hh2dAgU7hXsaabSdUAc=;
        b=erSFPzz+01fPUmyK/Tk1mxP2+egdlw53sYF2QCbRRhnYKk3pz1kXcQH9pmgetiKNkG
         pFAgcNoVFtJnBXNzghKZGmoy1Wd2vcZBFl2hi3M40+WyY2wMKXKfLp1LqfGGsxZYRKxI
         9psDpM5ghq7b11YxZ/QXGsCJ/hHI57+F5dCohxsPjJujJv+oJ5CaAT2hLnrPacPe86s8
         hI0rFZjHPuFCgtOTSvFAhh2SAh54CBsaS066JJIBBfGyIWXRkQmZ7LkVs8WxucCeHoRJ
         F9leRvrDbCBbqEjQrzpFXqXsqVRQRAHdIH5ueA/0tbGToAo5iLvKFX/csRHHlO+tYGQL
         AkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006795; x=1793611595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzEc9HqqeJ0Y72eXS6b2HTt5hh2dAgU7hXsaabSdUAc=;
        b=Rm6HsgOzANabRVOn3ON+KuZN1FlT/X6al4tQHDdddg4Eae6XjXj1wo5R3Dhn4NsBtm
         BcTFMGDnoOc0dT8Zn2Sy0Zs15fLdXyHrOb2qNGFXSL00y91rKZiUouBs47tQgHxj76Fb
         dgMTCL/v7CUsp6KtqVgjB0XOLm5crPwOq/E0TKat2GFgiqofDqa959j71dKzla2sixor
         +foG+AyJZsLQVkY+1zSuNv6GpxwjJtxU2M8IWuQxHAYdACcRuD86RCJ6MRE2zO9qwn5h
         ZbgJ/TVaECIvqdoyRO8cdwh0NoVoOHQK3oghUT6uLJVH51aDXmLU8zJAm1f7ipmPjWfq
         NHag==
X-Gm-Message-State: AFq9FYIE60lRSWi023j921RJxWrkSL+5ZEN4kGeMvHCTxsG79n2e+M9f
	XDdJNw5BllerRCSBaYpacQCQvys0SoIUvSQaCzBWvirS2WV3K5g4sNNMHjypasZfxRKnDPGy6SD
	I9sq2nPKatGa2I38dTTeEVTPnrSQPnuv8uJt9q9kOmFUrHs0F3SmX/T94Giua596cxFlY
X-Gm-Gg: AYBFou2F22TwbRy/M6zOyIXhYLaYkCivlTv1vxqZHwLJN61zFwWNByhn2MDfY2A3JuT
	OPZ27vzf5XN0QTooqmB/Dxq+9MbvXYR+kk8DIZ5w6d3wPu7q9KGEypMGRAFiplSnM+19UAp0vHB
	nxGxO0CXp1KS9I1+iv/Uxhq6Ars4gLkxhGLJmXaQBTadWhxhANdXRGweGnvA3gRm4zLqDNu397L
	xvyJW+gx6ixCVTiiXimPaO2oP+k+em91u6uuTryuN9m4Dz39DpUfXI4xC6jLm3wG+BFEMkZEsJ8
	fMsS1QbdBIFDJd7mlMB8/SoRJVuvkwa0OIz0n6FH91Xh1PJJd5LfPf+Otg3hyzxCCkFAK3lIB6r
	kdRG00VzzYJVBT8Z2VRfLNQ==
X-Received: by 2002:a05:622a:e088:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5383b3c5463mr93658871cf.1.1793006794778;
        Mon, 26 Oct 2026 02:26:34 -0700 (PDT)
X-Received: by 2002:a05:622a:e088:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5383b3c5463mr93658671cf.1.1793006794302;
        Mon, 26 Oct 2026 02:26:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5206dasm299771366b.33.2026.10.26.02.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:26:33 -0700 (PDT)
Message-ID: <19d36d36-cb90-444b-b3ac-d3247db852b3@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:26:30 +0100
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
Subject: Re: [PATCH v3 03/14] drm/msm: unwind msm_drm_kms_init() on failure
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
 <20261024-msm-kms-destroy-fixes-v3-3-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-3-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX3Vhkc59r83do
 ktaggM792xGS2mKJVvfw16CDH7y0f1SSNUCU7MkS3aieH97bhPNXBJB0LCS2syiisclRpUGNQk0
 LbyaTKMS4jui5A1eIZj9Z/9aOE/R6qylEcb4UW6vLCb748LQYG9RerE183lA81b7kM8q+pHpW7a
 cv2ZntB1kiERb0w2hHizeH0Hlj+eEx6dWH8fdINmPZ6CTExWMS5YcPeHUkAKmVsFoJS1uZknKhM
 c7mo2ifdmcYxMBy35KLrMJfSRdn6lT3vAWqfBMkjYKaKjQMHF3XwqlZMy6krHFv79MzqiPQNJQ2
 NBOrn4QBcK189xvH+Hm8PCBs/fU3hUjwI0xGBow4P8MIKWhvavfEr+3RBtVpx++LxDIVIQxmVVC
 pn5wkH8y377d+vK3FfGyGltI46MzDtlvaoxnVTX2vOHr54TgVNEgHBKdCTBnelzRxNpIAf/FY2K
 DgYW8yKR/mMQ8/M6yMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX+F6vvhmzf4Wg
 rUFVIJ44dvO/BhAtfvBZL4I9aawvqo94m/UR921FVcyh6/YX7wU4ucwEMfMxrPLawPn4YVfnKLl
 H8jzr4+RiRgFKHX6lZnrJmvKx2SlZpk=
X-Proofpoint-ORIG-GUID: ZVWKYPgAOW6GFmwmqUtaRt_9IS0K4ed7
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf1ccb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=86llG-C12mwX39I2B_IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ZVWKYPgAOW6GFmwmqUtaRt_9IS0K4ed7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260037

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> msm_drm_kms_init() leaves behind whatever it has already set up when it
> fails and lets the caller sort it out: msm_drm_init() jumps to
> msm_drm_uninit(), which runs msm_drm_kms_uninit() for every device which
> has a kms.  That is the teardown of a fully initialised KMS -- it flushes
> kms->wq, calls ->irq_uninstall() and frees the IRQ, none of which exist
> yet when the failure happened early.
> 
> The kms driver's own init is the first step which can fail, and since
> commit a409b78fcdf7 ("drm/msm: move wq handling to KMS code") the
> workqueue is created by msm_kms_init() rather than by msm_drm_init(), so a
> failure there leaves a NULL kms->wq for flush_workqueue().
> 
> Undo the steps which have completed instead, and let msm_drm_init() unwind
> its own error paths rather than calling the full teardown.

I *really* want us to get `impl Drop` soon...

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
