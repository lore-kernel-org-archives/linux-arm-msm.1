Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B418C46AEFE
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934448; cv=none; b=UZ91tf6hgOiwZL59ZcWVhluhhrH2B95AJaxIox+c0iQih3l06JxV9S+cGeVQqpSihsqT6LLCjEjkZsYwy3xiXhZAtziQbfTwPOGG96M4SxRM27jmcomcFmrIE+98SXSWc6neXSmQkMm6VfNu7aWgLLux2a5nqELk0cnMKkERkYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934448; c=relaxed/simple;
	bh=DsPF8SjSUErETsimgL0ZJd6+a6VSJ+qHd0qfvNgOCUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULAx4rX95Ss81CoQTBBk8kbRxhbIkklCmMfN3CUN/hKQKYs//jcwb3Lu1IaCtuRV8ChmuBMnMyvZQCKvxLtYWM0CUwpb7SCcyQ6hY1/TeMVSc7eLTHs/+r9LQwc3wYH1DZaWX3zeYN0fHRzwa1ZLf8XBVhRGE1cUxoRX1NhyxXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSQiGAtW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmejdOh2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSQiGAtW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmejdOh2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j9bd1543458
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 09:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I6NWwoC36/rmexB8/5T2wdYS
	MyIqsDLRTt1zm46ISPk=; b=pSQiGAtWzBgHX7+Rz7qbSXiF6oedADOO65I+vX6s
	5IQQoPtnfjb+qb2/ouhGrYqvyTMRC8n4dYtC4OkqDHQLnmzVA+P5TuBKAfm1+A2N
	jZ3AxmfcQwkIW+/nmgFZTwezHNaY5y9SSobx9dSMKfJketPhRs8WNJ/aa9Zq/Rkw
	jhUh4WlJ50+6PV1HVCnDY8975R8k5Du4DEq6MGRJc3XTVDVg0EUcoXzaKS9EG2sy
	3VHnQasySB33+q3ofPPVW8FC4NmWF9RRbP3UfoEzUic4Fm1R1Kk4JmwdTedls4xD
	eSxR6tkCfAjiFWGcjONqZPdm+o/eNTTc3xOATuIqAymLpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mryw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 09:47:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso416039285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 02:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934444; x=1791539244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6NWwoC36/rmexB8/5T2wdYSMyIqsDLRTt1zm46ISPk=;
        b=ZmejdOh2eKU7fm9DmkLmU4O2vLqNNp/hxOkSyRHJy9IAXBNVD59C71FY9GHWkiXIoc
         4oZjwtMZHAbBfLi6mcQoR960MZiVRIDS+ALTZfiusAT7wwXpmJJMFzQglYVvHli7Dspz
         k6RPM2/tBR1BDa9GYjO3h3ttvNax7ocvSRQIl/bO7fkI/tudSz1ZIm3wmyaHILBDXWSK
         n9yc8/Foo0Nw2o7m7VOrKZEjLGxZLq6Bg1BGQafCBhj5WTviYKQW88RQbdaKlk74g57q
         aktgdqn4Z4Wv/zh1zYnVXG9umCJIRXYnyhxgvCtCL6upsfrGHmOaYsxN7GY1aKIV0VCb
         rGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934444; x=1791539244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6NWwoC36/rmexB8/5T2wdYSMyIqsDLRTt1zm46ISPk=;
        b=cGHrJa7a0O75g10rFu5yqKytsHfgovcSJ/HLFSc32jc/lhdPqMfsIXyZthFuVc82p3
         IPkut4eG+3NGclV8vrC3SUgYoy1J86TST9oO27VDLHW/tzu6qJQiu4OOyg64H3cnlSsv
         3bNMaKLW8oAq/dhyDqvBQhhrnmQaF+CkFm6VubCzNJQU4laAA2/hpdBnfOJvO7obP+/9
         GeWv/IX6/2vlnr39bPqkFzxra7LYnZzVThSWZYb8qiVy+NF+tfZqs0VVtOMRF+UzQYlU
         fQiJ1U2VghMZ111EFIXY3rH20vPorfBUi6NcBAGvzk1T1GSCYREDbTKc/lrlHIcpim1p
         HHnw==
