Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111E03911BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404972; cv=pass; b=HJtjmKPYWu0vtS0rQl3aBx4k1DGMEMh4hQda4XDlaO5fU4IWLAquXw929yRJNGPMe5/WrdRhZYaLtSX3i1qF0PJ1eEZgNEdD9kGlM+Cp0p7S1LaEDMmqp0V9GWcROmK0EXfxV/feUBvOWSLGwLv0mquhD4GraL3IAKWjgVv9euM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404972; c=relaxed/simple;
	bh=A9jdqY+oDMT/5n0+8GpwwPmzXAejOOLdJI8RRmOYi40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sp0jX7BR/F0p9uKFN/MGfc3XnJzMUn4Bp2LglhSYNsYGvPxmHfkOehlThdkc7HQAZJd1P93jh9CKJPKW9P0hyhpkdOVFljD5vCYAFijcWWNCs/sl1yLY4JMznqmWUlnBIY0LITnjzNGLSoisRgimKnoib6tZQhoCzd1Z77roNy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q65WonDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fr+HT78+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q65WonDz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fr+HT78+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9IQI8184007
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4cyoX7Ut652CZKwehYbRFscEr/cS/JCIEZk8zalOnc=; b=Q65WonDzHgERcEJU
	azamHzBs+gOA7p9DyHxr3UaMle5X0ZGsDVVWgo8nnl0uh2J8MD9z4sg/D61iVaTz
	qn2gtHZR78RcPRp00DUlAhmrh1NhxKdx4eLcNJB/vcaa+Yl5nVBww5MSgroa6mu4
	vtz++WJeDKQYYnz2YHdzkmy17VBpkQpHuKjaNgtvtG32eUmL+1ZEpoAIKwag/LEW
	+k07iBP7hJsqm8nzPskJvYlZWMcI1N93PK6I2MziVAwdfzu78MJULh1GpgvYshJw
	lZvwx6XdfUSZcYqOUaSirdjBM4RsWjEur61Q1pLC9hLVF7DJZBFAZkZd5z2HVX36
	bMUCJw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3v384de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:49:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc92c5373bso21148286d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785404969; cv=none;
        d=google.com; s=arc-20260327;
        b=a9pidGi+4ao9PaTlDhv5sm1yuLN/W8kkc95yCKNQcBijeuo0J4hdWvE1oCqgBOU4Bm
         2xVR5FYPulJnntEqZWI4udU5pny7iKNFowTDj1XY/Kyt9tDbtAmd3cQCRCXKutDbZBiA
         OCbI+4FJkbYt6xCjd11sl4WbruXrayhcnuRQkAtwtxAuawJclEQpObsc410Gm7eiKdqj
         BKpmncxriIKUAVVCC0YqkwpmstpWG/G41xAEO5FXtSyvc/b42grhHW73J+2/fkkiIAbt
         6enbrWzDc0tVAlBKOv3dHSsqr47XGhg2ORreY+qZWytV6V7tzPhHojLYksQoEMfkfkt+
         4BmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q4cyoX7Ut652CZKwehYbRFscEr/cS/JCIEZk8zalOnc=;
        fh=6UAcBZIBKJYaB0IlpmM/+bmAl2jPWKVODP6jo9iHN4Q=;
        b=SX8TmbJXAiDL5TQ2d+LOVETBfqt/vv+UT7XI7abWsvkODT8eT4i5ldd/OQjl0uj1GB
         +LE8HVfdSUURUMWIcwvTortRzyeB8sK2MUQA+4BGyiitD67uCQg9LKsjGZwfC98tj88I
         +URyLzQcsQ/SOzUqle+1F0KNfK3CwPBXU9hH5lKBF5D6RIfmW62kTVmlm+PN5xMbWGbK
         KCrBUpIeecXv0j9WJu8RzahqsJ1VYEhFFw/l9/Evcx3O/Va/Ll2yhXQj5EXSHe+m4FUZ
         KLrgxKqOLD7aGNGmz3LIDf59ByFtpnEaRfphB+866l0iAMxdsonCAgglnpeHk821MFQC
         +GUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785404969; x=1786009769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4cyoX7Ut652CZKwehYbRFscEr/cS/JCIEZk8zalOnc=;
        b=Fr+HT78+ZRbRxokxQM6yWVQ5GR9JMXaN6rMCJxT9tUeKOkYUdhsepc+v9GdStfMj/a
         1XNxWKFxxg72LpdJ20EKZehhELf3IFeEWi1Q/Q/a6/cS+k8fXYYtMZZch7JyY+4bIyxP
         EBABwG3qlJRSEzypv6nMXyN6skQzMQlo+rmVy3E2tdMPhS+2U+NJ1pzFIeEo4CsCP9h5
         D+3vgaMEaIHYqyyjm/n2k4I9CKvTdJEJ5s9NsvWpz6V6kogTE3RxnUpVb+u3uvEXTUlT
         tYS2u2ERQx+g6jAa2btLeL1nIbjtu2eySDd3SoJJKhZifHUmdM3af+JouHVF6qnMdy3Z
         inTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404969; x=1786009769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4cyoX7Ut652CZKwehYbRFscEr/cS/JCIEZk8zalOnc=;
        b=HHig83PNMY0ELUoAW6Pktye0ucoSV2fU1YfK9BRguVnVz7RRHvK9DsBZxb6XzWl1R5
         netEcu/k1ige6crPm/tcnbA16GANZf1i7ji/E06P/sfr9vVAxwBHX0ympHkwtOHdSTfY
         nv6KO3R+qqsOGK6gXMAoBPW5BE99YyMbytPlwDlBz6NWLAIbXqKUxT2yjfbaI+mbqrcW
         da2od+gn4Ivt80KrtCEbYa/u1KURXAr3uTx37+s+OdCC1Y3bHebrBWQP+5iox2H6jE8U
         4bvP0idoXXVD2yNARw0iU5X2AXIdyRSNFtn1+OPyIQHn/pIDs4s7wewTQFNw1UAoQGj9
         2wdQ==
