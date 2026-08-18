Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163829E10B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787014684; cv=none; b=Yp7hmqaMCqXMmpMAo4Fa7Xtw45E3hLgnRrGS5OfFFwRNyn/LY8EH/s5bOOtq/Dgv4FEDZDGrfo1IGsTT7SlHpCNEAdDD9vHJUom1FToa+fvTtcgy7W3bAlbzTsNMiMFoZmHUZXn0p8je8nwsy8LfY1dhPxbaQgRw32Zh5anl/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787014684; c=relaxed/simple;
	bh=2nLMfiVENNzVCFHMgkOReMGXDYTJ9KQ/AvPIn9EjX4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmLdW07lkUiq78iOF8V9XdyRfpGOMcaD7JfNy0aC/LDbpvAXhqOGDZu87qdQiRc3rOg95TfK3pTTANN5d6i+jaxBQZrYSii/gTiqAUN8GvdmvW7eqo8Cc0Wya0BGRN1D9XlnROApSOi618ALqSRkagB2aLQUaDTinyxbqnXM3r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJ0Dc5zZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiO2qbD6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJ0Dc5zZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiO2qbD6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkdSl4076456
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yneab15Pg9YDX4T0nXFdDDHC
	QsOjEAzYeDxUgJqfs80=; b=BJ0Dc5zZGYvqEIsBuRQMD+AkIHMC9NubgbcuMVt/
	wcXt0Xz7QHTsv4xxV0GKLh2qqeQdvii5ihL1K24suG7kbtoeSdKzEIH3SOgW0lH6
	2XwbvQpIRDbyk9P+IvRq+cs2/m5jwAXbFa1Zui/3BbOpYeBRA9l4YKHUK38ZFNwD
	jEBG/rTtdOJugE7bra+l1aTgVQsHnhFfBSgrbfGJA5rGxWuA04ucI9bs5oAZnVCq
	FuaFB6z3YYaJKeqdT3FeD0Pbhk40p7t0IStNrg5pNsbQg1ZQq9DeigKQPgWgWaYX
	csT1BIP7MsO5XpL+cTPO77KCDb2OPD00/pjnUOG5/nalEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7v0ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:58:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936d067836eso424858185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 17:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787014681; x=1787619481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yneab15Pg9YDX4T0nXFdDDHCQsOjEAzYeDxUgJqfs80=;
        b=YiO2qbD6ezOaIBEVfFaTaaQyjvgq5DqD9KJglxkd6z2dMFTynXNjMpfFnztCTjnrqJ
         U6Eol6/TEWPhVnyWVMNFbNyL7QnvEWBW6GGuwqxgOiG4eGQEcReW7USTucGzw+mMBOcy
         vnedvgjd0QqpbGH6Vp+c5wMr4PQEuA9y9HT3sLZ+CKZKWB06LrQCdcdSOQW0IEaTYTBN
         8C4W2HRoAHslMJOVfngHLStrDm6D46V29OR/3O+f//BRoAfzh8ibZ3iJM8UIpNQQsf2U
         SUvPAPlPPdBZLqENWWsQTHKOf4J4j99NjpxtIO9BEwAKsEFy9OH4JjBn0qkmZCAW93Lk
         0qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787014681; x=1787619481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yneab15Pg9YDX4T0nXFdDDHCQsOjEAzYeDxUgJqfs80=;
        b=mmdQY0VGTDK4mjoKPQXKCXOFyzbBqd6rkhIkfN3UWLcNF6/7R94Ft1JysI+EuBEgj8
         zB9ImLujEn2C8RfwWM+v19SSzmRSzyU0/TXqoIvKxIJamSsXAZvZXxTMzK7QUh47yCWZ
         0GMCZOW4Pd5Id7Igpqz3YHAoZYkSGL+FiHK+6lNluhHz/WSxUjB0uvWi/yfGEejDe9aY
         GeCv6VDtr/LtR8mIFby50HfaJe2MXDBVqrG+fLFRJgyj+V50HSHDozxZyt7Wcdoz8oR9
         6TPuue6naC7OkeCCmDyi/Qi3k7DAtf++kkS7o8gRd/zEg08c/ehZ4GO+yJhQJSY1J8je
         23pw==
X-Forwarded-Encrypted: i=1; AHgh+RqeIHQh4Dg18o5VLs+mYENNyprIL5a2ycyPzMVvWTlbRVQg0aQDWoz+/k+DfK2AVBY0tmY/JCPVuIjcaLpc@vger.kernel.org
X-Gm-Message-State: AOJu0YySgmSftJJn1kb0PsPPs7WV8KF6rXB5yotOo0YFsKzKdz9HQWQJ
	QZmbHiCbGLPBPKRKC3ZBMd3Ph1ewE+JCPKQDvUh60AN2CERHAibomzMjyyEWtvaVyinfhikN2a4
	Ywp578jBIPMno50om3Tb1zUFqwAkrLDv5eMLU2wNUcvwqIfl6zo3qfCN3QHSd0yWqlmEZ
