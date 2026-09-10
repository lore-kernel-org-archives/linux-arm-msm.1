Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6C84AB1C4
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056346; cv=pass; b=i5GKmj/sd5jiQWZ+rd7oKY7evdLrVovJDktXYeaZ4Kx9YR6schsIUWxfIEPiPKSK8X7+Q9eqYAOdiCa/Hud3gKjwP0j2TUIeS1GhhNFRwt18NMzuXpk6vJZCmkXY0pQ/79kNimt8wSwEtAodeZpqJ7lbbJbq4qxDG5A2t2HG5a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056346; c=relaxed/simple;
	bh=aBy1wp1XDgJgk2FDHwx8cZ27pYMc6ljfdd5t3tcQcWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlMxK0jboUWExvV8OE+gpZabPqVBc7EI4bFpNyFvwY90VUWo2HlWUqLGux2oju2d3p8xbb7LaQqv2rAkrXcUnpiU2Gqmd0EB9yvAR8TgMC88jkoK2B0dmTaHxD5JoUfHSEql3DiYS17P/F+1VF+6XBU8eLe9LkIYb//Pg0PwfBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gd997f9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UlNXqFhx; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gd997f9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlNXqFhx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4ERl2432965
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 16:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=; b=Gd997f9xtHHwFcNK
	ESk2kaXCnE7PChuTUrYr3RcjIX5qulDIXd4042yQkQPv1PGEwzcf4NA5C2PjqDKA
	VU3c2x4mX1MZps4wbENVRTO7f5e73qqF4n+DcNaPhVVa2yBz8Z3zUTWcaQz2pFX/
	nR7j0xtubkEu1bj7WgORXBC+VyHc4yB+oEcEar016FyeMnDmf0eap5bv0vcfVXKe
	i4bgE3dNGVaRICb7KrQboVxsHlaDfeCBtVBWblzTuqWg45qxwjQgJdlfn5HMeA+/
	kXENZlnTL2OJh2Fu0sVgwWT9PtgfUiqNLmN3+6WTyXVG6hOxx0ZxK9N340jzBB99
	w4MYSQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxnv8cjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 16:05:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3119141a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056343; cv=none;
        d=google.com; s=arc-20260327;
        b=HykkiOdw8vYek/vIvuV4j+Zv/nXWIynYLbRmr9+mRPoP0S3i6h1MUIl5Zrs4IR1AmG
         +1vJF07OQNmpYyHCaOQNFbxXbtZ+TMuqxtORnmLzT9WHfUc99KK1eyplkHPkj+bteUbD
         RZpTGQC1/Oog+1qgHht9Byr9bnKELGyJ3PkvShmuiM+9nfgVkUYrp7kGYl3BbTXo+gpM
         SeZt4p9O5f9GGZlct6o7TZE5GduGN2CC3POc791dPwnmeKFf2/5neg6SwcVINIiP3nph
         xk+xTPu7YTTEdk9TC2JiGjhztJtzaecY9cy3WIsBTbKZILrq5e7fHDnSCc6L26PY/QGU
         F74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=;
        fh=DTIZlmzOXBBOx5Hhgkf66x01C4IO00Kxaq2o43XD6CA=;
        b=rwszwHe0fVtgXne2h2NV//l35z68ptQJE6dMLpLtVDFev6/EkIQfcxasd6BQPmd4YQ
         hQpviWVBJdwweFu+4a/gSTMVz2XICsy511ausK4YeQXY3RpcRG9U/L+va8TxZ4HoCwxj
         4H+sCoYSosamGjFKOE2vSygz58XaMVOkyu7EEsxIbRU6Cz0Pdm+u5lFvF5FGem6aDXaJ
         IPsXLOlItCmYE0vOExmur96ctUggl86PRD/f9dzk/4GRcGdNOxmf8vOzDV2qAv7wd2Qk
         mM99frcrQey3V8ZTPcaBg1QurxBu8SFH2nr5GRj8ayRwhCdR1dpIuxJW3FoLNvitHrba
         yo0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789056343; x=1789661143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=;
        b=UlNXqFhxUHKhCqL4fNI3V7Jxr9f/1utmGP5GVMQUxT5DOCvVdAJDcE6iygBEP0AUd2
         2A8Oe0wmcWub7HfgE3hLGN2D9iJQ7UQ5GH7xn0rk3/tVheJylvNV8apmJl6zFN7irIF3
         8DiKcP8efCA41qKvks1e3QbGIMIp0S5uzckn2rggK5bm+Vis28oM3hvUV2dAMEpngETS
         uk/m56K1eYoIH7MUV26MKEPuLbjuZT10SHBXlKHPLjGbP1IZDIbQXMHgielIeaLdlVZE
         cWAyUBrw5UNGkBoSdjFkeM1IM50kdgVMl1UoK5E3n2vj5tVwcThOvAFGPloGHvDkqUAx
         O9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056343; x=1789661143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=;
        b=f2zEky5be5leIOcAacwg9c8VfiEQ/LxMYEIwCd4FKKgxMCFk5at5tbK6dUTwkkQ2FD
         A0qL+6ahizh6yFK5ghErXELapbTASPH5IK6crH/VFm7+CwPvXPwuu+RZ/NKfG7piTigx
         9Z0g1jB8rLYvda3QUJswkSyL5OEaP1snvFTqTdmySQkG8hXdBuobWO6au14DejG64rMM
         Wbsiu4UOA6US83oNMPu3JhVDahH9DKn8BB6Dmfb1uQSwK9U65iPMFaiJWH7bSJ/ZOuOX
         LKJbCTs6ZMVcyGXgRjEBy57k1+uwn5F7wsuLYvualn6tgnPglkaT0tpii2qkOTvyL5iZ
         IH5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhbusuvfYMpLjj83iIGpNQoUbwVsWfjn651c534nNWDDjpnONddKoud4a1U4uFiTzzGE39qgOuqoKeiHeH@vger.kernel.org
