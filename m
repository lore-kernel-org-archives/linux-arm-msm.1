Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364905;
	b=zdEi4X0JiOCeHx4Q4aFFogge4W9A046GguZ1C1uglf+zu9SAu2z7k41hGWD6rYIdExjV
	 6vuvmaRatpEWaNzI7me8f30jQgmbtuCIc5wLZBuUgiYzsWv1blD9tdxIv+Tgk7bZXdn4s
	 T3pL7pIJGcVmZPEJ9dJahd9TchFKa2LfFy4jM5T+lHzxjmKU0ob3NZO4TJgnJZFaQy0F2
	 vGbFeocGIJADQHGTCXaPnSfDHgcK4sAlJ0ogsTlR383K54PT7jnpRuKKajYwojE8Jc0bt
	 xgYuHl2Ig80/EUchKAaPCwHkQ5Fql1U2OubYlT0bLC6oVwh810x820MnPDZFcTY/ojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=;
	b=bUc987Q64LL2t8RiTeAp02O6jwWZPpVNZU0PXlJsejZIvOgfbStBz/9HrU7GJeLyxveB
	 TnUFsejXmaGXS7YhZb9nfyD+WK/d/VfJizE0lM7tnXpqEffOr4nkqEv/hbc+wKHwzkXrQ
	 klXXT74KH1ug/wSdvDnzgpDtugNABQcbKLwhyaT3w3vpviRln43uNatul0X3SOAWrDwq5
	 ut0hpwgOk6l6RM3fnouj+DIt3pEoydiNcgIlQaOPL1cO4HY7jJ8hfwoWwE8Wp5fKVBn19
	 hh5jTUFEeIKavcH7NHCn8EU4knaG/rX0kTrz0ADhVFcGAuwbNWX4dMQaU2JOlsc9fmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aw6eZ0Kz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNw6Eesg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF2606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98CF2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aw6eZ0Kz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNw6Eesg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFxCq4143797
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=; b=Aw6eZ0KzIS3gR3cW
	VB9ZTCAbQ1fxcmKH/a/ppSg3VSMx4p4Wkin3E86IIXN07ay5gTsPwkvbDzUdIHgn
	275yA0idrLaqaoK8I2iOjlr7YaeM2rN2GxdxknC1zzU8FlCzW46Y4W9SYvRRWJ4f
	uLAqkrLWBz7Apyu6VHs6EJvnSsN+kEnW6H2KS4AQdn/pD/dyColn5xias6Oc4s83
	9pG+YiMOi/XPjwUlpOgtLcfjrCTPQPMajGLtahTT2rYDkpY4VMbtz50Bh99YsQin
	+sNll43LNCmHktVtA+f31Od6FKWrDgG09HmGwDUjPx+ht//qyDgaqzHdsYRr3uS8
	Esanzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75333a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:55:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944102381acso15019285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364902; x=1793969702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=;
        b=GNw6Eesgy3bBWKYZLCRer6+9Fl7NwwfXPBByPifuKwIROwUfOYUdBvRZ//qJ4sjqnL
         3UzVcj5WMICrrMR6oicxNVtiohU5V0wNf+eaWTBg5748iw21K6JNAT8V8spNAIEl1/Nz
         zpR58crhyiT7rs9mNVB9B4x5NbHaFUXYVvbf+J47+uFkABu/swCSxU+FDMbqHHcM6kxa
         P6/+r1ANToRHqu3MGGpf1McF5UyZhvPvnpGsZ5MEh121efdvUBgpOyHRMcPh4d58qy5C
         +du90RdhqlgDo8cmPvHAEeXF4F4eVLbVwcNRy/3fXWDdwv651Cgwca6KQgz3ZqXmsVqq
         ZFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364902; x=1793969702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=;
        b=ezLZwt/rMi016c+WelueD2MWxcmYbaWN2stGrN8whVXAek0H+BNP4c2iQP1s5iNOm3
         hod7nQxW+khm3re1PF6oOW3AcTNkHVllJqB3/6uBCUGhwf8laaxvk9xZ+iXzFIuF4y1o
         tijWSqUffcYtgasTGMOm/VtSIg4IXWcv1Fjx//HXnYjpl0tfQKn3awoLY33TODqXUyrs
         fANNk6mIFHqYuWOJsWE9YamUWF438xH/1CwUuUcC1zZ6Kgvf0EK18rgtrM6YC9CqtDf2
         /C3xP8XsVe0jK1eihblkpwcboh7H4rJ/N2BBJZAuncwkpLAhdpc6OvS/PkBTGqSYRRAW
         TO4A==
