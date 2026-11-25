Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612712;
	b=4gw1SQETKceyfX5CYwmhyPOqp6CVRj6hLpEynB9ooomNGvX6VtbEUQiEziZJ/DU8m6/c
	 wg7b2nPMAszLAk7vH0Q1uiqiskDCx2feaZTeRb4ApLMTK8STwv/RKURyZKaL+FPabwKUM
	 PgCtVklxO0/OVVC8z3uKCpQUX1IBulkPcd+U8oheRVoSJ5wh8a40Yn0oh3RF2SnMJGgpL
	 LXl4ERuu85cvy4RadzlmwVekZ/+bPDMORtflOWFscOoDBY9f31PDMTX9nJlfmYmLjEa9U
	 rmW07d7/1/yVh6HckfIg0RMRL42o4HAWs/ZDoq/CJL0erRfT0nLouXIkCSy8MwvZscg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jfQ8zUONTyEFfJZ+AnDpw8kVCqkJU2Y/oL+XJFKbGKQ=;
	b=VwgSaz2qa2SrhqhnFZ8oNUdVW5vF1emxpQm8bzgDtgIekDXw3mYIWobTNMERQ+tRL2k4
	 URGMX0xNvqZdIhdcAqZWniqOs5Ar7icc3u9jLAvCtzJvZT3vNez9UWjYZkU3FHHvUD4pL
	 HXZ/jK8oRrYJ2hszUR5SI4wxku2KtevWnzDMjXbtcr0lFc5km8UTV65Zb3miAijXdh/la
	 5LKNOK2jixMmi50IJy4tx23fK+oPKNjLf3fjvnQP8F/c7V8DevPLzNCQqDoi7Vd2zO5ZX
	 qY/FvjoP30TukTDlMPGc39GBVA9I1EzOFs+loJ5FKFW6SJzyqQe3bS8i/8oyR9NBEsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=STRQMq6x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BV8EAMFg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B125606A338
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B125606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=STRQMq6x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BV8EAMFg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mCCr3763929
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfQ8zUONTyEFfJZ+AnDpw8kVCqkJU2Y/oL+XJFKbGKQ=; b=STRQMq6xNGwHCMk7
	fXateg9/XtLfBr9qpcXwH6KSUbkDddyLuUKuIgYCv/mlDnPVWasDlm2Qy/SUcB9b
	8fh5ph1cE1albFkMW1KZ0evWmfAr3l6NlvXpNzbsVUXFfcNGMJBkC8VApujcCh+8
	Q5jfErCFb5pSnw9AlOTiw9Ll/smChyteCdpI/WiR642dLYSLl+321FwiRE9B7HQM
	5Hrtjjr1P3hxrEBcThapFLnfNS6P0ZgoMreFlTrcLzUI2rT3p+1xxrAQdUxTs7M/
	qjWkRwWPJYvE+kwI5I65ztZxQSQnPCYqg6QkK8BnRXqSXHmRI2jq6jV0O/WvJoO8
	ZBsVQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rxqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so650826685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612708; cv=none;
        d=google.com; s=arc-20260327;
        b=qNBv9JOHIUMRsN/yTNa46PYm1PQcXF/4NZjeeuY1aOVJsAjh3YCzN04fgu9VZH9oht
         redwYRlQaPBUwJOUaStY4+nlPpwA+zu9+hBzPakXRHOtX9+qD7RjC53EzYqQ6qM/DhYz
         xU1O+8LeYca/AVgVBZSYZPDUw0rF4IJenIpJ2i+Sf++xdQ99cpVOgZ8OxXsHDWarfkqc
         LPc52ezQwD7Lmt4x5xhcXUghKQTOLt2Qdyfj8L2IMm58slO23Idbqv1O8lESWUVhgwLe
         mKv2BpPb260O3iU+f5iZ0Fv4AeMvbc803Y8Gx0muubwblQDBVJZWvRm2nW0zU0tZ1UD8
         JmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jfQ8zUONTyEFfJZ+AnDpw8kVCqkJU2Y/oL+XJFKbGKQ=;
        fh=kCyATJSndsDXaL0g1zK2TeaTRAfoYgmHJxKM9vr7paI=;
        b=WQrqkmWGgjvo+t2b6F8m7sWAtOCYdbxmj7qebLDeoIn4BidqytZjcmAA/EB8m/7ooa
         vewq46PgO0GLeINLub7vSnEnNnAyzW2U9TnETRAjNEOpC9JhViS2PqZCMdqCNmEi77+Y
         gJU0+j7jhOJDFAtXtVznQdr9FzKmQ5ZzjP2+EXEnKElmjDh73IVPSOd+uGwMA5pFNChF
         X8WYbwIkDl2W78Wi6EJGYJbG5yKmN8ACWoeEseCean7XxhW01hpcoBsW+3CdepkUi2iy
         VxNqYO+0yOMgqMOajif0Qu2mgo7q7mibZDXxPJ1C9Mtpf18MWRmCvtPTXExtxOE/06Wj
         42bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612708; x=1796217508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jfQ8zUONTyEFfJZ+AnDpw8kVCqkJU2Y/oL+XJFKbGKQ=;
        b=BV8EAMFgczDRZlqNkFIppZz6Eu8ZCDwVnVv75+Uh75gtsdojJKBfLeSMnLBfTzH4YT
         ClCueT6SDvVNZ9YzP8VFsq6smtBcniWZbeBt+mMtl7nNVYjgB4m55dM+lFHcXFI1veHC
         cAzbgubDvg9OBB9htiGHFflg1JJKdHGop8n+l8UWJ3FqezwD6NtEhWbU9mUEKJg0KSil
         ryBPGHp1InMcHooUntGGI9s7cvqHz4Bvc1KnzM4e6m71X/S4Bsh5fgE81DozrjENQAA8
         +yS3XxDNGBS2SJWLrPl64JMX30gbyFB4wa2vqeqL7YdXJMc0CO3GcjAwHTh4sKVtpdIw
         6nWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612708; x=1796217508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfQ8zUONTyEFfJZ+AnDpw8kVCqkJU2Y/oL+XJFKbGKQ=;
        b=d6ZrqyUsKvwTzck43tkX1LBWTSXZM8F6dxQAKl2rKmDucWsVSzBdxvK7MHua+1H4EP
         aEmnfhf+8L10tBXhkHkwLUfSGNkAg5Ku7JP+Hy4bY/6Ioy9L/V/Mv315Ug6+npKKL1X/
         wX39NOKl0pZNQNsws6KcUR+2eOuwLCj5fJaWLxFhOChIkLR0XRX717MLOnN6sX3GHkAZ
         kgvvdzyRLKP5O2p0MdQPzjoGJ6RJeOspvimjF410CQAbWPtZ0Ku27IF3VKfdeE616xIk
         gZeSRZIBAg1/9l45ZT0gTNCwp7ycFQOpYAiSktmoUJcf9ensXOMmKJ6jO101fjjrPHHQ
         v3Xg==
