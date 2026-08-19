Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6F03BFAD9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 03:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787108433; cv=none; b=SapOBNKqrU6Y4Qgq/aIf92zWFZ4Sv+ajwVLbekGHVE/BkDMP4CTyMwVaEdvW/7ycN93oQu5UFaxkr16C7R2UKCal26Y3cKGZKIdo69sX6UWCMspniK05xIF4Vgjm2uP3vLJUViyrNLi+4Wsz3ShLAXMZQ4WeliQDVN4wsr6Knec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787108433; c=relaxed/simple;
	bh=u5zrGWxbdJvOMrTsAW4beCXv0zNPpebDufYXroNLSbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzNfdqnPX68eqgZppC6OSl4NrxT/fakaZl2C8bmM3D3kmw9BPC71eRUZyePfh7VyqGdYD34apAIIDds06aAkki99tnZvaqBf5O7qPhTakxzIL7eEjc25+xkZAoiYr/N6ql8tKdWWve4xCzB+7zQo4BTU9P0wqKv3eZ1DPEaXAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpWIqx3Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHq8K3bs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpWIqx3Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHq8K3bs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J2lWbT2735515
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 03:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RVXkM6h1x8wmxO82Mfxg/gaB
	JOGGT9mo12ibYmRp7HQ=; b=RpWIqx3QG4Qm9Nc4tYE/jVg6leSuVdVS/DkBasAP
	mhDSs0yd/m1WY5KE154qWQ4SFlTvwMN6S26BYxWN4m+V699mMgVwFRLpwhIPRcv2
	WJ9g+rvDSxhTNKCiqLPxjRZ8KFx4v3gxEc3rn5vvTUx7D1RG9A7PORzGuQnhlviu
	sU5XkzZcVzsMJ3PpA+bCMooVyi/Hlk/0Dwuv6YY0yI6RDmwEsGHC7ypnans+pmIa
	bMXu0oluu7VJqjHWL4Nb3cQZL4banlN8EqAR8bA1g4fAa3ZG+Js5bBCNusZ6KD3Q
	j77w+9nM8X28/eL44KId3qCWFGG1YWeqavM4fj/oxzb9qQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm8yw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 03:00:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so116644985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 20:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787108428; x=1787713228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RVXkM6h1x8wmxO82Mfxg/gaBJOGGT9mo12ibYmRp7HQ=;
        b=HHq8K3bsJ+VxokHqM96QQ19JRkdhmkdq5SW4lzVwqHn2hfA+7oaqufMUeDqYq4Ik1W
         Wh5B1bmR6++TaFAJOp17D5mpKUHM76DnHO+RfQYaZgv3TW4OcbpUM5PkZrWeLdBdEZMK
         VaTkJ5DW2hobbBNnYrkVFWsS9tmMBbrmrZk+MfZHmCzjbMW5k5vd0bsyi7teE3wlrxKP
         wo7efzzK1sbzZlgBMPgKPuDh3CFBGFvlkLF80phvldGra8Ycw+1BkLPa9nmTvoekYFom
         IgiQe4ZV1Usc4GnTije38HOnlidDba7nZOrCx9UHYM8bDoYHVpv3VNalk7hRdrzHy/ul
         KNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787108428; x=1787713228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVXkM6h1x8wmxO82Mfxg/gaBJOGGT9mo12ibYmRp7HQ=;
        b=Kn6SGIDOXKy0tVMnujZsUMEclQboPQDymaXh/XFDackINE9gF6oI3aEJwp3XLQNqMf
         7KZG0UF7nFE/folnTqaslMDpspxKRndZ3r90TnOcfepxFPXUggd1bKPFOTt6wj2ygh7R
         uXn7moNIP+3hvYyPeLVVZsRoCKI2mbL582wfsyXU2YJTM+vQzL12Q5tqunpPyBLbbvAc
         Dph2P2xqUqwgTGcycZegzhx/kfv0UEyMQVX8YlgUddzglLCC84jPcL9RRTxcIf760/l/
         e8hwXJ1DKMaFQXictoJkcqH6VswhgAYXnAgkkiJIBoauJJG9WFR8rdzuIUqo+EBwDb/y
         Qgbg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/fmAGE2O7nFCRDPjlRVEZI8kDeZyPl1pWoS48iWPDm3ZROM7Azz7i00vRdl2N67P/LyaykCq5nANTh5u5@vger.kernel.org
