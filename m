Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9283A3769E4
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093549; cv=none; b=NG9XvweI4iMfMHmSm5iNahxOax+xSU7t9LmQa/Sq9fhkFOJwp+A9YRcy6kp2c6KrUVp2tePtH9pKSb5rkVVcj0XHv6YAPByU++BewU+sYTsw9S3+nbWwdgOumyGQzj5MTfXF1Hs6OhTQSVBqB1BD0vhJnEZPBEvOjhiVMCUXuhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093549; c=relaxed/simple;
	bh=unUehMfh/6jx4jmAw06ctObcBACg8Q2cRemniDp1f2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVuwEQi8+zI7gMS7Sbtxal8g8u326ujMiIFK9G+dX7ugtQ+5qeRyb4aHpgV8IpiWMo34VUbzoSkSs1mws2fwsTPJ/gE+p8EZvNFGG63BK/TIaVIfMS2H7n13P4iGpovJqZ8UEqEdIVUItc7rOKUP91Br+FUe0yB7kaK6hoo2aSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvBqYIh+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIW3Vy5r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvBqYIh+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIW3Vy5r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67781mIq3176962
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 09:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ygMnLMojqqSWaeWA2FBUR3RE
	F3in+bKCxOBNkRR2fLU=; b=lvBqYIh+HzaVug6+VhYtDTFeFMb0AJws8sANpfnI
	d330ClP2Uz3B4wH5JeABo6nsKbsJT3hw/yoQD2my+YU5MhHtbvuQaAc2P2vNQ9AY
	sig4+p5LwAgXWlPVU+aisHOfG7e+Sb4/AbYGVM9/1Dwya+5LfvWZe86Wi3ufLpFN
	juXWZFfb3w8i5N+u29ur58CIXsMPMvstx9QpQWPrDSElMUCz+ThXB8CPHOm5FLly
	gireAMCxBeMypnl88k/gtufEpJZRAqxc2w19KfIBTTAZm6CdDGOBRblANLAOib2S
	XxoXK/0aCmVifQEBrnZtUODBCBpwoHC/EyzUMXq7Mgimpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jk3tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:05:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so34233891cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786093544; x=1786698344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ygMnLMojqqSWaeWA2FBUR3REF3in+bKCxOBNkRR2fLU=;
        b=MIW3Vy5rjtmtz3qIMjQcuLEMzX5JdpYp896NWrSJC7pJJTA6AEyrk7qV0gPchAnHyZ
         6TTcv5EZ8JASm6evoox6JmaHet47T4Blj+mY8I+II5EYUjNLWdzH/w6nTo4ZvMQYOo4T
         30OgH2zpBi5glpB6R4zDs55wbQ22JTxqTzi84GgcEpBdXuRC9esoe/JYV19s64Ay+pme
         W4BOZrhVI4p5TJ0ZTyREfpVgM+ubw4/qb0x2NIv40KTwYVdqEoCy8Mu7sGETzDRadFwb
         WklscOK0/+uqsK5PzO6Rs1ZA+Lq88knsR+z0js1RZjXrCws0fk1osObUH3Yw+NoAIlJa
         cgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093544; x=1786698344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygMnLMojqqSWaeWA2FBUR3REF3in+bKCxOBNkRR2fLU=;
        b=QMJaS9CSLDCdBbr0qisTu0T89ChrLdIF+gMEJLZKPrOIHHp72bhHOVNLLCGHlGLNJB
         Dbm0UVqnAg6VhHQ7vyxcJSEWsm0C4lk9ynpAbvjTKrv486oVKEB33aQmdYYieE+HLptM
         9G/1O7itgAdb+4IMWBrYpc/1YHvmiISlmmUD1cDsrilYK1sgj+Da4gyyPKyCAqBMCEdC
         F9Ls7LaY8AIkfomWwWoU1AvIZmaBHvmfxzo18cLxsNoGvdYDpn0Fh2mil8FE+PT+ayb5
         PkOLnZiAV4IqlVlc4K0okDkyAAf/Hu1jY9RDkNWyzfWnL7HknibBXCu6lIXMQ7OeyWNa
         lZYA==
X-Forwarded-Encrypted: i=1; AHgh+RqpiXUDkeMB/DVFxKq1shjwZaO67tlGNwiejbxpcyn0a1HVaguH8nd+x29QjU9N+kwgT/3f3V2ra3Ev+AuI@vger.kernel.org
X-Gm-Message-State: AOJu0YzDb5guyVLLuE716drd3trEoSznkrcBA8+JYoS+NSRGbSI8oN8G
	J5KkJ5c4NujeiEtgw7A+J69PMYlFGZqc81Gv+XRAlUYNYxzTFiAcUlanragsbDbmznsOUT8Qrlt
	/1UnYtJ7xqFg3We3MIzcju2rbQt2OlpjaVyTy7AHoUVwdmRqSMYK2fzdhjWzBLM6zIsEn
