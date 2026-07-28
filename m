Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF403A784A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234384; cv=pass; b=kjI3Pai3lH+H2CFBoetvx3UY3CL3qBKtrsAMoZ/lJLRGCZlkEcAqhOwzfG0mpGM9KryteKp6Lx9W8ti95uOn4PGQPVCZBBsji7QTMq9mOhOn4M+NlNk2Q1FP+LOA37InuLMYlaM9y5L75cHACLb+vSah1xy0W5jbFU724ZYR0NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234384; c=relaxed/simple;
	bh=tP+Mk6padNxzkLgkssX/FxjONAaKRjr7MoVnIKCagrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvopnTEHCleGSoplHN80K5wH8uharR3YvULDHqO+U9RPkXz/NxFJCX43201BJfZ96/FF319WNLvKqNjJxOSy0ad2SDRq3Mrq+r/U8cqpJPN4012NwXN1Dt+v9r2iV8Sn28WleBdfrdpeinJaxdSLKpB9yhv112UtWAsWacpFMu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gt2GmXkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1N3TiCk; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gt2GmXkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1N3TiCk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SA2MvZ2606156
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tP+Mk6padNxzkLgkssX/FxjONAaKRjr7MoVnIKCagrI=; b=gt2GmXkY8O7FK7wD
	PPppSjnabNNCxpjiO2QYZmCYJWDsDVSwWV2l+DoiKMfEBxoCSJeyFe/0nJwvLGVG
	JqoO/J3Pat5HfPUBszkaC1dz2vcA8V29J/UpXiZbMAMO7iyoCiM7vdjcOOq9sw4A
	QligSi6q7eZfxJbNtqYG1oTFogXjTi21D8/e2KXXbEuXb1x3aLvqnc7N+1esROla
	sZ2x0BmREUDQVm3RvdJIXn/eettPHjyqA2sW0ANBvnHrkhDEalrSDURC5rafnJvg
	Tnj5krUW5MFzF8jPxlKfo/gweBd9mzZKitrcVUj4TK3EU/YRclKUm1D1orzCYwL9
	G63rzQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptatg2xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:26:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so708968285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785234381; cv=none;
        d=google.com; s=arc-20260327;
        b=JOns86shjYwE1tbrZn6vD3gfP5Ladm2l/S+1rJsD9EYe4kKtbX6TLw57ZNW4fzASdd
         k0XKYOGgAg/ca8vPArRSu9b/IxPTGEaC3umx8oOEhQaZdL7Ggmz//Ygs40R5a60kUnsf
         Of8RnsK6dyXcAlbNHVqxIPxvKbIIzNBjC5lfAPsSWPI+DouejPJm/kZT4BDRohBdQYtw
         QjWlt1nzk6XztfRKxjtEjvbeecA+KHHB6O0mh1i/2jAppIJGi6x3cvTHAKx3v3zsv9nt
         tJbYhoP2uiaz+JlesHcZfpW4m2YSHPzP28f1dH3yF2VBvIOlVcM/Va4/j8B18gvl6h5I
         NUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tP+Mk6padNxzkLgkssX/FxjONAaKRjr7MoVnIKCagrI=;
        fh=ShizJRAHsGNATbA+NOVpJWgvWPNiNJa6FCyDnN6ljzU=;
        b=b0gBowCbp6e7zLLThi92f9KE9V5R/lo/696KKkIruyXf6WJ1OtIV90R9/IbDkIwrPv
         NSK63DVAV5X33QKiLV+62HbxIbTL5s9RW8UmRBiIMLDk7LMrEyc85n8xw0yP432QiyHR
         PagvI0l9VZF9MrrI8bEKj1cd8jPqFRPv/r/A5Nr8D/59AQlzIxQsZ0swE9b9o8zIix+T
         vhHmVjBHVNJL21w0PiACtvx1HQJvK4THvH/f7Hj/c2pfHQZBD4EkT/gP0p2/vTWidd/r
         DqAF9OXmPQQhBczBF4A0DomlSOhPOyEEcJiVKS6t4u6yXzmwgSq5UEzuKfEGsAUCaQLU
         KPSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234381; x=1785839181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tP+Mk6padNxzkLgkssX/FxjONAaKRjr7MoVnIKCagrI=;
        b=X1N3TiCkFW33g93VAXyIcIxgTzhXQCAw67lC78zLbiwI5zFDOuyxwLsYDd/++dYSN/
         HwlWUL6bPLqakynSuh3VSr0QfAvYyVQKkAGZKveJYGNIf+jo3EBs+2xJftaHDXtkFfMf
         IGlIImfv1A3P4/70UZiO29mZjmn4pHBzPi7AuEWTEMQ6zZWo/r/aEYDM6V6ymXtiDuHO
         v2/TEQhUcy3LSOjmKXVguI5fsnSUSdLLmhTyO2l7rtnks+D9yBSl//iTzPq2fAj7jcex
         CKjgcM2lpw05EQ/wuB/ZCVNbl0VeT9qh5UOFwXeoirAnUppMhUarSmkYk6O8tzAnfoeu
         1X0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234381; x=1785839181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP+Mk6padNxzkLgkssX/FxjONAaKRjr7MoVnIKCagrI=;
        b=eAcl4Tj0Sx+F1hkBHWGzz3hVd9mQxU+3XJMl8ql6M9ieOGdaFGVATvQ95SxDYUo7h7
         /te2n7wWU+PjXnpCxA8I8xreImqkyxtef7zfwV2m7N3xRt9HS0Renlds5IoYXeI6xPxi
         9pdrMQpN3BoY5w0ZBDbhID03UPQtsIGL7Ipa8nMSa/goCpT4rXibEZp5v4EWIkGAmWgi
         kPKPvSb+NvmttRsJuKS2de45DgRqhOEgRwcz4mcM+olcFLMV2RhVMDNUM9EtGzVVlc9l
         AfB/bYZH/WG7uIQoJcVSfDe/qgRgFAA2pdgnkjeKtpVEYNUG61e1pvzSHIKi3cWEO7PK
         bfkw==
