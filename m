Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751121;
	b=ykht6EgwyznwuIlqZmBh0j/EbtKHROBPumdxSt6tlqSNHODy74UChjuL+U35FS9pkB4f
	 oZCwNsfwLPxJEXp7lVs2WI4r5IJenmx0AAf4AkXof+9LvefIb2WFs/nSi3CTFc+4b/WN1
	 BVdWny9Q6IAiSf7NAWKlNK4gINHJq8i9p3TW706O7grhSc58Hx6g0com5A0VG3oRZfQrh
	 X6M0KNRhggEai2pm4TEWt6kxCzaqW9d0WNczBfcZ0lBf/66KDANQGHsKH7Qv5BDYg0kCh
	 WAY4I6bf5YDukOOnbLMXztfqRC5rv0uR8uRewM8IB/6Hhb3MjpyBsb9Hfto9nSoxZxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=;
	b=VKW6N4rrfRVcFyBvm5Xdk6DrUo/6gOcENN7Y6bW0/8bzrelxEthJT5npY0BAMP79uKmN
	 9nhQR+LqXXY1TWBCCFmCCdAhOX8FrHZSlJucxYYfuRVUeVGgYweSKzn+kyhSs+Ce8xX4i
	 1TCKO9alfPJLtz2q5kQZCor7oAH2e6oNH4so8yHf2xRLwWXcjtH81HwXnhYONyxOnsa3t
	 bbQnmng72RKItzRPQn0ldFmoY80s6Q+qPb/5Yl/Am3Hn/t9X7eqRxfGR9G0/wJ29yz/wh
	 apFm0XDggn0wkP20iHfzvjLHNT9rriIrvJ+jP4TXE/WLhbNfTcN7FxacbLscUobB/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpYHy6MC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcULbrz1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9434D606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9434D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpYHy6MC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcULbrz1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUva2164238
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=; b=TpYHy6MCctn9gNuY
	VAkWRlMdiqbyn97oXIGrk0laU1sQQ6PjxLhpsNojq3+HaqLZNal7MyUye8mWWDB4
	qtqxlLEz14HFLBTK+VHf+UlopRyB8qW97mQnEZCcWM0B8HNGNQFJiOKEC+76Jvp4
	zSHPQBJVoIU8y0B2ojIFzoo9Vyrd6fttN8ARGPEMpR2OdquTd+coUfzQ2CIalykD
	S1JQ+vShGttxC7p9eWi225C8d6S/2PG6a423RsPLFpHg/AkOy8qCtgCsqimgPl4l
	yCE2my6jf+jSOHZ8XBu0HPxpwYqlZqsV6fqMSPpuqFJfhqhIae31I9l1j8L5M6sY
	v+ooyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahunfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:25:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so15480685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751119; x=1793355919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=;
        b=TcULbrz1Fqpt9APF5L7O4jqeb9NP3npZXU0XHPizUC+nqfQf0S/F+ZbksbMLTDcedH
         8TNQQHOI8RDtZLPQOtFeb22KO9isIUCGQETtQnAlFA0eMr8NnpCydIDNNGqIyURFAl0J
         tBi5MuP2VBDY3jGVVGL2q9/esOBUxszispxVMXR128NEm6uPuHCqWpdpNPnBsrAF+L+G
         JARDaP011AOBgMzZ9Bp9Yef0C9PbogZRGdel+hYt5Pxy1bIn8AyLBV/AZMrFvUwwAGWs
         brusRhDpVEa/z+p70ozt0WvNgPWiOCob8PIxyN+mKOniN7/Kgdgmx27SHoh8U18D3+LC
         sruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751119; x=1793355919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=;
        b=WhIi9QXZdfhlpMRvp9Gg3r70SQkD8ENv8IWWnNwM4VN10BvDs2dfE6yUOnP/48zMe5
         ZVGbNN/PJ5a3PiHLkE7MFTqrw5QLsnKy6QyMy6aZ2Swz9tEcTvs3zobjiTnLzSrXjeM4
         +LVA+0qRYqJVhJyOjTILvyUSNSjNctrmii1h0iD66gH7WwYUy41UUx3v39bfcWzbUgmb
         mEIs79BMyJOjzGtBCkhgciqjof3U7+LVTtmhYXvCSJ12CtQM7rtSe7suV+XaYVGuqoKy
         Mtg43P6E2VIw1i3StQEdiOD2NOoNFcAx1wcgxdlyEypdLSNeF9cZ5PsIdBTS094ZrkQZ
         RyFw==
