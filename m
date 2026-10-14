Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7D34CCDF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979760; cv=pass; b=kc45RvndGW0bKCUR3tZxNq2WONWI4LVV5WORI/okrIxHRUPF8vvg/ix3+v3OQCtFe2xqKMmJqBbPw22AWNYRdEr8Y0jPw2org3bV0nOoSmgHWb1CmsS9Itanrc1H4tqnwK7cBvQW8mzIhd+jvgrqSKq6TFEZ/G1Dh/L4uTyJLeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979760; c=relaxed/simple;
	bh=0Km2hjglTI0X+tZl807cztADcm592MfLOkQaEkTFmD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzpYskb1sYXqbo/KstCn/EK+2AXRbk2i0sCfaOn3wN+v2423quThnpbMgw8O02jcxXSJTgZ2ax8ZWtvwFeCOTRwF3xHT7rQj5ng66+2OhmfyF0PBMxg7kbPnk2bJxBsjDURIe2Hgc3jHOGFpa1HniZmBcKvXy63bv2ozIDapk6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMkbZ6H1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cpjrTrgd; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMkbZ6H1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cpjrTrgd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7UBir2874286
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DwK7hhl6w4I8+nC9U8GUjFxnUEfojoEfZSMaFU5Jtuk=; b=XMkbZ6H1z4YcaZ3n
	0fFqJ4bSir+zWDrdxCEGdlOSVxwC5hr18CbuaVvWaeFJO8zdhEm4Q3oCO8LZXFqt
	CQSQbRkUIeb5oiovZEHMOhD6oE3eZJG7kUMPsbicQnsVTO7byqvOP6vxdexdodMj
	FDOjTb+WJeo8RSe9VUs1f/4VFYvAl5Ihi/+dawaEUTx9laEIB1MSie2EWKmKlyI2
	3jC551CxHVQgZn4xdsNV5iUsBv4WCxjL6GJHIDo9lM7+YeAQo8raKzIQJ4Jku7E3
	TCIwzeJrcl7L7qVQRwAHoZwVTSNEvfKES2UxqA8YUcMdQ0BpKeLM7vts+uS1/Iyx
	voEagw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphjee4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:09:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso828999185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 05:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791979758; cv=none;
        d=google.com; s=arc-20260327;
        b=UUTW9JMOVjkJ2qsE6gQ25QXPkyrxMCxIce4xKSZ8hwrc8QFhpog1nOxKnb36U/5eJZ
         csH2h7jH2AvpaKtLF+sYwBOc8x/c8DYFebxYMaAiFFxWF6bAgcVDQfgkBhDbWEH93R8V
         P102FXYGYpzzs/4BiKgjF9RweWyF8GqLO5SxuXCg7By49otFukEjTqNE+2JM8TdS0lVh
         Qgs6cGTEc7cnVv/34eGOxV1yZZyhZvgKkF8+S9R/SisWMPu43wF9rSZm+2XcDGSuCEYz
         AC5x9YSPbOJ7IJpJxo8T1MA+53+BTr4bqMTZikzEUCJcnbmPHjXKf226VbSOfQRfwQcY
         dofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DwK7hhl6w4I8+nC9U8GUjFxnUEfojoEfZSMaFU5Jtuk=;
        fh=+6oK/BPobI0XMeCicRpA5yAz3ptvnS+XA+ldDL/+jBo=;
        b=PxBj8gkbOoKneiVpXd3qWLJHK8va4fQmOZTPCYIY9NZ/LefGNwJueilgd8JRyDgoFP
         bC8oO1a+YVmpxGWFcERIE0jMzjAeziSu3kiGuxOj5hyL8rjm1GnoMZct4aqudkHLZKPH
         jsdG6HFeMU+cTnbG/of+L/HRJSLA+jqdkgfMh/9F7Hl1h/+veMVfULikqlcZsAhaPV1d
         NmMS6bz62FTskhxzRgTUaWUojrrW6mKyr/ixLJB8uuei8RoAxcDZ9A8X3k0WYUhniJMc
         MM0yeo5qb84oiPGAdlwYd1eIZBTYpHHB8ingg8CMCxAf3V4jmxEJ0ZyRtYTstRdUPa8D
         wnbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791979758; x=1792584558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DwK7hhl6w4I8+nC9U8GUjFxnUEfojoEfZSMaFU5Jtuk=;
        b=cpjrTrgdC06aUtGULIO1L9ATg9j3WyZlni/+7EYjH2XjoSsXgEIdm0Xu8CRDu1Umkb
         FacPh2eQ+u32Wy2Vq+UUzM5IjvSkQEvsyHUO9EK8QesO8u6kPJORhJ3Ro2XIhK4gtpp7
         v2/xG41DN5NoWw9Nu5CT6q4VN6tN6ZWLldeUJv6PyZxXFty+3XLrnh3UdXmXKllXxjKo
         VYeFHns8q0QEGup+dZ9biHHnr0V1RuszSuTZXNjuesXSWyXuQ613cr8XIfjNPFQRWW/S
         FDxc0dsF09X5zdm4b8ndp5jTVj9SL5u+DB70HQ98URC67RNHgfhwxtI/rgKe65IuGbsm
         Fr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979758; x=1792584558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwK7hhl6w4I8+nC9U8GUjFxnUEfojoEfZSMaFU5Jtuk=;
        b=xKI+7KVOYZ5lPfo4dWRRKeUjmNZTt80ot8pHz1d2EdDvglTVG4yQS7KPS9x7yAO7fo
         SgVVns6R01c5f1CMW+R3KOZvAvH7KybfE/921lsYwZSKnD0zRFteoA8ie1bPxfDnekL2
         3eR82QiX4MhtbGC0e/lpZL1w/1DTbdo3psN8SDY12Psf1WUV9No3FEd2Le/ffC+Txbhn
         8iomZMX2nce0c4NBDNPH5Nzw+TvwYgO2ZOVVCF1fsG1FzO74sNwvwebFuYr5Zyh1UsWO
         WMdl2b31APSGGo/CukQJsvUQOP6ZqcgdDoU/LA3mGFUNAd9zKa4gGOkbcfUMsRFt70S+
         5lgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLx5Y/dGs1ptUqMJ9Np5EI36tkOpgoX7fnPToadBTkZ1nNGyIcsFvggEchcJTg+dGD5lVUQdBbsAOZESYF@vger.kernel.org