X-Gm-Message-State: AFuF++mPQ5fOKlbEHFTbXALhJDL1lXdKe3IXnOxSunn3YLvocbYS9ojx
	oaX3iONgeIbMOCW7BO0fgGzZjqYjOX8+skbvrYhXUTXlbZJgxTXR8Xh4BcP/RbgBit/jIjEWYyx
	m/6gPbArFu5ye4O0bWj9KY53stHYp04HOJBt7EVrMYk9BgbFjS0hBxZx4i3PS5T6rJPTMoCvvVQ
	wpnzn03CR4SPXlv+k7gdLEU0q+c+uMMw+ZUk3hYSnHnqY=
X-Gm-Gg: AYBFou1Om86WuVXM7NXtLJGEiRjakiOW2C4CcfiRJI+r3s58wjaX95nycWPDnbpaaCl
	NWjOQH7WT6wLCHeAHEJp/V6litSISH/L7bcOzjmERaWyjKuIOVZPVylD7uQqEnDPOeFnmUSWDro
	vR7WiC0K490sIA124+7XxB4yR6MxK5yeC4wCqM2gny/N62IccmHey4SCxKuA==
X-Received: by 2002:a17:90a:e18c:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39d709e6ec9mr13852692a91.1.1789056342606;
        Thu, 10 Sep 2026 09:05:42 -0700 (PDT)
X-Received: by 2002:a17:90a:e18c:b0:398:c16e:69d3 with SMTP id
 98e67ed59e1d1-39d709e6ec9mr13852578a91.1.1789056341947; Thu, 10 Sep 2026
 09:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825083702.3931016-1-nitin.rawat@oss.qualcomm.com>
In-Reply-To: <20260825083702.3931016-1-nitin.rawat@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:05:31 +0200
X-Gm-Features: AcwNN1WvbHnGQHe_mStODRAHYsWnHQkMBnMABj4Ua6z5LYWNHvR9yk0WKmoWbIw
Message-ID: <CAPx+jO-mQ_zFdpUGZR5FJYNdJuJ6EUyRU3-uO5zmTPdjH+S3+g@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: mmc: sdhci-msm: Document the Maili compatible
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, ulfh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfX3hWWt+oLH8nV
 Gz/GEA27tCqqfm3O5eAerWuzbVYMaTZl8vsPIwo6NoBXtY+3ATreu7HeaDP58MedCxvf6j9FD+H
 vvzVW5AT6AAAnN7nUBI6ksDQTpvFUZx5iqWkHDFmdcPbc0FkMDYO+gmR8Olx91Xt6JplG+J2GIb
 FnMThRHX5Mh+BkHNMFMcyXpugNW3oEntjcElOK2Jg4XcYfcDuwhcsalVjwQpTVhmKZYExdCmawb
 yJUFqKduwmGAjgkAbtFklHtUtR4gNclGth74AtbxMEej37r/FIpEhyPuXKoa5+N2cv/nF+133uh
 cVjzt6FiEv265M+oGKHq4n7h+7saNPJkmT/KXJdWzBfW+tLEmcbmFgd5dDYyV2IUBcoDbVUCU+H
 jegnerNPWFsq0abnfo7th7e7dvRx4Bb2zRO4K0hn5hQJR82YeYDzB08Z/nJ7pmJAHVRIl4CIbBm
 XBFWlxK/NSI/OYmkPJg==
X-Authority-Analysis: v=2.4 cv=RsxQvymK c=1 sm=1 tr=0 ts=6aa2d557 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=bLxP500Z3OXyVcFfUPAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: SfYBvBlNpBEdYisP-mXFyOIaF2xxSr62
X-Proofpoint-ORIG-GUID: SfYBvBlNpBEdYisP-mXFyOIaF2xxSr62
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfXx5gXvAp4Udek
 zgVTEUfKoWrLMXZN0dQkeavJ1VmIuAdXs2AJ9Uik2uTNTrkDtPPgEyVuj4h8d7LQoTqZkX8yUbu
 YyeWpgXchwJrq8adlkdRR9YmGr6Q/zs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100195

On Tue, Aug 25, 2026 at 10:37=E2=80=AFAM Nitin Rawat
<nitin.rawat@oss.qualcomm.com> wrote:
>
> Document the compatible for SDHCI on Qualcomm Maili SoC.
>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> --
> Changes from V1:
> 1. Added Reviewed-by tag from Jingyi Wang
> --
>  Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/=
Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index b3fcc1673c10..69bd44e65ad7 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -47,6 +47,7 @@ properties:
>                - qcom,ipq9574-sdhci
>                - qcom,ipq9650-sdhci
>                - qcom,kaanapali-sdhci
> +              - qcom,maili-sdhci
>                - qcom,milos-sdhci
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
> --
> 2.34.1
>
