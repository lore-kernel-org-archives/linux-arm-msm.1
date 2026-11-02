Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620750;
	b=f1xmMdld0UuQ1DuimzebrfrXy2ZhELZrbBEyCPiGjS3/k2JLPPdojdPYGoeHrALMK32w
	 i8qJyRT3OcwG14xBOXAMstggl+tq92kEmm6XjAPbFDYc3KW+tObSksEiE9NMcdx2jXRI+
	 rcNmsHoGU4h073Ee8e04QxMkD2IDsoJAcybLVJbLNJizp7RlG2ymryBCPfx/xGJiY863Z
	 yo3DcSr2afGry6d5Dt/9dKeY404vt/MlN+R5YX14ExjdgSXKIrNWqJb3i+B4Rlqk4PefB
	 kBvqF4Y6K4fXsLHM5fFrB7DimUrPI1aimwU+luxiGvvEeIa4n0SsDAwuZK+kYQioZrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=;
	b=nvh84ead+jpLjCJKgJL2WYbxXgyY02Joba4p8COWADspveUWaOvZWj34cd8wCqOl8yxa
	 TlUzCxQM7Y37kXXvWPbK2GTAOwbBuRNxeYNZ2cjYzODNTPcT5ceN3zwsNagvAW9AEWVCq
	 kPfWXXe2TsDDbJOvtBfnqqkerxN4J/jhG8X/cAYaTTQyLX9opXXyKPtUV4LmWzXCMYUt5
	 Y9lhB6hGKQtOlUg9q/6p8RNVRINJTIhexY26n0vYgEA7UbRa+RKsbMFwTc+MYSfeXJ4ID
	 zgXVkaQojU7otzCacpD7+iSgEx/3SuCVpvBppHfeJLj2uBX+SJc89pmvi9EBiJ8YzhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y8oQ2vyC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TJaXw/rM";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31CB606B178
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E31CB606B178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y8oQ2vyC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJaXw/rM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2BYmYN3762986
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=; b=Y8oQ2vyCnVpJLAoV
	Led4OW3bjQvC1mj2Qu2bSWaQpBQdXQKp3KzJ3heOvu8tyByCf21b1XEZiakNeCAE
	UEmDXpvrblhGfOfVO6AzcMOWjwsA3PEXZJei2M6RDV9iR3b4diFzWPkfBQZKfHcq
	iGJ1vKqhnF4fEC3DbagpVJ0hmLN8KERLnKhPifWCI0MweDvJ/HLo4GCFPtuws4pB
	tRDK6w2BfJL2iYEPEaVXpaU0Tq/aLe/jgneSLiXO8rBFgjnY248zHiC6dU7yDNcO
	fLKVb6IxcpKzTVB3mlBaUTZCfQPO1IMSC25jc2XcyaPgAtYRXLnS8Pvo1XK75sVt
	mC7VmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5g2db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:59:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so10240085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620748; x=1794225548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=;
        b=TJaXw/rM8ByzZWujiZNoAEf8tdZKi6QXE/T6FddaY9cB4VwxGoLmiKwaYSryjLRSbG
         ookcoHWZjLopwUzGW9Amf3429aTCTkWSElKvTfRuqCzCgJmreAS9wlYptoJHuEaDZY5P
         lDYMZVOA/ECELe8eYMz4ZqghWocndBJPt4rcvEsMYcUs1wOFO/MRbIUEP4u1BvkQ6HBM
         WihpPQDOOzyT6ejqAPGijmIO3LCk25M4O9PTZ0D5gQLjciFfF6+EKVC2AO23qox2/h4j
         07iWkmxyYvs6MqHE3vojwfEggzYEn3b20cuZDYyK2TMNNutTJ1XIGvYF2oWYwFQAgVfW
         OILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620748; x=1794225548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=;
        b=P79qxpWv84xIlbIC90CmxSTBqATbDZZ6vGjJo6/MpGkXeHKneniipL/fMmqq/IAQbK
         STEBe+XiIaVzTMw22ycmVAgvCHE3RRcwE/XKd4wh3+24ecHXr8YwoHu/v2XJav4zZpAu
         vLulsyQ19eElOKBgoS8Pi/X1OdONbakjXgJdSUpvgpB6B19uc6LCJ0L06qzqpEXhN8qY
         XrKDyqRDwm6c64iRrYN9HdimppMpiCVZ2iXSxvGFksRRi6NxgSt9gWk3Exbultvt/8ci
         n88HKXiSRbq9MbaIkjuMT5RZhv0+5kMopR1KKPoJT8P+6fq7n6Jsc/oXar1/7XEtI5ua
         ZiGg==