X-Gm-Message-State: AFq9FYIHEqoTThEaA4JtXPnjGGCIHxxYszK75tQFaXd1AGADBuM22WDY
	f9B57vBWJPhnkn7gPGJdbmCxL4FTW2cwNj9P+7o8iOx4p6vUYf3PVIFk37AXRqjMrrAym2cCRij
	7mAvmQQxvw8xDPtLTNW3B3kpFNHKHyw7El0mw2AXMvT9+/iFMWPirUqnoxD11X74bsgYcmb18Li
	PnjCoTQKZbkHBRvA3yDgGtsAi7TaoUKKxFrJb3x2D54Is=
X-Gm-Gg: AYBFou1MpD0T/w2NAzAstVIzA9CCTwAU4WU5IPWzvfHEcfqhOpRq9wP1dVRrpkt/Olf
	OJ4816HVTjn7K+mkIr6IEluyMFbvMz9d3bId0Xua0FeFFRvMZ0+DcdtCSNfPOMTtMEA+EmWbzZU
	ZVuPUdWA5ddTf/MF5QfWG2QHHD/s1xzTysipN/NdfNGP/BwIpefW0jU4ZIvuZUHKLtNaycezytM
	5SH9dzcz0GRob+2he8oyGDBUJN/rNJXYVzZ444dRHCvgAO9hU8fomcmyZr9DllKGdSvv2WRnYH2
	WQ/sOKGS5e9GK1GuMjoY01oyNGSx
