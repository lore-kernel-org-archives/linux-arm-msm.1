Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2395166E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419343; cv=pass; b=XNoq3bOQhFVjANE9g1elddRYWKviTmzJSvQxGOl3PzgH8KWJi9HWJ157vDvfiYWbBMuDcCN4ylo/Pgj0lW05IbqairLZ6m2BwRHtj+AfQwBLh+Gddj0MD1LhBWivWwjdlTd2x6Z1G4CvRUdh7hnY/ZJmm9++iqW+8M8pYNWe1ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419343; c=relaxed/simple;
	bh=OZk21wfXZRb7SIDR9x4MPB+G+WpmzJI04w5Z9bPa0Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5B7VSQiEPuyo85BdAsnHNRid980tX8WIMljpiLj0r3oa509+58M1SK8Q2qay2zEstNj+vwkjRz7DsjsSy61kN89PkvsGhuWPiZsHRTUWklS4CCeByeepIIfrua9o4QPPVvbxhzVvuEF9YotLzYP3ZX29FP2UVaClE0zL6UO2lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcEJ/oB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/X6uLqq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcEJ/oB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/X6uLqq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0MYU3401433
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=; b=kcEJ/oB5oTstvwiv
	SlGT7Go330EToKGIy7e2UHwpCIVOpN55wwnmY9TFSWLa09HS/erB0KhN6hCPCVj1
	cURKKeX/9+hsAt82MZ7pY3CmmYl5RDUyrSOevuugQB6JbiiJMxECZHYMrR8TDIij
	un6x6dGUDV7jvYqD/o5u4s3jobV/shLnGP1KH5vJSRa9/lYhzwxPbrExgbdIqpQO
	INERChVCaSzDCI3aT7LFVyd3gUzAxPuSflofBkSn3hDD1S3Ux+U+Avc1hq/8SK0s
	UGXESGCbdryJM22teE40GCtLLDVnaahHpQkt0rSJNbnP7Rsnw/WOwFKISs1ceMog
	4vqXOA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn1c8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:15:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b92acedd9so77080236d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792419339; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjeJB1+AvjBVbuRbQVpDq4YwU7Vq2PH9hUm37M7vkb7f96unf9yyVKY3/Oytp/CIXJ
         OKbBv3pESz9nrwGu7sm6r8i4oO/8Ba3VSjEcJdRKDLJH4snllRsDVhr5jXUGIQJsGc+r
         BGopDqyJOTFD6LLPnaNod7rmNsNKb34E8asM8MlGZ9VwgxHwRBdpUIMNdz4UDM/+tOQF
         QfS6fMR+TjKsO2vW9llHNB/FxXKz3zW1M6PAbfnCDBwWNyW3OU0aFN0OJU+4HfRCPBxz
         r9ETMgfwHTur9z59FtNB5v/ovVcfp9fI0I3rF2KVw0OxdWMzB07DnDgER9l1b9VTLxI/
         vemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=;
        fh=FiZV+QFsT+oJ+PCW9oOftj7HAXwjU2hcEn5FNKZmjjw=;
        b=L4y+pDRb3OeMWUG1i0zNfsmKlOwmjKS73vdKfOKca1hRQxbrmsfroxCINHgzXmjUfR
         Z4G/Qzaa6KQS3lCFurdgM9/7XdP8yTXC992dBUvlSL1VFyT8XCOuxjoINiru+CtPFTBz
         SGwdbORbvRR63oVGjI6ekfppv+vhFFqc7tFPks23nWowNpGeCQ+6+llUICU5XXmJNOma
         l5bJKVcMDK0Syzenss+EkK1dbz2ojpHOl9VLdPOQPEQ6BFIAueJmdjjmu23+euGWMwRA
         kAbeq/84GXTjXy6pe0mN982eqANiQuD7O66fGvzGG1/zfHrerjk/FfePuBNYbVs0kP5P
         Rh9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419339; x=1793024139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=;
        b=U/X6uLqqg7w/83VNclm6anqqunXmMSr/m4XM/BjgFWFLCWB7fDDpX8ZN2jCm1h9JaH
         DcIXo9k+sAqDhG9VyWndmNjj15lG4oLNAnL+UllgeVbPtbzIHQ4EoiG2dMCvZ9UkvRKu
         ULPPHn7OID6rGjdAzVVjAu6AJNV1CDharsAHOr453XLjqW+qdpdjIOGDwUEZxE7TRI0N
         mPZrOgoEIEOVxNGUMkIvxcHTR4+YA+xhiLCqp9Td8VDz/SODl1Mug2canvFXVTM9kadL
         oTsOcXaXjb0z2kt6HM1l3QPLrhnLLOnAZVXckk5VqDTEkTExym1kiAHVv1wfEILpK56j
         Tyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419339; x=1793024139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=;
        b=HbxjFana7Sq/5Bm580Qkcnz3KT4ZZjKzEwBeRrxOk1HQffE8ufRn2xplv/PuxwNFIM
         dnvatFxk7HMgGjkArjuzSIkBZc0OA0FT7hC6LAzIn1TdNMh68Xsl+3XPfLVdteB+EZXZ
         0UUKEl4AM7+wfTIvmzLcIaSEDjb/5DQBLquLWnnPNjr3qq++8GMxC87fk49Dx5h4+Wvj
         u4ja9ap8PLV94bolTjX16mo1lEcoPCczcfGTOXqEjqOTpWGXm7M7Pej6+wQEodDpUlqs
         tyEqyuOtDLLs1Hg5NnAkyHwuynUT2FBfcG4v+I47TuGQ7Vrxo1QvWKYpMVhxgnYNyPWY
         SWKg==
