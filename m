Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027362;
	b=4R9WHY/uNk8BIlWtjcggl5eDEYn3DFJKxNIwqo9Ukja+KErJuWNvN9NODcxwh1K773rd
	 3obfwPOHGxiKMJSm28dz8R5JMfPXzNd4CdYGJqrWlSKdP3huKy/Mtxb0N06og2d2hths9
	 3QgwdJH0OCdKLgFHswRgekLPVG5yONDY+1qvfe/bhYdytHbfNL2PUGTI0XZSI65vRWhk3
	 PV+8z8cVl159x+IpbZv5VRp7FAlB/mNvG9wUP5H2DxtgdkwFI7g3wq09le2ynx0YWT+B/
	 HXg/JPL+9atbDI7u1DeEYJOncoLpwp85LHf5mG/zb4DEY+xYpHk7hE5XOqQ3QnfPFwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=;
	b=bFDhbbrwW6Enfg7/GhZ17ZSSnp0FMczscgk9HGGe4RAvS7qGkh8ZFMQX58bAsZalWcDX
	 MxaVxCQZsCPgqtqPNi1w4JDhEczhIZiJ/IciDRUBEzVD7qGW59N5ygTU9bO3VH0u0imMt
	 +FKFW+CnbayqKFKe0g4XHt/zNEfGrrn1wnGbbzbIcOlbxDHyGSDKoDMGcTox+T1shks4n
	 8CoCaCQRL27nlnMnHWo/XBTU141sNQHFbayPZR1mu/wnBCBQLSBQBrioxwnsJ3gIMWxyC
	 wVy1lvbnoB7DQfs/n8MfwYK8LUprfCNDDYjrt9NbLeXal0flwjFmYSvGOiubPQyIV1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PF2vfpno;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Js+2KPre;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392660A2618
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B392660A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PF2vfpno;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Js+2KPre
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGEag240476
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=; b=PF2vfpno+jJczsL7
	gwxDfvPL6Vg5B+YBB+0F8c2Bzhw5hn2MV/goPaWvnBvL/EO20ThimukhQa8uD0B8
	WbSpY+rS8p1w90k8IZ1ChKYCMBe2kFk3cq/w0KRS2KxF85S3IU+7yzIC7bWy40PN
	VbcokZlfhyCcJloc/q5Z1QOdrYufuCIw5l/wHZwRaqon1y+LbO2kw3a2ZIuO4o7v
	xxT/20q3ma+12yYBTIfra6byFhzv8qeMv4dzBu0p7+P2aBvDEH7jlsY8uy9hpOjG
	B95Af4lBLF9opvLnE4r3CteQAwrA9gaajG2rjWQGN4ArzN71y6csCD8dl9T2B48p
	q9EYwA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3krf0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:42:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso75969137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027351; x=1795632151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=;
        b=Js+2KPrehhz0cJUNHtKg1I0ioTZhBt8tCtSEsq53IpeZxafQM52UvrW7yU9tQKcGcH
         QbZAvcUgheHM5XqbRSCLR6/qnFFQ9H/1aDGYrN+iqWjc7Nkc803FxhY5ybIazqmQzyGb
         J3SORHQ0fghBaJrg83FDjjLNwApAKZWKXVDFxfk+wk+3IWTPsNl+mU3Z/fo4sTbw/7fn
         nyg2/4x6LNnhSvA3TKPQPmoHLx7/sNQWeogdc7RCbvsWsQmt0VJsAD0oOGb0/Bip8Ftk
         N1OhApzpIaOjnlxF+tbezanUFyDRSLCdnCAK3Oeh0XQNVkLiY7YaSMruN+Y95gjpIfto
         MG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027351; x=1795632151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=;
        b=T2BE2vvQ8oxoxycosUjN2TyyK0HhspfVlsYIwmEzmSyMcMuXulAhwq/OgiKEfDP1aZ
         oWbzm3dbAVDQP/eTxwMJ14Z9zSLolIxieERGFoQ9H/oTFWQdl6tderqsnofaNV6NWMbQ
         92y8xUg2IvH0Z8J96B0cMuzMvR9uowy68fACGxQNOxk6USC+pqVrBMY3VagX6Cdcs4vK
         Ew8gaKP7M3dBl6eG/FKlioxAh1Oml3GMPbwq55k15RXPNeP3cYcqsAIGs1OKrMMsOKMZ
         hQpKMJaxzGLUDbq3UFTySPPNUikUu+SgPueVQowjtQwc0py7iDZvi5UgPUpWntRIR1hw
         IJfg==
X-Gm-Message-State: APuU4Z9U0LmZ4H9W8d7wNUIQSBNyg1dS4Eavkgq4cxbTgHzZa0Kgvt4H
	lZlYzTCQ/dpQvkikfgcgAsQ74YoF2cHkmkWC8oRkWx6907TYY+4Pbuy3bfN5oPRDo+8iuWNSHWb
	JopTyZ0tEzRL3LYuTce0Jmz+DiIs9MqZ+kPUNoQIrU6sBD+u6MPbscazCSiCDbq8MGq1F
