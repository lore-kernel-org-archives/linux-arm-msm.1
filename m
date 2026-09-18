Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294E64F85C8
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743050; cv=none; b=Li/sWDKKFJ59vIXonPm/N6rYML2ejpIEb/6bEvjuPnOvDM0W7lkdSxeDl3v/PER7F3UL2ixgEECK3zMIvM8ZLAWVXQs38nFYdL0KSmI6FY5Cs3pSsACIar492WirSFCrf23DHit8m4rAvBGm9XgJIGEPzjxl0VzLVHJpdoOKloE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743050; c=relaxed/simple;
	bh=3g32ZEKgqgdm0mzzfeeD6m0KdEMdwsvPWO8RE57p70U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Lub+7ROaE0ovTifC1IbAfQJMgl750vOjXrsh3Ef+RF3mvpAtCoMjgwqzOpt2WsvOi2J74AcgnbrYPFjECdBr3OXyGu+s+gdWEs+0Vjjl/Z6qMQvOSNGGf5TEbeUf8ILXUdBsve6eqcDICkDTmbCdFS2epfnh7HPmbRIPUnTn22s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=A7uI7+nT; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="A7uI7+nT"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so52093666b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789743041; x=1790347841; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r59C/B+bGqeFr3iprC+rozYulFppGtTTZNSFZMONdm8=;
        b=A7uI7+nT5gTJYtUZNUuYVj0NK/8INYXpvT+dj48RmCsB57fE/H/rXc36w5gh5/p22S
         p+U7aE1ARtIxOHE+TjLcNDwh9HRz30R1WDJV8m4SEgj6xvuSnN+Zet7n1YCLuo6/lLJE
         odhfsumAtx6xlZH1ZVm7ZJw14YK1AeITvdumui3LFC/QDAlGy4jsev4AD2mQKpO4fAzm
         BpJYHF1aqFycfttDoX64FQqtf8nSH6Gqcw0HS2/5NrS5HZ3YFH463J8BM1SqmddbbH3o
         BAtPLeUI1sjVn/3vr8PZISNMnL1EV713XZl2bCoMfttdl7jMlD2T9VTjl8BsYBTwPBUm
         S9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743041; x=1790347841;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r59C/B+bGqeFr3iprC+rozYulFppGtTTZNSFZMONdm8=;
        b=U0aHvl1ifTyNTihzuDQBCTp/1MN9FM7uBqC1bUZssF4JeY6q9L4faQLwSIx4MfmtEv
         DqlWzjyq+ou1mOon7MaGZk9CULs3neGdzP2Ydprdn3kiV+vTkOO+j0caXttPjbZPAmjc
         jonVO0G6t/gua4S/UE0hoKyIB2AkwvOsxl/EmsUQZlf4ppTmEu0j6cd7ZfpjadP4G7IY
         dzEkHwkDe3azs1KHfp7HOORL7kL3h3R4SAgWlw7ucs7MpiLihILjqJNWEb5GCbFwPXdu
         26UwKJKMV1B3ZXGoHpfdo7H/RgEZLiFFrS9funevPZbfaM6T6AoQNVJ0nvCoy9T1tqrY
         UFKA==
X-Forwarded-Encrypted: i=1; AKwUvBxaFbzWVyNvSbFxpMriFDS0YvQkMzLf/zQFTbhgmC+aIUjiqoz7nfz3dcAsB9g6krnJd3ot7BF+9ynRfHXT@vger.kernel.org
X-Gm-Message-State: AFuF++lIArM2rQRQA5GybtxY5Flv5boIcIikivF3RupdVwN9eu8jEJ4+
	DYhNKrjzz4gRweEP5/b0lyLk4ZiYuGGIYpltINVYGaopYDxGtrMWsl3R7au6ux9DifU=
X-Gm-Gg: AYBFou1uv0X2JBNZ90DcwFdsxZ1jnJDRzIzUFxR8uKwIHrM69nLV0CLcNIz03dNF40V
	nYNhxBAe3iVIcz29FFkPZcZ93GPcRlm6e/DfamjdQiiSukTAEK/c8yjFSefQdXIGiSox/LihI4Z
	xN+ZuCFxf60hbmNIj3Iu9sJG/QCcyugJBVRjIfgseeCfm45tincZgWhsBEcAC8I1dXe5T6mew4A
	3MNklT9L8mfyk0u2rbYDYhDcMIfn8rWASGP/fIr6Th5zEMAYIz2LF51927JovhVkspFh60WzJT4
	qSGdKRMgcK/TnUz3um98VKGbrK9WmVrtWxjFPDVgC6qsRgxmGXhd+Cg4wQHvB/Rq0zEO1Ep1U5f
	1Fgna2iPs9gOSg2LYE3GqDxUmb5+48woCYn1AN6oZeSbbpO1AJKJUb4TNow/jX0rvP0e00/UkYy
	Ie9A5dnp+Rhs0nptOO0xtVkmNdIhOBmwSOKciJPRQ4zyLzY+bstj/Nls+PangUAn/oeynR42L1q
	Xf5UEwyaBioIqPuTViU/dv4CBgWFnII9OaOgOq0KtOrnYr6kx32LQ==
X-Received: by 2002:a17:907:d503:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c2a16597a38mr269720566b.18.1789743040987;
        Fri, 18 Sep 2026 07:50:40 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb46f0csm66329766b.32.2026.09.18.07.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:50:40 +0200
Message-Id: <DLIIYI1PL2MG.1UYJFILKBWBEJ@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: OSM L3: Document
 Milos OSM L3 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Georgi Djakov"
 <djakov@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Sibi Sankar"
 <sibi.sankar@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Alexander Koskovich"
 <akoskovich@pm.me>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
 <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>
In-Reply-To: <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>

Hi Georgi,

On Fri Jul 17, 2026 at 3:33 PM CEST, Luca Weiss wrote:
> Document the OSM L3 found in the Qualcomm Milos SoC.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Could you please pick up this patch? Thanks a lot!

Regards
Luca

> ---
>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.y=
aml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> index 41b9f758bf8b..17690ff34489 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -29,6 +29,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,eliza-epss-l3
> +              - qcom,milos-epss-l3
>                - qcom,sa8775p-epss-l3
>                - qcom,sc7280-epss-l3
>                - qcom,sc8280xp-epss-l3


