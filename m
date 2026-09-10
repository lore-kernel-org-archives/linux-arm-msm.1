Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A514A091C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050036; cv=pass; b=ToSgAlTuG2+CDTRKhAxifCtmuOuU6GUjYE6irrTyci/lsSRcERxWJHVZvb7gbzDwflMW7EqvL2gW6yFLtkfoyfnfzkNb7O4sVL5TN3ZdZvkdBNavygmF3biS8V0PKurHzvEUEJ96LY9reHkNrAgdKuc3C6u9aWlq0AwosN9llhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050036; c=relaxed/simple;
	bh=9QJteI92RwPPdOMUgnNnI7QviKfuZP58/utp5AmqgiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZW0j3N2gUU+HJhAm2U4XG8AcjJcA6Ccuco23jKgCl/Y3beGGEC6BYm2ycmqF4UTeivr1dxBSVaEOd3dwFpvIvq6N6vmS3U6wr+WdJ9AB7DnAb/SJUHuq+226f7dzGHX1a5hKFNdl1YrnyPAYK6okogJnyd94Y9GKm3nwUgAybz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEl+QYBj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAXs9coT; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEl+QYBj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAXs9coT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AD23XT2149848
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 14:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LzPgv+JUw7blI/3j2Lv9Lk9a
	WSnQjmSVlk9jgF9EUWw=; b=TEl+QYBjvKr7HpD3M/E1C0inzzxT3wPzMBXyaxhQ
	JS/k2+jCEgSrZI5BXgXVlsRw8NSb9S6vwE+BV6TNPQgVtJ1i/VGUYRW8xvArJpBb
	/FExhwovNJjR603crm8ThBG4bbHouAHtaZpkFVtj6BKT+ii/rzl6nGDYwhdmj4Ps
	/vIW9HOv7ifG3YpVyTiyfvPIMG12n812GMt2C72XhR4SfIJeR1BK0QjC2mRH9q8H
	CX8pRnTA46axH3If96TmEpgPN2r7k4NWxWdZR3TEf1+tKv/S3/XwAl62V2FMl6ZU
	XGM1IaoqCeU7iFyUzmBIrAeE5yMqXRYPbUS/inILFhZTrw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc95c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 14:20:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d959904658so127794055ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050033; cv=none;
        d=google.com; s=arc-20260327;
        b=H3VIjwvTZTkiDseSI5rQ74vHbSwjoDSqX4o3q57NCcbtzAcYe8dikuLfPQVtbx5rcy
         1h432fIeeYL5S5b9YXEfhwrguDILb/ERgydQOJ7F+mJH2jXNHvO5Kg/p0fR1+5n8D2dI
         7TK7dvxcJ49bx+73o45AEF4Y78C8L0t95Hfvk/328+VAU2uKz0mYnEhkFppoT7k07kdB
         J9sJ69ReSnBkUJO1K+brqRK+BJwsz6tT/qbCNE3Nx9FD+ZRYFit47T2jH5wwSksJIiE4
         OvykRB70VuYXJWCryOJ17NflYS+7RqP1EZtGKy6C+AU/xmNJjQX5OdqxO/85kK99zAer
         U0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        fh=EcisJNhhc7hmQZK63sQhzQYpZAkUWYfE2zNAOFIDRzs=;
        b=IIz64c2SLei8Qeoqs1HAtnr3w0Ms+VDgdxp1W0iv13XkeDUtqgx4Js5DwTJ5t0uzVB
         ffGp7IyTqFplDPCYN0KrPHJWmGxExwbQ8zozfzYkYPPeeMwZgrAsss6wEI9C/p/QlP1o
         cGkt7k2KFoU8B8oso9nl/SjGsi+MUqdlSY3Xy4YJkzL3X1bffEFVo2ofq0clS1IpeiHc
         F0wdqnRCoJFs9AjwsWKDPY3BrVWF9K4rog4iLyR+J7RkQV4op2pxTmN/7u5+jJO7X6LB
         HIMMagnwJ2U7/Zg1EuKop1voIyox2c8FzNLzVoeFtmzQEPe5ZkNGXd9lsQZdS5Y/n6+N
         jTag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789050033; x=1789654833; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        b=dAXs9coToLt3v4tlmPD5kTsRAcWIsvQhWsnT3tkeQnZjPaw+ucQ/k94j8r4hVjVx/5
         wnx4m5fXrGHoxKQ+z6+OMHpcxdA6V4rJCpzKeYMwPTQqNT5X18bWg2AJaeE70ILNQGFF
         fBEwXtJTknW9rKBbzzTqbeB0oMLznYcn3nCZ4BAaukmNfFBT/aI94y60pujr2A5tcbW4
         YoTBg2dp0n7vvIcGss+CRmqCEoXsIP/06cAdlMpIBNEl6hyvks7Kkbl/bYzsg14S9dkY
         wGkObUjgaw88DMR2nwApfwpxYhBq+58djG1Sl+GEWGkroWo/chEkAERkbTyUWeaMsXtS
         alcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050033; x=1789654833;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        b=fkHkHEVcfiQjXL3mK+44PoHoGnwQfpuMVMo5cc5is5mmPharw5NYb/jAC7waDWzdMO
         qg/xKsuJR0BBGYX/jWp+hhyO17Lkizg85IudL5VprkM7Y6aNjh7JbXOBjIdje/y7j+Ov
         SjNqDSi4AXWE+KE0pgGiqXYeR+2uDa0lsKW3ibWS6NApjVDLgwRFuS7vXqzv/ebW/+4u
         a1aolXXysDtg5wGFHXqW842+j7BfK8lXIkeI292xJrM+wML9heAOr8wLMm//Gl4Ii/Wv
         6qIDii0JwUIQsakKqKYSHDFXPmJiQ9jnzAPBXeCiBW0oX8kqjMyhIEtF8vBOF3fdjo6g
         bQEA==
