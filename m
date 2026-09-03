Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE9472771
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427784; cv=none; b=kkAQyRKpzq2UaSduY8sLyAP+1TjHi7uwabxZJVVAtfLQrY+MquXozvv/7wvlNMa4hx5949M9hoD1l/6qVi9OrtIE8Uyui4efJIhNkSx/V8roYCsmiZlMr4BGa7feX+dzMXiIWmcIjWrCjSfm5B1XfzYxnpsmGzmfAL+LW4VpWHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427784; c=relaxed/simple;
	bh=LlrGf/HAdZjQrur/F/yW8951iC/lKHSR84KuXZ9FSrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1AzFxqgAXQisK+CdnSIdFcUYCbu6INAr2AEoSqPKtFg2j5Kr7uvQvjWM9dtKlMDR5zmzmCkUhf7jIHkK6w8LSqNnnfljvKEbAM7RSJPejTbZeoXGM9BPTnjQsovuH1d84jwIQl/L5axUiH4yUORj8O9t21lIFAiJ6miDTSUeho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuVyVAe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jW6hO7WU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuVyVAe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jW6hO7WU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683923Ni3549390
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 09:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dWogIo6Es588eAen+x6LDEv1
	cTiGVBUYtYi7kGaI4Y8=; b=RuVyVAe1EySwhx/wJKo82dVcG0/wHfZT1igI3XNb
	/jjVKl6vVrLDGe75nAXTJt5TtSqzzo/RorE+xAeAPuYEyVbnfw3+EH1P0EWnj/at
	DQQJOgSl0RJ5XdAOLQr833Jm2ohXRbNpba6aGw0DzoCLQzcUDj4F+hDdSo7hZ9K5
	1uiseHYfMH477z7HXNEeHZ2Evbp5Hnzd5sdZszTYCqxtRd75By7YSwoAs94zsjQA
	35Wsu3EbV1Rg1BC8GbCHPvMtnGgPLwlUd5k+4wCg5Hd2OAesKY6BiOy+TXr/WX66
	f3tN/SBJr33nQFsIiXc67szx4WRiu4LgQJIeK0LAq7Yqtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjsdu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:29:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso563573885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 02:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427780; x=1789032580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dWogIo6Es588eAen+x6LDEv1cTiGVBUYtYi7kGaI4Y8=;
        b=jW6hO7WUaIRnwFUJWCOFQ9ZWm78wvAvjn8ICAzRpx6Ky/jusiDDMIe9IzfF0p1ste9
         zRUhLgx05MoFuAWgfZl6HLdhPag3PjVJcrCAxXbTO/dSafzk/845PjrgBYWErrdcZUhe
         gia6zSUfajSgVrE0uikQA4G0JYdYyWgVxRjPc2b63g05+BADeL+JnbqrYu7eiotwdcBr
         47HDKXqbx/V0MBDBpRqP5yJUv4SmBhVefil5BRNQaq93jT2YwUO2DBE3vIGHLnxvIZ3i
         tkEXN2LPhc1QjAsbOt1+Ui7gRHThWaYPQMTWnJpS1eo2DrXTManqsH8PZewmjTP5F8cc
         vqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427780; x=1789032580;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWogIo6Es588eAen+x6LDEv1cTiGVBUYtYi7kGaI4Y8=;
        b=Eyz1xCq0XJ7zLQD1Vnxip1uSHrYRnNiyK/wa/Rldjk1aLBOON08S178DguhcetfkkW
         EqnbmMos/DAbFaL/j9XNxRXlpR+1uEZMfH96M72H43voJxL4WZFvUnZU/d4WWbaLb0Ok
         vHX5lOjTT8IPRRWbrbqjUs/zOabfLvO1Xo1gfBWi366sC9azx/TZg4+49SYuHBNZ1Q5m
         Sk3tqyH1O/90Kb5TWrKtEkaCxfkZEcXNcncrDGB2CgAv5eFM3rqZj0jI2mbtyHENJTA6
         QBPOTCmx2naHAFuC6XkkhmabEly1Rm3Ak41OB+QksOq6YBgWx3mPN3VPcGUA4XSOy5+u
         CaOw==
X-Forwarded-Encrypted: i=1; AKwUvBzXirGmHcj3Jovc+iN+X7fnNoOp+P2gNRvM3zj886Az51jK6aglBb/UFyg8jqB92F6zCXnhOtuK+AhBPoFo@vger.kernel.org
X-Gm-Message-State: AFuF++mCcw2O3Cvcdk74mG+v+bIBDQJOYR5Mo3sFOPJ0HgEaFueLqUlX
	ZT/w4L5G8sejnHV+1VLTSMkC+sc1ViQiPNXawaVg/ZE8TnTBdvDntF2LtOYXHs5bBw8dF9QjxP5
	MR/xZHJU6scycSYBH1co7NLETVK45YLfzBPv/PD9TQtVvQAXVblx3yirYgRHOfFZb12QL