X-Forwarded-Encrypted: i=1; AKwUvBwm72p78gx64bxtHnWl/ucyVs4Q8GI6rFTjgfB3eIDqO+PudpM2r1EtmBskhFKtg1tj2eIWCsN8fE+T4rS5@vger.kernel.org
X-Gm-Message-State: AFq9FYKV+veLxhZgEwBH+g3MuvJsR+wuzXRmn12pU3i0bWCU7ZNgwevn
	10oZ319jmBAPPalR7sgWYQoJWAhX+MG6XEkkOjsQBBprEZZ5dGdfsg1X54Nkwwr96qZaGI6iX8A
	fixMaRvHmJscNZLNRUXkHZU8qRx+0SSVzX8ugFVKMAOClZk/uHTN15d1KR+auv1WCxwGamQS8mN
	l0zHunVhIudEBKAqdHOhnFk7ZC2gG1uRb27VL8KMvnaws=
X-Gm-Gg: AYBFou3eI58Jr0r/40qul4WrYmlywh00M0qLColqjrDpQQ3wm+C2PIhyc/yvx5gVxe9
	AbW+Is8m5U9Bhvf0nO6em4IEtrZ/IMjJ8cfqEfZglJiVO26a98t4VXflR1dCNOM2q3X1NV2eiZG
	oj1II2Q1V22lLjY98SbxV6jGos81mI6Dth5FvefbK7DvsbdgDQk+W2x6tVBpPEBRQarQrza2bKS
	QbQA0EfNXxvh0csymi0qYqUBcEtHt8dLuIPsA3sn1Hrh8TegZdzziezOARrIoVM35r9CUPXMIk=
X-Received: by 2002:a05:620a:44d5:b0:93b:d79f:d941 with SMTP id af79cd13be357-93f29d8c957mr1279602385a.54.1792419338466;
        Mon, 19 Oct 2026 07:15:38 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93b:d79f:d941 with SMTP id
 af79cd13be357-93f29d8c957mr1279592985a.54.1792419337892; Mon, 19 Oct 2026
 07:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com> <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <xGBkVr2J5eTHzEO_i4LTjdWGRO1MXGiIijMf1PGUbQ2gEYqffgMDMtx4uiNyBldbbiW13zmcxMWZYYjJ1s--Vw==@protonmail.internalid>
 <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org> <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
In-Reply-To: <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:15:26 +0200
X-Gm-Features: AclHuK-VWW--gliXBfRDzVsTxK47hAbaeQbbFKbhiFsjaFEx70drXgk7IdDdHpM
Message-ID: <CAFEp6-2f7dzz2rrNuTE=4VXgkM55qvYY1SANcZE_8TutkJ+SAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        gjorgji.rosikopulos@oss.qualcomm.com, jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX39tYbe0MY1gp
 wxMLpH5WuJIqhIKmfSHCTG4SWCaH5hDjwxNYbeKlvPeQXUR7FPbQA0Mk4L+00Py8+t+B4ACLAce
 CfiJ4n1SwgrWf+i4+kr29Zyx6o2YkCk=
