Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EBC443E22
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043580; cv=none; b=PLnkaJl2TOveWgjqAK8YMO50B49JAXuOJNldV0QmRxJpzNZ46kRvok5kUoaw4hU5d7JuEl7lAmujeqzvtH9+gvJ1L9CQu65sABkbc3ZBoeTtYDB4XZAVXxYaekkCBtNlJxc0lrfANd0ZHI26P/GqScjClt7gs2zva74DotyrsCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043580; c=relaxed/simple;
	bh=+th5XjfhfCO809mA698u0VX7s1mNFanLjxHEGyT1xio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ohxke8lFTsEZObk6KWwfcOr5/YbcI1e/pAYOWexUUgyY7If0hmNZv3ug82yvFf5XKBItXGFhhPv0RNQpkaOYACBtSjPUP2+KqS1j4xVf2w3lcWVJRHIJ07WTLqvs2NFTFD4aFchVvFdZkkyWHiSMrpTbyiI5kXhjJVBaN7FilOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odJNddL6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQAWiFKG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odJNddL6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQAWiFKG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BLRL310072
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUZh4V+xlLajL1iKhB/L1N6pUu9ZGTc+yAIjmI39q5A=; b=odJNddL6n3Yg84V/
	V7dp51G8nLT/abdu4I4lBqhIab1eOjaky+vhaHVXKOa9Wn0wI3JyLXDAP2LMDO97
	9xz/MMmkWSxgIAnNNn5ZQO+31NzCq2VR/sOHEWxhmwxU4Ykb019Uxh8Q+939IkvA
	BCy65w40wXYHSLmq0zVxe6YzJAyMgllnbph5RlrWzt2KawKiJOzFXLKX9nzho+h8
	GEYxTtZNshjh1I67lYUqyvvXFGL3qTLBUrMma21YSJLAkQWEkWsXB8m1o8Kd5l2l
	0CSLjWXJxfCjXa0Xaw693YZ5+vuuqHWAYNASoIAPSUiBa2F7Rj8bDdtcQ3ZMHDN9
	ZdBHpA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba9c8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:59:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936cf9b6f32so30315185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043577; x=1787648377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUZh4V+xlLajL1iKhB/L1N6pUu9ZGTc+yAIjmI39q5A=;
        b=PQAWiFKGhJSzHN9P9sMsifBC3Fjp75ELhgJtggVF5/h0XqtgInAYD/YQVr5+vsth9E
         4QzsK4XAsKDJfl3Mqtd7BCLvzZsHaz882nz6NmIuMhm9dIC+OIcQn79Iy6X3sK80vUTV
         mM/5B7T7nTu0eNWTzPQQIUsYLpuQ7qv8s/jpDKSL8gE6ZDn8xZvKS7ShPDvUEc77OzE4
         pcg11G1DSp3n9GYZcxfs3t9akp4nMH6Eq0MnBycSVgtuiYDF7iU93IOp+iE56R7jTPR9
         1ypsJsI88aS1lMznpIi25/c3itxsf3erBhG2CCkHhArc51VIxNNH+Grd6NvNy2o7bQPe
         d93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043577; x=1787648377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUZh4V+xlLajL1iKhB/L1N6pUu9ZGTc+yAIjmI39q5A=;
        b=TOMOEFCsTmnHp1ufTlvrkgyI8aSEjpInIguzKaOXXjJ0LQju0V0LVi2isSWCxVkpKp
         S7qNZC/0aBpL2ZJw07FAu042yzP7rB7j4rw3KRf6XQduFikdSKRw6/XIjEeBWW/w21hu
         n+He14TekFnPxNTIzLzLX8f/YFnpL2rTooBqs+9TP1WhU3nRUUJYt6ztaIZ78p6yZtjP
         ZoyhbTWxnJtXB9DJ8mUteGDeS9Ca1Q6O7J5eNbHVxkM3u8W2Cl+UgOUmVgIUyIjjXrKe
         omZAZztXh8LJG2j+AsH8CgQr3hNTjSMXHmBwDWljhS9KtBIOwGzuRlhFfJDe23Qumxik
         kIew==
X-Gm-Message-State: AOJu0YyG1PsY+2VGeEfIHLvgBXp8/yQ1YLApItaFamK77q5wP49viS4g
	xmFUJA8KP2YDfs3iR9kqkqYkjah84++g9zKCTC6zOXv1kw1EkL2G8UyuGXeiXI5wDwajrM8hvUM
	YRw+ZGWnzzdZ/hMSOF3nW19h2DYfm5HY86CwoyfCL0Ea5P6Dj0W1kEMZPZBGFIcdCH44y