X-Forwarded-Encrypted: i=1; AKwUvBz+MyFwLIUq8QhPX6KEOXXD8WRDT8xapB4J9Ph136DVUvuVUW1AD0XzG2CTY3MZgNSOdXyvu98yyQfxT7Xi@vger.kernel.org
X-Gm-Message-State: AFuF++kcikTSU8l/7GrE8x0SIWE7utXFhT2yCsBzqCiDCyoJWLP35BvF
	ypEQHcllj3BawPVwBXtZF1S2A5wHEr+FIauZ75fNyQTIYMBVV9BitWGaqCO675+czrsubmi/V/6
	42F1aTk64uuMUgjcE2/VfiC9sB7u8mmX3URWzPfr9krz1d6OMcu5tt2fBhhLIOA8gXQhC
X-Gm-Gg: AYBFou1dL5R32xtB1/e37+7+QpEvxjy3DzAetLkRzeNPwO8Zu3bEhAEa/+YUYuX5nys
	sANhwH1pm13vg2pHIDPR2Hh4zq3ZwFvbHwWX+gdQBKVIAVbhynyiaJO+4PPtYehZTS8ud7uFDcQ
	fBenmlPezgRYPOJytSLJX1Hom8dPa9NrQTM0rQwjl7aKcJSOSAHQ2eDPXRySRA2ZHCRre4jJ35b
	gIQoXXo4ACC89RmOwSdTUb+9DwlviggaYqUaGQ+Yj5ZJMSwAjtuD+p0sd0UdWiwJ7AHyajItpSk
	pUGdklQpBFc30M/cvY34KOQV5ocFhkhR7wgwUTd79mTTnCMQ/72RQRC7m68/kghk4eKDQYO4dwz
	pFsUOEIYrcdv9Z0c=
X-Received: by 2002:a05:620a:4442:b0:93c:7861:675 with SMTP id af79cd13be357-93cb5649031mr1092331085a.1.1790934443818;
        Fri, 02 Oct 2026 02:47:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4442:b0:93c:7861:675 with SMTP id af79cd13be357-93cb5649031mr1092327085a.1.1790934443206;
        Fri, 02 Oct 2026 02:47:23 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280dc6e7sm85350485e9.15.2026.10.02.02.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:47:22 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:47:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650: Add watchdog node
Message-ID: <kcnbtr26pgehhtnnfd3xrasnwer432pqaqllf6jggyk3ckhwed@l5q4pggyqv4l>
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX2zAtOAUfrZtS
 Pshx9DMZVnaThaqQ6s06dj+8OwRGybjGr56aKhRoxzRj/E2mfhuRh4WMZQdYQEkihxa4tEqB/4F
 l4GBR+A9E2wfXVdUZkrj3yN8eheax60=
X-Proofpoint-ORIG-GUID: e6fQxeK1CWj7svhbudRsUljG-ZSHwjh5
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf7dac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1I-uu_GJYuiuqpjYtLYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: e6fQxeK1CWj7svhbudRsUljG-ZSHwjh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX78l7334iecjL
 HyAuvP2vcbxChOc3Mnl4mlDxXNK09asFGG/z/giZOnUunQRrEk7LxWOr511CDxNqRrlKCPlES1W
 msYL/2xKtH/as9pw2a9TY3vkAPjbKFSlnuDaS538RaxBlYjN2W/fDzzajdMjVw/Bj7eje/LqrMp
 Hdd9qkFMQCa2FsBqPvG942AxOGYzpBQ3YGw0iv2biom62A2qrBkV/Pi9rf9QccBBlPrcueg2ZWx
 i1UENKQUZhXBYpxwUdk2+vkOCmNEY6zFegcYbzhVPWFMwqyT2DFfJfkgCfniGdPG16WZ4IHbzuL
 AZ95tQWKB1FiZAm+B6wkQvzx6X9K/sRvnDe45P6OnGWEGgeGhlQlqlIVHjz22smlfjYjrN22BmC
 5ug1gZ3ZiZXeE5XP0PshTd6JPSURuMnm+8EQK4gNOlcfenmmJW8JVasUdpXqiFFaiyZqpcWgR3r
 ooxFkfTT0Q63nvq+A7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020038

On 26-10-02 11:45:29, Neil Armstrong wrote:
> Add a node for the watchdog on the SM8650 SoC, the node
> is marked as reserved since on most platforms the Watchdog
> is owned by the Gunyah Hypervisor.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
