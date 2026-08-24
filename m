Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0CC3B3BF3
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552840; cv=pass; b=lK+7GJlhU14IejEPwS/vHcC2t4/wFvKXw7rFv4/UrRRq9oVp6qtk69p2qMhJEnvs45CExXnfvbY7Tjb+NQL0p1WScLpoMBGZdzc9x17i2eidMLA5Bg9J0CU4Y5/ot+D+BuejVWIpyfHcaZGlXlNFLu4sJhitKs0eb03sujdrsdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552840; c=relaxed/simple;
	bh=SIm4RSZUKrJB5nvKh8RCyJ6hLv0Z2V2NmQ/YE74MnLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1RElgC4iC1WaKb5M1JOKtRKV/TtUg76pQm/00vRyWeqfCbq67/M2VDhaAeFNV35bBapHECds91dWJXk9u9aHfXdltsqzuNgOkm3cxulN3Icy3DEIXY4Tk8jVcOCigcdB3YY+DswCr3INS2WRz0upW2nir4KbyMOqJriIjPdgco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cvOYRIIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nfw+WUF4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cvOYRIIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nfw+WUF4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RAao1848283
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=; b=cvOYRIIL5TeL7uZ2
	3x8v4ZZUVR/pK5c8mUUaS78Kno2WULoCJ4hSvUlisvCoQwl/hgNH1jB+GBgIDnRQ
	4loT1E+CXJx1CYu77EYYTdNXbqiy/M6FETMe382xCL3u0PjRV5jf4KJx2Km+P646
	lEkPFvR74fiYG/pwSPYlEbe5vAWE0cWh4nnvV1QPhTMeDwSakSL79R7b8uNVxgcW
	SorsPt95Wlv7EEEZadUi+3e5IiUsy/Vz10bB185I37MSAAK5/nISN71vlvUjS1Yv
	BXqid1KbKspGeoH0WzPCMyxAyg59tqVF63K8UsubDet79AXvhK/WDOfu9S+8MG2/
	kAe2Lw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740f5pd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:27:15 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66cf1803125so2530576d50.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787552835; cv=none;
        d=google.com; s=arc-20260327;
        b=VsSE6AKHjBFR2RLfCw696vABpRvd7yccsdFqP7Gx9kcbD2ugBLycYTkNUYsCgLZUu6
         +0aTmh6RkZbdwXSs0t2ZaBhSQdHDl8X/oddfyX4jSiRT4vjRZcsMog/kNnuLIU/i811O
         EHcbqGST+yAUa2m/lECnaRQLVrbnE7fiE8SgyUp1ODOnOlzoSDEXC1mKEcnsoxKEovP3
         GF9uopp3h9Z/HEWRCBnzLQ/Y3qswTjEmAlEfzQRCgyhpOjF+y8unS1VbK0ETUdR9Se8W
         Ojc3jPL2ZgdwX86hqAAhivLEPJnR5V/poZSrAHWWdcACZ2MbDnmn1yt4bXYX0yiXyi1r
         omTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=;
        fh=JMCnvYuF3zpqUqNLoNznEm1vuit9GkcR5II67badm7s=;
        b=snk+i2NV3jFoPPe4bkoXCSiZnvvahxsuDwJ99NEKGX/b/k51KM3EeHzuilPENtVan4
         ppc6TkYHa8Q9q8grq0Su9c1pbp4KV+aUjN0IExq4wwUuzH+qF3rBpSV37ABeiHDaaJ/Y
         XBtSpLqKkEjDahYTr3WlKR7XFxMq/10dSVHRV3ILo5OJAuz+U4UCxk0vMgcGq+4IxUva
         Mx/CNpLHn6irojssR1br75NFfX1fyhYrXd2oPFiWgF7JpjLXZ6VvlBldTWqmtNICHpC7
         7MBLmc1RSh9vuiWIPeIc+kiWqe5zbn6kQ0AxutuZW2YYS3XlOYZlyBS4CZut40UCyU1N
         Riog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552835; x=1788157635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=;
        b=Nfw+WUF4lXHOozfI5WKEEF4feDFMgTSmw8B+sKMdQ8iYdrqJoFoU8Kbk1WDWDyYrQF
         eEtuLD4vvuAFZYGZzDYKlolNbagDV5oo67Eu58PjEq/c76nfjuG7K0TI6A4muxk9LuKf
         MRT6jcXFnMduIS/R8uBg+Wk7p/a+x8+RhvBJsXDdTHWuUBOe0AAclHKtPwbimUSuESmL
         GGulQov+v10ZjwVIyWotqbGmlY+HiWvQ7tcfP/hVX52aShJS48qLnWAIb4FnuNorj6/H
         wlQOeB09MpK6ZdQs/YuWO0b+tyTs+6KVK84hLsqLjQ2whezIKOpRDnRh3Zae7wW3pZKc
         Uurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552835; x=1788157635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0YB4whDv2uxPmdzywdk9IUtwJKS11hR/qvEjoZYiCQ=;
        b=Uv1FPtjTUxOWGAhoJaQ8/ebMriSJJ+I5Rv3bpMlLbMW26RctujOA7AgQqxZUA61SAh
         doxQjq5LwFAk1RFGg3+y8fRnt/fiTsjQ5d+QYqoUR7Q18x0iYaa/F+Qpyg9Bop5k75FY
         3SHa7Dq10jddlnYiOkqXmb3ogAZgV2LONXZcTdB8Ex0+Td84NaFH/2ncZQsQZol0PsV2
         G6TlT05A3C7Wopi5YeXho9YfdEmGmGZA+/SD78ukTVH/OofPdhY+pfhGfhRduJZ2caGL
         siJsYiOXccUFdA56BdxNguCqp9oNR94kHLzFIJR1rutyTMysFCTwCjp8bKVvFv1VbZ/P
         IQ6A==
