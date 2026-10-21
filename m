Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572237;
	b=UfQICPPj7602Jsq5DFgr8XDl9rbW7NQV6re02WnP6QLtoLYrkltyu/jkKD9xz7a9zGYL
	 TWRoDzqTIkvaGGfqjkJRs1mZ7KDU5otBB4j3DcoGFfKsR2WFP/yRY3+DNbmkRxvTxaXJK
	 PH/qgOAvhYSw4T5/1TzT0Q86tS8rXd0fUzEH6o0lUICtk2lwFJo2RhWcVYEvBdUHPe5Jy
	 kfUtKI0TMARTwb0q94FuUXZ6nA/XkfR6tC01MwBZbP4kanC2YxuE/P9DsLv+MHBpYs+TU
	 KuoIoI6eDCPNejT+XaTH1BsNae81sIF9tEenYeSDS0pi4E5oI59eNys5b+7Zs+N9wxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572237;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sIzv+OVRF10962nsg6GhGljzRZ3rl013V2T6GKgjf4Y=;
	b=43eO8ib68SoD1fzB8Qhp055pVQv1osoC8s5K9D7iAkHCUYC378H7VqdElTFot7xi/aZL
	 rmYt13LvNKGMhEVX7lFfTuJ/Xe4CKhk1ul6b9TfGPXcOBrddnesPUpjjGssMnM+WlSI2O
	 sMH4n0+l/kvm6LzPNXV0s/wvvZxO1O1DnOvEzaDkcK8icwlUb4fYzEnGrYKEEIH47gwIB
	 MdOxcYHl1a83iFEX8vnPPCkwVX8/432l42sTzTDlqXcljECDmIcD4oqPAKn1QIwCNnSml
	 JdcEoIIhiY6y1qbD+st7VHRE/AdhoFgPP7IIxz2tZWDlhWyOzDx0/WKfTtthJOjZlJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFeyapOX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWryMSqz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DB8606A328
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DB8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFeyapOX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWryMSqz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8a1Q8069912
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIzv+OVRF10962nsg6GhGljzRZ3rl013V2T6GKgjf4Y=; b=YFeyapOXeANzacnB
	szxZleI6tSL08EA4Qqe6SA4H9Qdi9M3gPWiGhCerNVfs8RWmEBq6lbjmPxXbdgpG
	YSAHIYgWfJHpP36f6PsJ1rbbx6/5Ssjz0ms8xIoZXbau1+/wo42WyuoT3OjrjWP9
	9VpHnKbciMtFeGqM+2RACKtv4BO9jmVnVSdjhkFxcuaRf1QS0ZfTM2gjg+TNYI+Q
	SYFzOqqjZiLgMNMrTVj4GNLEDcnw+zD3fkJDnHTRuV4aAliTWXP8lcJEcZhTq7xJ
	yoBxyidb8SyRylC6Rv36g9SyrJyv6u+ja6894uQFNCT0djALRqrDzv9uzRq62aNx
	zjUxUA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2339-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:43:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179ef12a03so2794036d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572228; x=1793177028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIzv+OVRF10962nsg6GhGljzRZ3rl013V2T6GKgjf4Y=;
        b=JWryMSqzkgixv0Ipbd3JjPKPiMv8sWC3/09FnP8yIj5KDxoUlfKSkzEEA4iiH3JJih
         nhgalPUa2g4Ixmq0RPSbBd7jd6r3afc4lcsMCjrATxMwnCUN4wKogVZJDwxbTElVkejQ
         e/ABBCuUZ+lB6H/ltIoj+K5xWeZ7tj6vuURthMCx5NCL58uR5n2yBDYNBnVbVXVqgcpW
         G5imxGMapYNbi7LZakAzc9y3zgijb6BcQmGLVK9JPv1mOlNxpgE8kT6Pe92FviJKl/lP
         s87PwNB5TxUMrSluhZ0kuVF0EDl7E/Ny5U4fvA4RHFBNoMAXJXU0PgV/lsoTNAjwccWb
         1MIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572228; x=1793177028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIzv+OVRF10962nsg6GhGljzRZ3rl013V2T6GKgjf4Y=;
        b=0j2dDZ2gZVXn1w0u77ZR63QeQ1hGfOzyCcGbj0+YRF1W/yLI9uLzJF/AztOkJorXme
         mqDfELvPf4sswy3FKIeAJZYY19/LRF+Drrna30CriJlteNLHII06i5t3TKYYYFen6RD1
         SX1dV8rGV916VgwLEcXkIzuKRljB7JN7Fp9z2ZzakDVXtAyovM/FH7Gtizd0mlk19PKW
         +2xXuhxqeIbQvmw72o16Q8Fz4TU/YRMRlYtSVClJxPUEonRgnJFxFY67SHlL3gfVGGkz
         bYibkIui1p0d5j8N8uqRbKkfJSKNE260ofjaef2IGXK7A4J9zTqQxy+ARKFSVPXH9oJ+
         ZaRQ==
