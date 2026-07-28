Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D526C423770
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234733; cv=pass; b=sAsXIPg4vOKlVbpDpqn1FYpbd6GOxgiG+RW5KRgjTKTzZOqpos1cEEXVPFIEep25XhsWePbDFUKCGjn2NK83NXzgfhgf8YPsKjgRPXa1z+bPidFxMCCTIj4ga/5ihond5cIY5/+27GasGBtfgdrT1YDchcljnh0BQpPQPYIwmCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234733; c=relaxed/simple;
	bh=SlwrPGZk2tMiLQKxq283mBOQeeMJtKxGhEtF19KYueY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAR8OWx9oAu3bFSxcBDwslGeky8uJrn7VzQfXyxMnozytnOPr2E+rrrA3eZpafIN8kxpqRyxd4E/UKf//ns+2h/ac+Hy4inDKLz91+A3O4XuZcpH4Jy0ICLDXexxenabbt1TELSruijjVo9pkQ6J2pAOFuU3qKNiVqzkWmXxwW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmkCQTI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PsKc1ehf; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmkCQTI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsKc1ehf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82lru2276017
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HW7nK91TFv9fL78pEO66gVW1LSmg7sz4PPMdk8VtV1E=; b=HmkCQTI1v8O5o2wC
	UkT2ZsPDXdjoUqMnhp5DtTNZ+f9mApVcNX+kZgBFeE6J6QzGikSFIClPUNyLJm61
	PepCa5fsUZSgB7x26Q5mc2MXlI2RSZBN10nzactmj5qs0Vxm1Hj0kGG6QWME7tdk
	p4ElGhP1X1c0/wmjvLhMHc6+joHIqkpRfdSQy9hjTgJowKSoJidSfZRdw17SjoIm
	a6PtLyn1tttHEM/S9r2dFSlr521PstOJzaSLeqE/qRQ/YfSmFTNwFRUEwJcYtmP8
	+aS78gTFvg4Hx55ZcdX2hbNsIvYclgbMVSk2jtnHKl6Wdpige6rwhGh9gMSO3RVh
	viRn8Q==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrsur95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:32:10 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81ec0eb032aso88744907b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785234730; cv=none;
        d=google.com; s=arc-20260327;
        b=azuBNN+AdyGToPTFUoCPvpkSWo3W994XI3e3+OTJf4MM3tiLbZsWzeYuP5PbtRcz6B
         OkDD523p9iYykjArYmaRTxs4nW5/eveSLXbunp1v1riaciEiA7JzkA2VHsqDAxTfUW+U
         ZIq4sP8dIoLWuCl2IKzjugxnsJKCPGXpzrU+HY3cEY7KP8v3zMfr3oi782EirWceOJn7
         RTeyTzvbpXaUBYy+SdWG9/nsgKNZyODHIARtZDHUxFHEFAhJdk47KwAvfqY74U307zjE
         G6nUaYXo+Zfj2mXe3w2+gLevq3+zeWi9AUG3KVCX0XBLhF/TcVOTMADQYrm6laW8X3cV
         PXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HW7nK91TFv9fL78pEO66gVW1LSmg7sz4PPMdk8VtV1E=;
        fh=mz+MvqJE/kqRkOaPA4OG+sTia8em3abXmRXMS4aipPc=;
        b=h8FsWkTDNLZDuMR/fd/I6KP1OSLTLWfvZINd3+2eZKajpXhSP1AnAVbNeHuZRnVYlQ
         vUfMAZ0fBb8hRz1wrSoNe0v+c0Eq9Vt86REgOHaNVN8xQ0HAMwrxLsBVDMuAFYmt9Ii0
         1BZz7RFo7exbv+2NY/XOJRwFh4iJ5JZ76EZJTWbwPh8nfaZ6ZHShROHrh+hr4w8ZNEik
         40GCVwhfzPUFwzUeqZ1PD2eW5ePghfeuuv2Vcre/ldWC6+XNvY14cw5Lz6eNWvQFlBMX
         FZiyHI5EO9hqjAEtZLNkcW2MO3EWtn/7NDL1yQ4eG26bKMgZWGaIoEG4rWiZsz/5+gxh
         I8NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234730; x=1785839530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HW7nK91TFv9fL78pEO66gVW1LSmg7sz4PPMdk8VtV1E=;
        b=PsKc1ehfujoqcyQrrkMYlPFLw7/4RDamn8zhFCLDGQmy5HPr/MLGnea366WOgNYNBB
         GVcRcLGNZ7TlUIGQT3LBoN6jnOfIUydjexxB+005ziAe/NQwnrAyPQ8GTNH8HUi0RnY5
         tS9rQZZL+71bdwO7IDvDXpJmX8FqlJape7ZB40da5DuSJM5cwPpSVnuCIV0jbrGg6mFO
         iD11pW1kjQoDxvlIdCLxPsQ4i1wu8N40aZRKbsdqP8XPYAf92I2agaZuwVxr3lfnDWId
         O40/ddGv6QkaB4K3FHx5f03/AaFUV3ymrojQlOhAyXbFsUNsthPdjfvmq1jrZSAquuLh
         fNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234730; x=1785839530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HW7nK91TFv9fL78pEO66gVW1LSmg7sz4PPMdk8VtV1E=;
        b=I6qtcv4Pvq7M8w7dJ0GfukDYkpNuycp12CdV/jh1AnLepssUi/o0T89HLdFAkeuxK6
         DPCkHbzE7mtX+IGQAMNd4VPPTvC1Z1IvNrHgq8cE8SNKQ7YlqOOmCMtz+Fk2/w1CP/6E
         klypptPhTiPPnn3/OZjlybojDGkyJxXMHIoVHq3nz0J95lDdzcAkymuaPIGudDpdjrdb
         mh+IB0EVolPVwd1aDQPzkYAds/ElwRs7eqttJnjJS5UiwfWoDNF8rc633FmQ4gu4KoBE
         zvwPEmJjlRflvceVgO55zEkg2Pk3L4gf7a4RTGUELyp1mMWdmByRL4OPEvAAbtbZuJm9
         8Ctw==
