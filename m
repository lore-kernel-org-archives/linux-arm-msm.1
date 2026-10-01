Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C957D35C1BD
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 01:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818327; cv=none; b=UFKH9Y7mnETIEWWDZokVGGWYiRCaxmXCYImmLYpIvdFxZxzrwRIUzdvnUdd6qeWB976Jc/7Kq6tsxicLzpWdqKU+p8Ca9JEeElgkPS2VVtjR5aN7oamCuIa2VHX7UEx6t8Puv3/tBrBS5kYg0KRyA1Jt2K1FJCPaeQTJZcsbbVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818327; c=relaxed/simple;
	bh=BO+8UQEHKoL/An2fpPxqp5J4YNJabOxW0PqqhaI3EaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/Dc22eeVdoeJFzkHAApkKj5LTcBBCXCLgAWetgipBFGa0zriszXxVE5syYJSUQIYPtG8tkDfrqXXrl9jejdSU0BwCYV8c61Zn/bCeDfSyyfI0ikkqDZQ2G3Lpcpbt38iw929xCU6ajp29aZf9KdPD9LrRzRiAwFd4hQFczwZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owdQbXbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cl9Ldj59; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owdQbXbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cl9Ldj59"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910k1t22012358
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 01:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5DJXNvk5Weolt4AKmsTjVt+UqV6Bq165jLKrQEAxU8=; b=owdQbXbIojqiN6Bd
	GqRk5nxGe4xu0O0WW0RTB6q7qQyjtMtpMp3tS7DbtCoTmDdzqr0tLJtd2L2tyuxm
	/jqvQYuY3NoIp1xM6eaMf2iJH/9+0z+K/oNxNHhdTy9Pfbka/W7R+s4RHaq6zQvY
	H6m0H8tGamYM+KcQKQS95KHz2VCPStw3md+0pmQyIBP/l1Sq6OobK13Oje8wZqi+
	M7ceAOcd4sRM4h75XDaG8wB+xbHUL53PBP4Rpj4U6l0BWaRWao8pUHFlzvPx+k41
	UluZOkVvhRSnCNzYLQAsbqr1NShvfg9IlJ9EGBsVICrBI/0d37JLuA3HlYwoquHs
	beVyaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh83vd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:32:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c58ee2116so1090601785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790818322; x=1791423122; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5DJXNvk5Weolt4AKmsTjVt+UqV6Bq165jLKrQEAxU8=;
        b=Cl9Ldj59TpjYGn+TctCdS2t3IJuUITPvHPSzbmV9pjNUjrfb3siZWZwEEQYUBYinEZ
         HdKmQ9WzS0WgmAIeUzxdXvuqxqnize9Q6mzkSI+LeNPFKn8tv3hQLF8aX1/dIImJqzqz
         mYsfawwlCud45ptuRiXXlVMDFznrV6ekOVmasyYhC9LMwcvQG3j1gqC45JUvMSuZiggd
         PIbdd+9f7vYAOhDeB7APIp8qOiiDCyeSoR6h6A711zl9SOhnAcYVx2gDLaMl7ExdOAbC
         bDnkZTfjCJ2WIzmhA3DbEHYdyN60n/mLVTyE11KHm+QOh8IEYX95v2MIW5vvCZSs6THa
         ZgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790818322; x=1791423122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z5DJXNvk5Weolt4AKmsTjVt+UqV6Bq165jLKrQEAxU8=;
        b=O1xsO5D7MiNWKghncUgYygxeTDgLnlQvktkpKrZChd9UaQZfjfQC+eqjnzfW6tGX8y
         IBnt4UXYIM/oU/e5metzZWlTR5E1zNVEZAveGiYuQIj9aZpQcMFj67ovyKIy18mFkOeu
         dR0OlDyYbG8davF6bN/XshXqy/NvtNrJSZPu8NmAx+RaOhCZtbpWgufTbUlvFMyjvbBO
         lwgBtNFIkGwBpkvmZSLTPRTpgKaIMidvukYK1ob1oBmtGa+k28efoWMil44MANXV9AQT
         OYgKshLUthusWsN6bMav3y3CkbH61WXg+3jnAd1xx3ldfZDivsGti47NzVT09sBHgjgC
         j2LQ==
