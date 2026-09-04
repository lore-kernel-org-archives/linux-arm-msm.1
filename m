Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923D23D6484
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507945; cv=pass; b=lK54VGU1doUyCaUwmNF//Azf7CezdLRhiEyNftwUMH8tE5aF4NdmtbKjdA0/wg/+hp6PRCGpV3zyx6gNfFM9ZMFO15p2NihLm80gWOj4WoacqbFEHGso9/8MOUES0pNhs3Tx0jYqhL1q+IWp8//dg3lzsDhObuPc2EovzLW4og8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507945; c=relaxed/simple;
	bh=U5ApS72uEjKEs5mPiYz4Sb9WyBZ+8Xb3wknNXul3qjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWVWLGEw3FUbzg8j3MQfpMbXCb3oBBo3LhZLChQ9MPZqofoatrQs7HLMRA6k7GtsDjvgyjiXKejjk/d6f9YS+ds7dx3ffks4kjqYH3nBsc6wCx/xOzZqBf0qcbqRRWdOgrh+17KODqXCNdqHMP9vVYpowgtO5y6pgh6yPRjPwaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBgs5nlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yo3R9oCH; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBgs5nlb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yo3R9oCH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462PfL2886166
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 07:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=; b=CBgs5nlb0vyHXZHE
	CfDIHz9bdopunyqpjuPfCJiVyzLGJTJSSuXdV5NOM/FWd3auNC77Od7xTOIObTxX
	m2AK68aaHGeFD/nMxdZQPcoTxmfAgXD1XVPahvQoV4XeooE131fHZ2nYRLedLXSb
	7O6Zsqly7jU9cIKtCQGjyVH2YNWzIgdW8AOnOQJrn4kK6Gw+x1jO9+ahwAVPD14p
	3sSuHwykqgQunS8swd02Ls+1I0iMrbcN//Hu9iW86cjEGa2VgLR9JIEsH947YNxp
	5V9ZPGk1e+q7i4k7WGR0+I3zs7LL4SAbQ0ODb9LzNfWiDpePeRGGGPU2T8JaeZz4
	xA+raQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp780qnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:45:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so122377385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 00:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788507942; cv=none;
        d=google.com; s=arc-20260327;
        b=ji4DbbTVZWXPbWOKZXCTRnWAna43lCTT8MTxmwZW9FZSgh1poljOZz7UwAKN/CfG/C
         S1Y6umElP1bV/BKShtK2yu3+bgPipknLsFzIDvE7pFiRH4YHtzpLJ8Okmu57E97cnZot
         5xOYsjI6vDfhROEXl4zGUo9YkeNcyACKH3Ynj9guDOuIbEiaoyRY/5eTVIY+wjHAlTUI
         ReWCmcPcw7ne1fZn259XwiPzA9Kt3RZgwNC2VlT54y4HX9dTkRFStXo0YosuipxIgVLO
         ZM9sIuLlwaMA/3E02box9pEbZKdHH/opCElW462lipXxuduoIsyqf2fuYkhZEbZuxnXk
         5pmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=;
        fh=5ApZl41LE+dirhECXRTN/bNd4zaK170u7pmalZbROYQ=;
        b=iOjp+dRPHSWnhhtCRtpk31xKpyZkVvUaNteMJqyJ7wS1Uo7TxcKhTSKOPKeVe7aEjT
         4eGPrLGk8Iv4RQzsObVU9LjYfaEM1DI3BXhi5DTvyg39LqxYkXrDd5y5iSI1NaLR2WOq
         qrVJ+U14PCG7ZSGiqvpGPuTRic1cvVLFJ92E1n50wheR+v2Mlzw68C8KV2sGI1RGXXYK
         kxk2OE6rxcyfznugK2KSCuCKb+zqk+ePX2hZNQwz/cdqa/mu8xhTM1ShCmRdRR+EU/dE
         4l22QuDeMh6DSedVgelUp+7PhQrqVRXDxPTdt7qAtMKdtWlCFbLXjl+3zUWoPtXYZXAN
         virg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788507942; x=1789112742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=;
        b=Yo3R9oCHZdo1MzPbZlA6P15ACaNfIHPfpejnECG5QE4YI2AO0Dpymi2J4mlM+UGCLk
         /QjLDlrnclsKqdAhbmD/LUi8jlvOSstcAYVTalT3rBEC90kYG/m5+hRq+s4C6LHpy21D
         zXxm6h1JuFyFXhwGi5cgpMUw2WYT37SEtmnBS+XIs3qu1vhymKd5Q5OuP87JOowHXrgK
         lIBJUMtu9XUqFLxUvDiJkgkFZeSIqeuzo1j0iWgEd8AxWdvGE8Ktfn4q2w7uyVMypWjj
         cU6qHVej+gPlvNa+O1ozhh5uz69RwWl3b1H/aIPD+R6qzxCZCnkdKZvqUruy7MZmW1AK
         eVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507942; x=1789112742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=;
        b=BwBSUNAbsx56kkFq0CcvVk5atQvADJPacyJDlcPFno1LbYFTq6c/3ihx1oeHLY0lWu
         kbDl0PtyCaeqNRhpvmBjJlu0ymekK8v2snjtGGBBdt3t8hsM9Mc70J82z/7S/P1o8dHe
         L1uwamCqGzSCM0i1Se9KcI0EIWzmsnhknDOnQ/UmxWJMz4qtuPSDoMIkds+wRDKHE5qZ
         J9gsYTCseL0EF/aByK+kaa+s+BmqK1LGAk/Gb70slao1vZV1smK96iI5j1xgPSbEI/Df
         TiYGZCQSWnARg7tMpvMxO9pzZntQbrZCkxPVshZ/9djWk7+apRfJyBunGlhmPcAp8BCD
         rvUw==