X-Forwarded-Encrypted: i=1; AL+hErEhktLwgT+FD1zn4ic6o2L2G62n6HfC/FTQoO65IMwSMzFA3o9l2E9H5067Dgx+IFPxKwKsIBz7p3u/LcAE@vger.kernel.org
X-Gm-Message-State: APuU4Z/HdCWs4Abz3fid9W5Efg+vqmFjRjlxgS79J0p5nNPi5fsHA503
	44XRUJQbmdhR0MnKaG8YORGOR09kvCC13YGzT6Oqw1hlaPQIufFoI7bE+Xl3zcI5g17zVFAQswR
	hzpl33h9v5Nnvqj3/ohIabRJ8iW1hM5qDLxX9nkIAGHWKJjH85xX8aFF7ZtAkN8Pn01rVhPACos
	kKJYtWGSSKZUmWQO5M45K/YxVMEyOsiQSJfJu+tmN5Cqs=
X-Gm-Gg: AZFdTZdzwlBb+jHjxCaBgnxVtdJZqMZsisP4NeWA4pqSdnX8r1XtQjDjVYY8VsQDKGm
	HiYCwowf5UoNW0LQZxfCAuGLkw5xk44SW7kYC21mhJytgpHllDo8jDuR0itDUrbTe0sa5eJOBBK
	fWvE8T2HDi5b5+oRta9nDZ4DMZbW4cMRkX95v8AXz7QlhnfM1MCcHuHkyh8MCJ1JnJmT0rizbGp
	cOXjo7sNklg8ODwq3/Rf25/IxhyoH6PR4Kpd5yKDXlRm7ieiy1PQu5KzsAIneeaPPM6nTZPBnE=