X-Forwarded-Encrypted: i=1; AKwUvBxsJCKqsCODGhbqn68gufUIHg+Zq7RimISTIcYckrkjam6N3eOE/NJQoPjwvBKoBU8Q/ZjZHj6jWwJz6nrC@vger.kernel.org
X-Gm-Message-State: AFq9FYKdcY7sKsy5unDGYBLNiD72xY6Q7nFwTY/Gl2hDGawd++sWAmQW
	uNc3ltfTpG+Rnf809krHxyo7RWf7RtnnK6ClSkPljDRhN8K1ON38KF5bgRrP4jAvcz9S0yenUC5
	m1iHOlopkVvr1pV0bAG7tiaSBoXHHjGGyiKFDRYhkteimuafjmmaqAokAiU1bEF/xuuYL
X-Gm-Gg: AYBFou0pgfsHlDFTt1Roc9LU9MNb7vxZgnF95Ag+GrkUBx5mv2EAsyr6GNYN0LN+EwD
	3MkpFS8wplcIQoorHewMLyD0wXkXwuVcZy5GZ5W7OClf8ayrlAakiLwCDCA1DtRkulySW0MD+mG
	xYGdaIJG6hGFVhwrPaNlty2kRR3idgBOceL0DB/bj14VH8sF7nTkvjy0HMTaZREAIIlKreWU88N
	ujHfolBMD/obryGEwyx3XoVmR4NGm6vd1vMDCicX9DWjNEVbrLfpNTs0A6TIt2M9txrBC1mipOw
	soMWVLKeshBzto30bYujUk/3CDUbauvVKwmq17ogQG7YqvxwnqxoLnwxJvaorPSebm5y1GRr/WS
	OIC94b6h2ZF3dsoAb9/Fp3sb72wm6FeiG34UZeRemw6in8zjuu9AbVYqt7mjSD48G3sxd/no=
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1610769785a.1.1793620747829;
        Mon, 02 Nov 2026 03:59:07 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1610762585a.1.1793620747264;
        Mon, 02 Nov 2026 03:59:07 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm379723366b.20.2026.11.02.03.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:59:06 -0800 (PST)
Message-ID: <d176aebe-bc30-4585-8b71-821a30657a0d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:59:03 +0100
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
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae87b0c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=JgZe5hknAAAA:8 a=yd_p4N631o0H4GjTUx4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-ORIG-GUID: zmQOvDwsryL0f_Re2q9Y93IxebJkTdqw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXzQTnpBbkkeH4
 O6LKe/coyplNALavvwMydFzKbi7SpPoyOb/OMWLXVepEGoMjIVL0HOwFTSI014qOFUbVpORP3b8
 HpPHvCQC+FM/U/37PosPUXN8Wj1axrMLpLutG6ZaPBrYcESQNiMhu4s7Aw169+p1Jfrg/iqXWVe
 I6fcaXo0HWANIlhUHGAkfTIvXMTuqj1j51ekzAe67Vw0quNEJBsMxpj7boa834RGf3LMmJAHTn9
 lANCo/b58ByRL+NYgAVIuvNIN/0OHoBT5UlnBfINnItywc1iUMZW6fuYRys/5FED7t/BTHSO+Na
 feQZ7BxGc4TWvoyuu1Ae4Wce3xfpvDEv8B1K+rfqqAAKd+eHz9APTIxm+/1YFYv2GYjR+Nm40Os
 naUjnB/7jKzrQ6Lhe9ulHCk6BQjWeoSyeyRkY5l2CeSjqPYNhtvaCKDgzWG2JmkmO6R045CF7tw
 rCsrRwG7oGtYyPo9D+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX9w8v3FSxTrnh
 KJYbTrMmDtQ1ElFkm+rs1KgXpxnxGaDhaEWIJ98E5TTIaZD+p+QjVOcY/Mypte/1WeYL0B+mk6K
 +mlsOx2S71xf2FswcN0jYZXqJC+lxIs=
X-Proofpoint-GUID: zmQOvDwsryL0f_Re2q9Y93IxebJkTdqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.
> 
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 1e89c9798edf8..ce351a3fa8727 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -77,6 +77,12 @@ memory@fe901000 {
>  	};
>  };
>  
> +&adsp {
> +	firmware-name = "qcom/sm6350/sony/pdx213/adsp.mbn";

FWIW all other devices have an uppercase 'S' for Sony here, I'd
like to keep that consistent

Konrad