X-Forwarded-Encrypted: i=1; AHgh+RqNURMkTdazQf7b9fKtW4HqJnQmBkh99cUTtDTMuIXkhm8TavZySWFDdWJdT4HkzesANiC8Oq/AE664HapX@vger.kernel.org
X-Gm-Message-State: AOJu0YzhnTxCgFQ5mx4cNStCe9CjyRHJ7I0pkRAUgIcnouj/VNvjr06z
	BLhFDvmtoM6OLGsU0GRTsQyZeBZE9fZ3kWIt1tZ6ypxecVX648fsQUQwyC0JTVRBth4rQyCSuqB
	aXYw/sSnIjfMHOIRmfuZYOisBvCgsXZ92XCPY/nOOpEJ+Ao6x2TM8npvgzAtFoGgosXMJfukLzm
	B4rWjNoUpeJul5CiK1cXnkrY1J7GOQcs8KZLOTXsU/Q1U=
X-Gm-Gg: AR+sD12MZ8RL2kAU3Ahmk/DGcFjNMqrEVi6+9JwmrdUq6mp/qGT4KH1amaXsoxCNmtw
	3sbjM82rZEzA1Y1rT6yLVSC/1w9h3CdcKLNWn88A04OZYtE4VeVQ5aXZAuG2TU6TopZJ0qmY0Ma
	17dKXSRWO+1LdTKh4MNr/JGOP/OWFCpv6gzsU+AgyK7va8ESaTF0HSW+k+hA==
X-Received: by 2002:a05:690c:a98:b0:80c:85e5:875e with SMTP id 00721157ae682-81f9942cbb0mr7432727b3.71.1785234730108;
        Tue, 28 Jul 2026 03:32:10 -0700 (PDT)
X-Received: by 2002:a05:690c:a98:b0:80c:85e5:875e with SMTP id
 00721157ae682-81f9942cbb0mr7432467b3.71.1785234729554; Tue, 28 Jul 2026
 03:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <akfHIH_dZrr5bosu@J2N7QTR9R3> <f2d4b312-4a11-425e-8329-33838ed37d15@oss.qualcomm.com>
 <al9uRagYJSQPJr7_@J2N7QTR9R3.cambridge.arm.com> <20260721-wandering-romantic-buffalo-ebbc4f@sudeepholla>
