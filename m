Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5D3434992
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978610; cv=pass; b=RWF9tgd/l+r92xHW4Y2Sgn9SqRfUDXO6hl8cRHZ2PDrtoUaMZ712BQc6OKFeOrbbcieuA792kNDKwc+x32nVGej0o6CsHy3ygrTkp1v4Mfxro4NJx1YgaBdGKuOLbJKLguac+s4/KCfqBkScra/NwM/62RQTaGWXdswA993zN1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978610; c=relaxed/simple;
	bh=q3EkqwdcLdgFV2VFGPbC3LNBtZOmLyf+gqDHedG+WLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aySVxUB4SLk3UtBTTbIoMjzuY/9Ttuz/2/hq8eecL/SFPDBgg6tpar8C/81Ua7ydr4VEwcYUlLncyu3MvYTRO53xrXkJSG8aaKmtVOEYxILfUwDnYCanHPuFfuqYSO/tCeKdcCxgW90GCOp68NQe3lw0I6QRiqDWU0UL+/3zrSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kESnledQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4pxSYk4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kESnledQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4pxSYk4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L84SaU4135073
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vx8dnU+n6phV57GfzrrgfQ2D/ZRjFORy9xJ5hSXAhSg=; b=kESnledQd8++Pdet
	j62TRILMBoyIcvS7lWMhOXOc3NIB5u3ny0DJZovb/7Y3qWU/fkIHUM4ZDyae/7qW
	7Cgt8daE9hvwrMtDaxVmqV53Dj9ibjoIUeT5DQTKhtL360PUfTl0tutd7I9wV0pJ
	mFYjzMXMdzYTimqKu26QbhtYRwb3exVRHvJrSF5x1HlIesDkuovAb/wVoXG+p37w
	6FAJJAgUDemBP/niM4BSmVfHUHaixVYDxDF8tiafzP62HH4V+pG5j0qQ5WxEYScm
	GGSHMx4FZLlmCP8kGDRodpzKQymMKpxHl0ZNO3hfA/FQPm75e9G0c1AIXyOvg7vV
	bYM4+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj01q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:16:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso191350485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 01:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789978607; cv=none;
        d=google.com; s=arc-20260327;
        b=bxh6yEVoF224CYJRx49xLmPdY2f/6O9RGhyBrCQL8MSFaZ+reHhqfi5WTthFfOpddZ
         SKcGTS8NFP7+J0rhxUYpz/YlwLNAjaoILSrcPYm0tkJyKT0NLQk9n3+hmiV9ljPU7rvP
         WsvICV0pT296x/BLGls6NjJTAAjatsn3PpCoaiZE4IUcuG3ICZGDrYODT+YlAHbf/Xu4
         vGxbw3PMfupKTyc3vOB/F7xR6dI2gynOzg1ErcgnGGbKGrrpUyA+MKADPVhYpXpxAzux
         tgCmausgcUrohIBs5l118jbnbw2WXkWhDaus5Q3L1um9+o7vRjsM7AtfKs1vZF3AgSY2
         BQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vx8dnU+n6phV57GfzrrgfQ2D/ZRjFORy9xJ5hSXAhSg=;
        fh=QSq/OE4b0iqg12vXlZVbhw9CETNk1QNnN+r0iOmRH/4=;
        b=rcpecfLrOpsHYw1EeUn8dmjsgUfS18foLxi5I4EZ+65lYfuAFr781bdnSWHCJx0zRu
         SZOk7uqJfKk93mO71PWMUM+IukDEQp0OD5W7xjz7y4lYwiBpIPBmgiceenPkHSR5InCg
         3D8PvOENqgv8sionDQVHZ+Btxm4OINP3pfbF7pWgh70LcaSpGbTKOEzeGUvUvRPc0vVg
         SiAvxEAynFDhMhkuJLMZilZ7qj2JE701S3OLCUi0zeR0S3ndej9BLq4jYG+z8u4HsMNY
         yMaXNOUyBGwsxy1wH32gh5TgMCNQHmYeuRe0D5ck6Npl6ssVILWVF/s3bvAYWg5q7Tsu
         e5zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978607; x=1790583407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vx8dnU+n6phV57GfzrrgfQ2D/ZRjFORy9xJ5hSXAhSg=;
        b=Q4pxSYk4mzOJtcchWS+0LzAiXerBnzDJRcDq8gCvQnz4vXhL+RmLh6T+ju+Ocljjla
         UyOjdycpqbYJnlek6dTTnGFmWBfHk51EIp7ETV/u9oM/IIgBPc/zq/wZdrlNhKJMWWXm
         Ib/u/sMwkulJbO6/hXs8eTA98d5a2Z19k7tPkXnphOB/r9UGN7PrRmONUuaRUgV4T/eR
         BjRQnRmRAG78cJcmGImr0qnVHReAwjlcXepVt3Vr3wu1J9TLnMlfooegI/ngrY+nyg17
         ae82mEcCf74fg15Lts2EPj7h4cIipGUhDlqa4KOUZOdEDFFhBkllytpIDozFnJgL8n8O
         r0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978607; x=1790583407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vx8dnU+n6phV57GfzrrgfQ2D/ZRjFORy9xJ5hSXAhSg=;
        b=S8yrSi7Q/52dMobrPFJDykLSv4gZjARSOO9F+fDM9mrmvJzeJdwgsCheflMJLcEHwj
         mVRZYeoG+B+kSqjDLEwVhM4sEr5g+FNVTQG9mQr1fT+ANgHkYivAeqhKqOM9NImfMu2R
         LwVbJjwEu4+LM2UqGhW1gU/4gxZjYSJeRi8+ll5oxkcRYebHjqfNE9iuew4qztkT5DqD
         c5uzf/9E1yJi+2AViu2/JMQI16ax2ueYsRsPjwWybVbZgJMB414GLkKvs6VCmrAWIiZL
         nYWmwVtE+lysx2T6Nyu3gBwK0POe3bz5JzdGhOTNpmesOVJn3MK8zLsLeldOtYIjp964
         5DMg==
