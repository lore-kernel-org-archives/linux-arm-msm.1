Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041347668E
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316700; cv=pass; b=OBdBBcjK+vWAZMnrLkUt0N9hprXwoZJxXNWVHxlxSWNUJaFnZ+2zVK9eYynGnwKY/I3NnZr7E5Z7vy5g+mJVAXqJHlxu4rAWsLMBjfeZ/r+yTutfBR290e8ZFhof3EAgSzx5Y71xkUBymOmoqjaiPT4ywLVG84JRA7smuad2Kg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316700; c=relaxed/simple;
	bh=fZbb9v4e2sk6/OnDmZnaaF3vmjmxv3DVkekcYhG8d5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tp49YVsFietc8ctTxKea/yAkU2axgvLMKaDj2WRlH/8PiPhbnnlvq9rPDcxsUFPBph0BW/NmNv3haOiBFPhU6QRLyaIdrCvp+OJxkRjPjr6xA/WwrpB6AtDvlZDXyDEdyyCG8WF/27+Jm6sJC3zuWRi35ZJJaVLvq+ZgiTjNPCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxAtR3li; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ewc3U80T; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxAtR3li";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ewc3U80T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCokYn2029747
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OX8Kh+7PnOwt46WAC1QaJaLq8pinJzLn9zW07ubaMoo=; b=TxAtR3liTbaL0Hia
	95Zbr6NdFTGIDe0fK4fJUWbNOREu4ldJzKYTmbmTnonEPZPZ6q4KfcBNrDt8oNT7
	n/bjMWYHFdX59oyQcs+066+e5LwMt5YN6JA8DBPw0EMiFip1ZreMkSZTPFBxP2V8
	GOmM/KXtQxDTx/cW9eXcHRumPmf1Yr8Cqh0Jo42AFwulfZUN4ttBDSOv1Vl1aqau
	7ukVDIhC2B+ZJtUyBRDpjUpcMoMjm58gfL1sEykw+OTkiZzi2V1RL9pcZmdNguR+
	/blkOopN4tSlxuZ9iZiPMS7Jdw3+HgwyDEokHWkhV88BEsLEGvlCAsY6RZteo+it
	S4VsBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue1pwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:51:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso14827015ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787316696; cv=none;
        d=google.com; s=arc-20260327;
        b=V8fLVJZaTKonPeK88eseD9pCpubgZQDLXDj1iR0YjrMPF5Qum6FL+N9hHyKCJhgno+
         PLuSsNgZZwvY/vxphkR1woFe9JxkjTdqYxtwbjkBdwvup5QcAQSnqA35upziPnJ0UaNh
         FfthcTW/e+tnVa1KozPGlRkgBMOpE/Ga25Qpa1ckp0pgjZZvRUweV5pri5H9ShPvU0rO
         u1P5YmcYtzTvW48UJ26nialqqTdDOOGhZBPpT1iznfuZkb74qN2vIOQ3mDmkN5MOS3CC
         sbQGNiaEP42FBx8aqCwdllP9Z+AnbafJHahKx4JVUXxxtS5wmLtmCytJF2uDeML7qZ3x
         w9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OX8Kh+7PnOwt46WAC1QaJaLq8pinJzLn9zW07ubaMoo=;
        fh=9vef5hLZ/A9//iuHOMGJ9PrhZ95vr9rXzVRfThBw+6Q=;
        b=sf4+2eVSJmRsB3/ng6VUwO0MpbxgvyOh656oKEJqJ7vw5Ex8VyZgPFclhOFcql7c85
         LfzZ/wM1qotXwTk93N6WMdYRwcCBho9PMbw8cHplYiaM5EjQ11dQoEorKlIAtPUnY/KI
         DL/i/5u5CSozUMXYrrKM+XI7E5I8oisoUP5aWU99YoRJxf14hBYi9NoGTQvt4K8Gj2lA
         vT8mi7mDtinHHfslvrPX/MqcAdlzJxn8lkDy3q0Hcm2sHtaB9EeVU6+rvbT/x3VcKeQ9
         xvU3ieDY2BehokyD93xBfqMvH/Sq5WrK88w/4Jc0pLoSlnApQHHvIwnNeKVBhRaU39wo
         VSyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787316696; x=1787921496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OX8Kh+7PnOwt46WAC1QaJaLq8pinJzLn9zW07ubaMoo=;
        b=Ewc3U80TW2Qt3ljglCcLUza3h/Pk6+orf5SabxZxUUtydWaNiqWQ9YIq4pUlUpZjlb
         EqFWGsqAKU8/PbNh1a34O0fajpbFtjTTiiYV1hP6+OT70HIRr7LrHgCHXL59kpTkSZ5v
         4A34IaSvThoLAEzlD3w6HyfVZzC3gIe9YpgKtOXN79NKmxHMihvDslWvgv+rMPp62jFm
         c1iffH6o2JbaGhqCwegJ6nj4KV3MfI0W5em/enmZBln5oIgcmFcowxuWzpWtDKYc6LXk
         NRzOpPTCcVyXMqW80Wos/ll0C2DRmbppSw51qtMe6ipwxqaQWnK+KMLyKK+DF/I6y+52
         eJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787316696; x=1787921496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OX8Kh+7PnOwt46WAC1QaJaLq8pinJzLn9zW07ubaMoo=;
        b=qhqtMrEzCOLiI6trEg6fiJemXDA62lx2hP8DuTZ9r/MqkuHgzj+mQgbcuP1gopAFjY
         soXQ0tYqqGe4Tr5UTw/WTN2UNdUCaJ3mFHltLqPXuuzJnTJ/R/X9aZ1rNiz9A2ROBJat
         KzReuHQm2r3H1FwDEyiHvUxGCBxH7yL/0iUP61gfzsi4iRwV9w61yyzsvwxVUyC0QaQJ
         vogFBnryXF2m40klNzC2PoWhCMSPeaQ+OGWNAbUAxl/ArNLqwp2y4gVYIVq1RaaPQTEO
         ptYaKpRbEcATN1xhTBBTDh7tAve+hBE7tweH6j4/oW1idMjiGoc8RODdT5r5q+oiyB4w
         e3VQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6+MEjHFlXh8qS1XomXDUxB54CWnfB8YxvI6R09+Q8i6CV6UL75xJ3l/k+/2BSPNetEYtJSNfQrNKuV9ju@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lgznmHHwSE4RI0aM800jyxRmmKYagnTJssjmZpvjEVhQL+M9
	fh4hw05cAuOfuOT8r/6SqguKoSy0EG4DkYcoaCtlYZaNvtTDyaGQKQzTVC1Bpc6+4UF3ocuu7WD
	WeWlssbosAMXH+Jb1Nq+FNH0k6cGRv96sAL9OWwchGY6CQlnYhZsfW7mLBpbtSLRtXiRTGISn3/
	qFT+Rjbn7vTNd8Q90Mdu5+5KsAmRultyXVjmlYsQ8pu1w=
