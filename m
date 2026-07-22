Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41564C6EFA
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715515; cv=none; b=D44NOj9a54uls8AkkXk/oafdve+e/f77yRvVkV3JqPMRNsgzMRRj8PCPSVtRIgAb7VbpOT3lR575TrJqxkXTmWJuN/1whZuvVgNM+8xMPGZ9ry5IAgM71iu3Pa0+1V3SnfaFsyEVYLt/eYenkYXRfim7bkquDoemYvdJBt1S0Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715515; c=relaxed/simple;
	bh=2OpnObbZ+yYS4acBPLR9goYNnnsvxntZ5oAVlEqq9Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ+X8US2dMPeK1+SP43ZRAd+Ve7fql2zY2wsTMpqdpyHIuQTo75NwyuEHgu5zwXfVsC+7oUPEKXhA1YDPk9sJgqA0/oXjYg/wv5ORcIbZDxvJ1UWakZRE4PMVjyFgvBRSz9p1sxMQ6Th4N1MVetJvWWcFQG3HOIp8kMAQ//5+lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6NGWOAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTdem7uR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6NGWOAs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTdem7uR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xLR7412301
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ICPnKmyXidtgXgnGiWiEmFW6
	8sC3uYWpUKk2gDorxzc=; b=p6NGWOAs/cjxZIYTgcy9YErLZaZvIjVYnsAavuUr
	q28lrRdgUKG8dj9DMrqFFzlhPWxdnaznIUlpFELBZT8QlNEZGBUbhOPVpRWARMa1
	mAQDQq0bke0h7h31GbJtLq1OM42tU8ovJpa2M8iZUjHLonu4Tgfmq1mClcf7S12o
	ZUi7aAE3Sz6uXGa+Qa0P3SMfgBI2z8dkDaQ1U8cYVwDJDVdS1Oue8EZt1C5HiFRo
	4FIq7+7FIcbwQR398cx1AnRssbiI1qBPR0Ds24aEnW13gClAtYI81Cm90Uf4xdrk
	Rn7CVXG3wwtpxaDKxQvTucTh8btRmKN/nVqbufL94RejTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdhbkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:18:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so241361741cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784715512; x=1785320312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ICPnKmyXidtgXgnGiWiEmFW68sC3uYWpUKk2gDorxzc=;
        b=JTdem7uR53JwYTKsoKxij3JkdcoM31sINpl8ZsmjpUxViHYqgjcf2nb24Ii4aS2cZn
         g8yF6QRuYcplM0MOMSNxlSl5UIAbhKx6cxXMToVAMwZN78O7G/1h+TLMlQdYARVz3+K2
         8y9j9xgXBNQXzC2kX7mxH8oVkIfa0BuB5GXWdq62LuP+FpcnTTKd2NvZJccWPgY4Umhq
         ePM4yt35gS+KeR/633YIRbXJ3rXmBYseFlZWZKYWurYOc5BKbk/EqQAX8tbrhWt8iuci
         mdDLIQjOg+QzLXfAvNkJKAYFAIcmvBqWDE6thfwEN7Erlc7nsSpLb15Bove/+xViE5cF
         eSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715512; x=1785320312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ICPnKmyXidtgXgnGiWiEmFW68sC3uYWpUKk2gDorxzc=;
        b=nyG0XF7jPWu3MoA2xdqbW/wgSjJxq9ypz8pxmQBeQ30ce5cROp0LZSY2uRhGjrw6Gs
         skVSeogYggqYaMF6fHmVrpculdiu6YMjOsgJPini2EJPYViPK5MbJYj2MxK4VZ17BWe6
         In4JDwlzk1qP3j/59J5QY2Axe/Ee4tLVEexDrXxqb5wHqVJeC7ml4cXYQzOOI1Gl2BHc
         8Xc+yQJsWjToPzmWvEiv2Rtbmtqra+eRfUOH9Tr3M76HKpD5PmFVzwUJvxrE2E+icMRC
         /MxPQCggStm6ve/jWv2Mv4Vl72eSFglUbi1Ykj5Xxmcjj/uCZPtUEoLQROdJ4qCIYM0z
         /OOw==
X-Forwarded-Encrypted: i=1; AHgh+RpKAavdRuA3cDMNPOAcUNQpRd5b83mLPtW3WilkO3Gcqn+OLJHw7duzhvg7EhPWJEb1j0tdRim5+jKIiVUF@vger.kernel.org
X-Gm-Message-State: AOJu0YxY8zDgiNGM/Shdcb+gY0XWs+9N1hsJyOl8D3j0p0VBhQrodCrQ
	v42up/UH9i3AMsrl3n7iaGxPWDo7sa2NvHTz+CqMbDQRp8s7JfjbZ5HthSOhH/FN6QlNUnPQUlG
	hFfDvrwElZYUVVcrRx3ep+gUghKEDLjtol0TEAN3k0XdaUthBbNCfD0uS35Otl5Gnv9cdJwezm7
	pp