X-Forwarded-Encrypted: i=1; AKwUvBzumHCrv+VVBt6q1nzKenOR6T4rVGZtYpGU/XM5E4aWFTIEMOsW/9Z2OP1MN2D1NH9o3EQcHP6m6CHem7R+@vger.kernel.org
X-Gm-Message-State: AFuF++mHtsvaY6mCNw1hYzyaBnbHkI/PGuLZw8xt65te48u2Rq8Ga7Uz
	RUoh64/HTaHarv2PdENFedHVbvKAgOIRUQBSvDyG5WTymK8K3pJ3oLU0s68Bbtyy7PVMOQclF1q
	jZlj9OwPBavHfqzXrRQX+YSRhEy/0rv5XN6LNGta/0LKv71UDybfbZpUviaBBBjCG2I8Lt/2GQd
	yeWG/fHn/mLa9qj+bFq0abgeKbC0YgMA64FmeN/lL/jFQ=
X-Gm-Gg: AYBFou30J/Qww2hMUaPopoUB/PZxA/W+kow1vi8Qs2LNWPTE1v0Y9xYR1PjNkzHGhJt
	2wFnK8x7A+9W5nxBflCJou2kYUs8/ThD1iFEtnkqnJ3APcqoWrpBbXTMR16dwvEKjIm1xWhn/Mk
	rc+cLBszWqHAdZS6nKooAmLaDzLAYczNRrtfTSafcOCa+6z2WgouNSvk/4WBmuXLueN2i0deuzt
	GEYLsmAeanN8fj+12DZUnDGqEroTcgpDd+jFw4/vRtsegF2fi4m0ca9uH0mrk8emmx6O95bn52D
X-Received: by 2002:a05:620a:bd5:b0:937:4550:96c9 with SMTP id af79cd13be357-9396e0e1302mr1054105485a.21.1788507941681;
        Fri, 04 Sep 2026 00:45:41 -0700 (PDT)
X-Received: by 2002:a05:620a:bd5:b0:937:4550:96c9 with SMTP id
 af79cd13be357-9396e0e1302mr1054100585a.21.1788507940986; Fri, 04 Sep 2026
 00:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
 <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