X-Gm-Message-State: AFq9FYIG80F16nX6sER6f6lMbGAc+0MMjtW0S3pltp++iac3/RyL7i/n
	+K5DejIO11cuShzXXevNAxHR/GR6ObgdOYX6bHc0QRTgUJ5DUdHHRHWzik6uAXp36FE8M+L6ozg
	KEkwsPJjvmdPAxBKIHmFXXwotpIwXNmJEznO6rMV6HusFtsF9XNbky716Xu6Sj0tZV5pC
X-Gm-Gg: AYBFou2YQ2LqpmwLoXdPeR5IVofixzhx6JOIlwwB/wlaTf+OLeTTH2/oNfqiggZCE0K
	xcRpazqME9+FudOmA8Ozeh2hUro0Zow2gwzSSj/uhXKQGyXeES09lHW9mImSkudu0J35tMvHH7s
	xvGnr9HHXs1MvoqMo4ZPmyValnYZYMhwpi63GFeai3WMSI99xMfVg0yV1gCyeN5+X8zIDws9KB6
	hWO7sDtOJGA5jFV860m7KvT7JxqEOlgIPfJKHNc8u8VwYFVOjF1FkKNuzP2GG5fn71Z0Npn3vGC
	aokO0os+teXVI9L+mqYcelTTNMw/JYgaKjDTIzxzDyuHvFkDfk7XxrUm9W6IdfWesbiqY7LPQoo
	rM17fMFNYdAm66nfRHb0vv5T8GewxoPKmxZ+lZLDqb6gwHe2CyUr0YLbCLftjBjpRyNtQkU0=
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372890385a.1.1793364901803;
        Fri, 30 Oct 2026 05:55:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372888185a.1.1793364901285;
        Fri, 30 Oct 2026 05:55:01 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc30sm63788366b.26.2026.10.30.05.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:55:00 -0700 (PDT)
Message-ID: <e1d97fe8-3af1-4429-978e-9f2ce59e87b1@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:54:58 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing Iris IOMMU SID
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2MhFlNJKy09t9ts4H8eyEjEZVW2F39c9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX0NZV5YNW6Ysn
 1L6eQZ1SxQ+G6d/H/tq3zNKUZ9/v3bBWRPizGs2ExsmbKDB/GzOoe9f0fxTey/nMDNxaSFFoJR+
 Whl/zFCEYyxlcjzmKfgE3B7xqNUPoRGQB7H6HliKZXdX+HcrZjI+AIki76XMUbma4Uy8Nmqwu9p
 tUFE58SSk8bI/PstCyoggGFHD/b9ziI/WH9wNQIv7P7eNrbpo52fViSIE/d3GPP/MsFqR0U3DVk
 IW7d/UC3TpnVbTJhrnH93lL+fJ2mula99No/FGYKapWwVYauruWXZaYM/BDKLlhenwXmEQKouTx
 wFyn4JBYxnvOx8MOGGKH86j8GJ5WKxCMMJ5RnHC3+qiN7JJk99R9moY7wLbiHUc/8Ff1MQPILW7
 5QTYaMZjkeBUtt/pJrC91cgEHcTIIkVKvEvBjIsPbJ7ZNY7jftW1OyWYa47mNUc0b+dWRFRDUHk
 gE5PWH14gRDqHhukhJA==
X-Proofpoint-ORIG-GUID: 2MhFlNJKy09t9ts4H8eyEjEZVW2F39c9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfXyz+QzdKtpAS6
 Wem3ZbNHAboMrj5llc6SxFmMVt6REoIwQE+lJiriCd1GU3ikxPM5NRL8/y6GlFM1IGukgTMf2rs
 z8KvWxmZFPx34Wv1/JE02OBu/5JHnEQ=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae493a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=LUNL1vnY_D6g04zkfocA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300051

On 10/29/26 5:14 PM, Xilin Wu wrote:
> The Iris VPU on SC8280XP can issue memory transactions using stream ID
> 0x2a07. With only the 0x2a00 SID described in the IOMMU list, those
> transactions are not attached to the Iris IOMMU domain and can trigger a
> non-secure SMMU global fault during video decode.
> 
> This was observed while decoding H.264, where the faulting address fell
> inside a DPB buffer mapped for the Iris device.
> 
> Add the missing 0x2a07 stream ID so both Iris access paths are mapped by
> the SMMU.
> 
> Note that the issue was observed using Gen2 HFI firmware.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Any chance you're running into this?

https://lore.kernel.org/linux-arm-msm/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/

Konrad
