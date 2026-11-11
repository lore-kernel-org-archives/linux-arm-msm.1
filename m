Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407931;
	b=x0YcpXq6puhcXZU4TcnBK6W8FMHFOeU6JnfKeU0Ur/UUttg+Oc8ipXCbBnSSA2c5VOaQ
	 X9mUJyEMJImgbv/SjAM64EMAM1mGee98QbxLcu9lD68uxIwK0AW/J9FgA3Mkbs3pQvWvU
	 nKE/ap4tVCBk+m/g1UWzM82uoZ443pjzeeKqhFFzaF4yAfCBVzSSZDdkfsvfs/M2ILbbd
	 psYD51JH85qZEYdZklUsDSjPs7Ak0XpF7xRCQ7rK2hWNk4WC1K8CwNyQUBk047roElTAj
	 +Dohamc8Bx18IJYVNgp7nmber5Xmo7cWvo/jUGdiKxCJ0Vyj3FJ42EGqayDByiANirA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WqtuYiZOllmUy0GRDwONda8KCz8KRFiaccB7F57lrUk=;
	b=aLJ3DNgbxrjlk9dMf6FYww0ixS3XfOrrXlGk4zCVgh+n0Rmi18JF3y41WmlCFJ8uzHEj
	 MrVtdPanvy9rIETQ+U5JimBxKeE3x1xZgDPGT9rU/8lArHnt0bnAlCvo0J/6A55J4qVsc
	 ANYqYENIGMLg8iRfNZAcDZc1R40T1sIFBWYszK7jp48a0JFs2tCfoxtEmgYaE3NCvgr7X
	 Pk9YPqB3Xk42cvRjV7e3kGqsV9xpfQjOwqX9b0Ebt6x0o26rhGLxKonJqjkK68Xj5lgdC
	 dA6+cvjUKUukND+yA37wAbyfs2xzWF9PhAHQOD7iBCGk49/bgfRKQJhGQyBBDz4wpKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFP9z1a5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URuO2R2+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D007606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D007606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFP9z1a5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URuO2R2+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJbJP528261
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WqtuYiZOllmUy0GRDwONda8K
	Cz8KRFiaccB7F57lrUk=; b=SFP9z1a5LdW0VCRoUfvIiCaNzaEE5coE15t3RzmJ
	wwwE+vqRsCBWf59caZKuNvLlsHI2T6tsGZAb7iJkVPW5gXsnAIh17iHs3+/NUA2o
	XpQ1rBcu5thW3O1fkF+nkGVHH3EcmGf0X95fuUOYm2TIOmxP8LxaiQ64pEguVBe6
	1zSCyqFraAYhyOa85YL5TjIj/KDEeNib72yXX0OPWpIIdokO68tK4SD9pomXGbKM
	zt9rR2OC2DCN4barUprs9BMbNDHrao7B2C8qCvB4C9mBymppyLjGMT326ECxNdwJ
	HUtR/w/Tzfqe7ePPB9ZxSTHULtj2wKtC5AsDsKpXxbgxUw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjs00s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:38:49 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-999bc06bfd0so2280381241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407929; x=1795012729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqtuYiZOllmUy0GRDwONda8KCz8KRFiaccB7F57lrUk=;
        b=URuO2R2+7K426dpMBiQd2rRd/4jzYAbqMHfXH5bJkGBSqi8UD2s+DHzLuyv+VRY63T
         WjMF3uOUyFM3LnItUdqYseUveZ3V12edtB++rGt9DSaC6qlu/ggUIuNe5JElMtOcUtWR
         xnX1hN/LJVdo+zAHjJw8OX2b4kTJ1uf2cQrsASvwroHGbv1kt+a0Wunw38nQtiOs8wJE
         ZIlOICzOZSEyLu0fd7IVkqeB1H5yRYQJKZW7qaZyKh1Lg9+zZ3HytWeigAbDeaAD24AX
         rQVchCMurCu3+iaS8eRqf63bbKyIAWHoprZxr2b4gZQZlhFB1+Ck0QDDQdB/rqjF1lhW
         nlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407929; x=1795012729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqtuYiZOllmUy0GRDwONda8KCz8KRFiaccB7F57lrUk=;
        b=KkvdFdIetPqGA0Ef/bCdQp2l01TkgI4c+yyUa2RWU4OLitelnA3dRbL7RzsRBM+jWT
         GLcZzrnIhp+eWSVgb4CbgfSI/pCHmfNdGXfeoIgtvgwX+KTju+Sdd5JryGTgIT+bYsa+
         x06Rx6pqO1mLui6fTxoFL908W+O3a5K7GlzJzMVMxjrsck+Z63ZlFlxKeuGyDjUyFUd0
         Z6zyTpv7gZTFIukcodtWlJ+amRYEOxjOsYehwKTxTbDjdIiSFPA815wHwHcvyWe4AwSo
         angplGlqhMnRYxX5IywOfWUsC6e7eYF3gjxTksrh1lWWbhAtywAsseS5JeF0VuvTwhdc
         SyoQ==
