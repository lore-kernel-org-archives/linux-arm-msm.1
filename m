Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8139A05D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643759; cv=pass; b=R1AcSg9iO/fzOOe+WLYJN60NWYfW9f/NO9eba0mvDTAC65FYoaZeijjz/rP1Nt1DZS5b7h56IYpUjnCZ3/M6NnRen1TjbJyZaAvmIbpE1FEu3a66ixnVfkW86WzACgTCpuPvZHsHLM4Z7s0g+i5r4z7nMKoqK+MIVY2y7yTHfDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643759; c=relaxed/simple;
	bh=ON2OPEeM2A58u//0xH1UI3yOeqHVuytp13oNGd2s8YQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrY+ey7XQbzxiYunw+cANdNuqYXRTG3E52OtA8X+gzS4BSgC3C/l5S6XszMR48KNwD2vTJKf/g8w4QyrzTYo9hU8X2Kf00R6VbzGNVUEOxaEvXd21LKGVOxusKVf160VIyoR/CVUpCx9tqgOuBMmBEYpdtqVIPs/Dbj5BiYJP6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+4aCFFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIMW978O; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+4aCFFN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIMW978O"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg3BD1958622
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+yHMtgUgMUPR98O/vjDzk+0468NFDAYgeUogFIk31g=; b=G+4aCFFNe2NSI6UW
	gisxHrBykNfzsAx7WqTe49vubwh0750SQsPZjBayCu9JDR1QBJajrn/vKZ+8fMJs
	X+YcId6LbsJu7S504KzrNVkzvc0vChh1DcosusBgLE1KkuEEtJCIoQ9xpkAOsUEz
	eQra6TwUJzEtUQgNbZPUlOWwYzgXo4pYmh8tz7ffQ+WkJ8VX/YWipocEh3NHSLy1
	b9gv5LfWvYQXYUxSfe79fd02FyjQ4zUdX8f4KuGc24OZ7BUhq+KnQXSsS5FZC/HO
	0pYZh3D1+I4zq30pGJXPFxsIrOLZ4sW6XaHDCs1JQibXpIcEJCPPhW5a6pbGlax0
	jW4xfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvtvac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:22:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so1008726985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784643751; cv=none;
        d=google.com; s=arc-20260327;
        b=XOu0tlUPdSE3mwgSnw/J6iWZbMMma5m1pltC5KKdTa4ziibOS+wajzY2EFxWI2/5HS
         E577o5N1JoduEImEOa05jzX5qvE4vXyIiyytMoQxW+GDd9H1hZouMtNliBKwh723sXlY
         MJilSpRyCdOJCN9AuGDvBQ7Kpd2YDSSJC0i1nhGKHdRGyU0i5iOhni/4uSCcOw0EvSSm
         L286Hh0OhioDKhc3PHc6BHLWNhIuheGABE1gDr9j3TGKVF7jGFA5XIbbhkSsskk6U+uh
         Q++e6SIO5JQrjaxFIhWpePKL5ZGukG0z1cu7a/qlectW+93Q5L5od5yiawp9zzB5aOFV
         2DHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v+yHMtgUgMUPR98O/vjDzk+0468NFDAYgeUogFIk31g=;
        fh=iegk0PMG5dTcgyc1Oa+Za0geV7f5ey721TYIKdawIlc=;
        b=rIYoGlWPCowJ+Ai/mErcNMPTc/iTDw9TkYu/4dd1jN6UOzNgFOOJ/Ag8dtsYMV3u3E
         Sas2P+LOnFlRZVxP6Naw9UAGKMkORYQOe5ZcA5xfIKNJmRyWvPwVOMbxMxXe/Cx4nI+k
         TJH0oL1rJGDwwP+Vewmky87OV6Ifistjtq36PrenvGfI7nOq1gOsafdyGCxet2Ia8c17
         ZWtxrtdG86mI/bnvgB1yn0xuy02/YqwJiDqsFlriVKUzS6IfwTbNE3lcVee/0rVihySH
         Cyo4tUyYROunlfjTKYjI5VkmxkUqOc2BsxwZcEuob5WT48Cv/7XtDTQTl7mIbEEd8hj7
         v01A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784643751; x=1785248551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v+yHMtgUgMUPR98O/vjDzk+0468NFDAYgeUogFIk31g=;
        b=iIMW978OyNg4Zj0gB+FN7r9pq23amwoH/k+rN/tJAcgymXxAGiCj93hwCbkkoYDUWa
         EWH7bPKuFuka3+9fR3ftMAFJUa2ZgY574uqxyIJdyQa6/iXFPnqZalPKo1aSGRObtn+R
         /CeDj8S/1X7o6FaJVFXgx7AfnE4resO6b/VN/X+aWDBeNw2iezAHG06C5MdTvpsJK3Y5
         YNn96DMifW3eUgQGNNdf6N3idds8Nhx7Iy3JWRxAt7jV0ZzS9C7aHtS0jW/T8JqcC05+
         q3R+6WeQqvlKnGnINwRlEImWq8oGtbYhlDsdzblre3ahGWdz6bKakBAdC7AVN+ViRQMi
         ibWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643751; x=1785248551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+yHMtgUgMUPR98O/vjDzk+0468NFDAYgeUogFIk31g=;
        b=gEaK2YK8ZcbSn5Awt704fVq/qivyNw1WSe+MWVr4IeQDNYG2jpsU+4ZbIQQsau5KXD
         bU8AuwodEpUiPvG/5MLsCtB82rDWgmM2pLM6EKTAfThpzmuo/gvFrl5oYq4MocbdHVyN
         4b6ANggVmmoSDMvAX7SX7oDGaAAWZr9D4X5C1PXFJbAh/NCCQ9iXTsMRS5DJyt+Ezw1f
         JNZfOcUproUQlVpRdJ4+vVJopKxQ4bbywpM52hvtmeLl1a36bxBZAI0Wayj9esdga1Wy
         /UUC1sJ9bSsXDnkNXEnbVVsWGkB7s5wAW4d7N552X7yet8nYo+3Rj2maZHuXzsp8DWqm
         cW3Q==
