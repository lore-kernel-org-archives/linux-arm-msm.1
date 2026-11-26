Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685122;
	b=xVBjChIXMyRMfoXvmXEbWwZ2Tul+up34TwiiHTBZ632kYuZr//nv5ZpcjRBiJqKEIaRE
	 9iUBln0tTLN4BAvimew5WxvTwuB05b0itVqhXezl4dzyOFDffDeaaN/3RmpomYtIb5MPo
	 qtL8d6Q7ea/BL69tXcvFaNfoJDo4uJw2ityCpSYskSC4vCeP3oaogg4GGcUeAbR6Ts3Hm
	 nRb/rV96/yXAZJ17jUl1ZemOyC0Hn8gUxt0QZi5FKVqBxcmlZ365rK8ILrijHtN56MMw1
	 plqIDiY840mspXaJCsC7MLKvegqT74yrlVqkE30CzZbl7ToRpjO108FIlxLR9xm1tVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z6e8lKXfZsI8EGzM9i5Jr6xl5eF9MvsYlAAPWJhqZx0=;
	b=U/jQDTyATakTncDZ4dMaSE3CbIO3YOseS7w7/rB4IoYuutulzbMMM1qUpiGceHD/jYel
	 xYQ4QF1dtH0Y8RyTVDidUfQGSomhW+pOKZF4SsJuBLhRH2vaSMAEhapOzDor/yTU+JpXR
	 TuUEJ3VT8k+Q3lrsd8FoKPmcYjx7kupxkB/eefgy+gcyE0jo7mhyjwxayxXOTs7t2S1LQ
	 XMcj9fxCl17m4WiaYfCuu42WJJAkZ+QXsinMR8KAl9iBAcvgEMLaIRT9H8SxK+EC+qWuC
	 8UYyMmnv+YysGS5ss8HoLfZrzkjKkq0HVQhW1UQ1o9b5a7vUkuaEzwC9+dLfri8MSVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cCW9JMA9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cOWHZX2/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5975606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5975606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cCW9JMA9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOWHZX2/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4Qq2335360
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z6e8lKXfZsI8EGzM9i5Jr6xl5eF9MvsYlAAPWJhqZx0=; b=cCW9JMA9N9jqEPyZ
	f58UgkPZhogmuFx7EaHWvlh9b3//hVk54l3g6BVuLiVNpHs/mR30YIQxn7fdzfGs
	qWRvONdbISBaMUo6zdcgPfCDjVtYs0UBRwA+J0CVWWtGbtuXgIJCG5bWkcmcPlQi
	hVr9IxGV6F3J3QnnlUBCWw5hwxELdNZob4L7bhjWtnX1RMT35jIkBwSYZrsFxS3c
	JBmVhvj4VhheustQgonuOhZSvKpVaYLUm2jb14hBhpZMyf5GemfcJAGFiL7Fb5Jo
	79HH57KSXRv3OPoA0pJMNqUKdmvjMCv/TPdQNGjLzASYVr5Vs7wrV/iU2876WxGX
	lqFPmA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak01kg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:25:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92106c98714so132780936d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 01:25:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795685119; cv=none;
        d=google.com; s=arc-20260327;
        b=TzsvP26TUkG16GBa/2Ckc6t35lQl0rQixNJ+hlOuLTAewDSMH6SfNVhmZOw1miv1gI
         GWAfKsRKhcA7QgyMIvDpPTzz3NcZn1a2haiOzg8jJJSv4tQl/Mu8i5ZQff+lSrudw1hg
         XVSjYtWVvcXCeEF7C1XEkWg8/wc1FOJ+ZhXJQw89sWNYoKEkrnBHfo1/C5TI1UMsUiXJ
         TMtPBhmC7UALSwB25radnuZUuV/cYUC/ISPOH6/EQbUAQ6vfog0VgmTuzEnNhPGjAB6a
         Mt08jAfk9RpBmpBC2Rq9doMNAa+vhoIWOOmpLmOOs7t358551EMeSgbvJJgRgTHRQ1NZ
         EcRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6e8lKXfZsI8EGzM9i5Jr6xl5eF9MvsYlAAPWJhqZx0=;
        fh=a5JrGTshTu8eHh84J2PvZVFj8tcnCgJW3MBfdkhmSBo=;
        b=l+Rh2p/hRbN+KfEHR3fQn0zk5/PO9S5B+OSlABXKQPDUKnKEX0eZHzf9s5bF0gD5rI
         eZFOUYzln6A0DGpJxy9znu86E4FRJSPkOx24yEPDzVFF9Xg2pQO4Ptugq43MNtO+wMdl
         USpi1xPj4Acl+qrYf9FULrIxPQkRfhkHvbC9yLDHxo2JBM43DWJmb6OSy4+83pC8Zid5
         jA5w14NixbFIBSFPO2QNSyT9Wb48LkJ5D498ZLkGzu1CnjmvotO2VdHTNkODd+Iz4erD
         dOvOtgzUMqS/ZQ0QzATGAMyEikXAJsuaqZhrzfWFbYMSb6wTpxmJT6K8CVKijfD2cdQX
         IHBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685119; x=1796289919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6e8lKXfZsI8EGzM9i5Jr6xl5eF9MvsYlAAPWJhqZx0=;
        b=cOWHZX2/9ZAR9+PqJLAgCMFdVpbCjTOSnSWlVgA2QE+2vmFePO5LuQtJ5q4C1pjEI/
         C6mbJLGjmlwRmlpoK1MRcLxrfomPUQaFfcLzpXUK7saN0hiXDSuBqdb0En4wGp40JWTe
         ZQHZeCRFPamS0yhTGqGFjtWrvppZpYEdiTiVHafvFt1zRJ9ZqJxJoasTUG/LJykBbZD/
         2GlBLroHP2saMjAo08+qMhjIrFdJMwGqyq+eEbMrUdYricyQjPWrocUmG3WJLBscQnx7
         lAo00pPGeZR7JhayHWsbdD7DwgrwW8hPhEwAFG5kRDhRIpwjZ5xx6o44mF/cgOA4/zJi
         qtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685119; x=1796289919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6e8lKXfZsI8EGzM9i5Jr6xl5eF9MvsYlAAPWJhqZx0=;
        b=aHOA+qooYD8CyFPncFetCF1611oySqEbg5wRubI+PTu1R2jSeAiYFczJ0vDhGw7OMs
         yJMs7MrrWDXBuefURzB6MjUOyg+yJOnwXxXLfqlmgAO/VI/F6Ev0AL4rGx4B59YzNkNd
         cULibZHC0JPV7sbmsU1kWx72vSX2FgkuxkyCqvuCxs2SFWj5z9m/bY2gjjhxRwokghAC
         35OHCZhzT5LuCXwO85VO7Nm8te54F275ks8zPIRndotu/JYtJx5m8o9ck7J50zXrgnIf
         xdxQa8wqfNDnWnpNX9jTdP58jmEt8VLGd8wa4vmgRv5WOQetZX2Ny1OT3q+hQCpC5tYy
         uiBw==