X-Received: by 2002:a05:620a:46a4:b0:949:70f1:de35 with SMTP id af79cd13be357-949ba825d86mr3250678485a.7.1795612707350;
        Wed, 25 Nov 2026 05:18:27 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:949:70f1:de35 with SMTP id
 af79cd13be357-949ba825d86mr3250672385a.7.1795612706762; Wed, 25 Nov 2026
 05:18:26 -0800 (PST)
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
 <c5ec6619-7001-4ab4-9035-405dcaa3b739@oss.qualcomm.com>
In-Reply-To: <c5ec6619-7001-4ab4-9035-405dcaa3b739@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:18:15 +0100
X-Gm-Features: Aa3M54rS6W4Gj8-UsNxYBgNGFaRIiqao9vqyRPZWDkWxosV6vOaMiiF9u8oAvDk
Message-ID: <CAFEp6-2kW9-Cq9kz-T9Rdz5EKL92TW=QzcSPGBPqLNfcLeDYMg@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX9LInrI/jOYqN
 0pkPyF7P46aCGG2I/7pXwS2YBo1Gw4ZDTfqmEF0Up6nxm700Pk5+9HHv/glEfEY0I7t3N9AzUiF
 eCVUjnEaoaIJIk9uwgyuqM5bbdu83Zk=
X-Proofpoint-GUID: KXj4hY5R1vBqDdHCFwwNRwPgAE0ZBJ1U
X-Proofpoint-ORIG-GUID: KXj4hY5R1vBqDdHCFwwNRwPgAE0ZBJ1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX7Tsv2px63dth
 0Fch2e9qeT+3bmOQO0FUWPKFBKp37c8fsnZpgoiy+mjH/9vIV0ec3L50vy9d0BfsoC+WuUR8KN8
 LD4lfJjFybgnuzeOoqLCIp4G52m9+WD3bW/Pch1mFzLdS9fpHvvafC+N4/kOroei1rIJwceUIgn
 m17hQ1nU+BUgo1AY6jSwuQBU1mBjriC8AYajBPJ9WDoefZGeuZFoB2u3csIf9S0XB5k8UCU0gzK
 7K4djWexWUMidoUBrZXagCctZNOfE1IrgkmNoJYej6OGk4BtwM5ZoqmFGF9tux9P8d2092Ol76F
 ypoVmsRovKVdyMENTpe68o8s5xrl4Xjo0QzDxpo1jkbx2r3NBFEKtZbX0iSZE915rgtlF7dPY4p
 qGtbz0JsrjbKKHdXk5EI+LiNkfnGD0mr4cA/yfnlJtG/h0kaTbcsYK5qlEorY73VRhREHe9z1k1
 qoW0dUo87KkjS4LsK7g==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06e024 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=n8IlR8rfZ27013JM:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=FHOEy1rzMmd96heRGqsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250052

