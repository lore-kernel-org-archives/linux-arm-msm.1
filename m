Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB579544D45
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079650; cv=pass; b=rAQ5F0L9y+O2lW57K/a1Z8taJYrwSLcxY1uJmPakupgI/+JRndeQ6Zesq7ZzH+hkabT3UsXf3MkvBRONQ4dbanTvm+tw27XiS10yr0GsnvdUURmucnDW3u+PhULqTRxJEZAf0//8LHYEeeJ/eMhipKRGM1IK/pcP4pKEFdidcZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079650; c=relaxed/simple;
	bh=MSdsTB8asp6sbX+GEc7UhobdmE9wd/t8j57szPiLqh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ik2jXB/FZmgoVPWcfVkisBKWrOGXMHaT8x/Cm2QD7/p5ETlCVdN6ZvdHdnicaVdnbuUq9Bx04eGRi5w48j2kHhAmhnJxUx0JrokV8GJRTqwU5t00nPZecIdwl6deIkcraTrfBDFXu8/8ni3nVeQDajPlpnNvlEG/WBP07qhixF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8pVw0Hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVnWbDFi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8pVw0Hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVnWbDFi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPBaW985290
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=; b=Y8pVw0HyVHJ7coKM
	k3sofOBeQp8+A1tWooBMhmH6659wA72pxymQfJNeHY4P6/Pzn4Bg4JEL0P/1AGCk
	xZMHnhHBhci/6OggyqWoQnnVa0PH7qgKP3/Ln2VhSgjQv63mNOhoV6qeNerbOh9Z
	yqHd5foamo6LwbwkrcA80SxABzi31nLF91XWV+EFpMW6x15jsQj6rNy361pT9oAu
	6MIayiHAZDU/BKA4LDDjXHzsidYTIw+ZEWRNTSBG/h4I/hQHXkCYNI3X0jHuqOV5
	Uwz+t87gBXgPMBDV8tNOoF6TlY8fz3MavwroOVv70rVR1W3hm3q1fo42pYcx7vu3
	U/iRww==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4rg45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:20:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso5718519a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 05:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790079647; cv=none;
        d=google.com; s=arc-20260327;
        b=X6M3cY+mHTnn/RMTNhh3D7HcAkN4TQRe7u/Bj0sIyJYVSPsfQaOjMiWUvydR7waoTI
         jEqiijaJyrJu+k18j/jkliQXIT0nggE5FctKD+NAeSTWjQdIGJcF/zXHQ3p6jhLARYTa
         MhxY1tGDSc5YIbSh4Q6VMJHykcNVkAQB4uoyiBS6o6C5Ep3BVupF4fEIgi0oWNGCkT1R
         +ZWvUVV623JjmCi5FDRRb5CJ5uVDE0oxrsAUNJVrdBwCxfH9qcxBSLbuCOYZSk0HydKO
         /HNkJ/KYRN5NVbLB9JYNqJYVWiK5P02kxPhyfHcL7mMWWEPs4kl1YK+RdmK3Ac5dEqE8
         CDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=;
        fh=zBvFGEYl0HQceyiGxXgZmZ4tjIlBJE0/Eaob2HD4Mmg=;
        b=HJEm3EFJHmd9RCn2eXc5zPzO7Yu4Z+gkBuMOL+Tl9T8vswD/V7BulI+SdSA+S+3FYQ
         +lHuXXiW3AEmd+XyNEqgl7BogXGnLiiZjo7XntrlNM7KTgPWFsqUoiCVc7DsFKEqEehA
         QZ5B7rncbdB++PPJanjxbndbyCdgN220YbyQRsQS4YkS+h2V2BeUiJ4tPHC7/yRItpoY
         xoLZzbkHNI39eBgCUQYCPB9xe6IpmlDDOK8DNQ1XZ0r/Ria0D1mgy7aHJMRXJBrjapM0
         H+QHd3CL7BxOuz9s0PRBRWXYFBeHkwuLxMWt7aAHt4FB8WtdI/qU4IYR9J8YTtV3z8E8
         ZvCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790079647; x=1790684447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=;
        b=JVnWbDFiC8Sm4sXt14cHmFMJod3cF7+xJIkYEEzznWA9z+MMd1c1J+dO92fej1Cabj
         rqoAeZxvxTUs8//gGUSZm3G5Z6qZdr8xlhjmYe1WQNNA7bCPfJQoEKeavf5QI0bL+oZd
         DgC8XzTXxtacNwLC38JvJose6uMMN11Kp0R0biFw0d8F3eaiLUAfiBVWBaczPgBFkrwh
         6D0sUmUlQvxQilW+QvXFMqWv6KAiA+baGv7RIs240QlkUobVh2U7yJw6EsH1wuZV/c63
         77HiuMgJ0EYQhLl/YzoLc31PLrgN8sYUmrsUTYHmo2pMcEwzkbEVxqIFB59UdcVgQOgG
         BvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079647; x=1790684447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=;
        b=X85+TrRXmlWW+p2AZmZsHPWg+B5kCaO1AsHzuy+xeBmumRMtrI5qE9//lxmuTY1Fv/
         Aa3f6QuR34MH7FYNPFykL92Re30JL/YJyuUvWhcYz6TUD9dQV6EFT1aY+bRTM8U4TEuH
         2JiyQCHsFF9SpNql6Gq2Q352WW+rl7FatHg4SS2wksaAPs+SxdoSIpFcflDqtxN5ZpfW
         LiRTv/m5Q2rQGi/pAV83yerRll2BvK2gEx3vqyOgY/rxEilKI+ATLvZdN1tNlGYuAzyD
         oWv9B1KJgHfQ1cu4jJ50JmZZV7tjgfqI/VMDPpKFT3/XFCaNOubmn/1/yfxppdkoUFLy
         6egw==