X-Forwarded-Encrypted: i=1; AHgh+Ron9fnDKZ5OiRgsFAs5oFYcwXg9bS34MD4AQIwsrZ+60qcX0aaeyrLVseUoU39R+6B8P69FTttz7KGqI+84@vger.kernel.org
X-Gm-Message-State: AOJu0YxBD9mmONBIgZS1I2Ax5zC9Ntw3FwYm9T6AiwDWKBpYmNNjrzUo
	+kdmStRZax5W2wraM63avuGiedWEgHkSob3RUolQzbNJcUyU5KuA64Xz4JttGcUi4A5w+nfyRPb
	d1hz2kRq40zLAC4XFvjc0/1ccKicbbpxnsvKYyGK307CwFy9cLUNqgZapb7SxlPsYXOulcG97Wb
	BiouS56gqYOfBVEVF2DZrnz6n3TNcRDZU2u01+W/GqsW8=
X-Gm-Gg: AfdE7cl4FB5DU79w6JCGq3WoFTNwvzWjfB1nyVTFeh9Vox2oU8rbYGtEmQAMMUtICl0
	6kRI+yLkmJ6F4bdoG6LYahyOaR+okjN/iYokKMmtcMKuFMOLCoLFqukxq6lGsu4RO14Xws9nDjS
	vGkrkozrpGGNF1jGNHtEua/io9F9XxZAsQzEQL5Mrp1F4HlWRtsI21Ky/3wwfbZtOJobMVy1PnM
	l+Rr4voPm2MMRjnF6LMoJPxSlzpTIZcYYHYQ8/C+KAm8bco0iC+2ueeg1Dkl/oSCuUPTW3Hn54=
X-Received: by 2002:a05:620a:2b9c:b0:915:8f08:5fa7 with SMTP id af79cd13be357-930b416e816mr1589283785a.52.1784643750888;
        Tue, 21 Jul 2026 07:22:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:915:8f08:5fa7 with SMTP id
 af79cd13be357-930b416e816mr1589279685a.52.1784643750435; Tue, 21 Jul 2026
 07:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-qcom-usb-phy-fix-null-v5-0-a181e2adbd2d@oss.qualcomm.com>
 <20260721-qcom-usb-phy-fix-null-v5-2-a181e2adbd2d@oss.qualcomm.com> <4nd4f7bfliwumptfr2uykm4x5kyqd2gy7oputk7q57yu4g55df@4i5nzxl44i7p>
In-Reply-To: <4nd4f7bfliwumptfr2uykm4x5kyqd2gy7oputk7q57yu4g55df@4i5nzxl44i7p>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:22:19 +0200
X-Gm-Features: AUfX_myiysuk6IKBD47W3fNziIgtL0UaQoeOiPJy-WgUbCYmzEprNwCduDwlvtw
Message-ID: <CAFEp6-3tB5uFDnzic3WpaG0PzN85VeSKfqMYG_R5X0yQrAbYGQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] phy: qcom: qmp-usbc: Prevent unnecessary PM
 runtime suspend at boot
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: uckB4L9u8Xk5Nqe5VnslwmeiFSWJNNxd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MiBTYWx0ZWRfXwx31KRDIyCdS
 r+0uZ//lHWerJ3xv/VHllypA7PYyvctVtXzW8k5ok2l2eiEKn43HNHT4B+UlEuWG6cUePsWFfYX
 5y270t+oaMgCDEI0oibujk49P4ZqBiM=