X-Forwarded-Encrypted: i=1; AL+hErE58V1u4XazXzTJe83oY/v54mkOlMPSuyEEgRI+uZYi77W1k2vRdxgVMLwtuDVH95n9SITEKW4+HPmSZ8VC@vger.kernel.org
X-Gm-Message-State: APuU4Z9diyc7n/z82GhGCn0FRIW2VF+mffnjOqtQtPs0bu4U5DO2IwBM
	awRCJneh5Yuv7rBHVzqeXyg7uCg9jOHgQ0IW1kWGH90UlVfyhdhiy1ML49sEvFgEQ89P2n2Qigi
	A6ojvBu1gh+8M5BO7mz1WUCysS3mH2TOTcp43Q1qkqrMIdQyiHzcqBb37GoPLQbTe7KIdtvHiCO
	1Q5a+FikdgAgdqV2uzFdEIKJlweVA0Zfe6NmSF8zb6k0U=
X-Gm-Gg: AZFdTZc5uyvr/1+/UWQbsdqEjCcrD/W9dWrbLyt0CTSsMzW9exIaYWhohIT7hHt1DJt
	YAbgm0b/OHWOAVRXdbH7WJykFxHltPx9dE2Nxx1DkbDsdPoVZ5GMlSjLXIKEzyDiYgGaq+f3woa
	8WMVIBVxrSmCZsvPHISIbNqTz3bE2W2jOuKQmA/CX4TWi9kcdSfSL3cCxU8balN1W/neVSKLfCc
	SqZcjoGQ3yaS7VqBTYvdSwmgXait/creiosAVOh/pfIzLiiJ0iZJo/5HKmOGO65n0OdKZLT5pzf
