Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EEF4E13EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742643; cv=pass; b=E+UWLlxOfd+PeDErA3hVQRGSn/zKHE9Q7VsYow5cNpknKKGDuiuEtkrN9mRfQJdikVJZKtaRwEUpO+EScUHGIoxD5cBP6M2O3ZO+Pa8REUq6BOCcNwVN3Pl3vRX46tjScJ+WHAKYPrxt3+blOneGhfs08CkDzCikkPBlS7Yi8U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742643; c=relaxed/simple;
	bh=AcIVnsv8+2abkkPu8NU5Qxz7g11MxL22mpLiDkD0gKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3FDp8oN/r6pPHK8t701vS6ofYQsU5e1KG7sAFDxjatfuNlSCteJDtNbqmNuQtofl/BGX75/vCPA9ydwk2Yy4wqVLGtp0gkM+QpAEbOHIx6pAkrAYoaY+3qDwt2yfmFZwoqbhj7gqr0B1oZ1m1DsiWgLDA5WnVpwhzNRdYEONhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ev7OIqCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHy/C4DA; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ev7OIqCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHy/C4DA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOWqW1016679
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=; b=Ev
	7OIqCyObUjNIYqgsGclT+aFxz83DUJ5JXZT1YC6XQjxLTh3EEaGOdepPGd12JWPt
	sZhx4jpPGdr+yz3nJlvsx6/AXs0kGN8dhvgOuJnVPciG6jzrsoJWgWWnPhPsIxf6
	3GiYTYXTEMqGC4s8SoIIlq2bZTOOD8HFMPeqkNED+u/EX62sCxUgBWabe5hWda6H
	D5yQZU2fp7T/7D8zGS2ZTco/Dqz5b6+B/Nn00miVFLDHq46FqHcbpzmLl2uA82CZ
	m68Mrfof4f/gOFIrxUyH/q02GBWfffLXvKzCw+6k1RwHJBACJHECKXRIR8CaSl8z
	3WGR4a2+Km/YB2IyJF7Q==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqecet9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:44:00 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1c1538784so966448eaf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789742640; cv=none;
        d=google.com; s=arc-20260327;
        b=dU1g+fOWNdO+FK2YQFhHFnNRNAphhkQTL9SIHMACmk0k9+xYl84ue4mQEpboo0u6Yw
         VyFFpzGibLE7+gqn62rs+GiIKex3h1aAAFYSGzrogX0qfpoZdURaWKcD9WNWlajKs10l
         JOQ1l0Uh8UWxs6r/drw201uo5pDFfC7ZlFsL/kiBYEV2I6lble9zX0w4cGPzsp58OhXv
         I5Le5p0LtMZKKRQjo9LqTfLcJ3JtUKp/Wr7W6Nv6AyeRjmUigSR6ZYaFEMb8oPMk/pBu
         tS2ht1l+43OGrz8+wOai44GimsZUqyCnCTxK1YFt5bnLlnh5OUbuoTT7L5/VkNbv7YRD
         TdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        fh=A6YccLMLWubpHF9r22jEOKuxs2VjiUctjuaF/eiOMh8=;
        b=TZbA85UWvBf2WDqiGt/hLTYJS6AMVgGDTwSv0MQAqCkuEu9Uv5tznqrl1K30id1iLX
         CZyNUzbkwjgYAV/+UjTJKJfdmFfjptGXOgq/wkqpwsCkKm9X8kmLtkEqEJA3XIEuYLRe
         D/EBaOqIMQ9GMWU8n+OyIioQlNdYnPTrsLMHLfqh4Dlw4RHKjKZsHJ0fsAtuFA203kRU
         D5gAZvJcDgTYiXFGYnOvxuEeBcKPrC2q6x/Vg5upJyInh3+1gH4VA6urEgz/Fx4hBpeb
         SZ+W9dRNakYbnP0OLS2RSNGMozr9ocIewXCmla98mxdl0iC6sf2L5evfLegawXAZKr9m
         5+Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742640; x=1790347440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        b=RHy/C4DAuXxWZLN9KmFfG1qic0RcRsh7bEtRbfxNPCkgEjtHUsRI6BaXAweNOAqyAo
         4aFCylBGOe2UVPK19w+Sf4MxXBXRyrjLOlzGy5roqTv8D+ZdkzEGlS1W6wHa0n8IomtJ
         y7j8Fo4/UdNQ33XdgEtj3vG9+7SJeKBVzildLanG3TuuA8yPKhv3VBlY9tmbz1kVu1FM
         V7Vn5sAuErRDuh9evlVbOHRaZEYzK1w1N+rZmInk12Y2Tnpy7UfnXCml6ui8Mz7mqoSC
         HDeu5QFOub2wCspalht0GradjJ32Pq1M5/ZrqYVFK8R8A6Rrrv9WumO9eMx3Fa4AotCf
         AAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742640; x=1790347440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        b=ZA69YUABR8dDCoMN7jRy6u1I/yyfoHi1s2qwtnGfRyEvz5GHYAVgptZdwYa0B+q+Rd
         Epva2Ohzzoh42DMtNFhf9UKcDUjA0EPiz5vZx7gkpPTD5iEH9wvwDeXXPKaa3uAx+Vpc
         RF/CBdi7ZY67e/BQZDduADzRHT+0trqrjNbLpOXPXl3vH+9F3I4TE7rXBaVGF9oieGH8
         Tx4znEf5efVVSZ3TdhAqYaS1Rpk3GbsEP84EHVJ35O8DBhoVEUHM8TJeJwhgXezK5YBw
         jN4kfaEwH79ubkxoDkXRvlBAVc1Qldgmgqc/kqUHZsgiFg6xB+D/65ZwmKuFe/i7gWae
         OPtg==