X-Forwarded-Encrypted: i=1; AKwUvBzJmfwQG0oPzc+j8ID848iPkgTEfUF1wr3PDI6xBFKoPFzvN4JFHp0C3P3gPQBsFEJr9txuU0RcetAVDacL@vger.kernel.org
X-Gm-Message-State: AFuF++mJf+hRUK6N/B6c0G2a7y/eOpV/Jykgb3EBH9bMZr0b4RnG9JyO
	H6syVEKJpOkESjiEbNVaN+eBUyZJR82v/XPUGfsobwOM86SPOJgdKxX/PWAbW9vGM8lovDHGPBK
	0vQhZCOvsT9JeDOwm3NxPOLe0oCgl+AZZYSYHH4vdYHwew89aBFWvMmcPS8/ovuTr/iGE+OfpaQ
	tc4s/OseM6jyAPISSpV8Y3uHnwQ/+s3JGFECn1chGoN8Y=
X-Gm-Gg: AYBFou2SsbDxw1DxMU5FUUJYx2TtUbQQ6znKBkZtmzXpZXEa9fK4PnoyL4TJ782UR1w
	vDJ60m4oAg8AMP3sSlDyAVoj7rIaKTPg5fNc5gNWslGWdJVnDlaBBkPzoBMjjV3abb55nE/LCdC
	YKD0+zOYvVbk2cK2doLVt/QQyWvsyuqDR2856sVBTeYgkJfN9eWh41ZFAnkpZpYqR3dq3Mkut/T
	6RzADzntir9at2e+OFimrJjo3yhd529KiUvgfcP7wcb4TwrvDpv9ezgsKBfXXEi9HFJ0IMI7ovW
X-Received: by 2002:a05:620a:2809:b0:92e:bd39:9993 with SMTP id af79cd13be357-93bf55af058mr895548785a.31.1789978606929;
        Mon, 21 Sep 2026 01:16:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:92e:bd39:9993 with SMTP id
 af79cd13be357-93bf55af058mr895545385a.31.1789978606550; Mon, 21 Sep 2026
 01:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
 <20260920-qcom-bam-dmux-vmid-ext-v2-1-ef5ca2178378@oss.qualcomm.com> <20260920-humongous-raven-of-charisma-bb99ed@quoll>
