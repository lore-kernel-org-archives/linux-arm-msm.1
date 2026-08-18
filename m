Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E34E451982
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049533; cv=pass; b=Fm0pKimh+Ugl07BZdNkLD1N4NW9UluWVN4vDd4BQapO2XzcnfYWCwllrwiswExSKOMPKSXk26cI9YHiXSpBK7MYkkBYH4iN8fHq3yG980Dyc468HKifdgpIouPgqiF+qrjib1UKx7v6GNuxj/ETLrRuFnSny7tX6tqae8Qb1zOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049533; c=relaxed/simple;
	bh=1CVz3hAYow20HSm0tSRp1klLWOhMCBPnoNEKix6XrK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIdvXeyVMXcYrxsFiwyaAYRh/LY4p+saslxkkDduSKuJW+I62fTQoX9j5ilxFOY8xX26mdsNjAAkD2bDrzZhRN0lVW7qfd/FL07p3qXnwVyASq8O58TRVkpALxhIc7c/5uiPquI9ZU7T3fWijEAPBtk3cno8HbfnqKvvnYlgTXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQlYb4yM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPFLGCjg; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQlYb4yM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPFLGCjg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABZWF3979100
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CVz3hAYow20HSm0tSRp1klLWOhMCBPnoNEKix6XrK4=; b=pQlYb4yMZzn2IJG0
	FJ2vUPGPjViQyPuidqkHk5M/yY0eyoZONKi89SME7C3wk69pxAsD6amheW8asxnK
	dIi8wJMGclibgRqDQCj/bLy8c/paBhLs43g6VCNOA7+1JqViI3kD9ojCPW7iV/NV
	tO0odnrWCyyYVSmWfIKvUnGo5PivxNw7kPJHT2dQZ4kFWiwCte6xBx3UR3HLPQvi
	ZA82tjIGtsjNgch+uj6TI963RYg07O3ZGVqlQOygkMwDsAi+Cim0KjFDELjrpAVb
	600Mv2gNim7xoKz+KmfX70hsRlAD0juVyFq5MbG8bNE9kod3SjScLB8cL0TBE/ej
	fnVD2Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpt06e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:38:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso3219907a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787049530; cv=none;
        d=google.com; s=arc-20260327;
        b=kMGyBJe0vjwQuejScvLjGme7D+FMahl8kO57BDqUqBWcyTd4nsZ6FqbaVGbXoOvrtY
         dLN8nUruq2L5GJLEP/oKpRy339KyALV8jLmjhvr9e8TJIyndPGPp1qFroIQViww2R5r4
         UC085zKcZ1YfkB2P2OoLyoAPSW0gtn9KIbayJgeR1l9U10FfiV3JgorVhtufhx0SB7z3
         O15PWtFHiidZdmaHvvLlfrSogqnm60x/QRKUq3ZehGnn1n4w8eOfyvqDaOIAGLkFkLZ2
         JUlK+VTCYZfZbTYaZ7d9KbUh7FLLwrzo9ZiNqGvtpWSVh05j5FXrkC9l35mmErbUQXE3
         hwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1CVz3hAYow20HSm0tSRp1klLWOhMCBPnoNEKix6XrK4=;
        fh=jVLUgXHndwLl+go13vGEaGhuAaoyW0X4HVZg6gIfBPk=;
        b=p/u6yl17bS05oo10PClgIyUA9i3tHv0JvZP5xthy29dc1I9LRUD8Hm0+Ih/wS8NJhh
         pXZ5EhsWHmUsR9NaECLoTE/+MYzXgqGay/M/0Vzm5JwmbROzD5Mwh/FsEPfoA9t3nvqs
         g6WkSov9nv+tEN7Btht8x8JHItDRNnGBRUuBwaL9HL1ysuAbpnDJguCUZxKcumWLZ4zG
         ADyYq4Y54h6Ykup0wKU+wirGsUlFRTlmpPnK7DRSjMmmWhVkc0oeqcafOEsDRSBGf406
         +U2ueYuu3e11El8/bAh/6saCcfzboSrFEhlrFX2YEglG86fcgvwn4IgoizNQ2pNXwGH2
         sd6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787049530; x=1787654330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1CVz3hAYow20HSm0tSRp1klLWOhMCBPnoNEKix6XrK4=;
        b=TPFLGCjgVpFHfqStK7oB/CgPb6MRHjgg8p02/3ZpufAQ1rvQoJQrhxcL6LNBuYSWvY
         wygnIKYTpZ5NwsQXXqVvbT5SuQMIvInpPnnzthQIO2t9Fd5SyhoICpFVKGkmEWpt5X9n
         0ZAlsEqyNTzb4nSDXyD/t0u33J7c6G5ck8CdIh3QAybpAtOkzK/jfUiO36PbE/rKQroW
         vXB4ABApY6Mo4xg8Zou6vTorkIj5uSkDqimeRR+MHTxWjB9t194F98Qbat1kmsXoiz5y
         PrGYcTEaz3OsxVowbtCMFxqg4mjq3WN+7o9OHq7QFJd+/8Hv0cfaJWouvdQjanh/QiCA
         y77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049530; x=1787654330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CVz3hAYow20HSm0tSRp1klLWOhMCBPnoNEKix6XrK4=;
        b=fsBhEm++wk0I0HfUuV2RlXbjMiOJgR1MVxfqyO4XL+VVSo2RlQaxtycSSKsFE58lux
         SsC9/52hTDm8IEtOKE3DZnKtAmKfax4KuOaQrsR7Rz5mIjO++pX6CylW0Lw5Vz/qYD2m
         BWVXzB7Ws0N7d+UxU33Oc7ow2ULUwrXmOj/WkyOVFi+qPGZr6873pWLYH4a2Qgzb6Wkw
         CDbUKacdz9V6VPkDNE1xN4ovgpKEMIGIHgzH7JX32FI4LTUjBnTdtQmVa4xWUJpYmggP
         6ZiJeAPiBeCJAgOeEgYTL+H0+Gpmv3SIUaHXn+Vmz8eAoQWKtxI3vPV6tMnIAboY5PqE
         GlIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfXCelRiTGDkc4BbahXhRrbZXcSETbXPMJkljdyAE7FFKs8xd0HTGvLC3qWxo+eWeics/KNkwWoX+0u+sP@vger.kernel.org
