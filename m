Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421620;
	b=oUVTBHYPDUcY/tiR7bJiuiQNKGfrEaMGvm64QCdMs6nyXn46yRYC6pWgROuluOZMnGp9
	 ZhSvrTIjNLPVbjFjWzQb1YRSpX/EO79WbveHWgblacphh+KlR4QC0zELoPVniAHP5r/yI
	 PcGuXpZf1qty/J0FLTwondiNoas8E6535R21sSslgqhmWWD7Pckcg8RJbfzBic9lWxcbI
	 5jt598TzOzhUSRC+n7myk1C6Y1g0I2BEJAPvebIBSKg9Sk4//d8dJV5ekIai0/F8srkgr
	 CiuGtG54phBWVmZUa5JhVzw0ZEgvjE/Yw7hAqL5MYZWoOggIMTYqlKl8GwPxRYhw/hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421620;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
	b=qVfOxxNL7Sd6JBWGnDKnrPakWTGbaAF9Lsthq/Wyzup3QOxauUmCMbx7hQSh6wouyhar
	 Erj6opftMEJSgy42ht4SUDk5kn6CqpXCEU2HFRP9+SLLdO3ljSxkSM7B6QktJQOjeLB9K
	 EAAa98nrF3r43pTchGsACOvVv97GDX1n2NCHcz9lkNsUCIsA0szhHXfEALAnrdPCXUkuJ
	 cY3T4zYu+F9LoYEiiOzFRzM+EwXrWmdP59gc2JtpYCk1KqqsbB5YbCK1RMIxfcknwR4/a
	 MhBPqOzlvFeNAgA51tztbGx1U9RLQFnfecZGytec8hEKryRtEz74l6NEhfSzhr2xb+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSi9cEKv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+EWXAWA;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55501606C157
	for <linux-arm-msm.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSi9cEKv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+EWXAWA
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1EE3E1D11
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421620; cv=none; b=CO5qsHGLGh3eIibAYticjx8l3gMEtQ/AXwha1Wrrx3HvmHlqXHlPPiWrG191POYRpIS0smQ3aMk8i41YseiB2/JJPziVYzhhTnjqYCd35pSPL+nY7PArvqtkKqVx5e6PIPvGu/DfVso3F0opmSTMb93OMXSU5Sxpd7jqPG5i49I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421620; c=relaxed/simple;
	bh=8QzhEza4cmQmxyVPqaeJPOjfbUX18+JD1Hl1uHqCQBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgYTn9gWAcr1p73HgyVoJYXd8lQOW/3yXGPq4hVubcqSgEVEFw+kbcOTayFJCyd3t/QrUrYkZoIzl2Vhb/lspBrJ4qcsd+ojPnN8C8lj9uWYyNkpX6HFQRDFDQZwP8WPzcS0P5rLE1tDEoggifzgIfdPsCky5aOX4G3AjFSVwlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSi9cEKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+EWXAWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0T3A2774391
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=; b=nSi9cEKvrnTAy8UA
	8L4nm0gcCkj7I635NL+UWzlhSkbS824yj50HkV1/ze7J4ovs/mSSkd8mexPnwtuy
	SpmxhvjIX+FOVfxcxdhOyfRgXJvy2V9WvgfNLnNiOUnDXqPiBXg1o0wZh1N19ydI
	cnwXAC68b0LzqGsC9ts81tKYdGOnt+DgHKSeROaBEMMFyA7s4llFFTLdh5KBw/XE
	M4r44Dd77on0iWUgk5O8sWBekt6aFIDYpK/JmPC8+E7nhOIFeTMQLRCQ8C+PInd4
	JfdPdltqtlDKuWv01JIh9FWFDE7fBswnRIVU94elAaoS/0mDzgOnPqH3EOInH89y
	R2W1xg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3bfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so77850385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421617; x=1793026417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=X+EWXAWAt2WhZMCFyaLKwZz/mHIRka4RNahGCqwCzOnbr2qxsEQ2V+25E54KmYor4T
         wUXFpDNMqXUeG4SYLI+MAk6PhmV2aJddoKVpD+D0nCQBOigLIDMPokshkldwblE8DeXH
         o+ExFvBvn8I5VZurDandZemjPOlyo+c+cVpsNqpe0g5SjF640YBwLbG+5huAIBgZHvq0
         0fuMV+5uqULgNfI54SXHOLg3ZOtmflINuL1TX3ghB9RWTXTdprfYFml0hY0bcR2VBcgV
         k1jMqi9lLg56rdgrtUMdsfttLOpEr1jNGMqzG06Lp1ynA6eFnOMMnd07jaDJwvmV95/5
         Cv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421617; x=1793026417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=pcOSWs1+rKlaBzrx8EbFFNsUO8gzzmpjEffAomK/zM8ni+oLl8LyHyj8qu9XUTnz2m
         Eq/v4atVe9Em7Q/wYuByqpDXDjqtW/u1XTtX9HZOnJFEQ7ZKqiNdX53ClzTpiQnDbEDK
         0CxCNnS9OAsTI/xT/ciZfOiC4SzC/GukQKhW24jWfgv9bdPOkbiarDMD1a/srtVUsQe6
         p0DEGR0AydEspT9YSa7gohsTtwoj2b79ZFXaLPzlfDSfe117hIYzsP8l2BXocPWu5hSh
         jwGAVZ95QeEHbMeC9Kp4cTy/Mo9lA10AoGF/L9vpoeWxzO1196OZh/Mj8VpNkzxMLGoG
         kchw==