X-Forwarded-Encrypted: i=1; AHgh+RoH7f5TadL5ere3069YYy4td7IhceLbm1ympAdix4CxOTP3n4cxwPTPlJ5LYZHmtyLqBXRMwKQLWel46Psv@vger.kernel.org
X-Gm-Message-State: AOJu0YzPIkokYrfgctXHswm1ceeDHvX/NeJ+Y4dTRbPh67ul6ofms0au
	Bwwso61IVAe3vTIpAQ3Tn/ab41JLDlkgWzHRMD1fSmlXlFmAKjDGKH/nIxnqPkGxILqNjnDc65j
	LXTeDwLGoqJuprFklkc/A2wMJ6MyTRAvDQnRPsd033XoZMKXRYRm6S4qAbdnBDx4sufSTXd481l
	T1tyEr7jAx8d3nBECi88/eRKL3nE/9Oa/H73j/Q1AunyGCNvafwlGn3Q==
X-Gm-Gg: AR+sD12AZmM9q/EeQsl4ka4n6Z6T+n6KljrhRL1hM7nfKDtRWnDszFaJEfa6pPVjCyt
	jyQGASrUSsOgy1qciX5kEDSTmOYGR0e1O/IeXY9FdUr7lCtXuAr6Tqcb6ixQh/eCq+/fog+BeDq
	jSjD2tzFuk3xGSGClunhm2JVOmmANC7hDiAtrNrqB9WcJDdcB1FcRVJKs6tRggT7g3d6nfvTtjf
	mYgX4TeTcEmLPYd3xpP4BUMYkZeQJu8fd3/ZmncYq0ZEeT6OHGd59sTc19+SbybcyNjMeMlECY/
	Di4BqdD+6ezdEowjmQlfqaPu1D8l
X-Received: by 2002:a05:620a:4455:b0:930:b5e8:a40e with SMTP id af79cd13be357-93302656b33mr148383585a.23.1785234380730;
        Tue, 28 Jul 2026 03:26:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4455:b0:930:b5e8:a40e with SMTP id
 af79cd13be357-93302656b33mr148381385a.23.1785234380245; Tue, 28 Jul 2026
 03:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
 <20260727-cci-clk-fix-v2-1-c3958f28b045@oss.qualcomm.com> <c7b0213d-a4c9-4ac8-be09-b449da457230@linaro.org>
 <CAFEp6-2VP1pVbKJEkPTOFdMn8kv=83CrP-MCYPDTN0BHURn2Jg@mail.gmail.com> <2b4b3fe3-9062-437b-8b4f-65a0b121d8ce@linaro.org>
