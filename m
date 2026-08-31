Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9D2304BCB
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160226; cv=none; b=TH41EJgN3A7lTn/090VxUM4rqGJXrHreNIrvFM/w443Uyc7TO9UkQjI9A02EtVWFFSMDL9rmykjFUxWrHRseVsDywh9vmY5xFK6cNuZ45uP+ExpScH8d5onos1DHpcQmFjOV9wam1HndTZIuK3ZG6bgBMQ4TEKeDIrcoSXn37ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160226; c=relaxed/simple;
	bh=Z921shTsCX3RrS+CkOjK5B48Xp0W4QrNeaDSx83aXAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQQL2kcP72tLoNc8WfIWXiGk1ZB1Y5wAvxQ36YVdb/0zFCkLm3NdyILlKlEyelLSxznWX1p1nsauczik5NxY2kFTWhwk7Wv2HZkblKGbwdHHbpoavOnaYAvepkSE1t13H+A/Jgm/VTwi46GjsRVCQZQiGqeKT31yKJv2PvKhd7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXsmSSXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vgx3MZa4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXsmSSXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vgx3MZa4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52UXl1445297
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v8jFN4aMM01FpG+uGCt+t9+uW/u+8zBqRo1W1nN+KWc=; b=LXsmSSXsL2zX1Ffr
	rfiKpoFMEbDXFkChRvHYab28/IQFI4Lf3ilnjRls/396LHuTCXcd2SPX3AUVw7x0
	4r2oWIMEq4zBPl7Hw0Y/1iuJVXrf1WYQQeCjxJmv/SZ6GoGWOqPngXIso3ghbg1J
	HQWt4ckcbe17k8P7ufLBS1pVgCH3UqFi2zGIpF2pvJpl1QCV2aBxLtLWem9umEWT
	s/CpBXxN4x/+ecCsJh/z3UU5ChA/UN+2MjqK4/U7Fb9hg8NB2/o30QhV5VIyK3nS
	/VtYxvG2wGm0l+EDRaysc58dv5du9mpulhurQMrK2CqCNps73NLOO/8Q4iYjGf7f
	IYC8JQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgvx5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:10:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934a8cd3a8bso62306385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 00:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160223; x=1788765023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8jFN4aMM01FpG+uGCt+t9+uW/u+8zBqRo1W1nN+KWc=;
        b=Vgx3MZa42SGNtZMfEdWeSjQxD9Lr/l2/3S/RUu0u4seJKTSgS7hqfuP0kt4NsM3Jvt
         v5O6gupyhhzf8h99SzJHdXKsJQE6EzhxxngEhDHZ3W5U7nYlVlHGjFpJ2vU7ck5OZv1w
         YkIcnutPLbxOVYnn5c5y99mcG8Lb8cJ2rwGxw10ot5talNTHVpnew4cg9tMo78liP0nC
         y/huNViPALJmaiSnwgKwOyJ08jb5cynQQiBwXZRXspVEN//+rpIgZpv/1d6dFgeoZddG
         7Z2c1mfPNYIme5rPq3H1N4cCJqclgmDpJb86jyrZRYpHM4WhTyixtvm2By6Me2Rsd+JT
         cKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160223; x=1788765023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8jFN4aMM01FpG+uGCt+t9+uW/u+8zBqRo1W1nN+KWc=;
        b=PgJlod6tujqvGMO1HUWAKUoX30FlXB5M7pOEtlFeNhBJgtUrgodGBDNlGasp+TIDPb
         QlZsU6nvMBNlHa4qhXI+eJAASUQ/VcrqWKqx6WaR6Xe8l/d90RBo1y0yO8jI/mOSDc46
         LYQzQzjUAEEtPmxTXnQmxeDXQ56xxvaqlMuELb+rODXAJg0XXghXyq3YLyf5bn+ZVB6a
         kG6w0AAC6+bjn9WszKWYR2AIQb5E1GSjOawQWY3/cEIssE748EyOFGxHQ/WVDIEMW8Of
         y1II9/9HiSzwFSWie/3KBP0tUCEJ/86NkZQshniL9qh3i/6GCGdEteBXkPE7B0r+McGk
         7/Pg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4hhWLrozLVrh/pNL4XW83cKcHU1bzuYv09Xgc5bdk4MR9MxhsDUFYUoCWh61ea/pbrZoq2mL+hifnARMa@vger.kernel.org