X-Gm-Gg: AR+sD131Js8OHJ5PYwFd7Xhhc3RGc0xQVHFjDiMhqS8lvQUxLLOVvVVZRIz4KTtW5Ee
	3la9ev7b7JapR3aRUh8j/CYCS84lEBiCeNL6R/4biyzMCLahBYq+rMcNEkClGfdvwbOGB+H1jl3
	mPf+A3lQwT8G0Fw1xdCHpi7BxEdI+SBB6YDl0rXP9ko1BJN+Th3PPwQQBk1vVP10P30S6y+Qj8S
	yq1+4rPeLjdeY5fl7JkamMkNfJsNJUGF92V45mbSh5o+hTIUdK/wHHnyJcPbRGehRd/Pz6sXJzA
	lleMSnwbQgmC9XC/FodKufDh5mpAcrdDA28myDRB0IU6kNVjN/kslgXSdmVS6pgx31Agpf0NIyp
	/Cxn1T+zcyaWYuPssqzbikL8ECrZ0jgWqQ0MKYvrdXxzZKJsb5iFf3iku1miTVtF1zrynTcgZIT
	U13Fwk9ETA0pnr
X-Received: by 2002:a05:620a:4405:b0:934:851b:f3a2 with SMTP id af79cd13be357-93707cb7866mr217553785a.8.1787014681048;
        Mon, 17 Aug 2026 17:58:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4405:b0:934:851b:f3a2 with SMTP id af79cd13be357-93707cb7866mr217551185a.8.1787014680659;
        Mon, 17 Aug 2026 17:58:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa12ccsm771793e87.27.2026.08.17.17.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 17:57:58 -0700 (PDT)
Date: Tue, 18 Aug 2026 03:57:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, nathan@kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] media: iris: Guard the QCOM_UBWC_CONFIG select
 with QCOM_SMEM
Message-ID: <oasutuax5ghsyg4zbkjl5cekg7iitiiqxsb2fztsqgpc6ie34e@niub62b5mwmr>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
 <20260817123542.48475-3-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817123542.48475-3-daniel.baluta@nxp.com>
X-Proofpoint-GUID: LFUnn4eZs7gymJBBR2LO8Al8T1hCH7YL
X-Proofpoint-ORIG-GUID: LFUnn4eZs7gymJBBR2LO8Al8T1hCH7YL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfX+sMGD+DHN8vG
 eI31qlQi2OB2CpXQX9FEdNQO3ulDi63DxspnHRCCp4hmjicskMmnB43G0SzUcs8Vv75FKv5oI6O
 sWbOdrK+Jpg52lf8asWh3vgPPS+JChyiplAZL5Z7ZZK9aNrz1qkI1TtuKt7ci14FHDO8hftCtPn
 NyrFXm/HY31b9dz4NWoKtL25vqyDvygHCTp28EFtZArr8Jl341rgfrReQkryTdYkkpayXgO7enk
 zmHirqki4lPf8mgT6Pixf/ecgbgky1+80tqayFVXdnIm6QZSuPj6PECMfSnQAZSsXhsRCXr6GeO
 f2D1Id3O4KHFnF+8Ol0SAogYQrOR2TQDIAT4DYZPOY0UpkvY55OLjZA9JGrm2mgdip/KkLabXME
 98AU0PwRJUAmjF72I2sbS4UcVzCySkPiWiNreruTs8HL3JlNqeLDt9J2BeTFZG243MJNPP807e+
 KJufARG95VlU77NByHA==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a83ae1a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=8AirrxEcAAAA:8 a=L1AqNCugDRGGcWq5ZiEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfX5M/WNMXB4lkq
 Ku3SJNrv/XERQsVJDaBsv5vjG1E3+ujmc9sG7/Az4F1SAlU6Qqt+UgvjiMt17fqKUjmbzrRwGuS
 5/9S9FiP2X+4s5paNdgb90vlgtA9OtQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180004

On Mon, Aug 17, 2026 at 03:35:39PM +0300, Daniel Baluta wrote:
> QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the
> VIDEO_QCOM_IRIS select with 'if ARCH_QCOM && QCOM_SMEM', and add
> 'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
> selected against a missing or modular SMEM.
> 
> Fixes: c43207553867 ("media: iris: retrieve UBWC platform configuration")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
