Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477778;
	b=Nj1e0B/nXV6zfa3+Ppp6VnOWsg1Vx++gfvypK5sfKqTjXjVqVIX9w7tHlLpj7ibFslDI
	 /GjnV43BmPWAw5N6+sPjEdfCPRQzUxW2frN4FXDmAoH7NzaYkS9mxB4hEGD4xiJDj+i53
	 y6NwZmMiJ9x7GtacMbvOWwOlm6+83Ogdbghl2FtqU4IYOQ5irpa1v2Hq9ukvHY4/KId+X
	 MlJxOB/RJOAJxZZLSbF5ZwJVmnDFivTxC4eJR8bVoN9l79RspXFaE1fO3lPOeML/Nh9gj
	 jtJEfp4d/Tq+1XJmUvc8GRTs2iWJAapNjwRDsEivZFk81kYBiEZH0bJMj9yTWvhLwwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
	b=VYe1s/tv1uH9McHgcgCA+xwacpB6zSMfHw7pulQv6AROfmANPxds56XPoZ481GWlrC0Z
	 83VzskdBTbQthDreuS9OVBqQsGucVzda4jEkJgvMf+cLjCtTlJ4jyi0fvjbtU0K9JgoeT
	 JUL8cxyL5RULlQuHKbGsO8eQ55zvy8ApaLf3W+frlQmGkhJ8udBufdjMdyHeglY69MBIF
	 StIlSZ3P4L+GxZtHwd93q8RzeM78zdUzxFUu3ZAcJBmjJI9oUsORxm99T817+ww3/M1L6
	 xDAtDsCHVd3i0L2eHIq0NkrXhRYelRNa5NG4HcT67O1bAKxJXcZCVoJr424AnSekbOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VygcVeeb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIVanoOa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9624E606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9624E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VygcVeeb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIVanoOa
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJEstF3532734
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=; b=VygcVeebGI/ri9YQ
	fhErQBAM0zlmBh+3G/AO6X8Iht8tVCCqHroXDlWGB6A5COKcG7ZiiO8NAwwlh9MY
	y26uUS11faVLGvYd7XQqcamy+LLSsWunkK/qlm7Vcni7i8QpXdGZf6uzxxNC7iN3
	qjqCJswC6pu/TFUCIOIzw0OKktEhsxqyiGoKknSR+ddBhNfsfopYl+4nOoYJ1Z9B
	DQ5TLrLIbNOfcD2SpxBOdFlSkMHMVhCUYXVdGk3XDZnIwgZebB6f0Q98XaXTU+nc
	1lzPF9OZke8Is/ceATWUw2dG4/vW12NQ5+7cOSJ1tXI7wUssJR56QVSWae/93hT9
	M9rkTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6j46r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:16:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso258705785a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793477769; x=1794082569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
        b=bIVanoOa0vzaexjnqqPTRZwjUB9qlv7AS9w0wC9RMCE2R+KpbKZD06ztEg71CvJhnv
         w/RDzNowSjy45ImSh4Wypu5s7Opw8lyspYrWaRqndA2qnqQaZcTj9w0HVOC5e85O2bfj
         at9F3ThFJUpL8o/qmSeuDyP8NVmEPuo6hfdDjRxhepTaJRsEiNG+DJeV0tyCm4b4bUt6
         P2bC53GnI42AzIarj5DNIg3a8Xn1wa1PWSA1i0wCc26lFlZzg7V0lBPNyb0GIB9yXbTh
         xvCpaOqVKPsrs+3aCVYYYA+62ZJOe3oHg+F8oVeA2/yqWMGjhpA82NUN7RjnGgztp1f4
         Jz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477769; x=1794082569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
        b=Jh2EATwthqgr+h9Nex9Dgsc3qoXG1V5nFhYp0b/XHP6H2cmRGEJQvtYtJe7Jg7K873
         iaHG7O5rbTqpdJKD/crAhfPCJzZpnPxsxiciGSWbjdWP2VxWT3mNpHgjZGb+7E0AA5rp
         uDvaoROaF2wRZszk+3T9un9M/4ZZy8KSlHAohPP3rCf+Rkbfvti/OSeVqgowUlmEug3Q
         WFil1AnBfubowHvfqmC9zzTHKprm/uwwvNdpNQqdkMLLY6UCZINai/JtKiOJH40/SVM7
         +gfCVgT34ufOuA+7uvoiUEbCqSMQtaBn7FX7DtM3HW2Au8gbrRJn68DPVNSHiedvEq//
         6Clw==