X-Received: by 2002:a05:620a:2856:b0:949:873d:3dbf with SMTP id af79cd13be357-949bab58cebmr3663076085a.59.1795685118961;
        Thu, 26 Nov 2026 01:25:18 -0800 (PST)
X-Received: by 2002:a05:620a:2856:b0:949:873d:3dbf with SMTP id
 af79cd13be357-949bab58cebmr3663071685a.59.1795685118401; Thu, 26 Nov 2026
 01:25:18 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-2-24c955e43d75@oss.qualcomm.com> <8808df3f-e090-4dba-af7d-a51146290d48@oss.qualcomm.com>
 <c5ec6619-7001-4ab4-9035-405dcaa3b739@oss.qualcomm.com> <CAFEp6-2kW9-Cq9kz-T9Rdz5EKL92TW=QzcSPGBPqLNfcLeDYMg@mail.gmail.com>
 <b962afd1-9e66-4780-a7ac-43426bca1a67@oss.qualcomm.com> <CAFEp6-1Sk1rjhqsdm+-GHBESdExWr4vVX5wMcFzEpMt8zQJhsA@mail.gmail.com>
 <d56b1e2b-ff7a-4587-b45e-2607ab85861d@oss.qualcomm.com>
In-Reply-To: <d56b1e2b-ff7a-4587-b45e-2607ab85861d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:25:07 +0100
X-Gm-Features: Aa3M54oHMmZdn8Qfp7yIftc4MbEujsv0MVJxSIvHKCzi6TGrZi-RYBixrz8yxzk
Message-ID: <CAFEp6-3LJbCKj+tUpaYL1TE1XXYHc7kW4p-97JOm8VvB-Fm5Hg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] media: qcom: camss: csid: Add an operation to read
 the SOF timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07faff cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=n8IlR8rfZ27013JM:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=-zCU6LR9qziFT2Ef_f0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vzC8Sj73F5uHr4xMHWO_D2bPmqWCXeke
X-Proofpoint-GUID: vzC8Sj73F5uHr4xMHWO_D2bPmqWCXeke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX/xtx1ctBXZzJ
 ewFEhc1rk6Ar9bYvr1oCptBGYLKR+c3rCqBgllxC7uMESpEdbMFN+k8ZPC1j8qViCfOhBqDKdaL
 UBO5550a6RRzOkcWuvGp7BRjuuMA8GwH+VBsGz/7K2WIGU4tYpyDoFABbY+hNhGy4x9bKxm7Y28
 T9tpVEzMigZKPkivO8PYp32q87dBvLYRDNgZLXaXG77OIYQO1utLk1sENLtupCVYJJUTvPyOFTy
 vo0TgU/BCO4My2l78asmwobiMpXWflonmcdEEeFOLB9djWTQEloeBY8SZhaBQnOgaPQ7eApAOA3
 6E1KuWMogZY+qT428J4E9UDmNCTY+mKt1KgqC7/D3mTIAFcTBzgMNAESTr1KoWxflLfiYBREpvP
 o5XCRcQ0Bt6KbyIRWBzIEUxiFrW9aYqGnbwioll846hZSRWqaaWApRde5mJJ6Jh7e8q7lXWiG1X
 8snUmmh/U+iJAaa/p4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfXysdbLsUfv0Bo
 7wgjeGafkODi9xb0rMRO7IViiTF5RU6BhCNMrAifrJamnpzKdmXhYy2+l4bmYkWFN3hFz7fMYF9
 aPlrddtCV8h78rXoxm1eV2RE99B8KNY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036