X-Gm-Message-State: AFq9FYLA0igzkdSsUd+NSAj17s83kgYtbksfojb7t7TliAUMH4GSSngq
	KEJkQCeNYtvXqa8rXzBPYJZvR8qeJMidc53nUirQMv3qxu0ki8sIc4Hawd6EwGZEXC7z+sEGKYg
	jIigC9lDxGdA7noVVr5dsuLznrS7G9QeOalqCMTtcnCnNa8gdbaEMQWswccgxymcFbA45
X-Gm-Gg: AYBFou1CG+cgOKNUj4YL4MpQ/LCIERwWRki+zAfcmqaRgdQ9urvSnTWE5QGg6CVALMQ
	w2jxddwFk9yfQMSd65s90hW1cUtFGOu9avB4/VdOrxyp1SfKwROppaEvJR4lJb+KQuJPE0iCkW5
	sqZ0GMRdS/3o+phyDnr87CanjsRfiffMgZeV0QdafEnSoUP7DF06AhRyFQTkAl2B0ZGGmmnCtD7
	l5VDkVNlfFmgZZtifFL9beymD5c9A0SyE/+0BLRR37wvRPNsa4nbEKgAH/31iNDmFPB4ILXM/GM
	54VBGBO3iOGcvBTXhokJI1Sdf6CvHfqhS65A/J396Hams8VgucUr5xE3pSCcwGB+lKrW6aFJQ88
	7m3ew+v30v1EtQJk/Se0rEg==
X-Received: by 2002:a05:622a:a884:b0:531:2663:2cd with SMTP id d75a77b69052e-536a75ce176mr415821cf.1.1792572228187;
        Wed, 21 Oct 2026 01:43:48 -0700 (PDT)
X-Received: by 2002:a05:622a:a884:b0:531:2663:2cd with SMTP id d75a77b69052e-536a75ce176mr415691cf.1.1792572227794;
        Wed, 21 Oct 2026 01:43:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c467900686dsm52393866b.74.2026.10.21.01.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:43:46 -0700 (PDT)
Message-ID: <72009e19-fe51-4340-9378-46eedd71f151@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:43:44 +0200
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
Subject: Re: [PATCH 10/12] drm/msm/a8xx: Switch to generated nonctx regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-11-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204728.28844-11-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad87b46 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Uo0wf__DB8OGiezfqlwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: aGjv-qhxEXeOWec7xeluUn5oH_Zc3mP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX37RtqPM+QQla
 0ykCYF0ZsprucINGzrdyw871IzgIB9gfMuYgCD/T7aLTI6BRvpOdPMhusaM2jlQS6a+AFtOOXm1
 5iwZW9C1xQ4XCbonZ3UtArugbD4BdBoBxS8j9jYx4WgKyKTzZBKIUdTNkkDocM/HVwRextCRscz
 dvxR7FHk4NVqUpd+pXx3Dn2+Bvo4KL15KOJaFo7g9hHnkW+RdziV8uiUC8BqwOQxvki+sRA31Yb
 8Xb7peAkZ48UOCHK/87KeZEwlMISyh4dGDEuWrq9kCdnc8b2aq7R4KIuQ4PVz6PMkZ+vitNT1vK
 sSCvwLkm+FRZIVqL27bttBMW8UdXUEaeZCstDesKPjIEJeTonHi+47T8tqh9YxO/mVRRaY5b++J
 mCj7hgDg8oYXXEFb05QvGK8ACzlyom7jEKw0tMBJmGorEPs5mNo8SoLvJHKO7BXzy+FQ2n/g9zu
 IAY9cUYCRIt/lRBxklA==
X-Proofpoint-GUID: aGjv-qhxEXeOWec7xeluUn5oH_Zc3mP9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX2o3nQfApxlQl
 9kLa/ZgLe/vLgY2d1I2GfGWpvf6qnHCH69yskSi8VhUoqGoUeFzxjPuItvMQeRjB4cetNWmKhM8
 AKu7cZyoG7eWOAs8OUR1Q+OX0wTZYME=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/20/26 10:46 PM, Rob Clark wrote:
> The generated headers contain the current (at time of generation) hw
> recommended values.  Using these directly makes it easier to stay up
> to date.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
