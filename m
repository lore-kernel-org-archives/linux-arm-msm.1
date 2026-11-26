Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681403;
	b=pOaVwbAej7lHV38//9XQmdpC9QjRp82lpYprDdyrExBtszMU8rhWp4kKxNwKoP5KXgHN
	 Rwos+dNnJa1rQal/VUxhgMTAR8SZy1J/VM61l20OIYNALKMdHxqfOGyLxhNnMbAubqak2
	 4d0/rnPRclWPPC/rjO5JyTPI0CB3sZnslOlAEj7nLtJ7wUS7cXb38bEPEDlb+zNT++nr2
	 9VertZ1WZ9aNIgMHUaalAwubCLI6nIGMj9kxIWrKpxI0eit9YBakmXHM8eOdkdRtbzkuv
	 mzdFXTsiIhaDblIIvTDjNtqdgcbZqYsbzZP5IQsofoExnnbgrBVX5IWJY+na1PA6nuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tH/+MBhuiw3D5Zdz3N6jBPXU8WuEvVNekZN6NdyzH8c=;
	b=5swiEc3WDss/SCzzgPXueatuCPgeIGa25uxtKJ3DM9iS3u+dwSZ4dvtQCUjwBvnvsyNZ
	 zBp+mVCtVUfvhTL8VWZayp0zKpwJSvPoFzxDSiQH9lr/ChKCv3/LIhdy8BTYjfqwOPE9t
	 BlMOGKcOYNc30AkLnVs5y72fYuXLUTyhGR/soExG1Vw2OyeEGKKWfccKu4YNG3buPI6XE
	 ECj9Bp3Ma2/0ecpfEGMSAH5nqy2uNaFMyIAgkGVPMONjYvIEUOWgWW81Mmq9USNPmlgVf
	 AWpNN+M600ib4Uf0tRbLVRYgJ8juoDAklyhfF3Q7k9iffm7eaUd8UxxkIoCrAhJhhVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3bUK+6t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UJBjv32C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0600606A332
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0600606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i3bUK+6t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UJBjv32C
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B0Fx695121
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH/+MBhuiw3D5Zdz3N6jBPXU8WuEvVNekZN6NdyzH8c=; b=i3bUK+6t+/04AVPC
	QXv4ld8lL2RRmNgo3KqbiYvGOKN+58FXuQvpv5l+UA5BOVvzwJalJXnDw9Zx2bdJ
	Kkr1xH6Kg6L4fZzWpdKaZ6X1Qxih++ADebX9ngAGhopG3kQURXvGnZVaxh1Pr4yE
	WMSjeXcy7YSLHjX4H+64CT0eZrChkz/lf6NUs4eEPRY1QgV4vl/xKTaGncClAYfO
	I03axZQAhR2afs4BgcWU30Xb37frvfW3XLR5V46EOmXV5mIP5FU2KwzduQjCYYqY
	1OLmmaOrr05gBt4rqPizXUdycvkpPSMdGJ2pI9zO7dy+yl7Y46+JgvPvXOgp1V0A
	07wLqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7ramq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:23:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943fffbc5dbso48122485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 00:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795681400; x=1796286200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tH/+MBhuiw3D5Zdz3N6jBPXU8WuEvVNekZN6NdyzH8c=;
        b=UJBjv32CwW+vE50WrXVLjnURVzzuCT71ok2XW64NaJcq9de+PtxKPdLOIhpqBDPgRq
         wg0gTGY7ZfKtZ9afpp+XELQFcpN2Y+kQE9JwSPZWyVBR9qQoTbEoJmvIVuF6ZQ6XNuOm
         ulWWJc8O+n0dcuYpOqiKQaTUn+x0ng237TidNpgWC12VslWL+wSMMrISl5qy3ghRQh1z
         o1/pn16venOnZYPDXrfN6ZfuO5urYDfgXyfqASeyxQ+18HomQFLsG5io+0KNQwqmlizN
         rmljcgqU2QI+4SJK0+oQMo+yajULP4CtfFOQgvhmU19HpMiTPkeUsU+trT6ixjhetuoD
         zmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681400; x=1796286200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tH/+MBhuiw3D5Zdz3N6jBPXU8WuEvVNekZN6NdyzH8c=;
        b=sm/2yFlDXeJh1bWTrv153b/q0UWRqqhc5dVjtSQF/szL9x6SwZ9H5ZxosRbnTfEDxg
         HkjqmDeebmIIMVGZVEyIr+HE7dwZM2Psjzr63PBfneV0POAK7VsD9JBQc54Pb7qeZSDn
         LoeO+/Zbu8GPUW0TO7gbTW936W0KjhA7ZRuCGRzhWqGd3aTDtOEmUl8w+lFjf2ofZyWV
         MeznkJhOELQgZpMv+VHqe5akj5sF+nbaINcSq8rUFjgX6S2Ck4B8TyBlXCxmdLht+P0D
         9vzci2Wo6mtTVXsGB7cK0wq0eAVaq3DJ+qnO8N9Ef5bBpIhhoqwX+t0ok9YfopbDdWoE
         oIxA==