X-Gm-Message-State: AOJu0YxVHZAk38wxbvE7W9UbVsTkj92N+loIasr5vToVFapRlS0ICy1F
	UcniexHh4DLpENttXRSknhO0kDjSnUtQ96gsKe7/QUg1YkzAOfiHqyrpGoE5Db6iowk49mCs2nJ
	GPKc8uU52dGvLwlfqJp76k8o9PxiKvRMTTWhdmA3Y1eIJG37suVIyOD1kBDj6gsAlXNkD
X-Gm-Gg: AR+sD13/aapqJ0umDFmSjta8N5xBaqOV1LfsUiIKZ+yiB0OhNUbOcS/wrqumyBqavBq
	iBMP46WjnR9zz6YxQu/OBpNDqIEAFlrVZK9jE7ZDFxJJSCJn9umnuy8mOUDMh+3lu2X7KziutpH
	z+0+/9sP9AT1udU34UO3sIoGbfq1y+4ZufZ+j/qTwv3oZhkHoZ9fRbkDRYXRMyzWlSKdILyUJE+
	Cmup+v2qHyRRK+mXgIZQgs+L/eTcid+ma/XYFcsPwGHiJ8ZktZ9a+OFeNjReIyP1RO9lrbScQLA
	rw/67HyA8Wz7mMThQ66dlPrb5w1dxqAcSc8si8VNJduorcHuu0DwGNtVxL9pnR+GiGMrz+x/aTR
	rmmTEehx4+ABAN3I=
X-Received: by 2002:a05:620a:1712:b0:933:a17:c0c4 with SMTP id af79cd13be357-9371e1de2bemr162890785a.9.1787108428213;
        Tue, 18 Aug 2026 20:00:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1712:b0:933:a17:c0c4 with SMTP id af79cd13be357-9371e1de2bemr162846485a.9.1787108422812;
        Tue, 18 Aug 2026 20:00:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d4asm1797472f8f.21.2026.08.18.20.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 20:00:20 -0700 (PDT)
Date: Wed, 19 Aug 2026 06:00:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <tq6aojc2etmxyyxo7bdryzm6ayito7l4c2ja36rvt3nb327m2t@imznr5uqbojx>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-7-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-7-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAyMCBTYWx0ZWRfX84jNFpG2ZbgU
 +xLbkZGXqwc/jlQAgGh9/chXMUqZkuCniOikLAV2gu4N9L4GPy+WFXQSnkPcgGSG0RZGM6yxHMS
 uP1dl3MLmIawtu6aOnz5tRBTKTKPyePF29ca8d6eM2eVoGBXK9wkhqafOL+sIkX1nqvseN4xAjD
 PtyX6MK8cpB5f37bVPULfotfOd4Dp0TqBIa98H37vRToJ5uaBxwdDCjh1OAFElJnRoRH++eJVRf
 WUdbSxo1iZuly34Rm/35gGef66lt43M5vuaq8ZetRatqZVioKq1iVc8nnJwfO4E9RHaDwz4jQoD
 ta0fVCPDcTDMq8YGsd1Ng5lJVPceeBYhGmuD0ortHYtmsGBu0UXxkVTFaN/v5QcUZSw+yf5fH6a
 HfJXxVNfvaJ4QBTnsMmBR3df7NLxHYG85jMv1GnEQ4vA2fZk4JOYa55Q8MjpeMbEozbIUSMuJw6
 hOFRI8VrK/nOrfNnAEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAyMCBTYWx0ZWRfX6waxgWtv7cql
 BcEybMcp/ipcbwvlchfQIfdp8gsOqRd1tnu8zEj0yk5Q+4oGxPlTQtaSyBLo6YGIGqR4sywiet2
 CNVABZaPfbOPpDLVD/OCOZ231o8W3n4=
X-Proofpoint-GUID: HcuckJqxKrcERGbkrf7Z3aV0dKg0sXoB
X-Proofpoint-ORIG-GUID: HcuckJqxKrcERGbkrf7Z3aV0dKg0sXoB
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a851c4d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=Z0LeWUw4VpMA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190020

On 26-08-18 08:07:48, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
