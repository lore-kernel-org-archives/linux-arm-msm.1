Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A043A817
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786444259; cv=pass; b=dWg6kVGgXoS3Mqej6tZ28kN+3utipzs1TS+EghECQ5XXKPrPwQDWM0YELVkljSC+POVlyXze3vILf7pgV+v+KVEUZkOMmw0rLto1Lu0pU6MdPmpOjRATJaDNybJAmLZYocNrMVUv+1s/7ltg9Edc7psZxTulwxBistmrjdXWPAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786444259; c=relaxed/simple;
	bh=5dJC5lLl7nj9N7EaLPnc6FIY6FRga+mf+WjyttUUkJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZjXId89Deg+nYwmKYMlVIOjS1lPyWCE8GAf2r+kKbj07b2ge1e1U58lwTyIwTPwXKTEPrZdNNIQIkl7iMa58sqhNJ9nd7KqQ6m/UP2UBX3J3D5G1UMgMeJzcSTMHEOWmnzlQH1DcB4rLqNF87IHvy93M7yYHrEACgEOkzE5GSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyxmGWf1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZlUfVTN7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyxmGWf1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZlUfVTN7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BALgdR341071
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXWu/GrTSykJNOgzaotxL33AiVhilc2AYNz0X1SLNyo=; b=jyxmGWf1UnroC+GM
	nUl/4DhZfXSR+ExeIs8zCv/OBzsU8N08OgsmTYZGPKUZJK/sbp7aDr/G/WIyc+UM
	dh+iz2pNia3iCLy0cg53tGXH+43QzPP8CEp28hrfroVvLOJJHfRN7eoPRgm6fgL3
	gytt3wg1+cosRx35jLr87ZQ5Z2AKaAUv31Te/JQHQ6pAzb1fuE9pVUyqeEA/8C7a
	C9muxQmcD+jtgOgykNh89QnFxQzQvEpXDFLicUdMz+s/pm1YBcLOGytfWfMZJzGk
	Qd0q8BqiiJJ7YY50OcGfLYZLK5nnIFocpSU54sNje1OAohE9Lsa9qxAGzNwHhQn0
	ktTuZw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q102j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:30:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8486c3411c8so4031686b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786444255; cv=none;
        d=google.com; s=arc-20260327;
        b=iGxbq9BNSD1Vd/TJWQoXAc13H5mo+R2Psz+YJwDcfQV5z5mt0hb1fmde40akQDaktT
         bA5gvrcAWuJg4V4uI8vEaKA+uqaNR4hoLLPIuCPTKr3Wm3PjKUiLxQi8f2z/TjIxPCM2
         6CQ0kMfuFmFh5wL7VWQKa3szksa/ga+uv9h4d6Nk37/hyi0b9MMZ8Vg21Ck7UDt7ocMN
         KLxg66qmmwPdRR1KheNR6+YKQEKhcVjOzIJCfPuFR+isJxW6+TS52UNs81Zeq18nnN32
         XEY258aqOBDWB5YieIFwtxOi4z4NgzF/JtroVcSeuLkrJh0FB/fvkoqZPv9HtZxo08H5
         zKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kXWu/GrTSykJNOgzaotxL33AiVhilc2AYNz0X1SLNyo=;
        fh=ieVS0Qcial2gnMLYuTqAYsc5yhofmCsBR26D3qmURb0=;
        b=YbptdmkSKKXKrCKoGzo4ELode5GT9Wtl5JUmCsYEmtE4//AvN/odbageee2Jvhwu7K
         dI5dL50wkXMaISiVBBRXRZUnfZL0PTHhtS2bWF2ntddQs0aMHx0N7xRQHaUa0znL+pmn
         BtntZxQ/4P83bU9uFFnQXf6GBnT2vdOCOyQqMvZvV5E4wzzy/6RJjZTf0DRZYe9X6nPk
         9+eeBCeK4YxVLlkNKs8Yy2rODRsLPndOzcqUh+UpbBqa3VBeOXHL7rOXnZt4jwOzESTG
         S1T4b3MDS2EOS/LEVCmgbnvxKoNYfsqclChjSzJPYbkhrg5LFOmY5HjmxljCNM/ybTVT
         POrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786444255; x=1787049055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kXWu/GrTSykJNOgzaotxL33AiVhilc2AYNz0X1SLNyo=;
        b=ZlUfVTN7topFK1Nfe+nKjV2M4ud0cUBBf0gGZafRKryH6XjG6LYw7pc66KUy9NfkcX
         dMUTKS+IQwSQ6A9YF4CLlrbcSO89SdLtIEG90p8Ttlbxxn7ig0IjSZ9yME0Zbg9DgT3M
         FXFeYtIiapjgmnv8w48oT7FHC5vQsZAgI+YeXTStfc8/oOVGXnq+nPYwGNGdL18brvfT
         BKBmVcgLA0KLQNmGAi1fSm1MSRsDf+uma4fgPPH2D3xO8NYMgBltQGO/YDgbAsWXnVyW
         UTFL/ns6BBpwxW00qk2s65rjVtUuRA6C+R1gig9JSNEZJBU79u20SSaC+Xa4luyxsX/v
         UnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786444255; x=1787049055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXWu/GrTSykJNOgzaotxL33AiVhilc2AYNz0X1SLNyo=;
        b=Q5vbXXJtMq4Q6+jRinizg+ixI1PGheMmw9k83am6acHdIEb2hdqVzZ/JbT1I9xR+8A
         Suxn1X4cj3tdTqqyTq9J7a4NF75YEeW2OubdO87RGE4RDL7SG9Z7n/z3sj4KCqL8KFIw
         AcnMciAGOUaO1fWmHcUKSm9Mz7c4cveW5/iOW9kaA1Ayk0tKVgokp9s5KUABY/YJFiFQ
         lu2fnKGP57Kz6C8WMlHokb1U66Owf0K7x2cTgjNakmFdSzug33Xy77soaPFWF8BCB9Yl
         z8L3z9IBNfa9oohh/iznQxJcql4/eVF5M5CoKdwniv2an4xMg8ShrlH2WYUCrV4WHVlx
         aeSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqR5ksM0HWzCcdyzn5CO8KmuWJVQ4hZMlrzWYVzMocWndivKg3/7LRbSbS848M8ECO6Emtxp0ejzmceK1Si@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0FD4UfR5PzsKl9KvxBVV0KjIK7QH7z2Xw/BYQtw06HEMU+yWh
	9UCnaUnNFZOgfey8e9+1yvnGi/wO/oOk4aMnSS6ZV4mBGlzWmELmRTpQY1grikKx4wUO4z8RIGm
	s4n1H61wY8MvMMVO3NQ9s2QxByfOVt469dIvstATcFv/MiZtKvgttAriakW4MTXOeBztK10HfHZ
	NzcEDS14f5n7mfS51NurwRkEv0Jbo6HPztGYyfM2s8Hi8=
