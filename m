Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631032C325C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787014700; cv=none; b=i6VI7V60+EyM+G9XPMSUza8/IxVV8dOs7qQcNw5bSia2fKZtHRG5050MDdDXr4BN0VFu3N//iNUUzUDq+2WWbthV0ITslcicYv+lyOj+DInwdZgiRyUKPF30Em7yyeKZ94YItz3Ke57E28uOkkVqWPdhfazMY83VOYEKDpK/5+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787014700; c=relaxed/simple;
	bh=joYuO7f48uZoFbfGhgYUW6mhPzMWg0Ff40EKVAM/6qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDmn5335kZnTETv5rOX913WGVnk0L3s2qpBdmn/Ec75fi4Q8Ba0ZxzFz++XRbcG8PIuSdwMzuqHfrsEbb2t3j41a09TYG5epdSJr3uoGJD/P95YOI7Ll5zU8C5uasoB1eJrhuwy2UVPAgSO7hDl8ng6zXRDkERks4N1ZkWjST1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6GIWZdC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ptk+FAze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6GIWZdC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ptk+FAze"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkr1o2331358
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t9VrvGoHX6Bv1WgT6pX7+u+s
	sDo3NZIStFSLIc19qOo=; b=m6GIWZdClIgMNqVtdwhzOvWtLmZ1MI4dZAClaJVt
	6Zht0DmnJUtiVA7Zn3uAWskhghly8/4en3SoBbZe9wSeaiTqHolC49vtegzbDMKN
	371OBXupH2ghpWD+5HTrlo5hhjnxdbuMPkt0m+KFsDjnZdoBahTzIdzd2gCBI47b
	zERQ8yIX40PKDcDhUmhxDeAXRruLWtdSgW819y/eLol5742bcTF8buQ2Js3UMBlk
	pJpigx84xtl9pgiNMgvuOD3QjHb8Fx2ffIKoqXFWyJMzQ//9Scjm6PyFGlcYLNHt
	5gFvKQGGJYsNgtCC6vYGIwt3dt3VhH24XGdLfWoaBkRM/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke43wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:58:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ef13b61bcso576889485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 17:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787014697; x=1787619497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9VrvGoHX6Bv1WgT6pX7+u+ssDo3NZIStFSLIc19qOo=;
        b=Ptk+FAzeShg3E3K4Ma78OiY7x90NUJq9XXXbaFaY0UNz5mPX/otCdNFNvkq6SQHsBo
         /MWHiovHGQwelzT/ndPGaJ7IKrQGXsYi4cfbXEkTyPVN0Qm9fOCkZms8DjxQieVDFNwi
         7odRVoNfjqThLQ6jKDefjWAbKxHx5y0WbbN9RKSZCGsH10VXOB5wNROKSWlByewqvqLY
         H6k9xnJXyUgpi+1IX5KnQ0rfu4zWti1JNV9WdU49cXSF3giz5Hu7D6hhMI+k8R2P96o7
         X3ByOiw9Jd0qZcURRP16YLcbAGm98FoLrcqjfOkMBAzy7xkrdCcXDVDfC3LBW6tAEqow
         aebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787014697; x=1787619497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9VrvGoHX6Bv1WgT6pX7+u+ssDo3NZIStFSLIc19qOo=;
        b=RriDGJXrsZ0qfBp+h/azdrPMa503h2rolCylQWiJ9Fx6FLhdZzOyB5PbuagD9AAQu+
         o3dX4aPtB/rCS6+NHSIvNwLEL1JmuVyNcPmxM4m2i0GLFpEB/95NH7Js0ZKwhWI73+ts
         LMvrMyj/7MqmfYKzku12LYhRr5bTXanHHC7y2ixUF5vJKwRQ/OPhPvQEkTUKnlP3V3GU
         0VUf+Q79WaukHygFdOVybNHHZk2tJA6z1x4rm3fsG26g5oPgwtKkuO9Ze/eyyQmTT77+
         X564nr6aZpREbvff03bJ+fJ4OaNF4GfxIV/NEd1qAs02KUBhVbDwWs3Kpg7q3SVxd65O
         DBqg==
