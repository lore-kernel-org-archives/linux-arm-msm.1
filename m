Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992BC30146C
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466684; cv=none; b=An4ccJbVtMc/Z2XNeQcgR6UipvEOkV0UOiFGUq2qUkCLz3oA+bDpzE2mAfv6+/rABbDtasC5upap3WTADzV8kHFSjt48o3pkIL1HdkP+2ICcYBTGRtgD0i+bRUzAhL5rH35Bn/5OUUN/vINP0TplmGuexTYEql/PF++y4NsXYNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466684; c=relaxed/simple;
	bh=PteV6l7Bxzq94VN1jmz5vOgiHEW3TRNyd88pisBgOaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkSdx1/iQb5t0hfG0HUa230+PRjUzlf0yfdDhVug6tMAbqjt2IiDIAlq5iWRi9Sbqv6N+wxH/EnTFzgbH21XPovABEAl5eIbKAYtBcROt/IqfJCk9jBUWen7Ct+xiCMCYcmLy3klt1bwlurjJXoQ33XOgSWaibQWKzruYLFOgdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+emWJZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FC8yOSkW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+emWJZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FC8yOSkW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hBUn3217667
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UleAVLVAdU/hmYZIAkmupw03
	vXUyan1+fZkjxbM+C1k=; b=a+emWJZZZBJHcidphzH6jbNdZLftPgClo+zVssSm
	3+sWgL9KSYkWpLjtn8e+T9N9u8t0t9nJsdlhD89oP3bhssWnRWJge96ajaQeowrT
	kwP71zhZso8gAgcjU941hy4hBARBVAVnUsEfIzomg3rljaeg0GO+sEk2L+wP6TmI
	tqtxhqm9mOEVmbwuJ681LLqktYeIRPUgmDzywwMavvQRoYuXzRYdrv4CRvoXp5kT
	DtjWFWWK3KcxB2Trxnf0C+VmXPP2WTczwdNeg1JSkYOVs4MqyMm+BStJ3eBobJoM
	fGlXiS6zx1TOyMB51AWLqm5MDB8QzIRnu7qaaUXM7RzRmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2g9w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:04:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0b66ecd9so350675285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 03:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466677; x=1790071477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UleAVLVAdU/hmYZIAkmupw03vXUyan1+fZkjxbM+C1k=;
        b=FC8yOSkWVpqml5R5Hs1MiB5zf9/63niX+/DiwM+RIvc6/6dBw0U8JMsOuwq1tHebzE
         0uLBr/pwu02c+KxIkRu3mumn6XhSDnE+514Q2FK1kx1n6tlyxxX1EKj1APBrsjub2GFa
         lHL0ENpsFoX9VLb/6SAEAsex5u80qmeCaf0eKNln2exs6UIyYFzWAjZ4DX9C3zYec2cO
         fLAYj2PZz4IDVRPVgstaK+aGNjMUP73tbsrNPSlxSb0q7A4PlCtKAszvfSZL9ET0WQQv
         8vuyBJmECkxQ0a4SqK4nKNcX4AJjFAy78XQ5WW+szNBD8tgLVoP4Cl/utZpfiXByVQbZ
         c5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466677; x=1790071477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UleAVLVAdU/hmYZIAkmupw03vXUyan1+fZkjxbM+C1k=;
        b=msyHQU4m1Wq7Lz6BNd2M+c6vczvIvretX7k/CpyAnjaPmaB26T14RpOavl7dVp761a
         OE+7Gw9v3Qe/sJN+PSDsFtPqdq5r1836QCdgFGidfQz8m3AXbymNHj4q/opFAlcsgyQX
         FnTJJMuLrR8kn/43tUrofJ16jFjDaaXq3i7IC6UfmGjJ6Bf2FcFxJydmzlKs4Y6iRDa3
         eC8orJ29Mh+mKiHLKAl91kO/NI3yL4NMmD7SNJMmvferkW5syzEBSHNPp0OXZHOchipu
         GSRoiDkpcacYw0ahi7XBdzhwwpdBXc24yEyqUTpYkium8/Ilk+aLGzY8lAYeinVBde5j
         Eadw==