X-Forwarded-Encrypted: i=1; AKwUvByPzNe2/Aqr/Mnm4UzzT5lCmhDkFXo+NkKVxxO/Dx16Stp0hcaihk/ISYOghLQfNSO1SI4Ba+nc8C/SVxeO@vger.kernel.org
X-Gm-Message-State: AFuF++mGhSkdthfMAD7gk0qT3nbBybN4WNkiqYgdeRF7l9mtvoIXOEq+
	UvGLc7EWWhxV1ghYrX1Xo+mlzR+nKqwNMzI0aIjQ4bojM4YEg4lfolHHykgzpTwfYlnS4yLxUtZ
	9eMN+3rR6F9Qgr1hegF+n9w0C3CG5cavmqF+FMpa9M1++xCaLW03yKijoDSV5xAksQerOadLVlU
	Cj5WCbq2g/8miOfqpvEFNejtHUUKxT24I0jQOUhz1gvNFLBWpJxwU=
X-Gm-Gg: AYBFou2EtVpY4e7jkaXv3EPTT3qUM+Ug6sRRer3cChaCbbUGDE79mSDbsIbLJPEjojW
	si+uivwE/drEaSwr8r8UCPnDrFjW/LnYV6qCHBjucqW7lSAb2+UyQuJFtQzt4XMJGHPbvciObxR
	xmTLQWUWAEXEdsblsDNsxu/3Mr38BdadjsayIXGST3ssphkIEVhbTp6qjHJlPzLLl/uI6EphA=
X-Received: by 2002:a17:903:3d0e:b0:2db:2c09:98ad with SMTP id d9443c01a7336-2db8dc82407mr200794285ad.12.1789050030732;
        Thu, 10 Sep 2026 07:20:30 -0700 (PDT)
X-Received: by 2002:a17:903:3d0e:b0:2db:2c09:98ad with SMTP id
 d9443c01a7336-2db8dc82407mr200793205ad.12.1789050030094; Thu, 10 Sep 2026
 07:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com> <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
 <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com> <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>
 <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
In-Reply-To: <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 17:20:18 +0300
X-Gm-Features: AcwNN1VVA4SntoL5ZvQXqShw0ZuVR288fdr4bQQ_lWLwdYYaNA3KoOK8hgJ80N8
Message-ID: <CAO9ioeUEQ+kzBLj3KTv+uayaE-5aw-aL49-0pJ-x_Vwq4nu9JA@mail.gmail.com>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfX6jIz5Pmq0IO9
 VthF1f3Q8MDZhuUC2RTgOnO3vYM1hti2Ak35xgODlITay+nVBHUFe5KGyo0JQ1Bf2NkAeIwkTv6
 /rXoaiOTxpMsnD7r+0hV9y8GaaJ4rwCRM2xlN+ECqfwCChOJSKmXBgIneWE/D/XfQ93HQilDFw8
 MHaD/EEixDCAix2P3UpcU+quen9hKiBKXtzNBXBQCFPYXoamHbXt7rHIzkXGpCZtoojvgpD47rW
 GrwTnGVvolEtX+sv3FTS9gRDk7EBb98/r5NtF0m6l8bil4/lJXfrn9LLRSbkiGtjstKHfTFrVIm
 dOjOZBNU556eeuTKt2KzD6T3uNLXQLn4JXpAHmdK5H9evdvZOcxeg3UJuSrqyytrm676/ofkOEi
 N990XS+v1Lqx+O15jNVPQTcCrYkiNqrOrwueRYp6ZMOKO8lEv3fGICXoZ+P+0/61m8LDZyPzJAB
 7kEf89kny98mg/ERhgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfXy4W0Id157w4e
 eKL45pgeJb8DIo6zRgOxySghrMn9mwkqMNcauZgP3B4TqmEby/eIMnKpAOvLYVvhDdKx7aC27j/
 MDmII6x7wef/oQ3ueeryVdwtXCC93CE=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2bcb2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dlmhaOwlAAAA:8
 a=6H0WHjuAAAAA:8 a=YxQatw1j_ZWosVD_vr4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=y4cfut4LVr_MrANMpYTh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: NhSwwcS_IyuQtSt6gseg11TrrnONdJCl