On Wed, Nov 25, 2026 at 6:23=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
>
>
> On 11/25/2026 6:21 PM, Loic Poulain wrote:
> > On Wed, Nov 25, 2026 at 4:01=E2=80=AFPM Gjorgji Rosikopulos (Consultant=
)
> > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 11/25/2026 3:18 PM, Loic Poulain wrote:
> >>> On Wed, Nov 25, 2026 at 1:06=E2=80=AFPM Gjorgji Rosikopulos (Consulta=
nt)
> >>> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 11/25/2026 2:04 PM, Gjorgji Rosikopulos (Consultant) wrote:
> >>>>> Hi Loic,
> >>>>>
> >>>>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
> >>>>>> Modern CSID revisions latch the global timestamp counter at SOF. T=
hat
> >>>>>> counter is the ARM architected counter, so correlating it with
> >>>>>> CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched =
value
> >>>>>> into the time the frame actually started, rather than the time the
> >>>>>> interrupt handler ran.
> >>>>>>
> >>>>>> Add a hardware operation returning that counter value and do the
> >>>>>> correlation in one place, leaving a CSID revision with nothing to =
do but
> >>>>>> read its own registers. Revisions not implementing it keep being
> >>>>>> timestamped at queue time.
> >>>>>>
> >>>>>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  drivers/media/platform/qcom/camss/camss-csid.c | 72 +++++++++++++=
+++++++++++++
> >>>>>>  drivers/media/platform/qcom/camss/camss-csid.h |  9 ++++
> >>>>>>  2 files changed, 81 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/driv=
ers/media/platform/qcom/camss/camss-csid.c
> >>>>>> index 588122beec854ae5b78de9997b68c7a81d4207e1..0d9b4f7dd768aeaed6=
5d01da58b4dd8a3a425cbc 100644
> >>>>>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> >>>>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> >>>>>> @@ -8,14 +8,17 @@
> >>>>>>   * Copyright (C) 2015-2018 Linaro Ltd.
> >>>>>>   */
> >>>>>>  #include <linux/clk.h>
> >>>>>> +#include <linux/clocksource_ids.h>
> >>>>>>  #include <linux/completion.h>
> >>>>>>  #include <linux/interrupt.h>
> >>>>>>  #include <linux/io.h>
> >>>>>>  #include <linux/kernel.h>
> >>>>>> +#include <linux/math64.h>
> >>>>>>  #include <linux/of.h>
> >>>>>>  #include <linux/platform_device.h>
> >>>>>>  #include <linux/pm_runtime.h>
> >>>>>>  #include <linux/regulator/consumer.h>
> >>>>>> +#include <linux/timekeeping.h>
> >>>>>>  #include <media/media-entity.h>
> >>>>>>  #include <media/mipi-csi2.h>
> >>>>>>  #include <media/v4l2-device.h>
> >>>>>> @@ -37,6 +40,16 @@
> >>>>>>
> >>>>>>  #define LANE_CFG_BITWIDTH 4
> >>>>>>
> >>>>>> +/*
> >>>>>> + * The CSID latches the global timestamp counter on SOF. That cou=
nter is
> >>>>>> + * the ARM architected counter, 56 bit wide and ticking at 19.2 M=
Hz.
> >>>>>> + */
> >>>>>> +#define CSID_TIMESTAMP_WIDTH        56
> >>>>>> +#define CSID_TIMESTAMP_MASK GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1,=
 0)