X-Gm-Gg: AYBFou2DGHJ2eV7wIeVxz+2Me+KWGq8M6UN3LICIDD03NObUWzJt1Dq1Ig6dZcoNm4V
	Ig93RaHyUPiLxcGSvuoL75wNUBDQkiFi5cb9LQbNXGovB4xTK2OqXgXSbnjgTckYw14N5GT7YPQ
	2OzbUxG/LPU5c3Anr1ICeplKPFZg1DU+Y4DFRcwWnS7cPSEbHH2dtIhYXtw7hDjM2ty70K4Di7q
	Q2jZV+BdXLczM4wAj1uxVKKpZJiMgcxkwee1quV8fIcYmkVYgVK7RB8uJbPnT4Nr6ruWEF5ugBy
	tHOIIon1hQK/wgnmTiwdpGR/LX8hVg6QVlhxZ6SojDpz2lQoJvLbyFaRMUG95dTDlOdR/A8UNl7
	ssNLpp/RZQbohrVfIM12tv8MWLNgspMhnLKBJ/3IeQJ3Odst88M6dH5VYmKdQwB+3jGOEnt09Yg
	==
X-Received: by 2002:a05:6102:442a:b0:7d2:d799:d7c2 with SMTP id ada2fe7eead31-7d6cb430827mr150812137.2.1795027350872;
        Wed, 18 Nov 2026 10:42:30 -0800 (PST)
X-Received: by 2002:a05:6102:442a:b0:7d2:d799:d7c2 with SMTP id ada2fe7eead31-7d6cb430827mr150801137.2.1795027350370;
        Wed, 18 Nov 2026 10:42:30 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b91e87f4sm2532457137.7.2026.11.18.10.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:42:29 -0800 (PST)
Message-ID: <4d16306b-31c1-4406-a1f4-858abd3f44ff@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:12:18 +0530
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
Subject: Re: [PATCH 1/6] firmware: qcom: scm: Add
 qcom_scm_gpu_init_regs_is_available()
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-1-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-1-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX06rpvo/IHd6Q
 4l1EnQlbVjUUK2mpev6SdQHjdFOI4YyrCJK6c6UAxlkvHhWR1LMYmleRnx9vGRrB1C0E6uAiQaW
 BqqR5I2Y8454zq/62tllbvt2ho3Akh78A4QTNtCE/Oi1BCfLOL5fJxoyS9lU4ngm/GpapNDL933
 jxsZfkeaU+gnc7ZWXU8XgUgG1qLSwbQfBoZMb2zMa3RzdOv8WnXiMidIS760PGl7cusFaaU2nPs
 W8XFBAWSN8a1G5s95lODaY1nCEvc2Qn/kTW6aaOJL61GVM9Vkn5SXXLkFN7sn50O/qdou6BEu4d
 KQz9UZ0lQxfv4t5AopDBNu5MSMnPb5OVVu0F0iJItQHwBaj8A+I8unlKOI+yDRsCm8uLc2LgND+
 s6xhaT0pbzzAPtyG8TxcOBerqAX5yyUGVPUV7QuDhiLXabH+ku+EkPduEIs2E4E1DkPs7eOD7Qa
 w/VN8H23FzSsvTRSEGQ==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afdf197 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=L50M_nCPciy2geT04tYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX1L9bXh0vK5HA
 tRrppmXbYH3g7f6sfQLTNjhWSi66iKl+3CPyRmTqfuhTgCEe/VcIhXSoJ+D+pV5rgivPyUE5yTK
 7NywoCEyW/d2QZ34t/7D7PKLQKYKtcY=
X-Proofpoint-ORIG-GUID: mvjh8nISnxzD7k3XlK1SYsL8keZuGzdn
X-Proofpoint-GUID: mvjh8nISnxzD7k3XlK1SYsL8keZuGzdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> The Adreno driver asks the secure world to initialize some GPU registers
> through qcom_scm_gpu_init_regs(), and fails to power up the GPU if this
> call fails.
> 
> Not every secure world implements this call. When it is missing, the
> call fails in the same way as a real error, so the driver cannot tell
> the two cases apart.
> 
> Add qcom_scm_gpu_init_regs_is_available(), similar to
> qcom_scm_set_gpu_smmu_aperture_is_available(), so that the driver can
> check whether the secure world supports the call before making it.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil> ---
>  drivers/firmware/qcom/qcom_scm.c       | 7 +++++++
>  include/linux/firmware/qcom/qcom_scm.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 030e4ba90812..f4f34b7dd0b2 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1941,6 +1941,13 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
>  
> +bool qcom_scm_gpu_init_regs_is_available(void)
> +{
> +	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_GPU,
> +					    QCOM_SCM_SVC_GPU_INIT_REGS);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs_is_available);
> +
>  int qcom_scm_gpu_init_regs(u32 gpu_req)
>  {
>  	struct qcom_scm_desc desc = {
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a0a6bc0229c4..c9e88b2904e3 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -131,6 +131,7 @@ bool qcom_scm_lmh_dcvsh_available(void);
>   */
>  #define QCOM_SCM_GPU_TSENSE_EN_REQ BIT(3)
>  
> +bool qcom_scm_gpu_init_regs_is_available(void);
>  int qcom_scm_gpu_init_regs(u32 gpu_req);
>  
>  int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
> 