X-Gm-Gg: AR+sD11SsVaTYzebt4PkYwDZNTCGlPAYswWuXuMs5TPgSI67gNKbswYzqW4PgzvHFNv
	+MPlUbrtNxZBdptSXFhXbr1tjLyw9sg/5HUjaMsN6TG3vWZPb1O74pifdMXsNSa+QnPmr9dhpBZ
	rXT3MS+yme7Cxw8GR2LsyC9S5Fu+jw2iNeQ9cqWLU3M8BPNnnO082Fvko1CA==
X-Received: by 2002:a05:6a20:d74c:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3cd2fe23ae8mr13247616637.5.1787316696112;
        Fri, 21 Aug 2026 05:51:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:d74c:b0:3c3:b57b:645e with SMTP id
 adf61e73a8af0-3cd2fe23ae8mr13247497637.5.1787316695591; Fri, 21 Aug 2026
 05:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819-pmdomain-revert-adding-mxc-mmcx-on-eliza-v1-1-0608e7900b9a@oss.qualcomm.com>
In-Reply-To: <20260819-pmdomain-revert-adding-mxc-mmcx-on-eliza-v1-1-0608e7900b9a@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 14:51:24 +0200
X-Gm-Features: AcwNN1VEQ7RIyD8FZDlATdfFkVI8H4V_7PjBAw26wxnRmKQq2VE3dRp_xLlAr3I
Message-ID: <CAPx+jO_WgxJSyW_ZPYLrYaQMJMv6w918CQupeHoPSr7JPxqa8Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "pmdomain: qcom: rpmhpd: Add missing MXC and MMCX
 power domains for Eliza"
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA5NyBTYWx0ZWRfX5a7d+Bd7pc4r
 x14id38WGQIlo455Dm1YXO4HHLYBSnUT+P3KDOYow8fdfAjv3T454Xd3I1rS9m9xTh/3ygA87Ax
 yXkvzjr7qJ6OJxsIOS7WQDSydE1o0GQ=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a8849d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=Xfj96N0bkABj-llejB0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: bmCz0QPa5yaa5QYaEhXoLWELY6D40j6N