X-Gm-Message-State: AFq9FYLWBj5rNCHWZ+9wwV9I3zWYbbI1ti9fAc8LUoxlMwsv/AA0a/yY
	+9VYKJBFKIPQKkZbJzU6+RETpfFPbf7OJ+0axct7J87cIqV7t6XpOfiQK1+djLOOcEKdGDdBY7r
	iPVIEzB4++CDPCoMrLTYbT7qNOLz3QxNiVL4GsJS4AZFFBwsLtkL8AuoawnhERM6rpdmN
X-Gm-Gg: AYBFou0bqR2Mlvykm3HpEXlF3CZ9CXvw/5FwzNCBzyedCy8qCl0xta7neFCOmktGG4K
	84nq50fz0uKsDbVCW4cth5ieBMS5Gi8/TLITURqfA2Ctz5qSb6Dw1mhM1Wx04bPllTz5+U0AfEj
	kuzgKYrI20VKaqH5VRtt5T9I0aSS7EK5uHgUBeIRWFRspYF878FJ3qBUKuO5rR4/iRDcRAxLWId
	+GNz/90d51BAKwWc+RgAJ8ZT0hyCkci0Ssj7DluC3qX9H3c0Q/aiebzX8A1aVh94Qza7P8fVztl
	hLkN4tog9F/oVjB4LzDbgTl7GpyuOvrHYK8d/wbPL5+li1X23BPJZnFqOUFmU+AYioCAdoeN041
	TMmokMZ0ERv2OHsFcNjC/VA==
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr340746185a.0.1792751118794;
        Fri, 23 Oct 2026 03:25:18 -0700 (PDT)
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr340742385a.0.1792751118280;
        Fri, 23 Oct 2026 03:25:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5d181a2sm85208466b.87.2026.10.23.03.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:25:17 -0700 (PDT)
Message-ID: <735b7f7c-b8ab-42c4-ae84-9172804496d5@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:25:10 +0200
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
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
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
 <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX/OPbt0Ks3WtD
 tb2gHTnynVdLswhZQ6Gfd//EEUgxHxc5DcSimEFVRzcmryvJn3yvutIJChthQ99FRX8KSF9xpiO
 Qwc5RCHyGUNDjZbvACUsO7zbjzFEa4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX2uJvOoZlSfOe
 xl3NFTRjrNd9QVP+d6LCWxoJOyyshQHMkChWajgP1PUnOpTw9HGbvE5v/4vqv/dFyjZIuif2QHa
 HgXCt4mxoWPTrtEo9ZAD0gNDbUiWalpCDp5fJh3DuEueIAZVd4rR6T+nU70h4Ir7/LaBYGMA+hk
 Ioq5kxOksP3jTBZteMscqzqij9TeXvYd7vE8aJ+0XknrD6N8/63a9nzdtt0LIkA8Xr3kMlLte+K
 qVTFT0h8TntAanMoswLJa0SQ8SQJhXRTDqyjvyfhBXzqmrGc/ApiGWNprhkPCrFjm/rp/l9MWiE
 YYtlXbew/JpUdVgXIHAnlRKJ5REgt8zLNSPGNIVyPY3rbL4hGPywhzmkJXVOBKNzAt4urmR5TJi
 cE79eVCk7gxnw9ZlMQRyNKlZ/vV3OyoA3tOh65v1c2UIqJnsZHkt6uonNP+Mxh36LBi5DLdK/bY
 9q4jscNjJF9J4Qx0q0w==
X-Proofpoint-GUID: jNCNIrwMXDtPEv7tAhtgpqLL6g25Dmyh
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb360f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=S65zN7q3fX_PurGuIfIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jNCNIrwMXDtPEv7tAhtgpqLL6g25Dmyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> Add the DisplayPort controller node, including its OPP table,
> controller clocks and power domain.
> 
> Connect the controller to the DPU and USB/DP QMP PHY, and enable
> mode switching on the PHY for DisplayPort altmode.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
