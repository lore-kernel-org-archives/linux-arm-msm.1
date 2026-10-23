Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751098;
	b=5obflp3Yax2IQYtdr8eryBQT5e6j6TU79OpdZojmXeX8vgqUom0P0YchxF4DjdJQ9hwE
	 SgGKBDkqFuYYACZZ9ENrk2vFRp24nuoLI0/AUtJvaKKIhyYQXMNdncYlQgqmsLNCgYcKz
	 WSq1CEX4H4xRtrq6IIIan7mAuPUKipM1mvdL9q1stOEkSwXr69NmdTJnT7Ac3wAPUK5Yc
	 2r0IPFaQKUmeLfLp8hNaaHILCeMa63kB82ajwGKtZSuq5aOYysqp40co6zXnNhnXEdqkK
	 gCDTQkHU3/yjAx0Fjbk1oOTm5LJX4TYHS89FPHVv5jhjHVo1fUFuRHE0FBEq2aV0ILQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=;
	b=KFuJYhLSrvv8mOTOX+AfWaS18rapEEl6QC3uuDian/2XeDz67JqB8aFhuClNGk8+2KzX
	 4OJhAAYleDQl+PEPmPjSKeVkirV+VfWi4Shs8nNEEWAqlzbZGW9XrGeWltaI4gNCwgMZy
	 H3P6XF/yJtHZ7gypW0hwGbeTa6GslSO9PEnDaypeG7tJ5uvvEU5boc/PWj3d5f3I8ATCl
	 hTYI4BQZ/M1izU7JBH/nvhTvmiz8TAKF5zxawIu+BBORuNFlu5iy5blu0YBSLRIeY2Waw
	 w4e14xGVFmeMfvNTQ60Z1VQAgLjXUpHYwK9zwsjqbvjMol2X6bZkzQGK9jw3waEG5aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bTUuZtHO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OmA8qeZp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E635F606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E635F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bTUuZtHO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OmA8qeZp
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAY1f980626
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=; b=bTUuZtHO9M0g+BSr
	G5I5Vs1nJcoQXL6/nL9gEGFKEcdTkN8+9AJkuDD/AL9NE6zVEftceZebyzrzjDV0
	CZHNWNwRdz9wKQIY7Usn+KElNRC3wR0hzHNKLCYiVx7BwPoJz3QyAPPAwj1D0Dsy
	Oem136dReW1uXyHbBxuco0022N+Nquycx67AJG7cLZI+Ah11DTpS1FZZKzil5qil
	JBtrRIiPqedM89aW4F2gux7W7deTC4dR4jwwRiyGU8z4Lrncs4eAT5HlNfakId8Y
	wxiBknlCjijP3xtnzX0uVMPfovSwbfFFDTNMvJaQqSnzfINiU2uSC/f1DXoL/zd7
	A6lwfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmatp7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:24:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so12160085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751096; x=1793355896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=;
        b=OmA8qeZpW9NBuSD3La8dOUKOOTLN/NHVqOAsiQirQ5GZMJ2X5yJaA73AoqX9cnH4UY
         +MOGyNT/pNAdQvIBv9ZCFm8q7m/R/yEoeyAVQiHXFXa9QysnDwkTi6w0FrHD9YeonePT
         i0qIClY/YtzWtLYRET2yQkWhmoBvTZr8l19jYSZaHVdS3a/nZgIX1uSbY7qoeV8r+tI7
         5nqAtABizWV8Suv6Sm/QYYiv7gRkbrE8kTKjPhws9ymiJzuoTAnO10Ho21rVznfEpZI/
         BEyObOW+Jr+2wPbClz1mCRHBH3tcA0p65bk6aS5tFYACXoO2c2EGnSqdF0J+7YCBsfFV
         2xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751096; x=1793355896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=;
        b=Opbysi1WumUHux/AFno8LR6pdpTBCYsDxyS6g6IlcN+FKoSvFnkovQgZCEaQ4wf6YA
         vV/w8DjsrtDkL/3fwFjlRg4oDmvVWCZpy0WC+rLZLghG+yPL5WKVi9hr0V0kCNd4e7ki
         3rsmV84VeJM8WmBYJTj119216eV8HbQvkBlig4XOcbBJolIhTO/aNhFPodoYVT+VYbGo
         SnRmi46HQnADNem0ZgpbVQSxHk9eY4cAEjuMtm2fjZdpWPLbGqdDm3lLTNL6iqHL0YJI
         l4VJpQjfSSdbU6ElxrNo+jGcLsuTT5zDTdZsMPb8PGt85V8BGaGA1OtHthbAnnXFczYo
         qr1A==