X-Gm-Message-State: AFuF++l39O9eSCtz4kgDpuC4Ku8LKi6DJ038nlLn/92oANdc4I3VJH1E
	9BfqJ9jK3Jq2v+a8kRPMxvb+lzSyf7NgQgy1s5KSymjfXbgTDeMnRrqKTsoidtehyWE3tKoxDmV
	2F/e+uNDDGsC41q5nK1QzxsoAtN2ZTTIzh/glNO1cfv6amyJH6daoC1y95kMMbpkXSeOx
X-Gm-Gg: AR+sD11K53rKExnIeV8eXas2zx2Avp7Nv1lp+4mJhm4EE1AmTfSQKYY+C83oKWVjzcX
	FHRuAsiyP08rHJiihEfREVu4tQaxzGfUqqJEl+caGg6jw4ze8UKr+77h9ptH4SU2cOEYPUP0VpL
	B/Z2qNAtUjo8LQSpNyF4//LF9tgSj9+AhUQ9EhBo4/pu3gsoIU5nnGE00+fvwH4MiXw6n3MtHl1
	FeEqPcCsqbkhYVonBbT4mCugrq66PNL68jSE+NhoB9NVJONKqXcGLHwWMuRcaJ0kiP1vncNQsAc
	CWMOcjsuaXGT8t+CBBcIJJcWKrSzI5htHlv3dIE5eV9bvt37NcOCm1PDZDGnFWX5WC0RUC3xF5T
	vZ1KO7K9yOLwdxWYVFH8uYw==
X-Received: by 2002:a05:620a:2794:b0:936:5a34:7a6a with SMTP id af79cd13be357-9392878e32bmr713661885a.3.1788160222797;
        Mon, 31 Aug 2026 00:10:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2794:b0:936:5a34:7a6a with SMTP id af79cd13be357-9392878e32bmr713659285a.3.1788160222281;
        Mon, 31 Aug 2026 00:10:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25618430fasm374376066b.22.2026.08.31.00.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:10:21 -0700 (PDT)
Message-ID: <94b45279-f0b1-4603-a188-00a5ac6287fb@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:10:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1OSBTYWx0ZWRfX4WWrKTffYjGL
 7K17aCqP6Buyfc6kA6z/FXDmy+hNlGrH9H/Ss20Pkbu9oqsc2NXf54tTQRd31ZUMa2SYNKOYyyv
 H9EcSZgdKlhyl9wC9jL1PYduHyVzKJx7WMfIoBK4apmp6tT7pC1yxIJYeGX0YiJGz6aZRQBfOE8
 kgUunv3E7XA7TqzoTJUW4YOW0INgyl8naIZNuWleN/QPk1BhZGFafuNOLQoLPlGvb1bSwwGvybC
 zUrJf2IKtE0KB71Q5zalOVIktoMwGsyIXowdT+j61VCPLbNc13vtAQzZX2pihnZOyQTqDOEVcme
 92S6mJk0PnwF9DWgQffkWW0Jr2GT3AkTpq0XDCbsYKxgMU0qj761ejYznCH1wxLAhf7x0qDA26H
 RGB1UuTxGkWHrm72wethgGXKig1LwfpGho3Lzmy21cZazzuVSKFaiIZixg23dXilH/vcAdm5HNg
 Rb6unBbeT+mVBiY6ONw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1OSBTYWx0ZWRfX4VKXkcTvheAR
 jJ3IU7fGImrOIHAtQyuf65ED1YHGGUW6WHlbkjfkK6RRX7cRoJvCzFtgwdW469T77pyx5tcblhN
 2KHatq3EdTOOAqDMBe2voT1J+ylDMns=
X-Proofpoint-ORIG-GUID: eMCgvuVC7iIO4cjnsCZXJQVed0GLZwyl
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a9528df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Z7oZEuqFRaD5O6-Ux3QA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: eMCgvuVC7iIO4cjnsCZXJQVed0GLZwyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310059

On 8/30/26 2:26 PM, Shawn Guo wrote:
> The qcom,bus-id property was deprecated by commit 345fbbca3f76
> ("dt-bindings: spmi: Deprecate qcom,bus-id"). The property is not
> referenced anywhere in the spmi-pmic-arb driver, so the value has
> no effect at all.
> 
> Drop it from the remaining users to avoid spreading.  No functional
> change intended.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