X-Forwarded-Encrypted: i=1; AHgh+RqD+UXLCbggHaJBNpxlAIVgRITaPQ65BurfQy/TP7tq+3rttybICrKOZyO4j28qA4mhl78xXTx8BAiZpvYP@vger.kernel.org
X-Gm-Message-State: AFuF++nymAg3ARKvTgJ1QY5KgE/aQ59Ev82YGu69dU5ZPi00uYBIgOcu
	iPXbrguym9VzjnFyp9+rMIn860LCdK/OOmJOOiWsVkFZHjIptPVbxYlPjyE20glPSyUT5+r3VH5
	yWW+PJJGWCItIBHFlv8f+7axzm73YH2qg5OTaf4aIgZa+L/4FJQA26Hm9khycwgo7ItJSJMQREb
	LNNn4UhCywf+95zsNjjkH3KMx/dz40s4c7q232SMfEEPk=
X-Gm-Gg: AR+sD10DmfyeyLJ4MX5apEYIDVqyRh7gszuNYGZXoIgP6TFJDudbhKEAZH9BmHrYVsA
	CopxEAMRc5fMk4ZOHxERNhHJcQowZYMTJP7P63IMTiKkwVB1JmY8euiz4Yjy7x5uecFJ23/0m7B
	9J4u63QgfdhNuMsxlSNxOVIeaRcXWjA7uaEx+b8RRtpGnqqAphbSJpBLZy9Oc=
X-Received: by 2002:a05:690e:e8a:b0:66c:e994:6a13 with SMTP id 956f58d0204a3-66ce9946b3dmr7444543d50.52.1787552834906;
        Sun, 23 Aug 2026 23:27:14 -0700 (PDT)
X-Received: by 2002:a05:690e:e8a:b0:66c:e994:6a13 with SMTP id
 956f58d0204a3-66ce9946b3dmr7444523d50.52.1787552834533; Sun, 23 Aug 2026
 23:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
 <c1a5a8ac-9e09-406b-bde7-bca74af6bc2f@oss.qualcomm.com> <20260702-upbeat-furry-cuttlefish-d12f4d@quoll>