X-Forwarded-Encrypted: i=1; AL+hErHr9qcX0Fq/di8/e1acCgwfwGGICDUVmojsjtiyrO6+0I4hAqGHFgqHdLiJvkbKXURPZ0eoRi1SQdp2peeW@vger.kernel.org
X-Gm-Message-State: APuU4Z+V2eaP7BBDgcYS69H79ozlPzkTtxEhg+iGb6FPNSAwH2AexN+z
	S0pOeTpakcc11+38Qw1mdkkC739weentuXaRo8qgra9OdUARFsIHNGwnY/uUSRcKFzeW3xFIZsQ
	KyH2EDunuL+bnv5SQP+qzBozeFkid05DPKTk+D3E2wgEgrV9AqYl5gbyAz2HZfwQw2KUu
X-Gm-Gg: AYBFou2dRP1UyyDPJXK/38GBtlVmRScYJ02ePZYbyOdfnko033w4QAk+oS+nTQsW3An
	VUW0hokzOHAu9+IuS1ja84vtUBBYUoIDtsHlK5sCYXkiiknLpxqqmZ90veDMBQlI+uV8UCwdMqy
	8/xTClCvGnDa43ogCz2c5Yfab2jE3o4hO5jartMaRd5IJuxOMpwagocSi2twqIC2qE6GP+rvFKf
	dvgwG1TAqL1v5WkAf2nTyYNXyuYIdAvWqRM3VIjW1lJxvJHdSIFa9wK/muWyl8bJEn9uVQFH0Ei
	NPcqx1TN2SmEVp2kXyodLpXWR24WtjIGIpGCb69An6g2YBN8hqZPO3ZY2WHtC9yxB/HbGxVNpJ4
	HfVXvoEi9Ak/7NuGYSfqgPLPIDzMn2mPt4SRAFrgtRt+jsLdOkDdRaAYUEc48XQB7
X-Received: by 2002:a05:6102:c13:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d4fb255e87mr933263137.7.1794407928900;
        Wed, 11 Nov 2026 06:38:48 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d4fb255e87mr933252137.7.1794407928228;
        Wed, 11 Nov 2026 06:38:48 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddd467sm52210615e9.0.2026.11.11.06.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:38:47 -0800 (PST)
Date: Wed, 11 Nov 2026 16:38:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: nord-embedded: Raise i2c18 pad
 drive strength
Message-ID: <ujqm2euxzzef42aqvnrobearrftzm3ua4kj5ivigjvusnkbxmc@q3e7wiolqxor>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
 <20261111073121.3707030-4-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261111073121.3707030-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX0CbpiyRM52j/
 lDzihUDexxm8Ik4radiHz5eJ/9acl0mIU3RUBvFhXWSOU5wavYYafXOX9tAbvHqfktEaSqBM0mY
 xZcwki/Tm5RsJJrvAR8RYH9064MK1bYAg9z0oQPpFJ8SwjSHY3jgBv/BB5n/OYqUjz5Wd5dOzkB
 UbFped8HeJCrc84Ejs9TnHp3pc5s1MdL4c52oRaZGyen82RB4zh1VAv+zPotwLXjuQ9kK6bm3MX
 mObL3nDZytOqz7+RswBswWdRueFiDd3aJLx7rPIXA1OVeqMEzsQFW1UAvlB5f4eaFJqkOudaszA
 5Z9EHAHZGAeOLXOLLFmAVPstKUAnyA3Tf/VKXVThdhquwr6R0rZZ271JvpxGJ1TIdQ3vkJJCpZe
 APqyF8X205QGX6CagQTXd3kiZHclTixithyh8zTA+EXBPRXPe5d+xhahgOwJ0t7qfvIA7w0gaCt
 xKIZna7k9Zo4TO1JU9A==
X-Proofpoint-ORIG-GUID: JTQMtBrdoVGFGjMGZWSpOhr8GbvE6XIz
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af47df9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EM5pv7IvHfzd1M2C1YcA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: JTQMtBrdoVGFGjMGZWSpOhr8GbvE6XIz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX8kMlF1Yh+7Gu
 vDTvTyrh9VCrTW1KRXDQnUSI4GoRvJQt39E3lkHXp96va8cLwUjkN8pbREZRcWKVqK/YqZ9ilPg
 0N7Lidhewq/2w+lKl1fPTf68GeYa9lM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On 26-11-11 15:31:19, Shawn Guo wrote:
> The i2c18 pins (gpio154/155) are configured for 2 mA. That is not
> enough on nord-ride-embedded, where i2c18 is the audio control bus
> carrying the TCA6408 expander, ADAU1979 ADC and PCM1681 DAC behind
> TXS0102 level shifters. Transfers intermittently fail with arbitration
> loss and unexpected start/stop conditions:
> 
>   geni_i2c 890000.i2c: Bus arbitration lost, clock line undriveable
>   geni_i2c 890000.i2c: Bus proto err, noisy/unexpected start/stop
>   adau1977 0-0031: probe with driver adau1977 failed with error -11
>   reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -11
> 
> The failure became much more frequent with commit 8cb5c17be3a2
> ("i2c: qcom-geni: Restore the source-clock selection policy"), which
> moves the i2c18 serial engine clock from 32 MHz to 19.2 MHz. That
> commit only changes how often the marginal signalling shows up:
> reverting it, or lowering the bus to 100 kHz, still leaves occasional
> failures in a codec unbind/bind loop. With 4 mA the loop passes
> reliably at either source clock rate.
> 
> nord-rrd uses the same level shifters and has not shown the failure
> at 2 mA, but that appears to be margin rather than a guarantee. Since
> this audio I2C arrangement is the reference design that customer
> boards will likely follow, raise the default in the shared dtsi
> instead of overriding it per board.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