In-Reply-To: <20260721-wandering-romantic-buffalo-ebbc4f@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:31:57 +0200
X-Gm-Features: AUfX_mx4FYBv0CDzLfSFCClFXJjPNUK_fqBRZnaSA4S674r4_XuDaeJlCBcbxE8
Message-ID: <CAPx+jO-t1fRrS=-ufM11DAchi4uAki6mnnkJ+qh=M1G-qs4c=g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MiBTYWx0ZWRfX5vKjy40d6FmA
 W0UJ782Hg7cS06KNluQOo27bo2zueukZS3XT651JPAUs9N8PImiYCAVCMDNkiVgq56ZPf+W8by5
 esN3SEgsbNIIIfA78j4FkUjz33eAcUdjtP65B8O0TdFyCqkJBujvcovEkyiMEDnRBA0cujpgLaw
 ZSOnkuceMQSh19Cs3MgkPtUYXCbvVmAuM99BtGGCWyALJLVST9XblTlRCsbj87u/srFIVScmh+p
 hn03fMuZdRI3WnfNg7dyTWyVZntF4ihfba9yRmL1Xty7cUzLHnLmOtr4lxM2AxVS6aLJ5y54FAV
 YLsnPWOud/jIsIJ4Cn/3FFNcn/9kPTf4q33i3ta/a402JDbBkLPB5Qva6gSHvsBIiQJ+cjCVWr7
 XzPGu+KcslShfkxT2vv7Tma5UkUQ9vbnTGNkk3ilB83IpOgD50SGT6G1ZdF3T5iEpuzWcKSxQkk
 r15q3qQgsv5pD4bJS/g==
X-Proofpoint-ORIG-GUID: 4YdER7o3ciqNz6dKkCRR60KNBvW8g_bl
X-Proofpoint-GUID: 4YdER7o3ciqNz6dKkCRR60KNBvW8g_bl
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a68852a cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=Th27373rO5TmSeHawX8A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MiBTYWx0ZWRfX8DxK+naa3ahV
 e0DRtKF7x21RYxFHxI20B3T3Hxp7n98P66eIQqnUUNYHoHLr1qaTCENG2FR1uzGLvvclpNnuCHb
 dIaqH7Hh7bM2yVWA9SZzlrRIJ1+AQS4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280092

On Tue, Jul 21, 2026 at 3:53=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Tue, Jul 21, 2026 at 02:04:05PM +0100, Mark Rutland wrote:
> > On Tue, Jul 21, 2026 at 12:29:54PM +0530, Sneh Mankad wrote:
> > > On 03-Jul-26 7:58 PM, Mark Rutland wrote:
> > > > On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> > >
> > > FW permits CPU0 disablement because it functions properly in regular =
run time.
> > > But there is an additional hardware constraint in above mentioned pla=
tforms, that
> > > suspend to ram has to be performed via boot CPU / CPU0. Due to this c=
onstraint,
> > > CPU0 is required to be online when suspend to ram is triggered.
> >
> > The PSCI spec doesn't permit that.
> >
> > Even if HW has that constraint, it's up to FW to hide that from the OS.
> >
> > [...]
> >
> > > > This is a platform-specific property, and it's possible to build a
> > > > kernel that boots on this platform and/or other platforms.
> > >
> > > Yes, but for that reason the config will only be enabled for SoCs tha=
t have this
> > > constraint, it will remain disabled for other SoCs.
> >
> > Please re-read what I said. A config option can't help if you have a
> > single kernel that supports multiple platforms.
> >
>
> +1
>
> > > As mentioned above, its not a FW bug. CPU0 is allowed to be disabled
> > > from FW and HW constraint is for suspend to ram to be performed on
> > > boot CPU.
> >
> > Please see my other reply at:
> >
> >   https://lore.kernel.org/linux-arm-kernel/al9tdvOxYb83zBxd@J2N7QTR9R3.=
cambridge.arm.com/T/#m872da3cc4ded3386dce92d4bd4bdf9c33d3e2d0b
> >
> > This is *definitely* a firmware bug.
> >
> > To be clear, I'm not saying we can't do something to address that, but
> > let's not pretend that this is compliant with the PSCI spec.
> >
>
> +1
>
> Just curious if CPU_OFF on this CPU0 returns DENIED or just proceeds and
> ends up with cpu and/or system hang ?

My apologies for side-stepping the discussion, I just wanted to share
that I have explored the exact same problem with other vendor's PSCI
implementations.

In fact, I think it would be interesting to see how many PSCI
implementations that really got this correct. :-)

That said, I think a DT property should be a generic PSCI DT property,
but then set for those platforms that need it.

Kind regards
Uffe