X-Forwarded-Encrypted: i=1; AKwUvBxZhswhea84hXNrtApe2WrYOMp6LocV2xV5R2gBADO1rFyOhnVxTpjptWN8oEBEAB3uitiHzhLJOmeAsU8K@vger.kernel.org
X-Gm-Message-State: AFq9FYI6AIe4Qzn/NemZxn2XTnI1S360JElnd8EHpile+LE8rEnzGTi4
	KNBE4S03ezIsg6e1zmRRr5lHHtO53xo+/lkCsDm25mwT2spwhqjxLbuxDTc39xbktzblAqU0kdq
	ScA32VmGnO2dMtjAI5gh86JrNlpl1Hsk2J16EumV3zzYRlcEwOcDRYOmKrca8MvjkySiU
X-Gm-Gg: AYBFou0CZMTxlQKZF2n3bIAPUmRtAdnkSWKOKkS42kP+tgVXX+URATXqO1k/up/knEW
	LKdUzrgBSl4M+x1EwUxUGDshLZ+gsY2RFbyX/DwI3i/niw078u+H2umX6g0Y15vpb+XnoA30mPV
	tq66UWWD7fFEMIGMtFNKjO3570BK1orO8HBg14KQe8gmRxSFPQOiBtr1vzXStHS4ZPIfrT2ERTt
	4ebEPAekU8auDSHnQg7Qo/mnV/wEQ2SXXS/VeApzgfPXNS7m8vFp8fH++yz0dHLUiEHpglvze3O
	FcvXi7rG414GCZ/43V9Fq9rQalFjRXkTjgYEIC1be22KjcW9qWCkS25l8AgFkAMDhA6RInKCT7o
	JFBzYeSN2zx5sKR8RrrRWcGUQMPZVnbkBuje3PHfaRfGV15Z6I+SdtD5CK6QRpoWfhiuqizqJio
	1mqha7zw3CZkpaRPy6BiL/rUiwgIXT5GgV32u7Ai6Qs/lp22PcrQ5Y0n590fnEdQ==
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr1055212885a.76.1793477769030;
        Sat, 31 Oct 2026 13:16:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr1055210585a.76.1793477768621;
        Sat, 31 Oct 2026 13:16:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0752a30sm731130e87.78.2026.10.31.13.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:16:07 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:16:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnaud Ferraris <aferraris@debian.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sdm670-google-common: set chassis-type
 property
Message-ID: <ucyymr5uvakzqalebjvx4cnxaqi7d66urnjcogjm7jdgcmohu4@63uj25mpulyn>
References: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
X-Proofpoint-ORIG-GUID: k9jPpVRnfErelDQjAQtZC4sXrN8ZPJVG
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae64c89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=xNf9USuDAAAA:8
 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8 a=2Uk1DsieHeZNntOzPjsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-GUID: k9jPpVRnfErelDQjAQtZC4sXrN8ZPJVG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MCBTYWx0ZWRfX83GLISzZJFD0
 kkG5nCqGCrSRtBU9nLmli0Oe++farTq22QFo42XvrLsqI8AqXswTAs0d4BOR3CMqjiKiK/v9xB2
 5ADzXsNW63dtm++g6GdsBhOm6W6mpQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MCBTYWx0ZWRfX1+KyEhSLEuZy
 pBDDaEQoAeuxmMWZsOhjISvhKAvOC3hDxK70A87D1HfdKwmkASU63yYaAaMThJ5356/hcRT3x6D
 4XIWeOHTANfhpWYeTDP+mKnYvJfjLAn1LLSThf/s7+dZhMxw6wJrk9njBc+z+25vzHGMC31D4Xh
 WNZia4GqvkuN6hQ1CJxjaYPNSSAZBekLW2U/WT3pt5FlL/aBj/j38N1O7m8ugFS2fUp4Y7Aqncl
 uV1lutUqkvN2rKBi1jgZzzrtCiSgC55wAfeRngZ7ogsSLb01JIn/wiwMmvTCgxj6ouF6VzQhhC9
 NSzdFS8eOzDsbluVny4TUs27wIr2VhH5d15kwyVNSgGB+HV0M88H2n11ZWwWL42+zahsqABzVOA
 hd23Kxz8UUYkDT4Ihqr3fU+6xj1tEH6GzqZuL4uEtBwMKzd+/mxKunJ1z30yP2S+gkt71M9aIMM
 tr7JZeCUTflx2kWeuyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310080

On Fri, Oct 30, 2026 at 10:27:38PM +0100, Guido Günther wrote:
> From: Arnaud Ferraris <aferraris@debian.org>
> 
> The Pixel 3a/3a XL are mobile phones, we should ensure userspace can be
> aware of that by setting the `chassis-type` property.
> 
> Signed-off-by: Arnaud Ferraris <aferraris@debian.org>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