In-Reply-To: <2b4b3fe3-9062-437b-8b4f-65a0b121d8ce@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:26:09 +0200
X-Gm-Features: AUfX_mzVSdXkEzuqpaHYAUj4GP3qPfyFb8m0lNIU6eH7QVaUcshwbXsnyVgrHTE
Message-ID: <CAFEp6-1zXcsXqez6dba_BT4YXnJU_YT8k7OQ+Cp-gnWL0n27Qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] i2c: qcom-cci: Switch msm8953 to the CCI v2
 timing/rate config
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXzyB5dDW5YxDc
 uRKIE50ENE9kNFzDTro3kbf9fCwxxkZerdoTPssA+Ki6YEpDnwauzTYp6Ff88NBKwiX+6N8IOwV
 H/WvynshTMvltaGzfELUDmjZ1iztmBM=
X-Proofpoint-ORIG-GUID: hWP4gv2mnUEa4ao5gdNy29endB5mGk_4
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a6883cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
 a=BhYqSYu7UfpT2a6lJnYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hWP4gv2mnUEa4ao5gdNy29endB5mGk_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX6X4ZzodWQgIC
 jbx9czES7df5OtZf2bsTreDc8/FbFUGeD3hDa0GDoud1KafWvpFKUBMHEL3sKXtuGQK9DWyZpaA
 /i/783Ta+MMokiB5yt/ypJxNHpz9qrSEG+IBsx1x1EytPU9K6vWze7pA4xp//8AghNT547lU7Rb
 auWt4GK0xOZGiGsax9jfHs2Iu6N1o8zZnOcer7F9UYatTreTE7XBEbR1UJz13/VMIJVlPh0p8zA
 HouBBWKv13Y34wS90M9yP8/hf9RocvainjBCzTA8vtk7wYrMOxJPGYZ7busNOtiYw6U+K2H5n1w
 /uwFvw4HF/waZaxqhxbw4r84f8V9r130yLYoXW371+O79XHZYIckm4c83SbVWhJliBHQTnACvmH
 IFlXIutXF7MCW53+RsL3rxPyIHawv7KHvX/uziamcLEU5b3ATlRAKXa2n02+S0SFdfvRXR9/V2I
 yccgjAiHxN8O8ZQ0RJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280091