X-Gm-Gg: AR+sD12PU25e9QoNU1apgD0KBbs/1BXIic9UQVKmr5ER4gJW7ixnQRUnENpPTYDaITo
	AxxisxBy1Ejjs3VTpf4Ld3riAB7Mt5doz0Pi33vEWnIkNdipSwSjzOe0CcXUnpJBiYWtqHgx3A6
	8EmswOusUvS8dwcWRXmvebIjpXSFFDMGMMCxRB83BX5UWDFdAAwia9rnMZaA==
X-Received: by 2002:a05:6a00:9283:b0:847:8971:87de with SMTP id d2e1a72fcca58-84fa88425a4mr1764012b3a.28.1786444254403;
        Tue, 11 Aug 2026 03:30:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:9283:b0:847:8971:87de with SMTP id
 d2e1a72fcca58-84fa88425a4mr1763944b3a.28.1786444253587; Tue, 11 Aug 2026
 03:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-pmdomain-add-missing-mxc-mmcx-on-eliza-v1-1-5e10fad1e456@oss.qualcomm.com>
In-Reply-To: <20260810-pmdomain-add-missing-mxc-mmcx-on-eliza-v1-1-5e10fad1e456@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 12:30:42 +0200
X-Gm-Features: AUfX_mwU4bxPLY6qXeuFq8BJo4JUTXUdkjrsGSNnAvO-_gRbiBggvLao-DbwLXY
Message-ID: <CAPx+jO80r_QF-hqGuRV4BnHyKoub3+j3EPbnZ81ejz+wKBBQ+Q@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Add missing MXC and MMCX power
 domains for Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 1qBVpk4JSjFhfHkOQWR3oYOonQafWrOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4NiBTYWx0ZWRfX+ZkddhlF5+xo
 9/iRXqHH5O7ULI3b1OcwClXrnT/bnz3Qtm6wOb68VjtjoDOFgew0PCIkrfNjNvc4hdWxUFhDTdk
 guNhifuWHZjcNcjADw0f2dGZyrNpuXW2WDmBcfZlvuGei07ZPFIw3Q5RbTaRicBaV5SgliQZDLG
 FEIQBSb+8CvKuhqKKDKCWTzGSlBWvWms2oaDkIjQU9a4Wv16vq4tnp5glvPGlpn1as9nrAcx0xD
 aWshqoQUu61mvGDtR8/f9iPQF0AWLTUPFVlGDVKOxENrfSt0b6qtltzvPvZjmdzOyQKOIQKV9Fy
 IcgU/XGjqbh9890Z43eVbjK4t9q2vf/TahyNWnkdDu+001x1uGpWrD6sU3maG+rO7pN+6VjtNWk
 5MAKxyxLHeRKPPM/vtr5pOs+RyzpnM5Ma2wTrjKucL0sXjrYgRoWyrXBz5rfrdDLqG+BcAIN3QB
 8ol7uEZXVPO55vncv8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4NiBTYWx0ZWRfX7RKkEgiCrEiy
 ARQfJIe7XkOEEiNcAUZapvhERAeK054CI1IEcM5hvAOqGFVz9prElFR5fjaKY3sSr30qNZwxbly
 Kt/loGGVp2IKKNS9jO497cswQDNu6Ec=