In-Reply-To: <20260702-upbeat-furry-cuttlefish-d12f4d@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:57:01 +0530
X-Gm-Features: AcwNN1X2QbYM_Ej9zVogxycYXkXw60H3jSbidIvKHElg1_jCPW_I248pR6I4-hk
Message-ID: <CAC-tS8DsKDWzsnu310GwCabAzJ8mBGS8wO0TB3m-FajwcXDqvQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX0fWF+FT8c430
 NtwvF6jmOLGvv47HDgiKmFnA8jzet1boB+7uxoBwsUJYhIhcAfbfiCrr3ANNLtygGrAXed+xsqp
 cOWm3vMZ5Ga4ykAfMjMXFSHPXZ4+AfiHWtevGHe8wWvFFAVI+I08UpfTRdeGCU0Lv5XhOK8zsBh
 +DiI8lY/64REjQiqIfoOhyqxzyQFN+MqbZgZWImyC6tcCLQZxUQLDQaC4KARVQzEhB1eDpbGW96
 hu4v0qDVfTcGGt+V3YjVjl6ZLJ+t6bKFEgmM21UCg5ReIKys+bq9mKrsMfgQPJCcc60YgYk4Dmr
 Iu0LOOCMa/0jHs5MXcUvQByfuOEVH3RWcNKZ/LtpDpvumCp6xMeSnaOPG+K27Uw3wTpzoc1EDyJ
 gwHTbMy+GWQKbrn9HZrMQ19JxAmzHx7uZ/hyXrg8U/tFtdSFUAoF4wauSS3sSfV2WIjDR0t0Ecx
 myc26r/zW7nPa2OH90Q==
X-Authority-Analysis: v=2.4 cv=BZjoFLt2 c=1 sm=1 tr=0 ts=6a8be443 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OOiOEqgzfLA5xCD0pTIA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX3ebMdYU4dREI
 ADSDvKvOOyDJFQgukMASXwkRQkCAaPLP2JhOOWSYJIGuDS7086/XG7f1TKd8JsMzVAZlew7PoT4
 NuVuJtFt0BUr7AxYV5nkulSKwv+Wetg=
X-Proofpoint-GUID: 7SSWrMFSFr7LhaGYvx8Z6Lym61onylaM
X-Proofpoint-ORIG-GUID: 7SSWrMFSFr7LhaGYvx8Z6Lym61onylaM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On Thu, Jul 2, 2026 at 12:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 01:04:23PM +0200, Konrad Dybcio wrote:
> > On 7/1/26 12:57 PM, Harendra Gautam wrote:
> > > Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) cont=
roller
> > > DAI IDs. This provides shared constants for devicetree sound-dai refe=
rences
> > > and QAIF aif-interface reg values instead of using raw numeric IDs.
> > >
> > > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU =
DAI
> > > controller used on the Shikra audio platform.
> > >
> > > QAIF moves PCM data between system memory and external serial audio
> > > interfaces through the AIF path, and between memory and the internal =
Bolero
> > > digital codec through the CIF path. The controller needs a binding so
> > > platform Devicetree files can describe its MMIO region, DMA IOMMU str=
eam,
> > > clocks, interrupt, DAI cells and per-interface AIF configuration.
> > >
> > > Describe the single register region, one EE interrupt, the required G=
CC
> > > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interfac=
e@N'
> > > child nodes used for static PCM, TDM or MI2S configuration.
> > >
> > > Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller
> > >   support on Qualcomm Shikra SoC
> > >   https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-=
7ee6b5f2d928@oss.qualcomm.com/
> >
> > This should most definitely not be part of the commit message (which
> > lands in git history..)
>
> And internal review (by tools and/or by people) would tell that, so no
> one ever reviewed this internally. Neither our internal tools did.
>
> Best regards,
> Krzysztof
>
Addressed major comment, will be raising in next patchset.
-Harendra
