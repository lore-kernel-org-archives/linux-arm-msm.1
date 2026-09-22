Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9669E52E07F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079475; cv=none; b=F2MPcdqFpw6AxO3P9vuMHjeIGhBdkNZBwPfrMErLLnChvdaStq9t43Y/nSsVxOT9QemNIf4oFXMV1D58f7aHa8SGPnhvsVAkhvozGesYv9rSbAGVnKE9sQA5J6oTP6X5IkWdu+TFyWSpud7OO9F3SW1aVhG6TVkQM/1ch5EC3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079475; c=relaxed/simple;
	bh=Z8vK1PMOHpIAza5Cd6gxs7LpTHqfr/WP2xIKptv00YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pea/ADGq8Qz1psAF07N9gl8G8yGwvp/50+kROSvaRnZnIK+nMhWyQL4pvdRVXc9E1WyA4S2tt3lRBDvUvwOBt1A8dOfwMEo4zNPEkEURZGLtKNSxbzwqnQz6j/uJD3QfpYCox6SHxYcg2dtgTFJCD5e8wiqtGtvfLFo5aJXgUwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1N5OLOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmY0oOqF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1N5OLOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmY0oOqF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPXCM3487078
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAnUkmHLKR+BK/jRH+E29tTv6Y1MKqKnDV7lmxWpVx8=; b=F1N5OLODQ7a6MzPQ
	w8FA6pfTc8OtFkobuzc0lUkSRDbRWSrallSYFHLCQnFWQJAYYpbFjVJsgqmHs2KB
	p0g5u9dgOlkp9Z6A/jphYI/s7bVrrnf379ghYqK0lOBaUppFadnIOlxMNhlaKt8u
	LylTyXyJBgIFHRMyhKVyBD8bElwWLftDLMIDRXCjAahB48k7Rg7aCmeBCxDwWExK
	+rff+1Vmy24zq1JI36DeXlUWI/yOQCI+l8MVVQZ2xN4feTCZjiAsM2AMktWPQpqS
	MuCyiNjpLN/+4pLJYzcA0qVby7ioWfAzkfal1kTG4VKRb+TF7ieL6HEcaYGLTtDD
	ZwQ2pA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0js57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:17:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86b70a52946so6462311b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790079473; x=1790684273; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAnUkmHLKR+BK/jRH+E29tTv6Y1MKqKnDV7lmxWpVx8=;
        b=cmY0oOqFMLCmSwS5lljktyVbPTmH0SaZoUpe/pL9RE534uQvlSF1HB/ZB9yJ4QPk7f
         T/fOPQ9l3lx+/yamhaE6bn72MrFYBV7hhASsAOGQMjwQNMzdk4dFquGNIByMBR4gU51b
         IiHGlTwi15XczWKSc2u1ncEekyDvzkqPIETP/DvFOznBNxWwHf+1A5utK4tRgN1O23Wa
         2jdvpGgW4BLhQ6Dh2iNFSJouma6DDobtgfH39ICQ7IjgFaXggk03SIRYTf6dsfc6Qwbo
         kHV7/ELVue2Fv95IVZ/RYphXwWl4yztWeYwrX6HKESjdR6ZsRTnrKlJkuN0nQEI4guEF
         pwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079473; x=1790684273;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NAnUkmHLKR+BK/jRH+E29tTv6Y1MKqKnDV7lmxWpVx8=;
        b=kmkqCCkH4sPBVTV/2SwrAfSX6wI1CPdD26vqt3fH+Go6BMasdfmxgS9azVpxC8N+KO
         dY31idyIvbXUnTTu8DgRng74bm0Rd15vdEXCHFNJT2PyIfWJQUWZCbckQn76Zt2v75Fl
         B4f7IbieWAbyiz/7Cw+HDLMN8MmKUtd7Yk8WvdBKRDopajFAeTNsZd1LwK7TRhU54dhu
         YH98H8dSA0RA58dwcKzruAzZDLKYb+OUJNVtMLwxYxZI5gKaQ2xoZ6/nDgzQe/7Sgtat
         TbkS9h4UoJBodpFnk0YOXXFpZwAQwFfxOfzbGS4GniIaPmV950zZGo3tZZK1YjbSgXky
         e5pA==
X-Forwarded-Encrypted: i=1; AKwUvBzdXldtdXlGlwcRrJ1cQ7PF1MDZENgdaMj69AmAjH9AZISiocb8fZmvLWaHpSowo/Q1OlYJpDHE4DM2aUo/@vger.kernel.org
X-Gm-Message-State: AFuF++n3zM/NzYhvW3r4DjFLB2M8l30AY848xHBcbGDo+DkgzYVXh2z6
	/2oUtzg87c2cOMY5uLnEMH+QCkAB9oZra8sn36l3liU5Q5kuwWiV6lYh7wKA6BVJqMIQDpfYz/Q
	rRNZ16z9Pys0zIicq0yUNZk7rue/46SpW+/+fF49SWU4XhkUT07qnXDz9AKzu7Fs8XRrO