X-Proofpoint-ORIG-GUID: 1qBVpk4JSjFhfHkOQWR3oYOonQafWrOx
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7af9df cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=yp59m6hDsgm-mfU0uHUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110086

On Mon, Aug 10, 2026 at 1:10=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> MXC and MMCX were initially omitted as they were believed to have no
> consumers, and they were not present downstream either.
>
> The Iris video codec requires these power domains, so add MXC and MMCX
> along with the MXC_AO and MMCX_AO.
>
> Fixes: f387ecdd492f ("pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domain=
s")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index 90743275942d..96e4bd2f5a14 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -241,9 +241,13 @@ static struct rpmhpd *eliza_rpmhpds[] =3D {
>         [RPMHPD_GFX] =3D &gfx,
>         [RPMHPD_LCX] =3D &lcx,
>         [RPMHPD_LMX] =3D &lmx,
> +       [RPMHPD_MMCX] =3D &mmcx,
> +       [RPMHPD_MMCX_AO] =3D &mmcx_ao,
>         [RPMHPD_MSS] =3D &mss,
>         [RPMHPD_MX] =3D &mx,
>         [RPMHPD_MX_AO] =3D &mx_ao,
> +       [RPMHPD_MXC] =3D &mxc,
> +       [RPMHPD_MXC_AO] =3D &mxc_ao,
>         [RPMHPD_NSP] =3D &nsp,
>  };
>
>
> ---
> base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
> change-id: 20260810-pmdomain-add-missing-mxc-mmcx-on-eliza-6fcb519048e5
>
> Best regards,
> --
> Abel Vesa <abel.vesa@oss.qualcomm.com>
>
