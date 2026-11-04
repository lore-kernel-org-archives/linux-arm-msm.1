Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793822184;
	b=DhuT5aDqCpM+2RqVS2K78V4k2gZz1Dv5KgrxE8muK6weunUvgILQII2xZjEYwpI5rhJm
	 e1c3uTi0OsW0POUoj6aW99gCLOcRND2bYbqaLPBX1rJ5jI/b5atXPQKWbqG8nsE/E4O4z
	 /1uQbwlRF9fe3y5OzTNJ8hImA7uQuHPVa63/XPoEiRWT4knTmmRYj9d3keJOBjT3H8020
	 s+Rd4FR3oNPv/3epEEffDGYRopUj05Iz342a2WG0d2Il04THMXmRvmV+jybZlJGIt+C7d
	 GzIP2O39/ChRRH29/Te+9GCrA330IKGqlvSdlaJM7DIV5ekaG6Tp4WALj1jsA1+mstw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
	b=OFOaD9uoci8ptKZElz46vkCS32poj1pY3wXHCgtbet83EVxvwlzEQan7zRXu9893wks6
	 zrGhDwbHy36Kl+7jcSx6AniKQogF3GEkUvkEvnO7yYk1hrzRztNbyPLVcr9l4J7+2pJ23
	 mOmEeEyCs9GmXMCRkwLEc2mVGU0RJkTef7Now0yDmxRJOkhfb1F7yCDIU5TbeB370lCSN
	 6QNVlek9MK+TtlFeNvahhbtxuamo9iIPb3YNoYu76wV3PE2pWDHVZ3yByI1Sov4gst5yb
	 6Szz8KuEyFmvz2oI+aGoRvKfwSMP+G6d6CJSt1wBrfRpwz+FWxGfDK2kdejx5KkrDBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c135YuXN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqOZLSbH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7B609C5B5
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 19:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B7B609C5B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c135YuXN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqOZLSbH
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj8KO1692528
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 19:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=; b=c135YuXNvYw5b7BG
	fVpcjq7l4pnnMIm1qG2GHUJgCNnlfn8jgwbzvgnRYJPp2KAFBemfPZxq2QR18xkT
	0ty13cOiwNnHBANVNz+7DFgKWTNu6waSuk3O+FRzPab8LVWh9uJB092CYHSObM6f
	O9fh+BI4vQ/HGdk4IEr5EwS/pQ9e2D/RdFqG/w8pVdW8sXvMR5PivO5aKBxvUWMa
	qVnau7cRVYvhT2zQOaZMsQCrnGvMgkBiRLeCYvYexLRKu6tx4XMO1t40H46DhCgf
	9fs+ZxOvTPSV1gDMXEF9HY+NLzQIn8htO8rh8DpFQCZrRnNy4hQH3sXhszpcY2Iq
	/wjQvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br1e13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 19:56:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso206197985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 11:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793822182; cv=none;
        d=google.com; s=arc-20260327;
        b=MHUbUSyX8wpc3+fDbQHTYwYfM+vnyoELm2iIkJ3wXBzlc9suutVUOTOcZDQ5XqKVxp
         oBug4gJwBnl9imJWge1ZFarIhdhe/6ahriTGx7E3QWp9bwdoukKv+VGiVcilVZiPXUAS
         X8czBrob7b6ThTcWP8RE2pLOMIOocb08Cwxzv6MGBJ1kF0Wflxd82AThKBDbgd7QJBaa
         30Eoku6jmnf7dPLD3ma2WjZeINd+YPbisRbCMwbOTnawapYyPK8zj4g/bERgsI4I4YPp
         BZinwudV+t/GG/9fwrx2A4oxHh/LaHBHdbyaA5Idzhup1I8Pe1g/j421MMBCksDxj6KO
         fr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        fh=vEVrrttry7m652h3jQEON/TIpfBS1okyrsAAwEP6nCM=;
        b=aBeBQuRkQQZd1ZOm+MGO+9cteLS9oHgJVndn6uLwh5qtdRRkMgXkAO2UZUppnZiifS
         Bms7JzklGVMCnQmNgVAQublNT5A2n3uNoVFEzbxTOqddvVLeoYIhmJWqyIMZ/62OEjWf
         jbLJnHzmP0G1COrqNeyfEyUrohcwiNJrOCqYrKhksKeecTVbBDVlIxT56V9XeAxamK8I
         hmWOu6qXmDC3las3BudOBSx6Kc5dfxgaoRILzkMYsQSCXAK9toNxu+ZYc4vb3R87l/Mc
         imwoBTCutmgnpIXxKNtjIoP72WAJtIou4/Bmr51Cv0ktI5mJyT3DRzmnCHhQlkLnJemN
         9J1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793822182; x=1794426982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        b=eqOZLSbH8ybnZ1liGR5R+MXDWzzAitssSoKck0bY3+IGkBQ/bn79fJ4Gt9Z9Aqzzmr
         4Pd+ySHQagw2SirSyiXhEHwsvhg8jPgHJNLjsJ0T7ghYX/sPvseCsnRsLQ3BojHc4BVp
         0lyWiqgGE9f6SZ08fE9wiclK/zpKnS+9yp7iTEYH66vi/DDM9pEVr6kBAyn9i7MVYgJe
         RNfL+HVuXlelvEeYklby5hA9eRK3+IlpdEiNRjULtsJM7jTfT7H4vTcdNzIZFfE1SILS
         MNq9NdYYvAL+H3XfYCuf5XSskAIPIaHYUZc86o+NAOgokuOnfkgkOVUhmELzjh9uYv1O
         T5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822182; x=1794426982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        b=YyME80+//MlH8boItYoiimlloZINyWdPpNdzjoIN0ofoSCKhpPTgpTS0KyJgHURzRE
         G4jCF6DlxiN1fhVNpJs7N1BjDMmKxQPpK/0VCZseITY0/4O1vHeLf2bkQ4A62ESZsnCs
         91LEY9WntuUAaQY92PmAPLTCu4j01jkW2pYR+eyqEP2qnhq2zl5cSf9OJmQf8JdHuyhD
         tFpnlGqTi9Qt4wv1sO5SxJ8AVRk1q7RNMjF1fLuikAqTSgDcAMSF2c3dpCuvLm/DlFkv
         ec3BMyNHLYNdP9gzbMrzAjoR4EKYzi6AxS8xagAQUs4/+/uy+0AfpTVCG2EY53905pMN
         8L7w==