X-Forwarded-Encrypted: i=1; AKwUvByMdFuBkKuxC8vzhA9Def9AKaMCQ8yl0AhtsIrp9mfd2rmIm1GEhYPRGJRuMR9raZEB4ggJ1eDkZnQOltRJ@vger.kernel.org
X-Gm-Message-State: AFuF++lNof8WlaDjmKz3gCTUjTGUMgRu0G+Qw5NLpyxJpGJ4iNdLP8Ve
	NsfE81cusfBdX/CmbSaO86TP54KC06snWrimRAoC8cVAuLelC6DDuxV8sHox45nmBc2sgDpXoFG
	SnXbRXLLiYbcgH6H99ZAjY/Yg+iBs1hGzOe7PvMIXk1Q5f7lZGHCoeLfQljlef7tndtJILHIWCA
	zWg6I2hxmOX9k12jEUNK2I28EXIDYJfgOHULNDTfMEOqVHknBIeso=
X-Gm-Gg: AYBFou2L73uXLoEOBn4tDH79LEaQtC+VT32kFkFkMv+plxq0dQ9gE19x/akPrYc09S3
	h4DFFBhnSd1jWG2iAYnqhZqpW7jGdNaeUA2J+OvMSmBncqLsW4mTGeweMALLIxz9Q0dqrfSz6ma
	t1xBghrm1rGclheDIgwkr3FcZmHamidBS8FgIzTCGuVP6F4Z8bPEkmgNXQ
X-Received: by 2002:a4a:e908:0:b0:6c3:42eb:ec22 with SMTP id 006d021491bc7-6ca9a74fec8mr2397334eaf.23.1789742639870;
        Fri, 18 Sep 2026 07:43:59 -0700 (PDT)
X-Received: by 2002:a4a:e908:0:b0:6c3:42eb:ec22 with SMTP id
 006d021491bc7-6ca9a74fec8mr2397308eaf.23.1789742639405; Fri, 18 Sep 2026
 07:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com> <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com> <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 07:43:47 -0700