> >>>>>> +#define CSID_TIMESTAMP_NS_MUL       10000   /* NSEC_PER_SEC / 19.=
2 MHz, reduced */
> >>>>>> +#define CSID_TIMESTAMP_NS_DIV       192
> >>>>>> +#define CSID_TIMESTAMP_MAX_AGE_NS   (2 * NSEC_PER_MSEC)
> >>>>>> +
> >>>>>>  #define MSM_CSID_NAME "msm_csid"
> >>>>>>
> >>>>>>  const char * const csid_testgen_modes[] =3D {
> >>>>>> @@ -1370,12 +1383,71 @@ atomic_t *csid_get_sof_seq(struct media_pa=
d *pad)
> >>>>>>      return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
> >>>>>>  }
> >>>>>>
> >>>>>> +static u64 csid_timestamp_to_ns(u64 ticks)
> >>>>>> +{
> >>>>>> +    return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIM=
ESTAMP_NS_DIV);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static u64 csid_timestamp_to_monotonic(struct csid_device *csid, =
u64 ticks)
> >>>>>> +{
> >>>>>> +    struct system_time_snapshot snap;
> >>>>>> +    u64 delta, delta_ns, now;
> >>>>>> +
> >>>>>> +    ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
> >>>>>> +
> >>>>>> +    /*
> >>>>>> +     * Translating requires reading the counter the CSID latched =
from.
> >>>>>> +     * If timekeeping is driven by something else there is nothin=
g to
> >>>>>> +     * correlate against, so let the caller fall back to IRQ time=
.
> >>>>>> +     */
> >>>>>> +    if (!snap.valid || snap.cs_id !=3D CSID_ARM_ARCH_COUNTER) {
> >>>>>> +            dev_warn_once(csid->camss->dev,
> >>>>>> +                          "CSID%u: Can't use hardware timestamp, =
invalid clock source (%d)\n",
> >>>>>> +                          csid->id, snap.cs_id);
> >>>>>> +            return 0;
> >>>>>> +    }
> >>>>>> +
> >>>>>> +    /* How long ago, in counter ticks, the timestamp was latched =
*/
> >>>>>> +    delta =3D (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
> >>>>>> +    delta_ns =3D csid_timestamp_to_ns(delta);
> >>>>>> +    now =3D ktime_to_ns(snap.systime);
> >>>>>> +
> >>>>>> +    /* Fall back rather than reporting a nonsensical timestamp */
> >>>>>> +    if (delta_ns > now) {
> >>>>>> +            dev_warn_once(csid->camss->dev,
> >>>>>> +                          "CSID%u: SOF timestamp predates CLOCK_M=
ONOTONIC, ignoring\n",
> >>>>>> +                          csid->id);
> >>>>>> +            return 0;
> >>>>>> +    }
> >>>>>> +
> >>>>>> +    if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
> >>>>>> +            dev_warn_ratelimited(csid->camss->dev,
> >>>>>> +                                 "CSID%u: Too slow! SOF timestamp=
 is %llu us old\n",
> >>>>>> +                                 csid->id, delta_ns / NSEC_PER_US=
EC);
> >>>>>> +
> >>>>>> +    return now - delta_ns;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int =
id)
> >>>>>> +{
> >>>>>> +    const struct csid_hw_ops *hw_ops =3D csid->res->hw_ops;
> >>>>>> +
> >>>>>> +    if (!hw_ops->sof_ts)
> >>>>>> +            return 0;
> >>>>>> +
> >>>>>> +    return csid_timestamp_to_monotonic(csid, hw_ops->sof_ts(csid,=
 id));
> >>>>>
> >>>>> I am not sure if we need to do this every SOF. Most probably the de=
lta will
> >>>>> remain the same during the streaming, so I think it's best to use t=
he delta within
> >>>>> tolerance and then apply that for the whole streaming session. Also=
, I think it's better
> >>>>> to have a constant delta from the monotonic clock rather than a flu=
ctuating one.
> >>>>
> >>>> I think it will be the best to send both timestamps to userspace, an=
d give the freedom
> >>>> to userspace to decide by him self. But the API is not allowing that=
 as discussed.
> >>>
> >>> No, the delta is not constant. In fact, that's precisely why we use
> >>> it, it captures the variable CPU and software latencies between the
> >>> hardware event and the timestamp acquisition. By combining the
> >>> captured hardware timestamp with the current system timing
> >>> information, we can reconstruct an accurate event timestamp that
> >>> remains aligned with the Sensor/CSI timing, rather than being affecte=
d
> >>> by software scheduling and processing delays. According to my testing=
,
> >>> the resulting timing error is below 1 =C2=B5s, from which we can deri=
ve an
> >>> accurate sensor framerate.
> >>>
> >>> --
> >>> watching /dev/v4l-subdev2 (msm_csid0), id 0
> >>> id0    478 ev   60.06 fps   16.650 ms
> >>>   events           : 478
> >>>   timestamp (mono) : 180.160315690 .. 188.102256050
> >>>   duration         : 7.942 s
> >>>   frame rate       : 60.061 fps
> >>>   frame_sequence   : 539 .. 1016 (missing: 0)
> >>>   interval (ms)    : mean 16.650  median 16.650  min 16.650  max 16.6=
50
> >>>                      p95 16.650  p99 16.650
> >>> ---
> >>
> >> Ok i will test the changes on my side. Just for other people we have c=
onflicting names
> >> CSID (stands from clock fw perspective to Clock Source ID, and from ca=
mss for the
> >> csi decoder). If you are sure that the for csi decoder the CSID_ARM_AR=
CH_COUNTER
> >> is always the clock source this will work i agree.
> >> But if that is not the case and we end up with big delta what is the i=
dea to do
> >> that every frame. It is kind of confusing to me at least. Also i think=
 we need
> >> to check for the other platforms if the clock source is always the sam=
e.
> >
> > Yes, the camera hardware always snapshots the architecture counter. If
> > we detect that the monotonic clock is not derived from the same timer,
> > we simply fall back to the traditional IRQ timestamping path. The same
> > fallback is used if the computed delta is found to be inconsistent.
>
> If the both clocks are from same timer there are two checks:
>
> 1. Big delta big delta something is completely wrong,
>    most probably the csid timestamp has some stall data.
> 2. snap.cs_id !=3D CSID_ARM_ARCH_COUNTER. If that is true do
>    we need to check on every SOF, most probably every time
>    you will get the same result.
>
> If the error can be recovered on next SOF maybe make sense
> to enter this function. But i think in both cases most probably
> you will end up there for every SOF, which is for each pipeline.
> If all all streaming 4 times per frame.

Yes, I see. We need to snapshot the system monotonic clock anyway, and
I don't think the extra if is particularly costly. But what we could
do instead is returning the already snapshotted system time on error,
avoiding an additional timestamp capture in the caller through
ktime_get_ns().

>
> >
> > When Linux receives the interrupt, we know:
> > - The counter value now (C_NOW)
> > - The Linux timestamp now (T_NOW)
> > - The counter value captured by hardware when the frame started (C_SOF)
> >
> > Since the Linux monotonic clock and the camera counter both come from
> > the same hardware timer, we can convert the difference between C_NOW
> > and C_SOF into time (T()) and "rewind" from T_NOW back to the
> > **exact** frame start time:
> >
> > T_SOF =3D T_NOW - T(C_NOW - C_SOF)
> >
> > Regards,
> > Loic
> >
> >>
> >> ~Gjorgji
> >>
> >>>
> >>> Regards,
> >>> Loic
> >>>
> >>>>
> >>>>>
> >>>>> ~Gjorgji
> >>>>>
> >>>>>> +}
> >>>>>> +
> >>>>>>  void csid_sof_event(struct csid_device *csid, unsigned int id)
> >>>>>>  {
> >>>>>> +    u64 ts =3D csid_hw_sof_ts(csid, id);
> >>>>>> +    struct timespec64 sof =3D ns_to_timespec64(ts);
> >>>>>>      struct v4l2_event event =3D {
> >>>>>>              .type =3D V4L2_EVENT_FRAME_SYNC,
> >>>>>>              .u.frame_sync.frame_sequence =3D
> >>>>>>                      atomic_inc_return(&csid->sof_seq[id]),
> >>>>>> +            .timestamp.tv_sec =3D sof.tv_sec,
> >>>>>> +            .timestamp.tv_nsec =3D sof.tv_nsec,
> >>>>>>      };
> >>>>>>
> >>>>>>      if (atomic_read(&csid->frame_sync_users))
> >>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/driv=
ers/media/platform/qcom/camss/camss-csid.h
> >>>>>> index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..17cc3b42c8d83180d6=
abfcc3efe22178dcc2f2e7 100644
> >>>>>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> >>>>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> >>>>>> @@ -111,6 +111,15 @@ struct csid_hw_ops {
> >>>>>>       */
> >>>>>>      int (*reset)(struct csid_device *csid);
> >>>>>>
> >>>>>> +    /*
> >>>>>> +     * sof_ts - Read the counter value the hardware latched at SO=
F
> >>>>>> +     * @csid: CSID device
> >>>>>> +     * @id: CSID src-stream ID
> >>>>>> +     *
> >>>>>> +     * Return the raw counter value of the most recent SOF
> >>>>>> +     */
> >>>>>> +    u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
> >>>>>> +
> >>>>>>      /*
> >>>>>>       * src_pad_code - Pick an output/src format based on the inpu=
t/sink format
> >>>>>>       * @csid: CSID device
> >>>>>>
> >>>>>
> >>>>
> >>
>