X-Gm-Message-State: AOJu0YwqfukYeJjFIEmOvWpyWpW/WZzIUkfk/6nxZ6E5Gkq9ytviCckE
	Tw+RAOM2txmEC8DCPQPtfP8CfwndkvaDyWjGFpyA+IjHKmr659LEjYQUjK1qZQMDxfPQ2Ppk3H4
	5Qjv11DkdP7UO1OTa5neQwrzH2jg8quJhFd96reQkthv3YoX1BUtsDNBKA8rSgR/Sjo8pVg8J0S
	eNLC0l1j/h+bW0CIzehYt6imjeiFzTXDm0xTd3/0seJPM=
X-Gm-Gg: AR+sD13UzGo3zJKCN7E01GftLjbBoJIPF+cOAVN0J6A91ZFhIihIR8+6UjZpp9iyne6
	2HoefqU76dwuuoc1Bi6XY9VkBO2JRTyh7/zFcaWU4qih3ale8inqCupzGZunbJiuJA/6IKvYUwT
	z1hPpbe1yaMKRIne+Kjk0pndg74RXcK/LvHKBZNyfDK2K68wLZX+59jNcIDw==
X-Received: by 2002:a05:6a20:d48e:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3cc7196e77amr37620440637.1.1787049530199;
        Tue, 18 Aug 2026 03:38:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:d48e:b0:3bf:7e2a:e874 with SMTP id
 adf61e73a8af0-3cc7196e77amr37620360637.1.1787049529688; Tue, 18 Aug 2026
 03:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-pmdomain-add-missing-mxc-mmcx-on-eliza-v1-1-5e10fad1e456@oss.qualcomm.com>
 <CAPx+jO80r_QF-hqGuRV4BnHyKoub3+j3EPbnZ81ejz+wKBBQ+Q@mail.gmail.com> <pzfjctbfuqghiluu6w6wteihsx55xudursi2ifsqylqgc2jgux@b2rgwlctk2l5>