X-Gm-Gg: AYBFou17DlBMvOboWOsQ6J1Ds7Rii4RMxhPz9tdDq3SBuzF0RmMaB6q1KrnKfQn7ZzE
	zViT/BLRvpWhUc9Ov6TTZV8C4mlE9OtXv/KTr1l3j6mpao3N69bT7p5T5bJoO1DDEKKVXwmTKHq
	vV3HqKB+EwkiYqY5w9p/ZDEVIcc5bkh1QfLKmSubwQR6ve48g8cYt4rot7rSqIRfYHqfogh1GSH
	ShOcyPeu+XBzKHk+UDgymHfBRu/UTbuY9T4OpPAyuEoSmvsCDNrzFEFSbB31h2sG210Mug5+yMw
	bRbpe12FWn/iL5N6+o9XYdjJjugQ2Q3cs3BRZgh10RH2XTQvl4f5kiUvYMR83jl+BUTJSyuNdTk
	s01fKrWJELt7BFaKX3T4w3BtJpelLixXvSUFW01P1yQ==
X-Received: by 2002:a05:6a21:3a94:b0:3dd:a006:7b37 with SMTP id adf61e73a8af0-3ddec8023b5mr1308448637.54.1790079473128;
        Tue, 22 Sep 2026 05:17:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a94:b0:3dd:a006:7b37 with SMTP id adf61e73a8af0-3ddec8023b5mr1308406637.54.1790079472530;
        Tue, 22 Sep 2026 05:17:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6127001dsm5963161eec.5.2026.09.22.05.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:17:52 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:17:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        bartosz.golaszewski@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: add nord
 cpu-bwmon compatible
Message-ID: <arJx6nAvt-gtDd6V@QCOM-aGQu4IUr3Y>
References: <20260831090134.585588-1-zhangfei.gao@oss.qualcomm.com>
 <CAFkd8hth1ds5j9jbe3vjjpCYkbTVSeTiVsQvzy30YCyFUH83ZQ@mail.gmail.com>
 <21aff47e-07cf-48b5-9752-b1a9dc7e6095@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21aff47e-07cf-48b5-9752-b1a9dc7e6095@kernel.org>
X-Proofpoint-ORIG-GUID: MagHGSnkZb02Rt9w-kr-C7q6TnT-VO30
X-Proofpoint-GUID: MagHGSnkZb02Rt9w-kr-C7q6TnT-VO30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NyBTYWx0ZWRfX2PC44NDVZYn6
 hTOQ/ZQCNZDroCeLfZkESNyHXSDkYIJ0Ay01b5/g7x3yoSdc+/mDJZ4m5JSxA58zDKzUTH5+W5W
 Zs620PtqiQK4WnYSiSXjgCfSOKABp//BL+lvolsGJVYU4s1pAzCK9StE8Fcmcs7gr1J7dxIX58k
 GhAWPdG9KN4BDp9mJsp1tDF2Ouxe4bAqniScUmgYozAOCs9SrpYsKfFPey8xxytmk55xVpD70jV
 wnVY45cl4Zv47uRqj+N6bq5vRNgyjWSe9KUxeUiCXR6aDCMa+lqeKtSQGv1nKQx8CMtJfRnIttY
 TdMKuE53Nn8nC0kZfVmxrx/M+KWblkF4O3PoPZ9Zv/5ayt/WvUgY/2+ZxVRHkXOr7qcnZkYGtV0
 rG9ic/RnpB3OrwEdaT7yPPPdGVBmpzyx06xt2xw6dfJrFB1rzcp/YXR7fjc1XZX+yEEUaoRFts/
 5jJASVhjKqGlnL17S8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NyBTYWx0ZWRfX4fkrtOQNiyWp
 HnpAyH4hwm4/EkuBck+RpYe5yfw7cFUsBeOpZEmJsdR+hy5KShr7hwVAY6IsJm5YIQlegMjDx12
 O6oVsi1vIfGHEL9wGl7+wbQbB9B7oag=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab271f1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tDlUhY5aTNnqvAx6hSIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220177

On Tue, Sep 22, 2026 at 01:38:35PM +0200, Krzysztof Kozlowski wrote:
> On 22/09/2026 13:21, Zhangfei Gao wrote:
> > On Mon, Aug 31, 2026 at 5:01 PM Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > wrote:
> > 
> >> Document the qcom,nord-cpu-bwmon fallback compatible used by the
> >> CPU bandwidth monitors on Nord.
> >>
> >> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> >> ---
> >>
> >> This compatible will be consumed by the Nord bwmon device tree nodes,
> >> sent separately by Shawn Guo.
> >>
> >>  .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> index 21b4e04727de..8c82103fb86b 100644
> >> ---
> >> a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> +++
> >> b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> @@ -30,6 +30,7 @@ properties:
> >>                - qcom,hawi-cpu-bwmon
> >>                - qcom,kaanapali-cpu-bwmon
> >>                - qcom,maili-cpu-bwmon
> >> +              - qcom,nord-cpu-bwmon
> >>                - qcom,qcm2290-cpu-bwmon
> >>                - qcom,qcs615-cpu-bwmon
> >>                - qcom,qcs8300-cpu-bwmon
> >>
> > 
> > Hi,
> > 
> > Gentle ping on this patch.
> > 
> > Shawn has posted the corresponding Nord DTS change [1],
> > which depends on adding the qcom,nord-cpu-bwmon compatible in this patch:
> > 
> 
> Based on acks here, this should go via qcom soc, so part of DTS patchset.

Ah, OK! I will resend the binding and DTS as one series. Thanks for the
hint, Krzysztof!

Shawn