X-Proofpoint-GUID: NhSwwcS_IyuQtSt6gseg11TrrnONdJCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100172

On Thu, 10 Sept 2026 at 13:38, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Hi Dmitry,
>
> On Tue Sep 8, 2026 at 3:28 PM CEST, Dmitry Baryshkov wrote:
> > On Mon, Aug 24, 2026 at 12:04:57PM +0200, Luca Weiss wrote:
> >> Hi Dmitry,
> >>
> >> On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
> >> > On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
> >> >> Hi Dmitry,
> >> >>
> >> >> Many thanks for working on this and sending this patch series!
> >> >>
> >> >> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> >> >> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> >> >> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> >> >> > spec, however they differ from other Qualcomm platforms in the
> >> >> > implementation-specific registers and also in interaction with TZ.
> >> >> > Venus, MDP and VFE SMMUs are secured and require programming only of
> >> >> > CBs, while GPU and JPEG require full programming.
> >> >> >
> >> >> > This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> >> >> > and adds only MDP, GPU and Venus (although untested, it is required for
> >> >> > display to work) SMMU instances.
> >> >>
> >> >> I do have a patch series (sent years ago to the mailing lists as well)
> >> >> for CAMSS so I can definitely test this in the future.
> >> >
> >> > Ok, let's land these first, unless VFE IOMMU blocks display on your
> >> > platform (Venus was blocking display on APQ8074 DragonBoard).
> >> >
> >> >> > Note, to get display to work properly one fix is necessary, [1]
> >> >> >
> >> >> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com
> >> >>
> >> >> I've applied this series on v7.2-rc7, with the extra commits between
> >> >> that and linux-next for qcom_iommu.c backported so that your series
> >> >> applies without conflicts.
> >> >>
> >> >> So far I'm stuck with the GPU not being able to probe, adding some
> >> >> printk's shows that in msm_iommu_new() the call for
> >> >> iommu_attach_device() is failing.
> >> >>
> >> >> [    5.971154] msm_mdp fd900100.display-controller: failed to load adreno gpu
> >> >> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000.gpu (ops a3xx_ops [msm]): -16
> >> >> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
> >> >> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach to DSI host
> >> >> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa1 failed with error -16
> >> >
> >> > See the patch [1], it's picked up for 7.3
> >>
> >> I missed replying to you, with this patch the display lights up again!
> >>
> >> Unfortunately the GPU still seems to have issues, I don't have a log
> >> right now (I think even SSH was dropping then with a bunch of log lines
> >> appearing in kernel log on screen). I assume kmscube + more complex
> >> workloads worked fine for you?
> >
> > I was mostly using kmscube, but I can try running the CTS once I get
> > back to it, sorry for the delays.
>
> Yeah, kmscube doesn't even work for me.
>
> Bootup works to a tty with screen on (mdss doesn't seem to have any
> problems for me), but then as soon as I run kmscube the device shows a
> few errors on the tty0 on the screen (USB stops working apparently since
> my "dmesg -w" doesn't show anything) and a few seconds later the device
> reboots.

Interesting. I wonder if it's TZ tripping on the VFE IOMMU.

>
> dmesg: https://public.lucaweiss.eu/tmp/fp2-iommu-dmesg.txt
>
> The SoC in my device should be MSM8974PRO-AA (a.k.a. MSM8974AB-AA).
>
> I know there are some differences for some bits between MSM8974
> (Snapdragon 800) and MSM8974PRO (Snapdragon 801), which variant do you
> have? Maybe that's relevant, also since downstream splits devicetree
> based on 8974 and 8974pro.

Mine is APQ8074, not sure if there were revisions.

-- 
With best wishes
Dmitry