X-Gm-Gg: AR+sD13po9eMgf9sN43APJLYuL4Fd5+X1JdlrgvSDfsxNSEkaKEMFFVFi/UZtSjjLpU
	VCF1YKihpo99tmfLMeIIqeUGsMQAvYryzAQVMAl1lWT7Q9PpfnEfB+l8ix2A2E/Epe0k1bgjuy1
	AZknlwHRpSGIwJqxsSgE5fu0X8sZOs+kJaAkVMZkO8flt+LMmBxlz7hFU8n8CUcxhvHwenu7Wkt
	g8utN43Gwlsg9YTjEvhSdw+GPtTMk9LXklsIMNBTWkaA74+t5TQIPeIlB9HcJZCRe1CoEZPECSi
	FR4v6emcOYLDkvr9JBpxzj/5Sl8hyJLvG0O9B+th8EWU4aYMXifCTELBYomDkMlf3w/XkFmiACO
	l7r68qsQNJ713WKQJ5wdXt6AO38BdpZDDL8ebo820TcwM94zXQ1Ri3qSuXNc72q+BnwlLDuis2G
	EdG3LFFRSd+UVGow==
X-Received: by 2002:ac8:58ce:0:b0:528:583:a6ca with SMTP id d75a77b69052e-52d18e6e3fdmr15399331cf.14.1786093543951;
        Fri, 07 Aug 2026 02:05:43 -0700 (PDT)
X-Received: by 2002:ac8:58ce:0:b0:528:583:a6ca with SMTP id d75a77b69052e-52d18e6e3fdmr15398841cf.14.1786093543498;
        Fri, 07 Aug 2026 02:05:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm2065451fa.28.2026.08.07.02.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:05:42 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: llcc: Update the SCT table for IPQ5424
Message-ID: <q5b6lkfejj6ejqhl7ta7xtmwk4qetnelyxuy6li62vccko27gc@ys5wru2sja2u>
References: <20260807-ipq5424_llcc_updates-v1-1-1f56362ff687@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-ipq5424_llcc_updates-v1-1-1f56362ff687@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfX1kvGflTjUHCf
 ya0fiEXpsDe6PQeSoNPDklep00Sge06ZNhQTd6GQ1jt98P1GgYRz0ec6nDioR6bFT1xe0EO/Shv
 T25CR8fMw3yEppY7qsk0xqs5hGMPiBaKBIGbMLD6OkWOB6d0vJoz+fTy++Mo7gr/odhwAp6M16P
 Rv+ek7jwN4HwVKB2Sxpt24dE5XIhzW/EJ82id84IceyEhwZD+sirzdgeRHi8mXFZnOpuATZtaGt
 lEHngG0+KVXlGquaunPoPMcgoK0qmH54J56HqtEvVAaFDQCeY+WDfK5q3KJ9aIrGfPP9uKAxnA4
 LnMS7La0SNvAAtL3QW41FF2vale9SkzmF04s0BDNIuryBTz/q+i0ssOsDNFGcrgR27eq1Yo5gNn
 HBUVMYEV711hUhDhY37GU1wQSnqj3/y/lR42DlSWxgPr/UUUpIYteiAgC1i/K3zUvM8UE5HDvOe
 dpOmZjk/fMVhgM+ddpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfX9DnLfvxDMhBJ
 u5Thf/J75f0TTSvCqAmdovSCL0f/XPC03kHFSVoHsVzw26gfM6zXgf8nfJhBAtE0MuyEXiOj2AW
 I0/SDodYH82uVAA+S9HV1CY38ZVwlrs=
X-Proofpoint-ORIG-GUID: UcVoBpcuGekIdxkLEmjLxiaEHwho0_N5
X-Proofpoint-GUID: UcVoBpcuGekIdxkLEmjLxiaEHwho0_N5
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a759fec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=scoem_1CX-FocSWMDOsA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070067

On Fri, Aug 07, 2026 at 02:08:16PM +0530, Kathiravan Thirumoorthy wrote:
> Update the IPQ5424 LLCC slice configuration table to match the intended
> cache consumers on the SoC.
> 
> Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
> slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
> 2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
> and way masks for these consumers.
> 
> Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
> LLCC_VIDSC0 do not describe the actual users of those slices.

All of this: why? Your tool has provided a summary of the changes, which
is useless.

> 
> Assisted-by: LLM

Which one?

> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 56 ++++++++++++++++++++++++++++++++------
>  include/linux/soc/qcom/llcc-qcom.h |  4 +++
>  2 files changed, 52 insertions(+), 8 deletions(-)

-- 
With best wishes
Dmitry