X-Proofpoint-GUID: uckB4L9u8Xk5Nqe5VnslwmeiFSWJNNxd
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f80a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=8dKS9IOcKPRQIvt-DFgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MiBTYWx0ZWRfXz4iE97bUWDsH
 JCrMGQPsGqg+Il8oEqMEJjnC/Hg/jJ4+9Ze0ovVlnBaTiqcRrUZOYQaUa4jMBIVPGT5niGSHyaD
 ylPufM6/vhxnxHs1KyTH6buwqFgtrg0UYeNgFXwdqHmv8V7ht4YFpl8RPLjfKRKvh08n6nS5xIQ
 9th2GZX5ybEf0OP7SmZlQQGQZqcCMr4jFgSgobvenhWSRQ/OYGVx2NxsOo8gP1nWJMfmSbGMfOf
 BdZbid+JkYLxlUEk07fclRrs1wEFGOlM9Dy08aISmEpXfdKJ0tdVf/3hiyz5F39i7xnWd6w172l
 dG9nE4me6Pro5WC9h8qFliEdfUke9FRVa1n4d3eTMNKIJoY9/WP+ymA9wTh7Ondltkr/AGg6YD6
 r3pA/tb3C0GIg82tB2emb2PBNNxuH2IDtotBNTQSD0qpYVm3kjToSiYsR1sHNcVLSjaePE/S2cL
 GSbIb1uJhv+f02JM38g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210152

Hi Dmitry,


On Tue, Jul 21, 2026 at 3:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:05:46PM +0200, Loic Poulain wrote:
> > Runtime PM has to be enabled before creating the PHYs, since phy_create=
()
> > only enables runtime PM on the PHY devices if it is already enabled on
> > this parent device. This opens a small window where the device can be
> > runtime suspended after pm_runtime_enable() and before the later
> > pm_runtime_forbid(), causing an unnecessary suspend/resume cycle while
> > the PHYs are not yet registered.
> >
> > Take a runtime PM usage reference with pm_runtime_get_noresume() before
> > enabling runtime PM and release it once the PHYs have been created to
> > prevent the device from being runtime suspended during that window.
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 ++++++++++++++----
> >  1 file changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qua=
lcomm/phy-qcom-qmp-usbc.c
> > index ab3055bb5b0c198832ae06dfcd04fd34395e271d..4317224070fd8dec98090e9=
200ac7d0e97265979 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> > @@ -1959,10 +1959,16 @@ static int qmp_usbc_probe(struct platform_devic=
e *pdev)
> >       if (ret)
> >               goto err_node_put;
> >
> > +     /*
> > +      * Enable runtime PM before creating the PHYs, phy_create() only =
enables
> > +      * it on the PHY devices if already enabled on the parent. Hold a=
 usage
> > +      * reference so callbacks cannot run until the PHY is ready.
> > +      */
> > +     pm_runtime_get_noresume(dev);
> >       pm_runtime_set_active(dev);
> >       ret =3D devm_pm_runtime_enable(dev);
> >       if (ret)
> > -             goto err_node_put;
> > +             goto err_pm_put;
> >       /*
> >        * Prevent runtime pm from being ON by default. Users can enable
> >        * it using power/control in sysfs.
> > @@ -1971,13 +1977,13 @@ static int qmp_usbc_probe(struct platform_devic=
e *pdev)
> >
> >       ret =3D qmp_usbc_register_clocks(qmp, np);
> >       if (ret)
> > -             goto err_node_put;
> > +             goto err_pm_put;
> >
> >       qmp->usb_phy =3D devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
> >       if (IS_ERR(qmp->usb_phy)) {
> >               ret =3D PTR_ERR(qmp->usb_phy);
> >               dev_err(dev, "failed to create PHY: %d\n", ret);
> > -             goto err_node_put;
> > +             goto err_pm_put;
> >       }
> >
> >       phy_set_drvdata(qmp->usb_phy, qmp);
> > @@ -1987,17 +1993,21 @@ static int qmp_usbc_probe(struct platform_devic=
e *pdev)
> >               if (IS_ERR(qmp->dp_phy)) {
> >                       ret =3D PTR_ERR(qmp->dp_phy);
> >                       dev_err(dev, "failed to create PHY: %d\n", ret);
> > -                     goto err_node_put;
> > +                     goto err_pm_put;
> >               }
> >               phy_set_drvdata(qmp->dp_phy, qmp);
> >       }
> >
> > +     pm_runtime_put(dev);
>
> Should be _put_sync() ?

Well, yes for avoiding inconsistent state on error path, but it might
be cleaner to move the async put after
devm_of_phy_provider_register(), once we know the probe has succeeded,
and then rely on put_noidle() for all error paths.

>
> > +
> >       of_node_put(np);
> >
> >       phy_provider =3D devm_of_phy_provider_register(dev, qmp_usbc_phy_=
xlate);
> >
> >       return PTR_ERR_OR_ZERO(phy_provider);
> >
> > +err_pm_put:
> > +     pm_runtime_put_noidle(dev);
>
> Why is it _noidle()?

The device starts in the active state (pm_runtime_set_active()). Here,
I use put_noidle() only to balance the PM usage counter while keeping
the device active. This restores the runtime PM state to what it was
before the probe (pm_runtime_get_noresume), allowing the device to be
reprobed from the same state.


>
> >  err_node_put:
> >       of_node_put(np);
> >       return ret;
> >
> > --
> > 2.34.1
> >
> >
> > --
> > linux-phy mailing list
> > linux-phy@lists.infradead.org
> > https://lists.infradead.org/mailman/listinfo/linux-phy
>
> --
> With best wishes
> Dmitry