In-Reply-To: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:45:29 +0200
X-Gm-Features: AcwNN1WWU5FRzvZrK5fq_LzdAaGftwm82SLjDwjNGTlCYX8Fb3yJIL48uBH_wr4
Message-ID: <CAFEp6-2nWfjF18R9pw0xFt92GcPORKKa+ix8czQ=m512TYuP8Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] phy: core: Fix use-after-free in phy_get paths
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3MCBTYWx0ZWRfXyqwAJjgVVlIh
 3LETuy5T28Mz9apBF6LbaEwQ6JkITaI7RDURlUa/7QXAtm7dUuRM7cYecjKhspkVl2UAo8xJPib
 y1MpbAEQjLPUIm6L7onBFepnquzAyME=
X-Proofpoint-ORIG-GUID: B6Pu8o7SA9XVPErAVPjVr-0EMWBzwRWM
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9a7726 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=j3EoGy_XDV5ESBrvTGYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: B6Pu8o7SA9XVPErAVPjVr-0EMWBzwRWM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3MCBTYWx0ZWRfX91/ZKpz/wLgE
 mWlnQo06uGMcMPyhmQo/1LU9YBYO1pvTEVFOwWBIXt5cDx63mu31y3BhYfP+VZ6YtoEgEf9ZvA+
 acFPj68Dv0a5l0Gl6P3HNJ8nWxCXaNOQgqPnWD6LryQ8xGvF9lWmiccU7h35ultRZpaSgtXE1OS
 bNf1H9RrnCXcI2MisOthlfbPomSzP9MmySj0uiP8xTvvTgPBtsebi88uySu/MEps+LHeLHKMy6p
 espz36wiFxJsFPwe2AGnA1mIPWlZdZfhzHxeTGU22t7hcvs2l5NU1aG38+PdKjDEZN1r4JkL6tE
 540ysm9Q0DYdHFUy0bcOl1mwRyOWBnGCtuLlqcsHaMFv24M3jpyzPkStaTfayEzMzfhl7d5l/jw
 8cYpV0obTqH1RlZLmMD+dilwBE5PlMMO+bs/wmB7dI/EqNbD8FSNzO5XIgmb3wcHdXMwMcf2TwQ
 uoteo7WeA7jCVYTimmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040070

Hi Bryan,

On Fri, Sep 4, 2026 at 12:59=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Sashiko asked during a patch review if the existing usage pattern had a
> race condition; specifically in of_phy_get() if it was possible between
> returning from _of_phy_get() and running try_module_get() that a module
> might be unbound leading to use-after-free.
>
> Looking at the code this appears to be so, there is no linkage between th=
e
> phy and module under a synchronisation primitive.
>
> Using the phy_provider_mutex in phy_get() will ensure there is a link bet=
ween
> the returned phy pointer and the module_get() bumping the module referenc=
e
> count.
>
> Amend phy_get(), of_phy_get() and devm_of_phy_get_by_index() to fix the
> same usage pattern.
>
> phy_provider_unregister() must take the phy_provider_mutex so amending
> phy_get()/of_phy_get() to take that same mutex guarantees there is no
> use-after-free.
>
> Fixes: ff764963479a1 ("drivers: phy: add generic PHY framework")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/phy/phy-core.c | 41 ++++++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 21aaf2f76e53e..cd9ace125567a 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -124,13 +124,11 @@ static struct phy *phy_find(struct device *dev, con=
st char *con_id)
>         const char *dev_id =3D dev_name(dev);
>         struct phy_lookup *p, *pl =3D NULL;
>
> -       mutex_lock(&phy_provider_mutex);
>         list_for_each_entry(p, &phys, node)
>                 if (!strcmp(p->dev_id, dev_id) && !strcmp(p->con_id, con_=
id)) {
>                         pl =3D p;
>                         break;
>                 }
> -       mutex_unlock(&phy_provider_mutex);
>
>         return pl ? pl->phy : ERR_PTR(-ENODEV);
>  }
> @@ -635,11 +633,10 @@ static struct phy *_of_phy_get(struct device_node *=
np, int index)
>                 goto out_put_node;
>         }
>
> -       mutex_lock(&phy_provider_mutex);