X-Forwarded-Encrypted: i=1; AKwUvBzoLvPDIIAOPGShMwNsl7MSATZdActWUxTye3T5v0NAkuyH2ncNxDqrNAzzP3le6VSHNPUw3XXdYtpoyIg8@vger.kernel.org
X-Gm-Message-State: AFuF++llNF3q02Pq6aFKAl4VHS7TDq7sQhzT0UMKTxCBxMyyHfrBT66I
	kpmGjPNS6P3x2JPbKOev6+LL5Xwa0J1v0s1kZIViFJG756yiEmghgzShPngYa4pC4px6/5NQAPL
	ky5MD9P+LSB+S4X8fwnFQin5e/VFn9EQT3MTTgapddIYB8CS6Y2ByH/UrL9lM4+jydibuTrdWKg
	BjsY/vI+qVbHl1+J59FwKnMWtsJeIbHzodVp9kL7dTZIk=
X-Gm-Gg: AYBFou1F5jNGYjGwMG/lNESbYIwse5QhbsMS/HO6yOe65wyDIVBSjX/lotxpWg/8zcT
	j9jbsAnRa0w2YM99Qgjx58oxncxRBn1kcNkll4HVmattlX9D2AbksHthYLqfjqsQQFEccC3isXL
	eHPzx5x5OQo+vL/YNCoDLHX2fWRTE/IPIX1Lk/pBWJR08YCHSJ0oh9E4xc+Q==
X-Received: by 2002:a05:6a21:8287:b0:3dd:ddbd:c5a1 with SMTP id adf61e73a8af0-3ddec1bb561mr1447630637.0.1790079646791;
        Tue, 22 Sep 2026 05:20:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:8287:b0:3dd:ddbd:c5a1 with SMTP id
 adf61e73a8af0-3ddec1bb561mr1447597637.0.1790079646271; Tue, 22 Sep 2026
 05:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831090134.585588-1-zhangfei.gao@oss.qualcomm.com>
 <CAFkd8hth1ds5j9jbe3vjjpCYkbTVSeTiVsQvzy30YCyFUH83ZQ@mail.gmail.com> <21aff47e-07cf-48b5-9752-b1a9dc7e6095@kernel.org>
In-Reply-To: <21aff47e-07cf-48b5-9752-b1a9dc7e6095@kernel.org>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 20:20:35 +0800
X-Gm-Features: AcwNN1WMrRCQu0nVlsJVMe76UpuBh2J8SD-x-wYYcin-maJATBqrUQkOk85mQYM
Message-ID: <CAFkd8hsmBeDzWn1OwCgM0bmCmAP_B5iD7=9JqwzYnziwOWB=pQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: add nord cpu-bwmon compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, shengchao.guo@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3OSBTYWx0ZWRfX9IWhkAF1RrNn
 Co3y1U2trmFlMsLy2H33i66FVqX8wseG7wVEYKksIgLusxoHFQZ37X89ukRepat636DqqvDBifB
 AHFzDq12inK/e7iPH1BJi8/m+FX2OxP6RipnUKHeVVzO+rUsX3aWbZvb19XaMK+1zOHS772E7SC
 G5sO8Q5fE+9Tj2gVjvjfC/JvsfBALqB2BgTeX6VI9FCFeZzGTpzSka5kp5aLfNztYF/0g2LdRLJ
 4l5WsPYhSj6aUhJEiDgFv/KmwNpaAHw6WxK/IOufsU7dEHmg48ffoYNZdJs2RMVv0EzL31UBt4V
 x0WtivbtTXRMcEEhvPewSJZfGimjUA3vmt+pv86KiqE0lqWLPgajiYJppYoKPd8AERPp3FU6kR8
 Oyk7+lktyFINrqyGnJv6UgGx91XwWGLMyKSU2CVTULemaFSQSbIaR8AycKhbHrBnn0zUnxWIx4a
 2HM0zf7so/rkbFOhGEQ==
X-Proofpoint-GUID: Ib5KJwxpLgfEQ2xjQqx0e0K5HFw2dEgW
X-Proofpoint-ORIG-GUID: Ib5KJwxpLgfEQ2xjQqx0e0K5HFw2dEgW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3OSBTYWx0ZWRfX1J6dyfHKAqmF
 sXpTtJ+j6qLmkBbzMSgWb2JM8rp4hXlwuDLGt+VXrxka4M1GMhAOnPx4e3FYjz+j+KfP9RZia4P
 BEnVGZXqTL+NipcpH/2UTyHiHYyCQz0=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2729f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=D19gQVrFAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tDlUhY5aTNnqvAx6hSIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220179

On Tue, Sep 22, 2026 at 7:38=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 22/09/2026 13:21, Zhangfei Gao wrote:
> > On Mon, Aug 31, 2026 at 5:01=E2=80=AFPM Zhangfei Gao <zhangfei.gao@oss.=
qualcomm.com>
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
> >>  .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 =
+
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> index 21b4e04727de..8c82103fb86b 100644
> >> ---
> >> a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> +++
> >> b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
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
> > which depends on adding the qcom,nord-cpu-bwmon compatible in this patc=
h:
> >
>
> Based on acks here, this should go via qcom soc, so part of DTS patchset.
That's Great.

>
> > [1] https://lkml.org/lkml/2026/9/22/844
>
> Please avoid using lkml, but instead use lore.kernel.org.

Understand, next time will use this instead.
https://lore.kernel.org/linux-arm-msm/20260922080416.484280-1-shengchao.guo=
@oss.qualcomm.com/

Thanks
