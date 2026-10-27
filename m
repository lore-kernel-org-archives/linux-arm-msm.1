Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115545;
	b=bhtOrhJvv5B/f8VxozE58pq5k0U2qcVK8cWOA3mMF4keFeiZyUQfs6EkTCll6csWVm/A
	 13uNh61iKs/+71ejGXCKBufNCN+et/joTzE5x1D5cQDYWC7XfwgsLQwV/TJXVxnjNjaLe
	 E7ra9NgNdApAGItq4mK2z5WB7nsc6qllEBJMXfkpFxsgaK5KXil6OmNxnJt/xtPgjRp9R
	 Rrkghva6r/DjsLGN+w/UU5oBEpb7Atl0SbhG3lTRL6JnrnzxNrdASg0lDuGxOEPoQLjCL
	 xExHV8AqQWDzJj+7hvcnLlMZiwfhCnc9dfK0vknqRl5ifppiNjt2O7kPJEJckq5W8pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cPUuvJa6t5ywKGHuerzirPTGKYB+uX1njxJG93Lbo7c=;
	b=otT96IlbzK9etL28/4hbhUJQCRNiW+Yu9fddpaXM06c3P7U5cH5B9vgDk0zO3eAn5FrU
	 olxpHfKLInjn2phFDxI9fDYrSxGwDWg2GUNds7yp0hEOsa8awDs2X/m8ebo85XbLVn/76
	 xKBAP4DFYUHWVYEAmRCqZ3EcBhqALqt0Z+pkuceaG4fkuriI6C4kaKILRdAAz2PTonqad
	 hfRGLABDYjuslCDpg38LOC0qIbbvkEOqIJ2CUO3JI4Ip5lx8CgOuH97mwANrYowKLyI1p
	 z3jVURfmvX7d9SdLNcdf0nIcqnMck0VEN+XuE2KGii3g33QiGbUIUQOjJ/Z1rujqoWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8gFv7xz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nsx+Pz5i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2745606AA26
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2745606AA26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8gFv7xz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nsx+Pz5i
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKwf43639492
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cPUuvJa6t5ywKGHuerzirPTG
	KYB+uX1njxJG93Lbo7c=; b=P8gFv7xzUPPnaLk5NNPXANJeFnWlwmzQlk728piM
	J5GWtWXRLSTZRCb+O4F/+8vMULH5fuAOwHn7Jz//o98PxjD70k0JwCKhWCPFVJUF
	FUpVUa7MK/qvikQAOeqIT6zz3lwCnkyYvZtxvuuI0yjNSL+XS+NW0nfxIpYvFMX+
	cbqepRAmlDOve2zgLPTHA75dPamdAWkqLddGYrkoudz/vfafr5RnlkuXHKN2i/D7
	4HJaBt54EgiiUvcnkeYwl0wUM0paYBDJfO5L17St5sQ1D5/ywQs+FCqXvSSzDnE4
	IAp+WQPvDth4/9l8cyXpzdXz94FpRhIPo304+k7Ab85c9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dbujq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:39:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a109c937so289766d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115542; x=1793720342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPUuvJa6t5ywKGHuerzirPTGKYB+uX1njxJG93Lbo7c=;
        b=Nsx+Pz5iLQ6ZsUVFN32zE51npBQibLa2SIbkUwK2zw8H7qfv5t7TTajU5ZdEh2Hvcd
         3riDkl6/1hBY8Vsp9v3H57Tuzk685LzcRKYUe0bJdt8oVZvgV7Vh29DS02M+kaWzeyc3
         spDGRIH6/GCyYzdPqEAhUPe1sRF3mjYI5vcQ8QR3oLVER5aqZEkJia0ZjfS7XYNAnay6
         9UgUQmtDu+TBHVIXkdpuMAB6ndbh7RqnJ46cWkSc7o3kcyggBAtixktP2t94Q0TEGadI
         vSlyFwtAL+0lB21d41w/9mzqIHfEAc0gp29yrectujo0ttDILEY0La4TDugmlwXUrSyw
         53kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115542; x=1793720342;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPUuvJa6t5ywKGHuerzirPTGKYB+uX1njxJG93Lbo7c=;
        b=S/Z9/krim4iA2hjhCmVwjh53QF1m+7aripIbyMbOVbfTghVtJL4PQO9ByD1QeRTQ3H
         o43J6l4Gbztyhk8qxNf8SJg3MmHvxb792v3/rCRcM3ZFgMlJtp/yu2gtof5ypOZmzkm0
         ALoXOpT4q1EhC0jznvPqubmv4hTlBnWgLt5w3pX8LJCknMtF5fQfhI7vdXLlddVUVIo2
         zDVFhT+0Jwa/0X1WqljuLfCEa8W2OEKXus7ZKTSx5ytNVeGMwShQuOg0oNTlsl7M0dUd
         NckMPhsUGZsZJM/TkaekeIM3FrWWYCWj1hSOqHQKkERFZKbUolFGu79WMOCecu/x7eqI
         6sWQ==