X-Forwarded-Encrypted: i=1; AKwUvBybJT87u76BtnIlZnqWrQpk9QXSXxZzKhQwdQTrVyJdBwlERVVTdXBsJd3nkJVRA94xzRs8satw7P19XEoE@vger.kernel.org
X-Gm-Message-State: AFuF++mWRvsadZcg5qosa35xp0rg8zUVq2Wwdxgi2ZHIzY+AjW/Ib9nk
	zzIGj5zfC4/Tp/N8K6eOnexu8uNZ22Z+JNdT4Jng3tUeYzisnS3pSDr8q+6g6lFEitU0zQO08bq
	98HOEIk7iLxTlvSmjNnovecKI7PveuYIqKB1LRNFG5gXPlX/DDoIKjbqLCOjLf2HvQq7X
X-Gm-Gg: AYBFou0Rg+3nZ6s3763/eo5Q1l6inWwwT1XuNN9/oaNXQ/fBBbQxyOJ2clGiSdXCQNv
	NB5AkX5KrirDwRXCUlN2f3wMndXi/41dHXf5AkN3qzYmkZJ2ETe7JTfvQ0Mzde08a9H9Vf3WG0W
	g57DMnweFfIbz2MxeYAWC9kq4DIFcMwBasQKEFBXfW01EJjf4fIRuxaV4ucAXxE5WIbyTpEeP3Q
	pzsihSqp3It60KCsdOC88lztTfRWOCA6Gp5QSW+HAEdrGUdMA+WtIzBMnR6rbASBReR+OS02lYi
	5tBEEw1KvDwWIWvfpwcwW95mXVDoYeq6YlH0TzlLurS4xnZGwVPvIdEZ4uJuwAzIeUgrAoHg3cc
	6D/0WWTmFsHKxky8=
X-Received: by 2002:a05:620a:2b9c:b0:939:57ca:7e08 with SMTP id af79cd13be357-93a297789f0mr1063042285a.2.1789466676881;
        Tue, 15 Sep 2026 03:04:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:57ca:7e08 with SMTP id af79cd13be357-93a297789f0mr1063033885a.2.1789466676279;
        Tue, 15 Sep 2026 03:04:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6b6261sm70213915e9.14.2026.09.15.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:04:35 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:04:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
Message-ID: <mynbkpoab2rwz7b4wa57jvw4q4aaye4xc4uzedzd3hn23lmehe@6tpd4o4gz3vh>
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
 <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
X-Proofpoint-ORIG-GUID: Pi_kBF-RkiEJZxRhWLAofAg1tOoh3o81
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NSBTYWx0ZWRfX95VUWiTaywMV
 rVlxjjdCzPtsTTZuxu1staIVD5GSVdxD9L+c/z+Y4RbVRls7jB59YLfzjgFAIOKtAHdHU9zuy3q
 AKk5nNSE/vZ4C40oPGgeSd0CIwOwvoXlzg+iQ2flI475eGZAuXPWRecBgrteQEVNQEtRX9Zvxm1
 xirchoPWcyWErQ1kE06EsKb5bHapHFLNLtk4IhkSd1q08Evo1yH74TZ6heZPGdghkQDggWQkwzo
 3kbdt8/7az8S69Hp1O/CaK1P/H0c6IXfvxq8fTI+wx5k+pe4lg8rPwWDtZdzfNn/uUz9fIE/Vrd
 Cam6NcOrsiRMPGs3qz1291EiAXJyW7HL3Fh+fqpCfZMx/4iUwEJyxW3eqZTx8nwNbTDRSAgqx/f
 jqiZX++7g1NEcJr5SIxiE4/1VrzLNEgVyI9FUuErahuDrUPvllbn77nLx/G+GnAxTjmI3RY0QFH
 WRaQk9XQRCoIWG8yegw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NSBTYWx0ZWRfXyWTFmfrecFPQ
 4xau+aRHyLQ8GSfISZdo67jz/RzbFLAP4ulD04YDo86SChsuQbPNejZURK/95TaJyOBjDaul5Ge
 shwyrAQPg0uuTTXSenTpZl2g27cSskQ=
X-Proofpoint-GUID: Pi_kBF-RkiEJZxRhWLAofAg1tOoh3o81
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa9183a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150145

On 26-09-14 16:37:49, Griffin Kroah-Hartman wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a node for the haptics driver found on the phone.
> 
> Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