X-Received: by 2002:a05:620a:171e:b0:93e:5247:f61e with SMTP id af79cd13be357-93ebd228a3bmr2658573985a.25.1791979757773;
        Wed, 14 Oct 2026 05:09:17 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93e:5247:f61e with SMTP id
 af79cd13be357-93ebd228a3bmr2658565085a.25.1791979757031; Wed, 14 Oct 2026
 05:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
 <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com> <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
In-Reply-To: <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:09:04 +0200
X-Gm-Features: AclHuK_6me2-bpjZvRwlul00xDJ8S_mO1DUnyfvzcWigNvRin-2Uq0Wz7yOgmmc
Message-ID: <CAFEp6-3YP29y5JYp+6Cw3T7bGEJHjfGD9mYsiQXGaTSegsMWXQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power domains
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: NYHsJ8y_ay7k-R2XlyDKtYY951O0QAW4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX6mXBe1L/NWVh
 sLxqL7GaUUCrSFmOh4brqM66g2LsYfa6Lz84lO2XlLqBSGWJn2rZQCa7IERTPiwuUVe+HLkySX6
 lt5B4Ae4lNdvJ/wNP8Ox0VP8i5d2utI=
X-Proofpoint-ORIG-GUID: NYHsJ8y_ay7k-R2XlyDKtYY951O0QAW4
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf70ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dbYQlMB5Br7l-mLdANsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfXz/HwzoxWkOQ9
 NtmI/mA/An1ZiM2ons3hCPQbYLGsMeF68YLSItBxPdtlTe1J/2Hj/Dv2xKg0UVxGo9Wdg8J3JvV
 OeWLq0zoPlWQy2tD702gUf0PuRV80BcRUQVBK5LsT5H1bJkS4b8mO0Bo3PUuckgs7nDtdg+SnWz
 UK3K8QuktMlUOrzAJn+v/jGxZ2vAVA3TkTD3BVrdyC3R6Re6QqbHi/FZRGHjJCplagl0NycJ+LQ
 rjdpQoiWGDI/v4dd6XOnQ5RCwyRWXcTA/1Dp00YSaG98PY7VpdtRhhhMxsQYY+AWfXwq6VEjcz1
 8F0FN961rCCPtRcHvbQwQz7ZHa5go/X4r3Z6UUHLzu1L1MNaeuKLStl/RJMomCzgjOTvxDYC7El
 fhMmy0EAfYR0OI3rT3yy1Ur2hbIQPFWAGPd+Z6bHQJov1fckJPr3MJPXbXCRWCQkiYwukCKA2sO
 gTvrCrQP+AfhkvJPybw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140048

On Wed, Oct 14, 2026 at 1:59=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> On 26-10-12 14:58:43, Jagadeesh Kona wrote:
> >
> >
> > On 10/12/2026 1:29 AM, Abel Vesa wrote:
> > > When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> > > gets stuck off when powering back on, preventing the system from resu=
ming.
> > >
> > > Use retention for all four PCIe GDSCs, as on SM8550, to preserve thei=
r
> > > state across suspend and allow the system to resume.
> > >
> > > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock control=
ler on Eliza")
> > > Assisted-by: LLM
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> >
> >
> > Hi Abel,
> >
> > Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and th=
e GDSC never
> > collapses.
> >
> > For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering b=
ack on), picking
> > the below changes from PCIE side helped to power ON the GDSC properly w=
ithout any issue.
> >
> > https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.=
qualcomm.com/
> > https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasiv=
am@oss.qualcomm.com/
> >
> > Can you please try if above changes are helping on Eliza also?
>
> Thanks for the hint. Mani's patch (v2) is already upstream, so just enabl=
ing
> CONFIG_HOTPLUG_PCI_PCIE did the trick.
>
> Suspend/resume works fine now on Eliza, so this patch can be ignored then=
.

So should the retention configuration above be conditional on
CONFIG_HOTPLUG_PCI_PCIE, or should we simply depend on
CONFIG_HOTPLUG_PCI_PCIE?

Regards,
Loic