X-Forwarded-Encrypted: i=1; AKwUvByVIZLE3w23GZj+zKhxQiYGdfGy2Ch6N4mUxd6BR428kk0QLYsNNpiFLY6hUDZeCUHspl8esrt2eT25xZdR@vger.kernel.org
X-Gm-Message-State: AFuF++kFZ+qgLeNqEbLl/isKPptbDt2tOLkCNWMbOPys1lvmQEp07vnB
	OEkxiizpJlm7Dzu5xWa4zjyCbR8iP3kD5XZXCapmRDshRxgxxpqQ6XHQCvqDiq+QBFuRZt0rnoF
	mMdW5YsyTPkxmC+QMkKgxyZaGTjLyyss3HmqrRyfvwhVwCTppdF54IMMyhjSZpYbWWbMJ
X-Gm-Gg: AYBFou1aCUI+LMSkeLW5DKXOtew7erXv7+ggYvYThZ5cHYCLpzsFMPU3pW9nuZGwrZg
	HqdN3lKlcElurj0rTstXkf3BP46fkuH1cWmC376emWtGKxV1eDtfV1Tl+1qGtbKQ6LRPRcjonsu
	we7Y2SR/cZtLUPEq/88S+clJuVLxV5lWDOj37iCVv1FHwPo0n3wyg9x/gn5jgneZVFIazTn8FDk
	TZZ6OaxgrZjnonO1B2CihUnm1mB6ASJwbGJNQV7q162tf14GPERhNejXG4GbfknYYQZL/f4I8gH
	q5dIBcpmhgYEAKCKP3ZYnJhnBqPT2UqGdvJLFSBI+Wl7r24loTbTatIae9pAoAgngRy7v4gAJST
	DvqKSn8WHxmoRD+gF6i6pk1j0M1SfZZuHfVXp91WZLnJUury91DWg3Vxjj3vZsJsclNlLElXM6V
	EPwLMDWmfhKWl+
X-Received: by 2002:a05:620a:4504:b0:93c:6b90:1d18 with SMTP id af79cd13be357-93ca97b9304mr576012785a.62.1790818321531;
        Wed, 30 Sep 2026 18:32:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:93c:6b90:1d18 with SMTP id af79cd13be357-93ca97b9304mr576009185a.62.1790818320992;
        Wed, 30 Sep 2026 18:32:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a779076c17sm8919831fa.41.2026.09.30.18.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:31:59 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:31:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 03/17] dt-bindings: display/msm: Document Nord MDSS
Message-ID: <pco56quuwsogsi52cq25e7dumiwigqth3aays4snvwjbntonwn@hjjy6tyqinly>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
 <aqtECDwHPiUUZqTB@QCOM-aGQu4IUr3Y>
 <7d2611bb-532f-4553-9d16-66c4b9c495c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d2611bb-532f-4553-9d16-66c4b9c495c9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNSBTYWx0ZWRfX/Xq7KsUUW3R6
 hoc7iSzCY5dfM1iWI5uhsPpcjsEt8UnmLNEFCqT0RK+tj202Fr/+KJ3dVrKgTcJ+ax7SVAfQ0AL
 tAFQnriJ1qQBCKztQekPZvebaPUzr5JOrhTSr+Uplo9faQPeLzNHWIhrYTXpJWYQPYpmaM+Pp66
 txDKVDtQT6m0ui8BKs96erypkuaxVkxK9ceH89EPDaP/b0hqmk7uVF2oOe9HnsJp7XODSmAXmTa
 5Ah7hjR5CLRyRrPA5LuYaYwM6xVJvT2k7BzQ3qoz36OVpEdB5Rb1D9sdm/O/7GlyciP6EOGWqLT
 yu5LUeQx9zVC/sWytcDdsddApYQjf/Hg4Bx4PZeT1Np4uMfJ4dgPhNmIW7VHE2VCPUC/3nZS51f
 6IOkfZnEIxh1BdbK4DF6UM/v8kKswaisNEFLJkVJ1wWMDvwR3Phsj+awS/CHZtDoVPWXSMeql4z
 2T7nDksnvW1tT3CPsBA==