X-Gm-Gg: AR+sD13QEsAbjCwEr1HPKSIKfumrS4Xhns8ioQGxHhgp0Kbh4rxRanRIPyibhXCAz4r
	GZuSAPJs4aa7eF8gizd59q3oR4at6Iet0dksqzV6VQ+BwlY1cee8v7bL0+qa8RCxBWZ5ycySQ49
	4kC4C6BfRpJd6lqKvu4yn2NTasPW1qLJZ4iVFu/CThyNBus6VE9oOwBIyErsXezwYqrHyvmDQHq
	Kx5O5kMv7KltUtBnLSOgReSUAAMXnBUXlIgDloRQessGdS0VBVK/1NmB1TK8GjixKO1FfhWBu1Y
	TNO0ZjV2Jhm7mcMnuYtxNNQ3/aGurs+xtI4t+lN2NaXUrR8h+2mSHlw6QE4SwpJHrCPDiYIhYSk
	8cMbJV9Ct7of0JBo=
X-Received: by 2002:a05:622a:c85:b0:519:e020:6087 with SMTP id d75a77b69052e-5213c013438mr216631141cf.11.1784715511548;
        Wed, 22 Jul 2026 03:18:31 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:519:e020:6087 with SMTP id d75a77b69052e-5213c013438mr216630771cf.11.1784715510905;
        Wed, 22 Jul 2026 03:18:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c66cebsm4541447f8f.30.2026.07.22.03.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:17:50 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:17:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Eliza CDSP compatible
Message-ID: <gm4ebdzddpk5mbmz2zxxfefzq66gvjlmyn2vuqamzqelu6hvrc@7qu3cxieth43>
References: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
 <20260721-remoteproc-eliza-cdsp-v3-1-557b5d02fdd9@oss.qualcomm.com>
 <20260722-tunneling-perch-of-completion-779399@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-tunneling-perch-of-completion-779399@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5OSBTYWx0ZWRfX82KXackygtI3
 HZAzR+9vEk/T8gjPaafRApxKQuepBLVDheSLOwjNrd9d1LQt44+OIBgM4VrHhK0VcMAHicumB5n
 Sa6lczYsB/gJleNbi9UOQFrRYuy6dhP5of3aEmJuWDRKkF+UQVqj9nFNV7DkC8VODVunOtdy06z
 wIJnICy2aKIJRMALoESl/5/Cu4sFKj5NbIXyFfsPQvwTXi1eQZoY5FTE1jxmWm5ysH0v4l3LaZI
 YBQgl6Kf+/RsJTbXWM0VUeHp1CDkb/LzYLCMrmVsg77xNiXc6cb7+0NN149o0pU9xgQRtLylgqw
 MuVemHNtVUmMAzhaVLqewD58iQODjXppybuUf4h8/0NFMFr92f35w9i6Vm4/JTKK6LCNV/eGr+Y
 S7xmZlzmXAw3jK800xe0RVbb8FVXUhuqOzfffg4nPW3J/FtMWw5pJ7XrYkfBJ9QC/hfRlS0AoTB
 Qa2GMZAE/kuB/85iHCA==
X-Proofpoint-GUID: IA-uOdKJJ5GML18CaH3aVuWpZG3eX66X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5OSBTYWx0ZWRfXzQsv3MQCbSqa
 arvhY4UbK3I3IBx/qUfmQUn1moPxo2pEAIyux7EQQikG3q/9U1/NR1Kmkl0jTMMlTCOJVuWo3Fq
 8KUm12HI03MNtADjLQe/e1PMCKZnuoM=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a6098f8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=foOWgHpZz-4kEb_SVvIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: IA-uOdKJJ5GML18CaH3aVuWpZG3eX66X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220099

On 26-07-22 10:01:18, Krzysztof Kozlowski wrote:
> On Tue, Jul 21, 2026 at 05:19:57PM +0300, Abel Vesa wrote:
> > Document compatible string for the CDSP Peripheral Authentication Service
> > on the Eliza SoC. It is not compatible with any other.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  .../bindings/remoteproc/qcom,sm8550-pas.yaml        | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > index 019db91be7fd..5492a88bb100 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > @@ -17,6 +17,7 @@ properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - qcom,eliza-cdsp-pas
> >            - qcom,sdx75-mpss-pas
> >            - qcom,sm8550-adsp-pas
> >            - qcom,sm8550-cdsp-pas
> > @@ -173,6 +174,7 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - qcom,eliza-cdsp-pas
> >                - qcom,sm8750-cdsp-pas
> >      then:
> >        properties:
> > @@ -288,6 +290,25 @@ allOf:
> >              - const: mxc
> >              - const: nsp
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,eliza-cdsp-pas
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          items:
> > +            - description: CX power domain
> > +            - description: MX power domain
> > +            - description: NSP power domain
> > +        power-domain-names:
> > +          items:
> > +            - const: cx
> > +            - const: mx
> 
> We need to stop using here provider names. This is the same as mxc of
> other generations like SM8650, because it is for this core a VDD_M or
> VDD_M_2 power domain.
> 
> Using provider names causes unnecessary bindings bloat and possibly fake
> driver differences.

I agree.

> 
> Well, not a problem of this patch.

Will try to send a separate fix.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for reviewing!