X-Forwarded-Encrypted: i=1; AKwUvBx4uMcpCXKDel+Zk1zrH+p5p88Jvs4ugBjRC1diQGRaYWWAz6zLMAuamxYwwP3FuBTjSb+mCYZXk1nwGkXC@vger.kernel.org
X-Gm-Message-State: AFq9FYJRa6bpy4S5xf0E1ZmVG040piG4xsTwaB25z1kh2oB5AYxmLts2
	D5gzAohU1EC7eoOw6zkTyGBl4H3+6vlRD34KmykmIrW9L0aorsEwfBUWNosZzpj9STBSLBEQFDI
	p8c1fP7UQhTdiXHhjW2msefSyov2Ecqg2NcJMyhSm6toJOslFOJ5I8ZIeiKGybHy3vb23
X-Gm-Gg: AYBFou3sDNho/pYBTwO2IRnoaql2IRUy/zVtUapmM5kRtX2IOp+oKRLGm0zSER13w8O
	uY6XquVAfabKIQx3kCvMjL+6MsNlC7Mgk8WMXTeqsm7+lq4VAC0f12WjHn7CYKpvCt1janZCa7G
	Ijyn28h6Z6K+xnp7gJ4Q17O+h+4S9X60M/+0aTAzmmKwK5GshAu/2wJQxkFzxt8nLHH1YX0xWRL
	qTVCBdUFf+WnoMWd3g8VrP1U5BvIR7bhlkBxPWfASdZwI3KdtKguv8yZvUMYF8wdAk23H7Kso3C
	QKQCEdsz3lfBtwoYk08K8F306dJgBm7rVKFFRBBs4h9aDuav7YPSC/MNRtY3n8zY/NpKVkaisdg
	zt+QFX2+sd0Nm5TKZaThjKw==
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547815585a.5.1792421616959;
        Mon, 19 Oct 2026 07:53:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547809985a.5.1792421616351;
        Mon, 19 Oct 2026 07:53:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:35 -0700 (PDT)
Message-ID: <af21a2c1-f101-45af-8895-daad2ec3a9fd@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:32 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX5BAp9qLO33Fr
 3unFcM9OptLeUTqsU+dGSRLLOIKePMvT4SiHJHPQWn+9GA3lJbaznAVBOmpGxNzvkB9lJgpyKlV
 ht/fqROE40EJOYfqsjCBpQ8tgXjVEI0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXx+byDk7ivpW9
 ogYBEytJdgMow4nWnCKJJOcLeZ1xAsVQGWMupF5iSUNMCr6L7HZGuxwc/q7OJnMmAmkGKu5Dd9S
 Is0zIR1cMwcyu+xw04zP3yEAgdMV4ujXJJ0lccdMlBNtnWxNDBdmA2sNuDY+U565Otwm+9rVE6R
 HzDI8QS0Ot9qTcOq7c8k6rP3LdMDWveukLoy7VtrJKRvqGf9IU9oMgayTmWMowBqDHHnQYvUug6
 updefBn4pLsxGNULURbgRPvI5DsAbhFw7VXT4a4lBj+Mbfbw7zq058jJgRxLXk3kWEmYPMeL6nZ
 wxCEWAxDbCMfMONPDfy0Rnxm874TT4iWJvN/ynh2XX85opDZOYV9uGNGQPF0zOt9cB+sISoYg/T
 LWkShJ9QM7RN89iyQeLw0HsMful8ePtXurNTNVtuCn2ehKzZHGyKr5doX7QgLPru+pAXnXfLDBm
 zTJ1YmTdPH3cyAV3O8w==
X-Proofpoint-ORIG-GUID: Fdv1SSWFJNFMQPSvYO3ZaTrOBpoGAeNt
X-Proofpoint-GUID: Fdv1SSWFJNFMQPSvYO3ZaTrOBpoGAeNt
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62ef1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
