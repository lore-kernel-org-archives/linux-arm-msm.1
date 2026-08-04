Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEA736EA8D
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 18:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867374; cv=none; b=KGOrlL96K/aqxdLqIJFdpu1ZBoQ5lge1fcDB4qGd4lk5VUpAA7cCD22AKdvb0ycPGfUxrzZO29O0Ro78jyksIf2eNM4ZKqce706vgV+USRaWUZ6Lekb0St5PgGZ1CuvqwtuuBEmR0rzeVOcdcY8Z2TbvOkimA1aOQGNWPOPcQDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867374; c=relaxed/simple;
	bh=l05V037Gw6KDgSPeP8gkXt7VLb9lUOoSe9YYff0dOgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQbsOQ82pCc36qc87AOg76xLusF6TwrsoFutVOUYEAbdcOnKvotlAzOE+2BuP/OXlnRGLK4pJYxwc/4ZdrlrHHJ7kK0OIKtR29OMwchle7rLJNf7ZX2lV0nk4M2VKpf9uZmbpKNO3ZyIXLqb0kEHHofgX3GztDsoOOQ7NmJepJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AP2NH6Eu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsW9NE/M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AP2NH6Eu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsW9NE/M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfVn5070998
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 18:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TPVZMaTFwZtDtQEYpIn4Gvd6
	nK8sND/eW3Vwfn4Qax0=; b=AP2NH6EuRJiQPVIhRJPuNMYbeDaUiKsFE+E6pBk6
	qTJx6goyHVwbXGTh2WumxjE/ZCgwZmmopz+wNaMhrtVha1Mdv7H7WtsjDcapF+TE
	z4xxHZw9seRdc5rF/F5qRjNIu99XLhcy73O7DPbY0MApPn87U2FWg1tEy7fue7n4
	gK4dheoca2Tkved5bys1OGrLK4ZLnnPLmL+/5OhLbr9tUZ2YOMtse4dP/uUJ9MvF
	/1Xdq0H7ew9CetnCbAmWQj9ikQtFhioIwePwZOSU52+zbcE75ggUzcJXKpOqJ/cd
	8+ZeS8FpDk1VBnp5cYqj0buCktii+bwgWlt8LAezxoFBCA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fujwsgsfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 18:16:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfca8558d2so1671715ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785867371; x=1786472171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TPVZMaTFwZtDtQEYpIn4Gvd6nK8sND/eW3Vwfn4Qax0=;
        b=bsW9NE/MfC1C+f52OcuEoZwAP4ytKcLJ+rX4IxZS2g2ZxoIPuKWxEouWV0pyE2Qlr0
         C+Q5NcrPQ12qn7gVHYSof0z+oG3oEMCklB9CtBnPCzRdzTZ4xTAUz4DMk6OOZSdE61BP
         bjz0dYCDNuIMu9HFaLEcCA0SMydwC7DSeKQCaTdKzmbXzTcv9qLcoDcKdkkaUyQ/tKh4
         Fr2+a/wSy5xGixtlcRcy/NDjj4LFolfs3KQv1mmxKtpPEBrx2wnp59HmI+AxNJdDD/Kq
         uO5azOr48rhblfICJZ3GDE0hn22MJjgrZeSJ46oe2xPhQtqkR03cpYO4E/1ZPlIlcmJL
         c2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867371; x=1786472171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPVZMaTFwZtDtQEYpIn4Gvd6nK8sND/eW3Vwfn4Qax0=;
        b=GXzi5XJlm+ElWTIj4ZPfbEM0LlHYJm3n2TMu3sdFx2dJMOJ0Qz1MscaKJJ64vcKZA4
         +OR5W0Dh/Qdg/P19GOCMuoP/CTA3LRL8SUosEpcmpA/0Egqm2Jwinq4tNO9UnF7Gvj3t
         QmgNEKjOWvjGQhCSlnf79/K73E3gvUFYlhtFMTZLI1gA+T/Jg8GPxIMPFjUcit0vIoYX
         DWb1hOHM854ovlmgeEfBZSJrE0Vbf48G+74RPGjuqfpCX7gxSKIOK95y07kENZWqgpdp
         AwclF3DnR5CtL/vnDL1IHrvpgEhGTyOkG8wr7psxbOTJeQEBTugpAjoBdxcJaQQ5X0FQ
         ErNw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6nuKgeX+MPLF6ZZIY3+Az96XUFpZ9MAhqO5x6haJOJr31dmC5yYYssTrbHzJileZ2O+un+as+Ib7eeFzy@vger.kernel.org
X-Gm-Message-State: AOJu0YzUS25bRDbRjGn9/Dsl5shsjPz3PokiledjcOA2uxBAzs7c5Lfc
	zqTHnIsuLuL7DQX6jIPMlWu4HbgXrrftW+fiN2GHoWEVtkJyjKmkYdSF3diBBK1u2E9bzClmhrF
	0VBYq6R7nyfn078MtcDa0l+kHKQW9Ald5q9+svc7spi4+W/U8wdbAo+wiHjZUba5eIniZ