In-Reply-To: <20260920-humongous-raven-of-charisma-bb99ed@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:16:35 +0200
X-Gm-Features: AcwNN1VVhQqlVhKk-jGl48O2Ddr1iFZHmIKcpsImvO5gypb5NVk-JoOt1_b9g5M
Message-ID: <CAFEp6-0juFLDxo6kCTf_RrHv0EAevVqB3DP47=fg6PBNSCDcbA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExOCBTYWx0ZWRfX8VbQtOaQghrW
 0RZ2iQC9CKCprdnuM7wuJ8WlQLM3Sa3rUDuXlP1zkkIYFf3ff5pLmImJVnfwP7v4anKOXFj0ngH
 W5u47JTDpQ1g0Gk6oYuE0/ZaAtlYyKY=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab0e7ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=p3HfQXL-393XT7cpVekA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: tHh7hQGKIsvbFyDQDrgEuyrVCGTNiBh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExOCBTYWx0ZWRfX64anp2mGjObb
 HJGN7tNe9J0T9vIt6zP6Wyi4qEhWpGuzKf+7jfNWzufOdLN86a/v/YdiHTmo2ku+3HI8RYB/1Lm
 fSdnx6Ld2S5tOZIwkWkiXTBPntzO2CpEo2Abxua/qiripf3TcC3SZlYZvsSEhGkGjc3tCGooVfH
 wmYe2EARGbuKryznq8j4QVAMqnO1f0KkIPc7xJ/+yWk0Y+DTlMptDBcB3rx69IxjOIwwaT/OPml
 ZMGzgcn9ACO0cAwAAdtctJbPhDw0s5VOkR68c3lQs+k+6Ofiar2hKwOrlr2X0wKDiIZWBFUbDFv
 dk1Rw2DV3r8WDUcQXTr0XAU2Yu00uNqG9kH1pLEmT2YX37E+HjYOiuMwiZUntcXj2H4axwbkzFA
 shf16lJ/TYknpHzaAU6iNTwIoobdnQbcaNp5zkrsyxGR5f6O7vt6WM+9ou+aY3dsvGsnwuSAlPJ
 4cOvA8ELDcRD14sXETg==
X-Proofpoint-ORIG-GUID: tHh7hQGKIsvbFyDQDrgEuyrVCGTNiBh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210118

Hi Krzysztof,

On Sun, Sep 20, 2026 at 12:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sun, Sep 20, 2026 at 08:32:29AM +0530, Vishnu Santhosh wrote:
> > Some Qualcomm SoCs, such as Shikra, run the modem in a separate securit=
y
> > domain with restricted access to system memory. BAM-DMUX DMA mappings
>
> Then this is specific to Shikra and should come with its compatible plus
> constraints per variant.
>
> > must therefore be constrained to a designated region that can be shared
> > with the modem.
> >
> > Add an optional memory-region property to reference a restricted DMA
> > pool used for BAM-DMUX mappings, and a qcom,vmid property to identify t=
he
> > remote execution environment that is granted access to the pool through
> > SCM.
> >
> > Require memory-region whenever qcom,vmid is specified.
> >
> > Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 38 ++++++++++++++=
++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b=
/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> > index 33746c238513d72366bc52359fb10f275475b331..5351269b0ab72ede808ae47=
b55d57580af209038 100644
> > --- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> > +++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> > @@ -72,6 +72,24 @@ properties:
> >        - const: tx
> >        - const: rx
> >
> > +  memory-region:
> > +    maxItems: 1
> > +    description:
> > +      Phandle to a reserved-memory node compatible with restricted-dma=
-pool.
> > +      The BAM-DMUX device uses the pool for DMA mappings.
> > +
> > +  qcom,vmid:

I can see several existing drivers, along with a few ongoing series,
using this same property. Instead of redefining it in every binding,
should we consider defining the prop/type once in a common soc/qcom
schema and reusing it across bindings?

> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
>
> Drop
>
> > +    maxItems: 1
> > +    items:
> > +      minimum: 1
> > +      maximum: 63
> > +    description:
> > +      VMID of the remote execution environment that is granted access =
to the
> > +      restricted DMA pool through SCM. The local execution environment=
 is
> > +      retained automatically and must not be specified.
> > +
> >  required:
> >    - compatible
> >    - interrupts
> > @@ -81,12 +99,29 @@ required:
> >    - dmas
> >    - dma-names
> >
> > +dependencies:
> > +  qcom,vmid: [ memory-region ]
> > +
> >  additionalProperties: false
> >
> >  examples:
> >    - |
> > +    #include <dt-bindings/firmware/qcom,scm.h>
> >      #include <dt-bindings/interrupt-controller/irq.h>
> >
> > +    reserved-memory {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +        ranges;
> > +
> > +        bam_dmux_pool: restricted-dma-pool {
> > +            compatible =3D "restricted-dma-pool";
> > +            size =3D <0x40000>;
> > +            alignment =3D <0x40000>;
> > +            alloc-ranges =3D <0x80000000 0x80000000>;
> > +        };
> > +    };
>
> This wasn't here before. Drop.
>
> Best regards,
> Krzysztof
>