X-Proofpoint-ORIG-GUID: _Zcx_1r_mO3idPLhUlcjDKTudptLUIq5
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abdb812 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=ybxY3fLTiW4QoAl5E9EA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: _Zcx_1r_mO3idPLhUlcjDKTudptLUIq5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNSBTYWx0ZWRfX5izEt2sH9MZq
 spCq2f3E4E2BFAeewwtAZOKwnJWyajHWsu9oZQynGZIU3f9wcAMuTkcKMnHETAD7RaN0OOaEl/U
 YpYu+oizHfErd1xVb4kKpxO/ksvvfpM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010005

On Thu, Sep 17, 2026 at 11:12:38AM +0530, Nabige Aala wrote:
> 
> On 9/17/2026 7:06 AM, Shawn Guo wrote:
> > On Fri, Sep 11, 2026 at 09:06:34PM +0530, Nabige Aala wrote:
> > > From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > 
> > > Add the binding for the display subsystem (MDSS) found on the Qualcomm
> > > Nord SoC. Nord is MDSS 12.1, DP-only (no DSI), with two independent DP
> > > controllers.
> > > 
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/msm/qcom,nord-mdss.yaml       | 98 ++++++++++++++++++++++
> > >   1 file changed, 98 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> > > new file mode 100644
> > > index 000000000000..0b0cacdca9db
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> > > @@ -0,0 +1,98 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/msm/qcom,nord-mdss.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Nord display subsystem (MDSS)
> > > +
> > > +maintainers:
> > > +  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > +
> > > +description:
> > > +  Nord display subsystem consists of MDSS (display controller), DPU 1499A
> > > +  (display processing unit), and display interface controllers (DP only, no DSI).
> > > +  This is MDSS 12.1, DP-only, with 2 independent DP controllers.
> > > +
> > > +$ref: /schemas/display/msm/mdss-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,nord-mdss
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Display AHB
> > > +      - description: Display hf AXI
> > > +      - description: Display core
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: iface
> > > +      - const: bus
> > > +      - const: core
> > > +
> > > +  iommus:
> > > +    maxItems: 1
> > The DTS in downstream repository doesn't seem to agree. There is two
> > items for iommus.
> 
> I checked the Nord IPCAT. the resulted SID is same for both the SID (i.e. 
> 0x03e0) in downstream repository.
> 
> I think we should update the downstream DT and use a single SID entry.
> 
> > > +
> > > +  interconnects:
> > > +    items:
> > > +      - description: Interconnect path from mdp0 port to the data bus
> > > +      - description: Interconnect path from CPU to the reg bus
> > > +
> > > +  interconnect-names:
> > > +    items:
> > > +      - const: mdp0-mem
> > > +      - const: cpu-cfg
> > > +
> > > +patternProperties:
> > > +  "^display-controller@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +    properties:
> > > +      compatible:
> > > +        const: qcom,nord-dpu
> > > +
> > > +  "^displayport-controller@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +    properties:
> > > +      compatible:
> > > +        const: qcom,nord-dp
> > > +
> > > +  "^phy@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +    properties:
> > > +      compatible:
> > > +        const: qcom,nord-dp-phy
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/qcom,dispcc-nord.h>
> > Please run dt_binding_check against mainline kernel where the header is
> > actually qcom,nord-dispcc.h.
> 
> Ack, I will update according to mainline kernel.

Just drop the header from the bindings and use ephemeral clocks and
resets.


-- 
With best wishes
Dmitry