X-Gm-Gg: AR+sD11GTse7C+vrk7gWv0qNbNA8JwHWwIVft1Qb2IpCK1V3k33jVOZ8yrFGpCEBKyw
	MC0BUTSDhM+SvZYOhYXTqt+ueeNXLEo74POEfDkwHo5s05hqk+tsxDdb7IfX6XW53PmVnJjNNmK
	eLhkbsSr/gBkbIbKyCSA7in2TDA5ycZRIFjlUPX1q+4YK5OtoxPf9UagbUddMjpRbJfKz+IsqOs
	8LfkOFUw4Pni7NnwVOasn0EfguVnOM0K4FJjD9twwaXnftyPnsVUzMe+nvGRec5NS7Q6t0kcXMK
	dv5p4FidtGTC3guLLrW+asRR6jq6fapD4cCqvBnTBk7k176eJMZWf1bsnyCnmUuewptzh54ELXT
	6VZ2PnNOYe2b59wDE274jOo0T
X-Received: by 2002:a05:620a:a19:b0:936:f9a6:3813 with SMTP id af79cd13be357-936f9a6387emr613139385a.0.1787043577229;
        Tue, 18 Aug 2026 01:59:37 -0700 (PDT)
X-Received: by 2002:a05:620a:a19:b0:936:f9a6:3813 with SMTP id af79cd13be357-936f9a6387emr613137785a.0.1787043576821;
        Tue, 18 Aug 2026 01:59:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea2cdcsm154925766b.18.2026.08.18.01.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:59:36 -0700 (PDT)
Message-ID: <e5cef6f2-3953-43fd-be4e-db526840a344@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:59:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] phy: qcom-ipq806x-usb: fix the PHY_PARAM_CTRL1
 field masks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-6-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-6-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX27Xyi1zy32lM
 RnZG87EV98z5HlADpatDsjlEEPIYCxq8DV6UlGBxAHXeAzKlewVfErNAgFNuOYmezj2/jbZ5Sqt
 EXGQwmbJDjdLMyqJLdH6odv306zBET0=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a841efa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IrLRzikX9qukkVrrmFsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LaNyQj7w0jZ6DT9l1VqFBeqzySs06YZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX3cRsW+DaIE5l
 dxr9s00Jv0+ufA/gjiIJpGYOSDsxIyNoRNf102jJXr4UTJytalvP6xdcKPpS9xjKmslPKMD+dv5
 JHfcwRJRWH8tUp1XIiNnmMY9cWdSzheuTstWAwp84iskvFpyiV319eaAYt3xcxjR3ViTjU6Al6w
 kr5BQm0xSnZPe+Gf7gAhG7n/Raj1soR3NTxaoRilzWZtZVc0axjPi63OeaT38hgROSAKMyG9BvH
 LgxcPb2DiAeafF2nIs/YJvUO0J6OVLHNik6ieg4WV0ean8COGlREF/AKHnPZ59jxVP0K29rJZqk
 Esv4HC7oUTreXT672waXM7YJdW1juczcrFtGRL4aDstW6IMB968JX9goAEI/uBrws11ArK0D6sR
 BR/RgQi8e7ptMckheadbYWLyl/PQEzte0crwz2ifqYjhyX1yJoHOQ6LSgNScm/hDP+4xdLLI/qQ
 SVMPqz21W46ZAtMKyeA==
X-Proofpoint-GUID: LaNyQj7w0jZ6DT9l1VqFBeqzySs06YZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180065

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> Each of the PHY_PARAM_CTRL1 field masks extends one bit below its
> documented field: TX_FULL_SWING [26:20] is coded as GENMASK(26, 19),
> TX_DEEMPH_6DB [19:14] as GENMASK(19, 13), TX_DEEMPH_3_5DB [13:8] as
> GENMASK(13, 7) and LOS_BIAS [7:3] as GENMASK(7, 2). Also, the field
> described as LOS_BIAS in reality is called LOS_LEVEL. FIELD_PREP against
> these masks places every value one bit short of its field, so the
> programmed swing/de-emphasis/LOS parameters land shifted and the
> neighbouring fields are corrupted; the masked write-readback in the SS
> PHY init reports 'write: ... to QSCRATCH: 4 FAILED'.
> 
> Align the masks with the documented field positions.
> 
> Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> @@ -436,7 +440,8 @@ static int qcom_ipq806x_usb_ss_phy_init(struct phy *phy)
>  	data |= PHY_PARAM_CTRL1_TX_FULL_SWING(0x6e) |
>  		PHY_PARAM_CTRL1_TX_DEEMPH_6DB(0x20) |
>  		PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB(phy_dwc3->tx_deamp_3_5db) |
> -		PHY_PARAM_CTRL1_LOS_BIAS(0x9);
> +		PHY_PARAM_CTRL1_LOS_LEVEL(0x9) |
> +		PHY_PARAM_CTRL1_LOS_BIAS(0x0);

lgtm except the POR value of BIAS is 2 on 8974 and 0 on ipq806x

Konrad