On Tue, Jul 28, 2026 at 11:38=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Loic,
>
> On 7/28/26 11:20, Loic Poulain wrote:
> > Hi Vladimir,
> >
> > On Mon, Jul 27, 2026 at 9:21=E2=80=AFPM Vladimir Zapolskiy
> > <vladimir.zapolskiy@linaro.org> wrote:
> >>
> >> Hi Loic,
> >>
> >> On 7/27/26 12:21, Loic Poulain wrote:
> >>> The msm8953 CCI timing table is internally inconsistent. Its Standard
> >>
> >> likely I was misunderstood in my v1 review comments, and I believe v3
> >> will be needed...
> >>
> >> If there is just one master, or two masters set in equal speed mode,
> >> then there is no such issue as "msm8953 CCI timing table is internally
> >> inconsistent". In other words generally it shall be permitted to have
> >> supply clock frequency intermixed speed modes for any CCI variant.
> >
> > The two masters sharing the supply clock are independently
> > configurable in terms of mode, so we simply can't guarantee they will
> > run in same mode.
>
> There should be no restriction or guarantee to configure the same mode
> for two masters. The supply clock frequency is one for both masters,
> but speed mode selection is based on its presense in the driver by
> the CCI frequency.
>
> If there is no match in the driver for CCI clock frequency/speed mode,
> return -EOPNOTSUPP for such master.
>
> Think of it, right now for each CCI hardware revision 3 'struct hw_params=
'
> are provided by the driver, some of them match 19.2MHz frequency, some of
> them match 37.5MHz frequency or intermixed for msm8953 case. Likely there
> is no restriction to provide 6 'struct hw_params' for each CCI hardware
> revision covering both 19.2MHz and 37.5MHz supply clock frequencies, then
> any combination of speed modes can be configured on any CCI hardware for
> two masters.
>
> The main point is that CCI clock frequency is not specific to CCI hardwar=
e,
> but it is specific to 'struct hw_params' mode.
>
> >> I'll repeat the same point as given in v1, namely supply clock frequen=
cy
> >> is not a property of CCI revision (therefore v1 1/3 or v2 2/3 is inval=
id),
> >> it is a property of the mode settings. It's correct to remove 'cci_clk=
_rate'
> >> from 'struct cci_data', and it will be correct to add (or parameterize=
 in
> >> any other way) 'cci_clk_rate' to 'struct hw_params'. Each instance of
> >> 'struct hw_params' is strictly bound to a particular CCI clock frequen=
cy.
> >>
> >>> and Fast timings match v1/v1.5, which are calibrated for a 19.2 MHz C=
CI
> >>> clock, but its Fast+ timings are essentially the v2 values, which are
> >>> calibrated for 37.5 MHz. Since all masters share a single CCI clock,
> >
> > So, you're right that the supply clock frequency is a property of the
> > mode/timing settings (though I'm not entirely sure timings are fully
> > hardware rev agnostic). I don't dispute that.
> > However, this reflects the current driver behavior. It's not
> > incorrect, it is a simplified approach that uses a single frequency
> > point across all operating modes of a given platform.
>
> The driver should be fixed/improved. Reverting the link between CCI
> clock frequency and CCI hardware revision is invalid, it should not
> be done.
>
> > I added a brief paragraph in the V2 cover letter to explain why it's
> > out of scope.
> >
> > My argument is about scope. Today the driver has no mechanism to pick
> > a rate per mode, a single CCI clock is shared by N masters (usually
> > two) that can run in different modes simultaneously, so per-mode
> > scaling requires (1) per-mode rate info in the params table, and (2)
> > vote/arbitration logic to select the highest required rate and still
> > apply correct timings for every master at that rate. Concretely, with
> > one master in Standard and another in Fast+, you'd need a 37.5 MHz
> > shared clock and a Standard-mode row calibrated for 37.5 MHz, which
>
> This is a limitation of the driver only. For a selected CCI revision
> please add 'struct hw_params' for Standard mode / 37.5MHz supply clock
> frequency, and the problem is solved.
>
> > the msm8953 table simply does not provide today. So this isn't a small
> > tweak, it's a new capability backed by new table data. It would bring
> > more fine tuned supply rate, but without huge benefit, as cci clock is
> > gated most of the time due to runtime-pm.
> >
> >> But what if you have only one master?..
> >
> > It's not important here? we have N master (usually two) and have to
> > deal with that.
>
> It is important in sense that any one master usecases are properly
> supported.
>
> >> I think the msm8953 data is correct, it shall not be removed.
> >
> > The msm8953 table as it stands is internally inconsistent (without
> > per-mode rate info), no single clock makes all three modes correct.
>
> It is so, because there is msm8953 data is incomplete. But the present
> msm8953 data is correct.
>
> > Moreover, msm8953 is the same HW version as msm8996/sdm630, which
> > already use cci_v2_data, there's no strong reason for msm8953 to keep
> > a bespoke, half-and-half table.
> >
>
> Okay, I read it as 'struct hw_params' data for msm8953 can be removed
> and v2 data should be used for this CCI hardvare variant.
>
> >>> no single rate can satisfy all three modes with the current table, an=
d
> >>> the DT assigns 19.2 MHz, so Fast+ timings are wrong.
>
> If hypotetically 'struct hw_params' Fast+ timing for 19.2MHz supply
> clock is added to the driver, this usecase will supported by the driver.
> As for today the driver has a bug, no doubt.
>
> > This series intentionally does the minimal correct thing, aligning the
> > timings with a single supply clock and enforcing that clock in the
> > driver, which owns hw_params and has all the info to produce correct
> > timing. It fixes reported devices misbehaving when no (or incorrect)
> > assigned-clock-rate is set.
>
> Since we're discussing it, this fix is not the only one possible,
> and the fix which returns the link between CCI hardware revision and
> CCI supply clock frequency is an invalid fix.
>
> > Not saying what you propose is not do-able, and I clearly understand
> > what you mean, but I'd prefer to land this simple
> > alignment/enforcement first and treat per-mode clock scaling as a
> > follow-up, rather than coupling a straightforward fix to a larger
> > refactor. Please clearly Nack if you do not agree with this first
> > step.
>
> Instead of a non-productive NAK I can provide a simple change adding
> a proper link between speed mode and registers programming.

So I guess what you'd like is something along these lines:
https://github.com/loicpoulain/linux/commit/fdacebb22d914ca64b0c3d4e257a913=
dc0cd16dd

My intention was simply to move this 'disruptive' change out of the
series scope, as I don't believe this series itself is incorrect.

However, if you'd really rather have everything addressed in a single
series, I'd be inclined to either pick/rework the series in that
direction.

Regards,
Loic