In-Reply-To: <pzfjctbfuqghiluu6w6wteihsx55xudursi2ifsqylqgc2jgux@b2rgwlctk2l5>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:38:38 +0200
X-Gm-Features: AcwNN1UXPll6Az6-ppDKFHeuBDQLmewrlzUPgiEzvE3myePAINc1EBBa49-RPa4
Message-ID: <CAPx+jO_1bierRx=+qErQD-J03jRbYeHsPD3NXkzMtqRj_zvKYQ@mail.gmail.com>
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
X-Proofpoint-GUID: PZOmbNlkjTfYOS_XQnALYj1EQ-lzeHyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfX9/7+uDRJL+HJ
 lWjiXlJ/2XacyMj/4AE4B91TSrz1738lcfLKFKPVOn0gYYPrSNy1OaKW4waYjVjvFqDR+722Md1
 DOxACwH1pCf6+QWmdd5KbSQ0aR/h8bksok7HyhmCYNg7FyXef17rT5Z2IkyR1QaQrGfQTfg0F1c
 MXSKI99Z0OHHNZDCBjpklEcu2QZHhxR0XLE1VXdNubm5fl/te1f3kzjx+Cas+pfss+T18DINEdH
 ujKSjNgWenpJC942pkqTOQRuD4JI6hzPBuEJzeTySJ8CNnPt9BX3Hs6xI8S7psRxtc6GO2Ljuf4
 Wz+vm1yi4l5knEI7CfUIe13eFUnCZYNbYz6I+hYjKOyveZ7539iq4zKqdV+3CNzTtL1mj5+ORYT
 G6blNboXmAOzpYMLv4zFQBSvgT6GBirFul+akUvPJbtDwRESTBrOY3egFZ5NL4Ejy7fzFeASv5b
 +H+jO4/0h34FmuwYfEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfX7olImmX93N0a
 NYweZwjrby5t5A5xgPq/NYpu0PiSwn+EWHsLyotvh2W5sT6SoxyV2b2Fb4t0fQaM/vE9B1PTGrT
 qsG114dUCf9Y+CMxIVWDDD15A29OC8Y=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a84363b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=ibMsrSw108UUvJ17cHEA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: PZOmbNlkjTfYOS_XQnALYj1EQ-lzeHyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180078

On Tue, Aug 18, 2026 at 12:00=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.=
com> wrote:
>
> On 26-08-11 12:30:42, Ulf Hansson wrote:
> > On Mon, Aug 10, 2026 at 1:10=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualco=
mm.com> wrote:
> > >
> > > MXC and MMCX were initially omitted as they were believed to have no
> > > consumers, and they were not present downstream either.
> > >
> > > The Iris video codec requires these power domains, so add MXC and MMC=
X
> > > along with the MXC_AO and MMCX_AO.
> > >
> > > Fixes: f387ecdd492f ("pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Do=
mains")
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >
> > Applied for fixes and by adding a stable tag, thanks!
>
> So I think this one needs to be reverted after all.
>
> The MXC and MMCX are indeed available in the cmd-db, which has been the
> main source of information for this until recently. Also, Iris video
> codec bring-up engineer thought they were necessary. Meanwhile, after
> discussing off-list, it has been concluded that these are indeed not
> wired up in HW, therefore, even if they show up in cmd-db, they are not
> actually there. So I'll send a revert for this soon.
>
> Sorry about the whole mess.

No worries, please send a fix that we can queue as a fix and for
stable then, thanks!

Kind regards
Uffe