X-Forwarded-Encrypted: i=1; AHgh+RrLkTko20nKjYcvq8xsXx442I53pJzfIbHVYL7lq7/GQAjE8FuSczEa+hXDucNZiI/8MSyJLo1BHeOOV/4K@vger.kernel.org
X-Gm-Message-State: AOJu0YwUUP60wFlCYFjeL0nW60fl7cDicyY3q6EXgj84LEjx9favplaV
	pS/+Oo7g8KjnCoF/kfXWUehtp0EZXtdeITtSyM4U2ceVN4sD+uEvKEfoO68n0GB02wCuD+jmiBq
	vpSnXopZ+9fNvpc95zBPRWQwZ2qPZYFDkBkkkpPN/hP1odfWLdidIbxzh2Vf455xTaq0v
X-Gm-Gg: AR+sD13TF6bsCPP+ojs9RTx2XqlZj2pILViDH3hmmO63EcO9fl1iEDoVPvhnCLXjqRo
	tpnYxh97DTR0KTB14cTFfbwvJQ7qtSxTQ+KTIilsgUjqDBz5ZBdgAzeu1ySZ82DyGZEor0rqjFo
	RhV3Upi3EzgPqGZFG1npSUxGOhYyrciOfsE7aoEXPMOR6VEgQlBZPLleDFB5LEUio9aIuU00CC2
	kiAnifEWBupiGr2B5FyRZR0Xt6m/akF0wiFRghvZBVOfg9PfhWHJY28Qw1zHG4prqRDaYuT05EV
	X8v30NGDnVcO0Oa6Sj6W/o3OWmquFZOpmMdRiS8Hmj47DSTLCyFpDQKpPwox/GsvGw0SoDfmwqV
	NyGEz4tPdw5eI8DxLEC4hAA/0Yz36vnoi1L2YWEEbCJKK2C/ZJyc2pK14oWVOG+3dALVnSZHOYF
	cqHOPiJC8RehYD
X-Received: by 2002:a05:620a:199f:b0:92e:fc45:3472 with SMTP id af79cd13be357-936d233171amr2785463585a.29.1787014697434;
        Mon, 17 Aug 2026 17:58:17 -0700 (PDT)
X-Received: by 2002:a05:620a:199f:b0:92e:fc45:3472 with SMTP id af79cd13be357-936d233171amr2785461285a.29.1787014696974;
        Mon, 17 Aug 2026 17:58:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1bcde2sm8651721fa.30.2026.08.17.17.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 17:58:14 -0700 (PDT)
Date: Tue, 18 Aug 2026 03:58:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, nathan@kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] media: iris: Guard the QCOM_UBWC_CONFIG select
 with QCOM_SMEM
Message-ID: <plwrjn7mzqgphhgjuaqcvz66g6d73u27xmlshua5vobrwwfoke@zlij3jglzxy5>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfXzI/PQbYumCfm
 xPcwgpd33+V3Lw696dGbuJdj7euVj6PVn/bJqocRHVznQIcLs6bQXXc6mfg80A0teup0YoE5YwL
 VIXqtt1WB/sG5glY8d35LoeL3Qj52IOesA2GPmJHayQw3osHKpBX3dFS36jiCGvAUESCjLaTTUZ
 6bPY1Z06Z/oc8FoSlgGdDKXCdk6lSW6pLOWpCVywOOukZ4g8X/7+5KtfYI153EE0R+wRnFKIzx0
 hb90eGRnhC05e954DwlelPox7Tb2npXxP4QGk+1nQcFyK7hWXbxtRQVb49SK0lmED1cLyFxe+QU
 Rqy21/PYju0IHvCxLdmpJnJ72hNRKn8F3+i6MN5RuBWTfceswhWB3muhAVXuf0SO0zdoLZadhOm
 gLyfCDhqubRZWuuB2o8jDZxEHRKlqsohbDaHn32ip5wl3fU7B8bjuu//qV7TkC0HNUQJRKMZ92q
 dZYjmlHmHYd3CCpwpHw==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a83ae2a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=8AirrxEcAAAA:8 a=L1AqNCugDRGGcWq5ZiEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: i9-oEr11KP_SgcN58b41vVANk0vz5quO
X-Proofpoint-GUID: i9-oEr11KP_SgcN58b41vVANk0vz5quO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfXxUDhK94TmNtQ
 WTOZm3rWUrrAoF1eiBJx8mlENioiT93Ehb24nJeLB4McEvRe+wxS751XKlkdaefVZ3/KQmPnZ5/
 9p8Zz8iSz7WzNZlgpiWJ4DwwhbawyUM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
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

-- 
With best wishes
Dmitry