Then, now we're moving the responsibility to the callers, maybe we should h=
ave:
    lockdep_assert_held(&phy_provider_mutex)

>         phy_provider =3D of_phy_provider_lookup(args.np);
>         if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))=
 {
>                 phy =3D ERR_PTR(-EPROBE_DEFER);
> -               goto out_unlock;
> +               goto out_put_node;
>         }
>
>         if (!of_device_is_available(args.np)) {
> @@ -653,8 +650,6 @@ static struct phy *_of_phy_get(struct device_node *np=
, int index)
>  out_put_module:
>         module_put(phy_provider->owner);
>
> -out_unlock:
> -       mutex_unlock(&phy_provider_mutex);
>  out_put_node:
>         of_node_put(args.np);
>
> @@ -678,15 +673,21 @@ struct phy *of_phy_get(struct device_node *np, cons=
t char *con_id)
>         if (con_id)
>                 index =3D of_property_match_string(np, "phy-names", con_i=
d);
>
> +       mutex_lock(&phy_provider_mutex);
> +
>         phy =3D _of_phy_get(np, index);
>         if (IS_ERR(phy))
> -               return phy;
> +               goto out_unlock;
>
> -       if (!try_module_get(phy->ops->owner))
> -               return ERR_PTR(-EPROBE_DEFER);
> +       if (!try_module_get(phy->ops->owner)) {
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
> +       }
>
>         get_device(&phy->dev);
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(of_phy_get);
> @@ -786,6 +787,7 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
>         struct phy *phy;
>         struct device_link *link;
>
> +       mutex_lock(&phy_provider_mutex);
>         if (dev->of_node) {
>                 if (string)
>                         index =3D of_property_match_string(dev->of_node, =
"phy-names",
> @@ -796,15 +798,18 @@ struct phy *phy_get(struct device *dev, const char =
*string)
>         } else {
>                 if (string =3D=3D NULL) {
>                         dev_WARN(dev, "missing string\n");
> -                       return ERR_PTR(-EINVAL);
> +                       phy =3D ERR_PTR(-EINVAL);
> +                       goto out_unlock;
>                 }
>                 phy =3D phy_find(dev, string);
>         }
>         if (IS_ERR(phy))
> -               return phy;
> +               goto out_unlock;
>
> -       if (!try_module_get(phy->ops->owner))
> -               return ERR_PTR(-EPROBE_DEFER);
> +       if (!try_module_get(phy->ops->owner)) {
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
> +       }
>
>         get_device(&phy->dev);
>
> @@ -813,6 +818,8 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
>                 dev_dbg(dev, "failed to create device link to %s\n",
>                         dev_name(phy->dev.parent));
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(phy_get);
> @@ -961,15 +968,17 @@ struct phy *devm_of_phy_get_by_index(struct device =
*dev, struct device_node *np,
>         if (!ptr)
>                 return ERR_PTR(-ENOMEM);
>
> +       mutex_lock(&phy_provider_mutex);
>         phy =3D _of_phy_get(np, index);
>         if (IS_ERR(phy)) {
>                 devres_free(ptr);
> -               return phy;
> +               goto out_unlock;
>         }
>
>         if (!try_module_get(phy->ops->owner)) {
>                 devres_free(ptr);
> -               return ERR_PTR(-EPROBE_DEFER);
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
>         }
>
>         get_device(&phy->dev);
> @@ -982,6 +991,8 @@ struct phy *devm_of_phy_get_by_index(struct device *d=
ev, struct device_node *np,
>                 dev_dbg(dev, "failed to create device link to %s\n",
>                         dev_name(phy->dev.parent));
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>
> --
> 2.55.0
>