On Wed, Nov 25, 2026 at 1:06=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
>
>
> On 11/25/2026 2:04 PM, Gjorgji Rosikopulos (Consultant) wrote:
> > Hi Loic,
> >
> > On 11/25/2026 12:19 PM, Loic Poulain wrote:
> >> Modern CSID revisions latch the global timestamp counter at SOF. That
> >> counter is the ARM architected counter, so correlating it with
> >> CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched valu=
e
> >> into the time the frame actually started, rather than the time the
> >> interrupt handler ran.
> >>
> >> Add a hardware operation returning that counter value and do the
> >> correlation in one place, leaving a CSID revision with nothing to do b=
ut
> >> read its own registers. Revisions not implementing it keep being
> >> timestamped at queue time.
> >>
> >> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/camss/camss-csid.c | 72 +++++++++++++++++=
+++++++++
> >>  drivers/media/platform/qcom/camss/camss-csid.h |  9 ++++
> >>  2 files changed, 81 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/=
media/platform/qcom/camss/camss-csid.c
> >> index 588122beec854ae5b78de9997b68c7a81d4207e1..0d9b4f7dd768aeaed65d01=
da58b4dd8a3a425cbc 100644
> >> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> >> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> >> @@ -8,14 +8,17 @@
> >>   * Copyright (C) 2015-2018 Linaro Ltd.
> >>   */
> >>  #include <linux/clk.h>
> >> +#include <linux/clocksource_ids.h>
> >>  #include <linux/completion.h>
> >>  #include <linux/interrupt.h>
> >>  #include <linux/io.h>
> >>  #include <linux/kernel.h>
> >> +#include <linux/math64.h>
> >>  #include <linux/of.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/pm_runtime.h>
> >>  #include <linux/regulator/consumer.h>
> >> +#include <linux/timekeeping.h>
> >>  #include <media/media-entity.h>
> >>  #include <media/mipi-csi2.h>
> >>  #include <media/v4l2-device.h>
> >> @@ -37,6 +40,16 @@
> >>
> >>  #define LANE_CFG_BITWIDTH 4
> >>
> >> +/*
> >> + * The CSID latches the global timestamp counter on SOF. That counter=
 is
> >> + * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz.
> >> + */
> >> +#define CSID_TIMESTAMP_WIDTH        56
> >> +#define CSID_TIMESTAMP_MASK GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0)
> >> +#define CSID_TIMESTAMP_NS_MUL       10000   /* NSEC_PER_SEC / 19.2 MH=
z, reduced */
> >> +#define CSID_TIMESTAMP_NS_DIV       192
> >> +#define CSID_TIMESTAMP_MAX_AGE_NS   (2 * NSEC_PER_MSEC)
> >> +
> >>  #define MSM_CSID_NAME "msm_csid"
> >>
> >>  const char * const csid_testgen_modes[] =3D {
> >> @@ -1370,12 +1383,71 @@ atomic_t *csid_get_sof_seq(struct media_pad *p=
ad)
> >>      return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
> >>  }
> >>
> >> +static u64 csid_timestamp_to_ns(u64 ticks)
> >> +{
> >> +    return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTA=
MP_NS_DIV);
> >> +}
> >> +
> >> +static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 =
ticks)
> >> +{
> >> +    struct system_time_snapshot snap;
> >> +    u64 delta, delta_ns, now;
> >> +
> >> +    ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
> >> +
> >> +    /*
> >> +     * Translating requires reading the counter the CSID latched from=
.
> >> +     * If timekeeping is driven by something else there is nothing to
> >> +     * correlate against, so let the caller fall back to IRQ time.
> >> +     */
> >> +    if (!snap.valid || snap.cs_id !=3D CSID_ARM_ARCH_COUNTER) {
> >> +            dev_warn_once(csid->camss->dev,
> >> +                          "CSID%u: Can't use hardware timestamp, inva=
lid clock source (%d)\n",
> >> +                          csid->id, snap.cs_id);
> >> +            return 0;
> >> +    }
> >> +
> >> +    /* How long ago, in counter ticks, the timestamp was latched */
> >> +    delta =3D (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
> >> +    delta_ns =3D csid_timestamp_to_ns(delta);
> >> +    now =3D ktime_to_ns(snap.systime);
> >> +
> >> +    /* Fall back rather than reporting a nonsensical timestamp */
> >> +    if (delta_ns > now) {
> >> +            dev_warn_once(csid->camss->dev,
> >> +                          "CSID%u: SOF timestamp predates CLOCK_MONOT=
ONIC, ignoring\n",
> >> +                          csid->id);
> >> +            return 0;
> >> +    }
> >> +
> >> +    if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
> >> +            dev_warn_ratelimited(csid->camss->dev,
> >> +                                 "CSID%u: Too slow! SOF timestamp is =
%llu us old\n",
> >> +                                 csid->id, delta_ns / NSEC_PER_USEC);
> >> +
> >> +    return now - delta_ns;
> >> +}
> >> +
> >> +static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id)
> >> +{
> >> +    const struct csid_hw_ops *hw_ops =3D csid->res->hw_ops;
> >> +
> >> +    if (!hw_ops->sof_ts)
> >> +            return 0;
> >> +
> >> +    return csid_timestamp_to_monotonic(csid, hw_ops->sof_ts(csid, id)=
);
> >
> > I am not sure if we need to do this every SOF. Most probably the delta =
will
> > remain the same during the streaming, so I think it's best to use the d=
elta within
> > tolerance and then apply that for the whole streaming session. Also, I =
think it's better
> > to have a constant delta from the monotonic clock rather than a fluctua=
ting one.
>
> I think it will be the best to send both timestamps to userspace, and giv=
e the freedom
> to userspace to decide by him self. But the API is not allowing that as d=
iscussed.

No, the delta is not constant. In fact, that's precisely why we use
it, it captures the variable CPU and software latencies between the
hardware event and the timestamp acquisition. By combining the
captured hardware timestamp with the current system timing
information, we can reconstruct an accurate event timestamp that
remains aligned with the Sensor/CSI timing, rather than being affected
by software scheduling and processing delays. According to my testing,
the resulting timing error is below 1 =C2=B5s, from which we can derive an
accurate sensor framerate.

--
watching /dev/v4l-subdev2 (msm_csid0), id 0
id0    478 ev   60.06 fps   16.650 ms
  events           : 478
  timestamp (mono) : 180.160315690 .. 188.102256050
  duration         : 7.942 s
  frame rate       : 60.061 fps
  frame_sequence   : 539 .. 1016 (missing: 0)
  interval (ms)    : mean 16.650  median 16.650  min 16.650  max 16.650
                     p95 16.650  p99 16.650
---

Regards,
Loic

>
> >
> > ~Gjorgji
> >
> >> +}
> >> +
> >>  void csid_sof_event(struct csid_device *csid, unsigned int id)
> >>  {
> >> +    u64 ts =3D csid_hw_sof_ts(csid, id);
> >> +    struct timespec64 sof =3D ns_to_timespec64(ts);
> >>      struct v4l2_event event =3D {
> >>              .type =3D V4L2_EVENT_FRAME_SYNC,
> >>              .u.frame_sync.frame_sequence =3D
> >>                      atomic_inc_return(&csid->sof_seq[id]),
> >> +            .timestamp.tv_sec =3D sof.tv_sec,
> >> +            .timestamp.tv_nsec =3D sof.tv_nsec,
> >>      };
> >>
> >>      if (atomic_read(&csid->frame_sync_users))
> >> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/=
media/platform/qcom/camss/camss-csid.h
> >> index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..17cc3b42c8d83180d6abfc=
c3efe22178dcc2f2e7 100644
> >> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> >> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> >> @@ -111,6 +111,15 @@ struct csid_hw_ops {
> >>       */
> >>      int (*reset)(struct csid_device *csid);
> >>
> >> +    /*
> >> +     * sof_ts - Read the counter value the hardware latched at SOF
> >> +     * @csid: CSID device
> >> +     * @id: CSID src-stream ID
> >> +     *
> >> +     * Return the raw counter value of the most recent SOF
> >> +     */
> >> +    u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
> >> +
> >>      /*
> >>       * src_pad_code - Pick an output/src format based on the input/si=
nk format
> >>       * @csid: CSID device
> >>
> >
>