X-Forwarded-Encrypted: i=1; AKwUvBx7fhvp0UFRRHVN9bhZz5xjNa4znx5g2nLpxv1+JUzAFCMsJCGKK4Wy816XIrf3QdDX9QF4E+AuolOY3zYk@vger.kernel.org
X-Gm-Message-State: APuU4Z8vXm0WSeF/9lvuYMqYHwI+q1WiGJ3WmL8CV5OE5i28+2cvXajB
	u9hMu1eFPs4uXsA2m3o5BZ55mtVSc1PjqHHTY4S+NLeQihE5t6ZZqcSK4YqbeTWDEuaH8MwhyfU
	LxakpDcNYFWAaas4WIBuibnmB0aYfgD6jHXp9aJ/DbDQkfES3zVqx6dAJofbcF4Rkuv5ESRsfrV
	2kIPn4MAZRIaA5UpAgyaexJttUXr2JTZ35N4gvC9AMqGk=
X-Gm-Gg: AYBFou24RvyPIO7sCapxUkxnRnEWSSOkSWv2FjE3miGNskiDSN/olkerKzU1pCVjrG5
	/lx6QDxhyGLkSibLE29X02vnhx9lHDJxvcPzFm+p63uOgTXpBnb+0ZW3mbqxpGuQo2NnZchogZT
	DaOkQhqctviD3Gnj/jmt4R5+luOI1a+KOlK2bz3WvzQkbtezI0N+eaMvkMKdVU5N6TEf0sBdDtZ
	1MhelaPy5VIJb0254nUmYqmYCajqWRUlNPDnHO1FWWZ0i6YZL90Wg6OlHokCyfCIjFpNzK6Gx20
	eZ3ylE1k1FrkYs2LdFQijasvs6Ji
X-Received: by 2002:a05:620a:468a:b0:93f:17e6:6ee2 with SMTP id af79cd13be357-94421585e5bmr2998714785a.6.1793822182569;
        Wed, 04 Nov 2026 11:56:22 -0800 (PST)