X-Proofpoint-GUID: QCyI203EkwAy_Sdyg7iKrhEvArQKd2t7
X-Proofpoint-ORIG-GUID: QCyI203EkwAy_Sdyg7iKrhEvArQKd2t7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfXwOAY7KeXoR0U
 HZMpzodpzvzR9yNvM5LadDYW40sTODtZcgQ3ADww9kyilcTf2YZpXbgIE0cljequWZOD+UrH2l1
 oqCRkZr9NA+T6y9c9jctGz3/vmq6vrZ8fhTM8AAUyp6m+CWLZdYQbLdLFCnyo9krEM18DVABoF7
 y3Zf1jJcTRZKSDW3/WqPFQwb8hK7DXh6ieUt+QgVGec99SFWg0HRCNbXRUMXJFGOkvQu6cN/n1j
 80b7pjyOR4nPtZJ2CW3p8eqMDE4G+uvGdPqSIKY3DquD4LjsTAEyDq1QB0sXLgchLvLn7H51qpE
 wy2NFNlsHDB40G4f6B8IYii3PFdA+tYHz8XCYqOS2B4EXjda031ChAkmkzqGJ45JhpgESVdB6C4
 fg2yws8FnIGtgNJdwdVcIgc+JPwAsBaecsQaWagblWrBvCYqYCf6Z2to4aR9XsuT8b1ZKN6yQgq
 wksK9H/EMbdgJA3TImA==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad6260b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=x0i7aQ4OanKIX9y7GswA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190056

On Mon, Oct 19, 2026 at 1:24=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 19/10/2026 11:24, Bryan O'Donoghue wrote:
> > On 18/10/2026 00:00, Bryan O'Donoghue wrote:
> >>> +    unsigned int        lanes;
> >>
> >> This statement and how you go about using the data aren't consistent.
> >
> > Re-reading this.
> >
> > unsigned int trios; would be fine too =3D> data_lanes and lane_polariti=
es
> > is a multiple of trios - always three - does it imply that the first
> > three entries in data-lanes =3D=3D the first trio ?
> >
> > Presumably.
> >
> > That would work too.
> >
> > data-lanes =3D <4 5 6 1 2 3>;
> >
> > =3D>
> >
> > trios =3D 2
> >
> > =3D>
> >
> > data_lanes[4, 5, 6, 1, 2, 3];
> >
> > trio[0]:lanes =3D=3D [4, 5, 6];
> > trio[1]:lanes =3D=3D [1, 2, 3];
> >
> > Probably "trios" instead of "lanes" makes more sense here and the drive=
r
> > just always validates that count(data_lanes) % 3 is always false.
> >
> > ---
> > bod
>
> I'm going to argue with myself.
>
> data-lanes =3D <1>
>
> =3D>
>
> lanes =3D 1; // not trios no need to introduce a new term

I earlier recommended using "trios" in the other C-PHY series to be
more accurate and emphasize the distinction from D-PHY's (two-wire
lanes), and because it is the terminology commonly used in the C-PHY
specification. That said, I'm fine with either term, but yes, we
should be consistent and avoid mixing "lanes" and "trios" within the
same structure.

>
> =3D>
>
> three pads on the Soc
>
> =3D>
>
> The question is - is data_lanes required for the CPHY opts struct ? For
> the qcom CAMSS case the answer ~ always no - we will be attaching a
> sensor and will read-back the positions from that endpoint.
>
> It is conceivable that other systems may want to pass data-lanes down to
> the driver because they won't have a media-graph but, I'd say we should
> arbitrate that then - leave it up to someone who needs the fields to add
> them.
>
> =3D>
>
> lanes // the CSID and PHY should agree
> symbol_rate // so both the CSID and phy agree on symbols per second
>
> Remove:
>
> - lane_positions
> - lane_polarities
>
> Since at least for this series, they won't be needed.
>
> The CSID still needs to know the number of lanes and how many symbols so
> that it can calculate bandwidth so .... lets just include the data we
> know we need.
>
> struct cphy_opts {lanes; rate/symbols}; dropping lane_positions and
> lane_polarities.
>
> I've no objection to the low-level timing variables myself but OTOH we
> don't require them at this point in time.
>
> Perhaps drop unless/until someone can show a need for them.
>
> Excellent bod, agree with you now.
>
> ---
> bod