X-Forwarded-Encrypted: i=1; AL+hErEs+pgbL9W64U2PS5gs88exhEj8Ax8K+KAQ3iHlrVq8E6q/wfy6zNEiJ1GBMigm0KXatAnvoGnVyIP1To7V@vger.kernel.org
X-Gm-Message-State: APuU4Z9V1VCIQy8j7Axj7e7XQdW0WuspJ5L9b2831oKu/iHc7EuVAnYa
	WYB9dXxRvPCVFjAkWOgXc++ds7s7x+FB+hkYQ9vyGQmXnuO4gPou+lEVVB9ZCihsspXn1oeVGp0
	HKDBEAH+UHQbncpcKEwsHqkI5iOeeRFU4gFCGPrdbSRf6CPKGiJq6tRXdghG/zNGRLuYm
X-Gm-Gg: AZFdTZdwYxA7oS5b7SU348ue+s0Ow9Hff/dnvME7L6I0RsnqHCfCZWzelYAPdZmTLQS
	9IsD7UuSoz6vaogoWs8wmspKyVuuJ4fyaA3NQoXwsBUjTual4RJeNnvJs5/Pq2zTbWTgT7pZ7kK
	uO9dMn0NpE3UlJjLupuFOcRDz1jzwDVEnXbH5b0WE8qTpQ5DeRH2/PYFNaUthwxVVWqFnnQuncc
	q/eSOOyKRwC9/Rl9IRtVC/zQXETdxWDrYIOjwUYvqe+6I2S1LShuEfCmoaw0asA7iNWa4G0Xqsc
	3AfGKdonmkBTogM4IH618FnUAzEQVVjj06uitxauJkYWoKwsHMigU3DZwCQES2rO/6ZVETKYEQo
	JbeUdLNudOgaaQcLUWPk0UZwcHbucm+vRdGE1j7lx5/bKENdvgn80fASmrKHRqyoVXk2iBWY=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3892378885a.2.1795681399778;
        Thu, 26 Nov 2026 00:23:19 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3892374385a.2.1795681399308;
        Thu, 26 Nov 2026 00:23:19 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b030ed9sm743269766b.86.2026.11.26.00.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:23:18 -0800 (PST)
Message-ID: <4c1cf9bf-cd96-489c-b8bc-41acd85a85da@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:23:17 +0100
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
Subject: Re: [PATCH 2/2] clk: qcom: camcc-sc8280xp: Remove unused PLL2 AUX
 parent of MCLK RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
 <20261126074024.1440367-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126074024.1440367-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX5E2uUmu//fQB
 a6Z+6RuGWWK3vIWfhiy8kzSpqwrrHL2+atj72QFqd7byNAOV4nJR8lVk+Ws9r07FiM/iriCT2di
 Ob8LuQheOR02gTSc5JwTCvJ/HjEFpL4=
X-Proofpoint-GUID: Yb8tj5PshK0Pn3PRZIWcsTFSYNYVoEfI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfXx3/pdZNGDthf
 ygdxUU9Iu1AJJw5zDVco4N8IC/G0d3dmg0HTCx5k4yEHZ7wljULRtN7LK7FyLmcwAMS0HFldswZ
 MpgIXz9FBlmz0yz4MYuhAxb+jKHl09EtBYZLezRJ7uj5piRwexcmww/w4EE+feeF3jRR3c5Fm5I
 m6EZmnfEG3zX9J1oYKQIzaztIzGADhO+oycDIVimZBMLKbEBY0DO0CK6L7l879SkdoY9b8WUCVh
 im76hNYDdUJOpsNRO/sLrgdBcxnMH6AAz/SxErH+Ox+7bSwm5XxKuOp3TYdU7myKAi6mOXt3b2m
 P1Dmjn0SRugtj1cohAOb8jfwXBJCxn2wcCi7MO0dxZaktBiHKba+Hf6p72KRtjDJuKmYQXBXUXp
 h1krjYCel66l5mAia3EyatqsbcxCw5inXkn7YPIuIUWi9xWPRWVPpz9GjTTeNddsYr4+oWBQ+6W
 ZTFXEwmhtWHzOoyYz4w==
X-Proofpoint-ORIG-GUID: Yb8tj5PshK0Pn3PRZIWcsTFSYNYVoEfI
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b07ec78 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-U_1VXsQQ6ybOVNsTXcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260032

On 11/26/26 8:40 AM, Vladimir Zapolskiy wrote:
> The parent data of camera MCLK RCGs has two entries of the same
> camcc_pll2 clock, one is for the PLL2 AUX output at mux input 2 and
> another one is for the PLL2 early output at mux input 5. The PLL2 AUX
> output is not used in any MCLK RCG frequency table.
> 
> Remove the unused PLL2 AUX parent, like it is done in camcc-sm8150 and
> camcc-sm8250 drivers for the same MCLK RCGs.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