X-Gm-Gg: AR+sD12CNMV/AL96AZ9wugHxjQpKCg4FMCuDBXDbFetzNIv+5iYudwMmJpm5o+rFEvr
	U4Xb3qKlMxNTeuM8xu4E433WSVAHVgPLbnuxj7p/EYMRl3q070RixO6f/rZwI6c0eDN714gkR/2
	QV7eph00QXImraQM/p/ODTsMqJd1sueeCtop1o01vZVK8FCxmmCSEgXr90KLI0FDF/u3HzL3822
	IRKhd26zyfDDnfJZ2yfLBizdhxJ46KknTWSHUTAmt0GBFGSNsg00JpG20dejRbSH0pkwXSognGB
	GGUlpBIWqrDi2Qckpclx7QIvEVR0s0j+8Jn5/09tW9H7Rdbutq7m6GmN0cUMIN7I8gWLHieVQu4
	szoqo+25j0IYq3BwOTt019GS6ILo=
X-Received: by 2002:a05:6a21:4c0f:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3cb85ded9cbmr584481637.12.1785867370917;
        Tue, 04 Aug 2026 11:16:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c0f:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3cb85ded9cbmr584422637.12.1785867370347;
        Tue, 04 Aug 2026 11:16:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm11267932eec.21.2026.08.04.11.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:16:09 -0700 (PDT)
Date: Tue, 4 Aug 2026 23:46:02 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make
 SDX75, Hawi and Maili MPSS fallback to SM8650
Message-ID: <20260804181602.g2tmskh64zuvl2st@hu-mojha-hyd.qualcomm.com>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
 <20260804-acoustic-military-coua-cb0caf@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-acoustic-military-coua-cb0caf@quoll>
X-Proofpoint-GUID: nGttdx6zH0es8MDRUrF4FBxbn_iJRybE
X-Proofpoint-ORIG-GUID: nGttdx6zH0es8MDRUrF4FBxbn_iJRybE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NyBTYWx0ZWRfX5QgYIlvuOos/
 rtdRtaau1BaWk66O+nfMmgYntgc2coD808hnjXeCP6lmEhpQYx+szEZGweElOlkkb0BFSlRXlBH
 +4n1JxaVJzu/6sLyMxVJ9uUGwYi9Z4A=
X-Authority-Analysis: v=2.4 cv=Lu6iDHdc c=1 sm=1 tr=0 ts=6a722c6b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RRksG6cbm_02s6OBxpQA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NyBTYWx0ZWRfX3cfvxw6CDdnk
 qnzymHlg4bFmQIun9EGkBiVlkmHmeegiuyWXuZ4oBursSSom54C8NqtQfG8HWL7kRKbeiZfaUQ9
 aU3jWygY1nwu215rTKACzaKdKKjvMAkOcmrLEBSZ9/ZlsyCSI/sZ9vWPxX/S6K5ochiyJGzhpTR
 c7H0hhxJSquE6N3naTqhicHHjD5fL0S/edWbpSq1BqVZBQY8QRcmcsjtiYukPg6+OScUVdL0QQB
 JYTo4QH3yfbyZp8ml80VEutdR5nZFggkLV2z1qVDugyMkiJ+NVwJfeQZDsYGpT0RmmnD6dobGUl
 8Ef8W6ASoLBI1JHV0ulYsnO3QuGmDWJkeYdB1KrwZ3GddvCPUfLokT/3sSQzOdNmBVVKx3dQCur
 msu8qQ0/f287DQxVm+UOAilGmi/QiXBJ3RwGcQX/J31DQ33WY4VJ3W7c1aoJDZwir+tdKG1FfSE
 jlTddnZtySfDBwejtiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040147

On Tue, Aug 04, 2026 at 10:41:19AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 03, 2026 at 11:30:20PM +0530, Mukesh Ojha wrote:
> > SDX75, Hawi and Maili MPSS are compatible with the SM8650 MPSS as
> > they share the same set of interrupts, memory regions and power domains.
> > Rather than describing them as standalone compatibles, model them as
> > fallbacks to qcom,sm8650-mpss-pas.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 29 +++++++++----------
> >  1 file changed, 14 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > index a062188861ff..f722c55aadf4 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > @@ -18,9 +18,6 @@ properties:
> >      oneOf:
> >        - enum:
> >            - qcom,eliza-cdsp-pas
> > -          - qcom,hawi-mpss-pas
> 
> There is no known user of this.
> 
> Why do we even document this?
> 
> This is unfortunately one more example why I should accept early
> bindings without users.

Yes, it was a miss and wanted to send revision of [1] after Yijie comments
I thought, I acked his comment somewhere later realized I acked his comment
internally.

[1]
https://lore.kernel.org/lkml/20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com/

-- 
-Mukesh Ojha