X-Gm-Features: AcwNN1XOxS8g7aUV7HRRWF2PBl79h7D0NcKpS9p8imqdtEwjj4hgkc90NvRmmmI
Message-ID: <CACSVV01N8v4kfC0S8YZVUmyOvWcSKX0jFax4_S6vTpbB11X4HA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ID4ArT8achCEueagMO5NDQkk71gqnz-1
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad4e30 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CY0cOUppvrph7IambT4A:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: ID4ArT8achCEueagMO5NDQkk71gqnz-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwOSBTYWx0ZWRfX/Zhws2nALcqY
 QzCZidGf8aahd6mQQZmX3S9OjFzMMPUQ3X4XvW7kyFy0s0rUaJxOjEUqKSBGuIyV7KsWUtZLnxS
 4fg6iBJ7tZnpp5OwWHmRbKstuYVG6k9E/46wqpRn6DmJm3x6SnQUbHFkRWWGFDtLJFOkgI9rtqB
 D14KXHy6oVfdpZP9a88eiUk5T7mjLyP4ItNHXLqWwbiNCUWjAvVd434ciznWhbNyCelKqNufAz7
 bn0UoLypzcKu2DmcvpCdJa8rOCxXk0hP3KyXOYF0YyNaHbJ8alauQcW7DwGPqtGalPr94774+pB
 053lKl0FvD4ld16VOn6g5CHry5yRmkXL7/Ldnmad9KQOOXODXjwU7mBgz4UGq0FG2U6XQn0UXus
 y1NYk8O1Pulq6crh/VOKwAbI2pFcUuuJcnS/00W8gPHlwxXmnYsuesGby7g2sFj2lPvvHKmJ+ex
 FmffRjCuSDW+FQrc24g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwOSBTYWx0ZWRfX104BC+vEa9Dg
 VMNKC/gIHJKEUMYbrUFhrusT2iob3Tt2x9IFPrlzsXJIerv/vPtGL5Cn75kMzSJUkDnrXccwG8m
 nRpwaBljfJQC6IXGim0wBarVYCWdoU8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180209

On Fri, Sep 18, 2026 at 7:10=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
> > On 9/18/26 12:02, Hans de Goede wrote:
> > > Hi Daniel,
> > >
> > > On 18-Sep-26 11:53, Daniel Lezcano wrote:
> > > >
> > > > Hi Hans,
> > > >
> > > > thanks for taking care of that
> > > >
> > > >
> > > > On 9/18/26 11:29, Hans de Goede wrote:
> > > > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > >
> > > > > SCMI client drivers already describe their bus match data with
> > > > > MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to =
consume
> > > > > SCMI device tables. As a result, SCMI modules do not get generate=
d module
> > > > > aliases from their id tables.
> > > > >
> > > > > Move struct scmi_device_id to mod_devicetable.h so it has a fixed=
 layout
> > > > > visible to modpost, add the corresponding generated offsets and t=
each
> > > > > file2alias to emit scmi:<protocol>:<name> aliases.
> > > > >
> > > > > Use the same stable alias format for SCMI device uevents and sysf=
s
> > > > > modaliases. The previous string included the instance-specific de=
vice
> > > > > name, which is not useful for matching modules.
> > > > >
> > > > > Assisted-by: Codex:GPT-5.5
> > > > > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > ---
> > > >
> >
> > [ ... ]
> >
> > > > >    #include <linux/bitfield.h>
> > > > > +#include <linux/device-id/scmi.h>
> > > > >    #include <linux/device.h>
> > > > >    #include <linux/notifier.h>
> > > > >    #include <linux/types.h>
> > > > > @@ -951,11 +952,6 @@ struct scmi_device {
> > > > >      #define to_scmi_dev(d) container_of_const(d, struct scmi_dev=
ice, dev)
> > > > >    -struct scmi_device_id {
> > > > > -    u8 protocol_id;
> > > > > -    const char *name;
> > > > > -};
> > > > > -
> > > >
> > > > What is the reason of converting the char * to a fixed array? That =
limits the name and may result in truncation and potentially name collision=
, no ?
> > >
> > > Because of how modpost works to generate modaliases inside the .ko
> > > any string buffers in device_id structs need to have a fixed length.
> > >
> > > So the truncation / name collision issue pretty much applies to all
> > > foo_device_id structs in the kernel. People should now to make sure
> > > that any strings used will fit inside the fixed string. And I would
> > > expect the compiler to warn for overly long strings.
> > Ok, thanks for the clarification
>
> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testin=
g
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

I'm using v7 on glymur slim7x, and it solves the scmi-cpufreq autoloading

Tested-by: Rob Clark <rob.clark@oss.qualcomm.com>