X-Gm-Message-State: AFq9FYLsU5KsPHUhP32H9iCCZLq8VcxkptgRtOsjSky3gtRZD2x/sOkc
	6NvBrfwVwXz2BSeXEDyn2Q1a3vv3BKfhpgf01r9QZL1scdslrnn5coUhjauyMT92ixb4q3OVWQu
	qAXba9xG679U92SgI8SzvopDO4U+Xyfp94WvcDbz7LClsfwh5RAVjW3uwCkwAkN/1KFLu
X-Gm-Gg: AYBFou2vgvvw2zMKMsBg1LYWyGwnaZWyON+28lWgL6eM/XNwTwjsMMt6aFKpycqAAe6
	++hi8ZltdsMW1xHDFJxodDmdEHc2eX7xHxw+O/bg9wP2WJczRZrdE1bpUMJkorhiqT6FFpBlSX+
	DZ9LV5rO2wkq/hvO/kIoPTBwgJ9eDQEitO37hxbQXtuEdU/msLIhtle/DS6SyYoKEU4RseEmLAF
	Ly6eU0vxnahkxrJKA85RpiJ4abRvpJ11kR/hUizDjiJf7LiPoHJFiAXQ7SHsGOHHDL2APFEP05u
	w58swGrZSmTvAPidHIWMAkxsZqa+icaDfTqbnc8dX6Wo0awpypIGfAMJHJnyobyTcpUFlVRXqrd
	RslGwq2qyAWzsRaVi
X-Received: by 2002:a05:620a:4542:b0:93f:2bc8:283d with SMTP id af79cd13be357-940ef95fe8bmr1459354885a.47.1793115542431;
        Tue, 27 Oct 2026 08:39:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93f:2bc8:283d with SMTP id af79cd13be357-940ef95fe8bmr1459347385a.47.1793115541726;
        Tue, 27 Oct 2026 08:39:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm23240126f8f.4.2026.10.27.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:39:00 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:38:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Mahua QCB
Message-ID: <gdo6dqplzniqwxpk5dlkghn5ha2vh7staziddoa7frxhxfqj3h@6urgosis4rgn>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX7hejIwhBKTnX
 wj6RQuJNVQaHe09fvd6ccQ3P/6rnKlFSmF7m5UWOMn7eCkKbce7I5PAWOKneXbxu5gGAUSr7quR
 SxUkEAi8ZzVRVCxKDzLLJp7MtkoI9uU=
X-Proofpoint-GUID: TLT6jOj8Szcij592qIhgDEZKRMgIuKwA
X-Proofpoint-ORIG-GUID: TLT6jOj8Szcij592qIhgDEZKRMgIuKwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX7QP1u6P/DIrh
 PKi+62JYqbcP2db09J/uKGsFZbNK/75TRyjTLJTKvNh7Rofm6epPKF50Kb9/UljXDBWFaSXISI4
 NpeJq8wgY4DVBWje0ablAJ7dofHjX6760ojEcVfaogX71GyqCF/yjdHdtDSJ7QKmcWJdyIhe7Th
 +I+tH84ZqIIC2KwZMk6YHCw8TvlH3Ee80KULvrliD+IvGY/10tF67AvIsPfVk/PsK9+WKtoW7mh
 wCZt64VRhNoZc9DQpCK4jnZhDrHvcLmM8NGg/9rf5OmG7w4+8yC5NfUAd1NcDu2Od/Fa7Uz8TFf
 hoNUo3F46zoztQ1RGL8fHYSQ9YiPTJywxi0lX8+nw81g38l1yZIGYa6UDglT6GxrqD3lqIn61mT
 EE894y4/nPLnzJIENugoHVN4fi9Lc/BsnM4E+GGGTNPo9NClQoLXA3u9drkwXmFkIKbW8MMOZAX
 qOG7wmonNgWNfR316Cg==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0c597 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4MzwNv8qEO_iqFDzjXMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270062

On 26-10-27 17:19:55, Sivansh Gupta wrote:
> Add initial device tree support for Mahua QCB. Mahua QCB is a variant
> of Glymur QCB but using Mahua SoC instead of Glymur SoC.
> Mahua is a 12 core derivative of Glymur SoC.
> 
> Unlike the CRD, the QCB is suitable for compute workloads, power
> measurements and oscilloscope-based hardware validation.
> 
> Includes glymur-qcb.dtsi, adds Mahua QCB specific board compatible,
> adds tcsr regulator-supply properties, removed cluster2 PMIC/thermal
> nodes.
> 
> Co-developed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