X-Proofpoint-ORIG-GUID: bmCz0QPa5yaa5QYaEhXoLWELY6D40j6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA5NyBTYWx0ZWRfXykpl5qr0DwWV
 rMnGZK4qGJ3DljDtcjF2u9uvotppYrMGQOC+rttIxkNlkDB/SAQcxTo/4102ryciEsmufaZU7F/
 ob47ivuLwXIEZr/56W0B3Yw1JYubH7fN1Th85Tx0R96ZRtaDX6J3UxaxTukibkKDtgP2k4F1faC
 S6WmGG41epjEiAmGwqKKn5fGa/+k08hNdfsJRlqBz5XVK0x4uuEH0xwo6CF/AjhSvIv6+6bWdy4
 7e5InaUwAxapSE5qsc4HnEyxpBlCcvhYjxjERGjWUUK51prNATqGb1K7j8WooEP4EAwBe/VrBJr
 ZThkmnSB44n6Eq3gKN19WoDvKPVtx2b1gOCETi53QcQAgF3ZP3wW3ouN+cBwrGoyBfIsybRToTp
 D8TUXLUjj0XwUxxA9Bj0ce6RVkHMzPpHN5GYnl1qubE4fBFvCKl+DHKa5KA2Dq1AWkekFqhvWTo
 wLYUi2V4fv83NUrcgZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210097

On Wed, Aug 19, 2026 at 7:55=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> This reverts commit b48a0a0a76ccecec60f0568e2af4d89994b08bec, which
> wrongfully added the MXC and MMCX power domains on Eliza.
>
> Even though they are indeed available in cmd-db, which has been the sourc=
e
> of information for adding these two, at hardware level they are not
> actually wired up. Therefore they need to be dropped.
>
> Fixes: b48a0a0a76cc ("pmdomain: qcom: rpmhpd: Add missing MXC and MMCX po=
wer domains for Eliza")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index 96e4bd2f5a14..90743275942d 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -241,13 +241,9 @@ static struct rpmhpd *eliza_rpmhpds[] =3D {
>         [RPMHPD_GFX] =3D &gfx,
>         [RPMHPD_LCX] =3D &lcx,
>         [RPMHPD_LMX] =3D &lmx,
> -       [RPMHPD_MMCX] =3D &mmcx,
> -       [RPMHPD_MMCX_AO] =3D &mmcx_ao,
>         [RPMHPD_MSS] =3D &mss,
>         [RPMHPD_MX] =3D &mx,
>         [RPMHPD_MX_AO] =3D &mx_ao,
> -       [RPMHPD_MXC] =3D &mxc,
> -       [RPMHPD_MXC_AO] =3D &mxc_ao,
>         [RPMHPD_NSP] =3D &nsp,
>  };
>
>
> ---
> base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
> change-id: 20260819-pmdomain-revert-adding-mxc-mmcx-on-eliza-647d25519f0c
>
> Best regards,
> --
> Abel Vesa <abel.vesa@oss.qualcomm.com>
>