X-Gm-Gg: AYBFou2PZRbz6Vz+edG3JrFjzeApX5hqrjZbdAkL6vrdi+BeOLnf9Rh7RuWwXqrhbxi
	rd+/BTUvrV4AVQWRjWIkTB2NSeQzjP4Q2VKRR1WwCwBkFzgpTCdcT28Kg81VeJzagFbitz5Bplf
	DzIdlV7fhHxtuqlDPzb7DShIYK981nn3p82qau7hcVaozUrEs1g+ZMG72W5c2XxtjaaQzCp466E
	E9Pd+RxSdbpGSiybvxXZZRywuSN5Tp9xbIBTTeIdwTu7HpzrGTIN/YpBjyBs+peOXCwePfTcxMa
	OSdpFQn9PiZk+oh8Pq+k7aUGqrS1UhAvVZhsyxBSTngpHdAdEN6G4YeVSSuPKENZwgavGnIDVUN
	kwnKsJ5qjJ6ckDg==
X-Received: by 2002:a05:620a:f05:b0:936:eeab:307e with SMTP id af79cd13be357-93960cab3e7mr1278343485a.9.1788427780230;
        Thu, 03 Sep 2026 02:29:40 -0700 (PDT)
X-Received: by 2002:a05:620a:f05:b0:936:eeab:307e with SMTP id af79cd13be357-93960cab3e7mr1278309485a.9.1788427774738;
        Thu, 03 Sep 2026 02:29:34 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80020sm12822292f8f.10.2026.09.03.02.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:29:33 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:29:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset
 gpio as reserved
Message-ID: <vjgskn34g563t3hre3ypg7ocueywzt66o6zusohqnzetowfwik@nn6yaq25jono>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
 <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
 <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
 <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MSBTYWx0ZWRfXwfIk5f5/wtyC
 w1ZRY+HNBQYr1rpJ1IT+z1qotsmZTgMJhxiVUZvRac/XSqsV71NIoffdBcUUfRvKJUo9HuGUrtg
 vY8KyXLqRlE5c9P87IS3b19boiNYR60aSPSTaP4fDeErPYAHZMkYMW8LyHEdrSPYPWOdnwNR+82
 NAzBJL7cEHXgQ9PpK5qplL6Qz6Qjz+mdeNZL6hSpFoOUIqaGHgILCR1WAhZFocDLd8KS2jTe4C4
 u+TyyZWCDyg2NlaGbckEqlexYAcShmv/cMegDBYCATvJ0CtpPoAGNrsLDt0B5PCQ37q37GIj72l
 /DbyFZsi+Cn4ceIsgG8a/QzR8NyhgK6nbKcicOiRKWgUinPD24Hcf0dMWO15Xa/nuuWxt5U5kQi
 /unE7QyAn8UPrwS3mzelzHZITBOLW5kNwc5epYWQic7WHjYeKy2SKqA05J8MAsTZFpdI8k3FLtx
 gKgxI3QGWUuIrTQNcMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MSBTYWx0ZWRfXxeU9k7m37Gly
 BXCgfVlt/B+rWJGaU7qxpJ8t22ebC6bd7UCnamAL8I4f6wOOGzM+bdRawBusyfjokvU+cc9Zvrg
 M6j/uBlyPFJvX5k6wR1TbI3AaaKgx1M=
X-Proofpoint-GUID: dHJx0Bfj_EFPD8U01NUHWYLsonTwC574
X-Proofpoint-ORIG-GUID: dHJx0Bfj_EFPD8U01NUHWYLsonTwC574
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a993e05 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Kre0GHG-jOPd8bR4PBcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030081

On 26-09-03 11:16:20, Konrad Dybcio wrote:
> On 9/3/26 10:34 AM, Abel Vesa wrote:
> > On 26-09-02 17:53:23, Konrad Dybcio wrote:
> >> On 9/1/26 10:06 AM, Abel Vesa wrote:
> >>> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> >>>
> >>> On some devices, toggling the embedded controller reset line makes the
> >>> device not power up at all, unless the battery is unplugged.
> >>
> >> Have you confirmed that behavior on the CRD?
> > 
> > Toggling it does nothing observable.
> > 
> > However, the documentation says this GPIO is actually tied to EC reset.
> > 
> > I still think we should reserve it, just to be safe.
> > 
> > What do you think?
> 
> I believe that contradicts the reasoning you gave in the commit
> message then..

Yep, will rephrase it for this platform as:

While toggling it from linux doesn't seem to have any observable impact,
since documentation does confrm it is connected to EC reset, lets reserve
it just to be on the safe side.