X-Received: by 2002:a05:620a:468a:b0:93f:17e6:6ee2 with SMTP id
 af79cd13be357-94421585e5bmr2998710085a.6.1793822182093; Wed, 04 Nov 2026
 11:56:22 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org> <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org> <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
 <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com> <7acf1f64-a2ac-411d-a235-69ea52231623@linaro.org>
In-Reply-To: <7acf1f64-a2ac-411d-a235-69ea52231623@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 20:56:10 +0100
X-Gm-Features: AclHuK9iS-SlJNui77YNFKE0lYus5bUHSbzooakg4b1KhZgza0So8ebhpAkDmh8
Message-ID: <CAFEp6-0O3PyyytNvAUdvMRaMR3Q1Acb7KZmJmDT2J-gVfjYbsA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX1l80edA0ybam
 NnZZaQojrMv/3AM9C4JzsK7fTJBGEueH3WlOBC9JrnnYgu88Wtt9+i6CJ3a6K+gRlZp4W0GzrS+
 FAmTE+DI+J15fAiNHvpPrALOuG286vkL/DvTht8gZqBrGx1BkGjJpS7HXERZY7bLFbvxGHTlJ2H
 3GpY9s4oVNkjdWIaki2crHxVxPoRkoUYXJ/n+NLaho8BY/AZBiP7PBPOpmSNNxz3ggsLViL8f2C
 WI+6sKMtHr+MP6Sq0d83J+DbkSpq3KOw0a1FSFg3kiKCYKxd+r6Il04ODW8xRs9l56TiujGnx6U
 SVd6l48/ksOEB4J6NGK/d4hl9ir1F9r1FKtdyjZUg7TgD1nKz4s/GKaJGB/5g0AJMjxZ/1vuE0e
 n9DPevB69rWL5IkFkVatdDjx/LdnS7iNMx6GRMk3JXBiQgXUXh4kOoGur8e9tiMHwsNHJB07bas
 y3Yzum+e4eLmr9Gwq1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX4X8SDJP8i4hG
 BmRO8OkCzOUk3vFVbzF29TFpqEs2eMFp8wfj1YTWJV0q55Sgexh6wPOUuLShkpuGr/VOc2/9rH+
 2UeHl428vEji7mTufwNSVgg/Mag4Bek=
X-Proofpoint-GUID: yokWE2e0P2X8fuB3_1agiFlvHqqk8ZSV
X-Proofpoint-ORIG-GUID: yokWE2e0P2X8fuB3_1agiFlvHqqk8ZSV
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb8de7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
 a=oDkJ1FRbrV4SKMjXgYUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040079

On Wed, Nov 4, 2026 at 5:17=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 04/11/2026 16:11, Loic Poulain wrote:
> >>> We have a series from Antans to address this though.
> >>>
> >>> We should list the clocks the SoC supports not constrain that list fo=
r
> >>> one specific sensor on a test-case.
> >>>
> >>> ---
> >>> bod
> >> Good to know that Antans has a series addressing this. I agree that we
> >> should list all the clock rates supported by the SoC rather than
> >> constraining them for a specific sensor.
> >>
> >> One additional concern: if the clock selection logic still always pick=
s
> >> freq[0], listing a lower rate first could leave CAMSS unable to work
> >> properly with sensors that need higher bandwidth.
> >>
> >> Could you please share the link to the series? I'll rebase the next
> >> revision on top of it.
> > I don't think Atanas' series targets the CSID clocks, only the VFE
> > clocks. Ideally, we should make similar changes for the CSID clocks as
> > well, but for now they are not being considered here.
> >
> > Perhaps add a few comments documenting the supported rates and use a
> > single rate for the time being. Once the CSID clock changes land, we
> > should be able to revisit and adapt this accordingly?
>
> Its the same principle though.
>
> I don't think there's a valid case to exclude clock-rates purely because
> one sensor requires the higher rate and we aren't willing to do the work
> to make the clocks smarter.

Ok, fair enough.

Nihal, feel free to test & pick the following CSID clock scaling
support in your series, and add all the supported rates:
https://github.com/loicpoulain/linux/commit/a02dad23d219de1daa53e4095eb5289=
e5b5a6a15

Regards,
Loic