X-Forwarded-Encrypted: i=1; AHgh+RodfLz5hG2/1eU+I6qjNMvSb3ANrG+y1TAusFyV1JRH8CAXO9vK4QezBmjM5TxywBgsMmRwfvn/3NiuFiO8@vger.kernel.org
X-Gm-Message-State: AOJu0YzjToHtcCnwyX54tnbkI0PxHLQ1CWJLOpngwo1lSn2zJLS/aWSH
	WMuvnivBRUMTFP56CqCJUXZAHmO3Wn8OjL0zUi3DMsFiIb/kUv9yKzq6u8qUNq0KIvYFOflNagI
	lwUig/1S0naj4kVteKPISwuFcKW3i1sJ0TDv76Gv2gbUUQrLrjjcEkgJX6w2mB0IsOBh0spAK+G
	cdLyuqvrrK8dC9vRW5YoutSOw37pRdFzy9pleEFNx33d8=
X-Gm-Gg: AR+sD13V5+OOWLiPZV83+ZD83CxfZyQa1T7DebeEIyQ9w0hW2rwWHOuIzAiekerksX9
	G6YmuvVV9y+QnEy4aaH/AFXdwESX/HjrEFArCIbMxV3CKQjKeT8AHE57FnRvvyZSs6Py+kWm4gR
	QMKNwm41vl4xhaXEBIBY6GGy4/vKMGtyFvmi5+xSZc7e5nL18NW/lmLXbg0A6TePSxRwX1VB1J1
	ogKQ2ChutMouHVOdTvNCrSlikHHUfBXhd/ZOBlvB3Gmrdb+wNRJedJVU6DUvOqHdTkuQJP1XEs=
X-Received: by 2002:a05:6214:48c:b0:8fd:6de3:bba9 with SMTP id 6a1803df08f44-908347efcdbmr15638466d6.63.1785404969178;
        Thu, 30 Jul 2026 02:49:29 -0700 (PDT)
X-Received: by 2002:a05:6214:48c:b0:8fd:6de3:bba9 with SMTP id
 6a1803df08f44-908347efcdbmr15638256d6.63.1785404968729; Thu, 30 Jul 2026
 02:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
 <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com> <a880d399-a39e-491f-9724-c892b1a7ac5f@linaro.org>
In-Reply-To: <a880d399-a39e-491f-9724-c892b1a7ac5f@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:49:17 +0200
X-Gm-Features: AUfX_mz7-ZjDBBfZ0z2EuRPW63loH5eyCJF-yYVYlhxSwg9q8-PKb_bGVa4_e_w
Message-ID: <CAFEp6-0fk+-jTNEEV3+CgmnxZ-CiLH_FWg=gm_GMvURYeo390Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 274nqc_NvJnRAE9gdGUPv79CoQwaUzJS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3MiBTYWx0ZWRfX9E2+vZ0Q7SeG
 ofxRvvD6V6xH9/qjtmGgAQOSnSeyn1G8Zu6O8V1fn0xskUiRYodaMMWTdd77qUWzsvJsxxmWLfa
 2yMnrL891QtZIre7v4y8CS2Ic1gp4Go=
X-Authority-Analysis: v=2.4 cv=bZlbluPB c=1 sm=1 tr=0 ts=6a6b1e2a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=b1Kfy-uXUVUZEzba4ngA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3MiBTYWx0ZWRfXxk9/bAGXSkbT
 zMQMlXT4B96C0+KGHT82rpGD4MytFbCnOsyfPsgdxrp2M5EaBtTf8uE+jXnBoH5o1fQHJ8ckvE2
 0wUD4ZZHAOjdp5cg4U5M7hq3ZoTAM3LMKnVRQ88YV6V5qkcSee0zsl04xVH6aNp/8uwC6ZmemH6
 5+6hSWpEsa8m6Eaw7g4WEx8xss/n5nkynqFtHDLMdnPTdY1yXTLzqPj3wEMIpLS2PcK8U+V4Dw8
 FKYcMJZupBD15ZC3iTf92BwOxRR6p4rFjmEdsiT+feT5OdEOWNrExeeRmYDjMXN7S4TSUVdXont
 Le1vk8q431xrPO4UgiVRt95OOI28DdsHvHU3eOs1+RzS/sksSMJ0mDOnjNvwXy73MNcSLmrr8Vt
 UfYkNH40W+NxECnQbaQz6FwEQtSUsSmJVa62O072dFwCH7aHbn1Xq/XdpgTMk2HRS+1/0jfMt14
 PH1zjORZE0+U5kS8Gsw==
X-Proofpoint-GUID: 274nqc_NvJnRAE9gdGUPv79CoQwaUzJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300072

On Thu, Jul 30, 2026 at 11:35=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 30/07/2026 10:24, Loic Poulain wrote:
> > +     ret =3D devm_pm_clk_create(dev);
> > +     if (ret)
> > +             return ret;
>
> !PM_CLK this is an -EINVAL I think.

It is, but we should probably still allow to compile-test the driver
without PM_CLK?
Maybe we should just add a 'depends on PM' since PM_CLK is enabled by
default along PM, and we functionally really want to run our
suspend/resume callback for proper driver behavior.

Regards,
Loic