X-Gm-Message-State: AFq9FYLsdR1/s5146acR3h9yPf9eoWlxNgG0sHCRjjr/20pugOc9P4Ih
	ww0Voy14Tg9oKvil0voddVglosRp7mfSsm7JuV+sx6n4iovSDGKZyXkgEvBjdRI6mvdbWNV9lQk
	v9qZV9Ao/eR3XTqqM59zinZh4qK7e9KwwP+uVRcFctI/JP/WxCV0jXQ7elRxFbm0C5aR9
X-Gm-Gg: AYBFou03cDWY1zz7zZuI2HGD6mW1kfsdieUNSRixn9XXatdkDTMLlH63MqZXQpRFYMK
	8Q/yHuowWlGj0WSTwHvpk5iYPuUlqB5/2c4nO1aE0if6xNkSk32PeihNLMFhFrfDPbTUsnGivlt
	GFX8Xv9HAwtsE4uebatj7dP+A7qXoleSUPs4X93U85ZnOFmFRxIzZNtIkOfWvw/woXemqlh1V9J
	hp5VKlvlaL+QtGvJFwXarnpfGzdqLbJzVEsT+S3R410fvmOUVPWE3XnqcnB5/ZI0H7cN9eDx90w
	uzccN6IaV53f0wNrYJq9xEpV2pEOpCxcO8wf+xQyYPBw8si6VCT/XbmpHH05a1f5DSRu0cSh5g5
	q9HrGbb/37z4e55niYRe4WQ==
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr305995085a.5.1792751096009;
        Fri, 23 Oct 2026 03:24:56 -0700 (PDT)
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr305991785a.5.1792751095492;
        Fri, 23 Oct 2026 03:24:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b07f4977sm34567266b.31.2026.10.23.03.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:24:54 -0700 (PDT)
Message-ID: <2755bde3-a969-4ec2-9106-38eb1a69f43a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:24:50 +0200
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
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB
 headset and Type-C accessory mode
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-4-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-4-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb35f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vVu4xHXG5oYAYlB2ed4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfXy3bAOwTwPPXs
 MeAMoSkc9fB+WPzkS/NHBT8Rehjb51Rgr8z48dtRGt3vnesL5/kv8WKzUPX1BaHeWanbjaTn5fY
 r5dMfv1XBe8F4D654AHTqm1SkYGYn+M=
X-Proofpoint-GUID: 19ko9-k81W6XrbwyNpzJe6VKHy9ySVkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfXyBgjUyeJaik5
 wO4jAqdRe+1rBy8cr0O3JzorSiYSDv7ZhxLKVc8KlMVES8MnigxNHie8LN+zo2YYg6p9u6om26o
 Nj70ujJOXcEgreClHnps08or1O1AoHByaXYye2zFVtGtI7yVujs+bnIA4Dl9QJ2MgNNgrxWw5Oj
 aeUBYBk5ZOCK+CdGH7rVWBOTqG9Y6QOdragfrjDlgsA+EEQr11CONbXb3N1EPjy+G3O60Cx9Rv+
 aV6F0AfuXBXR160mZJOsR4n6a9S18USA7tskJaejxxKq1ZRFw4hDTXkr9SI64rb16OnvP9Y3q40
 i8zGKCW3O0woBbZGfHGaSRfp+52IhGr4QOp2UViB7/EJlSii88kkB74zN7WT0j4psMy675kA3Io
 0uzb1qSrHs7Q1tdN8/hrt3N0X72u22e4fdsUa3CPXTdcinukQPAcpWKAgAT+g2Q3TkC+EcFOLAr
 txsEGB24GSK5kiQVpcw==
X-Proofpoint-ORIG-GUID: 19ko9-k81W6XrbwyNpzJe6VKHy9ySVkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> MTP does not have audio jack connected and relies on USB mux (WCD9395).
> Add necessary nodes for proper audio headset support along with USB
> Type-C accessory mode and orientation.
> 
> Set the I2C bus clock frequency to 100 kHz for the WCD9395 USBSS mux.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
